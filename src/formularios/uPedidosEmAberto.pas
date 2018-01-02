unit uPedidosEmAberto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, framePeriodo, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, RxToolEdit, RxCurrEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, System.DateUtils, System.Classes,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, DBGridCBN, RLFilters, RLPDFFilter, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, ACBrGIF;

type
  TfrmPedidosEmAberto = class(TfrmPadrao)
    Panel1: TPanel;
    Periodo1: TPeriodo;
    pnlRodape: TPanel;
    btnSair: TBitBtn;
    qry: TFDQuery;
    qryTOTAL: TIntegerField;
    qryPARCIAIS: TLargeintField;
    qryNORMAIS: TLargeintField;
    qryDATA: TStringField;
    qryMAXIMA: TDateField;
    ds: TDataSource;
    btnTotaisMes: TBitBtn;
    pgPedidos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ScrollBox1: TScrollBox;
    flpMeses: TFlowPanel;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLDraw2: TRLDraw;
    RLLabel8: TRLLabel;
    rlbPeriodo: TRLLabel;
    RLBand2: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label25: TLabel;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    DBGridCBN1: TDBGridCBN;
    qryPedidos: TFDQuery;
    dsPedidos: TDataSource;
    qryPedidosNUMPEDIDO: TStringField;
    qryPedidosCODIGO: TIntegerField;
    qryPedidosDT_ENTREGA: TDateField;
    qryPedidosCLIENTE: TStringField;
    qryPedidosREPRESENTANTE: TStringField;
    qryPedidosTOTAL_PECAS: TBCDField;
    qryPedidosPECAS_FALTAM: TBCDField;
    qryPedidosFALTA: TBCDField;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    Shape1: TShape;
    lbPeriodoSelecionado: TLabel;
    Label1: TLabel;
    lbPedidosFiltrados: TLabel;
    btnPedidosMes: TBitBtn;
    RLReport2: TRLReport;
    RLBand5: TRLBand;
    RLLabel9: TRLLabel;
    RLDraw3: TRLDraw;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel12: TRLLabel;
    rlbPeriodoPedidos: TRLLabel;
    RLBand6: TRLBand;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLBand7: TRLBand;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLBand8: TRLBand;
    RLDBResult5: TRLDBResult;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLDBText9: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText10: TRLDBText;
    RLLabel20: TRLLabel;
    btnNaoDespachados: TBitBtn;
    RLReport3: TRLReport;
    RLBand9: TRLBand;
    RLLabel13: TRLLabel;
    RLDraw5: TRLDraw;
    RLSystemInfo5: TRLSystemInfo;
    RLSystemInfo6: TRLSystemInfo;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLDraw6: TRLDraw;
    RLLabel23: TRLLabel;
    rlbPeriodoPendente: TRLLabel;
    RLBand10: TRLBand;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel29: TRLLabel;
    RLBand11: TRLBand;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText14: TRLDBText;
    RLBand12: TRLBand;
    RLDBResult4: TRLDBResult;
    RLLabel31: TRLLabel;
    dsPendentes: TDataSource;
    qryPendentes: TFDQuery;
    qryPendentesNUMPEDIDO: TStringField;
    qryPendentesCODIGO: TIntegerField;
    qryPendentesDT_ENTREGA: TDateField;
    qryPendentesCLIENTE: TStringField;
    qryPendentesTOTAL_PECAS: TBCDField;
    qryPendentesPECAS_FALTAM: TBCDField;
    RLPDFFilter1: TRLPDFFilter;
    rgpFiltroTipoPedido: TRadioGroup;
    GroupBox1: TGroupBox;
    rbtFabrica: TRadioButton;
    rbtEcommerce: TRadioButton;
    Image1: TImage;
    Image2: TImage;
    btnBuscar: TSpeedButton;
    Shape2: TShape;
    lbPeriodoSelecionado2: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure RLDBText4BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
    procedure btnTotaisMesClick(Sender: TObject);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure LabelClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnPedidosMesClick(Sender: TObject);
    procedure LabelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure LabelMouseLeave(Sender: TObject);
    procedure RLReport2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure btnNaoDespachadosClick(Sender: TObject);
    procedure RLReport3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rgpFiltroTipoPedidoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FBuscando :Boolean;
    FPanelSelecionado :TPanel;

    function trataData(data :String):String;
    function trataDataRelatorio(data :String):String;
    function trataDataDatePicker(data: String; var dtInicio, dtFim :TDate):TDate;
    function montaSql :String;
    function montaSqlPendentes :String;
    function montaSqlPedidos :String;

    procedure filtraPorTag(TAG :integer);
    procedure mostraInformacoes;
    procedure criaObjetosNaTela;
    procedure destroiComponentes;
  public
    { Public declarations }
  end;

var
  frmPedidosEmAberto: TfrmPedidosEmAberto;

implementation

uses DateTimeUtilitario, uModulo, System.StrUtils;

{$R *.dfm}

procedure TfrmPedidosEmAberto.btnSairClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmPedidosEmAberto.criaObjetosNaTela;
var Panel          :TPanel;
    lbTitulo       :TLabel;
    lbPedNormais   :TLabel;
    lbPedParciais  :TLabel;
    lbPedTotal     :TLabel;
    edtPedNormais  :TCurrencyEdit;
    edtPedParciais :TCurrencyEdit;
    dtInicial      :TDateTimePicker;
    dtFinal        :TDateTimePicker;
    data :String;
    dtInicio, dtFim :TDate;
begin
  Panel                := TPanel.Create(flpMeses);
  Panel.Parent         := flpMeses;
  Panel.Height         := 95;
  Panel.Width          := 203;
  Panel.Padding.Left   := 5;
  Panel.Padding.Top    := 5;
  Panel.Padding.Right  := 5;
  Panel.Padding.Bottom := 5;
  Panel.BevelOuter     := bvNone;
  Panel.Color          := clWhite;
  //usado posteriormente para encontrar o dateTimePicker de inicio e fim
  Panel.Tag            := qry.RecNo - 1;

  trataDataDatePicker(qryDATA.AsString, dtInicio, dtFim);

  dtInicial              := TDateTimePicker.Create(Panel);
  dtInicial.Parent       := Panel;
  dtInicial.DateTime     := dtInicio;
  dtInicial.Visible      := false;
  dtInicial.Name         := 'dtIni'+intToStr(qry.RecNo - 1);

  dtFinal                := TDateTimePicker.Create(Panel);
  dtFinal.Parent         := Panel;
  dtFinal.DateTime       := dtFim;
  dtFinal.Visible        := false;
  dtFinal.Name           := 'dtFim'+intToStr(qry.RecNo - 1);

  lbPedTotal             := TLabel.Create(Panel);
  lbPedTotal.Parent      := Panel;
  lbPedTotal.AutoSize    := false;
  lbPedTotal.Align       := alTop;
  lbPedTotal.Alignment   := taRightJustify;
  lbPedTotal.Height      := 20;
  lbPedTotal.Caption     := IntToStr(qryPARCIAIS.AsInteger + qryNORMAIS.AsInteger)+'    ';
  lbPedTotal.Font.Name   := 'Segoe Ui';
  lbPedTotal.Font.Style  := [fsBold];
  lbPedTotal.Font.Size   := 10;
  lbPedTotal.Transparent := false;
  lbPedTotal.Color       := $00EEEEEE;

  lbPedParciais             := TLabel.Create(Panel);
  lbPedParciais.Parent      := Panel;
  lbPedParciais.AutoSize    := false;
  lbPedParciais.Align       := alTop;
  lbPedParciais.Height      := 22;
  lbPedParciais.Caption     := '  PEDIDOS PARCIAIS';
  lbPedParciais.Font.Name   := 'Calibri';
  lbPedParciais.Font.Size   := 10;
  lbPedParciais.Transparent := false;
  lbPedParciais.Color       := $00F8F8F8;
  lbPedParciais.Layout      := tlCenter;
  lbPedParciais.Tag         := 0;//indice do radiogroup filtrotipopedido
  lbPedParciais.OnClick     := LabelClick;
  lbPedParciais.OnMouseMove  := LabelMouseMove;
  lbPedParciais.OnMouseLeave := LabelMouseLeave;

  lbPedNormais             := TLabel.Create(Panel);
  lbPedNormais.Parent      := Panel;
  lbPedNormais.AutoSize    := false;
  lbPedNormais.Align       := alTop;
  lbPedNormais.Height      := 22;
  lbPedNormais.Caption     := '  PEDIDOS À SEPARAR';
  lbPedNormais.Font.Name   := 'Calibri';
  lbPedNormais.Font.Size   := 10;
  lbPedNormais.Transparent := false;
  lbPedNormais.Color       := $00F8F8F8;
  lbPedNormais.Layout      := tlCenter;
  lbPedNormais.Tag         := 1;//indice do radiogroup filtrotipopedido
  lbPedNormais.OnClick     := LabelClick;
  lbPedNormais.OnMouseMove  := LabelMouseMove;
  lbPedNormais.OnMouseLeave := LabelMouseLeave;

  data := TrataData(qryDATA.AsString);

  lbTitulo              := TLabel.Create(Panel);
  lbTitulo.Parent       := Panel;
  lbTitulo.AutoSize     := false;
  lbTitulo.Align        := alTop;
  lbTitulo.Alignment    := taCenter;
  lbTitulo.Height       := 22;
  lbTitulo.Caption      := data;
  lbTitulo.Font.Name    := 'Segoe UI';
  lbTitulo.Font.Size    := 10;
  lbTitulo.Font.Style   := [fsBold];
  lbTitulo.Transparent  := false;
  lbTitulo.Color        := $00D7EAB0;
  lbTitulo.OnClick      := LabelClick;
  lbTitulo.OnMouseMove  := LabelMouseMove;
  lbTitulo.OnMouseLeave := LabelMouseLeave;
  lbTitulo.Tag          := 2;//indice do radiogroup filtrotipopedido

  if qry.RecNo = 1 then
    LabelClick(lbTitulo);

  edtPedNormais               := TCurrencyEdit.Create(Panel);
  edtPedNormais.Parent        := Panel;
  edtPedNormais.AutoSize      := false;
  edtPedNormais.Height        := 19;
  edtPedNormais.Width         := 50;
  edtPedNormais.Top           := 29;
  edtPedNormais.Left          := 136;
  edtPedNormais.Value         := qryNORMAIS.Value;
  edtPedNormais.Font.Name     := 'Segoe UI';
  edtPedNormais.Font.Size     := 10;
  edtPedNormais.Font.Style    := [fsBold];
  edtPedNormais.BorderStyle   := bsNone;
  edtPedNormais.DisplayFormat := '0';
  edtPedNormais.Color         := $00F8F8F8;
  edtPedNormais.Enabled       := false;

  edtPedParciais               := TCurrencyEdit.Create(Panel);
  edtPedParciais.Parent        := Panel;
  edtPedParciais.AutoSize      := false;
  edtPedParciais.Height        := 19;
  edtPedParciais.Width         := 50;
  edtPedParciais.Top           := 50;
  edtPedParciais.Left          := 136;
  edtPedParciais.Value         := qryPARCIAIS.Value;
  edtPedParciais.Font.Name     := 'Segoe UI';
  edtPedParciais.Font.Size     := 10;
  edtPedParciais.Font.Style    := [fsBold];
  edtPedParciais.BorderStyle   := bsNone;
  edtPedParciais.DisplayFormat := '0';
  edtPedParciais.Color         := $00F8F8F8;
  edtPedParciais.Enabled       := false;
end;

procedure TfrmPedidosEmAberto.destroiComponentes;
var i :integer;
begin
  for i := flpMeses.ComponentCount-1 downto 0 do
    flpMeses.Components[i].Destroy;
end;

procedure TfrmPedidosEmAberto.filtraPorTag(TAG: integer);
var dtpIni :TDateTimePicker;
    dtpFim :TDateTimePicker;
begin
   dtpIni := TDateTimePicker(FPanelSelecionado.FindComponent('dtIni'+IntToStr(FPanelSelecionado.Tag)));
   dtpFim := TDateTimePicker(FPanelSelecionado.FindComponent('dtFim'+IntToStr(FPanelSelecionado.tag)));

   qryPedidos.Close;
   qryPedidos.SQL.Text := montaSqlPedidos;
   qryPedidos.ParamByName('dti').AsDateTime := dtpIni.DateTime;
   qryPedidos.ParamByName('dtf').AsDateTime := dtpFim.DateTime;
   qryPedidos.Open;

   lbPeriodoSelecionado.Caption := DateToStr(dtpIni.Date) + ' a ' + DateToStr(dtpFim.Date);
   lbPedidosFiltrados.Caption   := intToStr(qryPedidos.RecordCount);
end;

procedure TfrmPedidosEmAberto.btnTotaisMesClick(Sender: TObject);
begin
  RLReport1.PreviewModal;
end;

procedure TfrmPedidosEmAberto.btnAnteriorClick(Sender: TObject);
var tag, i :integer;
begin
  tag := FPanelSelecionado.Tag;

  dec(tag);
  if tag < 0 then
    tag := qry.RecordCount - 1;

  for i := flpMeses.ComponentCount-1 downto 0 do
    if TPanel(flpMeses.Components[i]).Tag = tag then
    begin
      FPanelSelecionado := TPanel(flpMeses.Components[i]);
      break;
    end;

  filtraPorTag(tag);
end;

procedure TfrmPedidosEmAberto.btnBuscarClick(Sender: TObject);
begin
  try
    FBuscando := true;
    pgPedidos.ActivePageIndex := 0;
    FPanelSelecionado    := nil;
    qryPedidos.Close;
    lbPeriodoSelecionado.Caption := '< Período selecionado >';
    lbPedidosFiltrados.Caption := '0';

    qry.Close;
    qry.SQL.Text := montaSql;
    qry.ParamByName('dti').AsDate := Periodo1.dataInicial;
    qry.ParamByName('dtf').AsDate := Periodo1.dataFinal;
    qry.Open;

    destroiComponentes;
    mostraInformacoes;

    btnTotaisMes.Enabled  := not qry.IsEmpty;
    btnPedidosMes.Enabled := not qry.IsEmpty;
    btnNaoDespachados.Enabled := not qry.IsEmpty;
  finally
    FBuscando := false;
  end;
end;

procedure TfrmPedidosEmAberto.btnNaoDespachadosClick(Sender: TObject);
begin
  inherited;
  qryPendentes.Close;
  qryPendentes.SQL.Text := montaSqlPendentes;
  qryPendentes.ParamByName('dti').AsDateTime := Periodo1.dataInicial;
  qryPendentes.ParamByName('dtf').AsDateTime := Periodo1.dataFinal;
  qryPendentes.Open;

  if qryPendentes.IsEmpty then
    avisar('Não foram encontrados pedidos ( '+IfThen(rbtFabrica.Checked, 'Fábrica', 'E-Commerce')+' ) pendentes no período informado')
  else
    RLReport3.PreviewModal;
end;

procedure TfrmPedidosEmAberto.btnPedidosMesClick(Sender: TObject);
begin
  inherited;
  RLReport2.PreviewModal;
end;

procedure TfrmPedidosEmAberto.btnProximoClick(Sender: TObject);
var tag, i :integer;
begin
  tag := FPanelSelecionado.Tag;
  inc(tag);
  if tag = qry.RecordCount then
    tag := 0;

  for i := flpMeses.ComponentCount-1 downto 0 do
    if TPanel(flpMeses.Components[i]).Tag = tag then
    begin
      FPanelSelecionado := TPanel(flpMeses.Components[i]);
      break;
    end;

  filtraPorTag(tag);
end;

procedure TfrmPedidosEmAberto.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Connection := fdm.conexao;
  qryPedidos.Connection := fdm.conexao;
  qryPendentes.Connection := fdm.conexao;
  Periodo1.dataInicial  := Date - 90;
  Periodo1.dataFinal    := EndOfTheMonth(Date);
end;

procedure TfrmPedidosEmAberto.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
    btnBuscar.Click;

  inherited;
end;

procedure TfrmPedidosEmAberto.FormShow(Sender: TObject);
begin
  btnBuscar.Click;
end;

procedure TfrmPedidosEmAberto.LabelMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clBlack;
end;

procedure TfrmPedidosEmAberto.LabelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  TLabel(Sender).Font.Color := $000080FF;
end;

procedure TfrmPedidosEmAberto.LabelClick(Sender: TObject);
begin
  FPanelSelecionado := TPanel(TLabel(Sender).Parent);
  filtraPorTag(FPanelSelecionado.Tag);
  if not FBuscando then
    pgPedidos.ActivePageIndex := 1;

  rgpFiltroTipoPedido.ItemIndex := TLabel(Sender).Tag;
end;

function TfrmPedidosEmAberto.montaSql: String;
var condicaoEcommerce :String;
begin
  if rbtFabrica.Checked then
    condicaoEcommerce := ' and ( (dr.codigo is null) or (dr.rep_ecommerce <> ''S'')) '
  else
    condicaoEcommerce := ' and ( dr.rep_ecommerce = ''S'') ';

  result := 'select count(P.codigo) total, sum(iif(position(''-'' in P.numpedido) >0, 1, 0)) parciais,                              '+
            ' sum(iif(position(''-'' in P.numpedido) = 0, 1, 0)) normais,                                                           '+
            ' LPAD(extract(month from P.dt_limite_entrega),2,''0'')||''/''||extract(year from P.dt_limite_entrega) data,            '+
            ' MAX(P.dt_limite_entrega) MAXIMA                                                                                       '+
            '   from (                                                                                                              '+
            '          SELECT PED.numpedido, PED.codigo, PED.dt_limite_entrega FROM PEDIDOS PED                                     '+
            '          left join pedidos_faturados pf on pf.codigo_pedido = ped.codigo                                              '+
            '          left join dados_representante dr on dr.codigo_representante = ped.cod_repres                                 '+
            '          left join clientes          c   on c.codcli = ped.cod_cliente                                                '+
            '          where (pf.codigo is null) and (PED.dt_limite_entrega BETWEEN :DTI AND :DTF) AND not (ped.despachado = ''S'') '+
            '            and ((c.funcionario is null)or(c.funcionario <> ''S'')) '+ condicaoEcommerce + ' ) P                                                                                                           '+
            ' group by data                                                                                                         '+
            ' ORDER BY MAXIMA                                                                                                       ';
end;

function TfrmPedidosEmAberto.montaSqlPedidos: String;
var condicaoEcommerce :String;
begin
  if rbtFabrica.Checked then
    condicaoEcommerce := ' and ( (dr.codigo is null) or (dr.rep_ecommerce <> ''S'')) '
  else
    condicaoEcommerce := ' and ( dr.rep_ecommerce = ''S'') ';

  result := 'select P.numpedido, p.CODIGO, p.DT_ENTREGA, P.CLIENTE, P.REPRESENTANTE, P.TOTAL_PECAS,                                 '+
            ' (P.TOTAL_PECAS - iif(P.PECAS_FALTAM is null, 0, P.PECAS_FALTAM)) PECAS_FALTAM,                                        '+
            ' (((P.TOTAL_PECAS - iif(P.PECAS_FALTAM is null, 0, P.PECAS_FALTAM)) * 100)/P.TOTAL_PECAS) FALTA                        '+
            ' from (                                                                                                                '+
            '        SELECT PED.numpedido, PED.codigo, PED.dt_limite_entrega DT_ENTREGA,cli.razao CLIENTE, rep.razao REPRESENTANTE, '+
            '        SUM(i.qtd_total) TOTAL_PECAS,                                                                                  '+
            '        SUM(ci.qtd_rn + ci.qtd_p + ci.qtd_m + ci.qtd_g + ci.qtd_1 + ci.qtd_2 + ci.qtd_3 + ci.qtd_4                     '+
            '            + ci.qtd_6 + ci.qtd_8 + ci.qtd_10 + ci.qtd_12 + ci.qtd_14 + ci.qtd_unica) PECAS_FALTAM                     '+
            '        FROM PEDIDOS PED                                                                                               '+
            '        left join pedidos_faturados pf on pf.codigo_pedido = ped.codigo                                                '+
            '        left join itens             i   on i.cod_pedido = ped.codigo                                                   '+
            '        left join conferencia_itens ci  on ci.codigo_item = i.codigo                                                   '+
            '        left join pessoas           cli on cli.codigo = ped.cod_cliente                                                '+
            '        left join pessoas           rep on rep.codigo = ped.cod_repres                                                 '+
            '        left join dados_representante dr on dr.codigo_representante = rep.codigo                                       '+
            '        left join clientes          c   on c.codcli = cli.codigo                                                       '+
            '        where (pf.codigo is null) and (PED.dt_limite_entrega BETWEEN :DTI AND :DTF) AND not (ped.despachado = ''S'')   '+
            '          and ((c.funcionario is null)or(c.funcionario <> ''S'')) '+ condicaoEcommerce +
            '        group by PED.numpedido, PED.codigo, PED.dt_limite_entrega, cli.razao, rep.razao                                '+
            '        order by PED.codigo                                                                                            '+
            '        ) P                                                                                                            '+
            ' order by p.dt_entrega                                                                                                 ';

end;

function TfrmPedidosEmAberto.montaSqlPendentes: String;
var condicaoEcommerce :String;
begin
  if rbtFabrica.Checked then
    condicaoEcommerce := ' and ( (dr.codigo is null) or (dr.rep_ecommerce <> ''S'')) '
  else
    condicaoEcommerce := ' and ( dr.rep_ecommerce = ''S'') ';

  result := 'select P.numpedido, p.CODIGO, p.DT_ENTREGA, P.CLIENTE, P.TOTAL_PECAS,                                                   '+
            ' (P.TOTAL_PECAS - iif(P.PECAS_FALTAM is null, 0, P.PECAS_FALTAM)) PECAS_FALTAM                                          '+
            '   from (                                                                                                               '+
            '          SELECT PED.numpedido, PED.codigo, PED.dt_limite_entrega DT_ENTREGA,cli.razao CLIENTE,                         '+
            '          SUM(i.qtd_total) TOTAL_PECAS,                                                                                 '+
            '          SUM(ci.qtd_rn + ci.qtd_p + ci.qtd_m + ci.qtd_g + ci.qtd_1 + ci.qtd_2 + ci.qtd_3 + ci.qtd_4                    '+
            '              + ci.qtd_6 + ci.qtd_8 + ci.qtd_10 + ci.qtd_12 + ci.qtd_14 + ci.qtd_unica) PECAS_FALTAM                    '+
            '           FROM PEDIDOS PED                                                                                             '+
            '           left join pedidos_faturados pf on pf.codigo_pedido = ped.codigo                                              '+
            '           left join itens             i   on i.cod_pedido = ped.codigo                                                 '+
            '           left join conferencia_itens ci  on ci.codigo_item = i.codigo                                                 '+
            '           left join pessoas           cli on cli.codigo = ped.cod_cliente                                              '+
            '           left join pessoas           rep on rep.codigo = ped.cod_repres                                               '+
            '           left join dados_representante dr on dr.codigo_representante = rep.codigo                                     '+
            '           left join clientes          c   on c.codcli = cli.codigo                                                     '+
            '           where (pf.codigo is null) and (PED.dt_limite_entrega BETWEEN :DTI AND :DTF) AND not (ped.despachado = ''S'') '+
            '             and ((c.funcionario is null)or(c.funcionario <> ''S'')) '+ condicaoEcommerce +
            '           group by PED.numpedido, PED.codigo, PED.dt_limite_entrega, cli.razao, rep.razao                              '+
            '           order by PED.codigo                                                                                          '+
            '         ) P                                                                                                            '+
            ' where ((P.TOTAL_PECAS - iif(P.PECAS_FALTAM is null, 0, P.PECAS_FALTAM)) = 0)                                           '+
            ' order by p.dt_entrega                                                                                                  ';
end;

procedure TfrmPedidosEmAberto.mostraInformacoes;
var nLinhas :smallInt;
begin
  nLinhas := trunc(qry.RecordCount / 4);
  if (qry.RecordCount mod 4) > 0 then
    inc(nLinhas);

  flpMeses.Height := 100 * nLinhas;

  qry.First;
  while not qry.Eof do
  begin
    criaObjetosNaTela;
    qry.Next;
  end;
end;

procedure TfrmPedidosEmAberto.rgpFiltroTipoPedidoClick(Sender: TObject);
var filtro :String;
begin
  try
    case rgpFiltroTipoPedido.ItemIndex of
      0 : filtro := 'NUMPEDIDO LIKE ''%-%''';
      1 : filtro := 'NOT NUMPEDIDO LIKE ''%-%''';
      2 : filtro := '';
    end;

    qryPedidos.Filtered := false;

    if filtro.IsEmpty then
      exit;

    qryPedidos.Filter   := filtro;
    qryPedidos.Filtered := true;
  finally
     lbPedidosFiltrados.Caption   := intToStr(qryPedidos.RecordCount);
  end;
end;

procedure TfrmPedidosEmAberto.RLDBText4BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  text := trataDataRelatorio(text);
end;

procedure TfrmPedidosEmAberto.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  rlbPeriodo.Caption := DateToStr(Periodo1.dataInicial) + ' a ' + DateToStr(Periodo1.dataFinal);
end;

procedure TfrmPedidosEmAberto.RLReport2BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;
  rlbPeriodoPedidos.Caption := lbPeriodoSelecionado.Caption;
end;

procedure TfrmPedidosEmAberto.RLReport3BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  rlbPeriodoPendente.Caption := DateToStr(Periodo1.dataInicial)+' a '+DateToStr(Periodo1.dataFinal);
end;

function TfrmPedidosEmAberto.trataData(data: String): String;
var mes :String;
begin
  mes := TDateTimeUtilitario.mes_extenso(StrToInt(copy(data,1,2)));

  result := mes + copy(data,3,5);

  if qry.RecordCount = 1 then
     result := copy(qry.ParamByName('dti').AsString,1,2) +' a '+
               copy(qry.ParamByName('dtf').AsString,1,2) +' de '+result
  else if (qry.RecNo = 1) then
     result := copy(qry.ParamByName('dti').AsString,1,2) +'/'+ result
  else if (qry.RecNo = qry.RecordCount) then
     result := copy(qry.ParamByName('dtf').AsString,1,2) +'/'+ result;

end;

function TfrmPedidosEmAberto.trataDataDatePicker(data: String; var dtInicio, dtFim :TDate): TDate;
var ultimoDia :String;
    primeiroDia :String;
    dataPedidos :TDateTime;
begin
  dataPedidos := StrToDate('01/'+data);
  primeiroDia := '01/';
  ultimoDia   := FormatDateTime('dd', EndOfTheMonth(dataPedidos))+'/';
  dtInicio := StrToDateTime(primeiroDia+data+' 00:00:00');
  dtFim    := StrToDateTime(ultimoDia+data+' 23:59:59');

  if qry.RecordCount = 1 then
  begin
     dtInicio := StrToDateTime(copy(qry.ParamByName('dti').AsString,1,3)+data+' 00:00:00');
     dtFim    := StrToDateTime(copy(qry.ParamByName('dtf').AsString,1,3)+data+' 23:59:59');
  end
  else if (qry.RecNo = 1) then
     dtInicio := StrToDateTime(copy(qry.ParamByName('dti').AsString,1,3)+data+' 00:00:00')
  else if (qry.RecNo = qry.RecordCount) then
     dtFim    := StrToDateTime(copy(qry.ParamByName('dtf').AsString,1,3)+data+' 23:59:59');
end;

function TfrmPedidosEmAberto.trataDataRelatorio(data: String): String;
var dataPedidos :TDateTime;
    ultimoDia   :String;
    primeiroDia :String;
begin
  dataPedidos := StrToDate('01/'+data);
  primeiroDia := '01/';
  ultimoDia   := FormatDateTime('dd', EndOfTheMonth(dataPedidos))+'/';

  result := TDateTimeUtilitario.mes_extenso(StrToInt(copy(data,1,2)));
  result := result + copy(data,3,5);

  if qry.RecordCount = 1 then
  begin
     primeiroDia := copy(qry.ParamByName('dti').AsString,1,2)+'/';
     ultimoDia   := copy(qry.ParamByName('dtf').AsString,1,2)+'/';
  end
  else if (qry.RecNo = 1) then
     primeiroDia := copy(qry.ParamByName('dti').AsString,1,2)+'/'
  else if (qry.RecNo = qry.RecordCount) then
     ultimoDia   := copy(qry.ParamByName('dtf').AsString,1,2)+'/';

  result := primeiroDia + result +' a '+ ultimoDia + result;
end;

end.
