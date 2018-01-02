unit importadorNotaXML;

interface

uses Repositorio, FabricaRepositorio, ACBrNFe, ACBrNFeNotasFiscais, uPadrao, uModulo, ItemNotaFiscal, pcnNFe,
     SysUtils, Controls, NaturezaOperacao, TipoSerie, Pessoa, NotaFiscal, pcnConversao, Empresa,
     TipoRegimeTributario, Dialogs, TotaisNotaFiscal, Classes, DBClient;

type TImportadorNotaXML = class
  private
    FAcbrNfe: TACBrNFe;
    FNotaFiscal   :TNotaFiscal;
    FCaminhoArquivo :String;
    FCodigo_fornecedor :Integer;
    FNaturezaOperacao :TNaturezaOperacao;
    FTipoSerie        :TTipoSerie;
    CST :String;
    FCDS :TCLientDataSet;

    function GetAcbrNfe: TACBrNFe;
    function fornecedorCadastrado: Boolean;
    procedure SetAcbrNfe(const Value: TACBrNFe);

  private
    function  GravarProdutos(NFe: ACBrNFeNotasFiscais.NotaFiscal) :Boolean;
    procedure atualizaMateria(codigo_materia :integer; produtoNfe :TProd);
    procedure salvaAssociacaoProduto(codigo_materia :integer; codigo_produto_fornecedor :String);
    procedure salvaAssociacaoCFOP(codigo_cfop, codigo_cfop_correspondente :Integer);
    function  associar_produto(produtoNfe :TProd)    :Boolean;
    function  cadastrar_produto(produtoNfe :TProd)   :Boolean;
    function  associar_cfop(codigo_natureza :integer) :Boolean;
    function  cadastrar_cfop(codigo_natureza :integer) :Boolean;
    procedure GravarNotaFiscal(NFe: ACBrNFeNotasFiscais.NotaFiscal);
    procedure GravaItensNotaFiscal(Nfe: ACBrNfeNotasFiscais.NotaFiscal);

    function  MateriaCadastrada(produtoNfe :TProd) :Integer;
    function  cadastra_ou_associa_produto(produtoNfe :TProd) :Boolean;
    function  cadastra_ou_associa_cfop(codigo_natureza :integer; CFOP :String) :Boolean;
    function  retorna_escolha(pergunta :String) :Integer;
    function  Nota_ja_importada(numero_nota :String) :Boolean;
  public
    procedure XMLparaNFe;
    property AcbrNfe : TACBrNFe read GetAcbrNfe write SetAcbrNfe;

    constructor Create(cCaminhoArquivo :String; CST :String; codigo_fornecedor :integer; cdsMaterias :TClientDataSet);

end;

implementation

uses Materia, MateriaFornecedor, ItemNfMateria, Math, uConfirmacaoUsuario, uCadastroMateria, Funcoes,
     uCadastroCfopCorrespondente, CFOPCorrespondente, uCadastroNaturezaOperacao,
     StrUtils, Produto, TipoOrigemMercadoria, Nfe, DB;

{ TImportadorNotaXML }

constructor TImportadorNotaXML.Create(cCaminhoArquivo: String; CST :String; codigo_fornecedor :integer; cdsMaterias :TClientDataSet);
begin
  self.FCDS       := TClientDataSet.Create(nil);
  FAcbrNfe        := TACBrNFe.Create(nil);
  
  FCaminhoArquivo := cCaminhoArquivo;
  self.CST        := CST;
  self.FCodigo_fornecedor := codigo_fornecedor;
  self.FCDS.CloneCursor(cdsMaterias, false);
end;

function TImportadorNotaXML.GetAcbrNfe: TACBrNFe;
begin
  result := self.FAcbrNfe;
end;

procedure TImportadorNotaXML.XMLparaNFe;
begin
  try
    self.AcbrNfe.NotasFiscais.LoadFromFile(self.FCaminhoArquivo);
   // dm.conexao.AutoCommit := false;

    if GravarProdutos(FAcbrNfe.NotasFiscais.Items[0]) then
      GravarNotaFiscal(FAcbrNfe.NotasFiscais.Items[0]);

  //  dm.conexao.Commit;
  Except
    on e : Exception do
      begin
        if dm.conexao.InTransaction  then  dm.conexao.Rollback;
        if not dm.conexao.TxOptions.AutoCommit then  dm.conexao.TxOptions.AutoCommit := true;
        raise Exception.Create(e.Message);
      end;
  end;
end;

procedure TImportadorNotaXML.SetAcbrNfe(const Value: TACBrNFe);
begin
  self.FAcbrNfe := Value;
end;

function TImportadorNotaXML.fornecedorCadastrado: Boolean;
begin
  FCodigo_fornecedor := 0;
  
  dm.qryGenerica.Close;
  dm.qryGenerica.SQL.Text := 'SELECT CODIGO FROM PESSOAS WHERE CPF_CNPJ = :CPF_CNPJ AND TIPO = ''F'' ';
  dm.qryGenerica.ParamByName('CPF_CNPJ').AsString := FAcbrNfe.NotasFiscais.Items[0].NFe.Emit.CNPJCPF;
  dm.qryGenerica.Open;

  if not dm.qryGenerica.IsEmpty then FCodigo_fornecedor := dm.qryGenerica.fieldByName('CODIGO').AsInteger;

  result := not (dm.qryGenerica.IsEmpty);
end;

function TImportadorNotaXML.GravarProdutos(NFe: ACBrNFeNotasFiscais.NotaFiscal): Boolean;
var nX, codigo_materia :integer;
begin
  Result := false;
  try

    { Verifica se itens da nota ja estão associados ao devido representante, e consequentemente se já estao cadastrados}
    for nX := 0 to nfe.NFe.Det.Count - 1 do
      codigo_materia := MateriaCadastrada(nfe.NFe.Det.Items[nX].Prod);

    { Atualiza o estoque dos respectivos itens de entrada }
    for nX := 0 to nfe.NFe.Det.Count - 1 do begin

      codigo_materia := MateriaCadastrada(nfe.NFe.Det.Items[nX].Prod);

      atualizaMateria( codigo_materia, nfe.NFe.Det.Items[nX].Prod )// atualiza o estoque da matéria

    end;

    Result := true;

  except
    on e : Exception do
      begin
        Result := false;
        raise Exception.Create(e.Message);
      end;
  end;
end;

function TImportadorNotaXML.MateriaCadastrada(produtoNfe: TProd): Integer;
begin

  dm.qryGenerica.Close;
  dm.qryGenerica.SQL.Text := 'SELECT CODIGO_MATERIA FROM MATERIA_FORNECEDOR                      '+
                             ' WHERE CODIGO_FORNECEDOR = :CF AND CODIGO_MATERIA_FORNECEDOR = :CMF';

  dm.qryGenerica.ParamByName('CF').AsInteger  := FCodigo_fornecedor;
  dm.qryGenerica.ParamByName('CMF').AsString  := produtoNfe.cProd;
  dm.qryGenerica.Open;

  Result := IfThen( dm.qryGenerica.IsEmpty, 0, dm.qryGenerica.fieldByName('codigo_materia').AsInteger);
end;

procedure TImportadorNotaXML.atualizaMateria(codigo_materia: integer; produtoNfe: TProd);
var  Materia     :TMateria;
     repositorio :TRepositorio;
begin
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TMateria.ClassName);
    Materia     := TMateria(repositorio.Get(codigo_materia));

    Materia.estoque_fisico := Materia.estoque_fisico + produtoNfe.qCom;

    repositorio.Salvar(Materia);
  Finally
    FreeAndNil(Materia);
    FreeAndNil(repositorio);
  end;
end;

function TImportadorNotaXML.cadastra_ou_associa_produto(produtoNfe: TProd): Boolean;
var retorno :integer; //1-Associar 2-Cancelar 3-Cadastrar
begin
  try
    Result  := true;

    retorno := retorna_escolha('Matéria '+produtoNfe.cProd+' - '+produtoNfe.xProd+' não cadastrada.'+#13#10+
                               'Deseja Cadastra-la, associar a matéria ja cadastrada ou cancelar entrada?');

    if      retorno = 1 then begin
      Result :=  associar_produto(produtoNfe);
    end
    else if retorno = 3 then begin
      Result :=  cadastrar_produto(produtoNfe);
    end
    else Result := false;

    if Result then
      dm.conexao.Commit;

  except
    Result := false;
  end;
end;

function TImportadorNotaXML.associar_produto(produtoNfe: TProd) :Boolean;
begin
  try
    result := true;
    frmCadastroMateria := TfrmCadastroMateria.CreateModoBusca(nil);
    frmCadastroMateria.ShowModal;

    if (frmCadastroMateria.ModalResult = mrOK) then
      salvaAssociacaoProduto(frmCadastroMateria.cdsCODIGO.AsInteger, produtoNfe.cProd)
    else
      result := false;

  except
    result := false;
  end;

end;

function TImportadorNotaXML.cadastrar_produto(produtoNfe: TProd) :Boolean;
begin
  frmCadastroMateria := TFrmCadastroMateria.Create(nil);
  frmCadastroMateria.produtoNfe := produtoNfe;
  frmCadastroMateria.ShowModal;

  if frmCadastroMateria.ModalResult = MrOk then begin
    Result := true;
    salvaAssociacaoProduto( strToInt( Maior_Valor_Cadastrado('MATERIAS','CODIGO')) ,produtoNfe.cProd);
  end
  else
    result := false;

  frmCadastroMateria.Release;
end;

procedure TImportadorNotaXML.salvaAssociacaoProduto(codigo_materia: integer; codigo_produto_fornecedor :String);
var
    MateriaFornecedor  :TMateriaFornecedor;
    repositorio        :TRepositorio;
begin
  try
  try
    repositorio       := TFabricaRepositorio.GetRepositorio(TMateriaFornecedor.ClassName);
    MateriaFornecedor := TMateriaFornecedor.Create;


    MateriaFornecedor.codigo_materia            := codigo_materia;
    MateriaFornecedor.codigo_fornecedor         := FCodigo_fornecedor;
    MateriaFornecedor.codigo_materia_fornecedor := codigo_produto_fornecedor;

    repositorio.Salvar(MateriaFornecedor);

  Except
    raise Exception.Create('Erro ao salvar associação');
  end;
  Finally
    FreeAndNil(MateriaFornecedor);
    FreeAndNil(repositorio);
  end;
end;

procedure TImportadorNotaXML.GravarNotaFiscal(NFe: ACBrNFeNotasFiscais.NotaFiscal);
var  RepNotaFiscal, repositorioNFe, rep :TRepositorio;
     natureza_operacao :TNaturezaOperacao;
     emitente, destinatario, transportadora :TPessoa;
     nSerie, cnpj_transportadora :String;
     NFxml :TNfe;
     codigo_natureza :integer;
     nCodigoNotaFiscal, nNumeroNotaFiscal, nCodigoNatureza, nCodigoEmitente :integer;
     nTipoFrete, nCodigoDestinatario, nCodigoFormaPagamento, nCodigoTransportadora :integer;
     nDataEmissao, nDataSaida :TDateTime;
begin
  try
  try
    RepNotaFiscal := nil;

    RepNotaFiscal := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);

////  codigo_natureza       := StrToIntDef( buscaCFOPCorrespondente(nfe.NFe.Det.Items[0].Prod.CFOP), 0);

    nCodigoNotaFiscal     := 0;
    nNumeroNotaFiscal     := nfe.NFe.Ide.nNF;
    nCodigoNatureza       := 1;
    nSerie                := zeroEsquerda(IntToStr(nfe.NFe.Ide.serie),3);
    nCodigoEmitente       := StrToIntDef(campo_por_campo('PESSOAS','CODIGO','CPF_CNPJ',nfe.NFe.Emit.CNPJCPF,'TIPO','F'), 0); //F fornecedor
    nCodigoDestinatario   := StrToIntDef(campo_por_campo('PESSOAS','CODIGO','CPF_CNPJ',nfe.NFe.Dest.CNPJCPF,'TIPO','E'), 0); //E empresa
    nCodigoFormaPagamento := 0;
    nDataEmissao          := NFe.NFe.Ide.dEmi;
    nDataSaida            := IfThen(NFe.NFe.Ide.dSaiEnt > 0, NFe.NFe.Ide.dSaiEnt, NFe.NFe.Ide.dEmi);

    if nfe.NFe.Transp.Transporta.CNPJCPF = '' then
      cnpj_transportadora := '0'
    else
      cnpj_transportadora := nfe.NFe.Transp.Transporta.CNPJCPF;

    nCodigoTransportadora := StrToIntDef(campo_por_campo('PESSOAS','CODIGO','CPF_CNPJ', cnpj_transportadora ), 1);
    nTipoFrete            := ifThen( nfe.NFe.Transp.modFrete = mfContaEmitente,0,1);

    rep := TFabricaRepositorio.GetRepositorio(TNaturezaOperacao.ClassName);
    natureza_operacao := TNaturezaOperacao(rep.Get(nCodigoNatureza));

    rep := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
    emitente := TPessoa(rep.Get(nCodigoEmitente));

    destinatario := TPessoa(rep.Get(nCodigoDestinatario));

    transportadora := TPessoa(rep.Get(nCodigoTransportadora));

    FNotaFiscal := TNotaFiscal.Create(natureza_operacao, nSerie, emitente, destinatario, true);

    FNotaFiscal.CodigoNotaFiscal := nCodigoNotaFiscal;
    FNotaFiscal.NumeroNotaFiscal := nNumeroNotaFiscal;
    FNotaFiscal.DataEmissao      := nDataEmissao;
    FNotaFiscal.DataSaida        := nDataSaida;
    FNotaFiscal.transportadora   := transportadora;
    FNotaFiscal.Entrada_saida    := 'E';

    FNotaFiscal.Totais.Frete           := nfe.NFe.Total.ICMSTot.vFrete;
    FNotaFiscal.Totais.Seguro          := nfe.NFe.Total.ICMSTot.vSeg;
    FNotaFiscal.Totais.Descontos       := nfe.NFe.Total.ICMSTot.vDesc;
    FNotaFiscal.Totais.OutrasDespesas  := nfe.NFe.Total.ICMSTot.vOutro;
    

    FNotaFiscal.Totais.BaseCalculoICMS := Nfe.NFe.Total.ICMSTot.vBC;
    FNotaFiscal.Totais.ICMS            := Nfe.NFe.Total.ICMSTot.vICMS;
    FNotaFiscal.Totais.BaseCalculoST   := Nfe.NFe.Total.ICMSTot.vBCST;
    FNotaFiscal.Totais.ICMSST          := Nfe.NFe.Total.ICMSTot.vST;
    FNotaFiscal.Totais.TotalProdutos   := Nfe.NFe.Total.ICMSTot.vProd;
    FNotaFiscal.Totais.Frete           := Nfe.NFe.Total.ICMSTot.vFrete;
    FNotaFiscal.Totais.Seguro          := Nfe.NFe.Total.ICMSTot.vSeg;
    FNotaFiscal.Totais.Descontos       := Nfe.NFe.Total.ICMSTot.vDesc;
    FNotaFiscal.Totais.IPI             := Nfe.NFe.Total.ICMSTot.vIPI;
    FNotaFiscal.Totais.OutrasDespesas  := Nfe.NFe.Total.ICMSTot.vOutro;
    FNotaFiscal.Totais.TotalNF         := Nfe.NFe.Total.ICMSTot.vNF;
    FNotaFiscal.Totais.PIS             := Nfe.NFe.Total.ICMSTot.vPIS;
    FNotaFiscal.Totais.COFINS          := Nfe.NFe.Total.ICMSTot.vCOFINS;

    FNotaFiscal.Observacoes.DadosAdicionais := Nfe.NFe.InfAdic.infCpl;
    
  Except
    on e : Exception do
      begin
        Raise Exception.Create('Falha ao alimentar dados da nota: '+e.Message);
      end;

  end;

    GravaItensNotaFiscal(NFe);

    RepNotaFiscal.Salvar(FNotaFiscal);


    { Salva o XML da nota }
    repositorioNFe := TFabricaRepositorio.GetRepositorio(TNFe.ClassName);

    NFxml := TNFe.Create( StrToInt( Maior_Valor_Cadastrado('NOTAS_FISCAIS','CODIGO') ), Nfe.NFe.infNFe.ID);
    NFxml.XML.LoadFromStream( TStringStream.Create(Nfe.XML) );

    repositorioNFe.Salvar(NFxml);

  finally
    FreeAndNil(RepNotaFiscal);
    FreeAndNil(repositorioNFe);
    FreeAndNil(rep);
  end;

end;


procedure TImportadorNotaXML.GravaItensNotaFiscal(Nfe: ACBrNfeNotasFiscais.NotaFiscal);
var nX                :Integer;
    Item              :TItemNfMateria;
    codigo_natureza , cod_nat_cfop_correspondente :String;
    origem_mercadoria :TTipoOrigemMercadoria;
    empresa :TEmpresa;
    natureza_operacao :TNaturezaOperacao;
    rep, repNat :TRepositorio;
label inicio;

begin
  try
    //FNotaFiscal.Natureza.CFOP :=  Nfe.NFe.Det.Items[nX].Prod.CFOP;

    for nX := 0 to NFe.NFe.Det.Count - 1 do begin

      inicio:

      Item    := nil;
      rep     := nil;
      repNat  := nil;
      empresa := nil;

     // codigo_natureza := campo_por_campo('NATUREZAS_OPERACAO','CODIGO','CFOP',nfe.NFe.Det.Items[nX].Prod.CFOP);

        cod_nat_cfop_correspondente :=  Codigo_natureza_por_CFOP(FCDS.fieldByName('CFOP').AsString); //buscaCFOPCorrespondente( nfe.NFe.Det.Items[nX].Prod.CFOP );

        repNat            := TFabricaRepositorio.GetRepositorio(TNaturezaOperacao.ClassName);
        natureza_operacao := TNaturezaOperacao( repNat.Get(strToInt( cod_nat_cfop_correspondente )));

        Item := TItemNfMateria.Create;

        Item.codigo_nota_fiscal   := FNotaFiscal.CodigoNotaFiscal;
        Item.codigo_materia       := MateriaCadastrada( nfe.NFe.Det.Items[nX].Prod );
        Item.quantidade           := Nfe.NFe.Det.Items[nX].Prod.qCom;
        Item.unidade              := copy(Nfe.NFe.Det.Items[nX].Prod.uCom,1,3);
        Item.classificacao_fiscal := Nfe.NFe.Det.Items[nX].Prod.NCM;

        case Nfe.NFe.Det.Items[nX].Imposto.ICMS.orig of
          oeNacional:                    Item.origem := TTipoOrigemMercadoriaUtilitario.DeEnumeradoParaInteger( tomNacional );
          oeEstrangeiraImportacaoDireta: Item.origem := TTipoOrigemMercadoriaUtilitario.DeEnumeradoParaInteger( tomEstrangeiraImportacaoDireta );
          oeEstrangeiraAdquiridaBrasil:  Item.origem := TTipoOrigemMercadoriaUtilitario.DeEnumeradoParaInteger( tomEstrangeiraAdquiridaMercadoInterno );
        end;

        Item.valor_unitario             := RoundTo(Nfe.NFe.Det.Items[nX].Prod.vUnCom,-2);
        Item.valor_bruto                := Nfe.NFe.Det.Items[nX].Prod.vProd;
        Item.valor_frete                := Nfe.NFe.Det.Items[nX].Prod.vFrete;
        Item.valor_seguro               := Nfe.NFe.Det.Items[nX].Prod.vSeg;
        Item.valor_desconto             := Nfe.NFe.Det.Items[nX].Prod.vDesc;
        Item.valor_outras_despesas      := Nfe.NFe.Det.Items[nX].Prod.vOutro;
        Item.CFOP                       := natureza_operacao.CFOP;//Nfe.NFe.Det.Items[nX].Prod.cfop;

        rep := TFabricaRepositorio.GetRepositorio(TEmpresa.ClassName);

        try
          empresa := TEmpresa( rep.Get( strToInt( Campo_por_campo('EMPRESAS','CODIGO','CODIGO_PESSOA', intToStr(FNotaFiscal.Destinatario.Codigo) ) ) ) );
        Except
          raise Exception.Create(#13#10+'O CNPJ do Destinatário da nota difere do CNPJ da Empresa.');
        end;
        
       // if      (empresa.RegimeTributario = trtSimplesNacional) then begin
          {ICMS}
        if Item.getCsosnEnumeradoToString( Nfe.NFe.Det.Items[nX].Imposto.ICMS.CSOSN ) <> '' then begin
          Item.per_icm     := 0;//Nfe.NFe.Det.Items[nX].Imposto.ICMS.pCredSN;
          Item.base_icm    := 0;//(Item.valor_bruto + Item.valor_frete + Item.valor_seguro + Item.valor_outras_despesas) - Item.valor_desconto;
          Item.csosn       := Item.getCsosnEnumeradoToString( Nfe.NFe.Det.Items[nX].Imposto.ICMS.CSOSN );

        end
        else {if (empresa.RegimeTributario = trtLucroPresumido) then} begin
          Item.cst               := CST;
          {ICMS}
          Item.base_icm          := Nfe.NFe.Det.Items[nX].Imposto.ICMS.vBC;
          Item.per_icm           := Nfe.NFe.Det.Items[nX].Imposto.ICMS.pICMS;
          {IPI}
          Item.base_ipi          := Nfe.NFe.Det.Items[nX].Imposto.IPI.vBC;
          Item.per_ipi           := Nfe.NFe.Det.Items[nX].Imposto.IPI.pIPI;
          {PIS}
          Item.base_pis          := Nfe.NFe.Det.Items[nX].Imposto.PIS.vBC;
          Item.per_pis           := Nfe.NFe.Det.Items[nX].Imposto.PIS.pPIS;
          {COFINS}
          Item.base_cofins       :=  Nfe.NFe.Det.Items[nX].Imposto.COFINS.vBC;
          Item.per_cofins        :=  Nfe.NFe.Det.Items[nX].Imposto.COFINS.pCOFINS;
          {ICMS SUB. Tributária}
          Item.base_sub          :=  Nfe.NFe.Det.Items[nX].Imposto.ICMS.vBCST;
          item.per_sub           :=  Nfe.NFe.Det.Items[nX].Imposto.ICMS.pICMSST;
        end;

        FNotaFiscal.Itens.Add( Item as TItemNfMateria );

        FCDS.next;
    end;

  Except
    on E: Exception do begin

      if Item <> nil    then   FreeAndNil(Item);
      if rep <> nil     then   FreeAndNil(rep);
      if empresa <> nil then   FreeAndNil(empresa);

      raise Exception.Create('Falha ao alimentar itens da nota. ' + e.Message);

    end;
  end;
end;

function TImportadorNotaXML.retorna_escolha(pergunta :String): Integer;
begin
  Result := 2;//cancela

  frmConfirmacaoUsuario := TfrmConfirmacaoUsuario.Create(nil);
  frmConfirmacaoUsuario.memMsg.Text := pergunta;

  frmConfirmacaoUsuario.opcao3ativa := true;

  frmConfirmacaoUsuario.btnConfirma.Caption := 'Associar';
  frmConfirmacaoUsuario.btn3opcao.Caption   := 'Cadastrar';
  frmConfirmacaoUsuario.btnCancela.Caption  := 'Cancelar';

  Result := frmConfirmacaoUsuario.ShowModal;

  frmConfirmacaoUsuario.Release;
  frmConfirmacaoUsuario := nil;
end;

function TImportadorNotaXML.associar_cfop(
  codigo_natureza: integer): Boolean;
begin
  try
    result := true;
    frmCadastroNaturezaOperacao := TfrmCadastroNaturezaOperacao.CreateModoBusca(nil);
    frmCadastroNaturezaOperacao.filtra_cfop_entrada := true;
    frmCadastroNaturezaOperacao.ShowModal;

    if (frmCadastroNaturezaOperacao.ModalResult = mrOK) then
      salvaAssociacaoCFOP(codigo_natureza, frmCadastroNaturezaOperacao.cdsCODIGO.AsInteger)
    else
      result := false

  except
    result := false;
  end;
end;

function TImportadorNotaXML.cadastrar_cfop(
  codigo_natureza: integer): Boolean;
begin
  frmCadastroNaturezaOperacao := TfrmCadastroNaturezaOperacao.Create(nil);
  frmCadastroNaturezaOperacao.cadastro_correspondente := true;
  frmCadastroNaturezaOperacao.ShowModal;

  if frmCadastroNaturezaOperacao.ModalResult = MrOk then begin
    Result := true;
    salvaAssociacaoCFOP( codigo_natureza , strToInt( Maior_Valor_Cadastrado('NATUREZAS_OPERACAO','CODIGO')));
  end
  else
    result := false;

  frmCadastroNaturezaOperacao.Release;
end;

procedure TImportadorNotaXML.salvaAssociacaoCFOP(codigo_cfop, codigo_cfop_correspondente: Integer);
var
    CFOPCorrespondente  :TCFOPCorrespondente;
    repositorio         :TRepositorio;
begin
  try
  try
    repositorio        := TFabricaRepositorio.GetRepositorio(TCFOPCorrespondente.ClassName);
    CFOPCorrespondente := TCFOPCorrespondente.Create;


    CFOPCorrespondente.cod_CFOP_Saida       := codigo_cfop;
    CFOPCorrespondente.cod_CFOP_Entrada     := codigo_cfop_correspondente;

    repositorio.Salvar(CFOPCorrespondente);

  Except
    raise Exception.Create('Erro ao salvar associação');
  end;
  Finally
    FreeAndNil(CFOPCorrespondente);
    FreeAndNil(repositorio);
  end;
end;

function TImportadorNotaXML.cadastra_ou_associa_cfop(
  codigo_natureza: integer; CFOP :String): Boolean;
var retorno :integer; //1-Associar 2-Cancelar 3-Cadastrar
begin
  try
    Result  := true;

    retorno := retorna_escolha('CFOP: '+CFOP+' não está cadastrado ou não tem um correspondente associado.'+#13#10+
                               'Cadastrar correspondente, associar a um CFOP já cadastrado ou cancelar entrada?');

    if      retorno = 1 then begin
      Result :=  associar_cfop(codigo_natureza);
    end
    else if retorno = 3 then begin
      Result :=  cadastrar_cfop(codigo_natureza);
    end
    else Result := false;

  except
    Result := false;
  end;
end;

function TImportadorNotaXML.Nota_ja_importada(numero_nota: String): Boolean;
begin
  Result := true;

  { Se ja existir uma NF com o mesmo numero e fornecedor da nota corrente }
  if Campo_por_campo('NOTAS_FISCAIS', 'CODIGO', 'NUMERO_NOTA_FISCAL', numero_nota, 'CODIGO_EMITENTE', IntToStr(FCodigo_fornecedor)) <> '' then
    Result := true
  else
    Result := false;  
end;

end.
