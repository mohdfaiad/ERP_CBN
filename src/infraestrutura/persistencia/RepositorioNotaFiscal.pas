unit RepositorioNotaFiscal;

interface

uses
  DB,
  Auditoria,
  NotaFiscal,
  Repositorio, Dialogs, DateTimeutilitario;

type
  TRepositorioNotaFiscal = class(TRepositorio)

  protected
    function Get             (Dataset :TDataSet) :TObject; overload; override;
    function GetNomeDaTabela                     :String;            override;
    function GetIdentificador(Objeto :TObject)   :Variant;           override;
    function GetRepositorio                     :TRepositorio;       override;

  protected
    function SQLGet                      :String;            override;
    function SQLSalvar                   :String;            override;
    function CondicaoSQLGetAll           :String;            override;    
    function SQLGetAll                   :String;            override;
    function SQLRemover                  :String;            override;

  protected
    function IsInsercao(Objeto :TObject) :Boolean;           override;

  protected
    procedure SetParametros   (Objeto :TObject                        ); override;
    procedure SetIdentificador(Objeto :TObject; Identificador :Variant); override;

  protected
    procedure ExecutaDepoisDeSalvar (Objeto :TObject); override;

  //==============================================================================
  // Auditoria
  //==============================================================================
  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;

  private
    procedure salva_itens_produtos(notaFiscal :TNotaFiscal);
    procedure salva_itens_materias(notaFiscal :TNotaFiscal);
  private
    function pedidoSincronizado(codPedido :integer) :integer;
    procedure marcaComoFaturado(id_externo :integer; total :Real; data :TDate; numeroNF :integer; codigoPedidoFaturado :String);
    function getIdExterno(idErp, tabelaERP: String): String;
end;


implementation

uses
  TipoSerie,
  TipoFrete, ClienteHttpMeusPedidos,
  SysUtils, FabricaRepositorio, ItemNotaFiscal, PedidoFaturado,
  LocalEntregaNotaFiscal, VolumesNotaFiscal, ObservacaoNotaFiscal, Funcoes,
  TotaisNotaFiscal, LoteNFe, NFe, RepositorioItemAvulso, ItemAvulso, ItemNfMateria, Math,
  StrUtils, RelacaoTabelasImportacao, System.JSon;

const
  ST_OK_INCLUSAO  = 201;
  ST_OK_ALTERACAO = 200;
  ST_LIMITE_REQUISICOES = 429;
    
{ TRepositorioNotaFiscal }

function TRepositorioNotaFiscal.CondicaoSQLGetAll: String;
begin
  result := ' WHERE CAST(data_emissao as Date) between '+FIdentificador;
end;

procedure TRepositorioNotaFiscal.ExecutaDepoisDeSalvar(Objeto: TObject);
var NotaFiscal :TNotaFiscal;
begin
   NotaFiscal         := (Objeto as TNotaFiscal);

       if (NotaFiscal.Itens[0] is TItemNotaFiscal) then   salva_itens_produtos(NotaFiscal)
  else if (NotaFiscal.Itens[0] is TItemNfMateria)  then   salva_itens_materias(NotaFiscal);

end;

function TRepositorioNotaFiscal.Get(Dataset: TDataSet): TObject;
begin
   result := TNotaFiscal.CriarParaRepositorio(Dataset.FieldByName('codigo').AsInteger,
                                              Dataset.FieldByName('numero_nota_fiscal').AsInteger,
                                              Dataset.FieldByName('codigo_natureza').AsInteger,
                                              Dataset.FieldByName('serie').AsString,
                                              Dataset.FieldByName('codigo_emitente').AsInteger,
                                              Dataset.FieldByName('codigo_destinatario').AsInteger,
                                              Dataset.FieldByName('codigo_fpagto').AsInteger,
                                              Dataset.FieldByName('data_emissao').AsDateTime,
                                              Dataset.FieldByName('data_saida').AsDateTime,
                                              Dataset.FieldByName('codigo_transportadora').AsInteger,
                                              Dataset.FieldByName('tipo_frete').AsInteger,
                                              Dataset.FieldByName('entrada_saida').AsString,
                                              Dataset.FieldByName('finalidade').AsString,
                                              Dataset.FieldByName('nfe_referenciada').AsString);
end;

function TRepositorioNotaFiscal.GetIdentificador(Objeto: TObject): Variant;
begin
   result := TNotaFiscal(Objeto).CodigoNotaFiscal;
end;

function TRepositorioNotaFiscal.GetNomeDaTabela: String;
begin
   result := 'notas_fiscais';
end;

function TRepositorioNotaFiscal.GetRepositorio: TRepositorio;
begin
   result := TRepositorioNotaFiscal.Create;
end;

function TRepositorioNotaFiscal.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TNotaFiscal(Objeto).CodigoNotaFiscal <= 0);
end;

procedure TRepositorioNotaFiscal.marcaComoFaturado(id_externo: integer; total :Real; data :TDate; numeroNF :integer; codigoPedidoFaturado :String);
var
  Client :TClienteHttpMeusPedidos;
  json   :String;
  result :String;
  dataFat, valor :String;
  idExternoFaturamento :String;
  jsonRet  :TJSonObject;
begin
  try
  try
    dataFat := FormatDateTime('yyyy-mm-dd', data);
    valor   := StringReplace(FloatToStr(total),',','.',[rfReplaceAll,rfIgnoreCase]);

    json   := '{ "pedido_id": '+intToStr(id_externo)+','+
              '  "valor_faturado":  '+valor+', '+
              '  "data_faturamento": "'+dataFat+'", '+
              '  "numero_nf": "'+intToStr(numeroNF)+'"       }';

    Client := nil;
    Client := TClienteHttpMeusPedidos.Create(fdm.configuracoesIntegracao.application_token,
                                             fdm.configuracoesIntegracao.company_token,
                                             fdm.configuracoesIntegracao.url_base);

    idExternoFaturamento := getIdExterno(codigoPedidoFaturado, 'PEDIDOS_FATURADOS');

    try
      if idExternoFaturamento.IsEmpty then
        Client.Post('faturamento',json)
      else
        Client.Put('faturamento/'+idExternoFaturamento,json);
    Except
      on e :Exception do
      begin
        if pos('tempo_ate_permitir_novamente', e.Message) > 0 then
        begin
          jsonRet := TJSONObject.ParseJSONValue( e.Message ) as TJSONObject;
          raise Exception.Create('Número máximo de requisições atingida. Por favor aguarde '
                                 +TDateTimeutilitario.SegundosToTime(StrToIntDef(jsonRet.GetValue('tempo_ate_permitir_novamente').Value,0))+
                                 ' e tente novamente.');
        end;
      end;
    end;

    if not (Client.ClientHttp.ResponseCode in [ST_OK_INCLUSAO, ST_OK_ALTERACAO]) then
      raise Exception.Create('Erro ao marcar pedido '+IntToStr(id_externo)+' como faturado na plataforma Meus Pedidos.')
    else if Client.ClientHttp.ResponseCode = ST_OK_INCLUSAO then
      TRelacaoTabelasImportacao.criaRelacao('faturamento','PEDIDOS_FATURADOS', Client.IdResponse, codigoPedidoFaturado, DateToStr(Date));

  Except
    on e :Exception do
      raise Exception.Create(e.Message);
  end;
  finally
    if assigned(jsonret) then
      FreeAndNil(jsonRet);
    FreeAndNil(Client);
  end;
end;

function TRepositorioNotaFiscal.getIdExterno(idErp, tabelaERP: String): String;
begin
  result := Campo_por_campo('RELACAO_TAB_IMPORTACAO','ID_EXTERNO','TABELA_ERP',tabelaERP,'ID_ERP',idErp);
end;

function TRepositorioNotaFiscal.pedidoSincronizado(codPedido :integer): integer;
begin
  result := StrToIntDef( Campo_por_campo('RELACAO_TAB_IMPORTACAO','ID_EXTERNO','ID_ERP',intToStr(codPedido),'URL','pedidos') ,0);
end;

procedure TRepositorioNotaFiscal.salva_itens_materias(notaFiscal: TNotaFiscal);
var
  RepItens          :TRepositorio;
  nX                :Integer;
  RepNFe            :TRepositorio;
  RepTotais         :TRepositorio;
begin
  try
    { ITENS }
    RepItens := TFabricaRepositorio.GetRepositorio(TItemNfMateria.ClassName);

    for nX := 0 to (NotaFiscal.Itens.Count-1) do begin

      RepItens.Salvar(NotaFiscal.Itens[nX]);

    end;

    { TOTAIS }
    RepTotais := TFabricaRepositorio.GetRepositorio(TTotaisNotaFiscal.ClassName);
  //  NotaFiscal.Totais.CodigoNotaFiscal := strToInt(Maior_Valor_Cadastrado('NOTAS_FISCAIS','CODIGO'));
    RepTotais.Salvar(NotaFiscal.Totais);

  Except
    FreeAndNil(RepItens);
    FreeAndNil(RepNFe);
  end;
end;

procedure TRepositorioNotaFiscal.salva_itens_produtos(notaFiscal: TNotaFiscal);
var
  RepItens          :TRepositorio;
  RepPedFat         :TRepositorio;
  RepItensAvulsos   :TRepositorio;
  RepLocalEntrega   :TRepositorio;
  RepVolumes        :TRepositorio;
  RepObservacoes    :TRepositorio;
  RepTotais         :TRepositorio;
  RepLoteNFe        :TRepositorio;
  RepNFe            :TRepositorio;
  nX                :Integer;
  codigo_item       :Integer;
  id_externo :integer;
begin
   RepItens           := nil;
   RepPedFat          := nil;
   RepLocalEntrega    := nil;
   RepVolumes         := nil;
   RepObservacoes     := nil;
   RepTotais          := nil;
   RepLoteNFe         := nil;
   RepNFe             := nil;

   try
     { Itens }
     RepItens := TFabricaRepositorio.GetRepositorio(TItemNotaFiscal.ClassName);

     for nX := 0 to (NotaFiscal.Itens.Count-1) do begin
        if Assigned(self.FAtualizarTela) then
          self.FAtualizarTela;
        TItemNotaFiscal(NotaFiscal.Itens[nX]).CarregarImpostos;
     end;

   {  for nX := 0 to (NotaFiscal.Itens.Count-1) do begin
        if Assigned(self.FAtualizarTela) then
          self.FAtualizarTela;

        RepItens.Remover(NotaFiscal.Itens[nX]);
        break; {usa apenas o primeiro item pois remove todos pelo codigo da nota fiscal}
  //   end;

     for nX := 0 to (NotaFiscal.Itens.Count-1) do begin
        if Assigned(self.FAtualizarTela) then
          self.FAtualizarTela;

        codigo_item := StrToIntDef( Campo_por_campo('ITENS_NOTAS_FISCAIS','CODIGO','CODIGO_NOTA_FISCAL', IntToStr(notaFiscal.CodigoNotaFiscal),
                                                                              'CODIGO_PRODUTO',IntToStr(TItemNotaFiscal(NotaFiscal.Itens[nX]).Produto.Codigo)), 0);
        TItemNotaFiscal(NotaFiscal.Itens[nX]).Codigo := codigo_item;
        RepItens.Salvar(NotaFiscal.Itens[nX]);
     end;

     { Local de Entrega }
     try
       if Assigned(self.FAtualizarTela) then
          self.FAtualizarTela;

       RepLocalEntrega := TFabricaRepositorio.GetRepositorio(TLocalEntregaNotaFiscal.ClassName);
       RepLocalEntrega.Remover(NotaFiscal.LocalEntrega);
       NotaFiscal.LocalEntrega.ValidarCamposObrigatorios;

       if Assigned(self.FAtualizarTela) then
          self.FAtualizarTela;

       //Se não validar os campos obrigatórios não tem porque salvar no banco de dados
       RepLocalEntrega.Salvar(NotaFiscal.LocalEntrega);
     except
     end;

     { Volumes }
     if Assigned(self.FAtualizarTela) then
       self.FAtualizarTela;

     RepVolumes := TFabricaRepositorio.GetRepositorio(TVolumesNotaFiscal.ClassName);
     RepVolumes.Remover(NotaFiscal.Volumes);
     RepVolumes.Salvar(NotaFiscal.Volumes);

     { Observações }
     if Assigned(self.FAtualizarTela) then
       self.FAtualizarTela;

     RepObservacoes := TFabricaRepositorio.GetRepositorio(TObservacaoNotaFiscal.ClassName);
     RepObservacoes.Remover(NotaFiscal.Observacoes);
     RepObservacoes.Salvar(NotaFiscal.Observacoes);

     { Totais }
     if Assigned(self.FAtualizarTela) then
       self.FAtualizarTela;

     RepTotais := TFabricaRepositorio.GetRepositorio(TTotaisNotaFiscal.ClassName);
     RepTotais.Remover(NotaFiscal.Totais);
     RepTotais.Salvar(NotaFiscal.Totais);

     { Pedidos Faturados }
     RepPedFat := TFabricaRepositorio.GetRepositorio(TPedidoFaturado.ClassName);

//     for nX := 0 to (NotaFiscal.PedidosFaturados.Count-1) do begin
//      if Assigned(self.FAtualizarTela) then
//        self.FAtualizarTela;
//
//      RepPedFat.Remover(NotaFiscal.PedidosFaturados[nX]);
//     end;

     if Assigned(NotaFiscal.PedidosFaturados) and Assigned(self.FAtualizarTela) then
      self.FAtualizarTela;

     RepPedFat.RemoverPorIdentificador(NotaFiscal.CodigoNotaFiscal);   

     if Assigned(NotaFiscal.PedidosFaturados) then begin
       for nX := 0 to (NotaFiscal.PedidosFaturados.Count-1) do begin
         if Assigned(self.FAtualizarTela) then
           self.FAtualizarTela;
           
         RepPedFat.Salvar(NotaFiscal.PedidosFaturados[nX]);

         id_externo := pedidoSincronizado(TPedidoFaturado(NotaFiscal.PedidosFaturados[nX]).CodigoPedido);
         if (id_externo > 0) then
           marcaComoFaturado(id_externo, TPedidoFaturado(NotaFiscal.PedidosFaturados[nX]).Pedido.valor_total,
                                         NotaFiscal.DataEmissao,
                                         NotaFiscal.NumeroNotaFiscal,
                                         TPedidoFaturado(NotaFiscal.PedidosFaturados[nX]).Codigo.ToString);
       end;
     end;

     { Itens Avulsos }
     RepItensAvulsos := TFabricaRepositorio.GetRepositorio(TItemAvulso.ClassName);

     if Assigned(NotaFiscal.ItensAvulsos) and Assigned(self.FAtualizarTela) then
      self.FAtualizarTela;

     RepItensAvulsos.RemoverPorIdentificador(NotaFiscal.CodigoNotaFiscal);

     if Assigned(NotaFiscal.ItensAvulsos) then begin
       for nX := 0 to (NotaFiscal.ItensAvulsos.Count-1) do begin
        if Assigned(self.FAtualizarTela) then
          self.FAtualizarTela;

        RepItensAvulsos.Salvar(NotaFiscal.ItensAvulsos[nX]);
       end;
     end;

     { LoteNFe }
     if Assigned(NotaFiscal.Lote) then begin
       if Assigned(self.FAtualizarTela) then
          self.FAtualizarTela;

       RepLoteNFe := TFabricaRepositorio.GetRepositorio(TLoteNFe.ClassName);
       RepLoteNFe.Salvar(NotaFiscal.Lote);
     end;

     { NFe }
     if Assigned(NotaFiscal.NFe) then begin
       if Assigned(self.FAtualizarTela) then
          self.FAtualizarTela;

       RepNFe := TFabricaRepositorio.GetRepositorio(TNFe.ClassName);
       RepNFe.Remover(NotaFiscal.NFe);
       RepNFe.Salvar(NotaFiscal.NFe);
     end;

   finally
     FreeAndNil(RepPedFat);
     FreeAndNil(RepItens);
     FreeAndNil(RepLocalEntrega);
     FreeAndNil(RepVolumes);
     FreeAndNil(RepObservacoes);
     FreeAndNil(RepTotais);
     FreeAndNil(RepLoteNFe);
     FreeAndNil(RepNFe);
   end;
end;

procedure TRepositorioNotaFiscal.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  NFAntiga, NFNova :TNotaFiscal;
begin
   NFAntiga := (AntigoObjeto as TNotaFiscal);
   NFNova   := (Objeto       as TNotaFiscal);

   if (NFAntiga.NumeroNotaFiscal <> NFNova.NumeroNotaFiscal) then
    Auditoria.AdicionaCampoAlterado('numero_nota_fiscal', IntToStr(NFAntiga.NumeroNotaFiscal), IntToStr(NFNova.NumeroNotaFiscal));

   if (NFAntiga.Natureza.Codigo <> NFNova.Natureza.Codigo) then
    Auditoria.AdicionaCampoAlterado('codigo_natureza', IntToStr(NFAntiga.Natureza.Codigo), IntToStr(NFNova.Natureza.Codigo));

   if (NFAntiga.Serie <> NFNova.Serie) then
    Auditoria.AdicionaCampoAlterado('serie', NFAntiga.Serie, NFNova.Serie);

   if (NFAntiga.Emitente.Codigo <> NFNova.Emitente.Codigo) then
    Auditoria.AdicionaCampoAlterado('codigo_emitente', IntToStr(NFAntiga.Emitente.Codigo), IntToStr(NFNova.Emitente.Codigo));

   if (NFAntiga.Destinatario.Codigo <> NFNova.Destinatario.Codigo) then
    Auditoria.AdicionaCampoAlterado('codigo_destinatario', IntToStr(NFAntiga.Destinatario.Codigo), IntToStr(NFNova.Destinatario.Codigo));

   if (NFAntiga.FormaPagamento.Codigo <> NFNova.FormaPagamento.Codigo) then
    Auditoria.AdicionaCampoAlterado('codigo_fpagto', IntToStr(NFAntiga.FormaPagamento.Codigo), IntToStr(NFNova.FormaPagamento.Codigo));

   if (NFAntiga.DataEmissao <> NFNova.DataEmissao) then
    Auditoria.AdicionaCampoAlterado('data_emissao', FormatDateTime('dd/mm/yyyy', NFAntiga.DataEmissao), FormatDateTime('dd/mm/yyyy', NFNova.DataEmissao));

   if (NFAntiga.DataSaida <> NFNova.DataSaida) then
    Auditoria.AdicionaCampoAlterado('data_saida', FormatDateTime('dd/mm/yyyy', NFAntiga.DataSaida), FormatDateTime('dd/mm/yyyy', NFNova.DataSaida));

   if (NFAntiga.Transportadora.Codigo <> NFNova.Transportadora.Codigo) then
    Auditoria.AdicionaCampoAlterado('codigo_transportadora', IntToStr(NFAntiga.Transportadora.Codigo), IntToStr(NFNova.Transportadora.Codigo));

   if (NFAntiga.TipoFrete <> NFNova.TipoFrete) then
    Auditoria.AdicionaCampoAlterado('tipo_frete', IntToStr(TTipoFreteUtilitario.DeEnumeradoParaInteiro(NFAntiga.TipoFrete)), IntToStr(TTipoFreteUtilitario.DeEnumeradoParaInteiro(NFNova.TipoFrete)));

   if (NFAntiga.Entrada_saida <> NFNova.Entrada_saida) then
    Auditoria.AdicionaCampoAlterado('entrada_saida', NFAntiga.Entrada_saida, NFNova.Entrada_saida );

   if (NFAntiga.Finalidade <> NFNova.Finalidade) then
    Auditoria.AdicionaCampoAlterado('finalidade', NFAntiga.Finalidade, NFNova.Finalidade );

   if (NFAntiga.NFe_referenciada <> NFNova.NFe_referenciada) then
    Auditoria.AdicionaCampoAlterado('NFe_referenciada', NFAntiga.NFe_referenciada, NFNova.NFe_referenciada );
end;

procedure TRepositorioNotaFiscal.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Obj :TNotaFiscal;
begin
   Obj := (Objeto as TNotaFiscal);

   Auditoria.AdicionaCampoExcluido('codigo',                FloatToStr(Obj.CodigoNotaFiscal));
   Auditoria.AdicionaCampoExcluido('numero_nota_fiscal',    IntToStr(Obj.NumeroNotaFiscal));
   Auditoria.AdicionaCampoExcluido('codigo_natureza',       IntToStr(Obj.Natureza.Codigo));
   Auditoria.AdicionaCampoExcluido('serie',                 Obj.Serie);
   Auditoria.AdicionaCampoExcluido('codigo_emitente',       IntToStr(Obj.Emitente.Codigo));
   Auditoria.AdicionaCampoExcluido('codigo_destinatario',   IntToStr(Obj.Destinatario.Codigo));

   if Obj.Entrada_saida <> 'E' then
     Auditoria.AdicionaCampoExcluido('codigo_fpagto',         IntToStr(Obj.FormaPagamento.Codigo));
     
   Auditoria.AdicionaCampoExcluido('data_emissao',          FormatDateTime('dd/mm/yyyy', Obj.DataEmissao));
   Auditoria.AdicionaCampoExcluido('data_saida',            FormatDateTime('dd/mm/yyyy', Obj.DataSaida));
   Auditoria.AdicionaCampoExcluido('codigo_transportadora', IntToStr(Obj.Transportadora.Codigo));
   Auditoria.AdicionaCampoExcluido('tipo_frete',            IntToStr(TTipoFreteUtilitario.DeEnumeradoParaInteiro(Obj.TipoFrete)));
   Auditoria.AdicionaCampoExcluido('entrada_saida',         Obj.Entrada_saida);
   Auditoria.AdicionaCampoExcluido('finalidade',            Obj.Finalidade);
   Auditoria.AdicionaCampoExcluido('nfe_referenciada',      Obj.NFe_referenciada);
end;

procedure TRepositorioNotaFiscal.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Obj :TNotaFiscal;
begin
   Obj := (Objeto as TNotaFiscal);

   Auditoria.AdicionaCampoIncluido('codigo',                IntToStr(Obj.CodigoNotaFiscal));
   Auditoria.AdicionaCampoIncluido('numero_nota_fiscal',    IntToStr(Obj.NumeroNotaFiscal));
   Auditoria.AdicionaCampoIncluido('codigo_natureza',       IntToStr(Obj.Natureza.Codigo));
   Auditoria.AdicionaCampoIncluido('serie',                 Obj.Serie);
   Auditoria.AdicionaCampoIncluido('codigo_emitente',       IntToStr(Obj.Emitente.Codigo));
   Auditoria.AdicionaCampoIncluido('codigo_destinatario',   IntToStr(Obj.Destinatario.Codigo));

   if Obj.Entrada_saida <> 'E' then
     Auditoria.AdicionaCampoIncluido('codigo_fpagto',         IntToStr(Obj.FormaPagamento.Codigo));

   Auditoria.AdicionaCampoIncluido('data_emissao',          FormatDateTime('dd/mm/yyyy', Obj.DataEmissao));
   Auditoria.AdicionaCampoIncluido('data_saida',            FormatDateTime('dd/mm/yyyy', Obj.DataSaida));
   Auditoria.AdicionaCampoIncluido('codigo_transportadora', IntToStr(Obj.Transportadora.Codigo));
   Auditoria.AdicionaCampoIncluido('tipo_frete',            IntToStr(TTipoFreteUtilitario.DeEnumeradoParaInteiro(Obj.TipoFrete)));
   Auditoria.AdicionaCampoIncluido('entrada_saida',         Obj.Entrada_saida );
   Auditoria.AdicionaCampoIncluido('finalidade',            Obj.Finalidade);
   Auditoria.AdicionaCampoIncluido('nfe_referenciada',      Obj.NFe_referenciada);
end;

procedure TRepositorioNotaFiscal.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
   TNotaFiscal(Objeto).CodigoNotaFiscal := Integer(Identificador);
end;

procedure TRepositorioNotaFiscal.SetParametros(Objeto: TObject);
var
  obj :TNotaFiscal;
begin
  obj := (Objeto as TNotaFiscal);

  if (obj.CodigoNotaFiscal > 0) then inherited SetParametro('codigo', obj.CodigoNotaFiscal)
  else                               inherited LimpaParametro('codigo');

  inherited SetParametro('numero_nota_fiscal',     Obj.NumeroNotaFiscal);
  inherited SetParametro('codigo_natureza',        obj.Natureza.Codigo);
  inherited SetParametro('serie',                  Obj.Serie);
  inherited SetParametro('codigo_emitente',        obj.Emitente.Codigo);
  inherited SetParametro('codigo_destinatario',    obj.Destinatario.Codigo);

  if assigned( obj.FormaPagamento ) then
    inherited SetParametro('codigo_fpagto',        obj.FormaPagamento.Codigo)
  else
    inherited SetParametro('codigo_fpagto',        1); //uma qualquer apenas para passar (impor. xml entrada)

  inherited SetParametro('data_emissao',           obj.DataEmissao);
  inherited SetParametro('data_saida',             obj.DataSaida);
  inherited SetParametro('codigo_transportadora',  obj.Transportadora.Codigo);
  inherited SetParametro('tipo_frete',             TTipoFreteUtilitario.DeEnumeradoParaInteiro(obj.TipoFrete));
  inherited SetParametro('entrada_saida',          obj.Entrada_saida );
  inherited SetParametro('finalidade',             obj.Finalidade );
  inherited SetParametro('nfe_referenciada',       obj.NFe_referenciada );
end;

function TRepositorioNotaFiscal.SQLGet: String;
begin
   result := ' select * from ' + self.GetNomeDaTabela + ' where codigo = :codigo ';
end;

function TRepositorioNotaFiscal.SQLGetAll: String;

begin
   result := ' select * from ' + self.GetNomeDaTabela + IfThen(FIdentificador = '','', CondicaoSQLGetAll) +' order by codigo';
end;

function TRepositorioNotaFiscal.SQLRemover: String;
begin
   result := 'delete from ' + self.GetNomeDaTabela + ' where codigo = :codigo ';
   showmessage('* * * * * * * * * * * * * * ATENÇÃO ! ! ! * * * * * * * * * * * * *'+#13#10+' PRESTES A REMOVER NOTA FISCAL');
end;

function TRepositorioNotaFiscal.SQLSalvar: String;
begin
   result := ' update or insert into ' + self.GetNomeDaTabela +
             '        (codigo, numero_nota_fiscal, codigo_natureza, serie, codigo_emitente, codigo_destinatario, codigo_fpagto, data_emissao,         '+
             '         data_saida, codigo_transportadora, tipo_frete, entrada_saida, finalidade, nfe_referenciada)                                    '+
             ' values (:codigo, :numero_nota_fiscal, :codigo_natureza, :serie, :codigo_emitente, :codigo_destinatario, :codigo_fpagto, :data_emissao, '+
             '         :data_saida, :codigo_transportadora, :tipo_frete, :entrada_saida, :finalidade, :nfe_referenciada)                              ';
end;

end.
