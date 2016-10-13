unit uRelatorioMovimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, RLReport, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.StrUtils;

type
  TfrmRelatorioMovimentos = class(TfrmPadrao)
    Panel1: TPanel;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    gpbPeriodo: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    chkPeriodoGeral: TCheckBox;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    ds: TDataSource;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    qry: TFDQuery;
    qryVP1: TBCDField;
    qryVP2: TBCDField;
    qryVP3: TBCDField;
    qryVP4: TBCDField;
    qryNUMPEDIDO: TStringField;
    qryVALOR_TOTAL: TBCDField;
    qryDESCONTO: TBCDField;
    lbPeriodo: TRLLabel;
    gpbFiltroMoeda: TGroupBox;
    chkDinheiro: TCheckBox;
    chkConvenio: TCheckBox;
    chkCartaoCredito: TCheckBox;
    chkCartaoDebito: TCheckBox;
    RLGroup1: TRLGroup;
    RLBTituloItens: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    rldbDinheiro: TRLDBText;
    rldbConvenio: TRLDBText;
    rldbCartCredito: TRLDBText;
    rldbCartDebito: TRLDBText;
    rldbDesconto: TRLDBText;
    rldbTotal: TRLDBText;
    RLBItens: TRLBand;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    qryREFERENCIA: TStringField;
    qryDESCRICAO: TStringField;
    qryPRECO: TBCDField;
    qryQTD_TOTAL: TBCDField;
    qryPESO: TBCDField;
    qryTOTAL_ITEM: TBCDField;
    RLLabel15: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLBTitulo: TRLBand;
    RLDraw1: TRLDraw;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    rgpLeiaute: TRadioGroup;
    rldPedido: TRLDraw;
    rldDinheiro: TRLDraw;
    rldCC: TRLDraw;
    rldDesconto: TRLDraw;
    qryDATA_HORA: TSQLTimeStampField;
    qryEntSai: TFDQuery;
    StringField1: TStringField;
    SQLTimeStampField1: TSQLTimeStampField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    BCDField3: TBCDField;
    BCDField4: TBCDField;
    BCDField5: TBCDField;
    BCDField6: TBCDField;
    StringField2: TStringField;
    StringField3: TStringField;
    BCDField7: TBCDField;
    BCDField8: TBCDField;
    BCDField9: TBCDField;
    BCDField10: TBCDField;
    dsEntSai: TDataSource;
    RLBand4: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    lbDinheiro: TRLLabel;
    lbConvenio: TRLLabel;
    lbCartCredito: TRLLabel;
    lbCartDebito: TRLLabel;
    lbDesconto: TRLLabel;
    lbTotal: TRLLabel;
    procedure btnImprimirClick(Sender: TObject);
    procedure chkPeriodoGeralClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rldbDinheiroBeforePrint(Sender: TObject; var Text: string;
      var PrintIt: Boolean);
    procedure rldbConvenioBeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
    procedure rldbCartCreditoBeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
    procedure rldbCartDebitoBeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
    procedure rldbDescontoBeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
    procedure rldbTotalBeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure btnSairClick(Sender: TObject);
  private
    FTotalDinheiro :Real;
    FTotalConvenio :Real;
    FTotalCartCredito :Real;
    FTotalCartDebito :Real;
    FTotalDesconto :Real;
    FTotalGeral :Real;

    procedure imprimir;
    procedure montaSql;
  public
    { Public declarations }
  end;

var
  frmRelatorioMovimentos: TfrmRelatorioMovimentos;

implementation

{$R *.dfm}

procedure TfrmRelatorioMovimentos.btnImprimirClick(Sender: TObject);
begin
  imprimir;
end;

procedure TfrmRelatorioMovimentos.btnSairClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TfrmRelatorioMovimentos.chkPeriodoGeralClick(Sender: TObject);
begin
  dtpInicio.Enabled := not chkPeriodoGeral.Checked;
  dtpFim.Enabled    := not chkPeriodoGeral.Checked;
end;

procedure TfrmRelatorioMovimentos.FormShow(Sender: TObject);
begin
  dtpInicio.DateTime      := strToDateTime( DateToStr(Date)+' '+'00:00:00');
  dtpFim.DateTime         := strToDateTime( DateToStr(Date)+' '+'23:59:59');
end;

procedure TfrmRelatorioMovimentos.imprimir;
begin
  FTotalDinheiro    := 0;
  FTotalConvenio    := 0;
  FTotalCartCredito := 0;
  FTotalCartDebito  := 0;
  FTotalDesconto    := 0;
  FTotalGeral       := 0;

  montaSql;

  if qry.IsEmpty then
    avisar('Nenhum registro foi encontrado com os filtros informados.')
  else
    RLReport1.PreviewModal;
end;

procedure TfrmRelatorioMovimentos.montaSql;
var condicaoPeriodo, condicaoTipoMoeda :String;
begin
  condicaoPeriodo   := IfThen(chkPeriodoGeral.Checked,'',' and mov.data between :dti and :dtf ');

  if not(chkDinheiro.Checked) and not(chkConvenio.Checked) and not(chkCartaoCredito.Checked) and not(chkCartaoDebito.Checked) then
    condicaoTipoMoeda := ' mov.tipo_moeda > 0 '
  else
  begin
    condicaoTipoMoeda := IfThen(chkDinheiro.Checked,',1','') +
                         IfThen(chkConvenio.Checked,',2','') +
                         IfThen(chkCartaoCredito.Checked,',3','') +
                         IfThen(chkCartaoDebito.Checked,',4','');
    condicaoTipoMoeda := ' mov.tipo_moeda in (' + copy(condicaoTipoMoeda,2,length(condicaoTipoMoeda)) + ')';
  end;

  qry.Close;
  qry.SQL.Text := 'select ped.numpedido, mov.data data_hora, ped.valor_total, ped.desconto,            '+
                  ' (select mov1.valor_pago from movimentos mov1                                       '+
                  ' where mov1.codigo_pedido = mov.codigo_pedido and mov1.tipo_moeda = 1) VP1,         '+
                  ' (select mov2.valor_pago from movimentos mov2                                       '+
                  ' where mov2.codigo_pedido = mov.codigo_pedido and mov2.tipo_moeda = 2) VP2,         '+
                  ' (select mov3.valor_pago from movimentos mov3                                       '+
                  ' where mov3.codigo_pedido = mov.codigo_pedido and mov3.tipo_moeda = 3) VP3,         '+
                  ' (select mov4.valor_pago from movimentos mov4                                       '+
                  ' where mov4.codigo_pedido = mov.codigo_pedido and mov4.tipo_moeda = 4) VP4,         '+
                  ' pro.referencia, pro.descricao, itn.preco, itn.qtd_total, itn.peso, itn.valor_total total_item '+
                  ' from movimentos mov                                                                '+
                  ' inner join pedidos ped on ped.codigo = mov.codigo_pedido                           '+
                  ' inner join itens    itn on itn.cod_pedido = ped.codigo                             '+
                  ' inner join produtos pro on pro.codigo = itn.cod_produto                            '+
                  ' inner join cores    cor on cor.codigo = itn.cod_cor                                '+
                  ' where ' + condicaoTipoMoeda + condicaoPeriodo;

  if condicaoPeriodo <> '' then
  begin
    qry.ParamByName('dti').AsDateTime := dtpInicio.DateTime;
    qry.ParamByName('dtf').AsDateTime := dtpFim.DateTime;
  end;

  qry.Open;

  lbPeriodo.Caption := IfThen(condicaoPeriodo = '','Período: <Considerando período geral>',
                                                'Período: '+DateToStr(dtpInicio.Date)+' a '+DateToStr(dtpFim.Date));
end;

procedure TfrmRelatorioMovimentos.RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  lbDinheiro.Caption    := formatFloat(' ,0.00; -,0.00', FTotalDinheiro);
  lbConvenio.Caption    := formatFloat(' ,0.00; -,0.00', FTotalConvenio);
  lbCartCredito.Caption := formatFloat(' ,0.00; -,0.00', FTotalCartCredito);
  lbCartDebito.Caption  := formatFloat(' ,0.00; -,0.00', FTotalCartDebito);
  lbDesconto.Caption    := formatFloat(' ,0.00; -,0.00', FTotalDesconto);
  lbTotal.Caption       := formatFloat(' ,0.00; -,0.00', FTotalGeral);
end;

procedure TfrmRelatorioMovimentos.rldbCartCreditoBeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  FTotalCartCredito := FTotalCartCredito + StrToFloatDef(Text,0);
end;

procedure TfrmRelatorioMovimentos.rldbCartDebitoBeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  FTotalCartDebito := FTotalCartDebito + StrToFloatDef(Text,0);
end;

procedure TfrmRelatorioMovimentos.rldbConvenioBeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  FTotalConvenio := FTotalConvenio + StrToFloatDef(Text,0);
end;

procedure TfrmRelatorioMovimentos.rldbDescontoBeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  FTotalDesconto := FTotalDesconto + StrToFloatDef(Text,0);
end;

procedure TfrmRelatorioMovimentos.rldbDinheiroBeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  FTotalDinheiro := FTotalDinheiro + StrToFloatDef(Text,0);
end;

procedure TfrmRelatorioMovimentos.rldbTotalBeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  FTotalGeral := FTotalGeral + StrToFloatDef(Text,0);
end;

procedure TfrmRelatorioMovimentos.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if rgpLeiaute.ItemIndex = 0 then
  begin
    rldPedido.Visible      := false;
    RLBTituloItens.Height  := 20;
    RLBItens.Height        := 0;
    rldDinheiro.Visible    := true;
    rldCC.Visible          := true;
    rldDesconto.Visible    := true;
  end
  else
  begin
    rldPedido.Visible      := true;
    RLBTituloItens.Height  := 39;
    RLBItens.Height       := 20;
    rldDinheiro.Visible    := false;
    rldCC.Visible          := false;
    rldDesconto.Visible    := false;
  end;
end;

end.
