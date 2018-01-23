unit uConferenciaPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Usuario, Grids, DBGrids, DBGridCBN, ComCtrls, Funcoes,
  frameBuscaPedido, StdCtrls, DB, DBClient, pngimage, ExtCtrls, Mask, ConferenciaItem,
  RxToolEdit, RxCurrEdit, Item, Math, Generics.Collections,
  Buttons, ContNrs, StrUtils, ImgList, frameListaCampo, Pedido, ConferenciaPEdido,
  Provider, Menus, Produto, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, CaixaPedido;

type
  TfrmConferenciaPedido = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    gridItensConferidos: TDBGridCBN;
    gridItens: TDBGridCBN;
    dsItens: TDataSource;
    cdsItensConferidos: TClientDataSet;
    dsItensConferidos: TDataSource;
    Label2: TLabel;
    lbStatus: TLabel;
    Timer1: TTimer;
    cx_aberta: TImage;
    btnNovaCaixa: TSpeedButton;
    Label4: TLabel;
    cbCaixas: TComboBox;
    staTitulo: TLabel;
    Label7: TLabel;
    edtCodigoBarras: TEdit;
    Shape5: TShape;
    btnFecharCaixa: TSpeedButton;
    btnCancelarCaixa: TSpeedButton;
    cdsCX: TClientDataSet;
    cdsCXCODIGO: TIntegerField;
    cdsCXNUMERO_CAIXA: TIntegerField;
    cdsCXCODIGO_CONFERENCIA: TIntegerField;
    cdsCXCODIGO_ITEM_CONFERENCIA: TIntegerField;
    cdsCXCODIGO_ITEM: TIntegerField;
    flecha: TImage;
    dsCX: TDataSource;
    cdsCXProduto: TStringField;
    cdsCXCor: TStringField;
    cdsCXRefPro: TStringField;
    cdsCXQTD_RN: TIntegerField;
    cdsCXQTD_P: TIntegerField;
    cdsCXQTD_M: TIntegerField;
    cdsCXQTD_G: TIntegerField;
    cdsCXQTD_1: TIntegerField;
    cdsCXQTD_2: TIntegerField;
    cdsCXQTD_3: TIntegerField;
    cdsCXQTD_4: TIntegerField;
    cdsCXQTD_6: TIntegerField;
    cdsCXQTD_8: TIntegerField;
    cdsCXQTD_UNICA: TIntegerField;
    cdsCXGRADE_FECHADA: TStringField;
    BuscaPedido1: TBuscaPedido;
    barcodeOFF: TImage;
    barcodeON: TImage;
    Label3: TLabel;
    Panel2: TPanel;
    Shape2: TShape;
    Label1: TLabel;
    labelQtde: TLabel;
    Label6: TLabel;
    labelQtdePecas: TLabel;
    pnlinfoPedido: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    lbEntrega: TLabel;
    lbCliente: TLabel;
    lbRepresentante: TLabel;
    Label16: TLabel;
    Shape6: TShape;
    Panel3: TPanel;
    Shape1: TShape;
    Label5: TLabel;
    labelQtdeConferidos: TLabel;
    Label8: TLabel;
    labelQtdePecasConferidos: TLabel;
    cdsSubstitutos: TClientDataSet;
    cdsSubstitutosCODIGO_ITEM: TIntegerField;
    cdsSubstitutosCODIGO_COR: TIntegerField;
    cdsSubstitutosTAM_RN: TIntegerField;
    cdsSubstitutosTAM_P: TIntegerField;
    cdsSubstitutosTAM_M: TIntegerField;
    cdsSubstitutosTAM_G: TIntegerField;
    cdsSubstitutosTAM_1: TIntegerField;
    cdsSubstitutosTAM_2: TIntegerField;
    cdsSubstitutosTAM_3: TIntegerField;
    cdsSubstitutosTAM_4: TIntegerField;
    cdsSubstitutosTAM_6: TIntegerField;
    cdsSubstitutosTAM_8: TIntegerField;
    cdsSubstitutosTAM_UNICA: TIntegerField;
    cdsSubstitutosGENERO: TStringField;
    cdsSubstitutosQTD_TOTAL: TFloatField;
    cdsCaixas: TClientDataSet;
    dsCaixas: TDataSource;
    dspCaixas: TDataSetProvider;
    cdsCaixasCODIGO: TIntegerField;
    cdsCaixasNUMERO_CAIXA: TStringField;
    cdsCaixasCODIGO_ITEM: TIntegerField;
    cdsCaixasCODIGO_CONFERENCIA: TIntegerField;
    cdsCaixasQTD_RN: TIntegerField;
    cdsCaixasQTD_P: TIntegerField;
    cdsCaixasQTD_M: TIntegerField;
    cdsCaixasQTD_G: TIntegerField;
    cdsCaixasQTD_1: TIntegerField;
    cdsCaixasQTD_2: TIntegerField;
    cdsCaixasQTD_3: TIntegerField;
    cdsCaixasQTD_4: TIntegerField;
    cdsCaixasQTD_6: TIntegerField;
    cdsCaixasQTD_8: TIntegerField;
    cdsCaixasQTD_UNICA: TIntegerField;
    cdsCaixasCODIGO_COR: TIntegerField;
    cdsSubstitutosNUMERO_CAIXA: TStringField;
    Shape3: TShape;
    PopupMenu1: TPopupMenu;
    BuscaCdigodeBarras1: TMenuItem;
    Label10: TLabel;
    lbLimiteEntrega: TLabel;
    SubstituirProduto1: TMenuItem;
    cbInformarQuantidade: TCheckBox;
    ImageList1: TImageList;
    edtCaixa: TEdit;
    cx_fechada: TImage;
    pnlBotoes: TPanel;
    btnImprimir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnConfParcial: TSpeedButton;
    btnSalvaCaixas: TSpeedButton;
    panObs: TPanel;
    Label17: TLabel;
    memoObs: TMemo;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Shape8: TShape;
    Shape4: TShape;
    GroupBox1: TGroupBox;
    lblPercent: TLabel;
    ProgressBar1: TProgressBar;
    Label9: TLabel;
    Shape7: TShape;
    Shape10: TShape;
    Shape9: TShape;
    Shape11: TShape;
    edtRN: TCurrencyEdit;
    edtP: TCurrencyEdit;
    edtM: TCurrencyEdit;
    edtG: TCurrencyEdit;
    edt1: TCurrencyEdit;
    edt2: TCurrencyEdit;
    edt3: TCurrencyEdit;
    edt4: TCurrencyEdit;
    edt6: TCurrencyEdit;
    edt8: TCurrencyEdit;
    edtUnica: TCurrencyEdit;
    Label12: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    btnPedidosSeparacao: TSpeedButton;
    chManterConferencia: TCheckBox;
    pnlSubstituicao: TPanel;
    Image2: TImage;
    Label28: TLabel;
    btnSubstituir: TSpeedButton;
    Image1: TImage;
    btnCancelaSub: TSpeedButton;
    lbRN: TLabel;
    lbP: TLabel;
    lbM: TLabel;
    lbG: TLabel;
    lb1: TLabel;
    lb2: TLabel;
    lb3: TLabel;
    lb4: TLabel;
    lb6: TLabel;
    lb8: TLabel;
    lbUNICA: TLabel;
    Shape12: TShape;
    edtSubsRN: TCurrencyEdit;
    edtMaxRN: TCurrencyEdit;
    edtSubsP: TCurrencyEdit;
    edtMaxP: TCurrencyEdit;
    edtSubsM: TCurrencyEdit;
    edtMaxM: TCurrencyEdit;
    edtSubsG: TCurrencyEdit;
    edtMaxG: TCurrencyEdit;
    edtSubs1: TCurrencyEdit;
    edtMax1: TCurrencyEdit;
    edtSubs2: TCurrencyEdit;
    edtMax2: TCurrencyEdit;
    edtSubs3: TCurrencyEdit;
    edtMax3: TCurrencyEdit;
    edtSubs4: TCurrencyEdit;
    edtMax4: TCurrencyEdit;
    edtSubs6: TCurrencyEdit;
    edtMax6: TCurrencyEdit;
    edtSubs8: TCurrencyEdit;
    edtMax8: TCurrencyEdit;
    edtSubsUNICA: TCurrencyEdit;
    edtMaxUNICA: TCurrencyEdit;
    btnExcluir: TBitBtn;
    dspItens: TDataSetProvider;
    dspItensConferidos: TDataSetProvider;
    cdsItensConferidosCODIGO_ITEM: TIntegerField;
    cdsItensConferidosPRODUTO: TStringField;
    cdsItensConferidosCODPRO: TIntegerField;
    cdsItensConferidosCOR: TStringField;
    cdsItensConferidosCODCOR: TIntegerField;
    cdsItensConferidosREFPRO: TStringField;
    cdsItensConferidosconferido: TStringField;
    cdsItens: TClientDataSet;
    cdsItensCONFERIDO: TStringField;
    cdsItensCODIGO: TIntegerField;
    cdsItensPRODUTO: TStringField;
    cdsItensCODPRO: TIntegerField;
    cdsItensCOR: TStringField;
    cdsItensCODCOR: TIntegerField;
    cdsItensREFPRO: TStringField;
    cdsItensREFCOR: TStringField;
    cdsItensNUM_CAIXA: TIntegerField;
    cdsItensC_I: TStringField;
    Timer2: TTimer;
    cdsItensTIPO: TIntegerField;
    Timer3: TTimer;
    qryItens: TFDQuery;
    qryCaixas: TFDQuery;
    qryCaixasCODIGO: TIntegerField;
    qryCaixasNUMERO_CAIXA: TStringField;
    qryCaixasCODIGO_CONFERENCIA: TIntegerField;
    qryCaixasCODIGO_ITEM: TIntegerField;
    qryCaixasCODIGO_COR: TIntegerField;
    qryCaixasQTD_RN: TIntegerField;
    qryCaixasQTD_P: TIntegerField;
    qryCaixasQTD_M: TIntegerField;
    qryCaixasQTD_G: TIntegerField;
    qryCaixasQTD_1: TIntegerField;
    qryCaixasQTD_2: TIntegerField;
    qryCaixasQTD_3: TIntegerField;
    qryCaixasQTD_4: TIntegerField;
    qryCaixasQTD_6: TIntegerField;
    qryCaixasQTD_8: TIntegerField;
    qryCaixasQTD_UNICA: TIntegerField;
    qryCaixasSTATUS: TStringField;
    cdsItensPRECO: TBCDField;
    cdsItensConferidosQTD_RN_O: TIntegerField;
    cdsItensConferidosQTD_P_O: TIntegerField;
    cdsItensConferidosQTD_M_O: TIntegerField;
    cdsItensConferidosQTD_G_O: TIntegerField;
    cdsItensConferidosQTD_1_O: TIntegerField;
    cdsItensConferidosQTD_2_O: TIntegerField;
    cdsItensConferidosQTD_3_O: TIntegerField;
    cdsItensConferidosQTD_4_O: TIntegerField;
    cdsItensConferidosQTD_6_O: TIntegerField;
    cdsItensConferidosQTD_8_O: TIntegerField;
    cdsItensConferidosQTD_UNICA_O: TBCDField;
    cdsItensConferidosQTD_RN: TIntegerField;
    cdsItensConferidosQTD_P: TIntegerField;
    cdsItensConferidosQTD_M: TIntegerField;
    cdsItensConferidosQTD_G: TIntegerField;
    cdsItensConferidosQTD_1: TIntegerField;
    cdsItensConferidosQTD_2: TIntegerField;
    cdsItensConferidosQTD_3: TIntegerField;
    cdsItensConferidosQTD_4: TIntegerField;
    cdsItensConferidosQTD_6: TIntegerField;
    cdsItensConferidosQTD_8: TIntegerField;
    cdsItensConferidosQTD_UNICA: TIntegerField;
    cdsItensQTD_RN_O: TIntegerField;
    cdsItensQTD_P_O: TIntegerField;
    cdsItensQTD_M_O: TIntegerField;
    cdsItensQTD_G_O: TIntegerField;
    cdsItensQTD_1_O: TIntegerField;
    cdsItensQTD_2_O: TIntegerField;
    cdsItensQTD_3_O: TIntegerField;
    cdsItensQTD_4_O: TIntegerField;
    cdsItensQTD_6_O: TIntegerField;
    cdsItensQTD_8_O: TIntegerField;
    cdsItensQTD_UNICA_O: TBCDField;
    cdsItensQTD_RN: TIntegerField;
    cdsItensQTD_P: TIntegerField;
    cdsItensQTD_M: TIntegerField;
    cdsItensQTD_G: TIntegerField;
    cdsItensQTD_1: TIntegerField;
    cdsItensQTD_2: TIntegerField;
    cdsItensQTD_3: TIntegerField;
    cdsItensQTD_4: TIntegerField;
    cdsItensQTD_6: TIntegerField;
    cdsItensQTD_8: TIntegerField;
    cdsItensQTD_UNICA: TIntegerField;
    cdsItensConferidosCODIGO: TIntegerField;
    qryItensConferidos: TFDQuery;
    cdsItensConferidosINSERINDO: TStringField;
    btnSubstitui: TSpeedButton;
    chkNaoConferidos: TCheckBox;
    chkConferidos: TCheckBox;
    chkTodos: TCheckBox;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtSubs10: TCurrencyEdit;
    edtMax10: TCurrencyEdit;
    edtSubs12: TCurrencyEdit;
    edtMax12: TCurrencyEdit;
    edtSubs14: TCurrencyEdit;
    edtMax14: TCurrencyEdit;
    cdsItensQTD_10_O: TIntegerField;
    cdsItensQTD_12_O: TIntegerField;
    cdsItensQTD_14_O: TIntegerField;
    cdsItensQTD_10: TIntegerField;
    cdsItensQTD_12: TIntegerField;
    cdsItensQTD_14: TIntegerField;
    edt14: TCurrencyEdit;
    Label32: TLabel;
    edt12: TCurrencyEdit;
    Label33: TLabel;
    edt10: TCurrencyEdit;
    Label34: TLabel;
    cdsItensConferidosQTD_10_O: TIntegerField;
    cdsItensConferidosQTD_12_O: TIntegerField;
    cdsItensConferidosQTD_14_O: TIntegerField;
    cdsItensConferidosQTD_10: TIntegerField;
    cdsItensConferidosQTD_12: TIntegerField;
    cdsItensConferidosQTD_14: TIntegerField;
    cdsSubstitutosTAM_10: TIntegerField;
    cdsSubstitutosTAM_12: TIntegerField;
    cdsSubstitutosTAM_14: TIntegerField;
    qryCaixasQTD_10: TIntegerField;
    qryCaixasQTD_12: TIntegerField;
    qryCaixasQTD_14: TIntegerField;
    cdsCaixasQTD_10: TIntegerField;
    cdsCaixasQTD_12: TIntegerField;
    cdsCaixasQTD_14: TIntegerField;
    cdsItensCODIGO_KIT: TIntegerField;
    btnDesmembrar: TBitBtn;
    cdsConferidos: TClientDataSet;
    cdsConferidosCOD_PRODUTO: TIntegerField;
    cdsConferidosCOD_COR: TIntegerField;
    cdsConferidosCOD_TAMANHO: TIntegerField;
    cdsConferidosQUANTIDADE: TFloatField;
    cdsItensTIPO_COR: TStringField;
    btnAlteraCaixas: TBitBtn;
    cdsConferidosTIPO_COR: TStringField;
    cdsConferidosSKU: TStringField;
    cdsItensConferidosREFCOR: TStringField;
    cdsConferidosESTOQUE_ATUAL: TFloatField;
    Button1: TButton;
    procedure BuscaPedido1Exit(Sender: TObject);
    procedure edtCodigoBarrasEnter(Sender: TObject);
    procedure edtCodigoBarrasChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label4MouseEnter(Sender: TObject);
    procedure btnNovaCaixaClick(Sender: TObject);
    procedure btnFecharCaixaClick(Sender: TObject);
    procedure btnCancelarCaixaClick(Sender: TObject);
    procedure cbCaixasClick(Sender: TObject);
    procedure btnConfParcialClick(Sender: TObject);
    procedure BuscaPedido1edtNumPedidoExit(Sender: TObject);
    procedure BuscaCdigodeBarras1Click(Sender: TObject);
    procedure SubstituirProduto1Click(Sender: TObject);
    procedure cdsItensAfterScroll(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure cbInformarQuantidadeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridItensDblClick(Sender: TObject);
    procedure btnSalvaCaixasClick(Sender: TObject);
    procedure BuscaPedido1Enter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPedidosSeparacaoClick(Sender: TObject);
    procedure gridItensExit(Sender: TObject);
    procedure gridItensEnter(Sender: TObject);
    procedure btnCancelaSubClick(Sender: TObject);
    procedure btnSubstituirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure cdsItensConferidosCalcFields(DataSet: TDataSet);
    procedure cdsItensCalcFields(DataSet: TDataSet);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure btnSubstituiClick(Sender: TObject);
    procedure chkTodosClick(Sender: TObject);
    procedure btnDesmembrarClick(Sender: TObject);
    procedure frameMateriaExit(Sender: TObject);
    procedure btnAlteraCaixasClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    FCaixasDoPedido         :TObjectList;
    cdsTamanhos             :TClientDataSet;
    hora_inicio             :TTime;
    linha_estoque_calculado :integer;
    FVisualizarConferencia  :Boolean;
    LinhaSubstituicao       :integer;

    { mostra os dados da conferencia na tela }
    procedure carrega_dados;
    { carrega os itens do pedido }
    procedure AbreItensDoPedido(pCodigoPedido :integer);
    { carrega os itens da conferencia, se existir }
    procedure AbreItensConferidos(pCodigoPedido :integer);

    { busca uma referencia mediante seu codigo de barras e marca no grid ,o item correspondente, como conferido }
    function busca_e_adiciona :Boolean;

    { faz algumas validacoes de busca e retorna o codigo do item correspondente ao produto, cor e tamanho passados por parametro }
    function referenciaEncontrada(codpro, codcor, codigo_cor_pai :integer; tam, masculino_feminino: String; pAcessorio :Boolean;
                                  var achouEspecifico, qtdeTamanhoDisponivel, produtoComCorGenerica :boolean) :integer;

    { verifica se o}
    procedure calcula_completo_imcompleto;
    procedure substitui_generico(coditem, codigo_cor :integer; refcor, cor, tamanho :String; quantidade :integer);

    function insere_altera_item(codpedido, codpro, codcor, quantidade: Integer; preco: Real; tamanho: String; const coditem: integer = 0): Integer;
    procedure atualiza_quantidade_item(coditem, quantidade :integer; tamanho :String; var excluiu :Boolean);
    { busca o codigo de barras do item, com base nos parametros informados }
    function busca_codigo_barras(codigo_produto, codigo_cor :integer; tamanho :String):String;

    { esta procedure faz o contrario da procedure "busca_codigo_barras" }
    procedure item_por_codigo_barras(var codigo_produto, codigo_cor :integer; var refpro, refcor, cor, tamanho :String; var masculino_feminino,
                                     cod_bar, tipo_cor :String; var acessorio :Boolean);
    procedure calcula_percentagem_conferida;
    procedure seleciona_caixas;

    { cria um novo pedido com os itens que atualmente ainda não foram conferidos }
    procedure divide_pedido;
    procedure recalcula_valores;
    function corGenerica(cor :String):Boolean;
    function generoValido(corItemComparado, corItemConferindo :String) :Boolean;
    procedure deleta_itens(codigos_itens :String);
    procedure deleta_conferencia_itens(codigos_conferencia_itens :String);

    { cria um novo item apenas com as quantidades conferidas, recalcula os seus valores e insere ao pedido }
    function  atualiza_item(Pedido :TPedido; codigo_item: Integer; var total :Real; var desconto_itens :Real) :Boolean;

    { faz a mesma coisa que a procedure acima, mas para inserir no novo pedido criado }
    function  cria_item(Pedido :TPedido; Item :TItem; var total :Real; var desconto_itens :Real; grades_inteiras :Boolean) :Boolean;

    procedure AtualizaValoresConferenciaItem(Item :TConferenciaItem; Q_RN, Q_P, Q_M, Q_G, Q_1, Q_2, Q_3, Q_4, Q_6, Q_8, Q_10, Q_12, Q_14, Q_unica :integer);
    function item_conferido(codigo_item :integer) :Boolean;

    { criado para substituir um item de determinada cor e tamanho por outro item da mesma cor, somente mudando o tamanho }
    procedure substitui_item_por_item(cod_bar_substituto :String; qtde_substituida :Integer; tamanho_substituido :String);

    { substituicao normal }
    procedure substitui_item_normal;
    { quando o produto eh vestuario e a cor eh generica(M ou F), ele so pode ser substituido por outra cor generica }
    procedure substitui_item_generico;

    function getJsonProduto(sku: String): String;
    
    procedure habilita_desabilita_caixas(boleana :Boolean);

    function  busca_estoque(codproduto :String; codcor :integer; Tamanho:String) :Real;
    procedure busca_estoque_reservado(qry :TFDQuery; codproduto :integer; codcor :integer);
    procedure busca_estoque_normal(qry :TFDQuery; codproduto :integer; codcor :integer);

    { mostra o estoque da referencia selecionada no grid }
    procedure mostra_estoque;

    { feito para baixar o estoque das referencias contidas no pedido (usar apenas quando o pedido for 100% conferido)}
    procedure atualizaEstoqueLocal(pedidoEcommerce :Boolean);
    procedure atualizaEstoquePedidoTotal(Pedido :TPedido; multiplicador :integer);
    procedure atualizaEstoquePlataforma(multiplicador :integer);
    procedure atualizaEstoquePlataformaPeloPedido(multiplicador :integer);

    procedure Busca_tamanhos(var cds :TClientDataSet);

    function getQuantidadeAtual(sku: String): integer;
    procedure getEstoqueAtualProdutos;
    function buscaProdutos(page :integer) :String;
    { SALVAR }

    procedure Salva_estoque(cod_produto, cod_cor :integer; descricao_tamanho :String; quantidade :Real);
    function Salvar_conferencia :Boolean;

    { Salva a associaçao (ITEM <-> CAIXA) criada }
    procedure SalvarAtualizar_caixas;

  private

    function  Conferencia_finalizada :Boolean;
    function  grade_imcompleta :Boolean;
    function verificaDesmembramento :Boolean;
    procedure  atualizaTabelaDirecionamento;
    function adicionarCaixaPedido :boolean;
    function selecionaMateriaCaixa :integer;

    { se ao dividir o pedido, for solicitado apenas grades fechadas, ele envia para o novo pedido, os itens com grades parcialmente conferidas}
    procedure transfere_conferencia(itens_deletar :String);

    procedure remove_item(codigo :integer);
    function atualiza_qtd_item(Item :TItem; tamanho :String; quantidade :integer; create_alter :String; desconto :Real) :TItem;
    procedure configura_campos_substituicao(tamanho :String; quantidade :Integer);
    procedure limpa_edits_substituicao;

    procedure reinicia_pedido;
    function possuiKit :Boolean;
    procedure desmembrarKits;
    procedure retornarProdutosAoKit(ConferenciaPedido :TConferenciaPedido);
    procedure filtraItens(checkBox :TCheckBox);
    procedure verificaMapaFinalizado;
    procedure carregaCaixa;
    procedure aguardarUmMinuto;

  public
    property visualizarConferencia :Boolean read FVisualizarConferencia write FVisualizarConferencia;
  end;

var
  frmConferenciaPedido: TfrmConferenciaPedido;

const
    Tamanhos : array[1..14] of string=('RN','P','M','G','1','2','3','4','6','8','10','12','14','UNICA');
    TEMPO_ESPERA = 65000;

implementation

uses uModulo, Repositorio, FabricaREpositorio, Especificacao, CriaBalaoInformacao, ProdutosKit, frameBuscaMateria,
     EspecificacaoItemPorPedidoProdutoCor, Caixas, uBuscaCodigoBarras, uRelatorioRomaneio, DirecionamentoEntrada,
     Tamanho, EspecificacaoEstoquePorProdutoCorTamanho, Estoque, uVisualizacaoPedidoSeparacao, Mapa, PedidoMapa,
     EspecificacaoCaixasDaConferencia, uAlteraCaixas, HTTPJSON, TipoProduto, System.JSon, IdHTTP, IdSSLOpenSSL, StringUtilitario;

{$R *.dfm}

{ TfrmConferenciaPedido }

procedure TfrmConferenciaPedido.carregaCaixa;
var especificacao :TEspecificacaoCaixasDaConferencia;
    repositorio   :TRepositorio;
    FListaAux     :TObjectList<TCaixaPedido>;
begin
{  try
    repositorio     := TFabricaRepositorio.GetRepositorio(TcaixaPedido.ClassName);
    especificacao   := TEspecificacaoCaixasDaConferencia.Create(BuscaPedido1.Ped.Conferencia.codigo);
    FCaixasDoPedido := repositorio.GetListaPorEspecificacao(especificacao, intToStr(BuscaPedido1.Ped.Conferencia.codigo));
  finally
    FreeAndNil(especificacao);
    FreeAndNil(repositorio);
  end;    }
end;

procedure TfrmConferenciaPedido.carrega_dados;
var i:integer;
begin

  if not assigned(BuscaPedido1.Ped) then EXIT;

  AbreItensDoPedido( BuscaPedido1.Ped.Codigo );

  AbreItensConferidos( BuscaPedido1.Ped.Codigo );

  calcula_percentagem_conferida;
end;

procedure TfrmConferenciaPedido.BuscaPedido1Exit(Sender: TObject);
var Conferido :Boolean;
begin
  if not assigned(BuscaPedido1.Ped) then
    BuscaPedido1.btnBuscar.Click;

  Conferido := Conferencia_finalizada;

  gridItens.Columns[0].Visible  := Conferido;
  //coluna Caixa
  gridItens.Columns[36].Visible := Conferido;

  habilita_desabilita_caixas(Conferido and not FVisualizarConferencia);

  if assigned(BuscaPedido1.Ped) then begin

     btnDesmembrar.Enabled   := not Conferido and possuiKit;
     edtCodigoBarras.Visible := not FVisualizarConferencia;
     BuscaPedido1.Enabled    := false;

     cdsItens.DisableControls;
     cdsItens.AfterScroll := nil;

     carrega_dados;
     lbStatus.Caption        := 'CONFERINDO PEDIDO';
     hora_inicio             := Time;

     if edtCodigoBarras.Enabled and edtCodigoBarras.Visible then edtCodigoBarras.SetFocus;

     if assigned(BuscaPedido1.Ped.Conferencia) and (BuscaPedido1.Ped.Conferencia.Fim > 0) then
       seleciona_caixas;

     lbEntrega.Caption       := DateToStr(BuscaPedido1.Ped.dt_entrega);
     lbLimiteEntrega.Caption := DateToStr(BuscaPedido1.Ped.dt_limite_entrega);
     lbCliente.Caption       := BuscaPedido1.Ped.Cliente.Razao;
     lbRepresentante.Caption := BuscaPedido1.Ped.Representante.Razao;                     
     memoObs.Text            := BuscaPedido1.Ped.observacao;
     pnlinfoPedido.Visible   := true;
     panObs.Visible          := true;

     if cbCaixas.Visible then begin
       carregaCaixa;

       cdsCaixas.Close;
       qryCaixas.ParamByName('cod_pedido').AsInteger := BuscaPedido1.Ped.Codigo;
       cdsCaixas.Open;

       cdsCaixas.first;

       while not cdsCaixas.Eof do begin

         if not cdsItens.Locate('CODIGO;CODCOR',VarArrayOf([cdsCaixasCODIGO_ITEM.AsInteger,cdsCaixasCODIGO_COR.AsInteger]), []) then
           break;

         cdsItens.Edit;
         cdsItensNUM_CAIXA.asString := cdsCaixasNUMERO_CAIXA.asString;
         cdsItens.Post;

         cdsCaixas.Next;
       end;

     end;

     cdsItens.EnableControls;
     cdsItens.AfterScroll := cdsItensAfterScroll;

     timer3.Enabled := true;

     edtCodigoBarras.Enabled  := not Conferido;
     btnConfParcial.Enabled   := not Conferido;
     btnSalvar.enabled        := not Conferido;
     btnImprimir.enabled      := Conferido;
     btnSalvaCaixas.enabled   := Conferido;

     cdsItens.FindFirst;
     chkTodos.Enabled := true;
     chkConferidos.Enabled := true;
     chkNaoConferidos.Enabled := true;
  end;

  if Conferido then
    Label4.OnMouseEnter := nil
  else
    Label4.OnMouseEnter := Label4MouseEnter;

end;

function TfrmConferenciaPedido.buscaProdutos(page :integer): String;
var vHTTPJSON :THTTPJSON;
    skus      :String;
begin
  try
    //monta o parametro dos skus dos produtos que devem ser buscados
    cdsConferidos.First;
    while not cdsConferidos.Eof do
    begin
      skus := skus + ', '+cdsConferidosSKU.AsString;
      cdsConferidos.Next;
    end;

    vHTTPJSON := nil;
    vHTTPJSON := THTTPJSON.Create(fdm.configuracoesECommerce.token, fdm.configuracoesECommerce.url_base);

    result := vHTTPJSON.Get('produtos/?page='+intToStr(page));//???
  finally
    FreeAndNil(vHTTPJSON);
  end;
end;

function TfrmConferenciaPedido.busca_codigo_barras(codigo_produto, codigo_cor: integer;
 tamanho: String): String;
var codigo_tamanho :Integer;
begin
  codigo_tamanho := strToInt( Campo_por_campo('TAMANHOS','CODIGO','DESCRICAO',tamanho) );
  result := buscaCodigoBarras(codigo_produto, codigo_cor, codigo_tamanho);
end;

procedure TfrmConferenciaPedido.edtCodigoBarrasEnter(Sender: TObject);
begin
  if not assigned(BuscaPedido1.Ped.Itens) then
    BuscaPedido1.edtNumPedido.SetFocus;
end;

procedure TfrmConferenciaPedido.filtraItens(checkBox: TCheckBox);
var filtro :String;
begin
  chkTodos.Checked         := (chkTodos.Caption = checkBox.Caption);
  chkConferidos.Checked    := (chkConferidos.Caption = checkBox.Caption);
  chkNaoConferidos.Checked := (chkNaoConferidos.Caption = checkBox.Caption);

  if chkTodos.Checked then
    filtro := ''
  else if chkConferidos.Checked then
    filtro := 'CONFERIDO = ''S'''
  else if chkNaoConferidos.Checked then
    filtro := 'CONFERIDO <> ''S''';

  cdsItens.Filtered := false;

  if filtro <> '' then
  begin
    cdsItens.Filter   := filtro;
    cdsItens.Filtered := true;
  end;

end;

procedure TfrmConferenciaPedido.edtCodigoBarrasChange(Sender: TObject);
begin
   if length( trim(edtCodigoBarras.Text) ) = 13 then begin
     Timer1.Enabled := true;

     if busca_e_adiciona() then begin
       barcodeON.Visible := true;
       Application.ProcessMessages;
       sleep(60);
       barcodeON.Visible := false;
     end;
   end;
end;

function TfrmConferenciaPedido.busca_e_adiciona :Boolean;
var
    codigo_produto, codigo_cor, quantidade :integer;
    tamanho, conferido, masculino_feminino, refcor, refpro, cor :String;
    produtoComCorGenerica, acessorio, encontrou :Boolean;
    codigo_barras, tipo_cor :String;
    codigoItem, codigo_cor_pai :integer;
    achouEspecifico, qtdeTamanhoDisponivel :Boolean;
begin
  Result                := false;
  produtoComCorGenerica := false;

  codigo_barras := trim(edtCodigoBarras.Text);
  item_por_codigo_barras(codigo_produto, codigo_cor, refpro, refcor, cor , tamanho, masculino_feminino, codigo_barras, tipo_cor, acessorio);

  codigo_cor_pai := StrToIntDef(Campo_por_campo('CORES_FILHAS','CODIGO_COR_PAI', 'CODIGO_COR_FILHA', IntToStr(codigo_cor)),0);

  cdsItens.IndexFieldNames := 'codpro;codcor';
  { se a referencia foi encontrada }
  codigoItem := referenciaEncontrada(codigo_produto, codigo_cor, codigo_cor_pai, tamanho, masculino_feminino, acessorio,
                                     achouEspecifico, qtdeTamanhoDisponivel, produtoComCorGenerica);

  conferido := 'N';

  if (codigoItem > 0) and ( achouEspecifico or produtoComCorGenerica ) then begin

    if not qtdeTamanhoDisponivel then begin
      EmiteSomErro;
      avisar('Peças deste produto ja foram totalmente conferidas',0,'S',1);
      Exit;
    end;

   { Quantidade Padrão }
   quantidade := 1;

    if cbInformarQuantidade.Checked then begin
      quantidade := cdsitens.FieldByName('QTD_'+tamanho).AsInteger +1;

      while quantidade > cdsitens.FieldByName('QTD_'+tamanho).AsInteger do begin
        quantidade := StrToIntDef( chamaInput('INTEGER','Informe a quantidade á conferir [ Qtd. Máx. = '+cdsitens.FieldByName('QTD_'+tamanho).AsString+' ]'), 0 );

        if quantidade > cdsitens.FieldByName('QTD_'+tamanho).AsInteger then begin
          EmiteSomErro;
          avisar('A quantidade informada ultrapassa a quantidade disponível.');
        end;
      end;
    end;


    if qtdeTamanhoDisponivel then
    begin
      { **** Atualiza o respectivo tamanho **** }
      if (produtoComCorGenerica) then
        substitui_generico(cdsItensCodigo.AsInteger, codigo_cor, refcor, cor, tamanho, quantidade);

      if not cdsItensConferidos.Locate('codigo_item',cdsItensCODIGO.AsInteger, []) then begin
        cdsItensConferidos.Append;
        cdsItensConferidosCODIGO.AsInteger       := cdsItensConferidos.RecordCount;
        cdsItensConferidosINSERINDO.AsString     := 'S';
        cdsItensConferidosCODIGO_ITEM.AsInteger  := cdsItensCODIGO.AsInteger;
        cdsItensConferidosProduto.AsString       := cdsItensProduto.AsString;
        cdsItensConferidosCor.AsString           := cdsItensCor.AsString;
        cdsItensConferidosRefPro.AsString        := cdsItensRefPro.AsString;
        cdsItensConferidosCodPro.AsInteger       := cdsItensCodPro.AsInteger;
        cdsItensConferidosCodCor.AsInteger       := cdsItensCodCor.AsInteger;
        cdsItensConferidos.Post;
        cdsItensConferidos.Locate('codigo_item',cdsItensCODIGO.AsInteger, []);
      end;

      cdsItensConferidos.Edit;
      cdsItensConferidos.FieldByName('QTD_'+tamanho).AsInteger      := cdsItensConferidos.FieldByName('QTD_'+tamanho).AsInteger + quantidade;
      cdsItensConferidos.FieldByName('QTD_'+tamanho+'_O').AsInteger := cdsItens.FieldByName('QTD_'+tamanho+'_O').AsInteger;
      cdsItensConferidos.Post;

      cdsTamanhos.Locate('TAMANHO',tamanho,[]);
      if cdsConferidos.Locate('COD_PRODUTO;COD_COR;COD_TAMANHO',varArrayOf([cdsItensConferidosCodPro.AsInteger,
                                                                            cdsItensConferidosCodCor.AsInteger,
                                                                            cdsTamanhos.FieldByName('CODIGO').AsInteger]),[]) then
        cdsConferidos.Edit
      else
      begin
        cdsConferidos.Append;
        cdsConferidosCOD_PRODUTO.AsInteger := cdsItensConferidosCodPro.AsInteger;
        cdsConferidosCOD_COR.AsInteger     := cdsItensConferidosCodCor.AsInteger;
        cdsConferidosCOD_TAMANHO.AsInteger := cdsTamanhos.FieldByName('CODIGO').AsInteger;
        cdsConferidosTIPO_COR.AsString     := tipo_cor;
        cdsConferidosSKU.AsString          := refpro + IfThen(tamanho = 'UNICA', 'UN', tamanho) + refcor;
        cdsConferidosSKU.AsString          := TStringUtilitario.RemoveCaracteresEspeciais( cdsConferidosSKU.AsString );
      end;
      cdsConferidosQUANTIDADE.AsFloat := cdsConferidosQUANTIDADE.AsFloat + quantidade;
      cdsConferidos.Post;

      cdsItens.Edit;
      cdsItens.FieldByName('QTD_'+tamanho).AsInteger := cdsItens.FieldByName('QTD_'+tamanho).AsInteger - quantidade;
      cdsItens.Post;

      btnConfParcial.Enabled     := false;
      btnExcluir.Enabled         := false;
      SubstituirProduto1.Visible := false;
      btnSubstitui.Enabled       := false;

    end;
    cdsItensConferidos.IndexFieldNames := 'CODIGO_ITEM';
  end
  else begin
    EmiteSomErro;
    cdsItens.Filtered := false;
    avisar('Produto não consta no pedido, ou inexistente',0,'S', 1);
  end;

  cdsItens.DisableControls;
  cdsItens.AfterScroll := nil;

  calcula_percentagem_conferida;

  cdsItens.EnableControls;
  cdsItens.AfterScroll := cdsItensAfterScroll;
  cdsItens.Locate('CODIGO',codigoItem, []);
  Result := true;
end;

procedure TfrmConferenciaPedido.FormCreate(Sender: TObject);
begin
  inherited;
  cdsItens.CreateDataSet;
  cdsItensConferidos.CreateDataSet;
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmConferenciaPedido.btnSalvarClick(Sender: TObject);
begin
 try
   dm.conexao.TxOptions.AutoCommit := false;
   if not assigned(self.BuscaPedido1.Ped) then EXIT;
   if not ((cdsItensConferidos.Active) or (cdsItensConferidos.IsEmpty)) and not(FVisualizarConferencia) then begin
     avisar('Não é possível salvar conferência, pois nenhum item foi conferido.');
     Exit;
   end;

   try
     pnlBotoes.Enabled := false;
     Aguarda('Salvando Conferência...');
     if Salvar_conferencia then begin
       avisar('Conferencia salva com sucesso');
       dm.conexao.Commit;
       if chManterConferencia.Checked then
         reinicia_pedido
       else
         self.btnCancelar.Click;
     end
   Except
     on e :Exception do
     begin
       dm.conexao.Rollback;
       avisar(e.message);
     end;
   end;

 finally
   dm.conexao.TxOptions.AutoCommit := true;
   pnlBotoes.Enabled := true;
   self.FimAguarda('');
 end;
end;

function TfrmConferenciaPedido.Salvar_conferencia :Boolean;
var repositorio        :TRepositorio;
    repositorioItem    :TRepositorio;
    repositorioCaixas  :TRepositorio;
    Especificacao      :TEspecificacao;
    ConferenciaPedido  :TConferenciaPedido;
    ConferenciaItem    :TConferenciaItem;
    cdsTemp            :TClientDataSet;
    pedEcommerce       :Boolean;
begin
  repositorio        := nil;
  ConferenciaPedido  := nil;
  result             := false;

  if (labelQtdePecasConferidos.Caption = '0') and not(FVisualizarConferencia) then begin
    avisar('Não é possivel salvar uma conferência sem ao menos 1 item ter sido conferido');
    Exit;
  end;

 try
   repositorio       := TFabricaRepositorio.GetRepositorio(TConferenciaPedido.ClassName);

   ConferenciaPedido := BuscaPedido1.Ped.Conferencia;

   if not Assigned( ConferenciaPedido ) then
     ConferenciaPedido := TConferenciaPedido.Create;

   ConferenciaPedido.codigo_pedido   := BuscaPedido1.Ped.Codigo;
   ConferenciaPedido.codigo_usuario  := dm.UsuarioLogado.Codigo;
   ConferenciaPedido.tempo_decorrido := ConferenciaPedido.tempo_decorrido + TimeToSegundos(time - hora_inicio);

   if ConferenciaPedido.codigo = 0 then
     ConferenciaPedido.inicio     := Date;

   if labelQtdePecas.Caption = labelQtdePecasConferidos.Caption then
     ConferenciaPedido.Fim  := Date;

   cdsItensConferidos.First;
   if not assigned(ConferenciaPedido.Itens) then
     ConferenciaPedido.Itens := TObjectList.Create;

   repositorioItem := TFabricaRepositorio.GetRepositorio( TConferenciaItem.ClassName );

   while not cdsItensConferidos.Eof do begin
     ConferenciaItem := TConferenciaItem( repositorioItem.Get( IfThen(cdsItensConferidosINSERINDO.AsString = 'S',
                                                                      0,
                                                                      cdsItensConferidosCODIGO.AsInteger) )
                                        );

     if not assigned(ConferenciaItem) then
       ConferenciaItem      := TConferenciaItem.Create;

     ConferenciaItem.codigo_conferencia := ConferenciaPedido.codigo;
     ConferenciaItem.codigo_item        := cdsItensConferidosCODIGO_ITEM.AsInteger;

     ConferenciaItem.QTD_RN             := cdsItensConferidosQTD_RN.AsInteger;
     ConferenciaItem.QTD_P              := cdsItensConferidosQTD_P.AsInteger;
     ConferenciaItem.QTD_M              := cdsItensConferidosQTD_M.AsInteger;
     ConferenciaItem.QTD_G              := cdsItensConferidosQTD_G.AsInteger;
     ConferenciaItem.QTD_1              := cdsItensConferidosQTD_1.AsInteger;
     ConferenciaItem.QTD_2              := cdsItensConferidosQTD_2.AsInteger;
     ConferenciaItem.QTD_3              := cdsItensConferidosQTD_3.AsInteger;
     ConferenciaItem.QTD_4              := cdsItensConferidosQTD_4.AsInteger;
     ConferenciaItem.QTD_6              := cdsItensConferidosQTD_6.AsInteger;
     ConferenciaItem.QTD_8              := cdsItensConferidosQTD_8.AsInteger;
     ConferenciaItem.QTD_10             := cdsItensConferidosQTD_10.AsInteger;
     ConferenciaItem.QTD_12             := cdsItensConferidosQTD_12.AsInteger;
     ConferenciaItem.QTD_14             := cdsItensConferidosQTD_14.AsInteger;
     ConferenciaItem.QTD_UNICA          := cdsItensConferidosQTD_UNICA.AsInteger;


     ConferenciaPedido.Itens.Add( ConferenciaItem );

     cdsItensConferidos.next;
   end;


   repositorio.Salvar( ConferenciaPedido );

   if labelQtdePecas.Caption = labelQtdePecasConferidos.Caption then
     verificaMapaFinalizado;

   atualizaTabelaDirecionamento;

   pedEcommerce := assigned(BuscaPedido1.Ped.Representante.DadosRepresentante) and BuscaPedido1.Ped.Representante.DadosRepresentante.rep_ecommerce;
   atualizaEstoqueLocal(pedEcommerce);

   //se for pedido de representante E-Commerce e não for pedido da própria plataforma, o estoque é atualizado na mesma
   if pedEcommerce and (dm.configuracoesECommerce.codigo_representante <> BuscaPedido1.Ped.Representante.Codigo) then
   begin
     try
       Aguarda('Salvando estoque na plataforma...');
       atualizaEstoquePlataforma(-1);
     finally
       FimAguarda('');
     end;
   end;

   //se foi 100% conferido
   if labelQtdePecas.Caption = labelQtdePecasConferidos.Caption then
     retornarProdutosAoKit(ConferenciaPedido);

   result             := true;
 finally
   freeAndNil( repositorio );
   FreeAndNil( repositorioItem );
 end;
end;

procedure TfrmConferenciaPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ( btnImprimir.Visible ) and ( (ssCtrl in Shift) AND (Key = ord('P')) ) then   btnImprimir.Click;
end;

procedure TfrmConferenciaPedido.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if not assigned(BuscaPedido1.Ped) then EXIT;
  
  BuscaPedido1.Enabled := true;
  BuscaPedido1.limpa;
  BuscaPedido1.edtNumPedido.Clear;
  BuscaPedido1.edtNumPedido.SetFocus;
  edtCodigoBarras.Visible := false;
  cdsItens.EmptyDataSet;
  cdsItensConferidos.EmptyDataSet;
  cdsConferidos.EmptyDataSet;
  labelQtdeConferidos.Caption      := '0';
  labelQtde.Caption                := '0';
  labelQtdePecasConferidos.Caption := '0';
  labelQtdePecas.Caption           := '0';
  lbStatus.Caption                 := 'AGUARDANDO SELEÇÃO';
  hora_inicio                      := 0;
  PageControl1.ActivePageIndex     := 0;
  lblPercent.Caption               := '0,0%';
  ProgressBar1.Position            := 0;
  pnlinfoPedido.Visible            := false;
  panObs.Visible                   := false;
  btnCancelarCaixa.Enabled         := false;
  btnFecharCaixa.Enabled           := false;
  cbCaixas.Enabled                 := true;
  cbCaixas.ItemIndex               := 0;

  btnSalvaCaixas.enabled           := false;
  btnImprimir.enabled              := false;
  btnDesmembrar.Enabled            := false;

  habilita_desabilita_caixas(false);

  //coluna Caixa
  gridItens.columns[36].Visible := false;

  if cdsCaixas.Active         then  cdsCaixas.EmptyDataSet;
  if cdsSubstitutos.Active    then  cdsSubstitutos.EmptyDataSet;

  chkTodos.Enabled := false;
  chkConferidos.Enabled := false;
  chkNaoConferidos.Enabled := false;
  btnExcluir.Enabled       := true;
  chkTodos.Checked := true;
  {if assigned(FCaixasDoPedido) then
    FCaixasDoPedido.Clear;   }
end;

function TfrmConferenciaPedido.Conferencia_finalizada: Boolean;
var
    ConferenciaPedido :TConferenciaPedido;
begin
 try
   Result := false;

   if not assigned(BuscaPedido1.Ped) then EXIT;

   ConferenciaPedido := TConferenciaPedido.Create( BuscaPedido1.Ped.Codigo );

   if ConferenciaPedido.codigo > 0 then begin
     if ConferenciaPedido.Fim > StrToDateTime('01/01/1950') then begin
       result := true;
       avisar('Este pedido ja foi totalmente conferido');
     end
     else
       result := false;
   end;

 Except
   FreeAndNil( ConferenciaPedido );
 end;
end;

procedure TfrmConferenciaPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if assigned(BuscaPedido1.Ped) then begin
    if not confirma('Conferência em andamento, deseja sair sem salvar a operação?') then
      abort;
  end;

{  if assigned(FCaixasDoPedido) then
    FreeAndNil(FCaixasDoPedido);  }
  inherited;
end;

procedure TfrmConferenciaPedido.gridItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var linha_selecionada :integer;
begin

  if (Rect.Top = TStringGrid(Sender).CellRect( DataCol ,TStringGrid(Sender).Row).Top) then begin
    TDBGridCBN(Sender).Canvas.Font.Style  := Canvas.Font.Style +[fsBold];
    TDBGridCBN(Sender).Canvas.Font.Color  := clwhite;
    TDBGridCBN(Sender).Canvas.Brush.Color := $009E6C3A;

    if AnsiIndexStr(Column.FieldName,
     ['QTD_RN','QTD_P','QTD_M','QTD_G','QTD_1','QTD_2','QTD_3','QTD_4','QTD_6','QTD_8','QTD_10','QTD_12','QTD_14','QTD_UNICA']) >= 0 then
     TDBGridCBN(Sender).Canvas.Font.Color  := IfThen( ((TDBGridCbn(Sender).DataSource.DataSet).FieldByName(Column.FieldName).AsInteger = 0) and
                                                      ((TDBGridCbn(Sender).DataSource.DataSet).FieldByName(Column.FieldName+'_O').AsInteger = 0), $009E6C3A, clwhite);
    if AnsiIndexStr(Column.FieldName,
     ['QTD_RN_O','QTD_P_O','QTD_M_O','QTD_G_O','QTD_1_O','QTD_2_O','QTD_3_O','QTD_4_O','QTD_6_O','QTD_8_O','QTD_10_O','QTD_12_O','QTD_14_O','QTD_UNICA_O']) >= 0 then
     TDBGridCBN(Sender).Canvas.Font.Color  := IfThen( (TDBGridCbn(Sender).DataSource.DataSet).FieldByName(Column.FieldName).AsInteger = 0, $009E6C3A, clwhite);


  end
  else if (Column.Field <> cdsItensNUM_CAIXA) and
          (trim(cbCaixas.Items[ cbCaixas.itemIndex ]) <> '' ) and
          (cdsItensNUM_CAIXA.AsInteger = strToInt(trim(cbCaixas.Items[ cbCaixas.itemIndex ]))) then begin
    TDBGridCBN(Sender).Canvas.Font.Color  := clblack;
    TDBGridCBN(Sender).Canvas.Brush.Color := $000080FF;
  end
  else if AnsiIndexStr(Column.FieldName,
  ['QTD_RN','QTD_P','QTD_M','QTD_G','QTD_1','QTD_2','QTD_3','QTD_4','QTD_6','QTD_8','QTD_10','QTD_12','QTD_14','QTD_UNICA']) >= 0 then begin

    TDBGridCBN(Sender).Canvas.Font.Color  := IfThen( ((TDBGridCbn(Sender).DataSource.DataSet).FieldByName(Column.FieldName).AsInteger = 0) and
                                                     ((TDBGridCbn(Sender).DataSource.DataSet).FieldByName(Column.FieldName+'_O').AsInteger = 0), $00D6DACF, clGreen);
    TDBGridCBN(Sender).Canvas.Font.Style  := [fsBold];
    TDBGridCBN(Sender).Canvas.Font.Name   := 'Arial';
    TDBGridCBN(Sender).Canvas.Font.Size   := 11;
    TDBGridCBN(Sender).Canvas.Brush.Color := $00D6DACF;
  end
  else if AnsiIndexStr(Column.FieldName,
  ['QTD_RN_O','QTD_P_O','QTD_M_O','QTD_G_O','QTD_1_O','QTD_2_O','QTD_3_O','QTD_4_O','QTD_6_O','QTD_8_O','QTD_10_O','QTD_12_O','QTD_14_O','QTD_UNICA_O']) >= 0 then begin
    Column.Title.Font.Color := $00F5F5F5;

    TDBGridCBN(Sender).Canvas.Font.Color  := IfThen( (TDBGridCbn(Sender).DataSource.DataSet).FieldByName(Column.FieldName).AsInteger > 0, clGray, clwhite);
    TDBGridCBN(Sender).Canvas.Font.Style  := [fsBold];
    TDBGridCBN(Sender).Canvas.Font.name   := 'Arial';
    TDBGridCBN(Sender).Canvas.Font.Size   := 11;
    TDBGridCBN(Sender).Canvas.Brush.Color := clwhite;
  end
  else if AnsiIndexStr(Column.FieldName, ['REFPRO','PRODUTO', 'COR']) >= 0 then begin
    TDBGridCBN(Sender).Canvas.Font.name   := 'Calibri';
    TDBGridCBN(Sender).Canvas.Font.Size   := 8;

    if TDBGridCBN(Sender).Fields[1].asString = 'S' then begin {se campo conferido = S}
      TDBGridCBN(Sender).Canvas.Brush.Color := $0086B98B;
      TDBGridCBN(Sender).Canvas.FillRect(Rect);
      TDBGridCBN(Sender).DefaultDrawDataCell(Rect, TDBGridCBN(Sender).columns[datacol].field, State);
    end;
  end;

  inherited;

  TDBGridCBN(Sender).DefaultDrawColumnCell( Rect, DataCol, Column, state);
  Column.Title.Font.Style := [fsBold];
  Column.Title.Font.Size  := 9;

  if (Column.Visible) and (Column.Title.Caption = 'CX') then begin
    TDBGridCBN(Sender).Canvas.FillRect(Rect);

    if cdsItensNUM_CAIXA.AsInteger = 0 then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left + 3, Rect.Top , 1, true)
    else if cdsItensNUM_CAIXA.AsInteger > 0 then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left + 3, Rect.Top , 0, true);

  end;

  if (Column.Visible) and (Column.Title.Caption = 'Estoque') then begin
    TDBGridCBN(Sender).Canvas.FillRect(Rect);

    if cdsItensC_I.AsString = 'S' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left + 15, Rect.Top , 2, true)
    else
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left + 15, Rect.Top , 3, true);

  end;
         
end;

procedure TfrmConferenciaPedido.item_por_codigo_barras(var codigo_produto, codigo_cor :integer; var refpro, refcor, cor, tamanho :String;
 var masculino_feminino, cod_bar, tipo_cor :String; var acessorio :Boolean);
begin
  codigo_produto := 0;
  codigo_cor     := 0;

  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := ' select cb.codproduto, cb.codcor, cor.referencia refcor, pro.referencia refpro, cor.descricao cor, tam.descricao tamanho, '+
                              ' iif(pc.genero = ''M'',''MASCULINO'',                                                       '+
                              '      iif(pc.genero = ''F'', ''FEMININO'','''')) GENERO, tp.descricao tipo, cor.tipo tipocor '+
                              ' from codigo_barras cb                                                                      '+
                              ' left join tamanhos tam on tam.codigo = cb.codtamanho                                       '+
                              ' left join produtos pro on pro.codigo = cb.codproduto                                       '+
                              ' left join produto_cores pc on ( pc.codproduto = pro.codigo and                             '+
                              '                                 pc.codcor = cb.codcor)                                     '+
                              ' left join cores cor on cor.codigo = cb.codcor                                              '+
                              ' left join tipo_produto tp on tp.codigo = pro.cod_tipo                                      '+
                              ' where cb.numeracao = :codbar                                                               ';

  fdm.qryGenerica.ParamByName('codbar').AsString := cod_bar;
  fdm.qryGenerica.Open;

  if fdm.qryGenerica.IsEmpty then Exit;

  codigo_produto      := fdm.qryGenerica.fieldByName('codproduto').AsInteger;
  codigo_cor          := fdm.qryGenerica.fieldByName('codcor').AsInteger;
  refpro              := fdm.qryGenerica.fieldByName('refpro').AsString;
  refcor              := fdm.qryGenerica.fieldByName('refcor').AsString;
  cor                 := fdm.qryGenerica.fieldByName('cor').AsString;
  tamanho             := fdm.qryGenerica.fieldByName('tamanho').AsString;
  masculino_feminino  := fdm.qryGenerica.fieldByName('genero').AsString;
  acessorio           := (fdm.qryGenerica.fieldByName('tipo').AsString = 'ACESSORIO');
  tipo_cor            := fdm.qryGenerica.fieldByName('tipocor').AsString;
end;

procedure TfrmConferenciaPedido.calcula_percentagem_conferida;
var total_pecas, total_pecas_conferidas :integer;
begin
  total_pecas            := 0;
  total_pecas_conferidas := 0;

  cdsItens.First;
  while not cdsItens.Eof do begin

   total_pecas := total_pecas + cdsItensQTD_RN_O.AsInteger;
   total_pecas := total_pecas + cdsItensQTD_P_O.AsInteger;
   total_pecas := total_pecas + cdsItensQTD_M_O.AsInteger;
   total_pecas := total_pecas + cdsItensQTD_G_O.AsInteger;
   total_pecas := total_pecas + cdsItensQTD_1_O.AsInteger;
   total_pecas := total_pecas + cdsItensQTD_2_O.AsInteger;
   total_pecas := total_pecas + cdsItensQTD_3_O.AsInteger;
   total_pecas := total_pecas + cdsItensQTD_4_O.AsInteger;
   total_pecas := total_pecas + cdsItensQTD_6_O.AsInteger;
   total_pecas := total_pecas + cdsItensQTD_8_O.AsInteger;
   total_pecas := total_pecas + cdsItensQTD_10_O.AsInteger;
   total_pecas := total_pecas + cdsItensQTD_12_O.AsInteger;
   total_pecas := total_pecas + cdsItensQTD_14_O.AsInteger;
   total_pecas := total_pecas + cdsItensQTD_UNICA_O.AsInteger;

   total_pecas_conferidas := total_pecas_conferidas + (cdsItensQTD_RN_O.AsInteger - cdsItensQTD_RN.AsInteger);
   total_pecas_conferidas := total_pecas_conferidas + (cdsItensQTD_P_O.AsInteger - cdsItensQTD_P.AsInteger);
   total_pecas_conferidas := total_pecas_conferidas + (cdsItensQTD_M_O.AsInteger - cdsItensQTD_M.AsInteger);
   total_pecas_conferidas := total_pecas_conferidas + (cdsItensQTD_G_O.AsInteger - cdsItensQTD_G.AsInteger);
   total_pecas_conferidas := total_pecas_conferidas + (cdsItensQTD_1_O.AsInteger - cdsItensQTD_1.AsInteger);
   total_pecas_conferidas := total_pecas_conferidas + (cdsItensQTD_2_O.AsInteger - cdsItensQTD_2.AsInteger);
   total_pecas_conferidas := total_pecas_conferidas + (cdsItensQTD_3_O.AsInteger - cdsItensQTD_3.AsInteger);
   total_pecas_conferidas := total_pecas_conferidas + (cdsItensQTD_4_O.AsInteger - cdsItensQTD_4.AsInteger);
   total_pecas_conferidas := total_pecas_conferidas + (cdsItensQTD_6_O.AsInteger - cdsItensQTD_6.AsInteger);
   total_pecas_conferidas := total_pecas_conferidas + (cdsItensQTD_8_O.AsInteger - cdsItensQTD_8.AsInteger);
   total_pecas_conferidas := total_pecas_conferidas + (cdsItensQTD_10_O.AsInteger - cdsItensQTD_10.AsInteger);
   total_pecas_conferidas := total_pecas_conferidas + (cdsItensQTD_12_O.AsInteger - cdsItensQTD_12.AsInteger);
   total_pecas_conferidas := total_pecas_conferidas + (cdsItensQTD_14_O.AsInteger - cdsItensQTD_14.AsInteger);
   total_pecas_conferidas := total_pecas_conferidas + (cdsItensQTD_UNICA_O.AsInteger - cdsItensQTD_UNICA.AsInteger);

    cdsItens.Next;
  end;
  cdsItens.First;

  ProgressBar1.Max      := total_pecas;
  ProgressBar1.Position := total_pecas_conferidas;
  lblPercent.Caption    := FormatFloat('0.00', ((total_pecas_conferidas / total_pecas) * 100) ) + '%';

  labelQtde.Caption                := IntToStr(cdsItens.RecordCount);
  labelQtdePecas.Caption           := IntToStr(total_pecas);
  labelQtdeConferidos.Caption      := IntToStr(cdsItensConferidos.RecordCount);
  labelQtdePecasConferidos.Caption := IntToStr(total_pecas_conferidas);
end;

procedure TfrmConferenciaPedido.Label3MouseLeave(Sender: TObject);
begin
  TCriaBalaoInformacao.HideBalloonTip(BuscaPedido1.edtNumPedido.Handle);
end;

procedure TfrmConferenciaPedido.Label3MouseEnter(Sender: TObject);
begin
  if not assigned(BuscaPedido1.Ped) then
    TCriaBalaoInformacao.ShowBalloonTip(BuscaPedido1.edtNumPedido.Handle, 'Informe o nº do pedido ou selecione-o na lupa ao lado, para iniciar sua conferência ou continuar, caso ja exista uma para o pedido selecionado.', 'Informação', 1);
end;

procedure TfrmConferenciaPedido.Label4MouseEnter(Sender: TObject);
begin
  TCriaBalaoInformacao.ShowBalloonTip(edtCaixa.Handle, 'Selecione uma caixa já criada ou crie uma no botão "Nova" (ao lado), para inserir os itens referente a mesma.', 'Informação', 1);
end;

procedure TfrmConferenciaPedido.btnNovaCaixaClick(Sender: TObject);
var numero :integer;
begin
  numero := StrToIntDef( cbCaixas.Items[cbCaixas.Items.Count - 1] , 0);

  cbCaixas.Items.Add( intToStr(numero+1) );
  cbCaixas.ItemIndex := cbCaixas.Items.Count - 1;
  gridItens.Repaint;

  btnNovaCaixa.Enabled     := false;
  btnCancelarCaixa.Enabled := true;
  btnFecharCaixa.Enabled   := true;
  cbCaixas.Enabled         := false;
  flecha.Visible           := true;
  cx_aberta.Visible        := true;

 { if not adicionarCaixaPedido then
    btnCancelarCaixa.Click;  }
end;

function TfrmConferenciaPedido.selecionaMateriaCaixa: integer;
var buscaMateria :TBuscaMateria;
    panel        :TPanel;
    titulo       :TLabel;
begin
  buscaMateria        := TBuscaMateria.Create(nil);
  buscaMateria.Parent := self;//panel;
  buscaMateria.Align  := alBottom;
  buscaMateria.BringToFront;
  buscamateria.FiltroDescricao := ' DESCRICAO LIKE ''CAIXA PAP.%'' ';
  buscaMateria.TituloBusca     := 'Selecione o tamanho da nova caixa criada...';
  buscamateria.btnBusca.Click;
  result := buscaMateria.edtCodigo.AsInteger;
  buscaMateria.Destroy;
end;

procedure TfrmConferenciaPedido.seleciona_caixas;
begin
  dm.qryGenerica.Close;
  dm.qryGenerica.SQL.Text := 'select distinct c.numero_caixa from caixas c                         '+
                             'inner join conferencia_pedido cp on cp.codigo = c.codigo_conferencia '+
                             'where cp.codigo_pedido = :codigo                                     ';

  dm.qryGenerica.ParamByName('codigo').AsInteger := BuscaPedido1.Ped.Codigo;
  dm.qryGenerica.Open;

  cbCaixas.Items.Clear;

  cbCaixas.Items.Add('');
  cbCaixas.Tag := cbCaixas.Items.Count;
    
  if dm.qryGenerica.IsEmpty then Exit;

  dm.qryGenerica.First;
  while not dm.qryGenerica.Eof do begin
    cbCaixas.Items.Add(dm.qryGenerica.fieldByName('numero_caixa').AsString);

    dm.qryGenerica.Next;
  end;

  cbCaixas.Tag := cbCaixas.Items.Count; //numero de caixas ja salvas nesse pedido
end;

procedure TfrmConferenciaPedido.btnFecharCaixaClick(Sender: TObject);
begin
  if not cdsItens.Locate('NUM_CAIXA', strToInt(cbCaixas.Items[ cbCaixas.itemIndex ]), []) then begin
    avisar('Uma caixa sem itens adicionados, não pode ser fechada, somente cancelada.');
    exit;
  end;

  cbCaixas.ItemIndex       := 0;
  gridItens.Repaint;
  Label4MouseEnter(nil);

  flecha.Visible           := false;
  cx_aberta.Visible        := false;
  btnNovaCaixa.Enabled     := true;
  btnCancelarCaixa.Enabled := false;
  btnFecharCaixa.Enabled   := false;
  cbCaixas.Enabled         := true;
end;

procedure TfrmConferenciaPedido.btnCancelarCaixaClick(Sender: TObject);
begin

  btnNovaCaixa.Enabled     := true;
  btnCancelarCaixa.Enabled := false;
  btnFecharCaixa.Enabled   := false;
  cbCaixas.Enabled         := true;
  flecha.Visible           := false;
  cx_aberta.Visible        := false;

  if (strToIntDef( cbCaixas.Items[ cbCaixas.ItemIndex ], 0) > 0) and not
     (cdsCaixas.Locate('NUMERO_CAIXA',strToInt( cbCaixas.Items[ cbCaixas.ItemIndex ]), [])) then
        cbCaixas.Items.Delete( cbCaixas.ItemIndex );

  cbCaixas.ItemIndex := 0;
end;

procedure TfrmConferenciaPedido.cbCaixasClick(Sender: TObject);
begin
  IF cbCaixas.ItemIndex > 0 then begin
    cbCaixas.Enabled         := false;
    btnNovaCaixa.Enabled     := false;
    btnFecharCaixa.Enabled   := true;
    btnCancelarCaixa.Enabled := false;

    flecha.Visible           := true;
    cx_aberta.Visible        := true;
  end;
  gridItens.Repaint;
end;

function TfrmConferenciaPedido.generoValido(corItemComparado, corItemConferindo: String): Boolean;
begin
  result := corItemConferindo.IsEmpty or (corItemComparado.Equals(corItemConferindo));
end;

function TfrmConferenciaPedido.grade_imcompleta: Boolean;
begin
  result := false;
  
  cdsItensConferidos.DisableControls;
  cdsItensConferidos.First;
  while not cdsItensConferidos.Eof do begin

         if cdsItensConferidosQTD_RN.AsInteger < cdsItensConferidosQTD_RN_O.AsInteger       then result := true
    else if cdsItensConferidosQTD_P.AsInteger < cdsItensConferidosQTD_P_O.AsInteger         then result := true
    else if cdsItensConferidosQTD_M.AsInteger < cdsItensConferidosQTD_M_O.AsInteger         then result := true
    else if cdsItensConferidosQTD_G.AsInteger < cdsItensConferidosQTD_G_O.AsInteger         then result := true
    else if cdsItensConferidosQTD_1.AsInteger < cdsItensConferidosQTD_1_O.AsInteger         then result := true
    else if cdsItensConferidosQTD_2.AsInteger < cdsItensConferidosQTD_2_O.AsInteger         then result := true
    else if cdsItensConferidosQTD_3.AsInteger < cdsItensConferidosQTD_3_O.AsInteger         then result := true
    else if cdsItensConferidosQTD_4.AsInteger < cdsItensConferidosQTD_4_O.AsInteger         then result := true
    else if cdsItensConferidosQTD_6.AsInteger < cdsItensConferidosQTD_6_O.AsInteger         then result := true
    else if cdsItensConferidosQTD_8.AsInteger < cdsItensConferidosQTD_8_O.AsInteger         then result := true
    else if cdsItensConferidosQTD_10.AsInteger < cdsItensConferidosQTD_10_O.AsInteger       then result := true
    else if cdsItensConferidosQTD_12.AsInteger < cdsItensConferidosQTD_12_O.AsInteger       then result := true
    else if cdsItensConferidosQTD_14.AsInteger < cdsItensConferidosQTD_14_O.AsInteger       then result := true
    else if cdsItensConferidosQTD_UNICA.AsInteger < cdsItensConferidosQTD_UNICA_O.AsInteger then result := true;

    if result then begin
      avisar('PRODUTO: '+cdsItensConferidosRefPro.AsString + ' - ' + cdsItensConferidosProduto.AsString + #13#10 +
             'COR: '+ cdsItensConferidosCor.AsString + ', está com a grade imcompleta. Complete a grade ou remova o produto.');
      break;
    end;

    cdsItensConferidos.Next;
  end;
  cdsItensConferidos.EnableControls;
end;

procedure TfrmConferenciaPedido.btnConfParcialClick(Sender: TObject);
begin
 if verificaDesmembramento then
    avisar('Existem kits desmembrados conferidos parcialmente, impossibilitando assim o fechamento da conferência parcial.')
 else if btnFecharCaixa.Enabled then
    avisar('Caixa '+cbCaixas.Items[cbCaixas.itemindex]+' ainda está aberta.'+#13#10+'Favor, fecha-la antes fechar conferência parcial.')
 else begin

   if (cdsItensConferidos.IsEmpty) or (labelQtdePecas.Caption = labelQtdePecasConferidos.Caption) then begin
     avisar('Conferência parcial não pode ser realizada pois nenhum item foi conferido');
     Exit;
   end;

   if confirma('( Obs: Esta ação finaliza e separa esta conferência, com os itens atualmente conferidos,'+#13#10+
               'e cria um novo pedido com os itens restantes )'+#13#10+#13#10+'Confirma conferência parcial?') then
     divide_pedido;
 end;
end;

procedure TfrmConferenciaPedido.btnDesmembrarClick(Sender: TObject);
begin
  if confirma('Confirma desmembramento de kits para conferência individual?'+#13#10+
              '(Obs: Ao final da conferência os produtos voltarão aos respectivos kits)') then
  begin
    desmembrarKits;
    reinicia_pedido;
  end;
end;

procedure TfrmConferenciaPedido.divide_pedido;
var Pedido, PedidoNovo :TPedido;
    repositorio :TRepositorio;
    i, codItem  :integer;
    total, desconto_itens : Real;
    itens_deletar :String;
    Conferencia :TConferenciaPedido;
    Item :TItem;
    apenas_grades_fechadas, existe_grade_fechada :Boolean;
begin
  if not( lblPercent.Caption <> '0,0%' ) then begin
    avisar('Só se pode separar a mercadoria, com no mínimo 1 item conferido');
    Exit;
  end;

  apenas_grades_fechadas := confirma('Separar apenas referências com grades fechadas?');
  existe_grade_fechada   := false;

  btnConfParcial.Tag := 1;

  Conferencia := TConferenciaPedido.Create( BuscaPedido1.Ped.Codigo );
  //Conferencia := GetConferencia(BuscaPedido1.Ped.Codigo);

  Pedido      := nil;
  PedidoNovo  := nil;
  repositorio := nil;

  try
    Aguarda('Gerando conferência parcial');
    dm.conexao.TxOptions.AutoCommit := false;
  try

    repositorio := TFabricaRepositorio.GetRepositorio( TPedido.ClassName );
    Pedido      := TPedido( repositorio.Get( BuscaPedido1.Ped.Codigo ) );

    //verifica, pois existe possibilidade de ja ser um pedido parcial
    if Pedido.cod_pedido_matriz = 0 then
      Pedido.cod_pedido_matriz := BuscaPedido1.codigo;
      
    Pedido.Itens.Clear;

    itens_deletar  := '';
    total          := 0;
    desconto_itens := 0;

    { deixa apenas os itens conferidos no pedido atual }
    for i := 0 to BuscaPedido1.Ped.Itens.Count - 1 do begin

      codItem := (BuscaPedido1.Ped.Itens[i] as TItem).codigo;

      { GRADE FECHADA = todas as peças de todos os tamanhos do item estao conferidas }
      //se o item esta com a grade fechada ele ja entra sem verificação
      if  ( cdsItens.Locate('CODIGO', codItem, [] ) ) and ( cdsItensCONFERIDO.AsString = 'S') then begin
        Pedido.Itens.Add( (BuscaPedido1.Ped.Itens[i] as TItem) );
        total          := total + (BuscaPedido1.Ped.Itens[i] as TItem).valor_total;
        desconto_itens := desconto_itens + (BuscaPedido1.Ped.Itens[i] as TItem).desconto;
        existe_grade_fechada := true;
      end
      //se apenas_grades_fechadas = true, ou se o item não tiver nenhuma peça conferida, o item é deletado e só entra no novo pedido
      else begin
        if (apenas_grades_fechadas) or not atualiza_item( Pedido, codItem, total, desconto_itens) then
          itens_deletar := itens_deletar + intToStr( codItem ) + ',';
      end;
    end;

    if apenas_grades_fechadas and not existe_grade_fechada then
    begin
      avisar('Nenhuma referência, com a grade fechada, foi encontrada. Operação abortada.');
      Exit;
    end;

    Pedido.valor_total    := total;
    Pedido.desconto_itens := desconto_itens;

    { inicia-se um novo pedido }
    PedidoNovo := TPedido( repositorio.Get( BuscaPedido1.Ped.Codigo ) );
    PedidoNovo.Itens.Clear;
    { Zera o codigo do pedido e seus itens, para se criar um novo pedido com os itens não conferidos }
    PedidoNovo.Codigo    := 0;
    PedidoNovo.cod_pedido_matriz := Pedido.cod_pedido_matriz;

    if pos('-',Pedido.numpedido) > 0 then
      PedidoNovo.numpedido := copy(Pedido.numpedido, 1, length(Pedido.numpedido)-1) +
                          IntToStr( StrToInt( copy(Pedido.numpedido, pos('-',Pedido.numpedido)+1,3 ) ) + 1)
    else
      PedidoNovo.numpedido := Pedido.numpedido + '-1';

    total := 0;
    desconto_itens := 0;
    { Adiciona itens NÃO conferidos para criar um novo pedido }
    for i := 0 to BuscaPedido1.Ped.Itens.Count - 1 do begin

      codItem := (BuscaPedido1.Ped.Itens[i] as TItem).codigo;

      if  ( cdsItens.Locate('CODIGO', codItem , [] )) and ( cdsItensCONFERIDO.AsString <> 'S') then
          cria_item(PedidoNovo, (BuscaPedido1.Ped.Itens[i] as TItem), total, desconto_itens, apenas_grades_fechadas);

    end;

    PedidoNovo.valor_total    := total;
    PedidoNovo.desconto_itens := desconto_itens;

    { Salva o pedido 'MATRIZ' alterado}
    Pedido.salvar;
    { Salva um novo pedido 'FILIAL' criado }
    PedidoNovo.salvar;

    if apenas_grades_fechadas then
      transfere_conferencia(itens_deletar);

    deleta_itens(itens_deletar);

    recalcula_valores;

    repositorio     := TFabricaRepositorio.GetRepositorio(TConferenciaPedido.ClassName);
    Conferencia.Fim := Date;
    repositorio.Salvar( Conferencia );

    { baixa o estoque dos itens do pedido, correspondente a conferencia finalizada }
    atualizaEstoquePedidoTotal(Pedido, -1);

    if assigned(BuscaPedido1.Ped.Representante.DadosRepresentante) and BuscaPedido1.Ped.Representante.DadosRepresentante.rep_ecommerce and
       (dm.configuracoesECommerce.codigo_representante <> BuscaPedido1.Ped.Representante.Codigo) then
    begin
      AbreItensDoPedido(Pedido.Codigo);
      atualizaEstoquePlataformaPeloPedido(-1);
    end;

    dm.conexao.Commit;
    avisar('Conferência parcial do pedido Nº '+BuscaPedido1.Ped.numpedido+' realizada com sucesso.'+#13#10+#13#10+
           'Pedido Nº '+pedidoNovo.numpedido+' gerado para o restante do pedido.');

    btnCancelar.Click;

  Except
    on e : Exception do
     begin
       dm.conexao.Rollback;
       reinicia_pedido;
       avisar(e.Message);
     end;
  end;

  finally
    dm.conexao.TxOptions.AutoCommit := true;
    FreeAndNil(repositorio);
    FimAguarda();
  end;
end;

procedure TfrmConferenciaPedido.recalcula_valores;
var total_pedido_real :Real;
    total_pedido      :Real;
    percentagem_equivalente :Real;
    i, x              :integer;
    repositorio       :TRepositorio;
    Pedido            :Tpedido;
    cod_ultimo_pedido :String;
begin
{ SALVA VALORES PERCENTUALMENTE CORRESPONDENTE AO PEDIDO CONFERIDO }
  repositorio       := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);
  Pedido            := TPedido( repositorio.Get(BuscaPedido1.Ped.Codigo) );

  cod_ultimo_pedido := Maior_Valor_Cadastrado('PEDIDOS','CODIGO');
  total_pedido_real := StrToFloat( campo_por_campo('PEDIDOS','VALOR_TOTAL','CODIGO', intToStr(BuscaPedido1.Ped.Codigo) ) ) +
                       StrToFloat( Campo_por_campo('PEDIDOS','VALOR_TOTAL','CODIGO', cod_ultimo_pedido));

  percentagem_equivalente := (Pedido.valor_total * 100)/total_pedido_real;

  Pedido.desconto       := (Pedido.desconto * percentagem_equivalente) / 100;
  Pedido.acrescimo      := (Pedido.acrescimo * percentagem_equivalente) / 100;
  Pedido.desconto_fpgto := (Pedido.desconto_fpgto * percentagem_equivalente) / 100;
  Pedido.valor_total    := Pedido.valor_total - Pedido.desconto - Pedido.desconto_fpgto + pedido.acrescimo;

  repositorio.Salvar( Pedido );

{ SALVA VALORES PERCENTUALMENTE CORRESPONDENTE AO NOVO PEDIDO CRIADO }
  Pedido            := TPedido( repositorio.Get( StrToInt( cod_ultimo_pedido ) ) );

  percentagem_equivalente  := 100 - percentagem_equivalente; //muda a % para calcular a outra parte do item

  Pedido.desconto       := (Pedido.desconto * percentagem_equivalente) / 100;
  Pedido.acrescimo      := (Pedido.acrescimo * percentagem_equivalente) / 100;
  Pedido.desconto_fpgto := (Pedido.desconto_fpgto * percentagem_equivalente) / 100;
  Pedido.valor_total    := Pedido.valor_total - Pedido.desconto - Pedido.desconto_fpgto + pedido.acrescimo;

  repositorio.Salvar( Pedido );
end;

function TfrmConferenciaPedido.referenciaEncontrada(codpro, codcor, codigo_cor_pai :integer; tam, masculino_feminino: String; pAcessorio :Boolean;
var achouEspecifico, qtdeTamanhoDisponivel, produtoComCorGenerica :boolean): integer;
begin
  try
    result := 0;
    achouEspecifico       := false;
    qtdeTamanhoDisponivel := false;
    cdsItens.Filtered     := false;
    cdsItens.Filter       := '(CODPRO = '+intToStr(codpro)+') and (CODCOR = '+intToStr(codcor)+')';
    cdsItens.Filtered     := true;

    cdsItens.First;
    { * * Encontra referencia especifica, independente se tiver ou não tamanho disponivel para conferir * * }
    while not cdsItens.Eof do
    begin
      achouEspecifico       := (cdsItens.FieldByName('QTD_'+tam).AsString <> '');
      qtdeTamanhoDisponivel := (cdsItens.FieldByName('QTD_'+tam).AsInteger > 0);

      if achouEspecifico then
      begin
        result := cdsItensCODIGO.AsInteger;
        if qtdeTamanhoDisponivel then
          break;
      end;
      cdsItens.next;
    end;

    { se nao achou a REFERENCIA EXATA(produto, cor e tamanho correspondente) ou encontrou mas nao tem o tamanho disponivel para baixar,
      entra para verificar se existe produto com cor generica em que o produto conferido se encaixe }
    if (result = 0) or ((result > 0) and (not qtdeTamanhoDisponivel)) then
    begin
      cdsItens.Filtered     := false;
      cdsItens.Filter       := '(CODPRO = '+intToStr(codpro)+')';
      cdsItens.Filtered     := true;
      cdsItens.First;
      while not cdsItens.Eof do
      begin
        if (corGenerica(cdsitens.FieldByName('COr').AsString) and generoValido(cdsitens.FieldByName('COr').AsString, masculino_feminino)
           or (cdsItensCODCOR.AsInteger = codigo_cor_pai)) then
        begin
          produtoComCorGenerica := true;
          qtdeTamanhoDisponivel := (cdsItens.FieldByName('QTD_'+tam).AsInteger > 0);
          result                := cdsItensCODIGO.AsInteger;
          { se tem qtde disponivel sai do laço, caso contrario, continua procurando pela cor generica ou pela cor_pai }
          if qtdeTamanhoDisponivel then
            break;
        end;
        cdsItens.Next;
      end;
    end;

  finally
    cdsItens.Filtered     := false;
    cdsItens.Locate('CODIGO',result, []);
  end;
end;

function TfrmConferenciaPedido.atualiza_item(Pedido: TPedido;
  codigo_item: Integer; var total :Real; var desconto_itens :Real): Boolean;
var qtd_real :Double;
    Item     :TItem;
    repositorio :TRepositorio;
begin
  result := false;

  if not cdsItensConferidos.Locate('CODIGO_ITEM', codigo_item, []) then EXIT;

  try
    repositorio := TFabricaRepositorio.GetRepositorio(TItem.ClassName);
    Item        := TItem( repositorio.Get( codigo_item ) );

    if (cdsItensConferidosQTD_RN.AsInteger    > 0) or (cdsItensConferidosQTD_P.AsInteger > 0)
    or (cdsItensConferidosQTD_M.AsInteger     > 0) or (cdsItensConferidosQTD_G.AsInteger > 0)
    or (cdsItensConferidosQTD_1.AsInteger     > 0) or (cdsItensConferidosQTD_2.AsInteger > 0)
    or (cdsItensConferidosQTD_3.AsInteger     > 0) or (cdsItensConferidosQTD_4.AsInteger > 0)
    or (cdsItensConferidosQTD_6.AsInteger     > 0) or (cdsItensConferidosQTD_8.AsInteger > 0)
    or (cdsItensConferidosQTD_10.AsInteger    > 0) or (cdsItensConferidosQTD_12.AsInteger > 0)
    or (cdsItensConferidosQTD_14.AsInteger    > 0) or (cdsItensConferidosQTD_UNICA.AsInteger > 0) then begin

      qtd_real        := Item.qtd_total;
      Item.qtd_RN     := cdsItensConferidosQTD_RN.AsInteger;
      Item.qtd_P      := cdsItensConferidosQTD_P.AsInteger;
      Item.qtd_M      := cdsItensConferidosQTD_M.AsInteger;
      Item.qtd_G      := cdsItensConferidosQTD_G.AsInteger;
      Item.qtd_1      := cdsItensConferidosQTD_1.AsInteger;
      Item.qtd_2      := cdsItensConferidosQTD_2.AsInteger;
      Item.qtd_3      := cdsItensConferidosQTD_3.AsInteger;
      Item.qtd_4      := cdsItensConferidosQTD_4.AsInteger;
      Item.qtd_6      := cdsItensConferidosQTD_6.AsInteger;
      Item.qtd_8      := cdsItensConferidosQTD_8.AsInteger;
      Item.qtd_10     := cdsItensConferidosQTD_10.AsInteger;
      Item.qtd_12     := cdsItensConferidosQTD_12.AsInteger;
      Item.qtd_14     := cdsItensConferidosQTD_14.AsInteger;
      Item.qtd_UNICA  := cdsItensConferidosQTD_UNICA.AsInteger;

                        { como o item.valor_total ja pega o total sem o desconto total, posteriormente tem que tirar a diferença do
                          desconto referente apenas a quantidade real de peças do item que sera adicionado }
      Item.valor_total:= Item.valor_total + (Item.desconto - ( ( ((Item.qtd_total * 100) / qtd_real) * Item.desconto) /100 ));
      Item.desconto   := ( ( ((Item.qtd_total * 100) / qtd_real) * Item.desconto) /100 );

      total           := total + Item.valor_total;
      desconto_itens  := desconto_itens + Item.desconto;

      Pedido.Itens.Add( Item );
      result := true;
    end;

  finally
    FreeAndNil(repositorio);
  end;
end;

function TfrmConferenciaPedido.cria_item(Pedido: TPedido;
  Item: TItem; var total :Real; var desconto_itens :Real; grades_inteiras :Boolean): Boolean;
var qtd_real :Double;
begin
//  if not cdsItensConferidos.Locate('CODIGO_ITEM', Item.codigo, []) then EXIT;

  if (cdsItensConferidosQTD_RN.AsInteger    > 0) or (cdsItensConferidosQTD_P.AsInteger > 0)
  or (cdsItensConferidosQTD_M.AsInteger     > 0) or (cdsItensConferidosQTD_G.AsInteger > 0)
  or (cdsItensConferidosQTD_1.AsInteger     > 0) or (cdsItensConferidosQTD_2.AsInteger > 0)
  or (cdsItensConferidosQTD_3.AsInteger     > 0) or (cdsItensConferidosQTD_4.AsInteger > 0)
  or (cdsItensConferidosQTD_6.AsInteger     > 0) or (cdsItensConferidosQTD_8.AsInteger > 0)
  or (cdsItensConferidosQTD_10.AsInteger    > 0) or (cdsItensConferidosQTD_12.AsInteger > 0)
  or (cdsItensConferidosQTD_14.AsInteger    > 0) or (cdsItensConferidosQTD_UNICA.AsInteger > 0) then begin

    qtd_real        := Item.qtd_total;
    Item.qtd_RN     := IfThen(grades_inteiras, cdsItensQTD_RN_O.AsInteger, cdsItensQTD_RN.AsInteger);
    Item.qtd_P      := IfThen(grades_inteiras, cdsItensQTD_P_O.AsInteger, cdsItensQTD_P.AsInteger);
    Item.qtd_M      := IfThen(grades_inteiras, cdsItensQTD_M_O.AsInteger, cdsItensQTD_M.AsInteger);
    Item.qtd_G      := IfThen(grades_inteiras, cdsItensQTD_G_O.AsInteger, cdsItensQTD_G.AsInteger);
    Item.qtd_1      := IfThen(grades_inteiras, cdsItensQTD_1_O.AsInteger, cdsItensQTD_1.AsInteger);
    Item.qtd_2      := IfThen(grades_inteiras, cdsItensQTD_2_O.AsInteger, cdsItensQTD_2.AsInteger);
    Item.qtd_3      := IfThen(grades_inteiras, cdsItensQTD_3_O.AsInteger, cdsItensQTD_3.AsInteger);
    Item.qtd_4      := IfThen(grades_inteiras, cdsItensQTD_4_O.AsInteger, cdsItensQTD_4.AsInteger);
    Item.qtd_6      := IfThen(grades_inteiras, cdsItensQTD_6_O.AsInteger, cdsItensQTD_6.AsInteger);
    Item.qtd_8      := IfThen(grades_inteiras, cdsItensQTD_8_O.AsInteger, cdsItensQTD_8.AsInteger);
    Item.qtd_10     := IfThen(grades_inteiras, cdsItensQTD_10_O.AsInteger, cdsItensQTD_10.AsInteger);
    Item.qtd_12     := IfThen(grades_inteiras, cdsItensQTD_12_O.AsInteger, cdsItensQTD_12.AsInteger);
    Item.qtd_14     := IfThen(grades_inteiras, cdsItensQTD_14_O.AsInteger, cdsItensQTD_14.AsInteger);
    Item.qtd_UNICA  := IfThen(grades_inteiras, cdsItensQTD_UNICA_O.AsInteger, cdsItensQTD_UNICA.AsInteger);

                          { como o item.valor_total ja pega o total sem o desconto total, após isso se tem que tirar a diferença do
                            desconto referente apenas a quantidade real de pessas do item que sera adicionado }
    Item.valor_total:= Item.valor_total + (Item.desconto - ( ( ((Item.qtd_total * 100) / qtd_real) * Item.desconto) /100 ));
    Item.desconto   := ( ( ((Item.qtd_total * 100) / qtd_real) * Item.desconto) /100 );

    total           := total + Item.valor_total;
    desconto_itens  := desconto_itens + Item.desconto;

    Item.codigo     := 0;
    Item.cod_pedido := 0;

    Pedido.Itens.Add( Item );

  end;
end;

procedure TfrmConferenciaPedido.BuscaPedido1edtNumPedidoExit(
  Sender: TObject);
begin
  inherited;
  BuscaPedido1.edtNumPedidoExit(Sender);

end;

procedure TfrmConferenciaPedido.AbreItensConferidos(pCodigoPedido: integer);
begin
  cdsItensConferidos.Close;
  qryItensConferidos.ParamByName('codpedido').AsInteger := pCodigoPedido;
  cdsItensConferidos.Open;
end;

procedure TfrmConferenciaPedido.AbreItensDoPedido(pCodigoPedido: integer);
begin
  cdsItens.Close;
  qryItens.ParamByName('codpedido').AsInteger := pCodigoPedido;
  cdsItens.Open;
end;

function TfrmConferenciaPedido.adicionarCaixaPedido :Boolean;
var caixaAux, caixa :TCaixaPedido;
    encontrou :Boolean;
    codigoMateria, i :integer;
begin
{  if not assigned(FCaixasDoPedido) then
    FCaixasDoPedido := TObjectList.Create;

  codigoMateria := selecionaMateriaCaixa;
  result        := false;

  if codigoMateria > 0 then
  begin
    encontrou := false;
    caixa                    := TcaixaPedido.Create;
    caixa.numero             := StrToIntDef(cbCaixas.Text,0);
    caixa.codigo_materia     := codigoMateria;
    caixa.codigo_conferencia := BuscaPedido1.Ped.Conferencia.codigo;

    for i := 0 to FCaixasDoPedido.Count -1 do
      caixaAux := (FCaixasDoPedido.Items[0] as TCaixaPedido);

      if caixaAux.numero = caixa.numero then
      begin
        caixaAux.codigo_materia := caixa.codigo_materia;
        encontrou := true;
      end;

    if not encontrou then
      FCaixasDoPedido.Add(caixa);

    result := true;
  end;      }
end;

procedure TfrmConferenciaPedido.aguardarUmMinuto;
begin
  Aguarda('Limite de requisições por minuto atingida. Por favor aguarde alguns instantes.');
  sleep( TEMPO_ESPERA );
  FimAguarda();
end;

procedure TfrmConferenciaPedido.deleta_itens(codigos_itens: String);
var codigo :String;
begin

  while codigos_itens <> '' do begin

    codigo        := copy(codigos_itens, 1, pos(',',codigos_itens) -1);
    codigos_itens := copy(codigos_itens, pos(',',codigos_itens)+1, length(codigos_itens));
    executa_SQL('delete from itens where codigo = '+ codigo );

  end;
end;

procedure TfrmConferenciaPedido.desmembrarKits;
var i :integer;
    repositorio :TRepositorio;
    Item :TItem;
    qry :TFDquery;
begin
  try
    qry := dm.GetConsulta;
    
    for i := 0 to BuscaPedido1.Ped.Itens.Count -1 do
    begin
      if TItem(BuscaPedido1.Ped.Itens[i]).Produto.Kit then
      begin
        qry.Close;
        qry.SQL.Text := 'SELECT * FROM PRODUTOS_KIT WHERE CODIGO_KIT = :COD_PROD_KIT AND CODIGO_COR_KIT = :CODIGO_COR';
        qry.ParamByName('cod_prod_kit').AsInteger := TItem(BuscaPedido1.Ped.Itens[i]).Produto.Codigo;
        qry.ParamByName('codigo_cor').AsInteger := TItem(BuscaPedido1.Ped.Itens[i]).Cor.Codigo;
        qry.Open;
   
        try
          repositorio := TFabricaRepositorio.GetRepositorio(TItem.ClassName);
          Item        := TItem.Create;
          while not qry.Eof do
          begin
            Item.codigo           := IfThen(qry.RecNo = (qry.RecordCount), TItem(BuscaPedido1.Ped.Itens[i]).codigo, 0);
            Item.cod_pedido       := BuscaPedido1.Ped.Codigo;
            Item.cod_produto      := qry.FieldByName('codigo_produto').AsInteger;
            Item.cod_cor          := qry.FieldByName('codigo_cor').AsInteger;
            Item.preco            := TItem(BuscaPedido1.Ped.Itens[i]).preco;
            Item.qtd_RN           := TItem(BuscaPedido1.Ped.Itens[i]).qtd_RN;
            Item.qtd_P            := TItem(BuscaPedido1.Ped.Itens[i]).qtd_P;
            Item.qtd_M            := TItem(BuscaPedido1.Ped.Itens[i]).qtd_M;
            Item.qtd_G            := TItem(BuscaPedido1.Ped.Itens[i]).qtd_G;
            Item.qtd_1            := TItem(BuscaPedido1.Ped.Itens[i]).qtd_1;
            Item.qtd_2            := TItem(BuscaPedido1.Ped.Itens[i]).qtd_2;
            Item.qtd_3            := TItem(BuscaPedido1.Ped.Itens[i]).qtd_3;
            Item.qtd_4            := TItem(BuscaPedido1.Ped.Itens[i]).qtd_4;
            Item.qtd_6            := TItem(BuscaPedido1.Ped.Itens[i]).qtd_6;
            Item.qtd_8            := TItem(BuscaPedido1.Ped.Itens[i]).qtd_8;
            Item.qtd_10           := TItem(BuscaPedido1.Ped.Itens[i]).qtd_10;
            Item.qtd_12           := TItem(BuscaPedido1.Ped.Itens[i]).qtd_12;
            Item.qtd_14           := TItem(BuscaPedido1.Ped.Itens[i]).qtd_14;
            Item.qtd_UNICA        := TItem(BuscaPedido1.Ped.Itens[i]).qtd_UNICA;
            Item.codigoProdutoKit := qry.FieldByName('codigo').AsInteger;
   
            repositorio.Salvar(Item);
            qry.Next;
          end;
        finally
          FreeAndNil(repositorio);
          FreeAndNil(Item);
        end;
      end;
    end;
    
  finally
    FreeAndNil(qry);
  end;
end;

procedure TfrmConferenciaPedido.atualizaTabelaDirecionamento;
var direcionamento :TDirecionamentoEntrada;
    repositorio    :TRepositorio;
    falta, qtdconferido :Real;
begin
  try
    fdm.qryGenerica.Close;
    fdm.qryGenerica.SQL.Text := 'select de.codigo, de.quantidade, de.quantidade_conf, de.conferido, es.codigo_produto, es.codigo_cor, es.codigo_tamanho '+
                                '  from direcionamento_entrada de                                                                         '+
                                ' inner join entradas_saidas es  on es.codigo = de.codigo_entrada                                         '+
                                ' where de.codigo_pedido = :codped and (de.quantidade - de.quantidade_conf) > 0                           ';
    fdm.qryGenerica.ParamByName('codped').AsInteger := BuscaPedido1.Ped.Codigo;
    fdm.qryGenerica.Open;

    fdm.qryGenerica.Filtered := false;
    fdm.qryGenerica.Filter   := 'conferido <> ''S''';
    fdm.qryGenerica.Filtered := true;

    if fdm.qryGenerica.IsEmpty then
      exit;

    direcionamento := nil;
    repositorio    := nil;
    repositorio    := TFabricaRepositorio.GetRepositorio(TDirecionamentoEntrada.ClassName);
    cdsConferidos.First;
    while NOT cdsConferidos.Eof do
    begin
      qtdconferido := cdsConferidosQUANTIDADE.AsFloat;

      while qtdconferido > 0 do
      begin
        if fdm.qryGenerica.Locate('CODIGO_PRODUTO;CODIGO_COR;CODIGO_TAMANHO',varArrayOf([cdsConferidosCOD_PRODUTO.AsInteger,
                                                                                         cdsConferidosCOD_COR.AsInteger,
                                                                                         cdsConferidosCOD_TAMANHO.AsInteger])) then
        begin
          falta := Fdm.qryGenerica.FieldByName('quantidade').AsFloat - Fdm.qryGenerica.FieldByName('quantidade_conf').AsFloat;

          fdm.qryGenerica.Edit;
          fdm.qryGenerica.FieldByName('quantidade_conf').AsFloat := Fdm.qryGenerica.FieldByName('quantidade_conf').AsFloat + IfThen(qtdconferido > falta, falta, qtdconferido);
          fdm.qryGenerica.FieldByName('conferido').AsString := IfThen(Fdm.qryGenerica.FieldByName('quantidade_conf').AsFloat = Fdm.qryGenerica.FieldByName('quantidade').AsFloat, 'S', 'N');
          fdm.qryGenerica.Post;

          qtdconferido := qtdconferido - IfThen(falta > qtdconferido, qtdconferido, falta);
        end
        else
          qtdconferido := 0;
      end;
      cdsConferidos.Next;
    end;

  finally
    fdm.qryGenerica.Filtered := false;
  end;
end;

procedure TfrmConferenciaPedido.AtualizaValoresConferenciaItem(
  Item: TConferenciaItem; Q_RN, Q_P, Q_M, Q_G, Q_1, Q_2, Q_3, Q_4, Q_6, Q_8, Q_10, Q_12, Q_14, Q_unica :integer);
begin
  Item.QTD_RN    := Item.QTD_RN    + Q_RN;
  Item.QTD_P     := Item.QTD_P     + Q_P;
  Item.QTD_M     := Item.QTD_M     + Q_M;
  Item.QTD_G     := Item.QTD_G     + Q_G;
  Item.QTD_1     := Item.QTD_1     + Q_1;
  Item.QTD_2     := Item.QTD_2     + Q_2;
  Item.QTD_3     := Item.QTD_3     + Q_3;
  Item.QTD_4     := Item.QTD_4     + Q_4;
  Item.QTD_6     := Item.QTD_6     + Q_6;
  Item.QTD_8     := Item.QTD_8     + Q_8;
  Item.QTD_10    := Item.QTD_10    + Q_10;
  Item.QTD_12    := Item.QTD_12    + Q_12;
  Item.QTD_14    := Item.QTD_14    + Q_14;
  Item.QTD_UNICA := Item.QTD_UNICA + Q_UNICA;
end;

procedure TfrmConferenciaPedido.deleta_conferencia_itens(
  codigos_conferencia_itens: String);
var codigo :String;
begin

  while codigos_conferencia_itens <> '' do begin

    codigo                    := copy(codigos_conferencia_itens, 1, pos(',',codigos_conferencia_itens) -1);
    codigos_conferencia_itens := copy(codigos_conferencia_itens, pos(',',codigos_conferencia_itens)+1, length(codigos_conferencia_itens));
    executa_SQL('delete from conferencia_itens where codigo = '+ codigo );

  end;
end;

function TfrmConferenciaPedido.item_conferido(codigo_item: integer) :boolean;
begin
  cdsItens.Locate('CODIGO',codigo_item,[]);

  result := (cdsItensQTD_RN.AsInteger = 0)and(cdsItensQTD_P.AsInteger = 0)and
            (cdsItensQTD_M.AsInteger = 0)and(cdsItensQTD_G.AsInteger = 0)and
            (cdsItensQTD_1.AsInteger = 0)and(cdsItensQTD_2.AsInteger = 0)and
            (cdsItensQTD_3.AsInteger = 0)and(cdsItensQTD_4.AsInteger = 0)and
            (cdsItensQTD_6.AsInteger = 0)and(cdsItensQTD_8.AsInteger = 0)and
            (cdsItensQTD_10.AsInteger = 0)and(cdsItensQTD_12.AsInteger = 0)and
            (cdsItensQTD_14.AsInteger = 0)and(cdsItensQTD_UNICA.AsInteger = 0);
end;

procedure TfrmConferenciaPedido.SalvarAtualizar_caixas;
var repositorio        :TRepositorio;
    Caixas             :TCaixas;
    codigo_caixa, i    :integer;
    codigo_conferencia :integer;
begin
  repositorio := nil;
 try
 try
  { repositorio        := TFabricaRepositorio.GetRepositorio(TcaixaPedido.ClassName);

   for i := 0 to FCaixasDoPedido.Count-1 do
   begin
     if TCaixaPedido(FCaixasDoPedido.Items[i]).baixou_estoque <> 'S' then
       TCaixaPedido(FCaixasDoPedido.Items[i]).baixarEstoque;
     repositorio.Salvar( TCaixaPedido(FCaixasDoPedido.Items[i]) );
   end;

   FreeAndNil(repositorio);     }

   repositorio        := TFabricaRepositorio.GetRepositorio(TCaixas.ClassName);
   codigo_conferencia := self.BuscaPedido1.Ped.Conferencia.codigo;

   cdsItens.DisableControls;
   cdsItens.AfterScroll := nil;
   cdsItens.First;
   while not cdsItens.Eof do begin
     if cdsItensNUM_CAIXA.AsInteger > 0 then
     begin
       codigo_caixa := 0;
       Caixas       := TCaixas.Create;

       if not (cdsCaixas.IsEmpty) and
              (cdsCaixas.Locate('CODIGO_ITEM;CODIGO_COR;CODIGO_CONFERENCIA',VarArrayOf([cdsItensCODIGO.AsInteger,
                                                                            cdsItensCodCor.AsInteger,
                                                                            codigo_conferencia]), []) )
         then
           codigo_caixa := cdsCaixasCODIGO.AsInteger;

       Caixas.codigo             := codigo_caixa;
       Caixas.numero_caixa       := cdsItensNUM_CAIXA.AsString;
       Caixas.codigo_conferencia := codigo_conferencia;
       Caixas.codigo_item        := cdsItensCODIGO.AsInteger;
       Caixas.codigo_cor         := cdsItensCodCor.AsInteger;
       caixas.qtd_RN             := caixas.qtd_RN    + cdsItensQTD_RN_O.AsInteger;
       caixas.qtd_P              := caixas.qtd_P     + cdsItensQTD_P_O.AsInteger;
       caixas.qtd_M              := caixas.qtd_M     + cdsItensQTD_M_O.AsInteger;
       caixas.qtd_G              := caixas.qtd_G     + cdsItensQTD_G_O.AsInteger;
       caixas.qtd_1              := caixas.qtd_1     + cdsItensQTD_1_O.AsInteger;
       caixas.qtd_2              := caixas.qtd_2     + cdsItensQTD_2_O.AsInteger;
       caixas.qtd_3              := caixas.qtd_3     + cdsItensQTD_3_O.AsInteger;
       caixas.qtd_4              := caixas.qtd_4     + cdsItensQTD_4_O.AsInteger;
       caixas.qtd_6              := caixas.qtd_6     + cdsItensQTD_6_O.AsInteger;
       caixas.qtd_8              := caixas.qtd_8     + cdsItensQTD_8_O.AsInteger;
       caixas.qtd_10             := caixas.qtd_10    + cdsItensQTD_10_O.AsInteger;
       caixas.qtd_12             := caixas.qtd_12    + cdsItensQTD_12_O.AsInteger;
       caixas.qtd_14             := caixas.qtd_14    + cdsItensQTD_14_O.AsInteger;
       caixas.qtd_UNICA          := caixas.qtd_UNICA + cdsItensQTD_UNICA_O.AsInteger;

       repositorio.Salvar(Caixas);
       FreeAndNil(Caixas);
     end;

     cdsItens.Next;
   end;

   cdsItens.EnableControls;
   cdsItens.AfterScroll := cdsItensAfterScroll;

   avisar('Caixas salvas com sucesso!');
 Except
   on e : Exception do begin
     avisar('Erro ao salvar caixas!'+#13#10+e.Message);
   end;
 end;
 finally
   FreeAndNil( repositorio );
 end;
end;

procedure TfrmConferenciaPedido.BuscaCdigodeBarras1Click(Sender: TObject);
begin
  if (cdsItens.Active) and not(cdsItens.IsEmpty) then begin
    frmBuscaCodigoBarras := TfrmBuscaCodigoBarras.CreateParaBusca(self, cdsItensRefPro.AsString, cdsItensRefCor.AsString, '');
    frmBuscaCodigoBarras.ShowModal;
    frmBuscaCodigoBarras.Release;
    frmBuscaCodigoBarras := nil;

    if edtCodigoBarras.visible then
      edtCodigoBarras.SetFocus;
  end;
end;

procedure TfrmConferenciaPedido.SubstituirProduto1Click(Sender: TObject);
begin
  if (cdsItens.Active) and not(cdsItens.IsEmpty) then begin

    if not(self.FVisualizarConferencia) and ((cdsItensCor.AsString = 'MASCULINO') or (cdsItensCor.AsString = 'FEMININO')) THEN
      substitui_item_generico
    else
      substitui_item_normal;

  end;
end;

procedure TfrmConferenciaPedido.cdsItensAfterScroll(DataSet: TDataSet);
begin
  if (cdsItensCONFERIDO.AsString = 'S') or ( AnsiMatchStr(cdsItensCor.AsString, ['MASCULINO', 'FEMININO']) and (TTipoProduto(cdsItensTIPO.AsInteger) = tpAcessorio))
                                        or ( AnsiMatchStr(cdsItensCor.AsString, ['MASCULINO', 'FEMININO']) and not btnConfParcial.Enabled) then
  begin
    SubstituirProduto1.Visible := false;
    btnSubstitui.Enabled       := false;
  end
  else
  begin
    SubstituirProduto1.Visible := true;
    btnSubstitui.Enabled       := true;
  end;

  if (linha_estoque_calculado <> cdsItens.RecNo) and not(self.FVisualizarConferencia) then
    Timer2.Enabled := true;
end;

procedure TfrmConferenciaPedido.substitui_item_por_item(
  cod_bar_substituto: String; qtde_substituida :Integer;
  tamanho_substituido: String);
var
    cod_produto, cod_cor, i :Integer;
    tamanho, M_F, refcor, refpro, cor, tipo_cor :String;
    Item                    :TItem;
    indice_existente        :Integer;
    codigo_item_deletar     :integer;
    acessorio               :Boolean;
    perc_equivalente        :Real;
    desconto_equivalente    :Real;
begin
  indice_existente    := -1;
  codigo_item_deletar := 0;
  try
    item_por_codigo_barras(cod_produto, cod_cor, refpro, refcor, cor, tamanho, M_F, cod_bar_substituto, tipo_cor, acessorio);

    { verifica se ja existe o item que sera o substituto, para caso existir, apenas alterar }
    for i:= 0 to BuscaPedido1.Ped.Itens.Count -1 do
      if ((BuscaPedido1.Ped.Itens[i] as TItem).cod_produto = cod_produto) and ((BuscaPedido1.Ped.Itens[i] as TItem).cod_cor = cod_cor) then begin
        indice_existente := i;
        Break;
      end;

    for i:= 0 to BuscaPedido1.Ped.Itens.Count - 1 do begin

      if (BuscaPedido1.Ped.Itens[i] as TItem).codigo = cdsItensCODIGO.AsInteger then begin

        perc_equivalente     := (qtde_substituida * 100) / (BuscaPedido1.Ped.Itens[i] as TItem).qtd_total;
        desconto_equivalente := (perc_equivalente * (BuscaPedido1.Ped.Itens[i] as TItem).desconto) / 100;

        BuscaPedido1.Ped.Itens[i] := atualiza_qtd_item( (BuscaPedido1.Ped.Itens[i] as TItem), tamanho_substituido,
                                                         - qtde_substituida, 'A', desconto_equivalente);

        if (BuscaPedido1.Ped.Itens[i] as TItem).qtd_total = 0 then
          codigo_item_deletar := (BuscaPedido1.Ped.Itens[i] as TItem).codigo;

        { Se item ja existir apenas altera }
         if indice_existente >= 0 then begin

           BuscaPedido1.Ped.Itens[indice_existente] := atualiza_qtd_item((BuscaPedido1.Ped.Itens[indice_existente] as TItem),
                                                                         tamanho_substituido,
                                                                         qtde_substituida, 'A', desconto_equivalente)

         end  { Se não, um novo é inserido }
         else begin

            Item               := TItem.Create;
            Item.codigo        := 0;
            Item.cod_pedido    := (BuscaPedido1.Ped.Itens[i] as TItem).cod_pedido;
            Item.cod_produto   := cod_produto;
            Item.cod_cor       := cod_cor;
            Item.preco         := (BuscaPedido1.Ped.Itens[i] as TItem).preco;
            Item.desconto      := desconto_equivalente;

            Item := atualiza_qtd_item(Item, tamanho_substituido, qtde_substituida, 'C',0);

            BuscaPedido1.Ped.Itens.Add(Item);

         end;

         BuscaPedido1.Ped.salvar;
      end;
    end;

    avisar('Item substituído com sucesso!');

    Salvar_conferencia;
    reinicia_pedido;

  Except
    on e : Exception do
     begin
       EmiteSomErro;
       avisar('Erro ao substituir item!'+#13#10+e.Message);
     end;
  end;
end;

procedure TfrmConferenciaPedido.reinicia_pedido;
var n_pedido :String;
begin
   n_pedido := BuscaPedido1.edtNumPedido.Text;
   btnCancelar.Click;
   BuscaPedido1.edtNumPedido.Text := n_pedido;
   BuscaPedido1.edtNumPedidoExit(nil);
end;

procedure TfrmConferenciaPedido.Timer1Timer(Sender: TObject);
begin
  edtCodigoBarras.Clear;
  Timer1.Enabled := false;
  edtCodigoBarras.SetFocus;
end;

procedure TfrmConferenciaPedido.btnImprimirClick(Sender: TObject);
begin
  frmRelatorioRomaneio := TfrmRelatorioRomaneio.Create(self);

 try
   frmRelatorioRomaneio.imprime(BuscaPedido1.edtNumPedido.Text); //imprime Romaneio

 except
   on e : Exception do
     begin
       Avisar(e.Message);
     end;
 end;

 frmRelatorioRomaneio.Release;
end;

procedure TfrmConferenciaPedido.cbInformarQuantidadeClick(Sender: TObject);
begin
  if edtCodigoBarras.Enabled then
    edtCodigoBarras.SetFocus;
end;

procedure TfrmConferenciaPedido.FormShow(Sender: TObject);
begin
  self.WindowState := wsMaximized;
  Busca_tamanhos( cdsTamanhos );
  BuscaPedido1.BuscaParaConferencia := true;
  cdsConferidos.CreateDataSet;

  btnPedidosSeparacao.Visible  := not FVisualizarConferencia;
  btnImprimir.Visible          := not FVisualizarConferencia;
  btnConfParcial.Visible       := not FVisualizarConferencia;
  btnSalvaCaixas.Visible       := not FVisualizarConferencia;
  cbInformarQuantidade.Visible := not FVisualizarConferencia;
  label3.Visible               := not FVisualizarConferencia;
  label7.Visible               := not FVisualizarConferencia;
  edtCodigoBarras.Visible      := not FVisualizarConferencia;
  btnSubstitui.Visible         := FVisualizarConferencia;
end;

procedure TfrmConferenciaPedido.frameMateriaExit(Sender: TObject);
begin
  TPanel( TBuscaMateria(Sender).Parent).Destroy;
end;

procedure TfrmConferenciaPedido.atualizaEstoqueLocal(pedidoEcommerce :Boolean);
var qry :TFDquery;
begin
  if cdsConferidos.IsEmpty then
    exit;
  try
    qry := dm.GetConsulta;

    cdsConferidos.First;
    while not cdsConferidos.Eof do
    begin
      qry.SQL.Text := ' execute procedure altera_cria_estoque(:quantidade, :codigo_produto, :codigo_cor, :codigo_tamanho, :setor) ';

      qry.ParamByName('quantidade').AsInteger     := cdsConferidosQUANTIDADE.AsInteger * -1;
      qry.ParamByName('codigo_produto').AsInteger := cdsConferidosCOD_PRODUTO.AsInteger;
      qry.ParamByName('codigo_cor').AsInteger     := cdsConferidosCOD_COR.AsInteger;
      qry.ParamByName('codigo_tamanho').AsInteger := cdsConferidosCOD_TAMANHO.AsInteger;
      qry.ParamByName('setor').AsInteger          := ifThen(pedidoEcommerce and (cdsConferidosTIPO_COR.AsString = 'E'), 2, 1);
      qry.ExecSQL;

      cdsConferidos.Next;
    end;
  Except
     on e :Exception do
       raise Exception.Create('Erro ao atualizar estoque.'+#13#10+e.message);
  end;
end;

procedure TfrmConferenciaPedido.atualizaEstoquePedidoTotal(Pedido: TPedido; multiplicador :integer);
begin
   dm.qryGenerica.Close;
   dm.qryGenerica.SQL.Text := 'execute procedure baixa_pedido_estoque('+intToStr(Pedido.Codigo)+', :multiplicador)';
   // multiplicador determina se os itens conferidos dão baixa no estoque (-1), ou se retornam pro estoque (+1)
   dm.qryGenerica.ParamByName('multiplicador').AsInteger := multiplicador;
   dm.qryGenerica.ExecSQL;
end;

procedure TfrmConferenciaPedido.atualizaEstoquePlataforma(multiplicador :integer);
var sku :String;
    json :String;
    produtoCadastrado :Boolean;
    Lista : TStringList;
    vHTTPJSON :THTTPJSON;
    quantidadeAtualizada, qtdRequisicoes :integer;
    produtosAdicionados :integer;
begin
  try
  try
    Lista                 := nil;
    Lista                 := TStringList.Create;
    Lista.Delimiter       := ',';
    Lista.StrictDelimiter := true;
    Lista.QuoteChar       := #0;
    qtdRequisicoes        := 10;
    produtosAdicionados   := 0;

    vHTTPJSON             := nil;
    vHTTPJSON             := THTTPJSON.Create(fdm.configuracoesECommerce.token, fdm.configuracoesECommerce.url_base);

    cdsConferidos.First;
    while not cdsConferidos.Eof do
    begin
      sku := cdsConferidosSKU.AsString;
      try
        produtoCadastrado    := true;
        quantidadeAtualizada := getQuantidadeAtual( sku );
      Except
        on e :Exception do
          produtoCadastrado := POS('NOT FOUND',UPPERCASE(e.message)) = 0;
      end;

      if produtoCadastrado then
      begin
        quantidadeAtualizada := quantidadeAtualizada + (cdsConferidosQUANTIDADE.AsInteger * multiplicador);
        Lista.Add('{"sku": "'+sku+'", "estoque": '+intToStr(quantidadeAtualizada)+'}');
        inc(produtosAdicionados);
      end;
      cdsConferidos.Next;
      inc( qtdRequisicoes );

      if qtdRequisicoes >= 300 then
      begin
        aguardarUmMinuto;
        qtdRequisicoes := 10;
      end;

      if (produtosAdicionados = 50) or cdsConferidos.Eof then
      begin
        json := '['+Lista.DelimitedText+']';
        vHTTPJSON.Post(json);

        produtosAdicionados := 0;
        Lista.Clear;
        json := '';
      end;
    end;

  Except
    on e :EIdHTTPProtocolException do
    begin
      raise Exception.Create('Erro ao atualizar o estoque da plataforma.'+#13#10+'Aguarde 1 min e tente novamente por favor.'+#13#10+e.Message);
    end;
  end;
  finally
    FreeAndNil(Lista);
    FreeAndNil(vHTTPJSON);
  end;
end;

procedure TfrmConferenciaPedido.atualizaEstoquePlataformaPeloPedido(multiplicador :integer);
var sku :String;
    i :integer;
    refProduto, refCor, tamanho :String;
begin
    cdsConferidos.EmptyDataSet;
    cdsItensConferidos.First;
    while not cdsItensConferidos.Eof do
    begin
      for i := 0 to cdsItensConferidos.Fields.Count - 1 do
      begin
        //se for um campo quantidade e não for referente a quantidade total mas sim a conferida
        if (pos('QTD',cdsItensConferidos.Fields[i].FieldName) > 0) and not (pos('_O',cdsItensConferidos.Fields[i].FieldName) > 0) then
        begin
          //se quantidade maior que zero
          if cdsItensConferidos.Fields[i].Value > 0 then
          begin
            refProduto := cdsItensConferidosREFPRO.AsString;
            refCor     := cdsItensConferidosREFCOR.AsString;
            tamanho    := trim(copy(cdsItensConferidos.Fields[i].FieldName, pos('QTD_',cdsItensConferidos.Fields[i].FieldName)+4, 10));
            tamanho    := IfThen(tamanho = 'UNICA', 'UN', tamanho);
            sku        := refProduto + tamanho + refCor;
            sku        := TStringUtilitario.RemoveCaracteresEspeciais( sku );

            cdsConferidos.Append;
            cdsConferidosSKU.AsString       := sku;
            cdsConferidosQUANTIDADE.AsFloat := cdsItensConferidos.Fields[i].AsInteger;
            cdsConferidos.Post;
          end;
        end;
      end;
      cdsItensConferidos.Next;
    end;

    //getEstoqueAtualProdutos;
    atualizaEstoquePlataforma(multiplicador);
end;

function TfrmConferenciaPedido.getQuantidadeAtual(sku: String): integer;
var
  Objeto :TJSONObject;
begin
  try
    result := 0;
    Objeto := TJSONObject.ParseJSONValue(getJsonProduto(sku)) as TJSONObject;
    result := StrToIntDef(Objeto.GetValue('estoque').Value,0);
  except
    on e :Exception do
      raise Exception.Create(e.Message);
  end;
end;

procedure TfrmConferenciaPedido.getEstoqueAtualProdutos;
var
  Produtos :TJSONArray;
  Objeto :TJSONObject;
  ProdutoJSON :TJSONObject;
  i, x, codigoProduto, codigoCor :integer;
  refPro, refCor, tamanho, sku, nextPage, erro :String;
  id_ultimo_produto, page, totalProdutos :integer;
begin
  try
    page     := 1;
    Objeto   := TJSONObject.ParseJSONValue( buscaProdutos(page) ) as TJSONObject;
    cdsConferidos.First;

    while nextPage <> 'null' do
    begin
      Application.ProcessMessages;
      inc(page);
      nextPage := Objeto.GetValue('next').Value;
      Produtos := Objeto.GetValue('results') as TJSONArray;

      for i := 0 to Produtos.Count-1 do
      begin
        ProdutoJSON := (Produtos.Items[i] as TJSONObject);

        if cdsConferidos.Locate('SKU',ProdutoJSON.GetValue('sku').Value, []) then
        begin
          cdsConferidos.Edit;
          cdsConferidosESTOQUE_ATUAL.AsFloat := strToFloatDef(ProdutoJSON.GetValue('estoque').Value,0);
          cdsConferidos.Post;
        end;
      end;

      if nextPage <> 'null' then
         Objeto   := TJSONObject.ParseJSONValue( buscaProdutos(page) ) as TJSONObject;
    end;

  except
    on e :Exception do
    begin
      erro := e.Message;
      if pos('429',erro) > 0 then
        erro := 'Retorno 429 - Limite de requisições por minuto atingida. Por favor aguarde alguns instantes.';
      raise Exception.Create('Falha ao buscar relação de produtos.'+#13#10+erro);
    end;
  end;
end;

function TfrmConferenciaPedido.getJsonProduto(sku: String): String;
var
    Retorno :String;
    vHTTPJSON: THTTPJSON;
begin
 try
 try
   vHTTPJSON := THTTPJSON.Create(dm.configuracoesECommerce.token, dm.configuracoesECommerce.url_base);

   Retorno := vHTTPJSON.Get('produto/'+sku);
   result  := Retorno;
 except
   on e: Exception do
     raise Exception.Create(e.Message);
 end;
 finally
   FreeAndNil(vHTTPJSON);
 end;
end;

procedure TfrmConferenciaPedido.Busca_tamanhos(var cds: TClientDataSet);
var lista :TObjectList;
    repositorio :TRepositorio;
    i :integer;
begin
  repositorio := nil;

  lista := TObjectList.Create(true);

  cds := TClientDataSet.Create(Self);
  cds.Close;
  cds.FieldDefs.Clear;
  cds.FieldDefs.add('CODIGO',ftInteger);
  cds.FieldDefs.add('TAMANHO',ftString,10);
  cds.CreateDataSet;

 try
  repositorio := TFabricaRepositorio.GetRepositorio(TTamanho.ClassName);
  lista       := repositorio.GetAll;

  for i := 0 to lista.Count - 1 do begin
    cds.Append;
    cds.fieldByName('CODIGO').AsInteger := (lista.Items[i] as TTamanho).Codigo;
    cds.fieldByName('TAMANHO').AsString := (lista.Items[i] as TTamanho).Descricao;
    cds.Post;
  end;

 finally
   FreeAndNil(repositorio);
   lista.Free;
 end;

end;

procedure TfrmConferenciaPedido.Button1Click(Sender: TObject);
begin
//  atualizaEstoquePlataformaPeloPedido(-1);
end;

procedure TfrmConferenciaPedido.Salva_estoque(cod_produto, cod_cor : integer; descricao_tamanho :String;
quantidade: Real);
var
    Estoque       :TEstoque;
    repositorio   :TRepositorio;
    codigo_tamanho :Integer;
begin
  repositorio    := nil;
  Estoque        := nil;

  try
    cdsTamanhos.Locate('TAMANHO',descricao_tamanho,[]);
    codigo_tamanho := cdsTamanhos.FieldByName('CODIGO').AsInteger;

    repositorio    := TFabricaRepositorio.GetRepositorio(TEstoque.ClassName);

    Estoque     := TEstoque.create(cod_produto, cod_cor, codigo_tamanho);

    {se existir um cadastro de estoque para esta referencia, ele é atualizado, caso contrario não,
     para nao negativar o estoque (pedido do cliente, por enquanto)}
    if (Estoque.codigo > 0) then begin

      Estoque.atualiza_estoque(quantidade);

      repositorio.Salvar(Estoque);
    end;

  finally
    if Assigned(repositorio) then FreeAndNil(repositorio);
    if Assigned(Estoque)     then FreeAndNil(Estoque);
  end;

end;

procedure TfrmConferenciaPedido.gridItensKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_TAB)and not(cdsItens.IsEmpty) and (ProgressBar1.Position < ProgressBar1.Max) and not FVisualizarConferencia then begin
    EmiteSomErro;
    avisar('Atenção! Para a leitura o codigo de barras, o cursor deve estar no campo indicado.',0,'S', 1);
    TCriaBalaoInformacao.ShowBalloonTip(edtCodigoBarras.Handle, 'Posicione o cursor aqui.', 'Informação', 1);
  end;

  inherited;  
end;

procedure TfrmConferenciaPedido.gridItensDblClick(Sender: TObject);
begin
  if trim( cbCaixas.Items[ cbCaixas.itemIndex ] ) = '' then
    Exit;

  if (cdsItensNUM_CAIXA.AsInteger > 0) and (cdsItensNUM_CAIXA.AsString <> cbCaixas.Text) then
    exit;

  cdsItens.Edit;
  if cdsItensNUM_CAIXA.AsInteger = strToInt(cbCaixas.Items[ cbCaixas.itemIndex ]) then
    cdsItensNUM_CAIXA.AsInteger := 0
  else
    cdsItensNUM_CAIXA.AsInteger := strToInt(cbCaixas.Items[ cbCaixas.itemIndex ]);
  cdsItens.Post;
end;

procedure TfrmConferenciaPedido.btnSalvaCaixasClick(Sender: TObject);
begin
  if btnFecharCaixa.Enabled then begin
     EmiteSomErro;
     avisar('Caixa '+cbCaixas.Items[cbCaixas.itemindex]+' ainda está aberta.'+#13#10+'Favor, fecha-la antes de salvar.');
   end
   else begin
     pnlBotoes.Enabled := false;
     self.SalvarAtualizar_caixas;
     pnlBotoes.Enabled := true;     
   end;
end;

procedure TfrmConferenciaPedido.habilita_desabilita_caixas(
  boleana: Boolean);
begin
  //btnExcluir.Enabled       := not boleana;
  btnNovaCaixa.Visible     := boleana;
  btnFecharCaixa.Visible   := boleana;
  btnCancelarCaixa.Visible := boleana;
  cbCaixas.Visible         := boleana;
  staTitulo.Visible        := boleana;
//  btnAlteraCaixas.Visible  := boleana;
  cx_fechada.Visible       := boleana;
end;

procedure TfrmConferenciaPedido.transfere_conferencia(itens_deletar: String);
var ConferenciaItem      :TConferenciaItem;
    ConferenciaPedido    :TConferenciaPedido;
    repositorio          :TRepositorio;
    repositorioPedido    :TRepositorio;
    ultimo_pedido        :integer;
    cod_produto          :integer;
    cod_cor, i           :integer;
    cod_item_conferencia :integer;
    cod_conferencia      :integer;
    ListaItens           :TObjectList;
begin
  itens_deletar := copy(itens_deletar,1, length(itens_deletar)-1);

  ultimo_pedido := strToInt( Maior_Valor_Cadastrado('PEDIDOS', 'CODIGO') );

  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select ci.codigo, it.cod_produto, it.cod_cor from conferencia_itens ci '+
                              ' left join itens it on it.codigo = ci.codigo_item                      '+
                              ' where ci.codigo_item in ('+itens_deletar+')';
  fdm.qryGenerica.Open;

  if fdm.qryGenerica.IsEmpty then Exit;

  fdm.qryGenerica2.Close;
  fdm.qryGenerica2.SQL.Text := 'select it.codigo, it.cod_produto, it.cod_cor from itens it '+
                               'where it.cod_pedido = :codped                              ';

  fdm.qryGenerica2.ParamByName('codped').AsInteger := ultimo_pedido;
  fdm.qryGenerica2.Open;

  repositorio := TFabricaRepositorio.GetRepositorio(TConferenciaItem.ClassName);

  ListaItens := TObjectList.Create(true);

  while not dm.qryGenerica.Eof do begin

    cod_produto          := fdm.qryGenerica.fieldByName('COD_PRODUTO').AsInteger;
    cod_cor              := fdm.qryGenerica.fieldByName('COD_COR').AsInteger;
    cod_item_conferencia := fdm.qryGenerica.fieldByName('CODIGO').AsInteger;

     if fdm.qryGenerica2.Locate('COD_PRODUTO;COD_COR',VarArrayOf([cod_produto,
                                                                  cod_cor ]),[]) then begin

       ConferenciaItem             := TConferenciaItem(repositorio.Get( cod_item_conferencia ));
       ConferenciaItem.codigo_item := fdm.qryGenerica2.fieldByName('CODIGO').AsInteger;

       ListaItens.Add( ConferenciaItem );

     end;

    dm.qryGenerica.Next;
  end;

  repositorioPedido := TFabricaRepositorio.GetRepositorio(TConferenciaPedido.ClassName);
  ConferenciaPedido := TConferenciaPedido.Create;

  ConferenciaPedido.codigo         := 0;
  ConferenciaPedido.codigo_pedido  := ultimo_pedido;
  ConferenciaPedido.codigo_usuario := dm.UsuarioLogado.Codigo;
  ConferenciaPedido.inicio         := Date;
  repositorioPedido.Salvar( ConferenciaPedido );

  cod_conferencia := strToInt( Maior_Valor_Cadastrado('CONFERENCIA_PEDIDO', 'CODIGO') );

  for i := 0 to ListaItens.Count -1 do begin
    (ListaItens.Items[i] as TConferenciaItem).codigo_conferencia := cod_conferencia;
    repositorio.Salvar( ListaItens.Items[i] );
  end;
end;

procedure TfrmConferenciaPedido.remove_item(codigo: integer);
var repItem :TRepositorio;
begin
  repItem := nil;

  repItem := TFabricaRepositorio.GetRepositorio(TItem.ClassName);
  repItem.Remover( TItem( repItem.Get( codigo ) ) );
end;

procedure TfrmConferenciaPedido.retornarProdutosAoKit(ConferenciaPedido :TConferenciaPedido);
var
  i: Integer;
  itensRetornados, codigoKit :String;
  Item :TItem;
  ConferenciaItem :TConferenciaItem;
  repositorio :TRepositorio;
  repconferencia :TRepositorio;
begin
  try
    repositorio    := TFabricaRepositorio.GetRepositorio(TItem.ClassName);
    repconferencia := TFabricaRepositorio.GetRepositorio(TConferenciaItem.ClassName);
    for i := 0 to BuscaPedido1.Ped.Itens.Count -1 do
    begin
      if (TItem(BuscaPedido1.Ped.Itens[i]).codigoProdutoKit > 0) then
      begin
        codigoKit := Campo_por_campo('PRODUTOS_KIT','CODIGO_KIT||''-''||CODIGO_COR_KIT','CODIGO',intToStr(TItem(BuscaPedido1.Ped.Itens[i]).codigoProdutoKit));

        if(pos(codigoKit, itensRetornados) = 0) then
        begin
          dm.qryGenerica2.Close;
          dm.qryGenerica2.SQL.Text := 'SELECT FIRST 1 * FROM PRODUTOS_KIT WHERE CODIGO = :CODIGO';
          dm.qryGenerica2.ParamByName('CODIGO').AsInteger := TItem(BuscaPedido1.Ped.Itens[i]).codigoProdutoKit;
          dm.qryGenerica2.Open;

          itensRetornados  := itensRetornados + ',' + codigoKit;
          Item             := TItem.Create(false);
          Item.cod_pedido  := TItem(BuscaPedido1.Ped.Itens[i]).cod_pedido;
          Item.cod_produto := dm.qryGenerica2.FieldByName('CODIGO_KIT').AsInteger;
          Item.cod_cor     := dm.qryGenerica2.FieldByName('CODIGO_COR_KIT').AsInteger;
          Item.preco       := TItem(BuscaPedido1.Ped.Itens[i]).preco;
          Item.qtd_RN      := TItem(BuscaPedido1.Ped.Itens[i]).qtd_RN;
          Item.qtd_P       := TItem(BuscaPedido1.Ped.Itens[i]).qtd_P;
          Item.qtd_M       := TItem(BuscaPedido1.Ped.Itens[i]).qtd_M;
          Item.qtd_G       := TItem(BuscaPedido1.Ped.Itens[i]).qtd_G;
          Item.qtd_1       := TItem(BuscaPedido1.Ped.Itens[i]).qtd_1;
          Item.qtd_2       := TItem(BuscaPedido1.Ped.Itens[i]).qtd_2;
          Item.qtd_3       := TItem(BuscaPedido1.Ped.Itens[i]).qtd_3;
          Item.qtd_4       := TItem(BuscaPedido1.Ped.Itens[i]).qtd_4;
          Item.qtd_6       := TItem(BuscaPedido1.Ped.Itens[i]).qtd_6;
          Item.qtd_8       := TItem(BuscaPedido1.Ped.Itens[i]).qtd_8;
          Item.qtd_10      := TItem(BuscaPedido1.Ped.Itens[i]).qtd_10;
          Item.qtd_12      := TItem(BuscaPedido1.Ped.Itens[i]).qtd_12;
          Item.qtd_14      := TItem(BuscaPedido1.Ped.Itens[i]).qtd_14;
          Item.qtd_UNICA   := TItem(BuscaPedido1.Ped.Itens[i]).qtd_UNICA;

          repositorio.Salvar(Item);

          ConferenciaItem                    := TConferenciaItem.Create;
          ConferenciaItem.codigo_conferencia := ConferenciaPedido.codigo;
          ConferenciaItem.codigo_item        := Item.codigo;
          ConferenciaItem.QTD_RN             := Item.qtd_RN;
          ConferenciaItem.qtd_P              := Item.qtd_P;
          ConferenciaItem.qtd_M              := Item.qtd_M;
          ConferenciaItem.qtd_G              := Item.qtd_G;
          ConferenciaItem.qtd_1              := Item.qtd_1;
          ConferenciaItem.qtd_2              := Item.qtd_2;
          ConferenciaItem.qtd_3              := Item.qtd_3;
          ConferenciaItem.qtd_4              := Item.qtd_4;
          ConferenciaItem.qtd_6              := Item.qtd_6;
          ConferenciaItem.qtd_8              := Item.qtd_8;
          ConferenciaItem.qtd_10             := Item.qtd_10;
          ConferenciaItem.qtd_12             := Item.qtd_12;
          ConferenciaItem.qtd_14             := Item.qtd_14;
          ConferenciaItem.qtd_UNICA          := trunc(Item.qtd_UNICA);
          repconferencia.Salvar(ConferenciaItem);
          FreeAndNil(Item);
        end;

        repositorio.Remover(TItem(BuscaPedido1.Ped.Itens[i]));
      end;
    end;
  finally
    FreeAndNil(repositorio);
    FreeAndNil(repconferencia);
  end;
end;

procedure TfrmConferenciaPedido.BuscaPedido1Enter(Sender: TObject);
begin
  inherited;
  BuscaPedido1.FrameEnter(Sender);
end;

procedure TfrmConferenciaPedido.mostra_estoque;
var 
    qryEstoque            :TFDQuery;
    qryEstoqueReservado   :TFDQuery;
begin
 if cdsItens.IsEmpty then Exit;
 try
   qryEstoque          := dm.GetConsulta;
   qryEstoqueReservado := dm.GetConsulta;   
   
   busca_estoque_reservado(qryEstoqueReservado, cdsItensCodPro.AsInteger, cdsItensCodCor.AsInteger);
   busca_estoque_normal(qryEstoque, cdsItensCodPro.AsInteger, cdsItensCodCor.AsInteger);

   qryEstoque.First;
   while not qryEstoque.Eof do
   begin
     case AnsiIndexStr(UpperCase(qryEstoque.FieldByName('TAM').AsString), Tamanhos)  of
       0:  edtRN.Value    := qryEstoque.fieldByName('QTDE').AsInteger - qryEstoqueReservado.fieldByName('QTD_RN').AsInteger;
       1:  edtP.Value     := qryEstoque.fieldByName('QTDE').AsInteger - qryEstoqueReservado.fieldByName('QTD_P').AsInteger;
       2:  edtM.Value     := qryEstoque.fieldByName('QTDE').AsInteger - qryEstoqueReservado.fieldByName('QTD_M').AsInteger;
       3:  edtG.Value     := qryEstoque.fieldByName('QTDE').AsInteger - qryEstoqueReservado.fieldByName('QTD_G').AsInteger;
       4:  edt1.Value     := qryEstoque.fieldByName('QTDE').AsInteger - qryEstoqueReservado.fieldByName('QTD_1').AsInteger;
       5:  edt2.Value     := qryEstoque.fieldByName('QTDE').AsInteger - qryEstoqueReservado.fieldByName('QTD_2').AsInteger;
       6:  edt3.Value     := qryEstoque.fieldByName('QTDE').AsInteger - qryEstoqueReservado.fieldByName('QTD_3').AsInteger;
       7:  edt4.Value     := qryEstoque.fieldByName('QTDE').AsInteger - qryEstoqueReservado.fieldByName('QTD_4').AsInteger;
       8:  edt6.Value     := qryEstoque.fieldByName('QTDE').AsInteger - qryEstoqueReservado.fieldByName('QTD_6').AsInteger;
       9:  edt8.Value     := qryEstoque.fieldByName('QTDE').AsInteger - qryEstoqueReservado.fieldByName('QTD_8').AsInteger;
       10: edtUNICA.Value := qryEstoque.fieldByName('QTDE').AsInteger - qryEstoqueReservado.fieldByName('QTD_UNICA').AsInteger;
       11: edt10.Value    := qryEstoque.fieldByName('QTDE').AsInteger - qryEstoqueReservado.fieldByName('QTD_10').AsInteger;
       12: edt12.Value    := qryEstoque.fieldByName('QTDE').AsInteger - qryEstoqueReservado.fieldByName('QTD_12').AsInteger;
       13: edt14.Value    := qryEstoque.fieldByName('QTDE').AsInteger - qryEstoqueReservado.fieldByName('QTD_14').AsInteger;
     end;     

     qryEstoque.Next;  
   end;
   
 finally
   FreeAndNil(qryEstoque);
   FreeAndNil(qryEstoqueReservado);   
 end;
end;

function TfrmConferenciaPedido.possuiKit: Boolean;
var i :integer;
begin
  result := false;
  for i := 0 to BuscaPedido1.Ped.Itens.Count - 1 do
    if TItem(BuscaPedido1.Ped.Itens[i]).Produto.Kit then
    begin
      result := true;
      break;
    end;
end;

function TfrmConferenciaPedido.busca_estoque(codproduto :String; codcor: integer; Tamanho:String): Real;
var
  i :integer;
begin
  result         := 0;
  i              := 0;

    { se nao existir "," no parametro codproduto, significa que ha apenas 1 codigo, portanto nao e kit }
    if pos(',',codproduto) = 0 then
      { se o tipo do produto for VESTUARIO e for uma COR GENERICA }
      if ( StrToIntDef( Campo_por_campo('PRODUTOS','COD_TIPO','CODIGO',codproduto),0) = integer(tpVestuario) )
      and (codcor in [55,66]) then
        codcor := 0;

    cdsTamanhos.Locate('TAMANHO',Tamanho,[]);

    dm.qryGenerica.Close;
    dm.qryGenerica.SQL.Text := 'select sum(e.quantidade) quantidade from estoque e where                                                  '+
                               'e.codigo_produto in ('+codproduto+') and e.codigo_tamanho = :codtam and ((:codcor = 0) or (:codcor = e.codigo_cor) )';
    dm.qryGenerica.ParamByName('codtam').AsInteger := cdsTamanhos.fieldByName('CODIGO').AsInteger;
    dm.qryGenerica.ParamByName('codcor').AsInteger := codcor;
    dm.qryGenerica.Open;

    result := dm.qryGenerica.fieldByName('quantidade').AsFloat;
end;

procedure TfrmConferenciaPedido.FormDestroy(Sender: TObject);
begin
  FreeAndNil(cdsTamanhos);
end;

procedure TfrmConferenciaPedido.btnPedidosSeparacaoClick(Sender: TObject);
begin
  if not assigned(BuscaPedido1.Ped) then exit;

  frmVisualizacaoPedidoSeparacao := TfrmVisualizacaoPedidoSeparacao.Create(self);

 try
 try
   Aguarda('Aguarde, gerando relatório...');

  // if not gridItens.columns[36].Visible then
 //  begin
    // cdsItens.AfterScroll := nil;
     cdsItens.DisableControls;
     cdsitens.First;
     while not cdsItens.Eof do begin
       calcula_completo_imcompleto;
       cdsItens.Next;
       Application.ProcessMessages;
     end;
     cdsItens.EnableControls;
   //  cdsItens.AfterScroll := cdsItensAfterScroll;
     
   //  gridItens.columns[36].Visible := true;
  // end;

   frmVisualizacaoPedidoSeparacao.imprime(cdsItens ,BuscaPedido1.Ped);

 finally
   FimAguarda;
 end;
 except
   on e : Exception do
     begin
       Avisar(e.Message);
     end;
 end;

 frmVisualizacaoPedidoSeparacao.Release;
 frmVisualizacaoPedidoSeparacao := nil;
end;

procedure TfrmConferenciaPedido.gridItensExit(Sender: TObject);
begin
  inherited;
  cdsItens.AfterScroll := nil;
end;

procedure TfrmConferenciaPedido.gridItensEnter(Sender: TObject);
begin
  inherited;
  cdsItens.AfterScroll := cdsItensAfterScroll;
end;

function TfrmConferenciaPedido.atualiza_qtd_item(Item: TItem; tamanho: String; quantidade: integer;
create_alter :String; desconto :Real) :TItem;
begin

   case AnsiIndexStr(UpperCase(tamanho), ['RN','P','M','G','1','2','3','4','6','8','10','12','14','UNICA']) of
    0 : Item.qtd_RN    := Item.qtd_RN    + quantidade;
    1 : Item.qtd_P     := Item.qtd_P     + quantidade;
    2 : Item.qtd_M     := Item.qtd_M     + quantidade;
    3 : Item.qtd_G     := Item.qtd_G     + quantidade;
    4 : Item.qtd_1     := Item.qtd_1     + quantidade;
    5 : Item.qtd_2     := Item.qtd_2     + quantidade;
    6 : Item.qtd_3     := Item.qtd_3     + quantidade;
    7 : Item.qtd_4     := Item.qtd_4     + quantidade;
    8 : Item.qtd_6     := Item.qtd_6     + quantidade;
    9 : Item.qtd_8     := Item.qtd_8     + quantidade;
    10: Item.qtd_10    := Item.qtd_10    + quantidade;
    11: Item.qtd_12    := Item.qtd_12    + quantidade;
    12: Item.qtd_14    := Item.qtd_14    + quantidade;
    13: Item.qtd_UNICA := Item.qtd_UNICA + quantidade;
   end;

   if create_alter = 'A' then
     Item.desconto    := Item.desconto - desconto;

   Item.qtd_total   := Item.qtd_total;  //para atualizar
   Item.valor_total := Item.valor_total; //para atualizar

   result := Item;
end;

procedure TfrmConferenciaPedido.substitui_item_normal;
begin
   frmBuscaCodigoBarras := TfrmBuscaCodigoBarras.CreateParaSelecao(self, cdsItens, cdsItens.RecNo);

   if frmBuscaCodigoBarras.ShowModal = MrOk then begin
     LinhaSubstituicao := cdsItens.RecNo;
     substitui_item_por_item(frmBuscaCodigoBarras.edtCodigoBarras.Text,
                             StrToInt(frmBuscaCodigoBarras.edtQtdRepor.Text),
                             frmBuscaCodigoBarras.rgTamanhos.Items[frmBuscaCodigoBarras.rgTamanhos.ItemIndex]);
   end;

   frmBuscaCodigoBarras.Release;
   frmBuscaCodigoBarras := nil;
end;

procedure TfrmConferenciaPedido.substitui_item_generico;
var cor   :String;
    linha :integer;
begin
  LinhaSubstituicao := cdsItens.RecNo;

  if cdsItensCor.AsString = 'MASCULINO' then
    cor := 'FEMININO'
  else
    cor := 'MASCULINO';

  linha := cdsItens.RecNo;

  if not cdsItens.Locate('codPro;cor', VarArrayOf([cdsItensCodPro.AsInteger, cor]),[]) then begin
    avisar('Impossível substituir, pois este produto não possui um equivalente na cor '+cor);
    exit;
  end;

  cdsItens.RecNo := linha;

  configura_campos_substituicao('UNICA', cdsItensQTD_UNICA.AsInteger);
  configura_campos_substituicao('14'   , cdsItensQTD_14.AsInteger);
  configura_campos_substituicao('12'   , cdsItensQTD_12.AsInteger);
  configura_campos_substituicao('10'   , cdsItensQTD_10.AsInteger);
  configura_campos_substituicao('8'    , cdsItensQTD_8.AsInteger);
  configura_campos_substituicao('6'    , cdsItensQTD_6.AsInteger);
  configura_campos_substituicao('4'    , cdsItensQTD_4.AsInteger);
  configura_campos_substituicao('3'    , cdsItensQTD_3.AsInteger);
  configura_campos_substituicao('2'    , cdsItensQTD_2.AsInteger);
  configura_campos_substituicao('1'    , cdsItensQTD_1.AsInteger);
  configura_campos_substituicao('G'    , cdsItensQTD_G.AsInteger);
  configura_campos_substituicao('M'    , cdsItensQTD_M.AsInteger);
  configura_campos_substituicao('P'    , cdsItensQTD_P.AsInteger);
  configura_campos_substituicao('RN'   , cdsItensQTD_RN.AsInteger);

  pnlSubstituicao.Visible := true;
end;

procedure TfrmConferenciaPedido.btnCancelaSubClick(Sender: TObject);
begin
  pnlSubstituicao.Visible := false;
  limpa_edits_substituicao;
end;

procedure TfrmConferenciaPedido.btnSubstituiClick(Sender: TObject);
begin
  SubstituirProduto1Click(nil);
end;

procedure TfrmConferenciaPedido.btnSubstituirClick(Sender: TObject);
var Item :TItem;
    repositorio :TRepositorio;
    cor   :String;
begin
  if cdsItensCor.AsString = 'MASCULINO' then
    cor := 'FEMININO'
  else
    cor := 'MASCULINO';

  repositorio := TFabricaRepositorio.GetRepositorio(TItem.ClassName);
  Item        := TItem( repositorio.Get( cdsItensCODIGO.AsInteger ) );

  Item.qtd_RN    := Item.qtd_RN - edtSubsRN.AsInteger;
  Item.qtd_P     := Item.qtd_P - edtSubsP.AsInteger;
  Item.qtd_M     := Item.qtd_M - edtSubsM.AsInteger;
  Item.qtd_G     := Item.qtd_G - edtSubsG.AsInteger;
  Item.qtd_1     := Item.qtd_1 - edtSubs1.AsInteger;
  Item.qtd_2     := Item.qtd_2 - edtSubs2.AsInteger;
  Item.qtd_3     := Item.qtd_3 - edtSubs3.AsInteger;
  Item.qtd_4     := Item.qtd_4 - edtSubs4.AsInteger;
  Item.qtd_6     := Item.qtd_6 - edtSubs6.AsInteger;
  Item.qtd_8     := Item.qtd_8 - edtSubs8.AsInteger;
  Item.qtd_10    := Item.qtd_10 - edtSubs10.AsInteger;
  Item.qtd_12    := Item.qtd_12 - edtSubs12.AsInteger;
  Item.qtd_14    := Item.qtd_14 - edtSubs14.AsInteger;
  Item.qtd_UNICA := Item.qtd_UNICA - edtSubsUNICA.AsInteger;

  repositorio.Salvar(Item);

  if Item.qtd_total = 0 then
    repositorio.Remover(Item);

  cdsItens.Locate('codPro;cor', VarArrayOf([cdsItensCodPro.AsInteger, cor]),[]);

  Item        := TItem( repositorio.Get( cdsItensCODIGO.AsInteger ) );

  Item.qtd_RN    := Item.qtd_RN + edtSubsRN.AsInteger;
  Item.qtd_P     := Item.qtd_P + edtSubsP.AsInteger;
  Item.qtd_M     := Item.qtd_M + edtSubsM.AsInteger;
  Item.qtd_G     := Item.qtd_G + edtSubsG.AsInteger;
  Item.qtd_1     := Item.qtd_1 + edtSubs1.AsInteger;
  Item.qtd_2     := Item.qtd_2 + edtSubs2.AsInteger;
  Item.qtd_3     := Item.qtd_3 + edtSubs3.AsInteger;
  Item.qtd_4     := Item.qtd_4 + edtSubs4.AsInteger;
  Item.qtd_6     := Item.qtd_6 + edtSubs6.AsInteger;
  Item.qtd_8     := Item.qtd_8 + edtSubs8.AsInteger;
  Item.qtd_10    := Item.qtd_10 + edtSubs10.AsInteger;
  Item.qtd_12    := Item.qtd_12 + edtSubs12.AsInteger;
  Item.qtd_14    := Item.qtd_14 + edtSubs14.AsInteger;
  Item.qtd_UNICA := Item.qtd_UNICA + edtSubsUNICA.AsInteger;

  repositorio.Salvar(Item);

  btnCancelaSub.Click;

  reinicia_pedido;
end;

procedure TfrmConferenciaPedido.configura_campos_substituicao(tamanho :String; quantidade :Integer);
var edtMax, edtQtdSubs :TCurrencyEdit;
    lbTamanho :TLabel;
begin
  edtMax     := TCurrencyEdit( self.FindComponent('edtMax'+tamanho) );
  edtQtdSubs := TCurrencyEdit( self.FindComponent('edtSubs'+tamanho) );
  lbTamanho  := TLabel( self.FindComponent('lb'+tamanho));

  edtQtdSubs.Enabled   := (quantidade > 0);
  edtQtdSubs.MaxValue  := quantidade;
  edtMax.AsInteger     := quantidade;

  if (quantidade > 0) then begin
    lbTamanho.Font.Style := [fsBold];
    edtQtdSubs.Color     := $00F7DBD5;
  end
  else begin
    lbTamanho.Font.Style := [fsItalic];
    edtQtdSubs.Color     := $00E5E5E5;
  end;
end;

procedure TfrmConferenciaPedido.limpa_edits_substituicao;
var i :integer;
begin

  for i := 0 to self.ComponentCount -1 do begin
    if (self.Components[i] is TCurrencyEdit) and
       ((self.Components[i] as TCurrencyEdit).Parent = pnlSubstituicao) then
           (self.Components[i] as TCurrencyEdit).Clear;
  end;
end;

procedure TfrmConferenciaPedido.busca_estoque_normal(qry :TFDQuery; codproduto: integer; codcor: integer);
var estoqueEcommerce, corGenerica :Boolean;
    setor :integer;
    condicaoCorGenerica :String;
    joinCorGenerica :String;
begin
  if ( StrToIntDef(Campo_por_campo('PRODUTOS','COD_TIPO','CODIGO',intToStr(codproduto)),0) = integer(tpVestuario) )
  and (codcor in [55,66]) then
    codcor := 0;
  //55 masc - 66 fem
  corGenerica := codcor = 0;

  if corGenerica then
  begin
    joinCorGenerica := ' left join produto_cores pc on ((pc.codproduto = e.codigo_produto) and (pc.codcor = e.codigo_cor)) ';
    condicaoCorGenerica := ' and ('+ IfThen(codcor = 55, 'pc.genero = ''M''', 'pc.genero = ''F''') + ' or pc.genero = '''' or pc.genero is null)';
  end;

  { * * e-commerce tem o proprio estoque de estampados e divide o de lisos e listrados com a fábrica * * }
  estoqueEcommerce := assigned(BuscaPedido1.Ped.Representante.DadosRepresentante) and
                      (BuscaPedido1.Ped.Representante.DadosRepresentante.rep_ecommerce) and
                      (cdsItensTIPO_COR.AsString = 'E');

  setor := IfThen(estoqueEcommerce, 2,1);

  qry.SQL.Text := 'select tam.descricao TAM,                           '+
                  '( select sum(e.quantidade) from estoque e           '+
                    joinCorGenerica+
                  '  where e.codigo_tamanho = tam.codigo               '+
                  '    and e.codigo_produto = :codprod                 '+
                  '    and ((:codcor = 0) or (e.codigo_cor = :codcor)) '+
                  '    and e.setor = :s '+condicaoCorGenerica+
                  ') qtde from tamanhos tam ';

  qry.ParamByName('codcor').AsInteger  := codcor;
  qry.ParamByName('s').AsInteger       := setor;
  qry.ParamByName('codprod').AsInteger := codproduto;   
  qry.open;
end;

procedure TfrmConferenciaPedido.busca_estoque_reservado(qry :TFDQuery; codproduto :integer; codcor: integer);
var estoqueEcommerce, corGenerica :boolean;
  joinsEcommerce, condicaoEcommerce, condicaoCorGenerica :string;
begin
  if ( StrToIntDef(Campo_por_campo('PRODUTOS','COD_TIPO','CODIGO',intToStr(codproduto)),0) = integer(tpVestuario) )
  and (codcor in [55,66]) then
    codcor := 0;
  //55 masc - 66 fem
  corGenerica := codcor = 0;

  { * * e-commerce tem o proprio estoque de estampados e divide o de lisos e listrados com a fábrica * * }
  estoqueEcommerce    := assigned(BuscaPedido1.Ped.Representante.DadosRepresentante) and
                         (BuscaPedido1.Ped.Representante.DadosRepresentante.rep_ecommerce) and
                         (cdsItensTIPO_COR.AsString = 'E');

  if corGenerica then
    condicaoCorGenerica := 'and ('+ IfThen(codcor = 55, 'pc.genero = ''M''', 'pc.genero = ''F''') + ' or pc.genero = '''' or pc.genero is null)';

  if estoqueEcommerce then
  begin
    joinsEcommerce   := 'inner join pedidos             ped on ped.codigo = i.cod_pedido           '+
                        'inner join pessoas             rep on rep.codigo = ped.cod_repres         '+
                        'left join  dados_representante  dr on dr.codigo_representante = rep.codigo';

    condicaoEcommerce := ' and dr.rep_ecommerce = ''S'' and pro.tipo = ''E'' ';
  end;

  qry.Close;
  qry.SQL.Text := 'select sum(ci.qtd_rn) QTD_RN, sum(ci.qtd_p) QTD_P, sum(ci.qtd_m) QTD_M, sum(ci.qtd_g) QTD_G,     '+
                  ' sum(ci.qtd_1) QTD_1, sum(ci.qtd_2) QTD_2, sum(ci.qtd_3) QTD_3, sum(ci.qtd_4) QTD_4,             '+
                  ' sum(ci.qtd_6) QTD_6, sum(ci.qtd_8) QTD_8, sum(ci.qtd_8) QTD_10, sum(ci.qtd_8) QTD_12,           '+
                  ' sum(ci.qtd_8) QTD_14, sum(ci.qtd_unica) QTD_unica                                               '+
                  ' from ITENS i                                                                                    '+
                  ' inner join conferencia_itens  ci on ci.codigo_item = i.codigo                                   '+
                  ' inner join conferencia_pedido cp on cp.codigo = ci.codigo_conferencia                           '+
                  ' inner join cores              cor on cor.codigo = i.cod_cor                                     '+
                  ' inner join produtos           pro on pro.codigo = i.cod_produto                                 '+
                  ' inner join produto_cores      pc  on ((pc.codproduto = pro.codigo) and (pc.codcor = cor.codigo))'+
                    joinsEcommerce +

                  { < 01/01/1990 pois a data padrao do fb é 30/12/1899, significando conferencia em aberto }
                  ' where cp.fim < ''01.01.1900'' and i.cod_produto = :codpro                                    '+
                    IfThen(corGenerica,'','   and cor.codigo = ' + IntToStr(codcor)) + condicaoEcommerce + condicaoCorGenerica +
                  { quando é 55 ou 66 significa cor generica, então soma-se o estoque das cores que se enquadram }

                  ' group by pro.referencia'+IfThen(corGenerica,'',', cor.referencia ')+
                  ' order by pro.referencia'+IfThen(corGenerica,'',', cor.referencia ');
                  
  qry.ParamByName('codpro').AsInteger := codproduto;
  qry.Open;
end;

procedure TfrmConferenciaPedido.btnExcluirClick(Sender: TObject);
var
  repositorio       :TRepositorio;
begin
  repositorio := nil;

  if not assigned(BuscaPedido1.Ped.Conferencia) then
  begin
    avisar('Ainda não existe uma conferência salva associada a esse pedido');
    exit;
  end;

  if not confirma('Deseja realmente EXCLUIR a conferência atual?'+#13#10+
                  '(ao excluir a conferência, tudo o que foi conferido será zerado)') then
    exit;
  try
  try
    dm.conexao.TxOptions.AutoCommit := false;

    atualizaEstoquePedidoTotal(BuscaPedido1.Ped, +1);

    //se for pedido de representante E-Commerce e não for pedido da própria plataforma, o estoque é atualizado na mesma
    if assigned(BuscaPedido1.Ped.Representante.DadosRepresentante) and BuscaPedido1.Ped.Representante.DadosRepresentante.rep_ecommerce and
      (dm.configuracoesECommerce.codigo_representante <> BuscaPedido1.Ped.Representante.Codigo) then
      atualizaEstoquePlataformaPeloPedido(+1);

    repositorio := TFabricaRepositorio.GetRepositorio(TConferenciaItem.ClassName);

    repositorio.RemoverPorIdentificador(BuscaPedido1.Ped.Conferencia.codigo);

    repositorio := TFabricaRepositorio.GetRepositorio(TCaixas.ClassName);

    repositorio.RemoverPorIdentificador(BuscaPedido1.Ped.Conferencia.codigo);

    repositorio := TFabricaRepositorio.GetRepositorio(TConferenciaPedido.ClassName);

    repositorio.RemoverPorIdentificador(BuscaPedido1.Ped.Conferencia.codigo);

    dm.conexao.Commit;

    avisar('Conferência excluída!', 5);
    btnCancelar.Click;

  Except
    on e : Exception do
     begin
       dm.conexao.Rollback;
       avisar(e.Message);
     end;
  end;
  
  Finally
    dm.conexao.TxOptions.AutoCommit := true;
    FreeAndNil(repositorio);
  end;
end;

procedure TfrmConferenciaPedido.calcula_completo_imcompleto;
var
    tamanho    :String;
    i, linha   :integer;
    incompleto :Boolean;
begin
  with cdsItens do
  begin
    for i := 0 to Fields.Count -1 do
    begin
      if (pos('QTD_',Fields[i].FieldName) > 0) and (pos('_O',Fields[i].FieldName) = 0) then
      begin
        tamanho     := copy(Fields[i].FieldName, pos('QTD_',Fields[i].FieldName)+4, 5);
        case AnsiIndexStr(tamanho, Tamanhos)  of
          0:  incompleto := edtRN.Value < fields[i].AsInteger;
          1:  incompleto := edtP.Value < fields[i].AsInteger;
          2:  incompleto := edtM.Value < fields[i].AsInteger;
          3:  incompleto := edtG.Value < fields[i].AsInteger;
          4:  incompleto := edt1.Value < fields[i].AsInteger;
          5:  incompleto := edt2.Value < fields[i].AsInteger;
          6:  incompleto := edt3.Value < fields[i].AsInteger;
          7:  incompleto := edt4.Value < fields[i].AsInteger;
          8:  incompleto := edt6.Value < fields[i].AsInteger;
          9:  incompleto := edt8.Value < fields[i].AsInteger;
          10: incompleto := edtUNICA.Value < fields[i].AsInteger;
          11: incompleto := edt10.Value < fields[i].AsInteger;
          12: incompleto := edt12.Value < fields[i].AsInteger;
          13: incompleto := edt14.Value < fields[i].AsInteger;
        end;
      end;
      if incompleto then
        break;
    end;

    linha := cdsItens.recno;
    cdsItens.Edit;
    cdsItensC_I.AsString   := IfThen(incompleto, 'N', 'S');
    cdsItens.Append;
    cdsItens.recno := linha;
  end;
end;

procedure TfrmConferenciaPedido.cdsItensConferidosCalcFields(DataSet: TDataSet);
begin
  With DataSet do
  begin
    if State in [dsInternalCalc] then begin

      FieldByName('CONFERIDO').AsString := IfThen(   (FieldByName('QTD_RN').AsInteger <> FieldByName('QTD_RN_O').AsInteger)
                                                  or (FieldByName('QTD_P').AsInteger <> FieldByName('QTD_P_O').AsInteger)
                                                  or (FieldByName('QTD_M').AsInteger <> FieldByName('QTD_M_O').AsInteger)
                                                  or (FieldByName('QTD_G').AsInteger <> FieldByName('QTD_G_O').AsInteger)
                                                  or (FieldByName('QTD_1').AsInteger <> FieldByName('QTD_1_O').AsInteger)
                                                  or (FieldByName('QTD_2').AsInteger <> FieldByName('QTD_2_O').AsInteger)
                                                  or (FieldByName('QTD_3').AsInteger <> FieldByName('QTD_3_O').AsInteger)
                                                  or (FieldByName('QTD_4').AsInteger <> FieldByName('QTD_4_O').AsInteger)
                                                  or (FieldByName('QTD_6').AsInteger <> FieldByName('QTD_6_O').AsInteger)
                                                  or (FieldByName('QTD_8').AsInteger <> FieldByName('QTD_8_O').AsInteger)
                                                  or (FieldByName('QTD_10').AsInteger <> FieldByName('QTD_10_O').AsInteger)
                                                  or (FieldByName('QTD_12').AsInteger <> FieldByName('QTD_12_O').AsInteger)
                                                  or (FieldByName('QTD_14').AsInteger <> FieldByName('QTD_14_O').AsInteger)
                                                  or (FieldByName('QTD_unica').AsInteger <> FieldByName('QTD_unica_O').AsInteger), 'N', 'S');
    end;
  end;
end;

procedure TfrmConferenciaPedido.chkTodosClick(Sender: TObject);
begin
  chkTodos.OnClick         := nil;
  chkConferidos.OnClick    := nil;
  chkNaoConferidos.OnClick := nil;

  filtraItens( TCheckBox(Sender) );

  chkTodos.OnClick         := chkTodosClick;
  chkConferidos.OnClick    := chkTodosClick;
  chkNaoConferidos.OnClick := chkTodosClick;
end;

procedure TfrmConferenciaPedido.cdsItensCalcFields(DataSet: TDataSet);
begin
  With DataSet do
  begin
    if State in [dsInternalCalc] then begin

      FieldByName('CONFERIDO').AsString := IfThen((FieldByName('QTD_RN').AsInteger > 0) or (FieldByName('QTD_P').AsInteger > 0) or (FieldByName('QTD_M').AsInteger > 0)
                                               or (FieldByName('QTD_G').AsInteger > 0) or (FieldByName('QTD_1').AsInteger > 0) or (FieldByName('QTD_2').AsInteger > 0)
                                               or (FieldByName('QTD_3').AsInteger > 0) or (FieldByName('QTD_4').AsInteger > 0) or (FieldByName('QTD_6').AsInteger > 0)
                                               or (FieldByName('QTD_8').AsInteger > 0) or (FieldByName('QTD_10').AsInteger > 0) or (FieldByName('QTD_12').AsInteger > 0)
                                               or (FieldByName('QTD_14').AsInteger > 0) or (FieldByName('QTD_unica').AsInteger > 0), 'N', 'S');
    end;
  end;
end;

procedure TfrmConferenciaPedido.substitui_generico(coditem, codigo_cor: integer; refcor, cor, tamanho: String; quantidade: integer);
var produto, refpro, num_caixa :String;
    codpro, tipo :integer;
    preco :Real;
    excluiu :Boolean;
begin
    produto   := cdsItensPRODUTO.AsString;
    refpro    := cdsItensREFPRO.AsString;
    num_caixa := cdsItensNUM_CAIXA.AsString;
    tipo      := cdsItensTIPO.AsInteger;
    codpro    := cdsItensCODPRO.AsInteger;
    preco     := cdsItensPreco.AsFloat;

    atualiza_quantidade_item(cdsitensCODIGO.AsInteger, quantidade, tamanho, excluiu);

    if excluiu then
      cdsItens.Delete
    else
    begin
      cdsitens.Edit;
      cdsItens.FieldByName('QTD_'+tamanho).AsInteger      := cdsItens.FieldByName('QTD_'+tamanho).AsInteger - quantidade;
      cdsItens.FieldByName('QTD_'+tamanho+'_O').AsInteger := cdsItens.FieldByName('QTD_'+tamanho+'_O').AsInteger - quantidade;
      cdsItens.Post;
    end;

    if not cdsItens.Locate('CODPRO;CODCOR',varArrayOf([codpro,codigo_cor]),[]) then
    begin
      cdsItens.Append;
      cdsItensCODIGO.AsInteger   := insere_altera_item(BuscaPedido1.Ped.Codigo, codpro, codigo_cor, quantidade, preco, tamanho);
      cdsItensPRODUTO.AsString   := produto;
      cdsItensREFPRO.AsString    := refpro;
      cdsItensNUM_CAIXA.AsString := num_caixa;
      cdsItensTIPO.AsInteger     := tipo;
      cdsItensCODPRO.AsInteger   := codpro;
      cdsItensCODCOR.AsInteger   := codigo_cor;
      cdsItensREFCOR.AsString    := refcor;
      cdsItensCOR.AsString       := cor;
      cdsItensC_I.AsString       := 'S';
      cdsItensCONFERIDO.AsString := 'S';
    end
    else begin
      cdsItens.Edit;
      insere_altera_item(BuscaPedido1.Ped.Codigo, codpro, codigo_cor, quantidade, preco, tamanho, cdsItensCodigo.asInteger);
    end;

    cdsItens.FieldByName('QTD_'+tamanho).AsInteger      := quantidade;
    cdsItens.FieldByName('QTD_'+tamanho+'_O').AsInteger := cdsItens.FieldByName('QTD_'+tamanho+'_O').AsInteger + quantidade;
    cdsItens.Post;
end;

procedure TfrmConferenciaPedido.Timer2Timer(Sender: TObject);
begin
  linha_estoque_calculado := cdsItens.RecNo;
  Timer2.Enabled := false;
  mostra_estoque;
end;

function TfrmConferenciaPedido.insere_altera_item(codpedido, codpro, codcor, quantidade: Integer; preco: Real; tamanho: String;
  const coditem: integer): Integer;
var repositorio :TRepositorio;
    Item        :TItem;
    i           :integer;
begin
  try
    if coditem > 0 then
    begin
      for i := 0 to BuscaPedido1.Ped.Itens.Count - 1 do
        if TItem(BuscaPedido1.Ped.Itens[i]).codigo = coditem then
           Item := TItem(BuscaPedido1.Ped.Itens[i]);
    end
    else
      Item := TITem.Create(false);

    repositorio := TFabricaRepositorio.GetRepositorio(TItem.ClassName);

    if not assigned(Item) then
      Item := TItem.Create(false);

    Item.cod_pedido    := codpedido;
    Item.cod_produto   := codpro;
    Item.cod_cor       := codcor;
    Item.preco         := preco;

    case AnsiIndexStr(UpperCase(tamanho), ['RN','P','M','G','1','2','3','4','6','8','10','12','14','UNICA']) of
     0  : Item.qtd_RN    := Item.qtd_RN    + quantidade;
     1  : Item.qtd_P     := Item.qtd_P     + quantidade;
     2  : Item.qtd_M     := Item.qtd_M     + quantidade;
     3  : Item.qtd_G     := Item.qtd_G     + quantidade;
     4  : Item.qtd_1     := Item.qtd_1     + quantidade;
     5  : Item.qtd_2     := Item.qtd_2     + quantidade;
     6  : Item.qtd_3     := Item.qtd_3     + quantidade;
     7  : Item.qtd_4     := Item.qtd_4     + quantidade;
     8  : Item.qtd_6     := Item.qtd_6     + quantidade;
     9  : Item.qtd_8     := Item.qtd_8     + quantidade;
     10 : Item.qtd_10    := Item.qtd_10    + quantidade;
     11 : Item.qtd_12    := Item.qtd_12    + quantidade;
     12 : Item.qtd_14    := Item.qtd_14    + quantidade;
     13 : Item.qtd_UNICA := Item.qtd_UNICA + quantidade;
    end;

    Item.qtd_total   := Item.qtd_total;
    Item.valor_total := Item.valor_total;

    repositorio.Salvar(Item);

    if coditem > 0 then
      Item.codigo      := coditem
    else
      BuscaPedido1.Ped.Itens.Add(Item);

    result := Item.codigo;
  Finally
    FreeAndNil(repositorio);
  end;
end;

procedure TfrmConferenciaPedido.atualiza_quantidade_item(coditem, quantidade: integer; tamanho :String; var excluiu :Boolean);
var repositorio :TRepositorio;
    Item        :TItem;
    i           :integer;
begin
  try
    if coditem > 0 then
    begin
      for i := 0 to BuscaPedido1.Ped.Itens.Count - 1 do
        if TItem(BuscaPedido1.Ped.Itens[i]).codigo = coditem then
           Item := TItem(BuscaPedido1.Ped.Itens[i]);
    end
    else
      Item := TITem.Create(false);

    excluiu     := false;
    repositorio := TFabricaRepositorio.GetRepositorio(TItem.ClassName);

    case AnsiIndexStr(UpperCase(tamanho), ['RN','P','M','G','1','2','3','4','6','8','10','12','14','UNICA']) of
     0  : Item.qtd_RN    := Item.qtd_RN    - quantidade;
     1  : Item.qtd_P     := Item.qtd_P     - quantidade;
     2  : Item.qtd_M     := Item.qtd_M     - quantidade;
     3  : Item.qtd_G     := Item.qtd_G     - quantidade;
     4  : Item.qtd_1     := Item.qtd_1     - quantidade;
     5  : Item.qtd_2     := Item.qtd_2     - quantidade;
     6  : Item.qtd_3     := Item.qtd_3     - quantidade;
     7  : Item.qtd_4     := Item.qtd_4     - quantidade;
     8  : Item.qtd_6     := Item.qtd_6     - quantidade;
     9  : Item.qtd_8     := Item.qtd_8     - quantidade;
     10 : Item.qtd_10    := Item.qtd_10    - quantidade;
     11 : Item.qtd_12    := Item.qtd_12    - quantidade;
     12 : Item.qtd_14    := Item.qtd_14    - quantidade;
     13 : Item.qtd_UNICA := Item.qtd_UNICA - quantidade;
    end;

    if Item.qtd_total = 0 then
    begin
      repositorio.Remover(Item);
      BuscaPedido1.Ped.Itens.Remove(Item);
      excluiu := true;
    end
    else
    begin
      repositorio.Salvar(Item);
      Item.codigo := coditem;
    end;

  Finally
    FreeAndNil(repositorio);
  end;
end;

procedure TfrmConferenciaPedido.btnAlteraCaixasClick(Sender: TObject);
begin
{  if (FCaixasDoPedido.Count > 0) then
  begin
    frmAlteraCaixas := TfrmAlteraCaixas.Create(nil);
    frmAlteraCaixas.CaixasDoPedido := self.FCaixasDoPedido;
    frmAlteraCaixas.ShowModal;
    frmAlteraCaixas.Release;
    frmAlteraCaixas := nil;
  end
  else
    avisar('Ainda não existem caixas incluídas');   }
end;

function TfrmConferenciaPedido.corGenerica(cor: String): Boolean;
begin
  result := (cor = 'MASCULINO') or (cor = 'FEMININO') or (cor = 'SORTIDO');
end;

procedure TfrmConferenciaPedido.Timer3Timer(Sender: TObject);
begin
  cdsItens.FindFirst;

  cdsItens.IndexFieldNames := 'REFPRO';
  timer3.Enabled := false;
  
  if LinhaSubstituicao > 0 then
  begin
    cdsItens.RecNo := LinhaSubstituicao;
    LinhaSubstituicao := 0;
  end;
end;

function TfrmConferenciaPedido.verificaDesmembramento: Boolean;
var linha :integer;
    status, aux :String;
begin
  result := true;
  try
    linha  := cdsItens.RecNo;
    cdsItens.DisableControls;
    cdsItens.First;
    while not cdsItens.Eof do
    begin
      if cdsItensCODIGO_KIT.AsInteger > 0 then
      begin
        if cdsItensConferidos.Locate('CODIGO_ITEM',cdsItensCODIGO.AsInteger, []) then
          aux := IfThen(cdsItensConferidosconferido.AsString = 'S', 'C', 'I');

        if not(status.IsEmpty) and (aux <> status) then
          exit;

        status := aux;
      end;

      cdsItens.Next;
    end;

    result := false;
  finally
    cdsItens.EnableControls;
    cdsItens.RecNo := linha;
  end;
end;

procedure TfrmConferenciaPedido.verificaMapaFinalizado;
var codmapa, i :integer;
    mapa    :TMapa;
    repositorio :TRepositorio;
begin
  codmapa := strToIntDef(Campo_por_campo('PEDIDOS_MAPA','CODIGO_MAPA','CODIGO_PEDIDO',intToStr(BuscaPedido1.Ped.Codigo)),0);

  if codmapa = 0 then
    exit;

  try
    repositorio := nil;
    Mapa        := nil;

    repositorio := TFabricaRepositorio.GetRepositorio(TMapa.ClassName);
    Mapa        := TMapa(repositorio.Get(codmapa));

    for i := 0 to Mapa.Pedidos.Count - 1 do
      if (Mapa.Pedidos[i] as TPedidoMapa).Pedido.Conferencia.Fim = 0 then
        exit;

    Mapa.finalizado := 'S';
    repositorio.Salvar(Mapa);
  finally
    FreeAndNil(repositorio);
    FreeAndNil(mapa);
  end;
end;

end.




