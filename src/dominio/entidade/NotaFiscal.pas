unit NotaFiscal;

interface

uses
  NaturezaOperacao,
  Pessoa,
  FormaPagamento,
  TipoFrete,
  TipoSerie,                                                                                   
  Contnrs,
  Pedido,
  VolumesNotaFiscal,
  LocalEntregaNotaFiscal,
  TotaisNotaFiscal,
  ObservacaoNotaFiscal,
  MetodoDelegadoAposAtualizarNotaFiscal,
  MetodoDelegadoObtemCampoReal,
  MetodoDelegadoSomarCampoEspecificoReal,
  TipoStatusNotaFiscal,
  LoteNFe,
  Empresa,
  NFe,
  ItemAvulso,
  Math, StrUtils;

type
  TNotaFiscal = class

  private
    FLCriouNatureza         :Boolean;
    FLCriouEmitente         :Boolean;
    FLCriouDestinatario     :Boolean;
    FLCriouFormaPagamento   :Boolean;
    FLCriouTransportadora   :Boolean;
    FEntrada_saida: String;
    FFinalidade   : String;
    FNFe_referenciada :String;
    FNotaDeMaterias: Boolean;
    FNotaDeServico :Boolean;

    procedure SetTotais(const Value: TTotaisNotaFiscal);
    procedure SetEntrada_saida(const Value: String);
    procedure SetFinalidade(const Value: String);
    procedure SetNFe_referenciada(const Value: String);
    procedure SetNotaDeMaterias(const Value: Boolean);

  private
    FCodigoDestinatario     :Integer;
    FCodigoEmitente         :Integer;
    FCodigoFormaPagamento   :Integer;
    FCodigoNatureza         :Integer;
    FCodigoTransportadora   :Integer;

  private
    function GetDestinatario         :TPessoa;
    function GetEmitente             :TPessoa;
    function GetFormaPagamento       :TFormaPagamento;
    function GetNatureza             :TNaturezaOperacao;
    function GetPedidoFaturados      :TObjectList;
    function GetTransportadora       :TPessoa;
    function GetNFe                  :TNFe;
    function GetLoteNFe              :TLoteNFe;
    function GetItens                :TObjectList;
    function GetLocalEntrega         :TLocalEntregaNotaFiscal;
    function GetVolumes              :TVolumesNotaFiscal;
    function GetTotais               :TTotaisNotaFiscal;
    function GetObservacoes          :TObservacaoNotaFiscal;
    function GetTipoStatusNotaFiscal :TTipoStatusNotaFiscal;
    function GetChaveAcesso          :String;
    function GetEmpresa              :TEmpresa;
    function GetItensAvulsos         :TObjectList;
    function GetNotaDeMaterias       :Boolean;
    function GetNotaDeReducao        :Boolean;
    function GetNotaDeServico        :Boolean;
    function GetCalculaIcmsCompartilhado :Boolean;


  private
    FCodigoNotaFiscal  :Integer;
    FNumeroNotaFiscal  :Integer;
    FNatureza          :TNaturezaOperacao;
    FSerie             :String;
    FEmitente          :TPessoa;
    FDestinatario      :TPessoa;
    FPedidosFaturados  :TObjectList;
    FFormaPagamento    :TFormaPagamento;
    FDataEmissao       :TDateTime;
    FDataSaida         :TDateTime;
    FTransportadora    :TPessoa;
    FTipoFrete         :TTipoFrete;
    FItens             :TObjectList;
    FLocalEntrega      :TLocalEntregaNotaFiscal;
    FVolumes           :TVolumesNotaFiscal;
    FObservacoes       :TObservacaoNotaFiscal;
    FLote              :TLoteNFe;
    FNFe               :TNFe;
    FTotais            :TTotaisNotaFiscal;
    FEmpresa           :TEmpresa;
    FItensAvulsos      :TObjectList;
    FParcelas          :TObjectList;

  { Métodos Delegados }
    FAposAdicionarPrimeiroPedido      :TMetodoDelegadoAposAtualizarNotaFiscal;
    FAposAtualizarNotaFiscal          :TMetodoDelegadoAposAtualizarNotaFiscal;
    FAposRemoverUltimoPedido          :TMetodoDelegadoAposAtualizarNotaFiscal;
    FBuscadorAliquotaCreditoSN        :TMetodoDelegadoObtemCampoReal;
    FBuscadorPercentualReducaoICMS    :TMetodoDelegadoObtemCampoReal;
    FBuscadorAliquotaICMS             :TMetodoDelegadoObtemCampoReal;
    FBuscadorAliquotaIPI              :TMetodoDelegadoObtemCampoReal;
    FBuscadorAliquotaPIS              :TMetodoDelegadoObtemCampoReal;
    FBuscadorAliquotaCOFINS           :TMetodoDelegadoObtemCampoReal;
    FBuscadorPercReducaoBC            :TMetodoDelegadoObtemCampoReal;

  private
    function BuscaFormaPagamento   (const CodigoFormaPagamento :Integer) :TFormaPagamento;
    function BuscaTransportadora   (const CodigoTransportadora :Integer) :TPessoa;
    function ObtemPedidoFaturado   (const CodigoPedido :Integer) :TObject;
    function ObtemItemAvulso       (const CodigoProduto :Integer; const CodigoCor :Integer) :TObject;
    function PedidoJaAdicionado    (const CodigoPedido  :Integer) :Boolean;
    function ItemAvulsoJaAdicionado(const CodigoProduto :Integer; const CodigoCor :Integer) :Boolean;

  private
    function GetCodigo                                          :Integer;
    function GetBaseCalculoICMS                                 :Real;
    function GetICMS                                            :Real;
    function GetBaseCalculoICMSST                               :Real;
    function GetICMSST                                          :Real;
    function GetTotalProdutos                                   :Real;
    function GetII                                              :Real;
    function GetIPI                                             :Real;
    function GetPIS                                             :Real;
    function GetCOFINS                                          :Real;
    function GetTipoFrete                                       :Integer;
    function GetPercentualEmRelacaoAoTotalProdutos(Valor :Real) :Real;
    function GetRegimeTributario                                :Integer;
    function GetEnderecoEntrega                                 :String;
    function GetValorCreditoSN                                  :Real;
    function GetAliquotaInterEstadual                           :Real;
    function GetAliquotaInterna                                 :Real;
    function GetAliqPartilhaDestinatario                        :Real;
    function GetAliqFCP                                         :Real;
    function GetICMSFCP                                         :Real;
    function GetICMSUFDest                                      :Real;
    function GetICMSUFRemet                                     :Real;

  private
    function SomarCampoEspecificoReal(MetodoQueSoma :TMetodoDelegadoSomarCampoEspecificoReal) :Real;
    function SomarBaseCalculoICMS(ValorAtual :Real; Objeto :TObject) :Real;
    function SomarICMS           (ValorAtual :Real; Objeto :TObject) :Real;
    function SomarTotalProdutos  (ValorAtual :Real; Objeto :TObject) :Real;
    function SomarIPI            (ValorAtual :Real; Objeto :TObject) :Real;
    function SomarPIS            (ValorAtual :Real; Objeto :TObject) :Real;
    function SomarCOFINS         (ValorAtual :Real; Objeto :TObject) :Real;
    function SomarValorCreditoSN (ValorAtual :Real; Objeto :TObject) :Real;
    function SomarICMSFCP        (ValorAtual :Real; Objeto :TObject) :Real;
    function SomarICMSUFDest     (ValorAtual :Real; Objeto :TObject) :Real;
    function SomarICMSUFRemet    (ValorAtual :Real; Objeto :TObject) :Real;

  private
    procedure SetDataEmissao     (const DataEmissao :TDateTime);
    procedure SetDataSaida       (const DataSaida   :TDateTime);
    procedure SetNaturezaOperacao(N :TNaturezaOperacao);
    procedure SetSerie           (Serie :String);
    procedure SetEmitente        (E :TPessoa);
    procedure SetDestinatario    (D :TPessoa);
    procedure SetFormaPagamento  (F :TFormaPagamento);
    procedure SetTransportadora  (T :TPessoa);
    procedure SetTipoFrete       (TipoFrete :TTipoFrete);
    procedure SetNumeroNotaFiscal(const Value: Integer);

  private
    procedure AtualizarNotaFiscal (Sender :TObject);
    procedure AdicionarItens             (Pedido       :TPedido);     overload;
    procedure AdicionarItem              (ItemAvulso   :TItemAvulso); overload;
    procedure AlterarPercentualItens;
    procedure AlterarPercentualFreteItens;
    procedure AlterarPercentualSeguroItens;
    procedure AlterarPercentualDescontoItens;
    procedure AlterarPercentualOutrasDespesasItens;
    procedure LimparCabecalho            ();
    procedure PreencheCabecalho          (Pedido       :TPedido);
    procedure RemoverItens               (Pedido       :TPedido);
    procedure SomarPedidoAosTotais       (Pedido       :TPedido);
    procedure SomarItemAvulsoAosTotais   (ItemAvulso   :TItemAvulso);
    procedure SubtrairPedidoDosTotais    (Pedido       :TPedido);
    procedure SubtrairItemAvulsoDosTotais(ItemAvulso   :TItemAvulso);
    function GetParcelas: TObjectList;

  public
    constructor Create(
                        Natureza      :TNaturezaOperacao;
                        Serie         :String;
                        Emitente      :TPessoa;
                        Destinatario  :TPessoa;
                        const Entrada :Boolean = false
                      );

    // Para o repositorio
    constructor CriarParaRepositorio(CodigoNotaFiscal     :Integer;
                                     NumeroNotaFiscal     :Integer;
                                     CodigoNatureza       :Integer;
                                     TipoSerie            :String;
                                     CodigoEmitente       :Integer;
                                     CodigoDestinatario   :Integer;
                                     CodigoFormaPagamento :Integer;
                                     DataEmissao          :TDateTime;
                                     DataSaida            :TDateTime;
                                     CodigoTransportadora :Integer;
                                     TipoFrete            :Integer;
                                     Entrada_saida        :String;
                                     Finalidade           :String;
                                     NFe_referenciada     :String);

    destructor Destroy; override;

  public
    property CodigoNotaFiscal :Integer                 read GetCodigo            write FCodigoNotaFiscal;
    property NumeroNotaFiscal :Integer                 read FNumeroNotaFiscal    write SetNumeroNotaFiscal;
    property DataEmissao      :TDateTime               read FDataEmissao         write SetDataEmissao;
    property DataSaida        :TDateTime               read FDataSaida           write SetDataSaida;
    property Serie            :String                  read FSerie               write SetSerie;
    property TipoFrete        :TTipoFrete              read FTipoFrete           write SetTipoFrete;
    property Natureza         :TNaturezaOperacao       read GetNatureza          write SetNaturezaOperacao;
    property Emitente         :TPessoa                 read GetEmitente          write SetEmitente;
    property Destinatario     :TPessoa                 read GetDestinatario      write SetDestinatario;
    property PedidosFaturados :TObjectList             read GetPedidoFaturados;
    property FormaPagamento   :TFormaPagamento         read GetFormaPagamento    write SetFormaPagamento;
    property Transportadora   :TPessoa                 read GetTransportadora    write SetTransportadora;
    property Itens            :TObjectList             read GetItens;
    property LocalEntrega     :TLocalEntregaNotaFiscal read GetLocalEntrega;
    property Volumes          :TVolumesNotaFiscal      read GetVolumes;
    property Totais           :TTotaisNotaFiscal       read GetTotais            write SetTotais;
    property Observacoes      :TObservacaoNotaFiscal   read GetObservacoes;
    property Lote             :TLoteNFe                read GetLoteNFe;
    property NFe              :TNFe                    read GetNFe; 
    property Status           :TTipoStatusNotaFiscal   read GetTipoStatusNotaFiscal;
    property ChaveAcesso      :String                  read GetChaveAcesso;
    property Empresa          :TEmpresa                read GetEmpresa;
    property ItensAvulsos     :TObjectList             read GetItensAvulsos;
    property Entrada_saida    :String                  read FEntrada_saida      write SetEntrada_saida;
    property Finalidade       :String                  read FFinalidade         write SetFinalidade;
    property NFe_referenciada :String                  read FNFe_referenciada   write SetNFe_referenciada;
    property NotaDeMaterias   :Boolean                 read GetNotaDeMaterias   write SetNotaDeMaterias;
    property NotaDeReducao    :Boolean                 read GetNotaDeReducao;
    property NotaDeServico    :Boolean                 read GetNotaDeServico;
    property CalculaIcmsCompartilhado :Boolean         read GetCalculaIcmsCompartilhado;
    property AliquotaInterestadual :Real               read GetAliquotaInterEstadual;
    property AliquotaInterna  :Real                    read GetAliquotaInterna;
    property AliquotaPartilhaDestinatario :Real        read GetAliqPartilhaDestinatario;
    property AliquotaFCP      :Real                    read GetAliqFCP;

  public
    property Parcelas         :TObjectList        read GetParcelas;

  public
    procedure AdicionarChaveAcesso(const ChaveAcesso, XML :String);
    procedure AdicionarPedido     (Pedido      :TPedido);
    procedure AdicionarItemAvulso (ItemAvulso  :TItemAvulso);
    procedure AdicionarRetornoLote(Status :String; Motivo :String; Recibo :String);
    procedure AdicionarRetornoNFe (Status, Motivo :String);
    procedure AlterarObservacoes  (Obs         :String);
    procedure CriaLoteEnvio;
    procedure LimparPedidosFaturados();
    procedure RemoverPedido       (Pedido :TPedido);
    procedure RemoverItemAvulso   (ItemAvulso :TItemAvulso);
    procedure RecalcularNotaFiscal();
    procedure RecarregarNFe();
    procedure ValidarDadosObrigatorios();

    procedure SetMetodoDelegadoAposAdicionarPrimeiroPedido    (Metodo :TMetodoDelegadoAposAtualizarNotaFiscal);
    procedure SetMetodoDelegadoAposAtualizarNotaFiscal        (Metodo :TMetodoDelegadoAposAtualizarNotaFiscal);
    procedure SetMetodoDelegadoAposRemoverUltimoPedido        (Metodo :TMetodoDelegadoAposAtualizarNotaFiscal);
    procedure SetMetodoDelegadoBuscadorAliquotaCreditoSN      (Metodo :TMetodoDelegadoObtemCampoReal);
    procedure SetMetodoDelegadoBuscadorPercentualReducaoICMS  (Metodo :TMetodoDelegadoObtemCampoReal);
    procedure SetMetodoDelegadoBuscadorAliquotaICMS           (Metodo :TMetodoDelegadoObtemCampoReal);
    procedure SetMetodoDelegadoBuscadorAliquotaPIS            (Metodo :TMetodoDelegadoObtemCampoReal);
    procedure SetMetodoDelegadoBuscadorAliquotaCOFINS         (Metodo :TMetodoDelegadoObtemCampoReal);
end;

implementation

uses
  SysUtils,
  Classes,
  ExcecaoParametroInvalido,
  ExcecaoNotaFiscalInvalida,
  PedidoFaturado,
  Repositorio,
  FabricaRepositorio,
  Item, Parcela,
  ItemNotaFiscal,
  ItemNfMateria,
  TipoRegimeTributario,
  TipoOrigemMercadoria,
  EspecificacaoItensDaNotaFiscal, StringUtilitario,
  EspecificacaoLoteNFePorCodigoNotaFiscal,
  EspecificacaoItensMateriaDaNotaFiscal,
  EspecificacaoEmpresaPorCodigoPessoa, Especificacao,
  ExcecaoCampoNaoInformado, EspecificacaoAliqInternaPorCodigoEstado,
  Funcoes, AliqInternaIcms, EspecificacaoParcelaPorCodigoNotaFiscal;

{ TNotaFiscal }

procedure TNotaFiscal.AdicionarPedido(Pedido: TPedido);
var
  PedidoFaturado :TPedidoFaturado;
begin
   { Verifico se o pedido está instânciado }
   if not Assigned(Pedido) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, 'AdicionaPedido(Pedido: TPedido)', 'Pedido');

   { Se o pedido já foi adicionado então sai do método }
   if self.PedidoJaAdicionado(Pedido.Codigo) then
     exit;

   PedidoFaturado := TPedidoFaturado.Create(0,Pedido.Codigo);
   PedidoFaturado.AdicionarBuscadorDeCodigoNotaFiscal(self.GetCodigo);

   if not Assigned(self.FPedidosFaturados) then
    self.FPedidosFaturados := TObjectList.Create;

   self.FPedidosFaturados.Add(PedidoFaturado);    

   { Se este for o primeiro pedido faturado da nota fiscal então alguns campos específicos são adicionados
     no cabeçalho da nota fiscal, como Forma de Pagamento, Transportadora e etc. Este processo é realizado por meio do método delegado.
     Nos outros próximos pedidos estes campos não são alterados. Todos estes campos podem ser alterados pelo usuário antes de faturar a nota fiscal }
   if (self.FPedidosFaturados.Count = 1) then begin
     self.PreencheCabecalho(Pedido);

     if Assigned(self.FAposAdicionarPrimeiroPedido) then
     self.FAposAdicionarPrimeiroPedido(self);
   end;

   self.SomarPedidoAosTotais(Pedido);
   self.AdicionarItens(Pedido);

   // Aqui é para os outros campos como totais de frete, produto e etc. Que são alterados em cada inserção de pedido.
   if Assigned(self.FAposAtualizarNotaFiscal) then
    self.FAposAtualizarNotaFiscal(self);
end;

procedure TNotaFiscal.SetDestinatario(D: TPessoa);
begin
   if not Assigned(D) then
     raise TExcecaoParametroInvalido.Create('TNotaFiscal', 'SetDestinatario(Destinatario: TPessoa)', 'Destinatario');

   try
     if (D = self.FDestinatario) then
      exit;
   except
     on E: EAccessViolation do
       // Se FDestinatario não tiver instânciado então não é igual
   end;

   if self.FLCriouDestinatario and Assigned(self.FDestinatario) then begin
      FreeAndNil(self.FDestinatario);
      self.FLCriouDestinatario := False;
   end;

   self.FDestinatario := D;
end;

procedure TNotaFiscal.SetEmitente(E: TPessoa);
begin
     if not Assigned(E) then
     raise TExcecaoParametroInvalido.Create('TNotaFiscal', 'SetEmitente(Emitente: TPessoa)', 'Emitente');

   try
     if (E = self.FEmitente) then
      exit;
   except
     on E: EAccessViolation do
       // Se FEmitente não tiver instânciado então não é igual
   end;

   if self.FLCriouEmitente and Assigned(self.FEmitente) then begin
    FreeAndNil(self.FEmitente);
    self.FLCriouEmitente := false;
   end;

   self.FEmitente := E;
   FreeAndNil(self.FEmpresa);

   self.RecalcularNotaFiscal;
end;

procedure TNotaFiscal.SetFormaPagamento(F: TFormaPagamento);
begin
   if not Assigned(F) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, 'SetFormaPagamento(FormaPagamento: TFormaPagamento)', 'FormaPagamento');

    try
      if (F = self.FFormaPagamento) then
        exit;
    except
      on E: EAccessViolation do
        // Se FFormaPagamento não tiver instânciado então não é igual
    end;

   if Assigned(self.FFormaPagamento) then
    FreeAndNil(FFormaPagamento);

   self.FFormaPagamento       := self.BuscaFormaPagamento(F.Codigo);
   self.FLCriouFormaPagamento := true;
end;

procedure TNotaFiscal.SetNaturezaOperacao(N: TNaturezaOperacao);
begin
   if not Assigned(N) then
      raise TExcecaoParametroInvalido.Create('TNotaFiscal', 'SetNaturezaOperacao(Natureza: TNaturezaOperacao)', 'Natureza');

   try
     if (N = self.FNatureza) then
      exit;
   except
     on E: EAccessViolation do
       // Se FEmitente não tiver instânciado então não é igual
   end;

   if self.FLCriouNatureza and Assigned(self.FNatureza) then begin
    FreeAndNil(self.FNatureza);
    self.FLCriouNatureza := false;
   end;

   self.FNatureza := N;

   self.RecalcularNotaFiscal;
end;

procedure TNotaFiscal.SetDataEmissao(const DataEmissao: TDateTime);
begin
     if (DataEmissao <= 0) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, 'SetDataEmissao(DataEmissao: TDateTime)', 'DataEmissao');

   self.FDataEmissao := DataEmissao;

   if Assigned(self.FAposAtualizarNotaFiscal) then
    self.FAposAtualizarNotaFiscal(self);
end;

procedure TNotaFiscal.SetDataSaida(const DataSaida: TDateTime);
begin
   if (DataSaida <= 0) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, 'SetDataSaida(DataSaida: TDateTime)', 'DataSaida');

   self.FDataSaida := DataSaida;

   if Assigned(self.FAposAtualizarNotaFiscal) then
    self.FAposAtualizarNotaFiscal(self);
end;

procedure TNotaFiscal.SetSerie(Serie: String);
begin
  if not (self.Entrada_saida = 'E') then
  begin
    if ((TTipoSerieUtilitario.DeStringParaEnumerado(Serie) <> tsNormal) and
       (TTipoSerieUtilitario.DeStringParaEnumerado(Serie) <> tsSCAN)) then
      raise TExcecaoParametroInvalido.Create('TNotaFiscal', 'SetSerie(Serie: TTipoSerie)', 'Serie');
  end;

   self.FSerie := Serie;
end;

constructor TNotaFiscal.Create(Natureza: TNaturezaOperacao;
  Serie: String; Emitente, Destinatario: TPessoa; const Entrada :Boolean);
var
  ParametrosInvalidos :TStrings;
  Erro                :String;
begin
   self.FLCriouNatureza         := false;
   self.FLCriouEmitente         := false;
   self.FLCriouDestinatario     := false;
   self.FLCriouFormaPagamento   := false;
   self.FLCriouTransportadora   := false;

   self.FCodigoNotaFiscal        := 0;
   self.FFormaPagamento          := nil;
   self.FPedidosFaturados        := nil;
   self.FDataEmissao             := Now;
   self.FDataSaida               := Now;
   self.FTransportadora          := nil;
   self.FTipoFrete               := tfCIF;
   self.FVolumes                 := nil;
   self.FTotais                  := nil;
   self.FLote                    := nil;
   self.FNFe                     := nil;
   self.FEmpresa                 := nil;
   self.FItensAvulsos            := nil;
   self.Entrada_saida            := IfThen(Entrada,'E','');

   ParametrosInvalidos           := TStringList.Create;
   ParametrosInvalidos.Delimiter := #13;

   try
     try
       self.SetNaturezaOperacao(Natureza);
     except
       on E: TExcecaoParametroInvalido do
         ParametrosInvalidos.Add('Informe a Natureza de Operação!');
     end;

     try
       self.SetSerie(Serie);
     except
       on E: TExcecaoParametroInvalido do
         ParametrosInvalidos.Add('Informe a Série!');
     end;

     try
       self.SetEmitente(Emitente);
     except
       on E: TExcecaoParametroInvalido do
         ParametrosInvalidos.Add('Informe o Emitente!');
     end;

     try
       self.SetDestinatario(Destinatario);
     except
       on E: TExcecaoParametroInvalido do
         ParametrosInvalidos.Add('Informe o Destinatário!');
     end;

     if (ParametrosInvalidos.Count > 0) then begin
        Erro := StringReplace(ParametrosInvalidos.DelimitedText, '"', '', [rfReplaceAll]);
        raise  TExcecaoNotaFiscalInvalida.Create(Erro);
     end;

     self.FItens := TObjectList.Create;

     self.FLocalEntrega := TLocalEntregaNotaFiscal.Create;
     self.FLocalEntrega.AdicionarBuscadorNotaFiscal(self.GetCodigo);
     self.FLocalEntrega.AdicionarAposAtualizarLocalEntrega(self.AtualizarNotaFiscal);

     { constructor Create(Especie :String; QuantidadeVolumes :Integer; PesoLiquido, PesoBruto :Real); }
     self.FVolumes := TVolumesNotaFiscal.Create('CAIXA', 0, 0, 0);
     self.FVolumes.AdicionarBuscadorDeCodigoNotaFiscal(self.GetCodigo);

     { (Frete, Seguro, Desconto, OutrasDespesas :Real) }
     self.FTotais := TTotaisNotaFiscal.Create(0, 0, 0, 0);
     self.FTotais.AdicionarBuscadorCodigoNotaFiscal(self.GetCodigo);
     self.FTotais.AdicionarBuscadorBaseCalculoICMS(self.GetBaseCalculoICMS);
     self.FTotais.AdicionarBuscadorICMS(self.GetICMS);
     self.FTotais.AdicionarBuscadorBaseCalculoICMSST(self.GetBaseCalculoICMSST);
     self.FTotais.AdicionarBuscadorICMSST(self.GetICMSST);
     self.FTotais.AdicionarBuscadorTotalProdutos(self.GetTotalProdutos);
     self.FTotais.AdicionarBuscadorII(self.GetII);
     self.FTotais.AdicionarBuscadorIPI(self.GetIPI);
     self.FTotais.AdicionarBuscadorPIS(self.GetPIS);
     self.FTotais.AdicionarBuscadorCOFINS(self.GetCOFINS);
     self.FTotais.AdicionarBuscadorTipoFrete(self.GetTipoFrete);
     self.FTotais.AdicionarBuscadorICMSFCP(self.GetICMSFCP);
     self.FTotais.AdicionarBuscadorICMSUFDest(self.GetICMSUFDest);
     self.FTotais.AdicionarBuscadorICMSUFRemet(self.GetICMSUFRemet);
     self.FTotais.AdicionarAtualizarFreteItens(self.AlterarPercentualFreteItens);
     self.FTotais.AdicionarAtualizarSeguroItens(self.AlterarPercentualSeguroItens);
     self.FTotais.AdicionarAtualizarDescontoItens(self.AlterarPercentualDescontoItens);
     self.FTotais.AdicionarAtualizarOutrasDespesasItens(self.AlterarPercentualOutrasDespesasItens);
     self.FTotais.AdicionarAtualizarNotaFiscal(self.AtualizarNotaFiscal);

     self.FObservacoes := TObservacaoNotaFiscal.Create;
     self.FObservacoes.AdicionarBuscadorDeCodigoNotaFiscal(self.GetCodigo);
     self.FObservacoes.AdicionarBuscadorDeRegimeTributarioDestinatario(self.GetRegimeTributario);
     self.FObservacoes.AdicionarBuscadorDeAliquotaCreditoSN(self.FBuscadorAliquotaCreditoSN);
     self.FObservacoes.AdicionarBuscadorDeValorCreditoSN(Self.GetValorCreditoSN);
     self.FObservacoes.AdicionarBuscadorEnderecoEntrega(self.GetEnderecoEntrega);
   finally
     FreeAndNil(ParametrosInvalidos);
   end;
end;

destructor TNotaFiscal.Destroy;
begin
  if self.FLCriouNatureza and Assigned(self.FNatureza) then
    FreeAndNil(self.FNatureza);

  if self.FLCriouEmitente and Assigned(self.FEmitente) then
    FreeAndNil(self.FEmitente);

  if self.FLCriouDestinatario and Assigned(self.FDestinatario) then
    FreeAndNil(self.FDestinatario);

  if Assigned(self.FPedidosFaturados) then
    FreeAndNil(self.FPedidosFaturados);

  if self.FLCriouFormaPagamento and Assigned(self.FFormaPagamento) then
    FreeAndNil(self.FFormaPagamento);

  if self.FLCriouTransportadora and Assigned(self.FTransportadora) then
    FreeAndNil(self.FTransportadora);

  if Assigned(self.FParcelas) then
    FreeAndNil(self.FParcelas);

  FreeAndNil(self.FLote);
  FreeAndNil(self.FNFe);
  FreeAndNil(self.FItens);
  FreeAndNil(self.FLocalEntrega);
  FreeAndNil(self.FVolumes);
  FreeAndNil(self.FTotais);
  FreeAndNil(self.FObservacoes);
  FreeAndNil(self.FEmpresa);

  inherited;
end;

function TNotaFiscal.GetCodigo: Integer;
begin
   result := self.FCodigoNotaFiscal;
end;

function TNotaFiscal.PedidoJaAdicionado(
  const CodigoPedido: Integer): Boolean;
var
  PedidoFaturado :TObject;
begin
   PedidoFaturado := self.ObtemPedidoFaturado(CodigoPedido);
   result         := (PedidoFaturado <> nil);
end;

procedure TNotaFiscal.PreencheCabecalho(Pedido: TPedido);
begin
   self.SetDataEmissao   (Pedido.dt_cadastro);
   self.SetDataSaida     (Now);
   self.SetFormaPagamento(Pedido.FormaPagamento);
   self.SetTransportadora(Pedido.Transportadora);
   self.SetTipoFrete     (TTipoFreteUtilitario.DeInteiroParaEnumerado(Pedido.tipo_frete));
   self.Observacoes.Observacoes := Pedido.observacao;
end;

procedure TNotaFiscal.SetMetodoDelegadoAposAtualizarNotaFiscal(
  Metodo: TMetodoDelegadoAposAtualizarNotaFiscal);
begin
   self.FAposAtualizarNotaFiscal := Metodo;
end;

procedure TNotaFiscal.SetMetodoDelegadoAposAdicionarPrimeiroPedido(
  Metodo: TMetodoDelegadoAposAtualizarNotaFiscal);
begin
   self.FAposAdicionarPrimeiroPedido := Metodo;
end;

procedure TNotaFiscal.SetTransportadora(T: TPessoa);
begin
   if not Assigned(T) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, 'AlterarTransportadora(Transportadora: TPessoa)', 'Transportadora');

   try
     if (T = self.FTransportadora) then
      exit;
   except
     on E: EAccessViolation do
      // Se não for instânciado FTransportadora então não é igual
   end;

   if Assigned(FTransportadora) then
    FreeAndNil(FTransportadora);

   self.FTransportadora       := self.BuscaTransportadora(T.Codigo);
   self.FLCriouTransportadora := true;
end;

procedure TNotaFiscal.SetTipoFrete(TipoFrete: TTipoFrete);
begin
   if ((TipoFrete <> tfCIF) and (TipoFrete <> tfFOB)) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, 'AlterarTipoFrete(TipoFrete: TTipoFrete)', 'TipoFrete');

   self.FTipoFrete := TipoFrete;
   self.AlterarPercentualItens;

   if Assigned(self.FAposAtualizarNotaFiscal) then
    self.FAposAtualizarNotaFiscal(self);
end;

function TNotaFiscal.BuscaFormaPagamento(
  const CodigoFormaPagamento: Integer): TFormaPagamento;
var
  Repositorio :TRepositorio;
begin
   Repositorio := nil;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TFormaPagamento.ClassName);
     result      := (Repositorio.Get(CodigoFormaPagamento) as TFormaPagamento);
   finally
     FreeAndNil(Repositorio);
   end;
end;

function TNotaFiscal.BuscaTransportadora(
  const CodigoTransportadora: Integer): TPessoa;
var
  Repositorio :TRepositorio;
begin
   Repositorio := nil;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
     result      := (Repositorio.Get(CodigoTransportadora) as TPessoa);
   finally
     FreeAndNil(Repositorio);
   end;
end;

function TNotaFiscal.GetBaseCalculoICMS: Real;
begin
   result := self.SomarCampoEspecificoReal(self.SomarBaseCalculoICMS);
end;

function TNotaFiscal.GetICMS: Real;
begin
   result := self.SomarCampoEspecificoReal(self.SomarICMS);
end;

function TNotaFiscal.GetBaseCalculoICMSST: Real;
begin
   result := 0;
end;

function TNotaFiscal.GetICMSST: Real;
begin
   result := 0;
end;

function TNotaFiscal.GetTotalProdutos: Real;
begin
   result := self.SomarCampoEspecificoReal(self.SomarTotalProdutos);
end;

function TNotaFiscal.GetII: Real;
begin
   result := 0;
end;

function TNotaFiscal.GetIPI: Real;
begin
   result := self.SomarCampoEspecificoReal(self.SomarIPI);
end;

function TNotaFiscal.GetPIS: Real;
begin
   result := self.SomarCampoEspecificoReal(self.SomarPIS);
end;

function TNotaFiscal.GetCOFINS: Real;
begin
   result := self.SomarCampoEspecificoReal(self.SomarCOFINS);
end;

procedure TNotaFiscal.RemoverPedido(Pedido: TPedido);
var
  PedidoFaturado :TObject;
begin
   { Verifico se o pedido está instânciado }
   if not Assigned(Pedido) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, 'AdicionaPedido(Pedido: TPedido)', 'Pedido');

   { Se a lista de pedidos faturados estiver nula ou este pedido não estiver adicionado então sai do método }
   if not self.PedidoJaAdicionado(Pedido.Codigo) then
     exit;

   PedidoFaturado := self.ObtemPedidoFaturado(Pedido.Codigo);

   self.FPedidosFaturados.Remove(PedidoFaturado);

//   if (self.FPedidosFaturados.Count = 0) then begin
//     self.LimparCabecalho(Pedido);
//
//     if Assigned(self.FAposRemoverUltimoPedido) then
//       self.FAposRemoverUltimoPedido(self);
//   end;

   // Aqui é para os outros campos como totais de frete, produto e etc. Que são alterados em cada inserção de pedido.
   self.SubtrairPedidoDosTotais(Pedido);
   self.RemoverItens(Pedido);

   if (not Assigned(self.FItens)) or (self.FItens.Count = 0) then begin
     self.LimparCabecalho();

     if Assigned(self.FAposRemoverUltimoPedido) then
       self.FAposRemoverUltimoPedido(self);
   end;

   if Assigned(self.FAposAtualizarNotaFiscal) then
     self.FAposAtualizarNotaFiscal(self);
end;

function TNotaFiscal.ObtemPedidoFaturado(
  const CodigoPedido: Integer): TObject;
var
  nX :Integer;
begin
   result := nil;
   
   try
      for nX := 0 to (self.FPedidosFaturados.Count-1) do begin

        if (CodigoPedido = TPedidoFaturado(self.FPedidosFaturados.Items[nX]).CodigoPedido) then begin
          result := self.FPedidosFaturados.Items[nX];
          exit;
        end;
     end;
   except
     on E: EAccessViolation do
      result := nil;
   end;
end;

procedure TNotaFiscal.LimparCabecalho();
begin
   self.FDataEmissao := Now;
   self.FDataSaida   := Now;;

   if Assigned(self.FFormaPagamento) then begin
     self.FLCriouFormaPagamento := false;
     self.FCodigoFormaPagamento := 0;
     FreeAndNil(self.FFormaPagamento);
   end;


   if Assigned(self.FTransportadora) then begin
     self.FLCriouTransportadora := false;
     self.FCodigoTransportadora := 0;
     FreeAndNil(self.FTransportadora);
   end;

   self.Observacoes.Observacoes := '';
   self.Observacoes.LimparObservacoesGeradasPeloSistema;
end;

procedure TNotaFiscal.SetMetodoDelegadoAposRemoverUltimoPedido(
  Metodo: TMetodoDelegadoAposAtualizarNotaFiscal);
begin
   self.FAposRemoverUltimoPedido := Metodo;
end;

function TNotaFiscal.GetDestinatario: TPessoa;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FDestinatario) then begin
      Repositorio := nil;

      try
         Repositorio              := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
         self.FDestinatario       := (Repositorio.Get(self.FCodigoDestinatario) as TPessoa);
         self.FLCriouDestinatario := true;

      finally
        FreeAndNil(Repositorio);
      end;
   end;

   result := self.FDestinatario;
end;

function TNotaFiscal.GetEmitente: TPessoa;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FEmitente) then begin
      Repositorio := nil;

      try
           Repositorio          := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
         self.FEmitente       := (Repositorio.Get(self.FCodigoEmitente) as TPessoa);
         self.FLCriouEmitente := true;

      finally
          FreeAndNil(Repositorio);
      end;
   end;

   result := self.FEmitente;
end;

function TNotaFiscal.GetFormaPagamento: TFormaPagamento;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FFormaPagamento) then begin
      Repositorio := nil;

      try
        Repositorio                := TFabricaRepositorio.GetRepositorio(TFormaPagamento.ClassName);
        self.FFormaPagamento       := (Repositorio.Get(self.FCodigoFormaPagamento) as TFormaPagamento);
        self.FLCriouFormaPagamento := true;
      finally
        FreeAndNil(Repositorio);
      end;
   end;

   result := self.FFormaPagamento;
end;

function TNotaFiscal.GetNatureza: TNaturezaOperacao;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FNatureza) then begin

     Repositorio := nil;

     try
       Repositorio          := TFabricaRepositorio.GetRepositorio(TNaturezaOperacao.ClassName);
       self.FNatureza       := (Repositorio.Get(self.FcodigoNatureza) as TNaturezaOperacao);
       self.FLCriouNatureza := true;
     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FNatureza;
end;

function TNotaFiscal.GetParcelas: TObjectList;
var
  Repositorio   :TRepositorio;
  Especificacao :TEspecificacaoParcelaPorCodigoNotaFiscal;
begin
   Repositorio    := nil;
   Especificacao  := nil;

   try
      if not Assigned(self.FParcelas) then begin
        Especificacao         := TEspecificacaoParcelaPorCodigoNotaFiscal.Create(self.CodigoNotaFiscal);
        Repositorio           := TFabricaRepositorio.GetRepositorio(TParcela.ClassName);
        self.FParcelas        := Repositorio.GetListaPorEspecificacao(Especificacao);
      end;

      result := self.FParcelas;
   finally
     FreeAndNil(Especificacao);
     FreeAndNil(Repositorio);
   end;
end;

function TNotaFiscal.GetPedidoFaturados: TObjectList;
var
  Repositorio    :TRepositorio;
begin
   if not Assigned(self.FPedidosFaturados) then begin
     Repositorio   := nil;

     try
       Repositorio            := TFabricaRepositorio.GetRepositorio(TPedidoFaturado.ClassName);
       self.FPedidosFaturados := Repositorio.GetListaPorIdentificador(self.FCodigoNotaFiscal);
     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FPedidosFaturados;
end;

function TNotaFiscal.GetTotais: TTotaisNotaFiscal;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FTotais) then begin
     Repositorio := nil;

     try
       Repositorio := TFabricaRepositorio.GetRepositorio(TTotaisNotaFiscal.ClassName);
       self.FTotais := (Repositorio.Get(self.FCodigoNotaFiscal) as TTotaisNotaFiscal);

        try
           self.FTotais.AdicionarBuscadorCodigoNotaFiscal(self.GetCodigo);
           self.FTotais.AdicionarBuscadorBaseCalculoICMS(self.GetBaseCalculoICMS);
           self.FTotais.AdicionarBuscadorICMS(self.GetICMS);
           self.FTotais.AdicionarBuscadorBaseCalculoICMSST(self.GetBaseCalculoICMSST);
           self.FTotais.AdicionarBuscadorICMSST(self.GetICMSST);
           self.FTotais.AdicionarBuscadorTotalProdutos(self.GetTotalProdutos);
           self.FTotais.AdicionarBuscadorII(self.GetII);
           self.FTotais.AdicionarBuscadorIPI(self.GetIPI);
           self.FTotais.AdicionarBuscadorPIS(self.GetPIS);
           self.FTotais.AdicionarBuscadorCOFINS(self.GetCOFINS);
           self.FTotais.AdicionarBuscadorTipoFrete(self.GetTipoFrete);
           self.FTotais.AdicionarBuscadorICMSFCP(self.GetICMSFCP);
           self.FTotais.AdicionarBuscadorICMSUFDest(self.GetICMSUFDest);
           self.FTotais.AdicionarBuscadorICMSUFRemet(self.GetICMSUFRemet);
           self.FTotais.AdicionarAtualizarFreteItens(self.AlterarPercentualFreteItens);
           self.FTotais.AdicionarAtualizarSeguroItens(self.AlterarPercentualSeguroItens);
           self.FTotais.AdicionarAtualizarDescontoItens(self.AlterarPercentualDescontoItens);
           self.FTotais.AdicionarAtualizarOutrasDespesasItens(self.AlterarPercentualOutrasDespesasItens);
           self.FTotais.AdicionarAtualizarNotaFiscal(self.AtualizarNotaFiscal);

           if not NotaDeMaterias then
             self.AlterarPercentualItens;
        except
            on E: EAccessViolation do begin
              result := nil;
              exit;
            end;
        end;
     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FTotais;
end;

function TNotaFiscal.GetTransportadora: TPessoa;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FTransportadora) then begin
      Repositorio := nil;

      try
         Repositorio                := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
         self.FTransportadora       := (Repositorio.Get(self.FCodigoTransportadora) as TPessoa);
         self.FLCriouTransportadora := true;
      finally
        FreeAndNil(Repositorio);
      end;
   end;

   result := self.FTransportadora;
end;

function TNotaFiscal.GetVolumes: TVolumesNotaFiscal;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FVolumes) then begin
      Repositorio := nil;

      try
          Repositorio   := TFabricaRepositorio.GetRepositorio(TVolumesNotaFiscal.ClassName);
          self.FVolumes := (Repositorio.Get(self.FCodigoNotaFiscal) as TVolumesNotaFiscal);

          try
            self.FVolumes.AdicionarBuscadorDeCodigoNotaFiscal(self.GetCodigo);
          except
            on E: EAccessViolation do begin
              result := nil;
              exit;
            end;
          end;

      finally
        FreeAndNil(Repositorio);
      end;
   end;

   result := self.FVolumes;
end;

function TNotaFiscal.GetTipoFrete: Integer;
begin
   result := TTipoFreteUtilitario.DeEnumeradoParaInteiro(self.FTipoFrete);
end;

procedure TNotaFiscal.SomarPedidoAosTotais(Pedido: TPedido);
begin
  self.FTotais.SomarFreteAoTotal(Pedido.valor_frete);
//   self.FTotais.SomarSeguroAoTotal(Pedido.Seguro);
  self.Totais.SomarDescontoAoTotal(Pedido.total_desconto);
  self.Totais.SomarOutrasDespesasAoTotal(Pedido.Acrescimo);

//   self.FVolumes.SomarQuantidadeAoTotal();
  self.Volumes.SomarPesoLiquidoAoTotal(Pedido.PesoLiquidoTotal);
  self.Volumes.SomarPesoBrutoAoTotal(Pedido.PesoBrutoTotal);
end;

procedure TNotaFiscal.SubtrairPedidoDosTotais(Pedido: TPedido);
begin
  self.Totais.SubtrairFreteDoTotal(Pedido.valor_frete);
//   self.FTotais.SubtrairSeguroDoTotal(Pedido.Seguro);
  self.Totais.SubtrairDescontoDoTotal(Pedido.total_desconto);
  self.Totais.SubtrairOutrasDespesasDoTotal(Pedido.Acrescimo);

//   self.FVolumes.SubtrairQuantidadeDoTotal();
  self.Volumes.SubtrairPesoLiquidoDoTotal(Pedido.PesoLiquidoTotal);
  self.Volumes.SubtrairPesoBrutoDoTotal(Pedido.PesoBrutoTotal);
end;

procedure TNotaFiscal.AdicionarItens(Pedido :TPedido);
var
  ItemPedido     :TItem;
  ItemNotaFiscal :TItemNotaFiscal;
  nX, nY         :Integer;
begin
   for nX := 0 to (Pedido.Itens.Count-1) do begin
     ItemPedido := TItem(Pedido.Itens.Items[nX]);

     try
       for nY := 0 to (self.Itens.Count-1) do begin
          ItemNotaFiscal := (self.Itens.Items[nY] as TItemNotaFiscal);

          // Se eu encontrar um item de nota fiscal com o mesmo produto do item corrente do pedido então eu só somo as quantidades
          if (ItemPedido.Produto.Codigo = ItemNotaFiscal.Produto.Codigo) then begin
              ItemNotaFiscal.SomarQuantidade(ItemPedido.qtd_total);

              abort;
          end;
       end;

       // Se chegar aqui é porque não foi encontrado nenhum item com o mesmo produto
       if      (TEmpresa(self.FEmitente).RegimeTributario = trtSimplesNacional) then begin
         try
           ItemNotaFiscal := TItemNotaFiscal.CriaSimplesNacional(ItemPedido.Produto,
                                                                 self.Natureza,
                                                                 ItemPedido.qtd_total,
                                                                 ItemPedido.preco,
                                                                 tomNacional,
                                                                 self.FBuscadorAliquotaCreditoSN);

         except
           on E: EAccessViolation do
             raise EAccessViolation.Create('Erro em: TNotaFiscal.AdicionarItens(Pedido: TPedido). '+
                                           'self.FBuscadorAliquotaCreditoSN não foi instânciado!'  );
         end;
       end
       else if (TEmpresa(self.FEmitente).RegimeTributario = trtLucroPresumido) then begin
         try
           ItemNotaFiscal := TItemNotaFiscal.CriaLucroPresumido(ItemPedido.Produto,
                                                                self.Natureza,
                                                                ItemPedido.qtd_total,
                                                                ItemPedido.preco,
                                                                tomNacional,
                                                                self.FBuscadorAliquotaICMS,
                                                                0,
                                                                self.FBuscadorAliquotaPIS,
                                                                self.FBuscadorAliquotaCOFINS,
                                                                self.FBuscadorPercentualReducaoICMS);
         except
           on E: EAccessViolation do
             raise EAccessViolation.Create('Erro em: TNotaFiscal.AdicionarItens(Pedido: TPedido). '+
                                           'Algum buscador de alíquota não foi instânciado!'  );
         end;
       end;

       ItemNotaFiscal.AdicionarBuscadorCodigoNotaFiscal(self.GetCodigo);
       self.Itens.Add(ItemNotaFiscal);
     except
       on E: EAbort do
        continue;
     end;
   end;

   AlterarPercentualItens;
end;

procedure TNotaFiscal.SetMetodoDelegadoBuscadorAliquotaCreditoSN(
  Metodo: TMetodoDelegadoObtemCampoReal);
begin
   self.FBuscadorAliquotaCreditoSN := Metodo;

   self.Observacoes.AdicionarBuscadorDeAliquotaCreditoSN(Metodo);
end;

function TNotaFiscal.SomarCampoEspecificoReal(
  MetodoQueSoma: TMetodoDelegadoSomarCampoEspecificoReal): Real;
var
  nX :Integer;
begin
   if not Assigned(MetodoQueSoma) then
    raise TExcecaoParametroInvalido.Create(self.ClassName,
                                           'SomarCampoEspecificoReal(MetodoQueSoma: TMetodoDelegadoSomarCampoEspecificoReal)',
                                           'MetodoQueSoma');

   result := 0;

   self.GetItens;

   for nX := 0 to (self.FItens.Count-1) do begin
      result := MetodoQueSoma(result, self.FItens.Items[nX]);
   end;
end;

function TNotaFiscal.SomarBaseCalculoICMS(ValorAtual: Real;
  Objeto: TObject): Real;
var
  IP :TItemNotaFiscal;
  IM :TItemNfMateria;
  Base_calculo_icm :Real;
begin
   try
     if Objeto is TItemNotaFiscal then     IP := (Objeto as TItemNotaFiscal)
                                  else     IM := (Objeto as TItemNfMateria);
   except
     on E: EInvalidCast do
       raise TExcecaoParametroInvalido.Create(self.ClassName, 'SomarBaseCalculoICMS(ValorAtual :Real; Objeto: TObject)', 'Objeto');
   end;

   if Objeto is TItemNotaFiscal then  Base_calculo_icm := IP.BaseCalculoICMS
                                else  Base_calculo_icm := IM.base_icm;

   result := (ValorAtual + Base_calculo_icm);
end;

function TNotaFiscal.SomarICMS(ValorAtual: Real; Objeto: TObject): Real;
var
  IP :TItemNotaFiscal;
  IM :TItemNfMateria;
  Valor_ICM :Real;
begin
   try
     if Objeto is TItemNotaFiscal then     IP := (Objeto as TItemNotaFiscal)
                                  else     IM := (Objeto as TItemNfMateria);
   except
     on E: EInvalidCast do
       raise TExcecaoParametroInvalido.Create(self.ClassName, 'SomarICMS(ValorAtual :Real; Objeto: TObject)', 'Objeto');
   end;

   if Objeto is TItemNotaFiscal then  Valor_ICM := arredonda(IP.ValorICMS)
                                else  Valor_ICM := arredonda(IM.valor_icm);

   result := (ValorAtual + Valor_ICM);
end;

function TNotaFiscal.SomarTotalProdutos(ValorAtual: Real;
  Objeto: TObject): Real;
var
  IP :TItemNotaFiscal;
  IM :TItemNfMateria;
  Valor_bruto :Real;
begin
   try  //verifica se é entrada para então pegar matérias e não produtos
     if Objeto is TItemNotaFiscal then     IP := (Objeto as TItemNotaFiscal)
                                  else     IM := (Objeto as TItemNfMateria);
   except
     on E: EInvalidCast do
       raise TExcecaoParametroInvalido.Create(self.ClassName, 'SomarTotalProdutos(ValorAtual :Real; Objeto: TObject)', 'Objeto');
   end;

   if Objeto is TItemNotaFiscal then  Valor_bruto := IP.ValorBruto
                                else  Valor_bruto := IM.valor_bruto;

   result := (ValorAtual + Valor_bruto);
end;

function TNotaFiscal.SomarIPI(ValorAtual: Real; Objeto: TObject): Real;
var
  IP :TItemNotaFiscal;
  IM :TItemNfMateria;
  Valor_IPI :Real;
begin
   try
     if Objeto is TItemNotaFiscal then     IP := (Objeto as TItemNotaFiscal)
                                  else     IM := (Objeto as TItemNfMateria);
   except
     on E: EInvalidCast do
       raise TExcecaoParametroInvalido.Create(self.ClassName, 'SomarIPI(ValorAtual :Real; Objeto: TObject)', 'Objeto');
   end;

   if Objeto is TItemNotaFiscal then  Valor_IPI := IP.ValorIPI
                                else  Valor_IPI := IM.valor_ipi;

   result := (ValorAtual + Valor_IPI);
end;

function TNotaFiscal.SomarPIS(ValorAtual: Real; Objeto: TObject): Real;
var
  IP :TItemNotaFiscal;
  IM :TItemNfMateria;
  Valor_PIS :Real;
begin
   try
     if Objeto is TItemNotaFiscal then     IP := (Objeto as TItemNotaFiscal)
                                  else     IM := (Objeto as TItemNfMateria);
   except
     on E: EInvalidCast do
       raise TExcecaoParametroInvalido.Create(self.ClassName, 'SomarPIS(ValorAtual :Real; Objeto: TObject)', 'Objeto');
   end;

   if Objeto is TItemNotaFiscal then  Valor_PIS := IP.ValorPIS
                                else  Valor_PIS := IM.valor_pis;

   result := (ValorAtual + Valor_PIS);
end;

function TNotaFiscal.SomarCOFINS(ValorAtual: Real; Objeto: TObject): Real;
var
  IP :TItemNotaFiscal;
  IM :TItemNfMateria;
  Valor_COFINS :Real;
begin
   try
     if Objeto is TItemNotaFiscal then     IP := (Objeto as TItemNotaFiscal)
                                  else     IM := (Objeto as TItemNfMateria);
   except
     on E: EInvalidCast do
       raise TExcecaoParametroInvalido.Create(self.ClassName, 'SomarCOFINS(ValorAtual :Real; Objeto: TObject)', 'Objeto');
   end;

   if Objeto is TItemNotaFiscal then  Valor_COFINS := IP.ValorCOFINS
                                else  Valor_COFINS := IM.valor_cofins;

   result := (ValorAtual + Valor_COFINS);
end;

function TNotaFiscal.GetPercentualEmRelacaoAoTotalProdutos(
  Valor: Real): Real;
begin
   try
     result := roundTo((Valor * 100) / self.GetTotalProdutos, -2) ;
//     result := roundTo((result * self.Totais.Descontos) / 100, -2);
   except
     on E: EZeroDivide do
      result := 0;
   end;
end;

procedure TNotaFiscal.SetMetodoDelegadoBuscadorAliquotaCOFINS(
  Metodo: TMetodoDelegadoObtemCampoReal);
begin
   self.FBuscadorAliquotaCOFINS := Metodo;
end;

procedure TNotaFiscal.SetMetodoDelegadoBuscadorAliquotaICMS(
  Metodo: TMetodoDelegadoObtemCampoReal);
begin
   self.FBuscadorAliquotaICMS := Metodo;
end;

procedure TNotaFiscal.SetMetodoDelegadoBuscadorAliquotaPIS(
  Metodo: TMetodoDelegadoObtemCampoReal);
begin
   self.FBuscadorAliquotaPIS := Metodo;
end;

procedure TNotaFiscal.SetMetodoDelegadoBuscadorPercentualReducaoICMS(
  Metodo: TMetodoDelegadoObtemCampoReal);
begin
   self.FBuscadorPercentualReducaoICMS := Metodo;
end;

procedure TNotaFiscal.RemoverItens(Pedido: TPedido);
var
  ItemPedido     :TItem;
  ItemNotaFiscal :TItemNotaFiscal;
  nX, nY         :Integer;
begin
   for nX := 0 to (Pedido.Itens.Count-1) do begin
     ItemPedido := TItem(Pedido.Itens.Items[nX]);

     try
       nY := 0;

       while (self.Itens.Count > 0) do begin
          ItemNotaFiscal := (self.Itens.Items[nY] as TItemNotaFiscal);

          // Se eu encontrar um item de nota fiscal com o mesmo produto e mesma quantidade eu removo ele da lista.
          if (ItemPedido.Produto.Codigo = ItemNotaFiscal.Produto.Codigo) and
             (ItemPedido.qtd_total      = ItemNotaFiscal.Quantidade)          then begin
              self.Itens.Remove(ItemNotaFiscal);
              abort;
          end;

          // Se encontrar apenas o item com o mesmo produto então eu subtraio a quantidade
          if (ItemPedido.Produto.Codigo = ItemNotaFiscal.Produto.Codigo) then begin
              ItemNotaFiscal.SubtrairQuantidade(ItemPedido.qtd_total);
              abort;
          end;

          Inc(nY)
       end;
     except
       on E: EAbort do
        continue;
     end;
   end;

   AlterarPercentualItens;
end;

procedure TNotaFiscal.AlterarPercentualDescontoItens;
var
  nX :Integer;
  total :Real;
  diferenca :Real;
begin
  total      := 0;
  diferenca  := 0;
   for nX := 0 to (self.Itens.Count-1) do begin
      TItemNotaFiscal(self.Itens.Items[nX]).ValorDesconto := roundTo((self.GetPercentualEmRelacaoAoTotalProdutos(TItemNotaFiscal(self.Itens.Items[nX]).ValorBruto) * self.Totais.Descontos)/100, -2);
      total := total + TItemNotaFiscal(self.Itens.Items[nX]).ValorDesconto;

      if (nX = (self.Itens.Count-1)) then
        diferenca := Totais.Descontos - total;

      TItemNotaFiscal(self.Itens.Items[nX]).ValorDesconto := TItemNotaFiscal(self.Itens.Items[nX]).ValorDesconto + diferenca;
   end;

   total:=total;
end;

procedure TNotaFiscal.AlterarPercentualFreteItens;
var
  nX :Integer;
  total :Real;
  diferenca :Real;
begin
  total      := 0;
  diferenca  := 0;
   for nX := 0 to (self.Itens.Count-1) do begin
      TItemNotaFiscal(self.Itens.Items[nX]).ValorFrete := roundTo((self.GetPercentualEmRelacaoAoTotalProdutos(TItemNotaFiscal(self.Itens.Items[nX]).ValorBruto) * self.Totais.Frete)/100, -2);
//      TItemNotaFiscal(self.Itens.Items[nX]).SetPercentualFrete(self.GetPercentualEmRelacaoAoTotalProdutos(self.Totais.Frete));
      total := total + TItemNotaFiscal(self.Itens.Items[nX]).ValorFrete;

      if (nX = (self.Itens.Count-1)) then
        diferenca := Totais.Frete - total;

      TItemNotaFiscal(self.Itens.Items[nX]).ValorFrete := TItemNotaFiscal(self.Itens.Items[nX]).ValorFrete + diferenca;
   end;
end;

procedure TNotaFiscal.AlterarPercentualOutrasDespesasItens;
var
  nX :Integer;
  total :Real;
  diferenca :Real;
begin
  total      := 0;
  diferenca  := 0;
   for nX := 0 to (self.Itens.Count-1) do begin
      TItemNotaFiscal(self.Itens.Items[nX]).ValorOutrasDespesas := roundTo((self.GetPercentualEmRelacaoAoTotalProdutos(TItemNotaFiscal(self.Itens.Items[nX]).ValorBruto) * self.Totais.OutrasDespesas)/100, -2);
   //      TItemNotaFiscal(self.Itens.Items[nX]).SetPercentualOutrasDespesas(self.GetPercentualEmRelacaoAoTotalProdutos(self.Totais.OutrasDespesas));
      total := total + TItemNotaFiscal(self.Itens.Items[nX]).ValorOutrasDespesas;

      if (nX = (self.Itens.Count-1)) then
        diferenca := Totais.OutrasDespesas - total;

      TItemNotaFiscal(self.Itens.Items[nX]).ValorOutrasDespesas := TItemNotaFiscal(self.Itens.Items[nX]).ValorOutrasDespesas + diferenca;
   end;
end;

procedure TNotaFiscal.AlterarPercentualSeguroItens;
var
  nX :Integer;
  total :Real;
  diferenca :Real;
begin
  total      := 0;
  diferenca  := 0;
   for nX := 0 to (self.Itens.Count-1) do begin
      TItemNotaFiscal(self.Itens.Items[nX]).ValorSeguro := roundTo((self.GetPercentualEmRelacaoAoTotalProdutos(TItemNotaFiscal(self.Itens.Items[nX]).ValorBruto) * self.Totais.Seguro)/100, -2);
    //  TItemNotaFiscal(self.Itens.Items[nX]).SetPercentualSeguro(self.GetPercentualEmRelacaoAoTotalProdutos(self.Totais.Seguro));
      total := total + TItemNotaFiscal(self.Itens.Items[nX]).ValorSeguro;

      if (nX = (self.Itens.Count-1)) then
        diferenca := Totais.Seguro - total;

      TItemNotaFiscal(self.Itens.Items[nX]).ValorSeguro := TItemNotaFiscal(self.Itens.Items[nX]).ValorSeguro + diferenca;
   end;
end;

function TNotaFiscal.GetItens: TObjectList;
var
  Repositorio :TRepositorio;
  Esp         :TEspecificacaoItensDaNotaFiscal;
  Esp2        :TEspecificacaoItensMateriaDaNotaFiscal;
  nX          :Integer;

begin
   if not Assigned(self.FItens) then begin
      Repositorio := nil;
      Esp         := nil;

      try
          if not NotaDeMaterias then begin
            Repositorio   := TFabricaRepositorio.GetRepositorio(TItemNotaFiscal.ClassName);
            Esp           := TEspecificacaoItensDaNotaFiscal.Create(self);
            self.FItens   := Repositorio.GetListaPorEspecificacao(Esp);

            if Assigned(self.FItens) then begin
              for nX := 0 to (self.FItens.Count-1) do
                TItemNotaFiscal(self.FItens[nX]).AdicionarBuscadorCodigoNotaFiscal(self.GetCodigo);

              self.TipoFrete := self.TipoFrete;
            end;
          end
          else  begin
            Repositorio   := TFabricaRepositorio.GetRepositorio(TItemNfMateria.ClassName);
            Esp2           := TEspecificacaoItensMateriaDaNotaFiscal.Create(self);
            self.FItens   := Repositorio.GetListaPorEspecificacao(Esp2);
          end;

      finally
        if Assigned(Esp) then
          FreeAndNil(Esp)
        else
          FreeAndNil(Esp2);
        FreeAndNil(Repositorio);
      end;
   end;

   result := self.FItens;
end;

procedure TNotaFiscal.AlterarPercentualItens;
begin
   self.AlterarPercentualFreteItens;
   self.AlterarPercentualSeguroItens;
   self.AlterarPercentualDescontoItens;
   self.AlterarPercentualOutrasDespesasItens;
end;

function TNotaFiscal.GetObservacoes: TObservacaoNotaFiscal;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FObservacoes) then begin
      Repositorio := nil;

      try
          Repositorio       := TFabricaRepositorio.GetRepositorio(TObservacaoNotaFiscal.ClassName);
          self.FObservacoes := (Repositorio.Get(self.FCodigoNotaFiscal) as TObservacaoNotaFiscal);

        if Assigned(self.FObservacoes) then begin
          self.FObservacoes.AdicionarBuscadorDeCodigoNotaFiscal(self.GetCodigo);
          self.FObservacoes.AdicionarBuscadorDeRegimeTributarioDestinatario(self.GetRegimeTributario);
          self.FObservacoes.AdicionarBuscadorDeAliquotaCreditoSN(self.FBuscadorAliquotaCreditoSN);
          self.FObservacoes.AdicionarBuscadorDeValorCreditoSN(Self.GetValorCreditoSN);
          self.FObservacoes.AdicionarBuscadorEnderecoEntrega(self.GetEnderecoEntrega);
        end;
      finally
        FreeAndNil(Repositorio);
      end;
   end;

   result := self.FObservacoes;
end;

function TNotaFiscal.GetRegimeTributario: Integer;
begin
   try
     result := TTipoRegimeTributarioUtilitario.DeEnumeradoParaInteger(self.Empresa.RegimeTributario);
   except
     on E: EAccessViolation do
      raise EAccessViolation.Create('Erro em: GetRegimeTributario: Integer'+#13+'FEmitente não está instânciado!');
   end;
end;

function TNotaFiscal.GetEnderecoEntrega: String;
begin
   try
      self.FLocalEntrega.ValidarCamposObrigatorios();
      result := self.FLocalEntrega.ToString;
   except
     result := ''
   end;
end;

function TNotaFiscal.GetValorCreditoSN: Real;
begin
   result := SomarCampoEspecificoReal(self.SomarValorCreditoSN);
end;

function TNotaFiscal.SomarValorCreditoSN(ValorAtual: Real;
  Objeto: TObject): Real;
var
  I :TItemNotaFiscal;
begin
   try
     I := (Objeto as TItemNotaFiscal);
   except
     on E: EInvalidCast do
       raise TExcecaoParametroInvalido.Create(self.ClassName, 'SomarValorCreditoSN(ValorAtual: Real;', 'Objeto');
   end;

   if Assigned(I.IcmsSn101) then
     result := (ValorAtual + I.IcmsSn101.ValorCreditoSN);
end;

procedure TNotaFiscal.AlterarObservacoes(Obs: String);
begin
   self.Observacoes.Observacoes := Obs;

   if Assigned(self.FAposAtualizarNotaFiscal) then
    self.FAposAtualizarNotaFiscal(self);
end;

function TNotaFiscal.GetLocalEntrega: TLocalEntregaNotaFiscal;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FLocalEntrega) then begin
      Repositorio := nil;

      try
          Repositorio        := TFabricaRepositorio.GetRepositorio(TLocalEntregaNotaFiscal.ClassName);
          self.FLocalEntrega := (Repositorio.Get(self.FCodigoNotaFiscal) as TLocalEntregaNotaFiscal);

          if not Assigned(self.FLocalEntrega) then
            self.FLocalEntrega := TLocalEntregaNotaFiscal.Create;

          try
            self.FLocalEntrega.AdicionarBuscadorNotaFiscal(self.GetCodigo);
            self.FLocalEntrega.AdicionarAposAtualizarLocalEntrega(self.AtualizarNotaFiscal);
          except
            on E: EAccessViolation do begin
              result := nil;
              exit;
            end;
          end;
      finally
        FreeAndNil(Repositorio);
      end;
   end;

   result := self.FLocalEntrega;
end;

procedure TNotaFiscal.AtualizarNotaFiscal(Sender: TObject);
begin
   if Assigned(self.FAposAtualizarNotaFiscal) then
    self.FAposAtualizarNotaFiscal(self);
end;

procedure TNotaFiscal.SetNumeroNotaFiscal(const Value: Integer);
begin
  FNumeroNotaFiscal := Value;
end;

constructor TNotaFiscal.CriarParaRepositorio(CodigoNotaFiscal: Integer;
  NumeroNotaFiscal, CodigoNatureza: Integer; TipoSerie: String;
  CodigoEmitente, CodigoDestinatario, CodigoFormaPagamento: Integer;
  DataEmissao, DataSaida: TDateTime; CodigoTransportadora,
  TipoFrete: Integer; Entrada_saida, finalidade, Nfe_referenciada :String);
begin
   self.FCodigoNotaFiscal           := CodigoNotaFiscal;
   self.FNumeroNotaFiscal           := NumeroNotaFiscal;
   self.FCodigoNatureza             := CodigoNatureza;
   self.FSerie                      := TipoSerie;
   self.FCodigoEmitente             := CodigoEmitente;
   self.FCodigoDestinatario         := CodigoDestinatario;
   self.FCodigoFormaPagamento       := CodigoFormaPagamento;
   self.FDataEmissao                := DataEmissao;
   self.FDataSaida                  := DataSaida;
   self.FCodigoTransportadora       := CodigoTransportadora;
   self.FTipoFrete                  := TTipoFreteUtilitario.DeInteiroParaEnumerado(TipoFrete);
   self.FEntrada_saida              := Entrada_saida;
   self.FFinalidade                 := Finalidade;
   self.FNFe_referenciada           := NFe_referenciada;
   self.FItens                      := nil;
   self.FFormaPagamento             := nil;
   self.FPedidosFaturados           := nil;
   self.FTransportadora             := nil;
   self.FVolumes                    := nil;
   self.FTotais                     := nil;
   self.FLote                       := nil;
   self.FNFe                        := nil;
   self.FEmpresa                    := nil;
   self.FItensAvulsos               := nil;
   SELF.FObservacoes                := nil;//TObservacaoNotaFiscal.Create;
end;

function TNotaFiscal.GetTipoStatusNotaFiscal: TTipoStatusNotaFiscal;
begin
   if not Assigned(NFe) or not Assigned(NFe.Retorno) then begin

     if (self.Entrada_saida = 'E') and (self.NotaDeMaterias) then
       result := snfAutorizada
     else
       result := snfAguardandoEnvio;

     exit;
   end;

   if      (self.NFe.Retorno.Status = '100') then
    result := snfAutorizada
   else if ((self.NFe.Retorno.Status = '101') or (self.NFe.Retorno.Status = '135')) then
    result := snfCancelada
   else
    result := snfRejeitada;
end;

procedure TNotaFiscal.RecalcularNotaFiscal;
var
  ListaPedidos   :TObjectList;
  Repositorio    :TRepositorio;
  PedidoFaturado :TPedidoFaturado;
  Pedido         :TPedido;
  nX             :Integer;
  Obs            :String;
  DtEmi          :TDateTime;
  DtSai          :TDateTime;
  CodFpagto      :Integer;
  CodTransp      :Integer;
  TpFrete        :TTipoFrete;
  Aux            :TMetodoDelegadoAposAtualizarNotaFiscal;
begin
   if not Assigned(self.PedidosFaturados) or (self.PedidosFaturados.Count <= 0) then
    exit;

   ListaPedidos := TObjectList.Create;
   Repositorio  := nil;

   Aux                           := self.FAposAtualizarNotaFiscal;
   self.FAposAtualizarNotaFiscal := nil;

   try
      Repositorio := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);

      for nX := 0 to (self.PedidosFaturados.Count-1) do begin
          PedidoFaturado := (self.PedidosFaturados[nX] as TPedidoFaturado);

          Pedido := (Repositorio.Get(PedidoFaturado.CodigoPedido) as TPedido);

          if Assigned(Pedido) then
            ListaPedidos.Add(Pedido);
      end;

      DtEmi     := self.FDataEmissao;
      DtSai     := self.FDataSaida;

      CodFpagto := self.FormaPagamento.Codigo;
      CodTransp := self.Transportadora.Codigo;
      Obs       := self.Observacoes.Observacoes;

      TpFrete   := self.TipoFrete;

      for nX := 0 to (ListaPedidos.Count-1) do
        self.RemoverPedido(TPedido(ListaPedidos[nX]));

      for nX := 0 to (ListaPedidos.Count-1) do
        self.AdicionarPedido(TPedido(ListaPedidos[nX]));

        self.FAposAtualizarNotaFiscal := Aux;

      self.DataEmissao             := DtEmi;
      self.DataSaida               := DtSai;

      FCodigoFormaPagamento        := CodFpagto;
      FCodigoTransportadora        := CodTransp;

      if Assigned(self.FFormaPagamento) then begin
         self.FLCriouFormaPagamento := false;
         FreeAndNil(self.FFormaPagamento);
      end;

      if Assigned(self.FTransportadora) then begin
       self.FLCriouTransportadora := false;
       FreeAndNil(self.FTransportadora);
      end;

      self.Transportadora;
      self.FormaPagamento;

      self.Observacoes.Observacoes := Obs;
        
      self.TipoFrete               := TpFrete;

   finally
       FreeAndNil(ListaPedidos);
       FreeAndNil(Repositorio);
   end;
end;

procedure TNotaFiscal.CriaLoteEnvio;
begin
   // Caso for uma nota rejeitada não há necessidade de criar um novo lote
   if Assigned(self.Lote) then
    exit;

   self.FLote := TLoteNFe.CriaLoteEmProcessamento(self.FCodigoNotaFiscal);
end;

function TNotaFiscal.GetLoteNFe: TLoteNFe;
var
  Repositorio   :TRepositorio;
  Especificacao :TEspecificacaoLoteNFePorCodigoNotaFiscal;
begin
   if not Assigned(self.FLote) then begin
      Repositorio   := nil;
      Especificacao := nil;

      try
         Repositorio      := TFabricaRepositorio.GetRepositorio(TLoteNFe.ClassName);
         Especificacao    := TEspecificacaoLoteNFePorCodigoNotaFiscal.Create(self.FCodigoNotaFiscal);

         self.FLote       := (Repositorio.GetPorEspecificacao(Especificacao) as TLoteNFe);
      finally
        FreeAndNil(Especificacao);
        FreeAndNil(Repositorio);
      end;
   end;

   result := self.FLote;
end;

procedure TNotaFiscal.AdicionarRetornoLote(Status, Motivo, Recibo: String);
begin
   self.FLote.AdicionarRetornoLote(Status, Motivo, Recibo);
end;

function TNotaFiscal.GetNFe: TNFe;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FNFe) then begin
      Repositorio := nil;

      try
         Repositorio  := TFabricaRepositorio.GetRepositorio(TNFe.ClassName);
         self.FNFe    := (Repositorio.Get(self.FCodigoNotaFiscal) as TNFe);
      finally
        FreeAndNil(Repositorio);
      end;
   end;

   result := self.FNFe;
end;

procedure TNotaFiscal.AdicionarChaveAcesso(const ChaveAcesso, XML: String);
begin
   FreeAndNil(self.FNFe);
   self.FNFe := TNFe.Create(self.FCodigoNotaFiscal, ChaveAcesso, XML);
end;

procedure TNotaFiscal.AdicionarRetornoNFe(Status, Motivo :String);
begin
   self.FNFe.AdicionarRetorno(Status, Motivo); 
end;

function TNotaFiscal.GetChaveAcesso: String;
begin
   try
      result := self.NFe.ChaveAcesso;
   except
     on E: EAccessViolation do
      result := '';
   end;
end;

procedure TNotaFiscal.RecarregarNFe;
begin
   FreeAndNil(self.FNFe);

   self.NFe;
end;

function TNotaFiscal.GetEmpresa: TEmpresa;
var
  Repositorio            :TRepositorio;
  EmpresaPorCodigoPessoa :TEspecificacao;
  codigo_pessoa          :integer;
begin

   if not Assigned(self.FEmpresa) then begin
     Repositorio := nil;
     EmpresaPorCodigoPessoa := nil;

     if self.Destinatario.Tipo = 'E' then         { Se o destinatario for a propria empresa é nota de entrada }
       codigo_pessoa := self.Destinatario.Codigo
     else                                         { Se for nota de Saída }
       codigo_pessoa := self.Emitente.Codigo;

     try
       EmpresaPorCodigoPessoa := TEspecificacaoEmpresaPorCodigoPessoa.Create(codigo_pessoa);
       Repositorio            := TFabricaRepositorio.GetRepositorio(TEmpresa.ClassName);
       self.FEmpresa          := (Repositorio.GetPorEspecificacao(EmpresaPorCodigoPessoa) as TEmpresa);

     finally
       FreeAndNil(EmpresaPorCodigoPessoa);
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FEmpresa;
end;

procedure TNotaFiscal.LimparPedidosFaturados;
begin
   FreeAndNil(self.FPedidosFaturados);
end;

function TNotaFiscal.GetItensAvulsos: TObjectList;
var
  Repositorio    :TRepositorio;
begin
   if not Assigned(self.FItensAvulsos) then begin
     Repositorio   := nil;

     try
       Repositorio        := TFabricaRepositorio.GetRepositorio(TItemAvulso.ClassName);
       self.FItensAvulsos := Repositorio.GetListaPorIdentificador(self.FCodigoNotaFiscal);
     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FItensAvulsos;
end;

procedure TNotaFiscal.AdicionarItemAvulso(ItemAvulso: TItemAvulso);
var
  ItAvul :TObject;
begin
   { Verifico se o item está instânciado }
   if not Assigned(ItemAvulso) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, 'AdicionarItemAvulso(ItemAvulso: TItemAvulso);', 'ItemAvulso');

   { Se o item avulso já foi adicionado então ele é substituído. Portanto, aqui eu removo o antigo }
   if self.ItemAvulsoJaAdicionado(ItemAvulso.Produto.Codigo, ItemAvulso.Cor.Codigo) then begin
     ItAvul := self.ObtemItemAvulso(ItemAvulso.Produto.Codigo, ItemAvulso.Cor.Codigo);
     self.FItensAvulsos.Remove(ItAvul);
   end;

   if (ItemAvulso.ValorTotal <= 0) then begin
     raise Exception.Create('Valor total do item está zerado. Verifique!');
   end;

   ItemAvulso.AdicionarBuscadorCodigoNotaFiscal(self.GetCodigo);

   if not Assigned(self.FItensAvulsos) then
    self.FItensAvulsos := TObjectList.Create;

   self.FItensAvulsos.Add(ItemAvulso);

   self.SomarItemAvulsoAosTotais(ItemAvulso);
   self.AdicionarItem(ItemAvulso);
//
   // Aqui é para os outros campos como totais de frete, produto e etc. Que são alterados em cada inserção de pedido.
   if Assigned(self.FAposAtualizarNotaFiscal) then
    self.FAposAtualizarNotaFiscal(self);
end;

function TNotaFiscal.ItemAvulsoJaAdicionado(const CodigoProduto,
  CodigoCor: Integer): Boolean;
var
  ItemAvulso :TObject;
begin
   ItemAvulso := self.ObtemItemAvulso(CodigoProduto, CodigoCor);
   result     := (ItemAvulso <> nil);
end;

function TNotaFiscal.ObtemItemAvulso(const CodigoProduto,
  CodigoCor: Integer): TObject;
var
  nX :Integer;
begin
   result := nil;

   if not Assigned(self.FItensAvulsos) then
    exit;

   for nX := 0 to (self.FItensAvulsos.Count-1) do begin
      if (CodigoProduto = TItemAvulso(self.FItensAvulsos.Items[nX]).Produto.Codigo) and
         (CodigoCor     = TItemAvulso(self.FItensAvulsos.Items[nX]).Cor.Codigo)     then begin
        result := self.FItensAvulsos.Items[nX];
        exit;
      end;
   end;
end;

procedure TNotaFiscal.SomarItemAvulsoAosTotais(ItemAvulso: TItemAvulso);
begin
//   self.FTotais.SomarFreteAoTotal(Pedido.Frete);
//   self.FTotais.SomarSeguroAoTotal(Pedido.Seguro);
  self.Totais.SomarDescontoAoTotal      (ItemAvulso.ValorDesconto);
  self.Totais.SomarOutrasDespesasAoTotal(0);

//   self.FVolumes.SomarQuantidadeAoTotal();
  self.Volumes.SomarPesoLiquidoAoTotal(ItemAvulso.ValorTotal);
  self.Volumes.SomarPesoBrutoAoTotal  (ItemAvulso.ValorBruto);
end;

procedure TNotaFiscal.AdicionarItem(ItemAvulso: TItemAvulso);
var
  ItemNotaFiscal :TItemNotaFiscal;
  nX, nY         :Integer;
begin
   try
     for nY := 0 to (self.Itens.Count-1) do begin

        ItemNotaFiscal := (self.Itens.Items[nY] as TItemNotaFiscal);

        // Se eu encontrar um item de nota fiscal com o mesmo produto do item avulso então eu só somo as quantidades
        if (ItemAvulso.Produto.Codigo = ItemNotaFiscal.Produto.Codigo) then begin
            ItemNotaFiscal.SomarQuantidade(ItemAvulso.QuantidadeTotal);

            abort;
        end;
     end;

     // Se chegar aqui é porque não foi encontrado nenhum item com o mesmo produto
     if      (TEmpresa(self.FEmitente).RegimeTributario = trtSimplesNacional) then begin
       try
         ItemNotaFiscal := TItemNotaFiscal.CriaSimplesNacional(ItemAvulso.Produto,
                                                               self.Natureza,
                                                               ItemAvulso.QuantidadeTotal,
                                                               ItemAvulso.Preco,
                                                               tomNacional,
                                                               self.FBuscadorAliquotaCreditoSN);

       except
         on E: EAccessViolation do
           raise EAccessViolation.Create('Erro em: TNotaFiscal.AdicionarItens(ItemAvulso :TItemAvulso). '+
                                         'self.FBuscadorAliquotaCreditoSN não foi instânciado!'  );
       end;
     end
     else if (TEmpresa(self.FEmitente).RegimeTributario = trtLucroPresumido) then begin
       try
         ItemNotaFiscal := TItemNotaFiscal.CriaLucroPresumido(ItemAvulso.Produto,
                                                              self.Natureza,
                                                              ItemAvulso.QuantidadeTotal,
                                                              ItemAvulso.Preco,
                                                              tomNacional,
                                                              self.FBuscadorAliquotaICMS,
                                                              0,
                                                              self.FBuscadorAliquotaPIS,
                                                              self.FBuscadorAliquotaCOFINS,
                                                              self.FBuscadorPercentualReducaoICMS);
       except
         on E: EAccessViolation do
           raise EAccessViolation.Create('Erro em: TNotaFiscal.AdicionarItens(ItemAvulso: TItemAvulso). '+
                                         'Algum buscador de alíquota não foi instânciado não foi instânciado!'  );
       end;
     end;

     ItemNotaFiscal.AdicionarBuscadorCodigoNotaFiscal(self.GetCodigo);
     self.Itens.Add(ItemNotaFiscal);
   except
     on E: EAbort do
      { Nothing }
   end;

   AlterarPercentualItens;
end;

procedure TNotaFiscal.RemoverItemAvulso(ItemAvulso: TItemAvulso);
var
  ItemAvulsoObject :TObject;
begin
   { Verifico se o item avulso está instânciado }
   if not Assigned(ItemAvulso) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, 'AdicionaPedido(ItemAvulso: TItemAvulso)', 'ItemAvulso');

   { Se a lista de itens avulsos estiver nula ou este item avulso não estiver adicionado então sai do método }
   if not self.ItemAvulsoJaAdicionado(ItemAvulso.Produto.Codigo, ItemAvulso.Cor.Codigo) then
     exit;

   ItemAvulsoObject := self.ObtemItemAvulso(ItemAvulso.Produto.Codigo, ItemAvulso.Cor.Codigo);

   self.FItensAvulsos.Remove(ItemAvulsoObject);

   // Aqui é para os outros campos como totais de frete, produto e etc. Que são alterados em cada inserção de pedido.
   self.SubtrairItemAvulsoDosTotais(ItemAvulso);
//   self.RemoverItens(Pedido);                    *
//   self.RemoverItem(ItemAvulso);

   if (not Assigned(self.FItens)) or (self.FItens.Count = 0) then begin
     self.LimparCabecalho();

     if Assigned(self.FAposRemoverUltimoPedido) then
       self.FAposRemoverUltimoPedido(self);
   end;

   if Assigned(self.FAposAtualizarNotaFiscal) then
     self.FAposAtualizarNotaFiscal(self);
end;

procedure TNotaFiscal.SubtrairItemAvulsoDosTotais(ItemAvulso: TItemAvulso);
begin
//   self.FTotais.SubtrairFreteDoTotal(Pedido.Frete);
//   self.FTotais.SubtrairSeguroDoTotal(Pedido.Seguro);
  self.Totais.SubtrairDescontoDoTotal      (ItemAvulso.ValorDesconto);
  self.Totais.SubtrairOutrasDespesasDoTotal(0);

//   self.FVolumes.SubtrairQuantidadeDoTotal();
  self.Volumes.SubtrairPesoLiquidoDoTotal(ItemAvulso.ValorTotal);
  self.Volumes.SubtrairPesoBrutoDoTotal  (ItemAvulso.ValorBruto);
end;

procedure TNotaFiscal.ValidarDadosObrigatorios;
begin
   if not (self.Entrada_saida = 'E') then
     if not Assigned(self.FFormaPagamento) then
        raise TExcecaoCampoNaoInformado.Create('Forma de Pagamento');

   if not Assigned(self.FTransportadora) then
      raise TExcecaoCampoNaoInformado.Create('Transportadora');

   if not(self.Finalidade = '1') and (self.NFe_referenciada = '') then
      raise TExcecaoCampoNaoInformado.Create('NF-e referenciada');
end;

procedure TNotaFiscal.SetTotais(const Value: TTotaisNotaFiscal);
begin
  FTotais := Value;
end;

procedure TNotaFiscal.SetEntrada_saida(const Value: String);
begin
  FEntrada_saida := Value;
end;

procedure TNotaFiscal.SetNotaDeMaterias(const Value: Boolean);
begin
  FNotaDeMaterias := Value;
end;

function TNotaFiscal.GetNotaDeMaterias: Boolean;
var rep :TRepositorio;
begin
  rep := nil;
  rep := TFabricaRepositorio.GetRepositorio(TItemNfMateria.ClassName);
  result := rep.GetExiste(['codigo_nota_fiscal'], [self.CodigoNotaFiscal]);

  FreeAndNil(rep);
end;

procedure TNotaFiscal.SetFinalidade(const Value: String);
begin
  self.FFinalidade := value;
end;

procedure TNotaFiscal.SetNFe_referenciada(const Value: String);
begin
  self.FNFe_referenciada := value;
end;

function TNotaFiscal.GetNotaDeReducao: Boolean;
begin
  result := (Emitente.Endereco.Cidade.codest = Destinatario.Endereco.Cidade.codest)
        and (Emitente.Endereco.Cidade.estado.sigla = 'PR')
        and (length(Destinatario.CPF_CNPJ) > 11)
        and (Destinatario.RG_IE <> 'ISENTO');
end;

function TNotaFiscal.GetNotaDeServico: Boolean;
begin
  result := false;

  if self.Itens[0] is TItemNotaFiscal then
    result := (TItemNotaFiscal(Itens[0]).NaturezaOperacao.CFOP = '2124') or (TItemNotaFiscal(Itens[0]).NaturezaOperacao.CFOP = '2125')
  else if self.Itens[0] is TItemNfMateria then
    result := (TItemNfMateria(Itens[0]).NaturezaOperacao.CFOP = '2124') or (TItemNfMateria(Itens[0]).NaturezaOperacao.CFOP = '2125');
end;

function TNotaFiscal.GetAliquotaInterEstadual: Real;
begin
  if Pos(self.Destinatario.Endereco.Cidade.estado.sigla, 'SC RS MG SP RJ') > 0 then
     Result  := 12
  else
     Result  := 7;
end;

function TNotaFiscal.GetAliquotaInterna :Real;
var estado :variant;
    Especificacao :TEspecificacaoAliqInternaPorCodigoEstado;
    AliqInterna :TAliqInternaIcms;
    repositorio :TRepositorio;
begin
  estado := retorna_estado(0, self.Destinatario.Endereco.Cidade.estado.sigla);

  try

    Especificacao := TEspecificacaoAliqInternaPorCodigoEstado.Create(estado);
    repositorio   := TFabricaRepositorio.GetRepositorio(TAliqInternaIcms.ClassName);
    AliqInterna   := TAliqInternaIcms(repositorio.GetPorEspecificacao(Especificacao));

    result := AliqInterna.aliquota;
  finally
    FreeAndNil(repositorio);
    FreeAndNil(Especificacao);
  end;
end;

function TNotaFiscal.GetAliqPartilhaDestinatario: Real;
begin
  case AnsiIndexStr(formatDateTime('yyyy', date), ['2016', '2017','2018']) of
    0 : result := 40;
    1 : result := 60;
    2 : result := 80;
    else
        result := 100;
  end;
end;

function TNotaFiscal.SomarICMSFCP(ValorAtual: Real; Objeto: TObject): Real;
var
  IP :TItemNotaFiscal;
  Valor_ICMFCP :Real;
begin
   try
   {  if Objeto is TItemNotaFiscal then  }   IP := (Objeto as TItemNotaFiscal);
                                 { else     IM := (Objeto as TItemNfMateria);  }
   except
     on E: EInvalidCast do
       raise TExcecaoParametroInvalido.Create(self.ClassName, 'SomarICMSFCP(ValorAtual :Real; Objeto: TObject)', 'Objeto');
   end;

   {if Objeto is TItemNotaFiscal then  }Valor_ICMFCP := (SELF.AliquotaFCP * ip.ValorTotalItem) /100;
                                {else  Valor_ICMFCP := arredonda(IM.valor_icm); }

   result := (ValorAtual + Valor_ICMFCP);
end;

function TNotaFiscal.GetAliqFCP: Real;
begin
  Result := 0;//IfThen(Pos(self.Destinatario.Endereco.Cidade.estado.sigla ,'RJSP') > 0, 1, 0);
end;

function TNotaFiscal.GetCalculaIcmsCompartilhado: Boolean;
begin
  result := (self.Entrada_saida <> 'E') and (self.Destinatario.Endereco.Cidade.estado.sigla <> self.Emitente.Endereco.Cidade.estado.sigla) and (length(self.Destinatario.CPF_CNPJ) < 14);
end;

function TNotaFiscal.GetICMSFCP: Real;
begin
  if self.CalculaIcmsCompartilhado then
    result := self.SomarCampoEspecificoReal(self.SomarICMSFCP)
  else
    result := 0;  
end;

function TNotaFiscal.SomarICMSUFDest(ValorAtual: Real;
  Objeto: TObject): Real;
var
  IP :TItemNotaFiscal;
  Valor_ICMSUFDest :Real;
begin
   try
     IP := (Objeto as TItemNotaFiscal);

   except                                                   
     on E: EInvalidCast do
       raise TExcecaoParametroInvalido.Create(self.ClassName, 'SomarICMSUFDest(ValorAtual :Real; Objeto: TObject)', 'Objeto');
   end;

   Valor_ICMSUFDest := RoundTo( ((SELF.AliquotaInterna - self.AliquotaInterestadual + self.AliquotaFCP) * ip.ValorTotalItem) /100, -2);
   Valor_ICMSUFDest := RoundTo((self.AliquotaPartilhaDestinatario * Valor_ICMSUFDest) / 100, -2);

   result := (ValorAtual + Valor_ICMSUFDest);

end;

function TNotaFiscal.SomarICMSUFRemet(ValorAtual: Real;
  Objeto: TObject): Real;
var
  IP :TItemNotaFiscal;
  Valor_ICMSUFRemet :Real;
begin
   try
     IP := (Objeto as TItemNotaFiscal);

   except
     on E: EInvalidCast do
       raise TExcecaoParametroInvalido.Create(self.ClassName, 'SomarICMSUFRemet(ValorAtual :Real; Objeto: TObject)', 'Objeto');
   end;

   Valor_ICMSUFRemet := RoundTo( ((SELF.AliquotaInterna - self.AliquotaInterestadual  + self.AliquotaFCP) * ip.ValorTotalItem) /100, -2);
   Valor_ICMSUFRemet := RoundTo(((100 - self.AliquotaPartilhaDestinatario) * Valor_ICMSUFRemet) / 100, -2);

   result := (ValorAtual + Valor_ICMSUFRemet);

end;

function TNotaFiscal.GetICMSUFDest: Real;
begin
  if self.CalculaIcmsCompartilhado then
    result := self.SomarCampoEspecificoReal(self.SomarICMSUFDest)
  else
    result := 0;
end;

function TNotaFiscal.GetICMSUFRemet: Real;
begin
  if self.CalculaIcmsCompartilhado then
    result := self.SomarCampoEspecificoReal(self.SomarICMSUFRemet)
  else
    result := 0;
end;

end.
