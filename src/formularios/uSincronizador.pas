unit uSincronizador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.ComCtrls, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  DBGridCBN, Datasnap.DBClient, System.Contnrs, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Data.Win.ADODB, frameBuscaRepresentante, Pedido, Item, Vcl.WinXCtrls;

type TSincronizacao = (sincProdutos, sincTabelasPreco, sincTabelasDoProduto, sincClientes, sincCliPorUsu, sincTransportadoras, sincFormasPagamento, sincPedidos);

type
  TfrmSincronizador = class(TfrmPadrao)
    pgcPrincipal: TPageControl;
    Produtos: TTabSheet;
    pgcProdutos: TPageControl;
    tsListaProd: TTabSheet;
    gridProdutos: TDBGridCBN;
    gridCores: TDBGridCBN;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    btnSepararProdutos: TBitBtn;
    btnEnviarProdutos: TBitBtn;
    qryCores: TFDQuery;
    qryProdutos: TFDQuery;
    dsCores: TDataSource;
    dsProdutos: TDataSource;
    qryCoresCODIGO: TIntegerField;
    qryCoresREFERENCIA: TStringField;
    qryCoresCOR: TStringField;
    qryCoresSELECIONADO: TStringField;
    Label1: TLabel;
    edtCoresSelecionadas: TCurrencyEdit;
    Shape1: TShape;
    cdsProdutos: TClientDataSet;
    cdsCores: TClientDataSet;
    cdsProdutosCODIGO: TIntegerField;
    cdsProdutosDESCRICAO: TStringField;
    cdsProdutosREFERENCIA: TStringField;
    dsPro: TDataSource;
    dsCor: TDataSource;
    cdsCoresCODIGO: TIntegerField;
    cdsCoresCOR: TStringField;
    cdsCoresCODIGO_PRODUTO: TIntegerField;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid2: TDBGrid;
    gridProdutosSeparados: TDBGrid;
    Shape2: TShape;
    edtProdutosSeparados: TCurrencyEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    qryProdutosCODIGO: TIntegerField;
    qryProdutosDESCRICAO: TStringField;
    qryProdutosCOD_NCM: TIntegerField;
    qryProdutosCOD_TIPO: TIntegerField;
    qryProdutosCOD_GRUPO: TIntegerField;
    qryProdutosCOD_COLECAO: TIntegerField;
    qryProdutosCOD_GRADE: TIntegerField;
    qryProdutosLINHA_ANO: TStringField;
    qryProdutosATIVO: TStringField;
    qryProdutosPRECO_CUSTO: TBCDField;
    qryProdutosPRECO_VENDA: TBCDField;
    qryProdutosPRECO_ATACADO: TBCDField;
    qryProdutosPRECO_MEDIO: TBCDField;
    qryProdutosESTOQUE_FIS: TBCDField;
    qryProdutosESTOQUE_MIN: TBCDField;
    qryProdutosPESO_LIQ: TBCDField;
    qryProdutosPESO_BRU: TBCDField;
    qryProdutosQTD_PECAS: TIntegerField;
    qryProdutosREFERENCIA: TStringField;
    qryProdutosTIPO: TStringField;
    qryProdutosUNIDADE_MEDIDA: TStringField;
    qryProdutosKIT: TStringField;
    qryProdutosCODIGO_IBPT: TIntegerField;
    qryProdutosDESC_TIPO_COR: TStringField;
    qryProdutosDESCRICAO_COMPLETA: TStringField;
    TabSheet2: TTabSheet;
    memLogProdutos: TMemo;
    Timer1: TTimer;
    cdsProdutosENVIOU: TStringField;
    Shape3: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    Label9: TLabel;
    qryProdutosID_EXTERNO: TStringField;
    btnLimpaListaProdutos: TBitBtn;
    cdsProdutosUNIDADE: TStringField;
    cdsProdutosCOD_GRADE: TIntegerField;
    cdsProdutosCOD_NCM: TStringField;
    cdsProdutosID_EXTERNO: TStringField;
    cdsTabelas: TClientDataSet;
    dsTab: TDataSource;
    qryTabelas: TFDQuery;
    dsTabelas: TDataSource;
    cdsTabelasCODIGO: TIntegerField;
    TabSheet3: TTabSheet;
    Splitter2: TSplitter;
    pgcTabelas: TPageControl;
    tsListaTabelas: TTabSheet;
    DBGridCBN1: TDBGridCBN;
    Panel3: TPanel;
    Shape7: TShape;
    Label15: TLabel;
    btnSepararTabelas: TBitBtn;
    Shape8: TShape;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Panel4: TPanel;
    Shape9: TShape;
    Label19: TLabel;
    Label20: TLabel;
    Shape10: TShape;
    btnEnviarTabelas: TBitBtn;
    btnLimpaListaTabelas: TBitBtn;
    DBGrid3: TDBGrid;
    edtTabelasSeparadas: TCurrencyEdit;
    TabSheet5: TTabSheet;
    memLogTabelas: TMemo;
    qryTabelasCODIGO: TIntegerField;
    qryTabelasDESCRICAO: TStringField;
    cdsTabelasDESCRICAO: TStringField;
    cdsTabelasID_EXTERNO: TStringField;
    cdsTabelasENVIOU: TStringField;
    TabSheet6: TTabSheet;
    Splitter3: TSplitter;
    pgcTabelasProduto: TPageControl;
    tsListaTabProduto: TTabSheet;
    Shape6: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBGridCBN2: TDBGridCBN;
    DBGridCBN3: TDBGridCBN;
    Panel5: TPanel;
    Shape11: TShape;
    Label13: TLabel;
    btnSepararTabelaProd: TBitBtn;
    edtTabelasSelecionadas: TCurrencyEdit;
    Shape12: TShape;
    Label14: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Panel6: TPanel;
    Shape13: TShape;
    Label23: TLabel;
    Label24: TLabel;
    Shape14: TShape;
    btnEnviarTabelasProduto: TBitBtn;
    btnLimpaListaTabelasProduto: TBitBtn;
    DBGrid4: TDBGrid;
    edtTabProdutoSeparadas: TCurrencyEdit;
    TabSheet8: TTabSheet;
    memLogTabelaProduto: TMemo;
    qryProd: TFDQuery;
    dsProd: TDataSource;
    qryProdTab: TFDQuery;
    dsProdTab: TDataSource;
    cdsProdTab: TClientDataSet;
    dsProdTab2: TDataSource;
    qryProdCODIGO: TIntegerField;
    qryProdREFERENCIA: TStringField;
    qryProdDESCRICAO: TStringField;
    qryProdTabCODIGO: TIntegerField;
    qryProdTabCODPRODUTO: TIntegerField;
    qryProdTabCODTABELA: TIntegerField;
    qryProdTabPRECO: TBCDField;
    qryProdTabID_EXTERNO: TStringField;
    qryProdTabDESCRICAO: TStringField;
    cdsProdTabCODIGO: TIntegerField;
    cdsProdTabDESCRICAO: TStringField;
    cdsProdTabID_EXTERNO: TStringField;
    cdsProdTabENVIOU: TStringField;
    cdsProdTabPRECO: TFloatField;
    cdsProdTabPRODUTO: TStringField;
    tsProdSeparados: TTabSheet;
    cdsProdTabCODIGO_TABELA: TIntegerField;
    cdsProdTabCODIGO_PRODUTO: TIntegerField;
    qryTabelasID_EXTERNO: TStringField;
    qryProdTabSELECIONADO: TStringField;
    qryProdTabID_EXTERNO_TABELA: TStringField;
    qryProdTabID_EXTERNO_PRODUTO: TStringField;
    cdsProdTabID_EXTERNO_TABELA: TStringField;
    cdsProdTabID_EXTERNO_PRODUTO: TStringField;
    TabSheet1: TTabSheet;
    Splitter4: TSplitter;
    qryClientes: TFDQuery;
    dsClientes: TDataSource;
    cdsClientes: TClientDataSet;
    dsCli: TDataSource;
    qryClientesCODIGO: TIntegerField;
    qryClientesRAZAO: TStringField;
    qryClientesCPF_CNPJ: TStringField;
    qryClientesRG_IE: TStringField;
    qryClientesLOGRADOURO: TStringField;
    qryClientesCOMPLEMENTO: TStringField;
    qryClientesCEP: TStringField;
    qryClientesBAIRRO: TStringField;
    qryClientesCIDADE: TStringField;
    qryClientesSIGLA: TStringField;
    qryClientesOBSERVACAO: TStringField;
    qryClientesEMAIL: TStringField;
    qryClientesFONE1: TStringField;
    qryClientesFONE2: TStringField;
    qryClientesID_EXTERNO: TStringField;
    cdsClientesCODIGO: TIntegerField;
    cdsClientesRAZAO: TStringField;
    cdsClientesCPF_CNPJ: TStringField;
    cdsClientesRG_IE: TStringField;
    cdsClientesLOGRADOURO: TStringField;
    cdsClientesCOMPLEMENTO: TStringField;
    cdsClientesCEP: TStringField;
    cdsClientesBAIRRO: TStringField;
    cdsClientesCIDADE: TStringField;
    cdsClientesESTADO: TStringField;
    cdsClientesOBSERVACAO: TStringField;
    cdsClientesEMAILS: TStringField;
    cdsClientesFONE1: TStringField;
    cdsClientesFONE2: TStringField;
    cdsClientesID_EXTERNO: TStringField;
    cdsClientesENVIOU: TStringField;
    TabSheet9: TTabSheet;
    Splitter5: TSplitter;
    pgcTransportadoras: TPageControl;
    TabSheet10: TTabSheet;
    gridTransportadoras: TDBGridCBN;
    Panel9: TPanel;
    Shape15: TShape;
    Label25: TLabel;
    btnSepararTransportadoras: TBitBtn;
    Shape20: TShape;
    Label26: TLabel;
    Label27: TLabel;
    Label34: TLabel;
    Panel10: TPanel;
    Shape21: TShape;
    Label35: TLabel;
    Label36: TLabel;
    Shape22: TShape;
    btnEnviarTransportadoras: TBitBtn;
    btnLimpaListaTransportadoras: TBitBtn;
    DBGrid5: TDBGrid;
    edtTransportadorasSeparadas: TCurrencyEdit;
    TabSheet11: TTabSheet;
    memLogTransportadoras: TMemo;
    qryTransportadoras: TFDQuery;
    dsTransportadoras: TDataSource;
    cdsTransportadoras: TClientDataSet;
    dsTransp: TDataSource;
    qryTransportadorasCODIGO: TIntegerField;
    qryTransportadorasRAZAO: TStringField;
    qryTransportadorasCIDADE: TStringField;
    qryTransportadorasSIGLA: TStringField;
    qryTransportadorasFONE1: TStringField;
    qryTransportadorasFONE2: TStringField;
    qryTransportadorasID_EXTERNO: TStringField;
    cdsTransportadorasCODIGO: TIntegerField;
    cdsTransportadorasRAZAO: TStringField;
    cdsTransportadorasCIDADE: TStringField;
    cdsTransportadorasUF: TStringField;
    cdsTransportadorasFONE1: TStringField;
    cdsTransportadorasFONE2: TStringField;
    cdsTransportadorasID_EXTERNO: TStringField;
    cdsTransportadorasENVIOU: TStringField;
    TabSheet12: TTabSheet;
    qryFormasPgto: TFDQuery;
    dsFormasPgto: TDataSource;
    cdsFormasPgto: TClientDataSet;
    dsFPgto: TDataSource;
    Splitter6: TSplitter;
    pgcFormasPagamento: TPageControl;
    TabSheet13: TTabSheet;
    DBGridCBN5: TDBGridCBN;
    Panel11: TPanel;
    Shape23: TShape;
    Label37: TLabel;
    btnSepararFormaPgto: TBitBtn;
    Shape24: TShape;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Panel12: TPanel;
    Shape25: TShape;
    Label41: TLabel;
    Label42: TLabel;
    Shape26: TShape;
    btnEnviarFormasPgto: TBitBtn;
    btnLimpaListaFormasPgto: TBitBtn;
    DBGrid6: TDBGrid;
    edtFormasPagamentoSeparadas: TCurrencyEdit;
    TabSheet14: TTabSheet;
    memLogFormasPagamento: TMemo;
    qryFormasPgtoCODIGO: TIntegerField;
    qryFormasPgtoDESCRICAO: TStringField;
    qryFormasPgtoID_EXTERNO: TStringField;
    cdsFormasPgtoCODIGO: TIntegerField;
    cdsFormasPgtoDESCRICAO: TStringField;
    cdsFormasPgtoID_EXTERNO: TStringField;
    cdsFormasPgtoENVIOU: TStringField;
    TabSheet15: TTabSheet;
    buscaRepresentante1: TbuscaRepresentante;
    qryPedidos: TFDQuery;
    lbQtdPedidos: TLabel;
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Shape27: TShape;
    memLogPedidos: TMemo;
    btnLimpar: TBitBtn;
    edtImportados: TCurrencyEdit;
    edtNaoImportados: TCurrencyEdit;
    Label43: TLabel;
    Label44: TLabel;
    pgcClientesIn: TPageControl;
    TabSheet4: TTabSheet;
    pgcClientes: TPageControl;
    TabSheet16: TTabSheet;
    DBGridCBN4: TDBGridCBN;
    Panel7: TPanel;
    Shape16: TShape;
    Label28: TLabel;
    btnSepararClientes: TBitBtn;
    Shape17: TShape;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Panel8: TPanel;
    Shape18: TShape;
    Label32: TLabel;
    Label33: TLabel;
    Shape19: TShape;
    btnEnviarClientes: TBitBtn;
    btnLimpaListaClientes: TBitBtn;
    DBGrid1: TDBGrid;
    edtClientesSeparados: TCurrencyEdit;
    TabSheet17: TTabSheet;
    memLogClientes: TMemo;
    tbClientesUsuario: TTabSheet;
    cdsUsuarios: TClientDataSet;
    dsUsuarios: TDataSource;
    cdsUsuariosCODIGO: TIntegerField;
    cdsUsuariosID_EXTERNO: TStringField;
    cdsUsuariosNOME: TStringField;
    qryCliUsu: TFDQuery;
    dsCliUsu: TDataSource;
    cdsCliUsu: TClientDataSet;
    DataSource1: TDataSource;
    cdsCliUsuCLIENTE: TStringField;
    cdsCliUsuUSUARIO: TStringField;
    cdsCliUsuENVIOU: TStringField;
    cdsCliUsuID_EXTERNO: TStringField;
    cdsCliUsuID_EXTERNO_CLIENTE: TStringField;
    cdsCliUsuID_EXTERNO_USUARIO: TStringField;
    pgcCliUsu: TPageControl;
    TabSheet7: TTabSheet;
    TabSheet18: TTabSheet;
    DBGridCBN6: TDBGridCBN;
    Label45: TLabel;
    lbAtualizaUsuarios: TLabel;
    Indicator: TActivityIndicator;
    DBGridCBN7: TDBGridCBN;
    DBGridCBN8: TDBGridCBN;
    edtCliUsuSeparados: TCurrencyEdit;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Shape28: TShape;
    Panel13: TPanel;
    Shape29: TShape;
    Label50: TLabel;
    Label51: TLabel;
    Shape30: TShape;
    btnEnviarCliUsu: TBitBtn;
    btnLimpaListaCliUsu: TBitBtn;
    cdsCliUsuCODIGO: TIntegerField;
    Panel14: TPanel;
    Shape31: TShape;
    Label52: TLabel;
    BitBtn3: TBitBtn;
    TabSheet19: TTabSheet;
    memLogCliUsu: TMemo;
    qryCliUsuCODIGO: TIntegerField;
    qryCliUsuRAZAO: TStringField;
    qryCliUsuID_EXTERNO_CLIENTE: TStringField;
    qryCliUsuSELECIONADO: TStringField;
    edtCliUsuSelecionados: TCurrencyEdit;
    Shape32: TShape;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    btnExcluirCliente: TBitBtn;
    cdsCliUsuCODIGO_CLIENTE: TIntegerField;
    qryCliUsuCODIGO_CLIENTE: TIntegerField;
    qryCliUsuID_ERP: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure gridCoresDblClick(Sender: TObject);
    procedure gridCoresDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryProdutosAfterScroll(DataSet: TDataSet);
    procedure btnSepararProdutosClick(Sender: TObject);
    procedure cdsProdutosAfterScroll(DataSet: TDataSet);
    procedure btnEnviarProdutosClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure gridProdutosSeparadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSepararTabelasClick(Sender: TObject);
    procedure btnLimpaListaTabelasClick(Sender: TObject);
    procedure btnEnviarTabelasClick(Sender: TObject);
    procedure pgcPrincipalChange(Sender: TObject);
    procedure qryProdAfterScroll(DataSet: TDataSet);
    procedure DBGridCBN3DblClick(Sender: TObject);
    procedure btnSepararTabelaProdClick(Sender: TObject);
    procedure dsTabDataChange(Sender: TObject; Field: TField);
    procedure dsProdTab2DataChange(Sender: TObject; Field: TField);
    procedure btnEnviarTabelasProdutoClick(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSepararClientesClick(Sender: TObject);
    procedure dsCliDataChange(Sender: TObject; Field: TField);
    procedure btnEnviarClientesClick(Sender: TObject);
    procedure dsTranspDataChange(Sender: TObject; Field: TField);
    procedure btnSepararTransportadorasClick(Sender: TObject);
    procedure btnEnviarTransportadorasClick(Sender: TObject);
    procedure btnSepararFormaPgtoClick(Sender: TObject);
    procedure btnEnviarFormasPgtoClick(Sender: TObject);
    procedure dsFPgtoDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure lbAtualizaUsuariosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lbAtualizaUsuariosMouseLeave(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnEnviarCliUsuClick(Sender: TObject);
    procedure lbAtualizaUsuariosClick(Sender: TObject);
    procedure cdsUsuariosAfterScroll(DataSet: TDataSet);
    procedure DBGridCBN7DblClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btnExcluirClienteClick(Sender: TObject);
    procedure qryClientesAfterScroll(DataSet: TDataSet);
    procedure DBGridCBN7DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pgcClientesInChange(Sender: TObject);
    procedure gridProdutosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
      FSegundos :smallint;
      FFinalizaAguarda :boolean;

  private
      FSincronizando :TSincronizacao;

      function  sincronizarRegistros(itemSincro, urlMP, tabelaERP :String; cds :TClientDataSet) :Boolean; //efetua a sincronização dos registros, da aba atualmente focada
      function  idsRegistrosInseridos(cds :TClientDataSet; idName:String) :String; //retorna os IDs dos registros já separados para sincronização
      function  getJsonRegistros :String; //direciona para a função correta de retorno de JSON que está sendo sincronizada no momento
      function  getJsonFones(fone1, fone2 :String) :String; //retorna os telefones em formato JSON
      function  itemSincronizado(cds :TClientDataSet; grid :TDBGrid) :String;

      procedure sincronizar(tipo :TSincronizacao);//direciona para a função correta de sincronização referente a aba que está focada no momento
      procedure removeRegistroSeparado;
      procedure ocultaRegistrosSelecionados(cds :TClientDataSet; qry :TFDQuery);//oculta os registros que já foram separados, para que não sejam separados novamente
      procedure LimpaListaSeparados;//remove todos os registros atualmente separados para sincronização, referente a aba focada
      procedure lancaLog(text :String);//informa no respectivo memo da aba focada, uma mensagem de retorno referente a sincronização
      procedure AguardarSegundos(segundos :smallint; const finaliza :boolean = false);//quando o nº limite de requisições é atingido, a função de sincronização é bloqueada até que o servidor da api esteja disponível novamente

      function getIdExterno(idErp, tabelaERP :String; msgErro :String):String;
      function efetuarSincronizacaoDePedido(codigoPedido :integer) :String;
      function getJsonPedido(Pedido :TPedido) :String;
      function getJsonItensPedido(Pedido :TPedido) :String;
      function getQuantidadeItem(item :TItem) :String;
      function getQuantidade(cor, tamanho :String; qtd :integer) :String;
      function getIdTabPrecoPorValor(codTabela, codProduto :integer; valor :Real) :String;
      function buscaUsuariosMP :String;
      procedure marcaComoExcluido(json, url :String; qry :TFDQuery);
      function excluiRelacao(idRelacao :integer) :Boolean;

  private
    { * * PRODUTOS * * }
      { . Sincronização . }
      procedure separaProdutoSelecionado; //separa produtos para a tela de envio de requisições
      function sincronizaProdutos :boolean; //envia requisições em formato json para a api "Meus pedidos"
      function getJsonProduto: String; //retorna os dados do produto selecionado em formato JSON
      function getJsonCoresDoProduto :String; //retorna as cores do produto selecionado em formato de array JSON
      function getJsonTamanhosDoProduto :String; //retorna os tamanhos do produto selecionado em formato de array JSON
      { . Auxiliares . }
      function removeProdutoSeparado(var codigo, id_externo :String; const pergunta :Boolean = true) :TFDQuery; //remove produto selecionado da lista de separados
      procedure removeCoresDoProdutoSeparado; //remove cores do produto que é removido da lista de separados
      procedure ocultaProdutosSelecionados; //oculta os produtos já separados da lista de seleção
      procedure buscaProdutosSincronizados;

    { * * TABELAS DE PREÇO * * }
      { . Sincronização . }
      procedure separaTabelaSelecionada; //separa tabelas para a tela de envio de requisições
      function sincronizaTabelas :boolean;  //envia requisições em formato json para a api "Meus pedidos"
      function getJsonTabela: String; //retorna os dados da tabela selecionada em formato JSON
      { . Auxiliares . }
      function removeTabelaSeparada(var codigo, id_externo :String; const pergunta :Boolean = true) :TFDQuery; //remove produto selecionado da lista de separados
      procedure ocultaTabelasSelecionadas; //oculta as tabelas já separadas da lista de seleção
      procedure buscaTabelas;

    { * * TABELA PREÇO POR PRODUTO * * }
      { . Sincronização . }
      procedure separaTabelaProdutoSelecionado; //separa tabelas para a tela de envio de requisições
      function sincronizaTabelaDoProduto :Boolean; //envia requisições em formato json para a api "Meus pedidos"
      function getJsonTabelaDoProduto :String; //retorna os dados da tabela do produto selecionada em formato JSON
      { . Auxiliares . }
      function removeTabelaProdutoSeparada(var codigo, id_externo :String; const pergunta :Boolean = true) :TFDQuery; //remove tabela do produto selecionada da lista de separadas
      procedure ocultaTabProdutoSelecionadas; //oculta as tabelas do produto já separadas da lista de seleção

    { * * CLIENTES * * }
      { . Sincronização . }
      procedure separaClienteSelecionado; //separa cliente para a tela de envio de requisições
      function sincronizaClientes :boolean;  //envia requisições em formato json para a api "Meus pedidos"
      function getJsonCliente: String; //retorna os dados da tabela selecionada em formato JSON
      function getJsonEmails(emails :String): String; //retorna os emails em formato JSON
      function getJsonExcluirCliente :String;
      { . Auxiliares . }
      function removeClienteSeparado(var codigo, id_externo :String; const pergunta :Boolean = true) :TFDQuery; //remove cliente selecionado da lista de separados
      procedure ocultaClientesSelecionados; //oculta os clientes já separados da lista de seleção
      procedure buscaClientes; //busca os clientes disponíveis para sincronização

    { * * CLIENTES POR USUÁRIO * * }
      { . Sincronização . }
      procedure separaCliPorUsuSelecionado; //separa cliente para a tela de envio de requisições
      function sincronizaCliPorUsu :boolean;  //envia requisições em formato json para a api "Meus pedidos"
      function getJsonCliPorUsu: String; //retorna os dados da tabela selecionada em formato JSON

      { . Auxiliares . }
      function removeCliPorUsuSeparado(var codigo, id_externo :String; const pergunta :Boolean = true) :TFDQuery; //remove cliente selecionado da lista de separados
      procedure ocultaCliPorUsuSelecionados; //oculta os clientes já separados da lista de seleção
      procedure buscaUsuarios; //busca os clientes disponíveis para sincronização

    { * * TRANSPORTADORAS * * }
      { . Sincronização . }
      procedure separaTransportadoraSelecionada; //separa transportadora para a tela de envio de requisições
      function sincronizaTransportadoras :boolean;  //envia requisições em formato json para a api "Meus pedidos"
      function getJsonTransportadora: String; //retorna os dados da tabela selecionada em formato JSON
      { . Auxiliares . }
      function removeTransportadoraSeparada(var codigo, id_externo :String; const pergunta :Boolean = true) :TFDQuery; //remove transportadora selecionada da lista de separados
      procedure ocultaTransportadorasSelecionadas; //oculta as transportadoras já separadas da lista de seleção
      procedure buscaTransportadoras; //busca as transportadoras disponíveis para sincronização

    { * * FORMAS DE PAGAMENTO * * }
      { . Sincronização . }
      procedure separaFormaPagamentoSelecionada; //separa formas de pagamento para a tela de envio de requisições
      function sincronizaFormasPagamento :boolean;  //envia requisições em formato json para a api "Meus pedidos"
      function getJsonFormasPagamento: String; //retorna os dados da tabela selecionada em formato JSON
      { . Auxiliares . }
      function removeFormaPagamentoSeparada(var codigo, id_externo :String; const pergunta :Boolean = true) :TFDQuery; //remove formas de pagamento selecionado da lista de separados
      procedure ocultaFormasPagamentoSelecionadas; //oculta as formas de pagamento já separadas da lista de seleção
      procedure buscaFormasPagamento; //busca as formas de pagamento disponíveis para sincronização
  end;

var
  frmSincronizador: TfrmSincronizador;

CONST
  CAMPO_ID_EXTERNO = 'ID_EXTERNO';
  CAMPO_ID_ERP = 'CODIGO';
  CAMPO_MARCACAO = 'ENVIOU';
  SQL_PRODUTOS = 'SELECT PRO.*, RTI.id_externo FROM PRODUTOS PRO                                                                           '+
                 'left join relacao_tab_importacao rti on ((rti.id_erp = pro.codigo)and(rti.tabela_erp = ''PRODUTOS''))                    '+
                 'where (ativo = ''S'') and not((select first 1 cb.codigo from codigo_barras cb where cb.codproduto = pro.codigo) is null) '+
                 ' and (CHAR_LENGTH(pro.descricao_completa) > 0)';

  ST_OK_INCLUSAO  = 201;
  ST_OK_ALTERACAO = 200;
  MSG_REQUISICOES_ATINGIDAS = 'Número de requisições máximas por minuto foi atingida, por favor aguarde alguns instantes.';

implementation

uses Math, uModulo, repositorio, fabricaRepositorio, Produto, Cor, System.StrUtils, HTTPJSON, Grade, Tamanho,
     RelacaoTabelasImportacao, System.JSon, ClienteHttpMeusPedidos, StringUtilitario, Funcoes;

{$R *.dfm}

procedure TfrmSincronizador.AguardarSegundos(segundos :smallint; const finaliza :boolean);
begin
  FFinalizaAguarda := finaliza;
  Aguarda('Número de requisições máximas por minuto foi atingida, por favor aguarde alguns instantes.'+#13#10+
            '    '+IntToStr(segundos));
  Timer1.Enabled := true;
end;

procedure TfrmSincronizador.btnLimpaListaTabelasClick(Sender: TObject);
begin
  LimpaListaSeparados;
end;

procedure TfrmSincronizador.btnLimparClick(Sender: TObject);
begin
  inherited;
  lbQtdPedidos.Caption := '0 Pedidos separados para sincronização';
  memLogPedidos.Clear;
  edtImportados.Value := 0;
  edtNaoImportados.Value := 0;
end;

procedure TfrmSincronizador.btnEnviarTabelasProdutoClick(Sender: TObject);
begin
  sincronizar(sincTabelasDoProduto);
end;

procedure TfrmSincronizador.btnSepararTransportadorasClick(Sender: TObject);
begin
  if not qryTransportadoras.IsEmpty then
    separaTransportadoraSelecionada;
end;

procedure TfrmSincronizador.btnEnviarTransportadorasClick(Sender: TObject);
begin
  sincronizar(sincTransportadoras);
end;

procedure TfrmSincronizador.btnExcluirClienteClick(Sender: TObject);
begin
  if confirma('ATENÇÃO! Deseja realmente marcar o Cliente como excluido?'+#13#10+
           'Os dados do cliente não estarão mais acessíveis no app Meus pedidos e esta operação é irreversível.') then
    marcaComoExcluido(getJsonExcluirCliente, 'clientes', qryClientes);
end;

procedure TfrmSincronizador.btnSepararFormaPgtoClick(Sender: TObject);
begin
  if not qryFormasPgto.IsEmpty then
    separaFormaPagamentoSelecionada;
end;

procedure TfrmSincronizador.btnEnviarFormasPgtoClick(Sender: TObject);
begin
  sincronizar(sincFormasPagamento);
end;

procedure TfrmSincronizador.BitBtn1Click(Sender: TObject);
begin
  if not assigned(buscaRepresentante1.Representante) then
  begin
    avisar('Primeiramente selecione o representante');
    buscaRepresentante1.edtCodigo.SetFocus;
  end
  else
  begin
    qryPedidos.Close;
    qryPedidos.ParamByName('codrep').AsInteger := buscaRepresentante1.Representante.Codigo;
    qryPedidos.ParamByName('dti').AsDateTime   := Date-180;//6 meses atras
    qryPedidos.Open;
  end;

    lbQtdPedidos.Caption := intToStr(qryPedidos.recordcount)+' Pedidos separados para sincronização no período de '+
                                                             DateToStr(Date-180) +' a '+ DateToStr(Date);
end;

procedure TfrmSincronizador.BitBtn2Click(Sender: TObject);
begin
  if qryPedidos.RecordCount > 0 then
  begin
    memLogPedidos.Lines.Clear;
    ProgressBar1.Max := qryPedidos.RecordCount;
    qryPedidos.First;
    edtImportados.Value := 0;
    edtNaoImportados.Value := 0;
    while not qryPedidos.Eof do
    begin
      efetuarSincronizacaoDePedido(qryPedidos.FieldByName('CODIGO').AsInteger);
      qryPedidos.Next;
      ProgressBar1.Position := qryPedidos.RecNo;
      Application.ProcessMessages;
    end;
    memLogPedidos.SetFocus;
    memLogPedidos.SelStart := 0;
  end
  else
    avisar('Nenhum pedido foi separado para sincronização');
end;

procedure TfrmSincronizador.BitBtn3Click(Sender: TObject);
begin
  if not qryClientes.IsEmpty then
    separaCliPorUsuSelecionado;
end;

procedure TfrmSincronizador.btnEnviarClientesClick(Sender: TObject);
begin
  sincronizar(sincClientes);
end;

procedure TfrmSincronizador.btnEnviarCliUsuClick(Sender: TObject);
begin
  sincronizar(sincCliPorUsu);
end;

procedure TfrmSincronizador.btnEnviarProdutosClick(Sender: TObject);
begin
  sincronizar(sincProdutos);
end;

procedure TfrmSincronizador.btnEnviarTabelasClick(Sender: TObject);
begin
  sincronizar(sincTabelasPreco);
end;

procedure TfrmSincronizador.btnSepararClientesClick(Sender: TObject);
begin
  if not qryClientes.IsEmpty then
    separaClienteSelecionado;
end;

procedure TfrmSincronizador.btnSepararProdutosClick(Sender: TObject);
begin
  if edtCoresSelecionadas.Value <= 0 then
    avisar('Selecione no mínimo uma cor para separação')
  else
    separaProdutoSelecionado;
end;

procedure TfrmSincronizador.btnSepararTabelaProdClick(Sender: TObject);
begin
  if edtTabelasSelecionadas.Value <= 0 then
    avisar('Selecione no mínimo uma tabela de preço do produto para separação')
  else
    separaTabelaProdutoSelecionado;
end;

procedure TfrmSincronizador.btnSepararTabelasClick(Sender: TObject);
begin
  if not qryTabelas.IsEmpty then
    separaTabelaSelecionada;
end;

procedure TfrmSincronizador.buscaClientes;
begin
  qryClientes.Close;
  qryClientes.Open();
end;

procedure TfrmSincronizador.buscaUsuarios;
var qry :TFDQuery;
begin
  try
    cdsUsuarios.AfterScroll := nil;
    cdsUsuarios.EmptyDataSet;
    qry := dm.GetConsulta('select p.codigo, p.razao, rti.id_externo from pessoas p                                       '+
                          ' inner join relacao_tab_importacao rti on ((rti.url = ''usuarios'')and(rti.id_erp = p.codigo))'+
                          ' order by  p.razao ');
    qry.Open();

    qry.First;
    while not qry.Eof do
    begin
      cdsUsuarios.Append;
      cdsUsuariosCODIGO.AsInteger     := qry.FieldByName('codigo').AsInteger;
      cdsUsuariosNOME.AsString        := qry.FieldByName('razao').AsString;
      cdsUsuariosID_EXTERNO.AsString  := qry.FieldByName('id_externo').AsString;
      cdsUsuarios.Post;

      qry.Next;
    end;

  finally
    cdsUsuarios.AfterScroll := cdsUsuariosAfterScroll;
    FreeAndNil(qry);
  end;
end;

procedure TfrmSincronizador.buscaFormasPagamento;
begin
  qryFormasPgto.Close;
  qryFormasPgto.Open();
end;

procedure TfrmSincronizador.buscaProdutosSincronizados;
begin
  qryProd.AfterScroll := nil;
  qryProd.Close;
  qryProd.Open();
  qryProd.AfterScroll := qryProdAfterScroll;
end;

procedure TfrmSincronizador.buscaTabelas;
begin
  qryTabelas.Close;
  qryTabelas.Open();
end;

procedure TfrmSincronizador.buscaTransportadoras;
begin
  qryTransportadoras.Close;
  qryTransportadoras.Open();
end;

function TfrmSincronizador.buscaUsuariosMP: String;
var
    Retorno, jsonRegistroAtual, idERP :String;
    Client   :TClienteHttpMeusPedidos;
    Usuarios :TJSONArray;
    Usuario  :TJSONObject;
    i        :integer;
    jsonRet  :TJSonObject;
begin
  try
  try
    Application.ProcessMessages;
    result := '';
    Client := nil;
    Client := TClienteHttpMeusPedidos.Create(fdm.configuracoesIntegracao.application_token,
                                             fdm.configuracoesIntegracao.company_token,
                                             fdm.configuracoesIntegracao.url_base);

    Usuarios := TJSONObject.ParseJSONValue( Client.Get('usuarios') ) as TJSONArray;

    for i := 0 to Usuarios.Count-1 do
      begin
        Application.ProcessMessages;
        Usuario := (Usuarios.Items[i] as TJSONObject);

        if not cdsUsuarios.Locate('ID_EXTERNO',Usuario.GetValue('id').Value,[]) and
           not (Usuario.GetValue('administrador').Value.Equals('true')) and
           not (Usuario.GetValue('excluido').Value.Equals('true')) then
        begin
          idERP := Campo_por_campo('PESSOAS','CODIGO','EMAIL',Usuario.GetValue('email').Value+';','TIPO','R');

          if idERP.IsEmpty then
            lancaLog('Nenhum representante encontrado com o e-mail: '+Usuario.GetValue('email').Value+#13#10+
                     'Usuário '+Usuario.GetValue('nome').Value+' não foi sincronizado')
          else
          begin
            TRelacaoTabelasImportacao.criaRelacao('usuarios','PESSOAS',Usuario.GetValue('id').Value, idERP,DateToStr(Date));

            cdsUsuarios.Append;
            cdsUsuariosCODIGO.AsInteger     := strToInt(idERP);
            cdsUsuariosID_EXTERNO.AsString  := Usuario.GetValue('id').Value;
            cdsUsuariosNOME.AsString        := Usuario.GetValue('nome').Value;
            cdsUsuarios.Post;
          end;
        end;
      end;
  except
    on e :Exception do
    begin
      if pos('tempo_ate_permitir_novamente', e.Message) > 0 then
      begin
        jsonRet := TJSONObject.ParseJSONValue( e.Message ) as TJSONObject;
        AguardarSegundos(StrToIntDef(jsonRet.GetValue('tempo_ate_permitir_novamente').Value,0), true);
      end
      else
        avisar('Erro ao buscar usuários cadastrados na MP.'+#13#10+e.Message);
    end;
  end;
  finally
    FreeAndNil(Client);
    if Assigned(jsonret) then
      freeandnil(jsonRet);
  end;
end;

procedure TfrmSincronizador.cdsProdutosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if cdsProdutos.RecordCount <= 0 then
    exit;
  cdsCores.Filtered := false;
  cdsCores.Filter   := 'CODIGO_PRODUTO='+cdsProdutosCODIGO.AsString;
  cdsCores.Filtered := true;
  edtProdutosSeparados.Value := cdsProdutos.RecordCount;
end;

procedure TfrmSincronizador.cdsUsuariosAfterScroll(DataSet: TDataSet);
begin
  if not cdsUsuarios.IsEmpty then
  begin
    qryCliUsu.Close;
    qryCliUsu.ParamByName('cod_rep').AsInteger := cdsUsuariosCODIGO.AsInteger;
    qryCliUsu.Open();
  end;
end;

procedure TfrmSincronizador.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if cdsCliUsu.Active then
    edtCliUsuSeparados.Value := cdsCliUsu.RecordCount;
end;

procedure TfrmSincronizador.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle,SB_HORZ,False);
  if (gdSelected in State) then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := $00F3F3F3;
    TDBGrid(Sender).Canvas.Font.Style  := [fsBold];
  end
  else
  begin
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
    TDBGrid(Sender).Canvas.Brush.Color := clWhite;
    TDBGrid(Sender).Canvas.Font.Style  := [];
  end;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmSincronizador.DBGrid4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_delete then
    removeRegistroSeparado;
end;

procedure TfrmSincronizador.DBGridCBN3DblClick(Sender: TObject);
begin
  with qryProdTab do
  begin
    if IsEmpty then
      exit;
    Edit;
    qryProdTabSELECIONADO.AsString := IfThen(qryProdTabSELECIONADO.AsString.IsEmpty, 'S', '');
    edtTabelasSelecionadas.Value   := edtTabelasSelecionadas.AsInteger + (1 * IfThen(qryProdTabSELECIONADO.AsString.IsEmpty, -1, 1));
    Post;
  end;
end;

procedure TfrmSincronizador.DBGridCBN7DblClick(Sender: TObject);
begin
  with qryCliUsu do
  begin
    if IsEmpty then
      exit;
    Edit;
    qryCliUsuSELECIONADO.AsString := IfThen(qryCliUsuSELECIONADO.AsString.IsEmpty, 'S', '');
    edtCliUsuSelecionados.Value   := edtCliUsuSelecionados.AsInteger + (1 * IfThen(qryCliUsuSELECIONADO.AsString.IsEmpty, -1, 1));
    Post;
  end;
end;

procedure TfrmSincronizador.DBGridCBN7DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not TDBGrid(Sender).DataSource.DataSet.FieldByName('ID_ERP').AsString.IsEmpty then
    TDBGrid(Sender).Canvas.Brush.Color := $00EECCA2;

  if TDBGridCBN(Sender).DataSource.DataSet.FieldByName('SELECIONADO').AsString.Equals('S') then
  begin
    TDBGridCBN(Sender).Canvas.Font.Color  := $00D56A00;
    TDBGridCBN(Sender).Canvas.Brush.Color := $00FAEEDA;
  end;

  TDBGridCBN(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmSincronizador.dsCliDataChange(Sender: TObject; Field: TField);
begin
  if cdsClientes.Active then
    edtClientesSeparados.Value := cdsClientes.RecordCount;
end;

procedure TfrmSincronizador.dsFPgtoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if cdsFormasPgto.Active then
    edtFormasPagamentoSeparadas.Value := cdsFormasPgto.RecordCount;
end;

procedure TfrmSincronizador.dsProdTab2DataChange(Sender: TObject; Field: TField);
begin
  if cdsProdTab.Active then
    edtTabProdutoSeparadas.Value := cdsProdTab.RecordCount;
end;

procedure TfrmSincronizador.dsTabDataChange(Sender: TObject; Field: TField);
begin
  if cdsTabelas.Active then
    edtTabelasSeparadas.Value := cdsTabelas.RecordCount;
end;

procedure TfrmSincronizador.dsTranspDataChange(Sender: TObject; Field: TField);
begin
  if cdsTransportadoras.Active then
    edtTransportadorasSeparadas.Value := cdsTransportadoras.RecordCount;
end;

function TfrmSincronizador.efetuarSincronizacaoDePedido(codigoPedido: integer): String;
var
    Retorno, jsonRegistroAtual :String;
    Client   :TClienteHttpMeusPedidos;
    Pedido   :TPedido;
    Repositorio :TRepositorio;
    JSONPedido :String;
    jsonRet  :TJSonObject;
begin
  try
    Client := nil;
    Client := TClienteHttpMeusPedidos.Create(fdm.configuracoesIntegracao.application_token,
                                             fdm.configuracoesIntegracao.company_token,
                                             fdm.configuracoesIntegracao.url_base);
    Repositorio := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);
    Pedido      := TPedido(Repositorio.Get(codigoPedido));

      try
        JSONPedido := getJsonPedido(Pedido);
        try
          Retorno := Client.Post('pedidos/', JSONPedido);
        Except
          on e :Exception do
            raise Exception.Create(UTF8Decode(e.Message));
        end;
      Except
      on e:Exception do
        begin
          lancaLog('ERRO >> '+e.Message+#13#10+#13#10+' Pedido '+Pedido.numpedido+' não sincronizado >> ');
          if pos('tempo_ate_permitir_novamente', e.Message) > 0 then
          begin
            jsonRet := TJSONObject.ParseJSONValue( e.Message ) as TJSONObject;
            AguardarSegundos(StrToIntDef(jsonRet.GetValue('tempo_ate_permitir_novamente').Value,0));
          end;
        end;
      end;

      if Client.ClientHttp.ResponseCode in [ST_OK_INCLUSAO, ST_OK_ALTERACAO] then
      begin
        { Se ainda não tem relação criada, cria uma }
        TRelacaoTabelasImportacao.criaRelacao('pedidos','PEDIDOS',Client.IdResponse,intToStr(Pedido.Codigo), DateToStr(Date));
        edtImportados.Value := edtImportados.Value + 1;
      end
      else //ocorreu erro
      begin
        lancaLog(Retorno);
        edtNaoImportados.Value := edtNaoImportados.Value + 1;
      end;
  finally
    FreeAndNil(Client);
    if assigned(jsonRet) then
      FreeAndNil(jsonRet);
  end;
end;

function TfrmSincronizador.excluiRelacao(idRelacao: integer) :boolean;
var repositorio :TRepositorio;
begin
  result := false;
  try
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TRelacaoTabelasImportacao.ClassName);
    repositorio.RemoverPorIdentificador(idRelacao);
    result := true;
  Except
    on e :Exception do
      avisar('Falha ao excluir relação ERP/MP.'+#13#10+e.Message);
  end;
  finally
    FreeAndNil(repositorio);
  end;
end;

procedure TfrmSincronizador.gridProdutosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not TDBGrid(Sender).DataSource.DataSet.FieldByName('ID_EXTERNO').AsString.IsEmpty then
    TDBGrid(Sender).Canvas.Brush.Color := $00EECCA2;

  TDBGridCBN(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmSincronizador.gridProdutosSeparadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle,SB_HORZ,False);
  if (gdSelected in State) then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := $00F3F3F3;
    TDBGrid(Sender).Canvas.Font.Style  := [fsBold];
  end;

  if TDBGrid(Sender).DataSource.DataSet.FieldByName('ENVIOU').AsString.Equals('N') then
  begin
    TDBGrid(Sender).Canvas.Font.Color  := $000000D2;
    TDBGrid(Sender).Canvas.Font.Style  := [fsBold];
  end
  else if TDBGrid(Sender).DataSource.DataSet.FieldByName('ENVIOU').AsString.Equals('S') then
  begin
    TDBGrid(Sender).Canvas.Font.Color  := $00708916;
    TDBGrid(Sender).Canvas.Font.Style  := [fsBold];
  end
  else
  begin
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
    TDBGrid(Sender).Canvas.Brush.Color := clWhite;
    TDBGrid(Sender).Canvas.Font.Style  := [];
  end;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

function TfrmSincronizador.idsRegistrosInseridos(cds: TClientDataSet; idName:String): String;
begin
  result := '';
  cds.AfterScroll := nil;
  cds.First;
  while not cds.Eof do
  begin
    result := result + cds.FieldByName(idName).AsString + ',';
    cds.Next;
  end;

  result := copy(Result, 1, length(Result)-1);
end;

function TfrmSincronizador.itemSincronizado(cds: TClientDataSet; grid: TDBGrid): String;
var i :integer;
begin
  result := '';
  for i := 0 to grid.FieldCount do
    result := result + cds.fieldByName(grid.fields[i].fieldName).asString + ' - ';

  result := copy(result, 1, length(result)-2);
end;

procedure TfrmSincronizador.lbAtualizaUsuariosClick(Sender: TObject);
begin
  try
    indicator.Animate := true;
    buscaUsuariosMP;
  finally
    indicator.Animate := false;
  end;
end;

procedure TfrmSincronizador.lbAtualizaUsuariosMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Style := [fsBold];
end;

procedure TfrmSincronizador.lbAtualizaUsuariosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  TLabel(Sender).Font.Style := [fsBold, fsunderline];
end;

procedure TfrmSincronizador.FormCreate(Sender: TObject);
begin
  inherited;
  FFinalizaAguarda := false;
  pgcPrincipal.ActivePageIndex := 0;
  pgcProdutos.ActivePageIndex  := 0;
  pgcTabelas.ActivePageIndex   := 0;
  pgcTabelasProduto.ActivePageIndex := 0;
  pgcClientes.ActivePageIndex  := 0;
  pgcClientesIn.ActivePageIndex := 0;
  pgcCliUsu.ActivePageIndex := 0;
  pgcTransportadoras.ActivePageIndex := 0;
  pgcFormasPagamento.ActivePageIndex := 0;

  qryCores.Connection          := dm.conexao;
  qryProdutos.Connection       := dm.conexao;
  qryTabelas.Connection        := dm.conexao;
  qryProd.Connection           := dm.conexao;
  qryProdTab.Connection        := dm.conexao;
  qryClientes.Connection       := dm.conexao;
  qryTransportadoras.Connection := dm.conexao;
  qryFormasPgto.Connection     := dm.conexao;
  qryPedidos.Connection        := dm.conexao;
  qryCliUsu.Connection         := dm.conexao;
  cdsProdutos.CreateDataSet;
  cdsCores.CreateDataSet;
  cdsTabelas.CreateDataSet;
  cdsProdTab.CreateDataSet;
  cdsClientes.CreateDataSet;
  cdsUsuarios.CreateDataSet;
  cdsCliUsu.CreateDataSet;
  cdsTransportadoras.CreateDataSet;
  cdsFormasPgto.CreateDataSet;

  pgcPrincipal.OnChange := pgcPrincipalChange;

  qryProdutos.Close;
  qryProdutos.SQL.Text    := SQL_PRODUTOS;
  qryProdutos.Open;
  qryProdutos.AfterScroll := qryProdutosAfterScroll;
  qryProdutos.First;
end;

procedure TfrmSincronizador.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
  begin
    case FSincronizando of
      sincProdutos         : btnSepararProdutos.Click;
      sincTabelasPreco     : btnSepararTabelas.Click;
      sincTabelasDoProduto : btnSepararTabelaProd.Click;
      sincClientes         : btnSepararClientes.Click;
      sincTransportadoras  : btnSepararTransportadoras.Click;
      sincFormasPagamento  : btnSepararFormaPgto.Click;
    end;
  end;
end;

function TfrmSincronizador.getIdExterno(idErp, tabelaERP: String; msgErro :String): String;
begin
  result := Campo_por_campo('RELACAO_TAB_IMPORTACAO','ID_EXTERNO','TABELA_ERP',tabelaERP,'ID_ERP',idErp);
  if result.IsEmpty then
    raise Exception.Create(msgErro);
end;

function TfrmSincronizador.getIdTabPrecoPorValor(codTabela, codProduto: integer; valor: Real): String;
var qry :TFDQuery;
begin
  try
    qry := dm.GetConsulta('SELECT CODIGO FROM PRODUTO_TABELA_PRECO '+
                          ' WHERE PRECO = :VALOR AND CODTABELA = :CODTABELA AND CODPRODUTO = :CODPRODUTO ');
    qry.ParamByName('valor').AsFloat := valor;
    qry.ParamByName('codtabela').AsInteger := codTabela;
    qry.ParamByName('codProduto').AsInteger := codProduto;
    qry.Open;

    if qry.IsEmpty then
      raise Exception.Create('Tabela de preço encontrada para ')
    else
      result := qry.Fields[0].AsString;
  finally
    FreeAndNil(qry);
  end;
end;

function TfrmSincronizador.getJsonCliente: String;
var razao, tipo, cpfCnpj, rgIe, rua, complemento, bairro, cep, cidade, estado, observacao, emails, fone1, fone2 :String;
begin
  razao       := cdsClientesRAZAO.AsString;
  tipo        := IfThen(length(cdsClientesCPF_CNPJ.AsString)>12,'J','F');
  cpfCnpj     := cdsClientesCPF_CNPJ.AsString;
  rgIe        := cdsClientesRG_IE.AsString;
  rua         := cdsClientesLOGRADOURO.AsString;
  complemento := cdsClientesCOMPLEMENTO.AsString;
  bairro      := cdsClientesBAIRRO.AsString;
  cep         := cdsClientesCEP.AsString;
  cidade      := cdsClientesCIDADE.AsString;
  estado      := cdsClientesESTADO.AsString;
  observacao  := cdsClientesOBSERVACAO.AsString;
  emails      := cdsClientesEMAILS.AsString;
  fone1       := cdsClientesFONE1.AsString;
  fone2       := cdsClientesFONE2.AsString;

  result := '{ "razao_social": "'+razao+'", '+
            ' "tipo": "'+tipo+'", '+
            ' "cnpj": "'+cpfCnpj+'", '+
            ' "inscricao_estadual": "'+rgIe+'", '+
            ' "rua": "'+rua+'", '+
            ' "complemento": "'+complemento+'", '+
            ' "bairro": "'+bairro+'", '+
            ' "cep": "'+cep+'", '+
            ' "cidade": "'+cidade+'", '+
            ' "estado": "'+estado+'", '+
            ' "observacao": "'+observacao+'", '+
            ' "emails": ['+getJsonEmails(emails)+'],'+
            ' "telefones": ['+getJsonFones(fone1, fone2)+']}';
end;

function TfrmSincronizador.getJsonCliPorUsu: String;
var id_cliente, id_usuario :String;
begin
  id_cliente  := cdsCliUsuID_EXTERNO_CLIENTE.AsString;
  id_usuario  := cdsCliUsuID_EXTERNO_USUARIO.AsString;

  result := '{ "cliente_id": '+id_cliente+', '+
            '  "usuario_id": '+id_usuario+', '+
            '  "liberado": true } '
end;

function TfrmSincronizador.getJsonCoresDoProduto: String;
begin
  cdsCores.First;
  while not cdsCores.Eof do
  begin
    result := result + '"'+cdsCoresCOR.AsString+'",';
    cdsCores.Next;
  end;

  result := copy(result,1,length(result)-1);
  result := '['+result+']';
end;

function TfrmSincronizador.getJsonEmails(emails :String): String;
var
    email :String;
begin
  result  := '';

    while not emails.IsEmpty do begin
    if pos(';', emails) > 0 then
    begin
      email := copy( emails, 1, ( pos( ';', emails ) -1 ) );
      emails := trim( copy( emails, (pos(';',emails) +1), length(emails) ) );
    end
    else
    begin
      email  := emails;
      emails := '';
    end;

    email := '{ "email": "'+StringReplace(email,';','',[rfReplaceAll,rfIgnoreCase])+'" }';

    result := result + email + ',';
  end;
  result := copy(result,1,length(result)-1);
end;

function TfrmSincronizador.getJsonExcluirCliente: String;
var razao_social, tipo :String;
begin
  razao_social := qryClientesRAZAO.AsString;
  tipo         := IfThen(qryClientesCPF_CNPJ.AsString.Length > 12,'J','F');

  result := '{ "tipo": "'+tipo+'", '+
            '  "razao_social": "'+razao_social+'", '+
            '  "excluido": true }';
end;

function TfrmSincronizador.getJsonFones(fone1, fone2: String): String;
var f1, f2 :String;
begin
  f1 := TStringUtilitario.ApenasNumeros(fone1);
  f2 := TStringUtilitario.ApenasNumeros(fone2);

  fone1 := IfThen(f1.IsEmpty,'','{"numero": "'+fone1+'"}');
  fone2 := IfThen(f2.IsEmpty,'','{"numero": "'+fone2+'"}');

  result := fone1 + IfThen(f2.IsEmpty,'',','+fone2);
end;

function TfrmSincronizador.getJsonFormasPagamento: String;
var descricao :String;
begin
  descricao := cdsFormasPgtoDESCRICAO.AsString;

  result := '{ "nome": "'+descricao+'"}';
end;

function TfrmSincronizador.getJsonItensPedido(Pedido: TPedido): String;
var
    i :integer;
    Item :TItem;
    produto_id, tabela_preco_id, preco_bruto, preco_liquido, stringJson, stringRetorno :String;
begin
    result  := '';

    for i := 0 to Pedido.Itens.Count-1 do
    begin
      try
        Item := TItem(Pedido.Itens[i]);
        produto_id      := getIdExterno(intToStr(Item.cod_produto),'PRODUTOS', 'Produto Ref: "'+Item.Produto.Referencia+'" ainda não foi sincronizado' );
     //   tabela_preco_id := getIdExterno(getIdTabPrecoPorValor(Pedido.cod_tab_preco, Item.Produto.Codigo, Item.preco),
     //                                   'PRODUTO_TABELA_PRECO', 'Tabela de preço: Código[ "'+intToStr(Pedido.cod_tab_preco)+'"');
        preco_bruto     := TStringUtilitario.MoedaParaStringJSON(Item.preco);
        preco_liquido   := TStringUtilitario.MoedaParaStringJSON(Item.preco);

        stringJson := '{ "produto_id": '+produto_id+', '+
                    //  '  "tabela_preco_id": '+tabela_preco_id+', '+
                      '  "quantidade_grades": [ '+  getQuantidadeItem(Item) + ' ], '+
                      '  "preco_bruto": '+preco_bruto+', '+
                      '  "preco_liquido": '+preco_liquido+' }';

        stringRetorno := stringRetorno + stringJson + ',';
      Except
        on e :Exception do
          raise Exception.Create(e.Message);
      end;
    end;
    result := copy(stringRetorno,1,length(stringRetorno)-1);
end;

function TfrmSincronizador.getJsonPedido(Pedido: TPedido): String;
var cod_cliente, data_emissao, cod_transportadora, cod_representante, cod_formapagto :String;
    observacoes :String;
begin
  cod_cliente        := getIdExterno(intToStr(Pedido.cod_cliente),'PESSOAS', 'Cliente '+Pedido.Cliente.Razao+' ainda não foi sincronizado');
  data_emissao       := FormatDateTime('yyyy-mm-dd', Pedido.dt_entrega);
  cod_transportadora := getIdExterno(intToStr(Pedido.cod_transp),'PESSOAS', 'Transportadora '+Pedido.Transportadora.Razao+' ainda não foi sincronizada');
  cod_representante  := getIdExterno(intToStr(Pedido.cod_repres),'PESSOAS', 'Representante '+Pedido.Representante.Razao +' ainda não foi sincronizado');
  cod_formapagto     := getIdExterno(intToStr(Pedido.cod_forma_pag),'FORMAS_PGTO', 'Forma de Pagamento '+ Pedido.FormaPagamento.Descricao +' ainda não foi sincronizada');
  observacoes        := Pedido.observacao;


  result := '{ "cliente_id": '+cod_cliente+', '+
            '  "data_emissao": "'+data_emissao+'", '+
            '  "transportadora_id": '+cod_transportadora+', '+
            '  "criador_id": '+cod_representante+', '+
            '  "condicao_pagamento_id": '+cod_formapagto+', '+
            '  "observacoes": "'+observacoes+'", '+
            '  "itens": [ '+getJsonItensPedido(Pedido)+' ]}';
end;

function TfrmSincronizador.getJsonProduto: String;
var produto, preco_tabela, referencia, unidade, codigo_ncm :String;
begin
  produto      := copy(cdsProdutosDESCRICAO.AsString,1,100);
  preco_tabela := '0.00';
  referencia   := copy(cdsProdutosREFERENCIA.AsString,1,50);
  unidade      := cdsProdutosUNIDADE.AsString;
  codigo_ncm   := cdsProdutosCOD_NCM.AsString;

  result := '{"nome": "'+produto+'", '+
            ' "preco_tabela": '+preco_tabela+', '+
            ' "codigo": "'+referencia+'", '+
            ' "moeda": 0,'+
            ' "unidade": "'+unidade+'", '+
            ' "grade_cores": '+getJsonCoresDoProduto+', '+
            ' "grade_tamanhos": '+getJsonTamanhosDoProduto+', '+
            ' "ativo": true, '+
            ' "codigo_ncm": "'+codigo_ncm+'"}';
end;

function TfrmSincronizador.getJsonRegistros: String;
begin
  case FSincronizando of
    sincProdutos         : result := getJsonProduto;
    sincTabelasPreco     : result := getJsonTabela;
    sincTabelasDoProduto : result := getJsonTabelaDoProduto;
    sincClientes         : result := getJsonCliente;
    sincCliPorUsu        : result := getJsonCliPorUsu;
    sincTransportadoras  : result := getJsonTransportadora;
    sincFormasPagamento  : result := getJsonFormasPagamento;
  end;
end;

function TfrmSincronizador.getJsonTabela: String;
var tabela, tipo :String;
begin
  tabela  := copy(cdsTabelasDESCRICAO.AsString,1,100);
  tipo    := 'P';

  result := '{"nome": "'+tabela+'", '+
            ' "tipo": "'+tipo+'"}';
end;

function TfrmSincronizador.getJsonTabelaDoProduto: String;
var codigoTabela, codigoProduto, preco :String;
begin
  codigoTabela  := cdsProdTabID_EXTERNO_TABELA.AsString;
  codigoProduto := cdsProdTabID_EXTERNO_PRODUTO.AsString;
  preco         := StringReplace(cdsProdTabPRECO.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);;

  result := '{"tabela_id": '+codigoTabela+', '+
            ' "produto_id": '+codigoProduto+', '+
            ' "preco": '+preco+'}';
end;

function TfrmSincronizador.getJsonTamanhosDoProduto: String;
var grade :TGrade;
    repositorio :TRepositorio;
    tamanho :TTamanho;
begin
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TGrade.ClassName);
    grade       := TGrade( repositorio.Get(cdsProdutosCOD_GRADE.AsInteger) );

    if assigned(Grade) and assigned(Grade.Tamanhos) then
      for tamanho in Grade.Tamanhos do
      begin
        result := result + '"'+tamanho.Descricao+'",';
      end;

    result := copy(result,1,length(result)-1);
    result := '['+result+']';
  finally
    FreeAndNil(grade);
    FreeAndNil(repositorio);
  end;
end;

function TfrmSincronizador.getJsonTransportadora: String;
var razao, cidade, estado, fone1, fone2 :String;
begin
  razao       := cdsTransportadorasRAZAO.AsString;
  cidade      := cdsTransportadorasCIDADE.AsString;
  estado      := cdsTransportadorasUF.AsString;
  fone1       := cdsTransportadorasFONE1.AsString;
  fone2       := cdsTransportadorasFONE2.AsString;

  result := '{ "nome": "'+razao+'", '+
            ' "cidade": "'+cidade+'", '+
            ' "estado": "'+estado+'", '+
            ' "telefones": ['+getJsonFones(fone1, fone2)+']}';
end;

function TfrmSincronizador.getQuantidade(cor, tamanho: String; qtd: integer): String;
begin
  result := '{ "cor": "'+cor+'", '+
            '  "tamanho": "'+tamanho+'", '+
            '  "quantidade": '+intToStr(qtd)+' }';
end;

function TfrmSincronizador.getQuantidadeItem(item: TItem): String;
var stringRetorno :String;
begin
    if item.qtd_PM > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'PM',item.qtd_PM)+',';
    if item.qtd_RN > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'RN',item.qtd_RN)+',';
    if item.qtd_P > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'P',item.qtd_P)+',';
    if item.qtd_M > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'M',item.qtd_M)+',';
    if item.qtd_G > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'G',item.qtd_G)+',';
    if item.qtd_1 > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'1',item.qtd_1)+',';
    if item.qtd_2 > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'2',item.qtd_2)+',';
    if item.qtd_3 > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'3',item.qtd_3)+',';
    if item.qtd_4 > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'4',item.qtd_4)+',';
    if item.qtd_6 > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'6',item.qtd_6)+',';
    if item.qtd_8 > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'8',item.qtd_8)+',';
    if item.qtd_10 > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'10',item.qtd_10)+',';
    if item.qtd_12 > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'12',item.qtd_12)+',';
    if item.qtd_14 > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'14',item.qtd_14)+',';
    if item.qtd_UNICA > 0 then
      stringRetorno := stringRetorno + getQuantidade(Item.Cor.Descricao,'UNICA',trunc(item.qtd_UNICA))+',';

    result := copy(stringRetorno, 1, length(stringRetorno)-1);
end;

procedure TfrmSincronizador.gridCoresDblClick(Sender: TObject);
begin
  with qryCores do
  begin
    if IsEmpty then
      exit;
    Edit;
    qryCoresSELECIONADO.AsString := IfThen(qryCoresSELECIONADO.AsString.IsEmpty, 'S', '');
    edtCoresSelecionadas.Value   := edtCoresSelecionadas.AsInteger + (1 * IfThen(qryCoresSELECIONADO.AsString.IsEmpty, -1, 1));
    Post;
  end;
end;

procedure TfrmSincronizador.gridCoresDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  try
    TDBGrid(Sender).DataSource.DataSet.FieldByName('ID_EXTERNO');
    if not TDBGrid(Sender).DataSource.DataSet.FieldByName('ID_EXTERNO').AsString.IsEmpty then
      TDBGrid(Sender).Canvas.Brush.Color := $00EECCA2;
  Except
  end;

  if TDBGridCBN(Sender).DataSource.DataSet.FieldByName('SELECIONADO').AsString.Equals('S') then
  begin
    TDBGridCBN(Sender).Canvas.Font.Color  := $00D56A00;
    TDBGridCBN(Sender).Canvas.Brush.Color := $00FAEEDA;
  end;

  TDBGridCBN(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmSincronizador.lancaLog(text: String);
var memoLog :TMemo;
const quebra = ' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -'+
               ' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -'+
               ' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -'+
               ' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -';
begin
  case FSincronizando of
    sincProdutos         : memoLog := memLogProdutos;
    sincTabelasPreco     : memoLog := memLogTabelas;
    sincTabelasDoProduto : memoLog := memLogTabelaProduto;
    sincClientes         : memoLog := memLogClientes;
    sincCliPorUsu        : memoLog := memLogCliUsu;
    sincTransportadoras  : memoLog := memLogTransportadoras;
    sincFormasPagamento  : memoLog := memLogFormasPagamento;
    sincPedidos          : memoLog := memLogPedidos;
  end;

  memoLog.Lines.Add(text);
  if memoLog.Lines.Count > 0 then
    memoLog.Lines.Add(quebra);
end;

procedure TfrmSincronizador.LimpaListaSeparados;
var cds :TClientDataSet;
begin
  case FSincronizando of
    sincProdutos         : cds := cdsProdutos;
    sincTabelasPreco     : cds := cdsTabelas;
    sincTabelasDoProduto : cds := cdsProdTab;
    sincClientes         : cds := cdsClientes;
    sincCliPorUsu        : cds := cdsCliUsu;
    sincTransportadoras  : cds := cdsTransportadoras;
    sincFormasPagamento  : cds := cdsFormasPgto;
  end;

  if not cds.Active then
    exit;

  cds.First;
  while not cds.Eof do
  begin
    removeRegistroSeparado;
    cds.first;
  end;
  cds.EmptyDataSet;
end;

procedure TfrmSincronizador.marcaComoExcluido(json, url: String; qry :TFDQuery);
var
  Client   :TClienteHttpMeusPedidos;
  jsonRet  :TJSonObject;
  idRelacao :integer;
  idExterno :String;
begin
  try
    Client := TClienteHttpMeusPedidos.Create(fdm.configuracoesIntegracao.application_token,
                                             fdm.configuracoesIntegracao.company_token,
                                             fdm.configuracoesIntegracao.url_base);

      try
        idExterno := qry.FieldByName(CAMPO_ID_EXTERNO).AsString;
        Client.Put(url+'/' + idExterno, json);
      Except
      on e:Exception do
        begin
          lancaLog('ERRO >> '+UTF8Decode(e.Message)+#13#10+#13#10+' excluindo '+' >> '+json);
          if pos('tempo_ate_permitir_novamente', e.Message) > 0 then
          begin
            jsonRet := TJSONObject.ParseJSONValue( e.Message ) as TJSONObject;
            AguardarSegundos(StrToIntDef(jsonRet.GetValue('tempo_ate_permitir_novamente').Value,0));
          end;
        end;
      end;

      if Client.ClientHttp.ResponseCode = ST_OK_ALTERACAO then
      begin
        avisar('Operação realizada com sucesso!',3);
        idRelacao := strToIntdef(Campo_por_campo('RELACAO_TAB_IMPORTACAO','CODIGO','URL',url,'ID_EXTERNO', idExterno),0);
        if excluiRelacao(idRelacao) then
        begin
          qry.Edit;
          qry.FieldByName(CAMPO_ID_EXTERNO).AsString := '';
          qry.Post;
        end;
      end
      else
      begin
        if not assigned(jsonRet) then
          Avisar('Falha ao tentar excluir.'+#13#10+Client.ClientHttp.ResponseText);
      end;

  finally
    FreeAndNil(Client);
    if assigned(jsonRet) then
      FreeAndNil(jsonRet);
  end;
end;

procedure TfrmSincronizador.ocultaClientesSelecionados;
begin
  ocultaRegistrosSelecionados(cdsClientes, qryClientes);
end;

procedure TfrmSincronizador.ocultaCliPorUsuSelecionados;
begin
  ocultaRegistrosSelecionados(cdsCliUsu, qryCliUsu);
end;

procedure TfrmSincronizador.ocultaFormasPagamentoSelecionadas;
begin
  ocultaRegistrosSelecionados(cdsFormasPgto, qryFormasPgto);
end;

procedure TfrmSincronizador.ocultaProdutosSelecionados;
begin
  ocultaRegistrosSelecionados(cdsProdutos, qryProdutos);
end;

procedure TfrmSincronizador.ocultaRegistrosSelecionados(cds: TClientDataSet; qry: TFDQuery);
var index :integer;
CONST CAMPO_ID = 'CODIGO';
begin
  index := qry.Recno;
  qry.Filtered := false;
  if not cds.IsEmpty then
  begin
    qry.Filter   := CAMPO_ID+' NOT IN ('+idsRegistrosInseridos(cds, CAMPO_ID)+')';
    qry.Filtered := true;
  end;
  qry.Recno := index;
end;

procedure TfrmSincronizador.ocultaTabelasSelecionadas;
begin
  ocultaRegistrosSelecionados(cdsTabelas, qryTabelas);
end;

procedure TfrmSincronizador.ocultaTabProdutoSelecionadas;
begin
  ocultaRegistrosSelecionados(cdsProdTab, qryProdTab);
end;

procedure TfrmSincronizador.ocultaTransportadorasSelecionadas;
begin
  ocultaRegistrosSelecionados(cdsTransportadoras, qryTransportadoras);
end;

procedure TfrmSincronizador.pgcClientesInChange(Sender: TObject);
begin
  inherited;
  case pgcClientesIn.ActivePageIndex of
    0 :begin
      FSincronizando := sincClientes;
      buscaClientes;
      buscaUsuarios;
      cdsUsuariosAfterScroll(nil);
    end;
    1 :begin
      FSincronizando := sincCliPorUsu;
      cdsUsuariosAfterScroll(nil);
    end;
  end;
end;

procedure TfrmSincronizador.pgcPrincipalChange(Sender: TObject);
begin
  //É setado o tipo de sincronização ao mudar de aba, pois o usuário pode iniciar uma sincronização (setando o tipo), não terminar e mudar de aba
  case pgcPrincipal.ActivePageIndex of
    0 :begin
      FSincronizando := sincProdutos;
    end;
    1 : begin
      FSincronizando := sincTabelasPreco;
      if not(qryTabelas.Active) then
        buscaTabelas;
    end;
    2 :begin
      FSincronizando := sincTabelasDoProduto;
      buscaProdutosSincronizados;
      qryProdAfterScroll(nil);
    end;
    3 :begin
      FSincronizando := sincClientes;
      buscaClientes;
      buscaUsuarios;
      cdsUsuariosAfterScroll(nil);
    end;
    4 :begin
      FSincronizando := sincTransportadoras;
      buscaTransportadoras;
    end;
    5 :begin
      FSincronizando := sincFormasPagamento;
      buscaFormasPagamento;
    end;
    6 :begin
      FSincronizando := sincPedidos;
      buscaRepresentante1.edtCodigo.SetFocus;
    end;
  end;
end;

procedure TfrmSincronizador.qryClientesAfterScroll(DataSet: TDataSet);
begin
  inherited;
    btnExcluirCliente.Enabled := StrToIntDef(qryClientesID_EXTERNO.AsString,0) > 0;
end;

procedure TfrmSincronizador.qryProdAfterScroll(DataSet: TDataSet);
begin
  edtTabelasSelecionadas.Clear;
  qryProdTab.Close;
  qryProdTab.ParamByName('codpro').AsInteger := qryProdCODIGO.AsInteger;
  qryProdTab.Open();
end;

procedure TfrmSincronizador.qryProdutosAfterScroll(DataSet: TDataSet);
begin
  edtCoresSelecionadas.Clear;
  qryCores.Close;
  qryCores.ParamByName('codpro').AsInteger := qryProdutosCODIGO.AsInteger;
  qryCores.Open;
end;

function TfrmSincronizador.removeClienteSeparado(var codigo, id_externo :String; const pergunta :Boolean) :TFDQuery;
begin
  if not cdsClientes.IsEmpty and ( not pergunta or
    confirma('Remover '+cdsClientesRAZAO.AsString+' dos clientes separados para sincronização?')) then
  begin
    codigo      := cdsClientesCODIGO.AsString;
    id_externo  := cdsClientesID_EXTERNO.AsString;
    cdsClientes.Delete;
    ocultaClientesSelecionados;
    result := qryClientes;
  end;
end;

function TfrmSincronizador.removeCliPorUsuSeparado(var codigo, id_externo: String; const pergunta: Boolean): TFDQuery;
begin
  if not cdsCliUsu.IsEmpty and ( not pergunta or
    confirma('Remover '+cdsCliUsuCLIENTE.AsString+' dos clientes separados para sincronização?')) then
  begin
    codigo      := cdsCliUsuCODIGO.AsString;
    id_externo  := cdsCliUsuID_EXTERNO.AsString;
    cdsCliUsu.Delete;
    ocultaCliPorUsuSelecionados;
    result := qryCliUsu;
  end;
end;

procedure TfrmSincronizador.removeCoresDoProdutoSeparado;
begin
  cdsCores.Filtered := false;
  cdsCores.Filter   := 'CODIGO_PRODUTO = '+cdsProdutosCODIGO.AsString;
  cdsCores.Filtered := true;
  cdsCores.First;
  while not cdsCores.Eof do
  begin
    cdsCores.First;
    cdsCores.Delete;
  end;
end;

function TfrmSincronizador.removeFormaPagamentoSeparada(var codigo, id_externo :String; const pergunta :Boolean) :TFDQuery;
begin
  if not cdsFormasPgto.IsEmpty and (not pergunta or
    confirma('Remover '+cdsFormasPgtoDESCRICAO.AsString+' das formas de pagamento separadas para sincronização?')) then
  begin
    codigo      := cdsFormasPgtoCODIGO.AsString;
    id_externo  := cdsFormasPgtoID_EXTERNO.AsString;
    cdsFormasPgto.Delete;
    ocultaFormasPagamentoSelecionadas;
    result      := qryFormasPgto;
  end;
end;

function TfrmSincronizador.removeProdutoSeparado(var codigo, id_externo :String; const pergunta :Boolean) :TFDQuery;
begin
  if not cdsProdutos.IsEmpty and ( not pergunta or
    confirma('Remover '+cdsProdutosDESCRICAO.AsString+' dos produtos separados para sincronização?')) then
  begin
    codigo      := cdsProdutosCODIGO.AsString;
    id_externo  := cdsProdutosID_EXTERNO.AsString;
    removeCoresDoProdutoSeparado;
    cdsProdutos.Delete;
    ocultaProdutosSelecionados;
    result      := qryProdutos;
  end;
end;

procedure TfrmSincronizador.removeRegistroSeparado;
var codigo, id_externo :String;
    qry :TFDQuery;
begin
  id_externo := '';
  case FSincronizando of
    sincProdutos         : qry := removeProdutoSeparado(codigo, id_externo, false);
    sincTabelasPreco     : qry := removeTabelaSeparada(codigo, id_externo, false);
    sincTabelasDoProduto : qry := removeTabelaProdutoSeparada(codigo, id_externo, false);
    sincClientes         : qry := removeClienteSeparado(codigo, id_externo, false);
    sincCliPorUsu        : qry := removeCliPorUsuSeparado(codigo, id_externo, false);
    sincTransportadoras  : qry := removeTransportadoraSeparada(codigo, id_externo, false);
    sincFormasPagamento  : qry := removeFormaPagamentoSeparada(codigo, id_externo, false);
  end;

  if not id_externo.IsEmpty then
  begin
    qry.Filtered := false;
    qry.Locate('CODIGO',codigo,[]);
    qry.Edit;
    qry.FieldByName('ID_EXTERNO').AsString := id_externo;
    qry.Post;
  end;
end;

function TfrmSincronizador.removeTabelaProdutoSeparada(var codigo, id_externo :String; const pergunta :Boolean) :TFDQuery;
begin
  if not cdsProdTab.IsEmpty and ( not pergunta or
    confirma('Remover '+cdsProdTabDESCRICAO.AsString+' das tabelas separadas para sincronização?')) then
  begin
    codigo      := cdsProdTabCODIGO.AsString;
    id_externo  := cdsProdTabID_EXTERNO.AsString;
    cdsProdTab.Delete;
    ocultaTabProdutoSelecionadas;
    result := qryProdTab;
  end;
end;

function TfrmSincronizador.removeTabelaSeparada(var codigo, id_externo :String; const pergunta :Boolean) :TFDQuery;
begin
  if not cdsTabelas.IsEmpty and ( not pergunta or
    confirma('Remover '+cdsTabelasDESCRICAO.AsString+' das tabelas separadas para sincronização?')) then
  begin
    codigo      := cdsTabelasCODIGO.AsString;
    id_externo  := cdsTabelasID_EXTERNO.AsString;
    cdsTabelas.Delete;
    ocultaTabelasSelecionadas;
    result := qryTabelas;
  end;
end;

function TfrmSincronizador.removeTransportadoraSeparada(var codigo, id_externo :String; const pergunta :Boolean) :TFDQuery;
begin
  if not cdsTransportadoras.IsEmpty and ( not pergunta or
    confirma('Remover '+cdsTransportadorasRAZAO.AsString+' ds transportadoras separadas para sincronização?')) then
  begin
    codigo      := cdsTransportadorasCODIGO.AsString;
    id_externo  := cdsTransportadorasID_EXTERNO.AsString;
    cdsTransportadoras.Delete;
    ocultaTransportadorasSelecionadas;
    result := qryTransportadoras;
  end;
end;

procedure TfrmSincronizador.separaClienteSelecionado;
begin
  cdsClientes.Append;
  cdsClientesCODIGO.AsInteger     := qryClientesCODIGO.AsInteger;
  cdsClientesRAZAO.AsString       := qryClientesRAZAO.AsString;
  cdsClientesCPF_CNPJ.AsString    := qryClientesCPF_CNPJ.AsString;
  cdsClientesRG_IE.AsString       := qryClientesRG_IE.AsString;
  cdsClientesLOGRADOURO.AsString  := qryClientesLOGRADOURO.AsString;
  cdsClientesCOMPLEMENTO.AsString := qryClientesCOMPLEMENTO.AsString;
  cdsClientesCEP.AsString         := qryClientesCEP.AsString;
  cdsClientesBAIRRO.AsString      := qryClientesBAIRRO.AsString;
  cdsClientesCIDADE.AsString      := qryClientesCIDADE.AsString;
  cdsClientesESTADO.AsString      := qryClientesSIGLA.AsString;
  cdsClientesOBSERVACAO.AsString  := qryClientesOBSERVACAO.AsString;
  cdsClientesEMAILS.AsString      := qryClientesEMAIL.AsString;
  cdsClientesFONE1.AsString       := qryClientesFONE1.AsString;
  cdsClientesFONE2.AsString       := qryClientesFONE2.AsString;
  cdsClientesID_EXTERNO.AsString  := qryClientesID_EXTERNO.AsString;
  cdsClientes.Post;

  ocultaClientesSelecionados;
end;

procedure TfrmSincronizador.separaCliPorUsuSelecionado;
begin
  qryCliUsu.Filtered := false;
  qryCliUsu.Filter   := 'SELECIONADO=''S'' ';
  qryCliUsu.Filtered := true;
  qryCliUsu.First;

  while not qryCliUsu.Eof do
  begin
    cdsCliUsu.AfterScroll := nil;
    cdsCliUsu.Append;
    cdsCliUsuCODIGO.AsInteger            := qryCliUsuCODIGO.AsInteger;
    cdsCliUsuCODIGO_CLIENTE.AsInteger    := qryCliUsuCODIGO_CLIENTE.AsInteger;
    cdsCliUsuCLIENTE.AsString            := qryCliUsuRAZAO.AsString;
    cdsCliUsuUSUARIO.AsString            := cdsUsuariosNOME.AsString;
    cdsCliUsuID_EXTERNO_CLIENTE.AsString := qryCliUsuID_EXTERNO_CLIENTE.AsString;
    cdsCliUsuID_EXTERNO_USUARIO.AsString := cdsUsuariosID_EXTERNO.AsString;
    //cdsCliUsuID_EXTERNO.AsString         := qryCliUsuID_EXTERNO.AsString;
    cdsCliUsu.Post;
    qryCliUsu.Next;
  end;

  ocultaCliPorUsuSelecionados;
  qryProdAfterScroll(nil);
end;

procedure TfrmSincronizador.separaFormaPagamentoSelecionada;
begin
  cdsFormasPgto.AfterScroll := nil;
  cdsFormasPgto.Append;
  cdsFormasPgtoCODIGO.AsInteger    := qryFormasPgtoCODIGO.AsInteger;
  cdsFormasPgtoDESCRICAO.AsString  := qryFormasPgtoDESCRICAO.AsString;
  cdsFormasPgtoID_EXTERNO.AsString := qryFormasPgtoID_EXTERNO.AsString;
  cdsFormasPgto.Post;

  ocultaFormasPagamentoSelecionadas;
end;

procedure TfrmSincronizador.separaProdutoSelecionado;
begin
  try
    cdsProdutos.AfterScroll := nil;
    cdsProdutos.Append;
    cdsProdutosCODIGO.AsInteger     := qryProdutosCODIGO.AsInteger;
    cdsProdutosDESCRICAO.AsString   := qryProdutosDESCRICAO_COMPLETA.AsString;
    cdsProdutosREFERENCIA.AsString  := qryProdutosREFERENCIA.AsString;
    cdsProdutosUNIDADE.AsString     := qryProdutosUNIDADE_MEDIDA.AsString;
    cdsProdutosCOD_GRADE.AsInteger  := qryProdutosCOD_GRADE.AsInteger;
    cdsProdutosCOD_NCM.AsString     := qryProdutosCOD_NCM.AsString;
    cdsProdutosID_EXTERNO.AsString  := qryProdutosID_EXTERNO.AsString;
    cdsProdutos.Post;

    qryCores.Filtered := false;
    qryCores.Filter   := 'SELECIONADO=''S'' ';
    qryCores.Filtered := true;
    qryCores.First;
    while not qryCores.Eof do
    begin
      cdsCores.Append;
      cdsCoresCODIGO.AsInteger         := qryCoresCODIGO.AsInteger;
      cdsCoresCOR.AsString             := qryCoresCOR.AsString;
      cdsCoresCODIGO_PRODUTO.AsInteger := cdsProdutosCODIGO.AsInteger;
      cdsCores.Post;
      qryCores.Next;
    end;

    ocultaProdutosSelecionados;
    qryProdutosAfterScroll(nil);
    cdsProdutosAfterScroll(nil);
  finally
    qryCores.Filtered       := false;
    qryTabelas.Filtered     := false;
    cdsProdutos.AfterScroll := cdsProdutosAfterScroll;
  end;
end;

procedure TfrmSincronizador.separaTabelaProdutoSelecionado;
begin
  try
    qryProdTab.Filtered := false;
    qryProdTab.Filter   := 'SELECIONADO=''S'' ';
    qryProdTab.Filtered := true;
    qryProdTab.First;

    while not qryProdTab.Eof do
    begin
      cdsProdTab.AfterScroll := nil;
      cdsProdTab.Append;
      cdsProdTabCODIGO.AsInteger            := qryProdTabCODIGO.AsInteger;
      cdsProdTabCODIGO_TABELA.AsInteger     := qryProdTabCODTABELA.AsInteger;
      cdsProdTabCODIGO_PRODUTO.AsInteger    := qryProdTabCODPRODUTO.AsInteger;
      cdsProdTabPRODUTO.AsString            := qryProdDESCRICAO.AsString;
      cdsProdTabDESCRICAO.AsString          := qryProdTabDESCRICAO.AsString;
      cdsProdTabPRECO.AsFloat               := qryProdTabPRECO.AsFloat;
      cdsProdTabID_EXTERNO.AsString         := qryProdTabID_EXTERNO.AsString;
      cdsProdTabID_EXTERNO_TABELA.AsString  := qryProdTabID_EXTERNO_TABELA.AsString;
      cdsProdTabID_EXTERNO_PRODUTO.AsString := qryProdTabID_EXTERNO_PRODUTO.AsString;
      cdsProdTab.Post;
      qryProdTab.Next;
    end;

    ocultaTabProdutoSelecionadas;
    qryProdAfterScroll(nil);
  finally
    //qryProdTab.Filtered        := false;
  end;
end;

procedure TfrmSincronizador.separaTabelaSelecionada;
begin
  cdsTabelas.AfterScroll := nil;
  cdsTabelas.Append;
  cdsTabelasCODIGO.AsInteger     := qryTabelasCODIGO.AsInteger;
  cdsTabelasDESCRICAO.AsString   := qryTabelasDESCRICAO.AsString;
  cdsTabelasID_EXTERNO.AsString  := qryTabelasID_EXTERNO.AsString;
  cdsTabelas.Post;

  ocultaTabelasSelecionadas;
end;

procedure TfrmSincronizador.separaTransportadoraSelecionada;
begin
  cdsTransportadoras.AfterScroll := nil;
  cdsTransportadoras.Append;
  cdsTransportadorasCODIGO.AsInteger    := qryTransportadorasCODIGO.AsInteger;
  cdsTransportadorasRAZAO.AsString      := qryTransportadorasRAZAO.AsString;
  cdsTransportadorasCIDADE.AsString     := qryTransportadorasCIDADE.AsString;
  cdsTransportadorasUF.AsString         := qryTransportadorasSIGLA.AsString;
  cdsTransportadorasFONE1.AsString      := qryTransportadorasFONE1.AsString;
  cdsTransportadorasFONE2.AsString      := qryTransportadorasFONE2.AsString;
  cdsTransportadorasID_EXTERNO.AsString := qryTransportadorasID_EXTERNO.AsString;
  cdsTransportadoras.Post;

  ocultaTransportadorasSelecionadas;
end;

function TfrmSincronizador.sincronizaClientes: boolean;
begin
  result := false;
  if edtClientesSeparados.Value <= 0 then
  begin
    avisar('Nenhum cliente foi separado para envio');
    exit;
  end;

  sincronizarRegistros('CLIENTE',
                       'clientes',
                       'PESSOAS',
                       cdsClientes);
  result := true;
end;

function TfrmSincronizador.sincronizaCliPorUsu: boolean;
begin
  result := false;
  if edtCliUsuSeparados.Value <= 0 then
  begin
    avisar('Nenhum cliente foi separado para envio');
    exit;
  end;

  sincronizarRegistros('CLIENTE',
                       'usuarios_clientes',
                       'CLIENTE_REPRESENTANTE',
                       cdsCliUsu);
  result := true;
end;

function TfrmSincronizador.sincronizaFormasPagamento: boolean;
begin
  result := false;
  if edtFormasPagamentoSeparadas.Value <= 0 then
  begin
    avisar('Nenhuma forma de pagamento foi separada para envio');
    exit;
  end;

  sincronizarRegistros('FORMA DE PAGAMENTO',
                       'condicoes_pagamento',
                       'FORMAS_PGTO',
                       cdsFormasPgto);
  result := true;
end;

function TfrmSincronizador.sincronizaProdutos :boolean;
begin
  result := false;
  if edtProdutosSeparados.Value <= 0 then
  begin
    avisar('Nenhum produto foi separado para envio');
    exit;
  end;
  sincronizarRegistros('PRODUTO',
                       'produtos',
                       'PRODUTOS',
                       cdsProdutos);
  result := true;
end;

procedure TfrmSincronizador.sincronizar(tipo: TSincronizacao);
begin
  try
    Aguarda('Relizando sincronização, por favor aguarde');
    Application.ProcessMessages;

    FSincronizando := tipo;
    case tipo of
      sincProdutos        : sincronizaProdutos;
      sincTabelasPreco    : sincronizaTabelas;
      sincTabelasDoProduto: sincronizaTabelaDoProduto;
      sincClientes        : sincronizaClientes;
      sincCliPorUsu       : sincronizaCliPorUsu;
      sincTransportadoras : sincronizaTransportadoras;
      sincFormasPagamento : sincronizaFormasPagamento;
    end;
  finally
    FimAguarda();
  end;
end;

function TfrmSincronizador.sincronizarRegistros(itemSincro, urlMP, tabelaERP: String; cds: TClientDataSet): Boolean;
var
    Retorno, jsonRegistroAtual :String;
    Client   :TClienteHttpMeusPedidos;
    jsonRet  :TJSonObject;
    erroMuitasrequisicoes :Boolean;
begin
  try
    erroMuitasrequisicoes := false;
    result := false;
    Client := nil;
    Client := TClienteHttpMeusPedidos.Create(fdm.configuracoesIntegracao.application_token,
                                             fdm.configuracoesIntegracao.company_token,
                                             fdm.configuracoesIntegracao.url_base);
    cds.First;
    while not cds.Eof do
    begin
      Application.ProcessMessages;
      jsonRegistroAtual := getJsonRegistros;
      try
        if not cds.FieldByName(CAMPO_ID_EXTERNO).AsString.isEmpty then
          Client.Put(urlMP+'/' + cds.FieldByName(CAMPO_ID_EXTERNO).AsString, jsonRegistroAtual)
        else
          Client.Post(urlMP, jsonRegistroAtual);
      Except
      on e:Exception do
        begin
          lancaLog('ERRO >> '+UTF8Decode(e.Message)+#13#10+#13#10+itemSincro+' >> '+jsonRegistroAtual);
          if pos('tempo_ate_permitir_novamente', e.Message) > 0 then
          begin
            jsonRet := TJSONObject.ParseJSONValue( e.Message ) as TJSONObject;
            AguardarSegundos(StrToIntDef(jsonRet.GetValue('tempo_ate_permitir_novamente').Value,0));
            erroMuitasrequisicoes := true;
          end;
        end;
      end;

      if Client.ClientHttp.ResponseCode in [ST_OK_INCLUSAO, ST_OK_ALTERACAO] then
      begin
        { Se ainda não tem relação criada, cria uma }
        if cds.FieldByName(CAMPO_ID_EXTERNO).AsString.isEmpty then
          TRelacaoTabelasImportacao.criaRelacao(urlMP,tabelaERP,Client.IdResponse,cds.FieldByName(CAMPO_ID_ERP).AsString, DateToStr(Date));

          cds.Edit;
          cds.FieldByName(CAMPO_MARCACAO).AsString   := 'S';
          if cds.FieldByName(CAMPO_ID_EXTERNO).AsString.isEmpty then
            cds.FieldByName(CAMPO_ID_EXTERNO).AsString := Client.IdResponse;
          cds.Post;
      end
      else //ocorreu erro
      begin
        Retorno := Client.ClientHttp.ResponseText;

        lancaLog(inttostr(Client.ClientHttp.ResponseCode)+' - '+ Retorno);
        cds.Edit;
        cds.FieldByName(CAMPO_MARCACAO).AsString   := 'N';
        cds.Post;
      end;

      // se for erro de numero maximo de requisicoes atingidas, passado a espera ele vai tentar enviar o mesmo que parou
      if erroMuitasrequisicoes then
        erroMuitasrequisicoes := false
      else
        cds.Next;
    end;

    result := true;
  finally
    if Assigned(jsonRet) then
      freeAndNil(jsonRet);
    FreeAndNil(Client);
  end;
end;

function TfrmSincronizador.sincronizaTabelaDoProduto: Boolean;
begin
  result := false;
  if edtTabProdutoSeparadas.Value <= 0 then
  begin
    avisar('Nenhuma tabela de preço referente a um produto foi separada para envio');
    exit;
  end;

  sincronizarRegistros('TABELA DO PRODUTO',
                       'produtos_tabela_preco',
                       'PRODUTO_TABELA_PRECO',
                       cdsProdTab);
  result := true;
end;

function TfrmSincronizador.sincronizaTabelas: boolean;
begin
  result := false;
  if edtTabelasSeparadas.Value <= 0 then
  begin
    avisar('Nenhuma tabela foi separada para envio');
    exit;
  end;

  sincronizarRegistros('TABELA',
                       'tabelas_preco',
                       'TABELAS_PRECO',
                       cdsTabelas);
  result := true;
end;

function TfrmSincronizador.sincronizaTransportadoras: boolean;
begin
  result := false;
  if edtTransportadorasSeparadas.Value <= 0 then
  begin
    avisar('Nenhuma transportadora foi separada para envio');
    exit;
  end;

  sincronizarRegistros('TRANSPORTADORA',
                       'transportadoras',
                       'PESSOAS',
                       cdsTransportadoras);
  result := true;
end;

procedure TfrmSincronizador.Timer1Timer(Sender: TObject);
begin
  if FSegundos > 0 then
  begin
    Dec(FSegundos);
    Aguarda('Número de requisições máximas por minuto foi atingida, por favor aguarde alguns instantes.'+#13#10+#13#10+
            '      '+IntToStr(FSegundos)+'s restantes');
  end
  else
  begin
    FSegundos := 0;
    Timer1.Enabled := false;
    if FFinalizaAguarda then
    begin
      FFinalizaAguarda := false;
      FimAguarda();
    end
    else
      Aguarda('Relizando sincronização, por favor aguarde');
  end;
end;

end.
