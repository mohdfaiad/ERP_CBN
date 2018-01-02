unit uInicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, xpman, jpeg, ExtCtrls, Menus, Buttons,
  frameBotaoImg, ImgList, pngimage, frameBuscaCidade, math, Firedac.Comp.Client,
  ServicoVerificadorSistemaEmManutencao, uImpressaoEtiquetasCoppel, uEntradaNota,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, ShellAPI, AppEvnts, contnrs,
  RLReport, System.ImageList, System.StrUtils, DBGridCBN, RLPreviewForm, RLFilters, RLPDFFilter;

type
  TfrmInicial = class(TfrmPadrao)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Perfisdeacesso1: TMenuItem;
    Usurios1: TMenuItem;
    labTerminal: TLabel;
    LabUsuarioLogado: TLabel;
    Label7: TLabel;
    labPerfilUsuario: TLabel;
    ImageList1: TImageList;
    Label3: TLabel;
    labVersaoSistema: TLabel;
    ImageLogoCbn: TImage;
    Clientes1: TMenuItem;
    Image1: TImage;
    Image4: TImage;
    Utilitrios1: TMenuItem;
    GerarCdigodeBarras1: TMenuItem;
    Representantes1: TMenuItem;
    Fornecedores1: TMenuItem;
    abelasdePreo1: TMenuItem;
    Cores1: TMenuItem;
    amanhos1: TMenuItem;
    Grades1: TMenuItem;
    FormasdePagamento1: TMenuItem;
    Produtos1: TMenuItem;
    ransportadoras1: TMenuItem;
    mnuManutencaoSistema: TMenuItem;
    mnuBackup: TMenuItem;
    mnuEmpresa: TMenuItem;
    Pedido1: TMenuItem;
    PedidodeVenda1: TMenuItem;
    AlterarPedidodeVenda1: TMenuItem;
    lblTempoRestanteParaManutencao: TLabel;
    NaturezasdeOperao1: TMenuItem;
    Label5: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    mnuConfiguracoesNotaFiscal: TMenuItem;
    ImpressoEtiquetasLCoppel1: TMenuItem;
    subMnuNotaFiscal: TMenuItem;
    N1: TMenuItem;
    mnuFaturamentoPedidos: TMenuItem;
    btnTeste: TSpeedButton;
    mnuMonitorControlNFe: TMenuItem;
    ImpressoEtiquetasCaixa1: TMenuItem;
    Image2: TImage;
    Relatrios1: TMenuItem;
    Pedidos1: TMenuItem;
    ParaProduo1: TMenuItem;
    mnuCodigoBarras: TMenuItem;
    Matrias1: TMenuItem;
    PessoasCadastradas1: TMenuItem;
    CFOPsCorrespondentes1: TMenuItem;
    N2Compras1: TMenuItem;
    EntradaNota1: TMenuItem;
    Button1: TButton;
    NotasFiscais1: TMenuItem;
    Entrada1: TMenuItem;
    Referncias1: TMenuItem;
    Gerararquivomagntico1: TMenuItem;
    GerarArquivoMagntico2: TMenuItem;
    GerarEFDContribuies1: TMenuItem;
    GerarEFDFiscal1: TMenuItem;
    Contadores1: TMenuItem;
    GerarEFDFiscal2: TMenuItem;
    Expedicao1: TMenuItem;
    Venda1: TMenuItem;
    labVersaoBD: TLabel;
    Image3: TImage;
    s: TImage;
    Shape1: TShape;
    MapadeReferncias1: TMenuItem;
    Representantes2: TMenuItem;
    ClientesporRepresentante1: TMenuItem;
    ComissoRepresentantes1: TMenuItem;
    RaioXRepresentante2: TMenuItem;
    EntradaManualEstoque1: TMenuItem;
    VisualizaComissoRepresentante1: TMenuItem;
    Produtos2: TMenuItem;
    TotalizaEstoque1: TMenuItem;
    TotalizarVendas1: TMenuItem;
    ConfPedido1: TMenuItem;
    VendasSemTotais1: TMenuItem;
    ImprimirRomaneio1: TMenuItem;
    SadaManualEstoque1: TMenuItem;
    PrevisodeEstoque1: TMenuItem;
    Colees1: TMenuItem;
    Intervalosdeproduo1: TMenuItem;
    Entradas1: TMenuItem;
    Contasapagar1: TMenuItem;
    ContasaPAgar2: TMenuItem;
    Confernciaproduo1: TMenuItem;
    Clientes2: TMenuItem;
    PedidoseNotas1: TMenuItem;
    PedidoConsumidorFinal1: TMenuItem;
    ransfernciaEstoque1: TMenuItem;
    Contasbancrias1: TMenuItem;
    ImportadorOS1: TMenuItem;
    CaixaLoja1: TMenuItem;
    Loja1: TMenuItem;
    Caixa2: TMenuItem;
    Pedidos2: TMenuItem;
    abeladePreos1: TMenuItem;
    Grupos1: TMenuItem;
    Cidades1: TMenuItem;
    NCMs1: TMenuItem;
    Parcelamento1: TMenuItem;
    FechaComissoEcommerce1: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    Mapas1: TMenuItem;
    RLPDFFilter1: TRLPDFFilter;
    RLPreviewSetup1: TRLPreviewSetup;
    Image5: TImage;
    EntradaManualEstoqueMatria1: TMenuItem;
    SadaManualEstoqueMatria1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Matrias2: TMenuItem;
    Relatrioentradaesada1: TMenuItem;
    Estoque1: TMenuItem;
    BotaoImg2: TBotaoImg;
    BotaoImg1: TBotaoImg;
    BotaoImg3: TBotaoImg;
    BotaoImg4: TBotaoImg;
    BotaoImg5: TBotaoImg;
    ImageList2: TImageList;
    BotaoImg6: TBotaoImg;
    ConfiguraesEcommerce1: TMenuItem;
    Ecommerce1: TMenuItem;
    ImportadorTricae1: TMenuItem;
    Sincronizadorprodutosshoppub1: TMenuItem;
    timerLogErros: TTimer;
    shpErro: TShape;
    lbDescErro: TLabel;
    btnVerificar: TBitBtn;
    lbTituloErro: TLabel;
    lbErros: TLabel;
    EmAberto1: TMenuItem;
    tmrVerificaPedidosEmAberto: TTimer;
    procedure Perfisdeacesso1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure BotaoImg1Label1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Clientes1Click(Sender: TObject);
    procedure GerarCdigodeBarras1Click(Sender: TObject);
    procedure Representantes1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure abelasdePreo1Click(Sender: TObject);
    procedure Cores1Click(Sender: TObject);
    procedure amanhos1Click(Sender: TObject);
    procedure Grades1Click(Sender: TObject);
    procedure FormasdePagamento1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure ransportadoras1Click(Sender: TObject);
    procedure mnuManutencaoSistemaClick(Sender: TObject);
    procedure mnuBackupClick(Sender: TObject);
    procedure mnuEmpresaClick(Sender: TObject);
    procedure PedidodeVenda1Click(Sender: TObject);
    procedure AlterarPedidodeVenda1Click(Sender: TObject);
    procedure BotaoImg2Label1Click(Sender: TObject);
    procedure NaturezasdeOperao1Click(Sender: TObject);
    procedure mnuConfiguracoesNotaFiscalClick(Sender: TObject);
    procedure ImpressoEtiquetasLCoppel1Click(Sender: TObject);
    procedure mnuFaturamentoPedidosClick(Sender: TObject);
    procedure mnuMonitorControlNFeClick(Sender: TObject);
    procedure ImpressoEtiquetasPicorrucho1Click(Sender: TObject);
    procedure btnTesteClick(Sender: TObject);
    procedure ImpressoEtiquetasCaixa1Click(Sender: TObject);
    procedure ParaProduo1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Matrias1Click(Sender: TObject);
    procedure PessoasCadastradas1Click(Sender: TObject);
    procedure CFOPsCorrespondentes1Click(Sender: TObject);
    procedure EntradaNota1Click(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure Referncias1Click(Sender: TObject);
    procedure GerarArquivoMagntico2Click(Sender: TObject);
    procedure GerarEFDContribuies1Click(Sender: TObject);
    procedure Contadores1Click(Sender: TObject);
    procedure GerarEFDFiscal2Click(Sender: TObject);
    procedure Confernciadopedido1Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BotaoImg3Label1Click(Sender: TObject);
    procedure MapadeReferncias1Click(Sender: TObject);
    procedure RaioXRepresentante2Click(Sender: TObject);
    procedure ComissoRepresentantes1Click(Sender: TObject);
    procedure ClientesporRepresentante1Click(Sender: TObject);
    procedure EntradaManualEstoque1Click(Sender: TObject);
    procedure VisualizaComissoRepresentante1Click(Sender: TObject);
    procedure TotalizaEstoque1Click(Sender: TObject);
    procedure BotaoImg4Label1Click(Sender: TObject);
    procedure VendasSemTotaisClick(Sender: TObject);
    procedure ImprimirRomaneio1Click(Sender: TObject);
    procedure SadaManualEstoque1Click(Sender: TObject);
    procedure PrevisodeEstoque1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Colees1Click(Sender: TObject);
    procedure Intervalosdeproduo1Click(Sender: TObject);
    procedure Entradas1Click(Sender: TObject);
    procedure Contasapagar1Click(Sender: TObject);
    procedure BotaoImg5Label1Click(Sender: TObject);
    procedure ContasaPAgar2Click(Sender: TObject);
    procedure Confernciaproduo1Click(Sender: TObject);
    procedure PedidoseNotas1Click(Sender: TObject);
    procedure PedidoConsumidorFinal1Click(Sender: TObject);
    procedure ransfernciaEstoque1Click(Sender: TObject);
    procedure Contasbancrias1Click(Sender: TObject);
    procedure BotaoImg6Label1Click(Sender: TObject);
    procedure ImportadorOS1Click(Sender: TObject);
    procedure CaixaLoja1Click(Sender: TObject);
    procedure Caixa2Click(Sender: TObject);
    procedure Pedidos2Click(Sender: TObject);
    procedure abeladePreos1Click(Sender: TObject);
    procedure Grupos1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure NCMs1Click(Sender: TObject);
    procedure Parcelamento1Click(Sender: TObject);
    procedure FechaComissoEcommerce1Click(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure Mapas1Click(Sender: TObject);
    procedure RLPreviewSetup1Send(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EntradaManualEstoqueMatria1Click(Sender: TObject);
    procedure SadaManualEstoqueMatria1Click(Sender: TObject);
    procedure Relatrioentradaesada1Click(Sender: TObject);
    procedure Estoque1Click(Sender: TObject);
    procedure ConfiguraesEcommerce1Click(Sender: TObject);
    procedure ImportadorTricae1Click(Sender: TObject);
    procedure Sincronizadorprodutosshoppub1Click(Sender: TObject);
    procedure timerLogErrosTimer(Sender: TObject);
    procedure btnVerificarClick(Sender: TObject);
    procedure EmAberto1Click(Sender: TObject);
    procedure tmrVerificaPedidosEmAbertoTimer(Sender: TObject);

  private
    FVerificadorManutencao :TServicoVerificadorSistemaEmManutencao;
    caminho :String;

    procedure AtualizaBancoDeDados;
    procedure FinalizarSistemaParaManutencao;
    procedure MostraAvisar(Aviso :String; const TempoParaJanelaFechar :Integer = 0);
    procedure HabilitaContagemRegressiva;
    procedure DesabilitaContagemRegressiva;
    procedure MostraTempoRestante(TempoRestante :String);
    procedure efetuaDebitosDoDia;
    procedure verificarErros;
    procedure iniciaVErificadorErroImportacao(temPermissao :Boolean);

  public
    constructor Create(AOwner :TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmInicial: TfrmInicial;

implementation

uses
  RLConsts,
  uCadastroPerfilAcesso,
  uCadastroUsuario,
  uBackup,
  uCadastroCliente,
  uModulo,
  Repositorio,
  FabricaRepositorio,
  ManutencaoSistema,
  ServicoAtualizadorBD,
  uScriptsDeAtualizacao,
  uManutencaoSistema,
  uImpressaoEtiquetas,
  uImpressaoEtiquetasPicorrucho,
  uCadastroRepresentante,
  uCadastroFornecedor,
  uCadastroTabelaPreco,
  uCadastroCores,
  uCadastroTamanho,
  uCadastroGrade,
  uCadastroFormasPagamento,
  uCadastroProduto,
  uCadastroTransportadora,
  uCadastroEmpresa,
  uCadastroNaturezaOperacao,
  uFaturamentoPedidos,
  uPedido,
  PermissoesAcesso,
  uConfiguracoesNF,
  uMonitorControleNFe,
  uImpressaoEtiquetaCaixa,
  uRelatorioPedidosProducao,
  uCadastroMateria,
  uRelatorioVendas,
  uCadastroCfopCorrespondente,
  uRelatorioRaioXRepresentante,
  uRelatorioNotaEntrada,
  uRelatorioClientes,
  uRelatorioReferencias, LogErroImportPedido,
  uFechaComissaoRepresentante, uSincronizaProdutoEcommerce,
  uSintegra, uParcelamento, uErrosImportacaoPedido,
  uEFDContribuicoes, uCadastroGrupo,
  uCadastroContador, uImportadorOrdemServico, uPedidosEmAberto,
  uEFDFiscal, uCadastroContasBanco, uCaixa, uCadastroCidade, uCadastroNCM, uRelatorioMaterias,
  uRelatorioNotasFiscaisVenda, uSupervisor, Usuario, uConferenciaPedido, uEntradaManualMateria,
  uAtalhoCadastros, uRelatorioMapaReferencias, uEntradaManualEstoque, uCadastroMapaPedidos, uCadastroConfiguracoesECommerce,
  uRelatorioComissoesRepresentantes, uRelatorioPrevisaoEstoque, uRelatorioTabelasPreco, uRelatorioEstoqueMateria,
  uRelatorioTotalizarEstoque, uContasPagar, uRelatorioMovimentos, uRelatorioCaixa, uFechaComissaoECommerce,
  uBuscarRomaneio, uCadastroColecao, uCadastroIntervaloProducao, uRelatorioEntradas, uImportadadorClientesTricae,
  uCadastroPadrao, uRelatorioContasPagar, uVisualizaPedidosNfes, uPedidoConsumidorFinal, uTransferenciaEstoque, uDevolucao,
  uGeraArquivoMeusPedidos;

{$R *.dfm}

procedure TfrmInicial.Perfisdeacesso1Click(Sender: TObject);
begin
  try
    self.AbreForm(TFrmCadastroPerfilAcesso, paCadastroPerfil);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.FormShow(Sender: TObject);
var ServicoDeAtualizacaoBD :TServicoAtualizadorBD;
begin
  inherited;
  Screen.Cursors[crSQLWait]:= Screen.Cursors[crDefault];
  labVersaoSistema.Caption  := intToStr(ServicoDeAtualizacaoBD.versaoSistema);
  labVersaoBD.Caption       := intToStr(dm.Parametros.VersaoBancoDeDados);
  labTerminal.Caption       := FDM.NomeDoTerminal;
  LabUsuarioLogado.Caption  := INTTOSTR(Fdm.UsuarioLogado.Codigo) + ' - ' +Fdm.UsuarioLogado.Nome;
  labPerfilUsuario.Caption  := IntToStr(FDM.UsuarioLogado.CodPerfil) + ' - ' + FDM.UsuarioLogado.Perfil.Nome;

  frmAtalhoCadastros         := TfrmAtalhoCadastros.Create(self);
  frmAtalhoCadastros.Show;
  frmAtalhoCadastros.Visible := false;
  self.WindowState           := wsMaximized;

  labVersaoBD.Left := label5.Left + 99;
  labVersaoBD.Top  := label5.Top;

  efetuaDebitosDoDia;
  iniciaVerificadorErroImportacao(TPermissoesAcesso.VerificaPermissao(paVerificaErrosImportacaoPedido,'',false));
end;

procedure TfrmInicial.Usurios1Click(Sender: TObject);
begin
  try
     self.AbreForm(TFrmCadastroUsuario, paCadastroUsuario);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.btnVerificarClick(Sender: TObject);
begin
  try
     self.AbreForm(TfrmErrosImportacaoPedido, paVerificaErrosImportacaoPedido);
     verificarErros;
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.BotaoImg1Label1Click(Sender: TObject);
begin
  SELF.Clientes1Click(nil);
end;

procedure TfrmInicial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then begin
    key := 0;

    self.Close();
  end;

  inherited;
end;

procedure TfrmInicial.Clientes1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroCliente, paCadastroCliente);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

constructor TfrmInicial.Create(AOwner: TComponent);
begin
  inherited;

  self.AtualizaBancoDeDados;
  self.FVerificadorManutencao := TServicoVerificadorSistemaEmManutencao.Create(
                                                                               self.FinalizarSistemaParaManutencao,
                                                                               self.MostraAvisar,
                                                                               self.HabilitaContagemRegressiva,
                                                                               self.MostraTempoRestante,
                                                                               self.DesabilitaContagemRegressiva);
end;

procedure TfrmInicial.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  i: SmallInt;
begin
  if Msg.message = WM_MOUSEWHEEL then
  begin
    Msg.message := WM_KEYDOWN;
    Msg.lParam  := 0;

    i := HiWord(Msg.wParam) ;
    if i > 0 then
      Msg.wParam := VK_UP
    else
      Msg.wParam := VK_DOWN;
    Handled := False;
 end;
end;

procedure TfrmInicial.AtualizaBancoDeDados;
var
  RepositorioManutencao  :TRepositorio;
  Manutencao             :TManutencaoSistema;
  ServicoDeAtualizacaoBD :TServicoAtualizadorBD;
  ScriptsDeAtualizacao   :TfrmScriptsDeAtualizacao;
begin
   RepositorioManutencao  := TFabricaRepositorio.GetRepositorio(TManutencaoSistema.ClassName);
   Manutencao             := TManutencaoSistema(RepositorioManutencao.Get(0)); //Esse zero é migué
   ServicoDeAtualizacaoBD := nil;
   ScriptsDeAtualizacao   := TfrmScriptsDeAtualizacao.Create(nil);

   try
      try
        ServicoDeAtualizacaoBD := TServicoAtualizadorBD.Create(ScriptsDeAtualizacao, FDM, Manutencao);
        ServicoDeAtualizacaoBD.ExecutaAtualizacoes;
      except
        on E: Exception do begin
          Fdm.LogErros.AdicionaErro('uInicial', E.ClassName, E.Message);
          inherited Avisar(E.Message);
          self.Fdm.FechaConexaoBancoDeDados;
          Halt;
        end;
      end;
   finally
     if Assigned(ScriptsDeAtualizacao) then begin
       ScriptsDeAtualizacao.Release;
       ScriptsDeAtualizacao := nil; 
     end;

     FreeAndNil(ServicoDeAtualizacaoBD);
     FreeAndNil(Manutencao);
     FreeAndNil(RepositorioManutencao);
   end;
end;

procedure TfrmInicial.MostraAvisar(Aviso :String; const TempoParaJanelaFechar :Integer = 0);
begin
   inherited Avisar(Aviso, TempoParaJanelaFechar);
end;

destructor TfrmInicial.Destroy;
begin
  if Assigned(self.FVerificadorManutencao) then
    FreeAndNil(self.FVerificadorManutencao);

  inherited;
end;

procedure TfrmInicial.efetuaDebitosDoDia;
begin
  dm.qryGenerica.SQL.Text := 'execute procedure efetua_debito(:data_corrente)';
  dm.qryGenerica.ParamByName('data_corrente').AsDate := Date;
  dm.qryGenerica.ExecSQL;
end;

procedure TfrmInicial.HabilitaContagemRegressiva;
begin
   self.lblTempoRestanteParaManutencao.Visible := true;
end;

procedure TfrmInicial.MostraTempoRestante(TempoRestante: String);
begin
   self.lblTempoRestanteParaManutencao.Caption := 'Tempo restante para iniciar a manutenção: '+TempoRestante;
end;

procedure TfrmInicial.FechaComissoEcommerce1Click(Sender: TObject);
begin
   self.AbreForm(TfrmFechaComissaoECommerce, paFechaComissaoECommerce);
end;

procedure TfrmInicial.FinalizarSistemaParaManutencao;
begin
   FDM.FechaConexaoBancoDeDados;
   Halt;
end;

procedure TfrmInicial.DesabilitaContagemRegressiva;
begin
   self.lblTempoRestanteParaManutencao.Visible := false;
end;

procedure TfrmInicial.GerarCdigodeBarras1Click(Sender: TObject);
begin
  try
     self.AbreForm(TFrmImpressaoEtiquetas, paImprimirCodigoBarras);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.Representantes1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroRepresentante, paCadastroRepresentante);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.RLPreviewSetup1Send(Sender: TObject);
begin
  inherited;
  if Sender is TRLReport then
    avisar('teste');
end;

procedure TfrmInicial.Fornecedores1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroFornecedor, paCadastroFornecedor);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.abeladePreos1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmRelatorioTabelasPreco, paRelatorioTabelaPrecos);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.abelasdePreo1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroTabelaPreco, paCadastroTabelapreco);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.Cores1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroCores, paCadastroCor);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.amanhos1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroTamanho, paCadastroTamanho);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.Grades1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroGrade, paCadastroGrade);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.Grupos1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroGrupo, paCadastroGrupo);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.FormasdePagamento1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroFormasPagamento, paCadastroFormaPagamento);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.Produtos1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroProduto, paCadastroProduto);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.ransfernciaEstoque1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmTransferenciaEstoque, paTransferenciaEstoque);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.ransportadoras1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroTransportadora, paCadastroTransportadora);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.mnuManutencaoSistemaClick(Sender: TObject);
begin
  try
     self.AbreForm(TfrmManutencaoSistema, paManutencaoSistema);
  except
    on e : Exception do
      begin
        Avisar( e.Message );
      end;
  end;
end;

procedure TfrmInicial.mnuBackupClick(Sender: TObject);
begin
  try
     self.AbreForm(TfrmBackup, paBackup);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.mnuEmpresaClick(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroEmpresa, paCadastroEmpresa);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.PedidoConsumidorFinal1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmPedidoConsumidorFinal, paPedidoConsumidorFinal);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.PedidodeVenda1Click(Sender: TObject);
begin
  try
    if TPermissoesAcesso.VerificaPermissao(paCriarPedido, 'Usuário sem permissão para criar Pedidos!', false) then begin
      frmPedido := TfrmPedido.Create(self);
      frmPedido.Tag := 0; //criação de pedido
      frmPedido.Caption := 'Criação de Pedido de Venda';
      frmPedido.ShowModal;
      frmPedido.Release;
      frmPedido := nil;
    end;
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.Pedidos2Click(Sender: TObject);
begin
  self.AbreForm(TFrmRelatorioMovimentos, paRelatorioMovimentos);
end;

procedure TfrmInicial.PedidoseNotas1Click(Sender: TObject);
begin
  self.AbreForm(TfrmVisualizaPedidosNfes, paVisualizaPeididosNFes);
end;

procedure TfrmInicial.AlterarPedidodeVenda1Click(Sender: TObject);
begin
  try
    if TPermissoesAcesso.VerificaPermissao(paAlterarPedido, 'Usuário sem permissão para alterar Pedidos!', true) then begin
      frmPedido := TfrmPedido.Create(self);
      frmPedido.Tag := 1; //alteração de pedido
      frmPedido.Caption := 'Alteração de Pedido de Venda';
      frmPedido.ShowModal;
      frmPedido.Release;
      frmPedido := nil;
    end;
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;

end;

procedure TfrmInicial.BotaoImg2Label1Click(Sender: TObject);
begin
  self.PedidodeVenda1Click(nil);
end;

procedure TfrmInicial.NaturezasdeOperao1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroNaturezaOperacao, paCadastroNaturezaOperacao);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.NCMs1Click(Sender: TObject);
begin
  self.AbreForm(TfrmCadastroNCM, paCadastroNCM);
end;

procedure TfrmInicial.mnuConfiguracoesNotaFiscalClick(Sender: TObject);
begin
  self.AbreForm(TfrmConfiguracoesNF, paTelaConfiguracaoNotaFiscal);
end;

procedure TfrmInicial.ImpressoEtiquetasLCoppel1Click(Sender: TObject);
begin
  self.AbreForm(TfrmImpressaoEtiquetasCoppel, paImpressaoEtiquetasCoppel);
end;

procedure TfrmInicial.mnuFaturamentoPedidosClick(Sender: TObject);
begin
   self.AbreForm(TfrmFaturamentoPedidos, paTelaFaturamento);
end;

procedure TfrmInicial.mnuMonitorControlNFeClick(Sender: TObject);
begin
   self.AbreForm(TfrmMonitorControleNFe, paTelaMonitorControleNFe);
end;

procedure TfrmInicial.ImpressoEtiquetasPicorrucho1Click(Sender: TObject);
begin
  self.AbreForm(TfrmImpressaoEtiquetasPicorrucho, paImpressaoEtiquetasPicorrucho);
end;

procedure TfrmInicial.btnTesteClick(Sender: TObject);
//var
//  Repositorio :TRepositorio;
//  NotaFiscal  :TNotaFiscal;
//  Fatura      :TFatura;
//  GerFin      :TGeradorFinanceiro;
//  nx          :Integer;
//  TotalDup    :Real;
begin
  inherited;

//  Repositorio := nil;
//  NotaFiscal  := nil;
//  Fatura      := nil;
//  GerFin      := nil;
//  TotalDup    := 0;
//
//
//  try
//    Repositorio := TFabricaRepositorio.GetRepositorio(TN otaFiscal.ClassName);
//    NotaFiscal  := (Repositorio.Get(3) as TNotaFiscal);
//    GerFin      := TGeradorFinanceiro.Create;
//    Fatura      := GerFin.GerarFatura(NotaFiscal);
//
//    for nX := 0 to (Fatura.Duplicatas.Count-1) do  begin
//       TotalDup := (TotalDup + (TDuplicata(Fatura.Duplicatas[nX]).ValorDuplicata));
//    end;
//
//    if (TotalDup = NotaFiscal.Totais.TotalNF) then
//      inherited Avisar('DEU CERTO!');
//
//  finally
//    FreeAndNil(Repositorio);
//    FreeAndNil(Fatura);
//    FreeAndNil(NotaFiscal);
//    FreeAndNil(GerFin);
//  end;
end;

procedure TfrmInicial.ImpressoEtiquetasCaixa1Click(Sender: TObject);
begin
  if not TPermissoesAcesso.VerificaPermissao(paImpressaoEtiquetasCaixa, 'Usuário sem permissão para acessar esta funcionalidade!', false) then
    Exit;
  frmImpressaoEtiquetaCaixa            := TfrmImpressaoEtiquetaCaixa.Create(self);
  frmImpressaoEtiquetaCaixa.digitar    := true;
  frmImpressaoEtiquetaCaixa.ShowModal;
  frmImpressaoEtiquetaCaixa.Release;
end;

procedure TfrmInicial.ParaProduo1Click(Sender: TObject);
begin
  self.AbreForm(TfrmRelatorioPedidosProducao, paRelatorioPedidosProducao);
end;

procedure TfrmInicial.Parcelamento1Click(Sender: TObject);
begin
  self.AbreForm(TfrmParcelamento, paParcelamento);
end;

procedure TfrmInicial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not Confirma('Deseja sair do sistema?') then
     Action := caNone;

//  frmAtalhoCadastros.Release;
end;

procedure TfrmInicial.FormCreate(Sender: TObject);
begin
  inherited;
  self.DoubleBuffered := true;
end;

procedure TfrmInicial.Matrias1Click(Sender: TObject);
begin
  self.AbreForm(TfrmCadastroMateria, paCadastroMateria);
end;

procedure TfrmInicial.PessoasCadastradas1Click(Sender: TObject);
begin
  if not TPermissoesAcesso.VerificaPermissao(paRelatorioVendas, 'Usuário sem permissão para acessar esta funcionalidade!', False) then
    Exit;
  frmRelatorioVendas := TfrmRelatorioVendas.Create(Self);
  frmRelatorioVendas.RelatorioSemValores:= False;
  frmRelatorioVendas.ShowModal;
  frmRelatorioVendas.Release;
end;

procedure TfrmInicial.Caixa2Click(Sender: TObject);
begin
    self.AbreForm(TfrmRelatorioCaixa, paTelaCaixaLoja);
end;

procedure TfrmInicial.CaixaLoja1Click(Sender: TObject);
begin
  self.AbreForm(TFrmCaixa, paTelaCaixaLoja);
end;

procedure TfrmInicial.CFOPsCorrespondentes1Click(Sender: TObject);
begin
  self.AbreForm(TFrmCadastroCfopCorrespondente, paCadastroCFOPCorrespondente);
end;

procedure TfrmInicial.Cidades1Click(Sender: TObject);
begin
  self.AbreForm(TfrmCadastroCidade, paCadastroCidade);
end;

procedure TfrmInicial.EntradaNota1Click(Sender: TObject);
begin
  self.AbreForm(TFrmEntradaNota, paImportarXML);
end;

procedure TfrmInicial.EmAberto1Click(Sender: TObject);
begin
  self.AbreForm(TFrmPedidosEmAberto, paRelatorioPedidosEmAberto);
end;

procedure TfrmInicial.Entrada1Click(Sender: TObject);
begin
  self.AbreForm(TFrmRelatorioNotaEntrada, paRelatorioNotasFiscaisEntrada);
end;

procedure TfrmInicial.Referncias1Click(Sender: TObject);
begin
  self.AbreForm(TfrmRelatorioReferencias, paRelatorioReferencias);
end;

procedure TfrmInicial.Relatrioentradaesada1Click(Sender: TObject);
begin
  self.AbreForm(TfrmRelatorioMaterias, paRelatorioEntradaSaidaMateria);
end;

procedure TfrmInicial.GerarArquivoMagntico2Click(Sender: TObject);
begin
  self.AbreForm(TfrmSintegra, paGeracaoSintegra);
end;

procedure TfrmInicial.GerarEFDContribuies1Click(Sender: TObject);
begin
  self.AbreForm(TfrmEFDContribuicoes, paGeracaoEFDContribuicoes);
end;

procedure TfrmInicial.Contadores1Click(Sender: TObject);
begin
  self.AbreForm(TfrmCadastroContador, paCadastroContador);
end;

procedure TfrmInicial.GerarEFDFiscal2Click(Sender: TObject);
begin
  self.AbreForm(TfrmEFDFiscal, paGeracaoEFDFiscal);
end;

procedure TfrmInicial.Confernciadopedido1Click(Sender: TObject);
var usuario :TUsuario;
begin
  usuario := dm.UsuarioLogado;

  try
    frmSupervisor := TfrmSupervisor.Create(self);

    frmSupervisor.Label1.Caption := 'Login';
    frmSupervisor.Label4.Caption := 'Para acessar a tela de Conferência do Pedido';
    frmSupervisor.Label5.Caption := 'informe seu login e senha:';

    if frmSupervisor.ShowModal = mrOk then begin
      dm.UsuarioLogado := frmSupervisor.usu;

      self.AbreForm( TfrmConferenciaPedido, paConferenciaPedido);
    end;

  finally
    dm.UsuarioLogado := usuario;
    frmSupervisor.Release;
    frmSupervisor := nil;  
  end;  
end;

procedure TfrmInicial.Confernciaproduo1Click(Sender: TObject);
begin
  frmConferenciaPedido := TfrmConferenciaPedido.Create(nil);
  frmConferenciaPedido.visualizarConferencia := true;
  frmConferenciaPedido.ShowModal;
  frmConferenciaPedido.Release;
  frmConferenciaPedido := nil;
end;

procedure TfrmInicial.ConfiguraesEcommerce1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroConfiguracoesECommerce, paCadastroConfiguracoesEcommerce);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.Venda1Click(Sender: TObject);
begin
   self.AbreForm( TfrmRelatorioNotasFiscaisVenda, paRelatorioNotasVenda);
end;

procedure TfrmInicial.FormActivate(Sender: TObject);
begin
  inherited;
  if StrToIntDef(labVersaoSistema.Caption,0) < StrToIntDef(labVersaoBD.Caption,0) then begin
    avisar('Seu sistema encontra-se desatualizado.'+#13#10+#13#10+'Após o sistema fechar, execute o arquivo de atualização '+#13#10+
           'ou entre contato com o suporte técnico, (43)3534-2350.');
    Application.Terminate;
  end;
end;

procedure TfrmInicial.BotaoImg3Label1Click(Sender: TObject);
begin
  Confernciadopedido1Click(nil);
end;

procedure TfrmInicial.MapadeReferncias1Click(Sender: TObject);
begin
  inherited;
  self.AbreForm(TfrmRelatorioMapaReferencias, paRelatorioMapaReferencias);
end;

procedure TfrmInicial.Mapas1Click(Sender: TObject);
begin
   self.AbreForm(TFrmCadastroMapaPedidos, paCadastroMapaPedidos);
end;

procedure TfrmInicial.RaioXRepresentante2Click(Sender: TObject);
begin
   self.AbreForm(TFrmRelatorioRaioXRepresentante, paRaioXRepresentante);
end;

procedure TfrmInicial.ComissoRepresentantes1Click(Sender: TObject);
begin
   self.AbreForm(TfrmFechaComissaoRepresentante, paFechaComissaoRepresentante);
end;

procedure TfrmInicial.ClientesporRepresentante1Click(Sender: TObject);
begin
  self.AbreForm(TfrmRelatorioClientes, paRelatorioClientes);
end;

procedure TfrmInicial.EntradaManualEstoque1Click(Sender: TObject);
begin
  if not TPermissoesAcesso.VerificaPermissao(paEntradaManualEstoque, 'Usuário sem permissão para acessar esta funcionalidade!', False) then
    Exit;
  frmEntradaManualEstoque:= TfrmEntradaManualEstoque.Create(Self);
  frmEntradaManualEstoque.entrada_saida := 0;
  frmEntradaManualEstoque.ShowModal;
  frmEntradaManualEstoque.Release;
end;
  
procedure TfrmInicial.EntradaManualEstoqueMatria1Click(Sender: TObject);
begin
  if not TPermissoesAcesso.VerificaPermissao(paEntradaManualMateria, 'Usuário sem permissão para acessar esta funcionalidade!', False) then
    Exit;
  frmEntradaManualMateria:= TfrmEntradaManualMateria.Create(Self, 0);
  frmEntradaManualMateria.ShowModal;
  frmEntradaManualMateria.Release;
end;

procedure TfrmInicial.VisualizaComissoRepresentante1Click(Sender: TObject);
begin
  self.AbreForm(TfrmRelatorioComissoesRepresentantes, paEntradaManualEstoque);
end;

procedure TfrmInicial.TotalizaEstoque1Click(Sender: TObject);
begin
  inherited;
  self.AbreForm(TfrmRelatorioTotalizarEstoque, paRelatorioTotalizarEstoque);
end;

procedure TfrmInicial.BotaoImg4Label1Click(Sender: TObject);
begin
  inherited;
  self.TotalizaEstoque1Click(nil);
end;

procedure TfrmInicial.VendasSemTotaisClick(Sender: TObject);
begin
  inherited;
  if not TPermissoesAcesso.VerificaPermissao(paRelatorioPedidosNaoFaturados, 'Usuário sem permissão para acessar esta funcionalidade!', False) then
    Exit;
  frmRelatorioVendas := TfrmRelatorioVendas.Create(Self);
  frmRelatorioVendas.RelatorioSemValores:= True;
  frmRelatorioVendas.ShowModal;
  frmRelatorioVendas.Release;
end;

procedure TfrmInicial.verificarErros;
var qry :TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := dm.conexao;
    qry.Close;
    qry.SQL.Text := 'SELECT COUNT(CODIGO) QTD FROM LOG_ERROS_IMPORT_PEDIDOS'+
                    ' WHERE VERIFICADO = ''N''                         ';
    qry.Open();

    lbErros.Caption      := qry.FieldByName('QTD').AsString;
    btnVerificar.Enabled := qry.FieldByName('QTD').AsInteger > 0;
  finally
    FreeAndNil(qry);
  end;
end;

procedure TfrmInicial.ImprimirRomaneio1Click(Sender: TObject);
begin
  inherited;
  if not TPermissoesAcesso.VerificaPermissao(paBuscaImprimirRomaneio, 'Usuário sem permissão para acessar esta funcionalidade!', False) then
    Exit;
  frmBuscarRomaneio:= TfrmBuscarRomaneio.Create(Self);
  frmBuscarRomaneio.ShowModal;
  frmBuscarRomaneio.Release;
end;

procedure TfrmInicial.iniciaVerificadorErroImportacao(temPermissao :Boolean);
begin
  shpErro.Visible       := temPermissao;
  lbTituloErro.Visible  := temPermissao;
  lbDescErro.Visible    := temPermissao;
  lbErros.Visible       := temPermissao;
  btnVerificar.Visible  := temPermissao;
  //fixo em 5min
  if temPermissao then
  begin
    timerLogErros.Enabled := true;
    timerLogErrosTimer(nil);
  end;
end;

procedure TfrmInicial.SadaManualEstoque1Click(Sender: TObject);
begin
  if not TPermissoesAcesso.VerificaPermissao(paSaidaManualEstoque, 'Usuário sem permissão para acessar esta funcionalidade!', False) then
    Exit;
  frmEntradaManualEstoque:= TfrmEntradaManualEstoque.Create(Self);
  frmEntradaManualEstoque.entrada_saida := 1;
  frmEntradaManualEstoque.ShowModal;
  frmEntradaManualEstoque.Release;
end;

procedure TfrmInicial.SadaManualEstoqueMatria1Click(Sender: TObject);
begin
  if not TPermissoesAcesso.VerificaPermissao(paSaídaManualMateria, 'Usuário sem permissão para acessar esta funcionalidade!', False) then
    Exit;
  frmEntradaManualMateria:= TfrmEntradaManualMateria.Create(Self, 1);
  frmEntradaManualMateria.ShowModal;
  frmEntradaManualMateria.Release;
end;

procedure TfrmInicial.Sincronizadorprodutosshoppub1Click(Sender: TObject);
begin
  inherited;
  self.AbreForm(TfrmSincronizaProdutoEcommerce, paSincronizaProdutosShoppub);
end;

procedure TfrmInicial.timerLogErrosTimer(Sender: TObject);
begin
  verificarErros;
end;

procedure TfrmInicial.tmrVerificaPedidosEmAbertoTimer(Sender: TObject);
begin
  tmrVerificaPedidosEmAberto.Enabled := false;
  if TPermissoesAcesso.VerificaPermissao(paRelatorioPedidosEmAberto) then
    EmAberto1Click(nil);
end;

procedure TfrmInicial.PrevisodeEstoque1Click(Sender: TObject);
begin
  self.AbreForm(TfrmRelatorioPrevisaoEstoque, paRelatorioPrevisaoEstoque);
end;

procedure TfrmInicial.Button1Click(Sender: TObject);
begin
  frmGeraArquivoMeusPedidos := TfrmGeraArquivoMeusPedidos.Create(nil);
  frmGeraArquivoMeusPedidos.ShowModal;
  frmGeraArquivoMeusPedidos.Release;
  frmGeraArquivoMeusPedidos := nil;
end;
      {
Initialization
  RLConsts.SetVersion(3,72,'B'); }

procedure TfrmInicial.Colees1Click(Sender: TObject);
begin
  self.AbreForm(TfrmCadastroColecao, paCadastroColecao);
end;

procedure TfrmInicial.Intervalosdeproduo1Click(Sender: TObject);
begin
  self.AbreForm(TfrmCadastroIntervaloProducao, paCadastroIntervaloProducao);
end;

procedure TfrmInicial.Entradas1Click(Sender: TObject);
begin
  self.AbreForm(TfrmRelatorioEntradas, paRelatorioEntradas);
end;

procedure TfrmInicial.Estoque1Click(Sender: TObject);
begin
  self.AbreForm(TFrmRelatorioEstoqueMateria, paRelatorioEstoqueMateria);
end;

procedure TfrmInicial.ImportadorOS1Click(Sender: TObject);
begin
  try
    self.AbreForm(TfrmImportadorOrdemServico, paImportadorOrdensServico);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.ImportadorTricae1Click(Sender: TObject);
begin
  self.AbreForm(TfrmImportadadorClientesTricae, paImportadorClientesTricae);
end;

procedure TfrmInicial.Contasapagar1Click(Sender: TObject);
begin
  try
    self.AbreForm(TfrmContasPagar, paContasPagar);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.BotaoImg5Label1Click(Sender: TObject);
begin
  Contasapagar1Click(nil);
end;

procedure TfrmInicial.BotaoImg6Label1Click(Sender: TObject);
begin
  PedidoConsumidorFinal1Click(nil);
end;

procedure TfrmInicial.ContasaPAgar2Click(Sender: TObject);
begin
  try
    self.AbreForm(TfrmRelatorioContasPagar, paRelatorioContasPagar);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmInicial.Contasbancrias1Click(Sender: TObject);
begin
  try
    self.AbreForm(TfrmCadastroContasBanco, paCadastroContasBanco);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

end.


