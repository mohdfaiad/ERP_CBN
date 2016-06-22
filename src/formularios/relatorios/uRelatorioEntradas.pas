unit uRelatorioEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, RLReport, DB,
  Provider, DBClient,
  ComCtrls, Grids, DBGrids, ACBrNFe, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, RLFilters, RLPDFFilter;

type
  TfrmRelatorioEntradas = class(TfrmPadrao)
    Panel1: TPanel;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    DataSource1: TDataSource;
    cds: TClientDataSet;
    cdsDATA_PRODUCAO: TDateField;
    cdsCODIGO_PRODUTO: TIntegerField;
    cdsREFERENCIA: TStringField;
    cdsDESCRICAO: TStringField;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    RLReport1: TRLReport;
    RLBand4: TRLBand;
    RLDraw1: TRLDraw;
    RLLabel13: TRLLabel;
    cdsINTERVALO1: TIntegerField;
    cdsINTERVALO2: TIntegerField;
    cdsINTERVALO3: TIntegerField;
    cdsINTERVALO4: TIntegerField;
    cdsINTERVALO5: TIntegerField;
    cdsINTERVALO6: TIntegerField;
    cdsINTERVALO7: TIntegerField;
    cdsINTERVALO8: TIntegerField;
    cdsINTERVALO9: TIntegerField;
    cdsINTERVALO10: TIntegerField;
    rlbperiodo: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel4: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel5: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    cdsTOTAL_INTERVALOS: TIntegerField;
    RLGroup1: TRLGroup;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText2: TRLDBText;
    lbDataExtenso: TRLLabel;
    RLBand3: TRLBand;
    RLDraw5: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw12: TRLDraw;
    RLDraw18: TRLDraw;
    memIntervalo1: TRLMemo;
    memIntervalo2: TRLMemo;
    memIntervalo5: TRLMemo;
    memIntervalo3: TRLMemo;
    memIntervalo4: TRLMemo;
    memIntervalo8: TRLMemo;
    memIntervalo6: TRLMemo;
    memIntervalo7: TRLMemo;
    memIntervalo10: TRLMemo;
    memIntervalo9: TRLMemo;
    RLBand5: TRLBand;
    RLDraw16: TRLDraw;
    RLDraw15: TRLDraw;
    RLDraw14: TRLDraw;
    RLDraw13: TRLDraw;
    RLDraw11: TRLDraw;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLDBResult7: TRLDBResult;
    RLDBResult8: TRLDBResult;
    RLDBResult9: TRLDBResult;
    RLDBResult10: TRLDBResult;
    RLLabel3: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBResult24: TRLDBResult;
    RLDBResult21: TRLDBResult;
    RLBand2: TRLBand;
    RLDraw10: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw6: TRLDraw;
    RLDraw17: TRLDraw;
    RLDBText1: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText14: TRLDBText;
    cdsTOTAL_PECAS: TIntegerField;
    cdsPECAS: TIntegerField;
    RLDBResult26: TRLDBResult;
    RLDraw19: TRLDraw;
    RLLabel8: TRLLabel;
    RLDraw20: TRLDraw;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    qry: TFDQuery;
    qryIntervalos: TFDQuery;
    qryDATA_PRODUCAO: TDateField;
    qryCODIGO_PRODUTO: TIntegerField;
    qryREFERENCIA: TStringField;
    qryDESCRICAO: TStringField;
    qryCODIGO_INTERVALO: TIntegerField;
    qryDT_LANCAMENTO: TDateField;
    qryQUANTIDADE: TFloatField;
    qryPECAS: TIntegerField;
    qryIntervalosCODIGO: TIntegerField;
    qryIntervalosHORA_INICIO: TTimeField;
    qryIntervalosHORA_FIM: TTimeField;
    cdsTOT_ITVLO1: TAggregateField;
    cdsTOT_ITVLO2: TAggregateField;
    cdsTOT_ITVLO3: TAggregateField;
    cdsTOT_ITVLO4: TAggregateField;
    cdsTOT_ITVLO5: TAggregateField;
    cdsTOT_ITVLO6: TAggregateField;
    cdsTOT_ITVLO7: TAggregateField;
    cdsTOT_ITVLO8: TAggregateField;
    cdsTOT_ITVLO9: TAggregateField;
    cdsTOT_ITVLO10: TAggregateField;
    cdsTOT_ITVLO_TOTAIS: TAggregateField;
    cdsTOT_PECAS_TOTAIS: TAggregateField;
    RLBand6: TRLBand;
    RLLabel2: TRLLabel;
    RLDBResult11: TRLDBResult;
    RLDBResult12: TRLDBResult;
    RLDBResult13: TRLDBResult;
    RLDBResult14: TRLDBResult;
    RLDBResult15: TRLDBResult;
    RLDBResult16: TRLDBResult;
    RLDBResult17: TRLDBResult;
    RLDBResult18: TRLDBResult;
    RLDBResult19: TRLDBResult;
    RLDBResult20: TRLDBResult;
    RLDBResult22: TRLDBResult;
    RLDBResult23: TRLDBResult;
    RLLabel6: TRLLabel;
    RLDBResult25: TRLDBResult;
    RLLabel9: TRLLabel;
    RLBand7: TRLBand;
    TOT_ITVLO1: TRLLabel;
    TOT_ITVLO2: TRLLabel;
    TOT_ITVLO3: TRLLabel;
    TOT_ITVLO4: TRLLabel;
    TOT_ITVLO5: TRLLabel;
    TOT_ITVLO6: TRLLabel;
    TOT_ITVLO7: TRLLabel;
    TOT_ITVLO8: TRLLabel;
    TOT_ITVLO9: TRLLabel;
    TOT_ITVLO10: TRLLabel;
    RLLabel27: TRLLabel;
    TOT_ITVLO_TOTAIS: TRLLabel;
    TOT_PECAS_TOTAIS: TRLLabel;
    RLLabel30: TRLLabel;
    rlReferencias: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RLDBText2BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure dtpInicioExit(Sender: TObject);
    procedure dtpFimExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RLDBResult1BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure cdsCalcFields(DataSet: TDataSet);
    procedure FormDblClick(Sender: TObject);
    procedure RLDBResult11BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBResult12BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBResult13BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBResult14BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBResult15BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBResult16BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBResult17BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBResult18BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBResult19BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBResult20BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBResult22BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBResult23BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure TOT_ITVLO1BeforePrint(Sender: TObject; var Text: string;
      var PrintIt: Boolean);
    procedure rlReferenciasBeforePrint(Sender: TObject; var Text: string;
      var PrintIt: Boolean);
    procedure btnSairClick(Sender: TObject);
  private
    FAcbrNfe: TACBrNFe;

    function montaSQL :String;
    procedure agrupa_itens;
  public
    { Public declarations }
  end;

var
  frmRelatorioEntradas: TfrmRelatorioEntradas;

implementation

uses DateTimeUtilitario, Math, StrUtils;

{$R *.dfm}

procedure TfrmRelatorioEntradas.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorioEntradas.btnImprimirClick(Sender: TObject);
begin

  qry.Close;
  qry.SQL.Text := montaSQL;
  qry.ParamByName('dti').AsDateTime := dtpInicio.DateTime;
  qry.ParamByName('dtf').AsDateTime := dtpFim.DateTime;
  qry.Open;

  if qry.IsEmpty then
    avisar('Não foram encontrados registros referentes ao período informado')
  else begin
    cds.EmptyDataSet;
    agrupa_itens;
    RLReport1.PreviewModal;
  end;

end;

function TfrmRelatorioEntradas.montaSQL: String;
begin

  result := 'select es.data_producao, es.codigo_produto, pro.referencia, pro.descricao, es.codigo_intervalo,  '+
            ' Max(es.data_lancamento) dt_lancamento, SUM(es.quantidade) quantidade, MAX(pro.qtd_pecas) pecas  '+
            '               from entradas_saidas es                                                           '+
            'inner join produtos pro on pro.codigo = es.codigo_produto                                        '+
            'where es.tipo = ''E'' and (es.data_producao between :dti and :dtf)                               '+
            'group by es.data_producao, es.codigo_produto, pro.referencia, pro.descricao, es.codigo_intervalo '+
            'order by es.data_producao, es.codigo_produto, pro.referencia, pro.descricao, es.codigo_intervalo';
end;

procedure TfrmRelatorioEntradas.FormShow(Sender: TObject);
var rlmemo :TRLMemo;
begin
  dtpInicio.DateTime := strToDateTime( formatDateTime('dd/mm/yyyy 00:00:00', date) );
  dtpFim.DateTime    := strToDateTime( formatDateTime('dd/mm/yyyy 23:59:59', date) );

  cds.CreateDataSet;
  qryIntervalos.Close;
  qryIntervalos.Open;

  while not qryIntervalos.Eof do begin

    rlmemo  := TRLMemo(self.FindComponent('memIntervalo'+inttostr(qryIntervalos.RecNo)));

    rlmemo.Lines.Text := FormatDateTime('hh:mm',qryIntervalosHORA_INICIO.AsDateTime) + #13#10 + FormatDateTime('hh:mm',qryIntervalosHORA_FIM.AsDateTime);

    rlmemo.Visible := true;

    qryIntervalos.Next;
  end;
end;

procedure TfrmRelatorioEntradas.RLDBText2BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  lbDataExtenso.Caption :=  '( '+ TDateTimeUtilitario.dia_semana(StrToDate(Text)) +' )';
end;

procedure TfrmRelatorioEntradas.rlReferenciasBeforePrint(Sender: TObject;
  var Text: string; var PrintIt: Boolean);
begin
  Text := inttostr(cds.RecordCount)+ ' Refs.';
end;

procedure TfrmRelatorioEntradas.dtpInicioExit(Sender: TObject);
begin
  if dtpInicio.DateTime > dtpFim.DateTime then
    dtpInicio.DateTime := dtpFim.DateTime;
end;

procedure TfrmRelatorioEntradas.dtpFimExit(Sender: TObject);
begin
  if dtpFim.DateTime < dtpInicio.DateTime then
    dtpFim.DateTime := dtpInicio.DateTime;
end;

procedure TfrmRelatorioEntradas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ( (ssCtrl in Shift) AND (Key = ord('P')) ) then
    btnImprimir.Click
  else if key = vk_escape then
    btnSair.Click;
end;

procedure TfrmRelatorioEntradas.agrupa_itens;
var
  dtproducao :TDateTime;
  codproduto :Integer;
begin
   qry.First;
   while not qry.Eof do begin

     dtproducao := qryDATA_PRODUCAO.AsDateTime;
     codproduto := qryCODIGO_PRODUTO.AsInteger;

     if cds.Locate('DATA_PRODUCAO;CODIGO_PRODUTO', VarArrayOf([dtproducao, codproduto]),[]) then
       cds.Edit
     else begin
       cds.Append;

       cdsDATA_PRODUCAO.AsDateTime := qryDATA_PRODUCAO.AsDateTime;
       cdsCODIGO_PRODUTO.AsInteger := qryCODIGO_PRODUTO.AsInteger;
       cdsREFERENCIA.AsString      := qryREFERENCIA.AsString;
       cdsDESCRICAO.AsString       := copy(qryDESCRICAO.AsString, 1, 15);
       cdsPECAS.AsInteger          := qryPECAS.AsInteger;
     end;

     cds.FieldByName('Intervalo'+qryCODIGO_INTERVALO.AsString).AsInteger := qryQUANTIDADE.AsInteger;

     cds.Post;

     qry.Next;
   end;
end;

procedure TfrmRelatorioEntradas.RLDBResult1BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
   PrintIt := (TRLDBResult(Sender).Value > 0);
end;

procedure TfrmRelatorioEntradas.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rlbperiodo.Caption := FormatDateTime('dd/mm/yyyy',dtpInicio.DateTime) + ' a ' + FormatDateTime('dd/mm/yyyy',dtpFim.DateTime);
end;

procedure TfrmRelatorioEntradas.TOT_ITVLO1BeforePrint(Sender: TObject;
  var Text: string; var PrintIt: Boolean);
begin
   Text     := TAggregatefield( self.FindComponent('cds'+TRLLabel(Sender).Name)).AsString;
end;

procedure TfrmRelatorioEntradas.cdsCalcFields(DataSet: TDataSet);
begin
  if DataSet.State in [dsInsert,dsEdit] then begin
     cdsTOTAL_INTERVALOS.AsInteger := cdsINTERVALO1.AsInteger + cdsINTERVALO2.AsInteger + cdsINTERVALO3.AsInteger +
                                      cdsINTERVALO4.AsInteger + cdsINTERVALO5.AsInteger + cdsINTERVALO6.AsInteger +
                                      cdsINTERVALO7.AsInteger + cdsINTERVALO8.AsInteger + cdsINTERVALO9.AsInteger + cdsINTERVALO10.AsInteger;

     cdsTOTAL_PECAS.AsInteger      := cdsTOTAL_INTERVALOS.AsInteger * cdsPECAS.AsInteger;
  end;
end;

procedure TfrmRelatorioEntradas.FormDblClick(Sender: TObject);
begin
  inherited;
  self.FAcbrNfe := self.FAcbrNfe.Create(self);
  self.FAcbrNfe.NotasFiscais.LoadFromFile('C:\Users\User\Desktop\NFe907.txt');
end;

procedure TfrmRelatorioEntradas.RLDBResult11BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Rllabel10.Caption := Text;
end;

procedure TfrmRelatorioEntradas.RLDBResult12BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Rllabel11.Caption := Text;
end;

procedure TfrmRelatorioEntradas.RLDBResult13BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Rllabel12.Caption := Text;
end;

procedure TfrmRelatorioEntradas.RLDBResult14BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Rllabel16.Caption := Text;
end;

procedure TfrmRelatorioEntradas.RLDBResult15BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Rllabel17.Caption := Text;
end;

procedure TfrmRelatorioEntradas.RLDBResult16BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Rllabel18.Caption := Text;
end;

procedure TfrmRelatorioEntradas.RLDBResult17BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Rllabel19.Caption := Text;
end;

procedure TfrmRelatorioEntradas.RLDBResult18BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Rllabel20.Caption := Text;
end;

procedure TfrmRelatorioEntradas.RLDBResult19BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Rllabel21.Caption := Text;
end;

procedure TfrmRelatorioEntradas.RLDBResult20BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Rllabel22.Caption := Text;
end;

procedure TfrmRelatorioEntradas.RLDBResult22BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Rllabel23.Caption := Text;
end;

procedure TfrmRelatorioEntradas.RLDBResult23BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Rllabel24.Caption := Text;
end;

end.
