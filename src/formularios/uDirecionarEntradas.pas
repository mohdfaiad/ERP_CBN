unit uDirecionarEntradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, DBGridCBN, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, RxToolEdit, RxCurrEdit, Vcl.ButtonGroup, System.ImageList,
  Vcl.ImgList, RLReport, RLFilters, RLPDFFilter;

type
  TfrmDirecionarEntradas = class(TfrmPadrao)
    gridConsulta: TDBGridCBN;
    qryEntradas: TFDQuery;
    dsEntradas: TDataSource;
    Panel1: TPanel;
    Label6: TLabel;
    edtLote: TCurrencyEdit;
    qryEntradasPRODUTO: TStringField;
    qryEntradasCOR: TStringField;
    qryEntradasTAM: TStringField;
    qryEntradasQUANTIDADE: TSingleField;
    ImageList1: TImageList;
    qryEntradasDIRECIONADA: TStringField;
    qryDireciona: TFDQuery;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    qryDirecionadas: TFDQuery;
    dsDirecionadas: TDataSource;
    RLDBText1: TRLDBText;
    RLDetailGrid1: TRLDetailGrid;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    qryDirecionadasDESCRICAO: TStringField;
    qryDirecionadasCOR: TStringField;
    qryDirecionadasTAM: TStringField;
    qryDirecionadasQUANTIDADE: TBCDField;
    qryDirecionadasDESTINO: TStringField;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    qryDirecionadasCODIGO: TIntegerField;
    qryDirecionadasQTDENTRADA: TSingleField;
    RLBand4: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel8: TRLLabel;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLLabel9: TRLLabel;
    RLDBText7: TRLDBText;
    qryDirecionadasREFERENCIA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure gridConsultaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnDirecionarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDirecionarEntradas: TfrmDirecionarEntradas;

implementation

uses funcoes;

{$R *.dfm}

procedure TfrmDirecionarEntradas.btnDirecionarClick(Sender: TObject);
begin
  if not confirma('Confirma o direcionamento dos itens de entrada referentes ao lote Nº '+edtLote.Text+'?') then
    exit;
  qryDireciona.Close;
  qryDireciona.ParamByName('LOTE').AsInteger := edtLote.AsInteger;
  qryDireciona.ExecSQL;
  qryEntradas.Close;
  qryEntradas.ParamByName('LOTE').AsInteger := edtLote.AsInteger;
  qryEntradas.Open;
end;

procedure TfrmDirecionarEntradas.btnImprimirClick(Sender: TObject);
begin
  inherited;
  qryDirecionadas.Close;
  qryDirecionadas.ParamByName('LOTE').AsInteger := edtLote.AsInteger;
  qryDirecionadas.Open;

  RLReport1.PreviewModal;
end;

procedure TfrmDirecionarEntradas.FormShow(Sender: TObject);
begin
  inherited;
  edtLote.AsInteger := StrToIntDef(Maior_Valor_Cadastrado('ENTRADAS_SAIDAS', 'LOTE'), 0);
  qryEntradas.Close;
  qryEntradas.ParamByName('LOTE').AsInteger := edtLote.AsInteger;
  qryEntradas.Open;
end;

procedure TfrmDirecionarEntradas.gridConsultaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Column.Field = qryEntradasDIRECIONADA then begin
    TDBGridCBN(Sender).Canvas.FillRect(Rect);

    if qryEntradasDIRECIONADA.asString = 'S' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +12, Rect.Top , 0, true);
  end;
end;

procedure TfrmDirecionarEntradas.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;
  RLLabel8.Caption := 'Entradas referentes ao lote Nº '+edtLote.Text;
end;

end.



