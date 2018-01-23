unit uRelatorioMaterias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.Buttons, Vcl.ExtCtrls, framePeriodo, frameBuscaMateria, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, System.StrUtils, Math;

type
  TfrmRelatorioMaterias = class(TfrmPadrao)
    Panel1: TPanel;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    BuscaMateria1: TBuscaMateria;
    Periodo1: TPeriodo;
    qryMateria: TFDQuery;
    dsMateria: TDataSource;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel13: TRLLabel;
    RLLabel18: TRLLabel;
    rlbPeriodo: TRLLabel;
    RLBand7: TRLBand;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel2: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    qryMateriaCODIGO: TIntegerField;
    qryMateriaCODIGO_MATERIA: TIntegerField;
    qryMateriaQUANTIDADE: TBCDField;
    qryMateriaDATA_MOVIMENTO: TSQLTimeStampField;
    qryMateriaTIPO: TStringField;
    qryMateriaDESCRICAO: TStringField;
    qryMateriaESTOQUE_FISICO: TBCDField;
    qryMateriaUNIDADE: TStringField;
    RLDBText4: TRLDBText;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
    procedure Periodo1medFinalExit(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDBText11BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure montaSql;
  public
    { Public declarations }
  end;

var
  frmRelatorioMaterias: TfrmRelatorioMaterias;

implementation

{$R *.dfm}

procedure TfrmRelatorioMaterias.btnImprimirClick(Sender: TObject);
begin
  montaSql;

  if qryMateria.IsEmpty then
    avisar('Nenhum registro foi encontrado utilizando os filtros informados')
  else
    RLReport1.PreviewModal;
end;

procedure TfrmRelatorioMaterias.FormCreate(Sender: TObject);
begin
  inherited;
  BuscaMateria1.ApenasControlaEstoque := true;
end;

procedure TfrmRelatorioMaterias.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( (ssCtrl in Shift) AND (Key = ord('P')) ) then
    btnImprimir.Click
  else if key = VK_ESCAPE then
    btnSair.Click;

  inherited;
end;

procedure TfrmRelatorioMaterias.FormShow(Sender: TObject);
begin
  Periodo1.medInicial.Text := DateToStr(Date);
  Periodo1.medFinal.Text   := DateToStr(Date);
end;

procedure TfrmRelatorioMaterias.montaSql;
var condicaoPeriodo, condicaoMateria :String;
begin
  qryMateria.Close;
  qryMateria.SQL.Text := 'select esm.*, m.descricao, m.estoque_fisico, m.unidade '+
                         ' from entradas_saidas_materia esm                      '+
                         ' inner join materias m on m.codigo = esm.codigo_materia';

  if Periodo1.medInicial.Text <> '  /  /    ' then
  begin
    qryMateria.SQL.Add('where esm.data_movimento between :dti and :dtf ');
    qryMateria.ParamByName('dti').AsDateTime := strToDateTime(Periodo1.medInicial.Text+' 00:01:00');
    qryMateria.ParamByName('dtf').AsDateTime := strToDateTime(Periodo1.medInicial.Text+' 23:59:59');
  end;

  if assigned(BuscaMateria1.Materia) then
  begin
    qryMateria.SQL.Add( IfThen(condicaoPeriodo <> '', ' and ', ' where ')+' esm.codigo_materia = :codmateria');
    qryMateria.ParamByName('codmateria').AsInteger := BuscaMateria1.Materia.codigo;
  end;
  qryMateria.SQL.Add(' order by esm.data_movimento ');
  qryMateria.Open();
end;

procedure TfrmRelatorioMaterias.Periodo1medFinalExit(Sender: TObject);
begin
  inherited;
  Periodo1.medInicialExit(Sender);
  if Periodo1.medFinal.Text = '  /  /    ' then
    Periodo1.medFinal.Text := Periodo1.medInicial.Text;
end;

procedure TfrmRelatorioMaterias.RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if TRLBand(Sender).Color = clwhite then
    TRLBand(Sender).Color := $00F0F0F0
  else
    TRLBand(Sender).Color := clwhite;
end;

procedure TfrmRelatorioMaterias.RLDBText11BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  text := IfThen(Text = 'E', 'ENTRADA', 'SAÍDA');
end;

procedure TfrmRelatorioMaterias.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if Periodo1.medInicial.Text <> '  /  /    ' then
    rlbPeriodo.Caption := Periodo1.medInicial.Text + ' a ' + Periodo1.medFinal.Text
  else
    rlbPeriodo.Caption := '< GERAL >';
end;

end.
