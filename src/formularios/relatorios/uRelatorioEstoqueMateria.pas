unit uRelatorioEstoqueMateria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, RLReport, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frameBuscaMateria, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmRelatorioEstoqueMateria = class(TfrmPadrao)
    Panel1: TPanel;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    BuscaMateria1: TBuscaMateria;
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
    RLBand7: TRLBand;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel14: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    qryMateriaCODIGO: TIntegerField;
    qryMateriaDESCRICAO: TStringField;
    qryMateriaCOD_NCM: TStringField;
    qryMateriaPRECO_CUSTO: TBCDField;
    qryMateriaPRECO_VENDA: TBCDField;
    qryMateriaESTOQUE_FISICO: TBCDField;
    qryMateriaESTOQUE_MINIMO: TBCDField;
    qryMateriaUNIDADE: TStringField;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    procedure montaSql;
  public
    { Public declarations }
  end;

var
  frmRelatorioEstoqueMateria: TfrmRelatorioEstoqueMateria;

implementation

{$R *.dfm}

procedure TfrmRelatorioEstoqueMateria.btnImprimirClick(Sender: TObject);
begin
  montaSql;

  if qryMateria.IsEmpty then
    avisar('Nenhum registro foi encontrado utilizando os filtros informados')
  else
    RLReport1.PreviewModal;
end;

procedure TfrmRelatorioEstoqueMateria.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( (ssCtrl in Shift) AND (Key = ord('P')) ) then
    btnImprimir.Click
  else if key = VK_ESCAPE then
    btnSair.Click;

  inherited;
end;

procedure TfrmRelatorioEstoqueMateria.montaSql;
begin
  qryMateria.Close;
  qryMateria.SQL.Text := ' select m.* from materias m       '+
                         ' where m.controla_estoque = ''S'' ';

  if assigned(BuscaMateria1.Materia) then
  begin
    qryMateria.SQL.Add( ' and m.codigo = :codigo ' );
    qryMateria.ParamByName('codigo').AsInteger := BuscaMateria1.Materia.codigo;
  end;

  qryMateria.SQL.Add(' order by m.descricao ');
  qryMateria.Open();
end;

procedure TfrmRelatorioEstoqueMateria.RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if TRLBand(Sender).Color = clwhite then
    TRLBand(Sender).Color := $00F0F0F0
  else
    TRLBand(Sender).Color := clwhite;
end;

end.
