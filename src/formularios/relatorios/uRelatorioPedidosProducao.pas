unit uRelatorioPedidosProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids,
  DBGridCBN, frameBuscaProduto, frameBuscaPedido, DB, DBClient,
  RLReport, pngimage, TipoBuscaPedido,
  RLFilters, Provider, frameBuscaCor, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmRelatorioPedidosProducao = class(TfrmPadrao)
    gbPeriodo: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    rgData: TRadioGroup;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    gridPedidos: TDBGridCBN;
    btnImprimir: TSpeedButton;
    btnAddPedido: TBitBtn;
    Label1: TLabel;
    cdsPedidos: TClientDataSet;
    dsPedidos: TDataSource;
    cdsReferencias: TClientDataSet;
    dsReferencias: TDataSource;
    cdsPedidosCODIGO: TIntegerField;
    cdsPedidosPEDIDO: TStringField;
    cdsReferenciasCODIGO: TIntegerField;
    cdsReferenciasREFERENCIA: TStringField;
    rgPedidos: TRadioGroup;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel2: TRLLabel;
    RLImage1: TRLImage;
    RLBand7: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    dsItens: TDataSource;
    RLLabel1: TRLLabel;
    cbPeriodo: TCheckBox;
    RLLabel4: TRLLabel;
    rlDtIni: TRLLabel;
    RlDtFim: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel5: TRLLabel;
    rlMemoPedidos: TRLMemo;
    RLLabel6: TRLLabel;
    RLBand3: TRLBand;
    rlMemoReferencias: TRLMemo;
    RLLabel13: TRLLabel;
    BuscaPedido1: TBuscaPedido;
    SpeedButton1: TSpeedButton;
    RLReport2: TRLReport;
    RLBand8: TRLBand;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLImage2: TRLImage;
    RLLabel16: TRLLabel;
    rlDtIni2: TRLLabel;
    rlDtFim2: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    rlMemoPedidos2: TRLMemo;
    RLLabel22: TRLLabel;
    RLBand10: TRLBand;
    RLLabel27: TRLLabel;
    RLBand14: TRLBand;
    rlMemoReferencias2: TRLMemo;
    RLLabel28: TRLLabel;
    rgTipo: TRadioGroup;
    Label3: TLabel;
    dsItens2: TDataSource;
    rlbGeral2: TRLLabel;
    rlbGeral: TRLLabel;
    RLGroup3: TRLGroup;
    RLBand9: TRLBand;
    RLDraw15: TRLDraw;
    RLDraw16: TRLDraw;
    RLDraw17: TRLDraw;
    RLDraw18: TRLDraw;
    RLDraw19: TRLDraw;
    RLDraw20: TRLDraw;
    RLLabel26: TRLLabel;
    RLGroup4: TRLGroup;
    RLGroup2: TRLGroup;
    RLBand2: TRLBand;
    RLDraw13: TRLDraw;
    RLDraw14: TRLDraw;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLBand5: TRLBand;
    RLDraw6: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw1: TRLDraw;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText17: TRLDBText;
    RLDraw2: TRLDraw;
    RLDBText3: TRLDBText;
    RLBand6: TRLBand;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLBand4: TRLBand;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLLabel10: TRLLabel;
    dspItens2: TDataSetProvider;
    cdsItens2: TClientDataSet;
    cdsItens2REFPRO: TStringField;
    cdsItens2PRODUTO: TStringField;
    cdsItens2REFCOR: TStringField;
    cdsItens2COR: TStringField;
    cdsItens2SALDO_RN: TLargeintField;
    cdsItens2SALDO_P: TLargeintField;
    cdsItens2SALDO_M: TLargeintField;
    cdsItens2SALDO_G: TLargeintField;
    cdsItens2SALDO_1: TLargeintField;
    cdsItens2SALDO_2: TLargeintField;
    cdsItens2SALDO_3: TLargeintField;
    cdsItens2SALDO_4: TLargeintField;
    cdsItens2SALDO_6: TLargeintField;
    cdsItens2SALDO_8: TLargeintField;
    cdsItens2SALDO_UNICA: TLargeintField;
    cdsItens2TOT_2: TFloatField;
    RLDBResult21: TRLDBResult;
    RLDBResult16: TRLDBResult;
    RLDBResult17: TRLDBResult;
    RLDBResult18: TRLDBResult;
    RLDBResult19: TRLDBResult;
    RLDBResult20: TRLDBResult;
    RLDBResult22: TRLDBResult;
    RLDBResult23: TRLDBResult;
    RLDBResult24: TRLDBResult;
    RLDBResult25: TRLDBResult;
    RLDBResult26: TRLDBResult;
    cdsItens2TOT_RN: TFloatField;
    cdsItens2TOT_P: TFloatField;
    cdsItens2TOT_M: TFloatField;
    cdsItens2TOT_G: TFloatField;
    cdsItens2TOT_1: TFloatField;
    cdsItens2TOT_3: TFloatField;
    cdsItens2TOT_4: TFloatField;
    cdsItens2TOT_6: TFloatField;
    cdsItens2TOT_8: TFloatField;
    cdsItens2TOT_UNICA: TFloatField;
    cdsCores: TClientDataSet;
    dsCores: TDataSource;
    cdsCoresCODIGO: TIntegerField;
    cdsCoresREFERENCIA: TStringField;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    gridReferencias: TDBGridCBN;
    BuscaProduto1: TBuscaProduto;
    btnAddReferencia: TBitBtn;
    rgReferencias: TRadioGroup;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    btnAddCor: TBitBtn;
    BuscaCor1: TBuscaCor;
    gridCores: TDBGridCBN;
    rgCores: TRadioGroup;
    rgAgrupamento: TRadioGroup;
    RLGroup1: TRLGroup;
    RLBand11: TRLBand;
    RLDraw21: TRLDraw;
    RLDraw22: TRLDraw;
    RLLabel24: TRLLabel;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLDBResult7: TRLDBResult;
    RLDBResult8: TRLDBResult;
    RLDBResult9: TRLDBResult;
    RLDBResult10: TRLDBResult;
    RLDBResult11: TRLDBResult;
    RLDBResult12: TRLDBResult;
    RLDBResult13: TRLDBResult;
    RLDBResult14: TRLDBResult;
    RLDBResult15: TRLDBResult;
    RLBand12: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText31: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLDBText27: TRLDBText;
    RLDBText28: TRLDBText;
    RLDBText29: TRLDBText;
    RLBand13: TRLBand;
    RLDBText33: TRLDBText;
    RLDBText34: TRLDBText;
    qryItens2: TFDQuery;
    qryItens: TFDQuery;
    qryItensREF_PRODUTO: TStringField;
    qryItensREF_COR: TStringField;
    qryItensQTD_RN: TLargeintField;
    qryItensQTD_P: TLargeintField;
    qryItensQTD_M: TLargeintField;
    qryItensQTD_G: TLargeintField;
    qryItensQTD_1: TLargeintField;
    qryItensQTD_2: TLargeintField;
    qryItensQTD_3: TLargeintField;
    qryItensQTD_4: TLargeintField;
    qryItensQTD_6: TLargeintField;
    qryItensQTD_8: TLargeintField;
    qryItensQTD_UNICA: TBCDField;
    qryItensQTD_TOTAL: TBCDField;
    qryItensPECAS: TBCDField;
    qryItensCOR: TStringField;
    qryItensPRODUTO: TStringField;
    qryItensPEDIDO: TStringField;
    RLDraw29: TRLDraw;
    RLDraw23: TRLDraw;
    RLDraw24: TRLDraw;
    RLDraw25: TRLDraw;
    RLDraw26: TRLDraw;
    RLDraw27: TRLDraw;
    RLDraw28: TRLDraw;
    RLDraw30: TRLDraw;
    RLDBText30: TRLDBText;
    RLDBText32: TRLDBText;
    RLDBText35: TRLDBText;
    cdsItens2SALDO_10: TLargeintField;
    cdsItens2SALDO_12: TLargeintField;
    cdsItens2SALDO_14: TLargeintField;
    qryItensQTD_10: TLargeintField;
    qryItensQTD_12: TLargeintField;
    qryItensQTD_14: TLargeintField;
    RLDBResult27: TRLDBResult;
    RLDBResult28: TRLDBResult;
    RLDBResult29: TRLDBResult;
    cdsItens2TOT_12: TFloatField;
    cdsItens2TOT_14: TFloatField;
    cdsItens2TOT_10: TFloatField;
    RLDBResult30: TRLDBResult;
    RLDBResult31: TRLDBResult;
    RLDBResult32: TRLDBResult;
    RLDraw31: TRLDraw;
    RLDraw32: TRLDraw;
    RLDBText36: TRLDBText;
    RLDBText37: TRLDBText;
    RLDBText38: TRLDBText;
    RLDraw33: TRLDraw;
    RLLabel19: TRLLabel;
    RLSystemInfo5: TRLSystemInfo;
    RLSystemInfo6: TRLSystemInfo;
    RLSystemInfo8: TRLSystemInfo;
    RLLabel25: TRLLabel;
    RLLabel29: TRLLabel;
    RLDraw34: TRLDraw;
    RLLabel30: TRLLabel;
    RLSystemInfo9: TRLSystemInfo;
    RLSystemInfo10: TRLSystemInfo;
    RLSystemInfo11: TRLSystemInfo;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    rgSetor: TRadioGroup;
    qryItensTOT_RN: TAggregateField;
    lbTotRn: TRLLabel;
    lbTotP: TRLLabel;
    lbTotM: TRLLabel;
    lbTotG: TRLLabel;
    lbTot1: TRLLabel;
    lbTot2: TRLLabel;
    lbTot3: TRLLabel;
    lbTot4: TRLLabel;
    lbTot6: TRLLabel;
    lbTot8: TRLLabel;
    lbTot10: TRLLabel;
    lbTot12: TRLLabel;
    lbTot14: TRLLabel;
    lbTotUnica: TRLLabel;
    qryItensTOT_P: TAggregateField;
    qryItensTOT_M: TAggregateField;
    qryItensTOT_G: TAggregateField;
    qryItensTOT_1: TAggregateField;
    qryItensTOT_2: TAggregateField;
    qryItensTOT_3: TAggregateField;
    qryItensTOT_4: TAggregateField;
    qryItensTOT_6: TAggregateField;
    qryItensTOT_8: TAggregateField;
    qryItensTOT_10: TAggregateField;
    qryItensTOT_12: TAggregateField;
    qryItensTOT_14: TAggregateField;
    qryItensTOT_UNICA: TAggregateField;
    lbTotGeralRN: TRLLabel;
    lbTotGeralP: TRLLabel;
    lbTotGeralM: TRLLabel;
    lbTotGeralG: TRLLabel;
    lbTotGeral1: TRLLabel;
    lbTotGeral2: TRLLabel;
    lbTotGeral3: TRLLabel;
    lbTotGeral4: TRLLabel;
    lbTotGeral6: TRLLabel;
    lbTotGeral8: TRLLabel;
    lbTotGeral10: TRLLabel;
    lbTotGeral12: TRLLabel;
    lbTotGeral14: TRLLabel;
    lbTotGeralUNICA: TRLLabel;
    RLLabel3: TRLLabel;
    RLDraw35: TRLDraw;
    RLLabel9: TRLLabel;
    RLLabel17: TRLLabel;
    procedure btnAddPedidoClick(Sender: TObject);
    procedure btnAddReferenciaClick(Sender: TObject);
    procedure gridPedidosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridReferenciasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure cbPeriodoClick(Sender: TObject);
    procedure BuscaPedido1edtNumPedidoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure btnAddPedidoEnter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RLReport2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand12BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand11BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rgPedidosClick(Sender: TObject);
    procedure rgReferenciasClick(Sender: TObject);
    procedure BuscaProduto1Exit(Sender: TObject);
    procedure BuscaPedido1btnBuscarClick(Sender: TObject);
    procedure cdsReferenciasAfterPost(DataSet: TDataSet);
    procedure cdsPedidosAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure cdsItens2CalcFields(DataSet: TDataSet);
    procedure btnAddCorClick(Sender: TObject);
    procedure gridCoresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscaCor1Exit(Sender: TObject);
    procedure cdsCoresAfterPost(DataSet: TDataSet);
    procedure rgCoresClick(Sender: TObject);
    procedure rgAgrupamentoClick(Sender: TObject);
    procedure RLBand2AfterPrint(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure lbTotRnBeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
    procedure RLBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FQtdTotRn    :Integer;
    FQtdTotP     :Integer;
    FQtdTotM     :Integer;
    FQtdTotG     :Integer;
    FQtdTot1     :Integer;
    FQtdTot2     :Integer;
    FQtdTot3     :Integer;
    FQtdTot4     :Integer;
    FQtdTot6     :Integer;
    FQtdTot8     :Integer;
    FQtdTot10    :Integer;
    FQtdTot12    :Integer;
    FQtdTot14    :Integer;
    FQtdTotUnica :Integer;

    FQtdTotGeralRn    :Integer;
    FQtdTotGeralP     :Integer;
    FQtdTotGeralM     :Integer;
    FQtdTotGeralG     :Integer;
    FQtdTotGeral1     :Integer;
    FQtdTotGeral2     :Integer;
    FQtdTotGeral3     :Integer;
    FQtdTotGeral4     :Integer;
    FQtdTotGeral6     :Integer;
    FQtdTotGeral8     :Integer;
    FQtdTotGeral10    :Integer;
    FQtdTotGeral12    :Integer;
    FQtdTotGeral14    :Integer;
    FQtdTotGeralUnica :Integer;

    procedure imprimir;
    procedure montaSQL;
    procedure montaSQLparaSaldo;
    procedure montaSQLparaNaoConferidos;
    procedure RemoveItensVazios;

    function dataBase :String;
    function pedidosSelecionados :String;
    function referenciasSelecionadas :String;
    function coresSelecionadas :String;
    function Faturado(codPedido :integer) :Boolean;
    function contem_referencias :Boolean;

    procedure zeraCamposTotais;
  public
    { Public declarations }
  end;

var
  frmRelatorioPedidosProducao: TfrmRelatorioPedidosProducao;

implementation

uses RxCurrEdit, StrUtils, uModulo;

{$R *.dfm}

procedure TfrmRelatorioPedidosProducao.btnAddPedidoClick(Sender: TObject);
begin
  try
  if not cdsPedidos.Active then  cdsPedidos.CreateDataSet;

  if assigned(BuscaPedido1.Ped) and not (cdsPedidos.Locate('PEDIDO', BuscaPedido1.edtNumPedido.Text, [])) then
  begin
    if not Faturado(BuscaPedido1.codigo) then begin
      if (rgReferencias.ItemIndex = 2) and not(cdsReferencias.IsEmpty) and not (contem_referencias) then
        raise Exception.Create('Pedido n�o cont�m refer�ncia(s) especificada(s)');

        cdsPedidos.Append;
        cdsPedidosCODIGO.AsInteger := BuscaPedido1.codigo;
        cdsPedidosPEDIDO.AsString  := BuscaPedido1.edtNumPedido.Text;
        cdsPedidos.Post;
    end;
  end;

  BuscaPedido1.limpa;
  BuscaPedido1.edtNumPedido.Clear;
  BuscaPedido1.SetFocus;
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmRelatorioPedidosProducao.btnAddReferenciaClick(
  Sender: TObject);
begin
  if not cdsReferencias.Active then  cdsReferencias.CreateDataSet;

  if (trim(BuscaProduto1.edtReferencia.Text) <> '') and not (cdsReferencias.Locate('REFERENCIA', BuscaProduto1.edtReferencia.Text, [])) then begin

    cdsReferencias.Append;
    cdsReferenciasCODIGO.AsString     := BuscaProduto1.codproduto;
    cdsReferenciasREFERENCIA.AsString := BuscaProduto1.edtReferencia.Text;
    cdsReferencias.Post;

  end;

  BuscaProduto1.limpa;
  BuscaProduto1.edtReferencia.SetFocus;
end;

procedure TfrmRelatorioPedidosProducao.gridPedidosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (cdsPedidos.Active) and not (cdsPedidos.IsEmpty) then begin

    if key = VK_Delete then
      cdsPedidos.Delete
    else if key = VK_F3 then
      cdsPedidos.EmptyDataSet;  

    if cdsPedidos.IsEmpty then
      rgPedidos.ItemIndex := 0;  
  end;
end;

procedure TfrmRelatorioPedidosProducao.gridReferenciasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (cdsReferencias.Active) and not (cdsReferencias.IsEmpty) then
  begin
    if key = VK_Delete then
      cdsReferencias.Delete
    else if key = VK_F3 then
      cdsReferencias.EmptyDataSet;

    if cdsReferencias.IsEmpty then
      rgReferencias.ItemIndex := 0;
  end;
end;

procedure TfrmRelatorioPedidosProducao.FormCreate(Sender: TObject);
begin
  inherited;
  dtpInicio.DateTime := strToDateTime( formatDateTime('dd/mm/yyyy 00:00:00', date) );
  dtpFim.DateTime    := strToDateTime( formatDateTime('dd/mm/yyyy 23:59:59', date) );
end;

procedure TfrmRelatorioPedidosProducao.btnImprimirClick(
  Sender: TObject);
begin
  try
    Aguarda('Gerando relat�rio...');
    Application.ProcessMessages;
    imprimir;
  Finally
    FimAguarda('');
  end;
end;

procedure TfrmRelatorioPedidosProducao.imprimir;
const
  NORMAL = 0; SALDO = 1; NAO_CONFERIDOS = 2;
begin
  if qryItens.active then
    qryItens.EmptyDataSet;

  cdsItens2.Close;

  if      (rgtipo.ItemIndex = NORMAL) then
    montaSQL
  else if (rgtipo.ItemIndex = SALDO)  then
    montaSQLparaSaldo
//    RemoveItensVazios;
  else if (rgtipo.ItemIndex = NAO_CONFERIDOS) then
    montaSQLparaNaoConferidos;

  if (qryItens.IsEmpty) and (cdsItens2.IsEmpty) then
    avisar('N�o foi encontrado nenhum registro com os filtros informados')
  else begin
    if rgtipo.ItemIndex = 0 then
      RLReport1.PreviewModal
    else
      RLReport2.PreviewModal;
  end;
end;

procedure TfrmRelatorioPedidosProducao.lbTotRnBeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  PrintIt := not Text.Equals('0');
end;

procedure TfrmRelatorioPedidosProducao.montaSQL;
var condicaoPeriodo, condicaoPedidos, condicao_ecommerce, condicaoReferencias, condicaoCores, pedidos, E, condicaoFaturado :String;
    qry :TFDquery;
begin
  try
    qry := dm.GetConsulta;

    if not cbPeriodo.Checked then
      condicaoPeriodo := ' and (ped.'+dataBase+' between :dti and :dtf) ';

    case rgSetor.ItemIndex of
      0 : condicao_ecommerce := ' AND ((DR.CODIGO IS NULL) or (DR.REP_ECOMMERCE <> ''S'')) ';
      1 : condicao_ecommerce := ' AND (not(DR.CODIGO IS NULL) and (DR.REP_ECOMMERCE = ''S'') )';
      2 : condicao_ecommerce := '';
    end;

    if (cdsPedidos.Active) and not (cdsPedidos.IsEmpty) then
    begin
      if rgPedidos.ItemIndex = 0 then
        condicaoPedidos := IfThen(cbPeriodo.Checked, '', ' or  i.cod_pedido in     ('+pedidosSelecionados+') ')
      else if rgPedidos.ItemIndex = 1 then
        condicaoPedidos := ' and i.cod_pedido not in ('+pedidosSelecionados+') '
      else if rgPedidos.ItemIndex = 2 then
        condicaoPedidos := ' and i.cod_pedido in     ('+pedidosSelecionados+') ';

   //   if condicaoPeriodo = '' then
   //     condicaoPedidos := copy(condicaoPedidos,5,length(condicaoPedidos));
    end;

    condicaoFaturado := ' and iif((not (PF.codigo is null) or (Ped.despachado = ''S'')), ''SIM'', ''N�O'') ';

    rlMemoReferencias.Lines.Clear;
    if (cdsReferencias.Active) and not (cdsReferencias.IsEmpty) then
    begin
      if rgReferencias.ItemIndex = 0 then
        condicaoReferencias := IfThen(cbPeriodo.Checked,'',' or  p.codigo in     ('+referenciasSelecionadas+') ')
      else if rgReferencias.ItemIndex = 1 then
        condicaoReferencias := ' and p.codigo not in ('+referenciasSelecionadas+') '
      else if rgReferencias.ItemIndex = 2 then
        condicaoReferencias := ' and p.codigo in     ('+referenciasSelecionadas+') ';

   //   if (condicaoPeriodo = '') and (condicaoPedidos = '') then
   //     condicaoReferencias := copy(condicaoReferencias,5,length(condicaoReferencias));
    end;

    if (cdsCores.Active) and not (cdsCores.IsEmpty) then
    begin
      if rgCores.ItemIndex = 0 then
        condicaoCores := IfThen(cbPeriodo.Checked,'',' or  c.codigo in     ('+coresSelecionadas+') ')
      else if rgCores.ItemIndex = 1 then
        condicaoCores := ' and c.codigo not in ('+coresSelecionadas+') '
      else if rgCores.ItemIndex = 2 then
        condicaoCores := ' and c.codigo in     ('+coresSelecionadas+') ';

    //  if (condicaoPeriodo = '') and (condicaoPedidos = '') and (condicaoReferencias = '')then
    //    condicaoCores := copy(condicaoCores,5,length(condicaoCores));
    end;

         if BuscaPedido1.rgTipoBusca.ItemIndex = 1 then   condicaofaturado      := condicaofaturado + ' = ''SIM'''
    else if BuscaPedido1.rgTipoBusca.ItemIndex = 2 then   condicaofaturado      := condicaofaturado + ' = ''N�O'''
    else if BuscaPedido1.rgTipoBusca.ItemIndex = 0 then   condicaofaturado      := condicaofaturado + ' in (''SIM'',''N�O'') ';

   // if (condicaoPeriodo = '') and (condicaoPedidos = '') and (condicaoReferencias = '') and (condicaoCores = '') then
  //    E := '';

    qryItens.Close;
    qryItens.SQL.Text := 'select p.referencia Ref_produto,c.referencia Ref_cor, sum(i.qtd_rn) qtd_rn, sum(i.qtd_p) qtd_p, sum(i.qtd_m) qtd_m,            '+
                         'sum(i.qtd_g) qtd_g, sum(i.qtd_1) qtd_1, sum(i.qtd_2) qtd_2, sum(i.qtd_3) qtd_3, sum(i.qtd_4) qtd_4, sum(i.qtd_6) qtd_6,        '+
                         'sum(i.qtd_8) qtd_8, sum(i.qtd_10) qtd_10, sum(i.qtd_12) qtd_12, sum(i.qtd_14) qtd_14, sum(i.qtd_unica) qtd_unica,              '+
                         'sum(i.qtd_total) qtd_total, sum( (p.qtd_pecas * i.qtd_total) ) pecas,                                                          '+
                         'iif(c.desc_producao <> '''',(c.desc_producao || '' '' || c.cor),max(c.descricao)) cor, max(p.descricao) produto,               '+
                         'max(ped.numpedido) pedido                                 from itens i                                                         '+
                         'inner join produtos p           on ( p.codigo   = i.cod_produto )                                                              '+
                         'inner join cores c              on ( c.codigo   = i.cod_cor     )                                                              '+
                         'inner join pedidos ped          on ( ped.codigo = i.cod_pedido  )                                                              '+
                         'left join pedidos_faturados pf on (pf.codigo_pedido = ped.codigo)                                                              '+
                         'left join dados_representante dr on dr.codigo_representante = ped.cod_repres                                                   '+
                         'where not(ped.cancelado = ''S'')  '+ condicaoPeriodo + condicaoPedidos + condicaoReferencias + condicaoCores + condicaoFaturado + condicao_ecommerce    +
                         'group by p.referencia, c.desc_producao, c.referencia, c.cor '+IfThen(BuscaPedido1.rgTipoBusca.ItemIndex = 2,', pf.codigo ', '')+
                         'order by '+ IfThen(rgAgrupamento.ItemIndex = 0, 'p.referencia, cor', 'cor, p.referencia') ;

    if not cbPeriodo.Checked then begin
      qryItens.ParamByName('dti').AsDateTime := dtpInicio.DateTime;
      qryItens.ParamByName('dtf').AsDateTime := dtpFim.DateTime;
    end;

    qryItens.Open;

    if qryItens.IsEmpty then  exit;

    pedidos := '';

    qry.Close;
    qry.SQL.Text := 'select (ped.numpedido) pedido  from produtos p                         '+
                                '  inner join itens i               on ( p.codigo   = i.cod_produto )   '+
                                '  inner join cores c               on ( c.codigo   = i.cod_cor     )   '+
                                '  inner join pedidos ped           on ( ped.codigo = i.cod_pedido  )   '+
                                '  left join pedidos_faturados pf   on (pf.codigo_pedido = ped.codigo)  '+
                                '  left join dados_representante dr on dr.codigo_representante = ped.cod_repres '+
                                ' where not(ped.cancelado = ''S'') '+ condicaoPeriodo + condicaoPedidos + condicaoReferencias + condicaoCores
                                + condicaoFaturado + condicao_ecommerce +
                                ' group by ped.numpedido';

    if not cbPeriodo.Checked then begin
      qry.ParamByName('dti').AsDateTime := dtpInicio.DateTime;
      qry.ParamByName('dtf').AsDateTime := dtpFim.DateTime;
    end;

    qry.Open;

    if qry.IsEmpty then  exit;

    while not qry.Eof do begin
        pedidos := pedidos +', '+qry.fieldByName('pedido').AsString;

      qry.Next;
    end;

    pedidos := copy(pedidos, 2, length(pedidos));

    rlMemoPedidos.Lines.Clear;
    rlMemoPedidos.Lines.Add( pedidos );
  finally
    FreeAndNil(qry);
  end;
end;

function TfrmRelatorioPedidosProducao.dataBase: String;
begin
  if rgData.ItemIndex = 0 then
    Result := 'DT_CADASTRO'
  else if rgData.ItemIndex = 1 then
    Result := 'DT_REPRESENTANTE'
  else if rgData.ItemIndex = 2 then
    Result := 'DT_RECEBIMENTO'
  else if rgData.ItemIndex = 3 then
    Result := 'DT_ENTREGA';
end;

function TfrmRelatorioPedidosProducao.pedidosSelecionados: String;
begin
  cdsPedidos.First;

  while not cdsPedidos.Eof do begin
    result := result + ', '+cdsPedidosCODIGO.AsString;

    cdsPedidos.Next;
  end;

  result := copy(result, 2, length(result) );
end;

function TfrmRelatorioPedidosProducao.referenciasSelecionadas: String;
var referencias :String;
begin
  referencias := '';
  cdsReferencias.First;

  while not cdsReferencias.Eof do begin
    result := result + ',' + cdsReferenciasCODIGO.AsString;
    referencias := referencias + ', '+ cdsReferenciasREFERENCIA.AsString;

    cdsReferencias.Next;
  end;

  if rgTipo.ItemIndex = 0 then
    rlMemoReferencias.Lines.Add( copy(referencias,2,length(referencias) ) )
  else
    rlMemoReferencias2.Lines.Add( copy(referencias,2,length(referencias) ) );


  result := copy(result, 2, length(result) );

  rlband3.Visible := true;
end;

procedure TfrmRelatorioPedidosProducao.cbPeriodoClick(Sender: TObject);
begin
  if cbPeriodo.Checked then begin
    dtpInicio.Enabled       := false;
    dtpFim.Enabled          := false;

    if cdsPedidos.isEmpty then
      rgPedidos.ItemIndex     := 0;

    if cdsReferencias.isEmpty then
      rgReferencias.ItemIndex := 0;

    if cdsCores.IsEmpty then
      rgCores.ItemIndex := 0;
  end
  else begin
    dtpInicio.Enabled := true;
    dtpFim.Enabled    := true;
  end;
end;

procedure TfrmRelatorioPedidosProducao.BuscaPedido1edtNumPedidoExit(
  Sender: TObject);
begin
  inherited;
  BuscaPedido1.edtNumPedidoExit(Sender);

  if not (BuscaPedido1.codigo > 0) then
    BuscaPedido1.edtNumPedido.Clear;
end;

procedure TfrmRelatorioPedidosProducao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( (ssCtrl in Shift) AND (Key = ord('P')) ) then  btnImprimir.Click;
end;

procedure TfrmRelatorioPedidosProducao.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLDBText3.Visible  := true;
  RLDBText4.Visible  := true;
  RLDBText5.Visible  := true;
  RLDBText6.Visible  := true;
  RLDBText7.Visible  := true;
  RLDBText8.Visible  := true;
  RLDBText9.Visible  := true;
  RLDBText10.Visible := true;
  RLDBText11.Visible := true;
  RLDBText12.Visible := true;
  RLDBText13.Visible := true;
  RLDBText36.Visible := true;
  RLDBText37.Visible := true;
  RLDBText38.Visible := true;

  FQtdTotRn    := FQtdTotRn    + qryItensQTD_RN.AsInteger;
  FQtdTotP     := FQtdTotP     + qryItensQTD_P.AsInteger;
  FQtdTotM     := FQtdTotM     + qryItensQTD_M.AsInteger;
  FQtdTotG     := FQtdTotG     + qryItensQTD_G.AsInteger;
  FQtdTot1     := FQtdTot1     + qryItensQTD_1.AsInteger;
  FQtdTot2     := FQtdTot2     + qryItensQTD_2.AsInteger;
  FQtdTot3     := FQtdTot3     + qryItensQTD_3.AsInteger;
  FQtdTot4     := FQtdTot4     + qryItensQTD_4.AsInteger;
  FQtdTot6     := FQtdTot6     + qryItensQTD_6.AsInteger;
  FQtdTot8     := FQtdTot8     + qryItensQTD_8.AsInteger;
  FQtdTot10    := FQtdTot10    + qryItensQTD_10.AsInteger;
  FQtdTot12    := FQtdTot12    + qryItensQTD_12.AsInteger;
  FQtdTot14    := FQtdTot14    + qryItensQTD_14.AsInteger;
  FQtdTotUnica := FQtdTotUnica + qryItensQTD_UNICA.AsInteger;

  if qryItensQTD_RN.AsInteger    <= 0  then  RLDBText3.Visible := false;
  if qryItensQTD_P.AsInteger     <= 0  then  RLDBText4.Visible := false;
  if qryItensQTD_M.AsInteger     <= 0  then  RLDBText5.Visible := false;
  if qryItensQTD_G.AsInteger     <= 0  then  RLDBText6.Visible := false;
  if qryItensQTD_1.AsInteger     <= 0  then  RLDBText7.Visible := false;
  if qryItensQTD_2.AsInteger     <= 0  then  RLDBText8.Visible := false;
  if qryItensQTD_3.AsInteger     <= 0  then  RLDBText9.Visible := false;
  if qryItensQTD_4.AsInteger     <= 0  then  RLDBText10.Visible := false;
  if qryItensQTD_6.AsInteger     <= 0  then  RLDBText11.Visible := false;
  if qryItensQTD_8.AsInteger     <= 0  then  RLDBText12.Visible := false;
  if qryItensQTD_10.AsInteger    <= 0  then  RLDBText36.Visible := false;
  if qryItensQTD_12.AsInteger    <= 0  then  RLDBText37.Visible := false;
  if qryItensQTD_14.AsInteger    <= 0  then  RLDBText38.Visible := false;
  if qryItensQTD_UNICA.AsInteger <= 0  then  RLDBText13.Visible := false;
end;

procedure TfrmRelatorioPedidosProducao.RLBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  lbTotGeralRn.Caption    :=  IntToStr(FQtdTotGeralRn   );
  lbTotGeralP.Caption     :=  IntToStr(FQtdTotGeralP    );
  lbTotGeralM.Caption     :=  IntToStr(FQtdTotGeralM    );
  lbTotGeralG.Caption     :=  IntToStr(FQtdTotGeralG    );
  lbTotGeral1.Caption     :=  IntToStr(FQtdTotGeral1    );
  lbTotGeral2.Caption     :=  IntToStr(FQtdTotGeral2    );
  lbTotGeral3.Caption     :=  IntToStr(FQtdTotGeral3    );
  lbTotGeral4.Caption     :=  IntToStr(FQtdTotGeral4    );
  lbTotGeral6.Caption     :=  IntToStr(FQtdTotGeral6    );
  lbTotGeral8.Caption     :=  IntToStr(FQtdTotGeral8    );
  lbTotGeral10.Caption    :=  IntToStr(FQtdTotGeral10   );
  lbTotGeral12.Caption    :=  IntToStr(FQtdTotGeral12   );
  lbTotGeral14.Caption    :=  IntToStr(FQtdTotGeral14   );
  lbTotGeralUnica.Caption :=  IntToStr(FQtdTotGeralUnica);
end;

procedure TfrmRelatorioPedidosProducao.RLReport1BeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  if not cbPeriodo.Checked then begin
    rlDtIni.Caption := DateToStr(dtpInicio.DateTime);
    rlDtFim.Caption := DateToStr(dtpFim.DateTime);
  end
  else
    rlbGeral.Visible := true;

  zeraCamposTotais;
  FQtdTotGeralRn    := 0;
  FQtdTotGeralP     := 0;
  FQtdTotGeralM     := 0;
  FQtdTotGeralG     := 0;
  FQtdTotGeral1     := 0;
  FQtdTotGeral2     := 0;
  FQtdTotGeral3     := 0;
  FQtdTotGeral4     := 0;
  FQtdTotGeral6     := 0;
  FQtdTotGeral8     := 0;
  FQtdTotGeral10    := 0;
  FQtdTotGeral12    := 0;
  FQtdTotGeral14    := 0;
  FQtdTotGeralUnica := 0;
end;

function TfrmRelatorioPedidosProducao.Faturado(
  codPedido: integer): Boolean;
begin
  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select codigo from pedidos_faturados where codigo_pedido = :codPed';
  fdm.qryGenerica.ParamByName('codPed').AsInteger := codPedido;
  fdm.qryGenerica.Open;

  result := not (fdm.qryGenerica.IsEmpty);
end;

function TfrmRelatorioPedidosProducao.contem_referencias: Boolean;
begin
  Result := false;

  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select i.codigo from itens i                       '+
                              'inner join produtos p on p.codigo = i.cod_produto   '+
                              'inner join pedidos ped on ped.codigo = i.cod_pedido '+
                              'where ped.numpedido = :numPed and p.codigo in ('+referenciasSelecionadas+')';

  fdm.qryGenerica.ParamByName('numPed').AsString := BuscaPedido1.edtNumPedido.Text;
  fdm.qryGenerica.Open;

  Result := not fdm.qryGenerica.IsEmpty;
end;

procedure TfrmRelatorioPedidosProducao.btnAddPedidoEnter(Sender: TObject);
begin
  if Assigned(BuscaPedido1.Ped) then
    btnAddPedido.Click;
end;

procedure TfrmRelatorioPedidosProducao.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  self.close;
end;

procedure TfrmRelatorioPedidosProducao.zeraCamposTotais;
begin
  FQtdTotRn    := 0;
  FQtdTotP     := 0;
  FQtdTotM     := 0;
  FQtdTotG     := 0;
  FQtdTot1     := 0;
  FQtdTot2     := 0;
  FQtdTot3     := 0;
  FQtdTot4     := 0;
  FQtdTot6     := 0;
  FQtdTot8     := 0;
  FQtdTot10    := 0;
  FQtdTot12    := 0;
  FQtdTot14    := 0;
  FQtdTotUnica := 0;
end;

// diminui dos itens dos pedidos filtrados, as quantidades conferidas, (quando a conferencia correspondente ainda esta em aberto)
procedure TfrmRelatorioPedidosProducao.montaSQLparaSaldo;
var condicaoPeriodo, condicaoPedidos, condicao_ecommerce, condicaoReferencias, condicaoCores, pedidos, E, condicaoFaturado :String;
begin

  if not cbPeriodo.Checked then
    condicaoPeriodo := ' and (ped.'+dataBase+' between :dti and :dtf) ';

  if (cdsPedidos.Active) and not (cdsPedidos.IsEmpty) then begin

    if rgPedidos.ItemIndex = 0 then
      condicaoPedidos := IfThen(cbPeriodo.Checked, '', ' or  i.cod_pedido in     ('+pedidosSelecionados+') ')
    else if rgPedidos.ItemIndex = 1 then
      condicaoPedidos := ' and i.cod_pedido not in ('+pedidosSelecionados+') '
    else if rgPedidos.ItemIndex = 2 then
      condicaoPedidos := ' and i.cod_pedido in     ('+pedidosSelecionados+') ';

  end;

  case rgSetor.ItemIndex of
    0 : condicao_ecommerce := ' AND ((DR.CODIGO IS NULL) or (DR.REP_ECOMMERCE <> ''S'')) ';
    1 : condicao_ecommerce := ' AND (not(DR.CODIGO IS NULL) and (DR.REP_ECOMMERCE = ''S'') )';
    2 : condicao_ecommerce := '';
  end;

  rlMemoReferencias2.Lines.Clear;
  if (cdsReferencias.Active) and not (cdsReferencias.IsEmpty) then begin

    if rgReferencias.ItemIndex = 0 then
      condicaoReferencias := IfThen(cbPeriodo.Checked, '', ' or  pro.codigo in     ('+referenciasSelecionadas+') ')
    else if rgReferencias.ItemIndex = 1 then
      condicaoReferencias := ' and pro.codigo not in ('+referenciasSelecionadas+') '
    else if rgReferencias.ItemIndex = 2 then
      condicaoReferencias := ' and pro.codigo in     ('+referenciasSelecionadas+') ';

  end;

  if (cdsCores.Active) and not (cdsCores.IsEmpty) then begin

    if rgCores.ItemIndex = 0 then
      condicaoCores := IfThen(cbPeriodo.Checked,'',' or  cor.codigo in     ('+coresSelecionadas+') ')
    else if rgCores.ItemIndex = 1 then
      condicaoCores := ' and cor.codigo not in ('+coresSelecionadas+') '
    else if rgCores.ItemIndex = 2 then
      condicaoCores := ' and cor.codigo in     ('+coresSelecionadas+') ';

  end;

  condicaoFaturado := ' and iif((not (PF.codigo is null) or (Ped.despachado = ''S'')), ''SIM'', ''N�O'')';

       if BuscaPedido1.rgTipoBusca.ItemIndex = 1 then   condicaofaturado      := condicaofaturado + ' = ''SIM'''
  else if BuscaPedido1.rgTipoBusca.ItemIndex = 2 then   condicaofaturado      := condicaofaturado + ' = ''N�O'''
  else if BuscaPedido1.rgTipoBusca.ItemIndex = 0 then   condicaofaturado      := condicaofaturado + ' in (''SIM'',''N�O'') ';

  cdsItens2.Close;
  qryItens2.SQL.Clear;
  qryItens2.SQL.Add ( 'select pro.referencia REFPRO, pro.descricao produto, cor.referencia refcor,                    '+
                        'iif(cor.desc_producao <> '''',(cor.desc_producao || '' '' || cor.cor),max(cor.descricao)) cor, '+
                        '       (sum(i.qtd_rn - iif(not ci.qtd_rn is null,ci.qtd_rn,0))- MAX(er.q_rn)) saldo_rn,        '+
                        '       (sum(i.qtd_p - iif(not ci.qtd_p is null,ci.qtd_p,0))- MAX(er.q_p)) saldo_p,             '+
                        '       (sum(i.qtd_m - iif(not ci.qtd_m is null,ci.qtd_m,0))- MAX(er.q_m)) saldo_m,             '+
                        '       (sum(i.qtd_g - iif(not ci.qtd_g is null,ci.qtd_g,0))- MAX(er.q_g)) saldo_g,             '+
                        '       (sum(i.qtd_1 - iif(not ci.qtd_1 is null,ci.qtd_1,0))- MAX(er.q_1)) saldo_1,             '+
                        '       (sum(i.qtd_2 - iif(not ci.qtd_2 is null,ci.qtd_2,0))- MAX(er.q_2)) saldo_2,             '+
                        '       (sum(i.qtd_3 - iif(not ci.qtd_3 is null,ci.qtd_3,0))- MAX(er.q_3)) saldo_3,             '+
                        '       (sum(i.qtd_4 - iif(not ci.qtd_4 is null,ci.qtd_4,0))- MAX(er.q_4)) saldo_4,             '+
                        '       (sum(i.qtd_6 - iif(not ci.qtd_6 is null,ci.qtd_6,0))- MAX(er.q_6)) saldo_6,             '+
                        '       (sum(i.qtd_8 - iif(not ci.qtd_8 is null,ci.qtd_8,0))- MAX(er.q_8)) saldo_8,             '+
                        '       (sum(i.qtd_10 - iif(not ci.qtd_10 is null,ci.qtd_10,0))- MAX(er.q_10)) saldo_10,        '+
                        '       (sum(i.qtd_12 - iif(not ci.qtd_12 is null,ci.qtd_12,0))- MAX(er.q_12)) saldo_12,        '+
                        '       (sum(i.qtd_14 - iif(not ci.qtd_14 is null,ci.qtd_14,0))- MAX(er.q_14)) saldo_14,        '+
                        '       (sum(trunc(i.qtd_unica - iif(not ci.qtd_unica is null,ci.qtd_unica,0)))- MAX(er.q_unica)) saldo_unica '+
                        '  from itens i                                                                                 '+
                        'left join conferencia_itens  ci  on ci.codigo_item = i.codigo                                  '+
                        'left join conferencia_pedido cp  on (cp.codigo = ci.codigo_conferencia)                        '+
                        'inner join produtos           pro on pro.codigo = i.cod_produto                                 '+
                        'inner join cores              cor on cor.codigo = i.cod_cor                                     '+
                        'inner join pedidos            ped on ped.codigo = i.cod_pedido                                  '+
                        'LEFT JOIN pedidos_faturados  PF  ON PF.CODIGO_PEDIDO = Ped.CODIGO                              '+
                        'left join ESTOQUE_POR_REFERENCIA(i.cod_produto, i.cod_cor, cor.cor_pai) ER on (1=1)            '+
                        'left join dados_representante dr on dr.codigo_representante = ped.cod_repres                   '+
                        'where ((CP.fim is null ) or NOT (CP.fim > ''01.01.2013'')) and not(ped.cancelado = ''S'')      '+
                         condicaoPeriodo + condicaoPedidos + condicaoReferencias + condicaoCores + condicaoFaturado + condicao_ecommerce +
                        'group by pro.referencia, pro.descricao, cor.referencia, cor.descricao,cor.desc_producao,cor.cor '+
                        ' having (  (sum(i.qtd_rn - iif(not ci.qtd_rn is null,ci.qtd_rn,0))- MAX(er.q_rn)) > 0 or        '+
                        '           (sum(i.qtd_p - iif(not ci.qtd_p is null,ci.qtd_p,0))- MAX(er.q_p)) > 0 or            '+
                        '           (sum(i.qtd_m - iif(not ci.qtd_m is null,ci.qtd_m,0))- MAX(er.q_m)) > 0 or            '+
                        '           (sum(i.qtd_g - iif(not ci.qtd_g is null,ci.qtd_g,0))- MAX(er.q_g)) > 0 or            '+
                        '           (sum(i.qtd_1 - iif(not ci.qtd_1 is null,ci.qtd_1,0))- MAX(er.q_1)) > 0 or            '+
                        '           (sum(i.qtd_2 - iif(not ci.qtd_2 is null,ci.qtd_2,0))- MAX(er.q_2)) > 0 or            '+
                        '           (sum(i.qtd_3 - iif(not ci.qtd_3 is null,ci.qtd_3,0))- MAX(er.q_3)) > 0 or            '+
                        '           (sum(i.qtd_4 - iif(not ci.qtd_4 is null,ci.qtd_4,0))- MAX(er.q_4)) > 0 or            '+
                        '           (sum(i.qtd_6 - iif(not ci.qtd_6 is null,ci.qtd_6,0))- MAX(er.q_6)) > 0 or            '+
                        '           (sum(i.qtd_8 - iif(not ci.qtd_8 is null,ci.qtd_8,0))- MAX(er.q_8)) > 0 or            '+
                        '           (sum(i.qtd_10 - iif(not ci.qtd_10 is null,ci.qtd_10,0))- MAX(er.q_10)) > 0 or            '+
                        '           (sum(i.qtd_12 - iif(not ci.qtd_12 is null,ci.qtd_12,0))- MAX(er.q_12)) > 0 or            '+
                        '           (sum(i.qtd_14 - iif(not ci.qtd_14 is null,ci.qtd_14,0))- MAX(er.q_14)) > 0 or            '+
                        '           (sum(trunc(i.qtd_unica - iif(not ci.qtd_unica is null,ci.qtd_unica,0)))- MAX(er.q_unica))  > 0 )     '+
                        'order by '+ IfThen(rgAgrupamento.ItemIndex = 0, 'refpro, cor', 'cor, refpro') );

  if not cbPeriodo.Checked then begin
    qryItens2.ParamByName('dti').AsDateTime := dtpInicio.DateTime;
    qryItens2.ParamByName('dtf').AsDateTime := dtpFim.DateTime;
  end;

  cdsItens2.Close;
  cdsItens2.Open;

  if cdsItens2.IsEmpty then  exit;

  pedidos := '';

 { if condicaoPeriodo = '' then
    condicaoPedidos := copy(condicaoPedidos,5,length(condicaoPedidos));

  if (condicaoPeriodo = '') and (condicaoPedidos = '') then
    condicaoReferencias := copy(condicaoReferencias,5,length(condicaoReferencias));

  if not (TRIM(condicaoPeriodo) = '') then
    condicaoPeriodo := copy(condicaoPeriodo, 5, length(condicaoPeriodo));

  if (condicaoPeriodo + condicaoPedidos + condicaoReferencias) = '' then
      condicaoCores := copy(condicaoCores,5,length(condicaoCores));

  if TRIM(condicaoPeriodo + condicaoPedidos + condicaoReferencias + condicaoCores) = '' then
    condicaoFaturado := copy(condicaoFaturado, 5, length(condicaoFaturado));  }

  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select (ped.numpedido) pedido  from produtos p                       '+
                              '  inner join itens i              on ( p.codigo   = i.cod_produto )   '+
                              '  inner join produtos       pro   on ( pro.codigo = i.cod_produto )   '+
                              '  inner join cores cor            on ( cor.codigo   = i.cod_cor   )   '+
                              '  inner join pedidos ped          on ( ped.codigo = i.cod_pedido  )   '+
                              '  left join pedidos_faturados pf on (pf.codigo_pedido = ped.codigo)  '+
                              '  left join dados_representante dr on dr.codigo_representante = ped.cod_repres '+
                              '  left join conferencia_pedido cp  on (cp.codigo_pedido = ped.codigo)          '+
                              ' where ((CP.fim is null ) or NOT (CP.fim > ''01.01.2013'')) and not(ped.cancelado = ''S'') '
                              + condicaoPeriodo + condicaoPedidos + condicaoReferencias + condicaoCores
                              + condicaoFaturado + condicao_ecommerce +
                              ' group by ped.numpedido';

  if not cbPeriodo.Checked then begin
    fdm.qryGenerica.ParamByName('dti').AsDateTime := dtpInicio.DateTime;
    fdm.qryGenerica.ParamByName('dtf').AsDateTime := dtpFim.DateTime;
  end;

  fdm.qryGenerica.Open;

  if fdm.qryGenerica.IsEmpty then  exit;

  while not fdm.qryGenerica.Eof do begin
      pedidos := pedidos +', '+fdm.qryGenerica.fieldByName('pedido').AsString;

    fdm.qryGenerica.Next;
  end;

  pedidos := copy(pedidos, 2, length(pedidos));

  rlMemoPedidos2.Lines.Clear;
  rlMemoPedidos2.Lines.Add( pedidos );
end;

procedure TfrmRelatorioPedidosProducao.RLReport2BeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  if not cbPeriodo.Checked then begin
    rlDtIni2.Caption := DateToStr(dtpInicio.DateTime);
    rlDtFim2.Caption := DateToStr(dtpFim.DateTime);
  end
  else
    rlbGeral2.Visible := true;
end;

procedure TfrmRelatorioPedidosProducao.RLBand12BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLDBText16.Visible := (cdsItens2SALDO_RN.AsInteger    > 0);
  RLDBText20.Visible := (cdsItens2SALDO_P.AsInteger     > 0);
  RLDBText21.Visible := (cdsItens2SALDO_M.AsInteger     > 0);
  RLDBText22.Visible := (cdsItens2SALDO_G.AsInteger     > 0);
  RLDBText23.Visible := (cdsItens2SALDO_1.AsInteger     > 0);
  RLDBText24.Visible := (cdsItens2SALDO_2.AsInteger     > 0);
  RLDBText25.Visible := (cdsItens2SALDO_3.AsInteger     > 0);
  RLDBText26.Visible := (cdsItens2SALDO_4.AsInteger     > 0);
  RLDBText27.Visible := (cdsItens2SALDO_6.AsInteger     > 0);
  RLDBText28.Visible := (cdsItens2SALDO_8.AsInteger     > 0);
  RLDBText29.Visible := (cdsItens2SALDO_UNICA.AsInteger > 0);
end;

procedure TfrmRelatorioPedidosProducao.RLBand2AfterPrint(Sender: TObject);
begin
  zeraCamposTotais;
end;

procedure TfrmRelatorioPedidosProducao.RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  lbTotRn.Caption    :=  IntToStr(FQtdTotRn   );
  lbTotP.Caption     :=  IntToStr(FQtdTotP    );
  lbTotM.Caption     :=  IntToStr(FQtdTotM    );
  lbTotG.Caption     :=  IntToStr(FQtdTotG    );
  lbTot1.Caption     :=  IntToStr(FQtdTot1    );
  lbTot2.Caption     :=  IntToStr(FQtdTot2    );
  lbTot3.Caption     :=  IntToStr(FQtdTot3    );
  lbTot4.Caption     :=  IntToStr(FQtdTot4    );
  lbTot6.Caption     :=  IntToStr(FQtdTot6    );
  lbTot8.Caption     :=  IntToStr(FQtdTot8    );
  lbTot10.Caption    :=  IntToStr(FQtdTot10   );
  lbTot12.Caption    :=  IntToStr(FQtdTot12   );
  lbTot14.Caption    :=  IntToStr(FQtdTot14   );
  lbTotUnica.Caption :=  IntToStr(FQtdTotUnica);

  FQtdTotGeralRn     :=   FQtdTotGeralRn    + FQtdTotRn;
  FQtdTotGeralP      :=   FQtdTotGeralP     + FQtdTotP;
  FQtdTotGeralM      :=   FQtdTotGeralM     + FQtdTotM;
  FQtdTotGeralG      :=   FQtdTotGeralG     + FQtdTotG;
  FQtdTotGeral1      :=   FQtdTotGeral1     + FQtdTot1;
  FQtdTotGeral2      :=   FQtdTotGeral2     + FQtdTot2;
  FQtdTotGeral3      :=   FQtdTotGeral3     + FQtdTot3;
  FQtdTotGeral4      :=   FQtdTotGeral4     + FQtdTot4;
  FQtdTotGeral6      :=   FQtdTotGeral6     + FQtdTot6;
  FQtdTotGeral8      :=   FQtdTotGeral8     + FQtdTot8;
  FQtdTotGeral10     :=   FQtdTotGeral10    + FQtdTot10;
  FQtdTotGeral12     :=   FQtdTotGeral12    + FQtdTot12;
  FQtdTotGeral14     :=   FQtdTotGeral14    + FQtdTot14;
  FQtdTotGeralUnica  :=   FQtdTotGeralUnica + FQtdTotUnica;
end;

procedure TfrmRelatorioPedidosProducao.RLBand11BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLDBResult5.Visible  := (RLDBResult5.Value > 0);
  RLDBResult6.Visible  := (RLDBResult6.Value > 0);
  RLDBResult7.Visible  := (RLDBResult7.Value > 0);
  RLDBResult8.Visible  := (RLDBResult8.Value > 0);
  RLDBResult8.Visible  := (RLDBResult8.Value > 0);
  RLDBResult9.Visible  := (RLDBResult9.Value > 0);
  RLDBResult10.Visible := (RLDBResult10.Value > 0);
  RLDBResult11.Visible := (RLDBResult11.Value > 0);
  RLDBResult12.Visible := (RLDBResult12.Value > 0);
  RLDBResult13.Visible := (RLDBResult13.Value > 0);
  RLDBResult14.Visible := (RLDBResult14.Value > 0);
  RLDBResult15.Visible := (RLDBResult15.Value > 0);
end;

procedure TfrmRelatorioPedidosProducao.rgPedidosClick(Sender: TObject);
begin
  if (rgPedidos.ItemIndex > 0) and (cdsPedidos.IsEmpty) then begin
    avisar('Utiliza��o dessa op��o de filtro indispon�vel, pois nenhum produto foi adicionado.');
    rgPedidos.ItemIndex := 0;
  end;
end;

procedure TfrmRelatorioPedidosProducao.rgReferenciasClick(Sender: TObject);
begin
  if (rgReferencias.ItemIndex > 0) and (cdsReferencias.IsEmpty) then begin
    avisar('Utiliza��o dessa op��o de filtro indispon�vel, pois nenhuma refer�ncia foi adicionada.');
    rgReferencias.ItemIndex := 0;
  end;
end;

procedure TfrmRelatorioPedidosProducao.BuscaProduto1Exit(Sender: TObject);
begin
  inherited;
 // BuscaProduto1.FrameExit(Sender);
 // if BuscaProduto1.edtReferencia.Text <> '' then
//    btnAddReferencia.SetFocus;
end;

procedure TfrmRelatorioPedidosProducao.BuscaPedido1btnBuscarClick(
  Sender: TObject);
begin
  inherited;
  BuscaPedido1.btnBuscarClick(Sender);

end;

procedure TfrmRelatorioPedidosProducao.cdsReferenciasAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  rgReferencias.ItemIndex:= 2;
end;

procedure TfrmRelatorioPedidosProducao.cdsPedidosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  rgPedidos.ItemIndex:= 2;
end;

procedure TfrmRelatorioPedidosProducao.RemoveItensVazios;
begin
  cdsItens2.ProviderName := '';
  cdsItens2.First;
  while not cdsItens2.Eof do begin

    if  (cdsItens2SALDO_RN.AsInteger <= 0) and (cdsItens2SALDO_P.AsInteger <= 0) and (cdsItens2SALDO_M.AsInteger <= 0) and (cdsItens2SALDO_G.AsInteger <= 0) and
        (cdsItens2SALDO_1.AsInteger <= 0)  and (cdsItens2SALDO_2.AsInteger <= 0) and (cdsItens2SALDO_3.AsInteger <= 0) and (cdsItens2SALDO_4.AsInteger <= 0) and
        (cdsItens2SALDO_6.AsInteger <= 0)  and (cdsItens2SALDO_8.AsInteger <= 0) and (cdsItens2SALDO_UNICA.AsInteger <= 0) then begin
      cdsItens2.Delete;
      continue;
    end
    else begin

      if  (cdsItens2SALDO_RN.AsInteger < 0) OR (cdsItens2SALDO_P.AsInteger < 0) OR (cdsItens2SALDO_M.AsInteger < 0) OR (cdsItens2SALDO_G.AsInteger < 0) OR
          (cdsItens2SALDO_1.AsInteger < 0)  OR (cdsItens2SALDO_2.AsInteger < 0) OR (cdsItens2SALDO_3.AsInteger < 0) OR (cdsItens2SALDO_4.AsInteger < 0) OR
          (cdsItens2SALDO_6.AsInteger < 0)  OR (cdsItens2SALDO_8.AsInteger < 0) OR (cdsItens2SALDO_UNICA.AsInteger < 0) then
        cdsItens2.Edit;

      if cdsItens2SALDO_RN.AsInteger < 0 then
        cdsItens2SALDO_RN.AsInteger := 0;
      if cdsItens2SALDO_P.AsInteger < 0 then
        cdsItens2SALDO_P.AsInteger := 0;
      if cdsItens2SALDO_M.AsInteger < 0 then
        cdsItens2SALDO_M.AsInteger := 0;
      if cdsItens2SALDO_G.AsInteger < 0 then
        cdsItens2SALDO_G.AsInteger := 0;
      if cdsItens2SALDO_1.AsInteger < 0 then
        cdsItens2SALDO_1.AsInteger := 0;
      if cdsItens2SALDO_2.AsInteger < 0 then
        cdsItens2SALDO_2.AsInteger := 0;
      if cdsItens2SALDO_3.AsInteger < 0 then
        cdsItens2SALDO_3.AsInteger := 0;
      if cdsItens2SALDO_4.AsInteger < 0 then
        cdsItens2SALDO_4.AsInteger := 0;
      if cdsItens2SALDO_6.AsInteger < 0 then
        cdsItens2SALDO_6.AsInteger := 0;
      if cdsItens2SALDO_8.AsInteger < 0 then
        cdsItens2SALDO_8.AsInteger := 0;
      if cdsItens2SALDO_UNICA.AsInteger < 0 then
        cdsItens2SALDO_UNICA.AsInteger := 0;

      if cdsItens2.State in [dsEdit] then
        cdsItens2.Post;
    end;

    cdsItens2.Next;
  end;

  //cdsItens2.ProviderName := dspItens2.Name;
end;

procedure TfrmRelatorioPedidosProducao.FormShow(Sender: TObject);
begin
  cdsItens2.CreateDataSet;
end;

procedure TfrmRelatorioPedidosProducao.cdsItens2CalcFields(DataSet: TDataSet);
begin
  if TClientDataSet(DataSet).FieldByName('SALDO_RN').AsFloat > 0 then
    cdsItens2TOT_RN.AsFloat := cdsItens2TOT_RN.AsFloat + TClientDataSet(DataSet).FieldByName('SALDO_RN').AsFloat;

  if TClientDataSet(DataSet).FieldByName('SALDO_P').AsFloat > 0 then
    cdsItens2TOT_P.AsFloat := cdsItens2TOT_P.AsFloat + TClientDataSet(DataSet).FieldByName('SALDO_P').AsFloat;

  if TClientDataSet(DataSet).FieldByName('SALDO_M').AsFloat > 0 then
    cdsItens2TOT_M.AsFloat := cdsItens2TOT_M.AsFloat + TClientDataSet(DataSet).FieldByName('SALDO_M').AsFloat;

  if TClientDataSet(DataSet).FieldByName('SALDO_G').AsFloat > 0 then
    cdsItens2TOT_G.AsFloat := cdsItens2TOT_G.AsFloat + TClientDataSet(DataSet).FieldByName('SALDO_G').AsFloat;

  if TClientDataSet(DataSet).FieldByName('SALDO_1').AsFloat > 0 then
    cdsItens2TOT_1.AsFloat := cdsItens2TOT_1.AsFloat + TClientDataSet(DataSet).FieldByName('SALDO_1').AsFloat;

  if TClientDataSet(DataSet).FieldByName('SALDO_2').AsFloat > 0 then
    cdsItens2TOT_2.AsFloat := cdsItens2TOT_2.AsFloat + TClientDataSet(DataSet).FieldByName('SALDO_2').AsFloat;

  if TClientDataSet(DataSet).FieldByName('SALDO_3').AsFloat > 0 then
    cdsItens2TOT_3.AsFloat := cdsItens2TOT_3.AsFloat + TClientDataSet(DataSet).FieldByName('SALDO_3').AsFloat;

  if TClientDataSet(DataSet).FieldByName('SALDO_4').AsFloat > 0 then
    cdsItens2TOT_4.AsFloat := cdsItens2TOT_4.AsFloat + TClientDataSet(DataSet).FieldByName('SALDO_4').AsFloat;

  if TClientDataSet(DataSet).FieldByName('SALDO_6').AsFloat > 0 then
    cdsItens2TOT_6.AsFloat := cdsItens2TOT_6.AsFloat + TClientDataSet(DataSet).FieldByName('SALDO_6').AsFloat;

  if TClientDataSet(DataSet).FieldByName('SALDO_8').AsFloat > 0 then
    cdsItens2TOT_8.AsFloat := cdsItens2TOT_8.AsFloat + TClientDataSet(DataSet).FieldByName('SALDO_8').AsFloat;

  if TClientDataSet(DataSet).FieldByName('SALDO_10').AsFloat > 0 then
    cdsItens2TOT_10.AsFloat := cdsItens2TOT_10.AsFloat + TClientDataSet(DataSet).FieldByName('SALDO_10').AsFloat;

  if TClientDataSet(DataSet).FieldByName('SALDO_12').AsFloat > 0 then
    cdsItens2TOT_12.AsFloat := cdsItens2TOT_12.AsFloat + TClientDataSet(DataSet).FieldByName('SALDO_12').AsFloat;

  if TClientDataSet(DataSet).FieldByName('SALDO_14').AsFloat > 0 then
    cdsItens2TOT_14.AsFloat := cdsItens2TOT_14.AsFloat + TClientDataSet(DataSet).FieldByName('SALDO_14').AsFloat;
    
  if TClientDataSet(DataSet).FieldByName('SALDO_UNICA').AsFloat > 0 then
    cdsItens2TOT_UNICA.AsFloat := cdsItens2TOT_UNICA.AsFloat + TClientDataSet(DataSet).FieldByName('SALDO_UNICA').AsFloat;

end;

procedure TfrmRelatorioPedidosProducao.montaSQLparaNaoConferidos;
var condicaoPeriodo, condicaoPedidos, condicaoReferencias, condicao_ecommerce, condicaoCores, pedidos, E, condicaoFaturado :String;
begin
  if not cbPeriodo.Checked then
    condicaoPeriodo := ' and (ped.'+dataBase+' between :dti and :dtf) ';

  if (cdsPedidos.Active) and not (cdsPedidos.IsEmpty) then
  begin
    if rgPedidos.ItemIndex = 0 then
      condicaoPedidos := IfThen(cbPeriodo.Checked, '', ' or  i.cod_pedido in     ('+pedidosSelecionados+') ')
    else if rgPedidos.ItemIndex = 1 then
      condicaoPedidos := ' and i.cod_pedido not in ('+pedidosSelecionados+') '
    else if rgPedidos.ItemIndex = 2 then
      condicaoPedidos := ' and i.cod_pedido in     ('+pedidosSelecionados+') ';
  end;

  case rgSetor.ItemIndex of
    0 : condicao_ecommerce := ' AND ((DR.CODIGO IS NULL) or (DR.REP_ECOMMERCE <> ''S'')) ';
    1 : condicao_ecommerce := ' AND (not(DR.CODIGO IS NULL) and (DR.REP_ECOMMERCE = ''S'') )';
    2 : condicao_ecommerce := '';
  end;

  rlMemoReferencias2.Lines.Clear;
  if (cdsReferencias.Active) and not (cdsReferencias.IsEmpty) then begin

    if rgReferencias.ItemIndex = 0 then
      condicaoReferencias := IfThen(cbPeriodo.Checked, '', ' or  pro.codigo in     ('+referenciasSelecionadas+') ')
    else if rgReferencias.ItemIndex = 1 then
      condicaoReferencias := ' and pro.codigo not in ('+referenciasSelecionadas+') '
    else if rgReferencias.ItemIndex = 2 then
      condicaoReferencias := ' and pro.codigo in     ('+referenciasSelecionadas+') ';

  end;

  if (cdsCores.Active) and not (cdsCores.IsEmpty) then begin

    if rgCores.ItemIndex = 0 then
      condicaoCores := IfThen(cbPeriodo.Checked,'',' or  cor.codigo in     ('+coresSelecionadas+') ')
    else if rgCores.ItemIndex = 1 then
      condicaoCores := ' and cor.codigo not in ('+coresSelecionadas+') '
    else if rgCores.ItemIndex = 2 then
      condicaoCores := ' and cor.codigo in     ('+coresSelecionadas+') ';

  end;

  condicaoFaturado := ' and iif((not (PF.codigo is null) or (Ped.despachado = ''S'')), ''SIM'', ''N�O'')';

       if BuscaPedido1.rgTipoBusca.ItemIndex = 1 then   condicaofaturado      := condicaofaturado + ' = ''SIM'''
  else if BuscaPedido1.rgTipoBusca.ItemIndex = 2 then   condicaofaturado      := condicaofaturado + ' = ''N�O'''
  else if BuscaPedido1.rgTipoBusca.ItemIndex = 0 then   condicaofaturado      := condicaofaturado + ' in (''SIM'',''N�O'') ';

  cdsItens2.Close;
  qryItens2.SQL.Clear;
  qryItens2.SQL.Add ( ' select pro.referencia REFPRO, pro.descricao produto, cor.referencia refcor,                      '+
                      '  iif(cor.desc_producao <> '''', (cor.desc_producao || '' '' || cor.cor), max(cor.descricao)) cor,    '+
                      '         (sum(i.qtd_rn - iif(ci.qtd_rn is not null,ci.qtd_rn,0))) saldo_rn,                        '+
                      '         (sum(i.qtd_p - iif(ci.qtd_p is not null,ci.qtd_p,0))) saldo_p,                           '+
                      '         (sum(i.qtd_m - iif(ci.qtd_m is not null,ci.qtd_m,0))) saldo_m,                           '+
                      '         (sum(i.qtd_g - iif(ci.qtd_g is not null,ci.qtd_g,0))) saldo_g,                           '+
                      '         (sum(i.qtd_1 - iif(ci.qtd_1 is not null,ci.qtd_1,0))) saldo_1,                           '+
                      '         (sum(i.qtd_2 - iif(ci.qtd_2 is not null,ci.qtd_2,0))) saldo_2,                           '+
                      '         (sum(i.qtd_3 - iif(ci.qtd_3 is not null,ci.qtd_3,0))) saldo_3,                           '+
                      '         (sum(i.qtd_4 - iif(ci.qtd_4 is not null,ci.qtd_4,0))) saldo_4,                           '+
                      '         (sum(i.qtd_6 - iif(ci.qtd_6 is not null,ci.qtd_6,0))) saldo_6,                           '+
                      '         (sum(i.qtd_8 - iif(ci.qtd_8 is not null,ci.qtd_8,0))) saldo_8,                           '+
                      '         (sum(i.qtd_10 - iif(ci.qtd_10 is not null,ci.qtd_10,0))) saldo_10,                       '+
                      '         (sum(i.qtd_12 - iif(ci.qtd_12 is not null,ci.qtd_12,0))) saldo_12,                       '+
                      '         (sum(i.qtd_14 - iif(ci.qtd_14 is not null,ci.qtd_14,0))) saldo_14,                       '+
                      '         (sum(trunc(i.qtd_unica - iif(ci.qtd_unica is not null,ci.qtd_unica,0)))) saldo_unica     '+
                      '    from itens i                                                                                  '+
                      '  left join conferencia_itens  ci  on ci.codigo_item = i.codigo                                   '+
                      '  left join conferencia_pedido cp  on (cp.codigo = ci.codigo_conferencia)                         '+
                      '  inner join produtos           pro on pro.codigo = i.cod_produto                                  '+
                      '  inner join cores              cor on cor.codigo = i.cod_cor                                      '+
                      '  inner join pedidos            ped on ped.codigo = i.cod_pedido                                   '+
                      '  LEFT JOIN pedidos_faturados  PF  ON PF.CODIGO_PEDIDO = Ped.CODIGO                               '+
                      '  left join dados_representante dr on dr.codigo_representante = ped.cod_repres                    '+
                      '  where ((CP.fim is null ) or NOT (CP.fim > ''01.01.2013'')) and not(ped.cancelado = ''S'')       '+
                          condicaoPeriodo + condicaoPedidos + condicaoReferencias + condicaoCores + condicaoFaturado + condicao_ecommerce +
                      '  group by pro.referencia, pro.descricao, cor.referencia, cor.descricao,cor.desc_producao,cor.cor '+
                      '   having (  (sum(i.qtd_rn - iif(ci.qtd_rn is not null,ci.qtd_rn,0))) > 0 or                      '+
                      '             (sum(i.qtd_p - iif(ci.qtd_p is not null,ci.qtd_p,0))) > 0 or                         '+
                      '             (sum(i.qtd_m - iif(ci.qtd_m is not null,ci.qtd_m,0))) > 0 or                         '+
                      '             (sum(i.qtd_g - iif(ci.qtd_g is not null,ci.qtd_g,0))) > 0 or                         '+
                      '             (sum(i.qtd_1 - iif(ci.qtd_1 is not null,ci.qtd_1,0))) > 0 or                         '+
                      '             (sum(i.qtd_2 - iif(ci.qtd_2 is not null,ci.qtd_2,0))) > 0 or                         '+
                      '             (sum(i.qtd_3 - iif(ci.qtd_3 is not null,ci.qtd_3,0))) > 0 or                         '+
                      '             (sum(i.qtd_4 - iif(ci.qtd_4 is not null,ci.qtd_4,0))) > 0 or                         '+
                      '             (sum(i.qtd_6 - iif(ci.qtd_6 is not null,ci.qtd_6,0))) > 0 or                         '+
                      '             (sum(i.qtd_8 - iif(ci.qtd_8 is not null,ci.qtd_8,0))) > 0 or                         '+
                      '             (sum(i.qtd_10 - iif(ci.qtd_10 is not null,ci.qtd_10,0))) > 0 or                     '+
                      '             (sum(i.qtd_12 - iif(ci.qtd_12 is not null,ci.qtd_12,0))) > 0 or                     '+
                      '             (sum(i.qtd_14 - iif(ci.qtd_14 is not null,ci.qtd_14,0))) > 0 or                     '+
                      '             (sum(trunc(i.qtd_unica - iif(ci.qtd_unica is not null,ci.qtd_unica,0))))  > 0 )      '+
                      'order by '+ IfThen(rgAgrupamento.ItemIndex = 0, 'refpro, cor', 'cor, refpro') );

  if not cbPeriodo.Checked then begin
    qryItens2.ParamByName('dti').AsDateTime := dtpInicio.DateTime;
    qryItens2.ParamByName('dtf').AsDateTime := dtpFim.DateTime;
  end;

  cdsItens2.Close;
  cdsItens2.Open;

  if cdsItens2.IsEmpty then  exit;

  pedidos := '';

 { if condicaoPeriodo = '' then
    condicaoPedidos := copy(condicaoPedidos,5,length(condicaoPedidos));

  if (condicaoPeriodo = '') and (condicaoPedidos = '') then
    condicaoReferencias := copy(condicaoReferencias,5,length(condicaoReferencias));

  if not (TRIM(condicaoPeriodo) = '') then
    condicaoPeriodo := copy(condicaoPeriodo, 5, length(condicaoPeriodo));

  if TRIM(condicaoPeriodo + condicaoPedidos + condicaoReferencias + condicaoCores) = '' then
    condicaoFaturado := copy(condicaoFaturado, 5, length(condicaoFaturado));

  if TRIM(condicaoPeriodo + condicaoPedidos + condicaoReferencias) = '' then
      condicaoCores := copy(condicaoCores,5,length(condicaoCores));  }

  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select (ped.numpedido) pedido  from produtos p                         '+
                              '  inner join itens i               on ( p.codigo   = i.cod_produto )   '+
                              '  inner join produtos       pro    on ( pro.codigo = i.cod_produto )   '+
                              '  inner join cores cor             on ( cor.codigo   = i.cod_cor   )   '+
                              '  inner join pedidos ped           on ( ped.codigo = i.cod_pedido  )   '+
                              '  left join pedidos_faturados pf   on (pf.codigo_pedido = ped.codigo)   '+
                              '  left join dados_representante dr on dr.codigo_representante = ped.cod_repres '+
                              '  left join conferencia_pedido cp  on (cp.codigo_pedido = ped.codigo)          '+
                              ' where ((CP.fim is null ) or NOT (CP.fim > ''01.01.2013'')) and not(ped.cancelado = ''S'') '
                              + condicaoPeriodo + condicaoPedidos + condicaoReferencias + condicaoCores
                              + condicaoFaturado + condicao_ecommerce +
                              ' group by ped.numpedido';

  if not cbPeriodo.Checked then begin
    fdm.qryGenerica.ParamByName('dti').AsDateTime := dtpInicio.DateTime;
    fdm.qryGenerica.ParamByName('dtf').AsDateTime := dtpFim.DateTime;
  end;

  fdm.qryGenerica.Open;

  if fdm.qryGenerica.IsEmpty then  exit;

  while not fdm.qryGenerica.Eof do begin
      pedidos := pedidos +', '+fdm.qryGenerica.fieldByName('pedido').AsString;

    fdm.qryGenerica.Next;
  end;

  pedidos := copy(pedidos, 2, length(pedidos));

  rlMemoPedidos2.Lines.Clear;
  rlMemoPedidos2.Lines.Add( pedidos );
end;

procedure TfrmRelatorioPedidosProducao.btnAddCorClick(Sender: TObject);
begin
  if not cdsCores.Active then  cdsCores.CreateDataSet;

  if (trim(BuscaCor1.edtReferencia.Text) <> '') and not (cdsCores.Locate('REFERENCIA', BuscaCor1.edtReferencia.Text, [])) then begin

    cdsCores.Append;
    cdsCoresCODIGO.AsString     := BuscaCor1.codCor;
    cdsCoresREFERENCIA.AsString := BuscaCor1.edtReferencia.Text;
    cdsCores.Post;

  end;

  BuscaCor1.limpa;
  BuscaCor1.edtReferencia.SetFocus;
end;

procedure TfrmRelatorioPedidosProducao.gridCoresKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (cdsCores.Active) and not (cdsCores.IsEmpty) then begin

    if key = VK_Delete then
      cdsCores.Delete
    else if key = VK_F3 then
      cdsCores.EmptyDataSet;

    if cdsCores.IsEmpty then
      rgCores.ItemIndex := 0;

  end;
end;

procedure TfrmRelatorioPedidosProducao.BuscaCor1Exit(Sender: TObject);
begin
  inherited;
  BuscaCor1.FrameExit(Sender);
  if BuscaCor1.edtReferencia.Text <> '' then
    btnAddCor.SetFocus;
end;

function TfrmRelatorioPedidosProducao.coresSelecionadas: String;
var cores :String;
begin
  cores := '';
  cdscores.First;

  while not cdscores.Eof do begin
    result := result + ',' + cdscoresCODIGO.AsString;
    cores := cores + ', '+ cdscoresREFERENCIA.AsString;

    cdscores.Next;
  end;

  result := copy(result, 2, length(result) );
end;

procedure TfrmRelatorioPedidosProducao.cdsCoresAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  rgCores.ItemIndex := 2;
end;

procedure TfrmRelatorioPedidosProducao.rgCoresClick(Sender: TObject);
begin
  if (rgCores.ItemIndex > 0) and (cdsCores.IsEmpty) then begin
    avisar('Utiliza��o dessa op��o de filtro indispon�vel, pois nenhuma cor foi adicionada.');
    rgCores.ItemIndex := 0;
  end;
end;

procedure TfrmRelatorioPedidosProducao.rgAgrupamentoClick(Sender: TObject);
begin
  if rgAgrupamento.ItemIndex = 0 then
  begin
    RLGroup1.DataFields  := 'REFPRO';
    RLDBText33.DataField := 'REFPRO';
    RLDBText34.DataField := 'PRODUTO';
    RLDBText1.DataField  := 'REFCOR';
    RLDBText31.DataField := 'COR';
    RLGroup2.DataFields  := 'REF_PRODUTO';
    RLDBText18.DataField := 'REF_PRODUTO';
    RLDBText19.DataField := 'PRODUTO';
    RLDBText2.DataField  := 'REF_COR';
    RLDBText17.DataField := 'COR';
  end
  else
  begin
    RLGroup1.DataFields  := 'REFCOR';
    RLDBText33.DataField := 'REFCOR';
    RLDBText34.DataField := 'COR';
    RLDBText1.DataField  := 'REFPRO';
    RLDBText31.DataField := 'PRODUTO';
    RLGroup2.DataFields  := 'REF_COR';
    RLDBText18.DataField := 'REF_COR';
    RLDBText19.DataField := 'COR';
    RLDBText2.DataField  := 'REF_PRODUTO';
    RLDBText17.DataField := 'PRODUTO';
  end;
end;

end.




