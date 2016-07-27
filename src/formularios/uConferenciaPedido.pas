unit uConferenciaPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Usuario, Grids, DBGrids, DBGridCBN, ComCtrls, Funcoes,
  frameBuscaPedido, StdCtrls, DB, DBClient, pngimage, ExtCtrls, Mask, ConferenciaItem,
  RxToolEdit, RxCurrEdit, Item, Math,
  Buttons, ContNrs, StrUtils, ImgList, frameListaCampo, Pedido, ConferenciaPEdido,
  Provider, Menus, Produto, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TTipoProduto = (Acessorio, Vestuario);  
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
    qry: TFDQuery;
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

  private
    hora_inicio :TTime;
    cdsTamanhos :TClientDataSet;
    linha_estoque_calculado :integer;
    FVisualizarConferencia :Boolean;
    LinhaSubstituicao :integer;

    procedure carrega_dados;

    { busca uma referencia mediante seu codigo de barras e marca no grid ,o item correspondente, como conferido }
    function busca_e_adiciona :Boolean;

    procedure calcula_completo_imcompleto;
    procedure substitui_generico(coditem, codigo_cor :integer; refcor, cor, tamanho :String; quantidade :integer);

    function insere_altera_item(codpedido, codpro, codcor, quantidade: Integer; preco: Real; tamanho: String; const coditem: integer = 0): Integer;

    procedure atualiza_quantidade_item(coditem, quantidade :integer; tamanho :String; var excluiu :Boolean);

    { busca o codigo de barras do item, com base nos parametros informados }
    function busca_codigo_barras(codigo_produto, codigo_cor :integer; tamanho :String):String;

    { esta procedure faz o contrario da procedure "busca_codigo_barras" }
    procedure item_por_codigo_barras(var codigo_produto, codigo_cor :integer; var refcor, cor, tamanho :String; var masculino_feminino,
                                     cod_bar :String; var acessorio :Boolean);

    procedure calcula_percentagem_conferida;

    procedure seleciona_caixas;

    { cria um novo pedido com os itens que atualmente ainda não foram conferidos }
    procedure divide_pedido;
    procedure recalcula_valores;
    function corGenerica(cor :String):Boolean;
    procedure deleta_itens(codigos_itens :String);
    procedure deleta_conferencia_itens(codigos_conferencia_itens :String);

    { cria um novo item apenas com as quantidades conferidas, recalcula os seus valores e insere ao pedido }
    function  atualiza_item(Pedido :TPedido; codigo_item: Integer; var total :Real; var desconto_itens :Real) :Boolean;

    { faz a mesma coisa que a procedure acima, mas para inserir no novo pedido criado }
    function  cria_item(Pedido :TPedido; Item :TItem; var total :Real; var desconto_itens :Real; grades_inteiras :Boolean) :Boolean;

    { vai armazenando os itens que vao substituindo os itens das cores genericas ('MASCULINO' e 'FEMININO')}
    procedure armazena_substituto(codigo_item, codigo_cor, quantidade :integer; tamanho, genero :String);

    procedure AtualizaValoresConferenciaItem(Item :TConferenciaItem; Q_RN, Q_P, Q_M, Q_G, Q_1, Q_2, Q_3, Q_4, Q_6, Q_8, Q_unica :integer);
    function item_conferido(codigo_item :integer) :Boolean;

    { atualiza o pedido, substituindo os itens genericos, por aqueles previamente armazenados na procedure "armazena_substituto"}
    procedure substitui_produto_generico;

    { criado para substituir um item de determinada cor e tamanho por outro item da mesma cor, somente mudando o tamanho }
    procedure substitui_item_por_item(cod_bar_substituto :String; qtde_substituida :Integer; tamanho_substituido :String);

    { substituicao normal }
    procedure substitui_item_normal;
    { quando o produto eh vestuario e a cor eh generica(M ou F), ele so pode ser substituido por outra cor generica }
    procedure substitui_item_generico;

    procedure habilita_desabilita_caixas(boleana :Boolean);

    function  busca_estoque(codproduto :String; codcor :integer; Tamanho:String) :Real;
    procedure busca_estoque_reservado(codproduto :String; codcor :integer);

    { mostra o estoque da referencia selecionada no grid }
    procedure mostra_estoque;

    { feito para baixar o estoque das referencias contidas no pedido (usar apenas quando o pedido for 100% conferido)}
    procedure atualiza_estoque(codigo_pedido :Integer; operacao :integer);

    procedure Busca_tamanhos(var cds :TClientDataSet);

    { SALVAR }

    procedure Salva_estoque(cod_produto, cod_cor :integer; descricao_tamanho :String; quantidade :Real);
    function Salvar_conferencia :Boolean;

    { Salva a associaçao (ITEM <-> CAIXA) criada }
    procedure SalvarAtualizar_caixas;

  private

    function  Conferencia_finalizada :Boolean;
    function  verifica_esta_conferido :String;
    function  grade_imcompleta :Boolean;

    { se ao dividir o pedido, for solicitado apenas grades fechadas, ele envia para o novo pedido, os itens com grades parcialmente conferidas}
    procedure transfere_conferencia(itens_deletar :String);

    procedure remove_item(codigo :integer);
    function atualiza_qtd_item(Item :TItem; tamanho :String; quantidade :integer; create_alter :String; desconto :Real) :TItem;
    procedure configura_campos_substituicao(tamanho :String; quantidade :Integer);
    procedure limpa_edits_substituicao;

    procedure reinicia_pedido;
    function verificaSeEKit(codigo_produto :integer) :String;
    procedure filtraItens(checkBox :TCheckBox);

  public
    property visualizarConferencia :Boolean read FVisualizarConferencia write FVisualizarConferencia;
  end;

var
  frmConferenciaPedido: TfrmConferenciaPedido;

implementation

uses uModulo, Repositorio, FabricaREpositorio, Especificacao, CriaBalaoInformacao, ProdutosKit,
     EspecificacaoItemPorPedidoProdutoCor, Caixas, uBuscaCodigoBarras, uRelatorioRomaneio,
     Tamanho, EspecificacaoEstoquePorProdutoCorTamanho, Estoque, uVisualizacaoPedidoSeparacao;

{$R *.dfm}

{ TfrmConferenciaPedido }

procedure TfrmConferenciaPedido.carrega_dados;
var i:integer;
begin

  if not assigned(BuscaPedido1.Ped) then EXIT;

  qry.Close;
  qry.ParamByName('codigo').AsInteger := BuscaPedido1.Ped.Codigo;
  qry.Open;

  cdsItens.Close;
  qryItens.ParamByName('codpedido').AsInteger := BuscaPedido1.Ped.Codigo;
  cdsItens.Open;

  cdsItensConferidos.Close;
  qryItensConferidos.ParamByName('codpedido').AsInteger := BuscaPedido1.Ped.Codigo;
  cdsItensConferidos.Open;

  calcula_percentagem_conferida;
end;

procedure TfrmConferenciaPedido.BuscaPedido1Exit(Sender: TObject);
var Conferido :Boolean;
begin
  if not assigned(BuscaPedido1.Ped) then
    BuscaPedido1.btnBuscar.Click;

  Conferido := Conferencia_finalizada;

  gridItens.Columns[0].Visible  := Conferido;
  gridItens.Columns[30].Visible := Conferido;

  habilita_desabilita_caixas(Conferido and not FVisualizarConferencia);

  if assigned(BuscaPedido1.Ped) then begin

     edtCodigoBarras.Visible := not FVisualizarConferencia;
     BuscaPedido1.Enabled    := false;

     cdsItens.DisableControls;
     cdsItens.AfterScroll := nil;

     carrega_dados;
     lbStatus.Caption        := 'CONFERINDO PEDIDO';
     hora_inicio             := Time;

     if edtCodigoBarras.Enabled and edtCodigoBarras.Visible then edtCodigoBarras.SetFocus;

     seleciona_caixas;
     lbEntrega.Caption       := DateToStr(BuscaPedido1.Ped.dt_entrega);
     lbLimiteEntrega.Caption := DateToStr(BuscaPedido1.Ped.dt_limite_entrega);
     lbCliente.Caption       := BuscaPedido1.Ped.Cliente.Razao;
     lbRepresentante.Caption := BuscaPedido1.Ped.Representante.Razao;                     
     memoObs.Text            := BuscaPedido1.Ped.observacao;
     pnlinfoPedido.Visible   := true;
     panObs.Visible          := true;

     if cbCaixas.Visible then begin

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
    tamanho, conferido, masculino_feminino, refcor, cor :String;
    produtoComCorGenerica, acessorio :Boolean;
    achou_especifico :integer;
    codigo_barras        :String;
    linha_item_conferido, codigo_cor_pai :integer;
begin
  Result                := false;
  achou_especifico      := 0;
  produtoComCorGenerica := false;
  linha_item_conferido  := 0;

  codigo_barras := trim(edtCodigoBarras.Text);
  item_por_codigo_barras(codigo_produto, codigo_cor, refcor, cor , tamanho, masculino_feminino, codigo_barras, acessorio);

  codigo_cor_pai := StrToIntDef(Campo_por_campo('CORES_FILHAS','CODIGO_COR_PAI', 'CODIGO_COR_FILHA', IntToStr(codigo_cor)),0);

  { se a referencia foi encontrada }
  if (cdsItens.Locate('codpro;codcor',VarArrayOf([codigo_produto, codigo_cor]),[]))
    then
       { e se ainda não foi totalmente conferida = "achou_especifico (ou seja, encontrou um produto não genérico, referente a cor/tamanho do cod bar)"}
       if ( cdsItens.FieldByName('QTD_'+tamanho).AsString <> '' ) and not (cdsItensCONFERIDO.AsString = 'S') then
          achou_especifico := 1;

  {se não achou produto com a cor legítima ou encontrou mas não tem o tamanho disponível para baixar, entra em busca de um produto com cor genérica}
  if (achou_especifico = 0) or ((achou_especifico in [1]) and (cdsitens.FieldByName('QTD_'+tamanho).AsInteger = 0)) then begin
    if ( cdsItens.Locate('codpro;COR',VarArrayOf([codigo_produto, masculino_feminino]),[]) or
         cdsItens.Locate('codpro;codCor',VarArrayOf([codigo_produto, codigo_cor_pai]),[]) ) and not acessorio then
      produtoComCorGenerica   := true
    else if cdsItens.Locate('codpro;codcor',VarArrayOf([codigo_produto, codigo_cor]),[])  then begin
      if cdsitens.FieldByName('QTD_'+tamanho).AsString <> '' then
         achou_especifico := 2;
    end;
  end;
                       {achou_especifico = 0 - nao achou especifico (pode ter generico)
                                           1 - achou especifico (pode ter generico)
                                           2 - achou especifico porem nao tem qtd do tamanho }

  if ((produtoComCorGenerica or (achou_especifico in [1])) and (cdsitens.FieldByName('QTD_'+tamanho).AsInteger = 0)) or not produtoComCorGenerica then

     if (acessorio) and (achou_especifico in[0,2]) then begin

        achou_especifico := 2;
        cdsItens.IndexFieldNames := 'CodPro';

        if ( cdsItens.Locate('codpro',VarArrayOf([codigo_produto]),[])) then
          while (cdsitens.FieldByName('QTD_'+tamanho).AsInteger = 0) or not corGenerica(cdsitens.FieldByName('COr').AsString) do begin
            cdsItens.Next;

            if not (cdsItensCodPro.AsInteger = codigo_produto) or (cdsItens.Eof) then begin
              achou_especifico := 0;
              break;
            end;
          end;


     end;

  conferido := 'N';

  if ( codigo_produto > 0 ) and ( ( achou_especifico in [1,2] ) or ( produtoComCorGenerica   ) ) then begin

    if cdsitens.FieldByName('QTD_'+tamanho).AsInteger = 0 then begin
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


   if cdsitens.FieldByName('QTD_'+tamanho).AsInteger > 0 then begin
        { **** Atualiza o respectivo tamanho **** }

      if (produtoComCorGenerica) or (acessorio and (achou_especifico = 2)) then
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
      end;

      cdsItensConferidos.Edit;
      cdsItensConferidos.FieldByName('QTD_'+tamanho).AsInteger      := cdsItensConferidos.FieldByName('QTD_'+tamanho).AsInteger + quantidade;
      cdsItensConferidos.FieldByName('QTD_'+tamanho+'_O').AsInteger := cdsItens.FieldByName('QTD_'+tamanho+'_O').AsInteger;
      cdsItensConferidos.Post;

      cdsItens.Edit;
      cdsItens.FieldByName('QTD_'+tamanho).AsInteger := cdsItens.FieldByName('QTD_'+tamanho).AsInteger - quantidade;
      cdsItens.Post;

      btnConfParcial.Enabled     := false;
      SubstituirProduto1.Visible := false;
      btnSubstitui.Enabled       := false;

   end;

    linha_item_conferido := cdsItens.RecNo;
    cdsItensConferidos.IndexFieldNames := 'CODIGO_ITEM';
  end
  else begin
    EmiteSomErro;
    avisar('Produto não consta no pedido, ou inexistente',0,'S', 1);
  end;

  cdsItens.DisableControls;
  cdsItens.AfterScroll := nil;

  calcula_percentagem_conferida;

  cdsItens.EnableControls;
  cdsItens.AfterScroll := cdsItensAfterScroll;

  if linha_item_conferido > 0 then
    cdsItens.RecNo := linha_item_conferido;
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
   if not assigned(self.BuscaPedido1.Ped) then EXIT;
   if not ((cdsItensConferidos.Active) or (cdsItensConferidos.IsEmpty)) and not(FVisualizarConferencia) then begin
     avisar('Não é possível salvar conferência, pois nenhum item foi conferido.');
     Exit;
   end;

   pnlBotoes.Enabled := false;
   Aguarda('Salvando Conferência...');
   if Salvar_conferencia then begin
     avisar('Conferencia salva com sucesso');

     if chManterConferencia.Checked then
       reinicia_pedido
     else
       self.btnCancelar.Click;
   end;

 finally
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
begin
  repositorio        := nil;
  ConferenciaPedido  := nil;
 // Especificacao      := nil;
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
     ConferenciaItem.QTD_UNICA          := cdsItensConferidosQTD_UNICA.AsInteger;


     ConferenciaPedido.Itens.Add( ConferenciaItem );

     cdsItensConferidos.next;
   end;


   repositorio.Salvar( ConferenciaPedido );

   {if (cdsSubstitutos.Active) and not (cdsSubstitutos.IsEmpty) then
     substitui_produto_generico;}

   if labelQtdePecas.Caption = labelQtdePecasConferidos.Caption then atualiza_estoque( BuscaPedido1.Ped.codigo, -1);

   result := true;

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

  habilita_desabilita_caixas(false);

  gridItens.columns[31].Visible := false;

  if cdsCaixas.Active         then  cdsCaixas.EmptyDataSet;
  if cdsSubstitutos.Active    then  cdsSubstitutos.EmptyDataSet;

  chkTodos.Enabled := false;
  chkConferidos.Enabled := false;
  chkNaoConferidos.Enabled := false;
  chkTodos.Checked := true;
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

procedure TfrmConferenciaPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if assigned(BuscaPedido1.Ped) then begin
    if not confirma('Conferência em andamento, deseja sair sem salvar a operação?') then
      abort;

  end;    

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
     ['QTD_RN','QTD_P','QTD_M','QTD_G','QTD_1','QTD_2','QTD_3','QTD_4','QTD_6','QTD_8','QTD_UNICA']) >= 0 then
     TDBGridCBN(Sender).Canvas.Font.Color  := IfThen( ((TDBGridCbn(Sender).DataSource.DataSet).FieldByName(Column.FieldName).AsInteger = 0) and
                                                      ((TDBGridCbn(Sender).DataSource.DataSet).FieldByName(Column.FieldName+'_O').AsInteger = 0), $009E6C3A, clwhite);
    if AnsiIndexStr(Column.FieldName,
     ['QTD_RN_O','QTD_P_O','QTD_M_O','QTD_G_O','QTD_1_O','QTD_2_O','QTD_3_O','QTD_4_O','QTD_6_O','QTD_8_O','QTD_UNICA_O']) >= 0 then
     TDBGridCBN(Sender).Canvas.Font.Color  := IfThen( (TDBGridCbn(Sender).DataSource.DataSet).FieldByName(Column.FieldName).AsInteger = 0, $009E6C3A, clwhite);


  end
  else if (Column.Field <> cdsItensNUM_CAIXA) and
          (trim(cbCaixas.Items[ cbCaixas.itemIndex ]) <> '' ) and
          (cdsItensNUM_CAIXA.AsInteger = strToInt(trim(cbCaixas.Items[ cbCaixas.itemIndex ]))) then begin
    TDBGridCBN(Sender).Canvas.Font.Color  := clblack;
    TDBGridCBN(Sender).Canvas.Brush.Color := $000080FF;
  end
  else if AnsiIndexStr(Column.FieldName,
  ['QTD_RN','QTD_P','QTD_M','QTD_G','QTD_1','QTD_2','QTD_3','QTD_4','QTD_6','QTD_8','QTD_UNICA']) >= 0 then begin

    TDBGridCBN(Sender).Canvas.Font.Color  := IfThen( ((TDBGridCbn(Sender).DataSource.DataSet).FieldByName(Column.FieldName).AsInteger = 0) and
                                                     ((TDBGridCbn(Sender).DataSource.DataSet).FieldByName(Column.FieldName+'_O').AsInteger = 0), $00D6DACF, clGreen);
    TDBGridCBN(Sender).Canvas.Font.Style  := [fsBold];
    TDBGridCBN(Sender).Canvas.Font.Name   := 'Arial';
    TDBGridCBN(Sender).Canvas.Font.Size   := 11;
    TDBGridCBN(Sender).Canvas.Brush.Color := $00D6DACF;
  end
  else if AnsiIndexStr(Column.FieldName,
  ['QTD_RN_O','QTD_P_O','QTD_M_O','QTD_G_O','QTD_1_O','QTD_2_O','QTD_3_O','QTD_4_O','QTD_6_O','QTD_8_O','QTD_UNICA_O']) >= 0 then begin
    Column.Title.Font.Color := clBtnFace;

    TDBGridCBN(Sender).Canvas.Font.Color  := IfThen( (TDBGridCbn(Sender).DataSource.DataSet).FieldByName(Column.FieldName).AsInteger > 0, clGray, clwhite);
    TDBGridCBN(Sender).Canvas.Font.Style  := [fsBold];
    TDBGridCBN(Sender).Canvas.Font.name   := 'Arial';
    TDBGridCBN(Sender).Canvas.Font.Size   := 11;
    TDBGridCBN(Sender).Canvas.Brush.Color := clwhite;
  end
  else if TDBGridCBN(Sender).Fields[1].asString = 'S' then begin {se campo conferido = S}
    TDBGridCBN(Sender).Canvas.Brush.Color := $0086B98B;
    TDBGridCBN(Sender).Canvas.FillRect(Rect);
    TDBGridCBN(Sender).DefaultDrawDataCell(Rect, TDBGridCBN(Sender).columns[datacol].field, State);
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

procedure TfrmConferenciaPedido.item_por_codigo_barras(var codigo_produto, codigo_cor :integer; var refcor, cor, tamanho :String;
 var masculino_feminino, cod_bar :String; var acessorio :Boolean);
begin
  codigo_produto := 0;
  codigo_cor     := 0;

  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := ' select cb.codproduto, cb.codcor, cor.referencia, cor.descricao cor, tam.descricao tamanho, '+
                              ' iif(pc.genero = ''M'',''MASCULINO'',                                                       '+
                              '      iif(pc.genero = ''F'', ''FEMININO'','''')) GENERO, tp.descricao tipo                  '+
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
  refcor              := fdm.qryGenerica.fieldByName('referencia').AsString;
  cor                 := fdm.qryGenerica.fieldByName('cor').AsString;
  tamanho             := fdm.qryGenerica.fieldByName('tamanho').AsString;
  masculino_feminino  := fdm.qryGenerica.fieldByName('genero').AsString;
  acessorio           := (fdm.qryGenerica.fieldByName('tipo').AsString = 'ACESSORIO');

end;

function TfrmConferenciaPedido.verifica_esta_conferido: String;
begin
  Result := 'N';

  if (( cdsItensQTD_RN.AsInteger ) +
     ( cdsItensQTD_P.AsInteger ) +
     ( cdsItensQTD_M.AsInteger ) +
     ( cdsItensQTD_G.AsInteger ) +
     ( cdsItensQTD_1.AsInteger ) +
     ( cdsItensQTD_2.AsInteger ) +
     ( cdsItensQTD_3.AsInteger ) +
     ( cdsItensQTD_4.AsInteger ) +
     ( cdsItensQTD_6.AsInteger ) +
     ( cdsItensQTD_8.AsInteger ) +
     ( cdsItensQTD_UNICA.AsInteger )) = 1 then  Result := 'S';
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
 if btnFecharCaixa.Enabled then
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
  try

    repositorio := TFabricaRepositorio.GetRepositorio( TPedido.ClassName );
    Pedido      := TPedido( repositorio.Get( BuscaPedido1.Ped.Codigo ) );

    if Pedido.cod_pedido_matriz = 0 then
      Pedido.cod_pedido_matriz := BuscaPedido1.codigo;
      
    Pedido.Itens.Clear;

    itens_deletar  := '';
    total          := 0;
    desconto_itens := 0;

    { Adiciona itens conferidos para alterar o pedido ja criado }
    for i := 0 to BuscaPedido1.Ped.Itens.Count - 1 do begin

      codItem := (BuscaPedido1.Ped.Itens[i] as TItem).codigo;

      if  ( cdsItens.Locate('CODIGO', codItem, [] ) ) and ( cdsItensCONFERIDO.AsString = 'S') then begin

        Pedido.Itens.Add( (BuscaPedido1.Ped.Itens[i] as TItem) );
        total          := total + (BuscaPedido1.Ped.Itens[i] as TItem).valor_total;
        desconto_itens := desconto_itens + (BuscaPedido1.Ped.Itens[i] as TItem).desconto;
        existe_grade_fechada := true;
      end
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
    atualiza_estoque( Pedido.Codigo, -1);

    avisar('Conferência parcial do pedido Nº '+BuscaPedido1.Ped.numpedido+' realizada com sucesso.'+#13#10+#13#10+
           'Pedido Nº '+pedidoNovo.numpedido+' gerado para o restante do pedido.');

    btnCancelar.Click;

  Except
    on e : Exception do
     begin
       avisar(e.Message);
     end;
  end;

  finally
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
    or (cdsItensConferidosQTD_UNICA.AsInteger > 0) then begin

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
      Item.qtd_UNICA  := cdsItensConferidosQTD_UNICA.AsInteger;

                        { como o item.valor_total ja pega o total sem o desconto total, após isso se tem que tirar a diferença do
                        desconto referente apenas a quantidade real de pessas do item que sera adicionado }
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
  or (cdsItensConferidosQTD_UNICA.AsInteger > 0) then begin

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

procedure TfrmConferenciaPedido.armazena_substituto(codigo_item,
  codigo_cor, quantidade: integer; tamanho, GENERO: String);
begin
  if not cdsSubstitutos.Active then cdsSubstitutos.CreateDataSet;

  if cdsSubstitutos.Locate('CODIGO_ITEM;CODIGO_COR',VarArrayOf([codigo_item, codigo_cor]), []) then begin
    cdsSubstitutos.Edit;
    cdsSubstitutos.FieldByName('TAM_'+tamanho).AsInteger := cdsSubstitutos.fieldByName('TAM_'+tamanho).AsInteger + quantidade;
  end
  else begin
    cdsSubstitutos.Append;
    cdsSubstitutos.FieldByName('TAM_'+tamanho).AsInteger := quantidade;
    cdsSubstitutosCODIGO_ITEM.AsInteger                  := codigo_item;
    cdsSubstitutosCODIGO_COR.AsInteger                   := codigo_cor;
    cdsSubstitutosGENERO.asString                        := genero;
    cdsSubstitutosNUMERO_CAIXA.AsString                  := cbCaixas.Text;
  end;

  cdsSubstitutosQTD_TOTAL.AsFloat := cdsSubstitutosQTD_TOTAL.AsFloat + quantidade;
  cdsSubstitutos.Post;
end;

procedure TfrmConferenciaPedido.substitui_produto_generico;
var Item :TItem;
    i, x, codigo_item_generico, codigo_item_adicionadoAlterado :Integer;
    itens_deletar, conferencia_itens_deletar :String;
    total_itens, perc_equivalente, valor_equivalente :Real;
    Repositorio            : TRepositorio;
    repositorioConferencia : TRepositorio;
    repositorioItem        : TRepositorio;
    Especificacao          : TEspecificacao;
    ConferenciaPedido      : TConferenciaPedido;
    ConferenciaItem        : TConferenciaItem;
    AtualizouItens         :boolean;
    TotalItens :Integer;
label
  Inicio;
begin
  Repositorio       := nil;
  repositorioConferencia := nil;
  repositorioItem   := nil;
  Especificacao     := nil;
  itens_deletar     := '';

  repositorioConferencia := TFabricaRepositorio.GetRepositorio(TConferenciaPedido.ClassName);
  ConferenciaPedido      := TConferenciaPedido.Create( BuscaPedido1.Ped.Codigo );

  TotalItens := BuscaPedido1.Ped.Itens.Count;

  for i := 0 to TotalItens - 1 do begin

    codigo_item_generico := TItem(BuscaPedido1.Ped.Itens[i]).codigo;
    AtualizouItens       := false;

    Inicio:

    if cdsSubstitutos.Locate('CODIGO_ITEM', codigo_item_generico, []) then begin

      total_itens := (BuscaPedido1.Ped.Itens[i] as TItem).qtd_total;

      { remove/atualiza do/no item generico, a quantidade e valores, agora sem a parte correspondente do item substituto da vez }
      (BuscaPedido1.Ped.Itens[i] as TItem).qtd_RN    := (BuscaPedido1.Ped.Itens[i] as TItem).qtd_RN    - cdsSubstitutosTAM_RN.AsInteger;
      (BuscaPedido1.Ped.Itens[i] as TItem).qtd_P     := (BuscaPedido1.Ped.Itens[i] as TItem).qtd_P     - cdsSubstitutosTAM_P.AsInteger;
      (BuscaPedido1.Ped.Itens[i] as TItem).qtd_M     := (BuscaPedido1.Ped.Itens[i] as TItem).qtd_M     - cdsSubstitutosTAM_M.AsInteger;
      (BuscaPedido1.Ped.Itens[i] as TItem).qtd_G     := (BuscaPedido1.Ped.Itens[i] as TItem).qtd_G     - cdsSubstitutosTAM_G.AsInteger;
      (BuscaPedido1.Ped.Itens[i] as TItem).qtd_1     := (BuscaPedido1.Ped.Itens[i] as TItem).qtd_1     - cdsSubstitutosTAM_1.AsInteger;
      (BuscaPedido1.Ped.Itens[i] as TItem).qtd_2     := (BuscaPedido1.Ped.Itens[i] as TItem).qtd_2     - cdsSubstitutosTAM_2.AsInteger;
      (BuscaPedido1.Ped.Itens[i] as TItem).qtd_3     := (BuscaPedido1.Ped.Itens[i] as TItem).qtd_3     - cdsSubstitutosTAM_3.AsInteger;
      (BuscaPedido1.Ped.Itens[i] as TItem).qtd_4     := (BuscaPedido1.Ped.Itens[i] as TItem).qtd_4     - cdsSubstitutosTAM_4.AsInteger;
      (BuscaPedido1.Ped.Itens[i] as TItem).qtd_6     := (BuscaPedido1.Ped.Itens[i] as TItem).qtd_6     - cdsSubstitutosTAM_6.AsInteger;
      (BuscaPedido1.Ped.Itens[i] as TItem).qtd_8     := (BuscaPedido1.Ped.Itens[i] as TItem).qtd_8     - cdsSubstitutosTAM_8.AsInteger;
      (BuscaPedido1.Ped.Itens[i] as TItem).qtd_UNICA := (BuscaPedido1.Ped.Itens[i] as TItem).qtd_UNICA - cdsSubstitutosTAM_UNICA.AsInteger;

      perc_equivalente  := ( cdsSubstitutosQTD_TOTAL.AsFloat * 100 ) / total_itens;
      valor_equivalente := (perc_equivalente * (BuscaPedido1.Ped.Itens[i] as TItem).desconto)/100;

      (BuscaPedido1.Ped.Itens[i] as TItem).desconto  := (BuscaPedido1.Ped.Itens[i] as TItem).desconto - valor_equivalente;



      Repositorio   := TFabricaRepositorio.GetRepositorio(TItem.ClassName);
      Especificacao := TEspecificacaoItemPorPedidoProdutoCor.Create( (BuscaPedido1.Ped.Itens[i] as TItem).cod_pedido,
                                                                     (BuscaPedido1.Ped.Itens[i] as TItem).cod_produto,
                                                                      cdsSubstitutosCODIGO_COR.AsInteger );
      Application.ProcessMessages;
      Item          := TItem( Repositorio.GetPorEspecificacao(especificacao, IntToStr(BuscaPedido1.Ped.Codigo)) );

      FreeAndNil(Especificacao);

      { cria-se o item que esta substituindo o generico (MASCULINO ou FEMININO) }

      if not assigned(Item) then Item := TItem.Create;

      Item.cod_pedido     := (BuscaPedido1.Ped.Itens[i] as TItem).cod_pedido;
      Item.cod_produto    := (BuscaPedido1.Ped.Itens[i] as TItem).cod_produto;
      Item.cod_cor        := cdsSubstitutosCODIGO_COR.AsInteger;
      Item.preco          := (BuscaPedido1.Ped.Itens[i] as TItem).preco;
      Item.desconto       := Item.desconto + valor_equivalente;
      Item.ref_prod       := (BuscaPedido1.Ped.Itens[i] as TItem).ref_prod;
      Item.ref_cor        := (BuscaPedido1.Ped.Itens[i] as TItem).ref_cor;
      Item.qtd_RN         := Item.qtd_RN    + cdsSubstitutosTAM_RN.AsInteger;
      Item.qtd_P          := Item.qtd_P     + cdsSubstitutosTAM_P.AsInteger;
      Item.qtd_M          := Item.qtd_M     + cdsSubstitutosTAM_M.AsInteger;
      Item.qtd_G          := Item.qtd_G     + cdsSubstitutosTAM_G.AsInteger;
      Item.qtd_1          := Item.qtd_1     + cdsSubstitutosTAM_1.AsInteger;
      Item.qtd_2          := Item.qtd_2     + cdsSubstitutosTAM_2.AsInteger;
      Item.qtd_3          := Item.qtd_3     + cdsSubstitutosTAM_3.AsInteger;
      Item.qtd_4          := Item.qtd_4     + cdsSubstitutosTAM_4.AsInteger;
      Item.qtd_6          := Item.qtd_6     + cdsSubstitutosTAM_6.AsInteger;
      Item.qtd_8          := Item.qtd_8     + cdsSubstitutosTAM_8.AsInteger;
      Item.qtd_UNICA      := Item.qtd_UNICA + cdsSubstitutosTAM_UNICA.AsInteger;
      Item.qtd_total      := Item.qtd_total;
      Item.valor_total    := Item.valor_total;

   {   if (BuscaPedido1.Ped.Itens[i] as TItem).qtd_total = 0 then
        itens_deletar := itens_deletar + intToStr((BuscaPedido1.Ped.Itens[i] as TItem).Codigo )+','; }

      codigo_item_adicionadoAlterado := Item.codigo;

      BuscaPedido1.Ped.Itens.Add( Item ); { Adiciona o novo item ao pedido, ou altera um ja criado }
      { bug_140: http://homegentoo.no-ip.org/bugzilla/show_bug.cgi?id=140
        Como estava removendo o item da lista e está ocorrendo a iteração nessa mesma lista, então acontecia erro de pegar índice errado da lista }
      BuscaPedido1.Ped.salvarSemDeletar;
      BuscaPedido1.Ped.Itens.Free;
      Buscapedido1.Ped.Itens := nil;

      repositorioItem := TFabricaRepositorio.GetRepositorio( TConferenciaItem.ClassName );

      if codigo_item_adicionadoAlterado <= 0 then begin
        ConferenciaItem := TConferenciaItem.Create;
        ConferenciaItem.codigo_conferencia := ConferenciaPedido.codigo;
        ConferenciaItem.codigo_item        := strToInt(Maior_Valor_Cadastrado('Itens', 'Codigo'));
        ConferenciaItem.QTD_RN             := cdsSubstitutosTAM_RN.AsInteger;
        ConferenciaItem.QTD_P              := cdsSubstitutosTAM_P.AsInteger;
        ConferenciaItem.QTD_M              := cdsSubstitutosTAM_M.AsInteger;
        ConferenciaItem.QTD_G              := cdsSubstitutosTAM_G.AsInteger;
        ConferenciaItem.QTD_1              := cdsSubstitutosTAM_1.AsInteger;
        ConferenciaItem.QTD_2              := cdsSubstitutosTAM_2.AsInteger;
        ConferenciaItem.QTD_3              := cdsSubstitutosTAM_3.AsInteger;
        ConferenciaItem.QTD_4              := cdsSubstitutosTAM_4.AsInteger;
        ConferenciaItem.QTD_6              := cdsSubstitutosTAM_6.AsInteger;
        ConferenciaItem.QTD_8              := cdsSubstitutosTAM_8.AsInteger;
        ConferenciaItem.QTD_UNICA          := cdsSubstitutosTAM_UNICA.AsInteger;

        ConferenciaPedido.Itens.Add( ConferenciaItem );
      end;


      for x := 0 to ConferenciaPedido.Itens.Count - 1 do begin

        if (codigo_item_adicionadoAlterado > 0) and ((ConferenciaPedido.Itens[x] as TConferenciaItem).codigo_item = codigo_item_adicionadoAlterado) then
          AtualizaValoresConferenciaItem((ConferenciaPedido.Itens[x] as TConferenciaItem),
                                          cdsSubstitutosTAM_RN.AsInteger, cdsSubstitutosTAM_P.AsInteger, cdsSubstitutosTAM_M.AsInteger,
                                          cdsSubstitutosTAM_G.AsInteger, cdsSubstitutosTAM_1.AsInteger, cdsSubstitutosTAM_2.AsInteger,
                                          cdsSubstitutosTAM_3.AsInteger, cdsSubstitutosTAM_4.AsInteger, cdsSubstitutosTAM_6.AsInteger,
                                          cdsSubstitutosTAM_8.AsInteger, cdsSubstitutosTAM_unica.AsInteger);

        if codigo_item_generico = (ConferenciaPedido.Itens[x] as TConferenciaItem).codigo_item then
          AtualizaValoresConferenciaItem((ConferenciaPedido.Itens[x] as TConferenciaItem),
                                         -cdsSubstitutosTAM_RN.AsInteger, -cdsSubstitutosTAM_P.AsInteger, -cdsSubstitutosTAM_M.AsInteger,
                                         -cdsSubstitutosTAM_G.AsInteger, -cdsSubstitutosTAM_1.AsInteger, -cdsSubstitutosTAM_2.AsInteger,
                                         -cdsSubstitutosTAM_3.AsInteger, -cdsSubstitutosTAM_4.AsInteger, -cdsSubstitutosTAM_6.AsInteger,
                                         -cdsSubstitutosTAM_8.AsInteger, -cdsSubstitutosTAM_unica.AsInteger);

          if ((ConferenciaPedido.Itens[x] as TConferenciaItem).QTD_TOTAL = 0)or
              (codigo_item_generico = (ConferenciaPedido.Itens[x] as TConferenciaItem).codigo_item) then
            conferencia_itens_deletar := conferencia_itens_deletar + intToStr( (ConferenciaPedido.Itens[x] as TConferenciaItem).Codigo )+',';
     end;

     AtualizouItens := true;
     cdsSubstitutos.Delete;

     {Retorna ao inicio, para caso tiver mais um do mesmo produto com otra cor, substituir sua parte no generico tbm }
     GOTO Inicio;
    end;

{   if AtualizouItens then
     BuscaPedido1.Ped.salvar;}

  end;//fim do FOR

  { bug_140: http://homegentoo.no-ip.org/bugzilla/show_bug.cgi?id=140 }
  BuscaPedido1.Ped.Salvar;
  ConferenciaPedido.RemoverItensZerados;
  { bug_140: http://homegentoo.no-ip.org/bugzilla/show_bug.cgi?id=140 }

  repositorioConferencia.Salvar( ConferenciaPedido );

 // if itens_deletar <> '' then  deleta_itens( itens_deletar );
 // if conferencia_itens_deletar <> '' then  deleta_conferencia_itens(conferencia_itens_deletar);

  cdsSubstitutos.EmptyDataSet;
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

procedure TfrmConferenciaPedido.AtualizaValoresConferenciaItem(
  Item: TConferenciaItem; Q_RN, Q_P, Q_M, Q_G, Q_1, Q_2, Q_3, Q_4, Q_6, Q_8, Q_unica :integer);
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
            (cdsItensQTD_UNICA.AsInteger = 0);
end;

procedure TfrmConferenciaPedido.SalvarAtualizar_caixas;
var repositorio        :TRepositorio;
    Caixas             :TCaixas;
    codigo_caixa       :integer;
    codigo_conferencia :integer;
begin
  repositorio := nil;

 try
 try
   repositorio        := TFabricaRepositorio.GetRepositorio(TCaixas.ClassName);
   codigo_conferencia := self.BuscaPedido1.Ped.Conferencia.codigo;

   cdsItens.DisableControls;
   cdsItens.AfterScroll := nil;
   cdsItens.First;
   while not cdsItens.Eof do begin

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
       caixas.qtd_UNICA          := caixas.qtd_UNICA + cdsItensQTD_UNICA_O.AsInteger;

       repositorio.Salvar(Caixas);
       FreeAndNil(Caixas);

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
  if (cdsItensCONFERIDO.AsString = 'S') or ( AnsiMatchStr(cdsItensCor.AsString, ['MASCULINO', 'FEMININO']) and (TTipoProduto(cdsItensTIPO.AsInteger) = Acessorio))
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
    tamanho, M_F, refcor, cor :String;
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

    item_por_codigo_barras(cod_produto, cod_cor, refcor, cor, tamanho, M_F, cod_bar_substituto, acessorio);

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

        BuscaPedido1.Ped.Itens[i] :=  atualiza_qtd_item( (BuscaPedido1.Ped.Itens[i] as TItem), tamanho_substituido,
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

   { if codigo_item_deletar > 0 then
      remove_item(codigo_item_deletar);}

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

procedure TfrmConferenciaPedido.atualiza_estoque(codigo_pedido :integer; operacao :integer);
begin
  dm.qryGenerica.Close;
  dm.qryGenerica.SQL.Text := 'execute procedure baixa_pedido_estoque('+intToStr(codigo_pedido)+', :multiplicador)';
  // multiplicador determina se os itens conferidos dão baixa no estoque (-1), ou se retornam pro estoque (+1)
  dm.qryGenerica.ParamByName('multiplicador').AsInteger := -1;
  dm.qryGenerica.ExecSQL;
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
  btnNovaCaixa.Visible     := boleana;
  btnFecharCaixa.Visible   := boleana;
  btnCancelarCaixa.Visible := boleana;
  cbCaixas.Visible         := boleana;
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

procedure TfrmConferenciaPedido.BuscaPedido1Enter(Sender: TObject);
begin
  inherited;
  BuscaPedido1.FrameEnter(Sender);

end;

procedure TfrmConferenciaPedido.mostra_estoque;
var codigo_produto :String;
begin
  if cdsItens.IsEmpty then Exit;

  codigo_produto := verificaSeEKit(cdsItensCodPro.AsInteger);

  busca_estoque_reservado(codigo_produto, cdsItensCodCor.AsInteger);

  edtRN.Value    := busca_estoque(codigo_produto, cdsItensCodCor.AsInteger, 'RN') -
                    dm.qryGenerica2.fieldByName('QTD_RN').AsInteger;
  edtP.Value     := busca_estoque(codigo_produto, cdsItensCodCor.AsInteger, 'P') -
                    dm.qryGenerica2.fieldByName('QTD_P').AsInteger;
  edtM.Value     := busca_estoque(codigo_produto, cdsItensCodCor.AsInteger, 'M') -
                    dm.qryGenerica2.fieldByName('QTD_M').AsInteger;
  edtG.Value     := busca_estoque(codigo_produto, cdsItensCodCor.AsInteger, 'G') -
                    dm.qryGenerica2.fieldByName('QTD_G').AsInteger;
  edt1.Value     := busca_estoque(codigo_produto, cdsItensCodCor.AsInteger, '1') -
                    dm.qryGenerica2.fieldByName('QTD_1').AsInteger;
  edt2.Value     := busca_estoque(codigo_produto, cdsItensCodCor.AsInteger, '2') -
                    dm.qryGenerica2.fieldByName('QTD_2').AsInteger;
  edt3.Value     := busca_estoque(codigo_produto, cdsItensCodCor.AsInteger, '3') -
                    dm.qryGenerica2.fieldByName('QTD_3').AsInteger;
  edt4.Value     := busca_estoque(codigo_produto, cdsItensCodCor.AsInteger, '4') -
                    dm.qryGenerica2.fieldByName('QTD_4').AsInteger;
  edt6.Value     := busca_estoque(codigo_produto, cdsItensCodCor.AsInteger, '6') -
                    dm.qryGenerica2.fieldByName('QTD_6').AsInteger;
  edt8.Value     := busca_estoque(codigo_produto, cdsItensCodCor.AsInteger, '8') -
                    dm.qryGenerica2.fieldByName('QTD_8').AsInteger;
  edtUNICA.Value := busca_estoque(codigo_produto, cdsItensCodCor.AsInteger, 'UNICA') -
                    dm.qryGenerica2.fieldByName('QTD_UNICA').AsInteger;

end;

function TfrmConferenciaPedido.busca_estoque(codproduto :String; codcor: integer; Tamanho:String): Real;
var
  i :integer;
begin
  result         := 0;
  i              := 0;

    if pos(',',codproduto) = 0 then
      if ( Campo_por_campo('PRODUTOS','COD_TIPO','CODIGO',codproduto) = '2' )
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
var codigo_produto :String;
begin
  if not assigned(BuscaPedido1.Ped) then exit;

  frmVisualizacaoPedidoSeparacao := TfrmVisualizacaoPedidoSeparacao.Create(self);

 try
 try
   Aguarda('Aguarde, gerando relatório...');

   if not gridItens.columns[31].Visible then
   begin
     cdsItens.AfterScroll := nil;
     cdsItens.DisableControls;
     cdsitens.First;
     while not cdsItens.Eof do begin
       codigo_produto := verificaSeEKit(cdsItensCODPRO.AsInteger);

       busca_estoque_reservado(codigo_produto, cdsItensCODCOR.AsInteger);
       calcula_completo_imcompleto;

       cdsItens.Next;
       Application.ProcessMessages;
     end;
     cdsItens.EnableControls;
     cdsItens.AfterScroll := cdsItensAfterScroll;
     
     gridItens.columns[31].Visible := true;
   end;

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

   case AnsiIndexStr(UpperCase(tamanho), ['RN','P','M','G','1','2','3','4','6','8','UNICA']) of
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
    10: Item.qtd_UNICA := Item.qtd_UNICA + quantidade;
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

procedure TfrmConferenciaPedido.busca_estoque_reservado(codproduto :String; codcor: integer);
begin
  dm.qryGenerica2.Close;
  dm.qryGenerica2.SQL.Text := 'select sum(ci.qtd_rn) QTD_RN, sum(ci.qtd_p) QTD_P, sum(ci.qtd_m) QTD_M, sum(ci.qtd_g) QTD_G, '+
                              ' sum(ci.qtd_1) QTD_1, sum(ci.qtd_2) QTD_2, sum(ci.qtd_3) QTD_3, sum(ci.qtd_4) QTD_4,         '+
                              ' sum(ci.qtd_6) QTD_6, sum(ci.qtd_8) QTD_8, sum(ci.qtd_unica) QTD_unica                       '+
                              ' from ITENS i                                                                                '+
                              ' left join conferencia_itens  ci on ci.codigo_item = i.codigo                                '+
                              ' left join conferencia_pedido cp on cp.codigo = ci.codigo_conferencia                        '+
                              ' left join cores              cor on cor.codigo = i.cod_cor                                  '+
                              ' left join produtos           pro on pro.codigo = i.cod_produto                              '+

                              { < 01/01/1990 pois a data padrao do fb é 30/12/1899, significando conferencia em aberto }
                              ' where cp.fim < ''01.01.1900'' and i.cod_produto in (' + codproduto + ')' +
                                IfThen(codcor in [55,66],'','   and cor.codigo = ' + IntToStr(codcor)) +
                              { quando é 55 ou 66 significa cor generica, então soma-se o estoque das cores que se enquadram }

                              ' group by pro.referencia, cor.referencia                                                     '+
                              ' order by pro.referencia, cor.referencia                                                     ';

  dm.qryGenerica2.Open;
end;

procedure TfrmConferenciaPedido.btnExcluirClick(Sender: TObject);
var
  repositorio       :TRepositorio;
begin
  repositorio := nil;

  if (BuscaPedido1.pedido_faturado) or (BuscaPedido1.Ped.despachado = 'S') or not assigned(BuscaPedido1.Ped.Conferencia)
     or not confirma('Deseja realmente EXCLUIR a conferência atual?'+#13#10+
                     '(ao excluir a conferência, tudo o que foi conferido será zerado)') then
    exit;
  try
  try
    dm.conexao.TxOptions.AutoCommit := false;

    repositorio := TFabricaRepositorio.GetRepositorio(TConferenciaItem.ClassName);

    repositorio.RemoverPorIdentificador(BuscaPedido1.Ped.Conferencia.codigo);

    repositorio := TFabricaRepositorio.GetRepositorio(TCaixas.ClassName);

    repositorio.RemoverPorIdentificador(BuscaPedido1.Ped.Conferencia.codigo);

    repositorio := TFabricaRepositorio.GetRepositorio(TConferenciaPedido.ClassName);

    repositorio.RemoverPorIdentificador(BuscaPedido1.Ped.Conferencia.codigo);

    atualiza_estoque(BuscaPedido1.Ped.Codigo, 1);

    dm.conexao.Commit;

    avisar('Conferência escluida!', 5);
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
var Qtd_estoque :Real;
    i, linha :integer;
    tamanho :String;
const
    Tamanhos : array[1..11] of string=('QTD_RN','QTD_P','QTD_M','QTD_G','QTD_1','QTD_2','QTD_3','QTD_4','QTD_6','QTD_8','QTD_UNICA');
begin

    for i := 1 to 11 do begin

      tamanho := copy(cdsitens.FieldByName(Tamanhos[i]).FieldName, 5, 5);

      Qtd_estoque := busca_estoque(verificaSeEKit( cdsItensCODPRO.AsInteger), cdsItensCODCOR.AsInteger, tamanho);

      if cdsitens.FieldByName(Tamanhos[i]+'_O').AsInteger <= 0 then
        continue;

      linha := cdsItens.recno;
      cdsItens.Edit;
      cdsItensC_I.AsString   := IfThen((cdsitens.FieldByName(Tamanhos[i]).AsInteger > 0) and
                                       (cdsitens.FieldByName(Tamanhos[i]).AsInteger > (Qtd_estoque -
                                                                                       dm.qryGenerica2.FieldByName('QTD_'+tamanho).AsInteger) )
                                        , 'N', 'S');
      cdsItens.Append;
      cdsItens.recno := linha;

      if cdsItensC_I.AsString = 'N' then
        Break;

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
                                               or (FieldByName('QTD_8').AsInteger > 0) or (FieldByName('QTD_unica').AsInteger > 0), 'N', 'S');
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
begin
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TItem.ClassName);
    Item        := TItem( repositorio.Get(coditem) );

    if not assigned(Item) then
      Item := TItem.Create(false);

    Item.cod_pedido    := codpedido;
    Item.cod_produto   := codpro;
    Item.cod_cor       := codcor;
    Item.preco         := preco;

    case AnsiIndexStr(UpperCase(tamanho), ['RN','P','M','G','1','2','3','4','6','8','UNICA']) of
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
     10 : Item.qtd_UNICA := Item.qtd_UNICA + quantidade;
    end;

    Item.qtd_total   := Item.qtd_total;
    Item.valor_total := Item.valor_total;

    repositorio.Salvar(Item);

    result := Item.codigo;
  Finally
    FreeAndNil(repositorio);
    FreeAndNil(Item);
  end;
end;

procedure TfrmConferenciaPedido.atualiza_quantidade_item(coditem, quantidade: integer; tamanho :String; var excluiu :Boolean);
var repositorio :TRepositorio;
    Item        :TItem;
begin
  try
    excluiu     := false;
    repositorio := TFabricaRepositorio.GetRepositorio(TItem.ClassName);
    Item        := TItem( repositorio.Get(coditem) );

    case AnsiIndexStr(UpperCase(tamanho), ['RN','P','M','G','1','2','3','4','6','8','UNICA']) of
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
     10 : Item.qtd_UNICA := Item.qtd_UNICA - quantidade;
    end;

    if Item.qtd_total = 0 then
    begin
      repositorio.Remover(Item);
      excluiu := true;
    end
    else
      repositorio.Salvar(Item);

  Finally
    FreeAndNil(repositorio);
    FreeAndNil(Item);
  end;
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

function TfrmConferenciaPedido.verificaSeEKit(codigo_produto: integer): String;
var
  Produto       :TProduto;
  repositorio   :TRepositorio;
  i             :integer;
begin
  repositorio    := nil;
  Produto        := nil;

 try
    repositorio := TFabricaRepositorio.GetRepositorio(TProduto.ClassName);
    Produto     := TProduto(repositorio.Get(codigo_produto));

    if Assigned(Produto.ProdutosKit) and (Produto.ProdutosKit.Count > 0) then begin
      result := '';

      for i := 0 to Produto.ProdutosKit.Count - 1 do
        result := result +','+ IntToStr(TProdutosKit(Produto.ProdutosKit.Items[i]).codigo_produto);

      result := copy(result, 2, length(result));
    end
    else
      result := intToStr(codigo_produto);

 finally
   FreeAndNil(Produto);
   FreeAndNil(repositorio);
 end;
end;

end.




