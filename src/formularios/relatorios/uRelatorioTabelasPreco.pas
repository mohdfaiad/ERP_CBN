unit uRelatorioTabelasPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, ComObj,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frameBuscaTabelaPreco, RLReport, RLFilters, RLXLSFilter, uPadrao, RLXLSXFilter, RLPreviewForm, RLRichFilter, RLPDFFilter;

type
  TfrmRelatorioTabelasPreco = class(TfrmPadrao)
    BuscaTabelaPreco1: TBuscaTabelaPreco;
    qry: TFDQuery;
    ds: TDataSource;
    Panel1: TPanel;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLGroup1: TRLGroup;
    RLBTituloItens: TRLBand;
    RLDBText1: TRLDBText;
    RLBItens: TRLBand;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    qryCODTABELA: TIntegerField;
    qryREFERENCIA: TStringField;
    qryDESCRICAO: TStringField;
    qryGRADE: TStringField;
    qryDESC_TIPO_COR: TStringField;
    qryPRECO: TBCDField;
    qryCOLECAO: TStringField;
    qryGRUPO: TStringField;
    RLBand2: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLXLSXFilter1: TRLXLSXFilter;
    RLPDFFilter1: TRLPDFFilter;
    RLRichFilter1: TRLRichFilter;
    RLLabel2: TRLLabel;
    rlbTitulo: TRLLabel;
    procedure btnImprimirClick(Sender: TObject);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure btnSairClick(Sender: TObject);
  private
    procedure imprimir;
    procedure gerarPlanilha(caminho :String);
  public
    { Public declarations }
  end;

var
  frmRelatorioTabelasPreco: TfrmRelatorioTabelasPreco;

implementation

{$R *.dfm}

procedure TfrmRelatorioTabelasPreco.btnImprimirClick(Sender: TObject);
var
  Dialog :TSaveDialog;
begin
  if BuscaTabelaPreco1.edtDescricao.Text = '' then
  begin
    avisar('A tabela de preço deve ser informada');
    exit;
  end;

  qry.Close;
  qry.ParamByName('codigoTabela').AsString := BuscaTabelaPreco1.codTabela;
  qry.Open;

  if qry.IsEmpty then
  begin
    avisar('Nenhum registro foi encontrado');
    exit;
  end;

  try
    Dialog            := TSaveDialog.Create(nil);
    Dialog.Title      := 'Selecione o caminho para salvar o arquivo';

    if Dialog.Execute then
      gerarPlanilha(Dialog.FileName);

  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TfrmRelatorioTabelasPreco.btnSairClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmRelatorioTabelasPreco.gerarPlanilha(caminho :String);
var objExcel,Sheet,Chart,s : Variant;
    cTitulo, grupo : string;
    i, linha : integer;
begin
 try
   cTitulo := 'Tabelas de Preço';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := False;
   objExcel.Caption := cTitulo;
   objExcel.DisplayAlerts := False;

   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;

   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

   Sheet.Range['A1:E1'].Mergecells := True;
   Sheet.Range['A1'] := 'TABELAS DE PREÇO - '+BuscaTabelaPreco1.edtDescricao.Text;
   Sheet.Range['A1'].HorizontalAlignment := 3;
   Sheet.Range['A1'].VerticalAlignment := 2;
   Sheet.Range['A1'].RowHeight := 60;

   linha := 2;
   qry.First;
   while not qry.Eof do begin
     if grupo <> qryGRUPO.AsString then
     begin
       Sheet.Range['A'+intToStr(linha)+':E'+intToStr(linha)].Mergecells := True;
       inc(linha);
       Sheet.Range['A'+intToStr(linha)+':E'+intToStr(linha)].Mergecells := True;
       Sheet.Cells[linha,1] := qryGRUPO.AsString;
       grupo := qryGRUPO.AsString;
       Sheet.Cells[linha,1].font.bold  := true;
       inc(linha);
       Sheet.Range['A'+intToStr(linha)] := 'REF.';
       Sheet.Range['A'+intToStr(linha)].ColumnWidth := 20;
       Sheet.Range['B'+intToStr(linha)] := 'DESCRIÇÃO';
       Sheet.Range['B'+intToStr(linha)].ColumnWidth := 65;
       Sheet.Range['C'+intToStr(linha)] := 'TAMANHO';
       Sheet.Range['C'+intToStr(linha)].ColumnWidth := 20;
       Sheet.Range['D'+intToStr(linha)] := 'CORES';
       Sheet.Range['D'+intToStr(linha)].ColumnWidth := 30;
       Sheet.Range['E'+intToStr(linha)] := 'PREÇO';
       Sheet.Range['E'+intToStr(linha)].ColumnWidth := 20;
       Sheet.Range['A'+intToStr(linha)+':E'+intToStr(linha)].font.bold  := true;
       Sheet.Range['A'+intToStr(linha)+':E'+intToStr(linha)].font.color := $00BD895E;
       inc(linha);
     end;

     Sheet.Cells[linha,1].NumberFormat := '@';
     Sheet.Cells[linha,1] := qryREFERENCIA.AsString;
     Sheet.Cells[linha,2] := qryDESCRICAO.AsString;
     Sheet.Cells[linha,3].NumberFormat := '@';
     Sheet.Cells[linha,3] := qryGRADE.AsString ;
     // Formata o Numero para se tornar MOEDA
     Sheet.Cells[linha,4] := qryDESC_TIPO_COR.AsString;
     Sheet.Cells[linha,5].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
     Sheet.Cells[linha,5] := qryPRECO.AsFloat;
     qry.Next;

     inc(linha);
   end;

   // Formatando o Cabeçalho
   Sheet.Range['A1','E1'].font.name      := 'Verdana'; // Fonte
   Sheet.Range['A1','E1'].font.size      := 12; // Tamanho da Fonte
   Sheet.Range['A1','E1'].font.bold      := true; // Negrito
  // Sheet.Range['A1','E1'].font.italic    := true; // Italico
   Sheet.Range['A1','E1'].font.color     := $00F0E4DB; // Cor da Fonte
   Sheet.Range['A1','E1'].Interior.Color := $00BD895E; // Cor da Célula

   // Define o tamanho das Colunas (basta fazer em uma delas e as demais serão alteradas)
  { Sheet.Range['B1','G1' ].ColumnWidth := 27;
   Sheet.Range['B1','G1' ].RowHeight := 25;
   Sheet.Range['D1'] .ColumnWidth := 16; }

  // Sheet.PrintPreview;
   Sheet.SaveAs(caminho);
   Sheet.Range['B5','B5'].columns.AutoFit;

   avisar('Planílha gerada com sucesso!');

 finally
   PostMessage(FindWindow('XLMAIN', nil), WM_CLOSE,0,0);
   Sheet := Unassigned;
   objExcel.Quit;
 end;
end;

procedure TfrmRelatorioTabelasPreco.imprimir;
begin
  qry.Close;
  qry.ParamByName('codigoTabela').AsString := BuscaTabelaPreco1.codTabela;
  qry.Open;

  RLReport1.PreviewModal;
end;

procedure TfrmRelatorioTabelasPreco.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  rlbTitulo.caption := 'TABELA DE PREÇOS - '+BuscaTabelaPreco1.edtDescricao.Text;
end;

end.
