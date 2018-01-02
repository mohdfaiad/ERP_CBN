unit uRelatorioTotalizarEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, frameBuscaProduto2,
  RLReport, DB, DBClient, ComObj, FileCtrl,
  frameBuscaTabelaPreco, RLParser, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, RLFilters;

type
    TfrmRelatorioTotalizarEstoque = class(TfrmPadrao)
    Panel1: TPanel;
    btnImprimir: TBitBtn;
    BuscaProduto2: TBuscaProduto2;
    RLTotalizarEstoque: TRLReport;
    dsTotalizarEstoque: TDataSource;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    cdsEstoque: TClientDataSet;
    cdsEstoqueCOR: TStringField;
    cdsEstoqueQTD_RN: TFloatField;
    cdsEstoqueQTD_P: TFloatField;
    cdsEstoqueQTD_M: TFloatField;
    cdsEstoqueQTD_G: TFloatField;
    cdsEstoqueQTD_1: TFloatField;
    cdsEstoqueQTD_2: TFloatField;
    cdsEstoqueQTD_3: TFloatField;
    cdsEstoqueQTD_4: TFloatField;
    cdsEstoqueQTD_6: TFloatField;
    cdsEstoqueQTD_8: TFloatField;
    cdsEstoqueQTD_UNICA: TFloatField;
    cdsEstoqueQTD_TOTAL: TFloatField;
    cdsEstoqueREFERENCIA: TStringField;
    cdsEstoquePRODUTO: TStringField;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLDraw1: TRLDraw;
    RLBand3: TRLBand;
    RLDBText15: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand4: TRLBand;
    RLDraw2: TRLDraw;
    RLBand5: TRLBand;
    RLDraw3: TRLDraw;
    RLLabel18: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLBand6: TRLBand;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel19: TRLLabel;
    BuscaTabelaPreco1: TBuscaTabelaPreco;
    cdsEstoquePRECOTABELA: TFloatField;
    RLDBResult3: TRLDBResult;
    RLLabel20: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel21: TRLLabel;
    cdsEstoqueVALORESTOQUE: TFloatField;
    RLDraw5: TRLDraw;
    RLExpressionParser1: TRLExpressionParser;
    RLDBResult4: TRLDBResult;
    cdsValorTotal: TClientDataSet;
    cdsValorTotalVALOR: TFloatField;
    dsTotal: TDataSource;
    RLLabel22: TRLLabel;
    RLDBText16: TRLDBText;
    cdsEstoqueREFPRODUTO: TStringField;
    chkEstoqueReservado: TCheckBox;
    RLDBResult16: TRLDBResult;
    RLDBResult17: TRLDBResult;
    RLDBResult18: TRLDBResult;
    RLDBResult19: TRLDBResult;
    RLDBResult20: TRLDBResult;
    RLDBResult21: TRLDBResult;
    RLDBResult22: TRLDBResult;
    RLDBResult23: TRLDBResult;
    RLDBResult24: TRLDBResult;
    RLDBResult25: TRLDBResult;
    RLDBResult26: TRLDBResult;
    RLDBResult27: TRLDBResult;
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
    cdsEstoqueQTD_GG: TIntegerField;
    qry: TFDQuery;
    QryF: TFDQuery;
    qryEstoqueReservado: TFDQuery;
    qryREFPRODUTO: TStringField;
    qryPRODUTO: TStringField;
    qryREFERENCIA: TStringField;
    qryCOR: TStringField;
    qryTAM: TStringField;
    qryQUANTIDADE: TBCDField;
    QryFPRECO: TBCDField;
    qryEstoqueReservadoQTD_RN: TLargeintField;
    qryEstoqueReservadoQTD_P: TLargeintField;
    qryEstoqueReservadoQTD_M: TLargeintField;
    qryEstoqueReservadoQTD_G: TLargeintField;
    qryEstoqueReservadoQTD_1: TLargeintField;
    qryEstoqueReservadoQTD_2: TLargeintField;
    qryEstoqueReservadoQTD_3: TLargeintField;
    qryEstoqueReservadoQTD_4: TLargeintField;
    qryEstoqueReservadoQTD_6: TLargeintField;
    qryEstoqueReservadoQTD_8: TLargeintField;
    qryEstoqueReservadoQTD_UNICA: TLargeintField;
    qryEstoqueReservadoREFPRODUTO: TStringField;
    qryEstoqueReservadoREFCOR: TStringField;
    chkSomenteLoja: TCheckBox;
    cdsEstoqueQTD_10: TIntegerField;
    cdsEstoqueQTD_12: TIntegerField;
    cdsEstoqueQTD_14: TIntegerField;
    qryEstoqueReservadoQTD_10: TLargeintField;
    qryEstoqueReservadoQTD_12: TLargeintField;
    qryEstoqueReservadoQTD_14: TLargeintField;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBResult28: TRLDBResult;
    RLDBResult29: TRLDBResult;
    RLDBResult30: TRLDBResult;
    RLDBResult31: TRLDBResult;
    RLDBResult32: TRLDBResult;
    RLDBResult33: TRLDBResult;
    RLLabel26: TRLLabel;
    RLDBText20: TRLDBText;
    cdsEstoqueQTD_PM: TIntegerField;
    RLDBResult34: TRLDBResult;
    RLDBResult35: TRLDBResult;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLLabel40: TRLLabel;
    RLLabel41: TRLLabel;
    RLLabel42: TRLLabel;
    RLDraw6: TRLDraw;
    rgpSetor: TRadioGroup;
    btnSalvarExcel: TBitBtn;
    RLReport1: TRLReport;
    RLBand7: TRLBand;
    RLSystemInfo4: TRLSystemInfo;
    RLSystemInfo5: TRLSystemInfo;
    RLLabel17: TRLLabel;
    RLBand8: TRLBand;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLSystemInfo6: TRLSystemInfo;
    RLGroup2: TRLGroup;
    RLBand9: TRLBand;
    RLDBText21: TRLDBText;
    RLLabel45: TRLLabel;
    RLLabel46: TRLLabel;
    RLLabel47: TRLLabel;
    RLLabel48: TRLLabel;
    RLLabel49: TRLLabel;
    RLLabel50: TRLLabel;
    RLLabel51: TRLLabel;
    RLLabel52: TRLLabel;
    RLLabel53: TRLLabel;
    RLLabel54: TRLLabel;
    RLLabel55: TRLLabel;
    RLLabel56: TRLLabel;
    RLLabel57: TRLLabel;
    RLLabel58: TRLLabel;
    RLDraw7: TRLDraw;
    RLLabel59: TRLLabel;
    RLLabel60: TRLLabel;
    RLLabel61: TRLLabel;
    RLLabel62: TRLLabel;
    RLBand10: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDBResult36: TRLDBResult;
    RLLabel63: TRLLabel;
    RLLabel64: TRLLabel;
    RLDraw10: TRLDraw;
    RLDBResult37: TRLDBResult;
    RLDBResult38: TRLDBResult;
    RLDBResult39: TRLDBResult;
    RLDBResult40: TRLDBResult;
    RLDBResult41: TRLDBResult;
    RLDBResult42: TRLDBResult;
    RLDBResult43: TRLDBResult;
    RLDBResult44: TRLDBResult;
    RLDBResult45: TRLDBResult;
    RLDBResult46: TRLDBResult;
    RLDBResult47: TRLDBResult;
    RLDBResult48: TRLDBResult;
    RLDBResult49: TRLDBResult;
    RLDBResult50: TRLDBResult;
    RLDBResult51: TRLDBResult;
    RLDBResult52: TRLDBResult;
    RLBand11: TRLBand;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLDBText27: TRLDBText;
    RLDBText28: TRLDBText;
    RLDBText29: TRLDBText;
    RLDBText30: TRLDBText;
    RLDBText31: TRLDBText;
    RLDBText32: TRLDBText;
    RLDBText33: TRLDBText;
    RLDBText34: TRLDBText;
    RLDBText35: TRLDBText;
    RLDBText36: TRLDBText;
    RLDBText37: TRLDBText;
    RLDBText38: TRLDBText;
    RLDBText39: TRLDBText;
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure RLDBResult4BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure chkSomenteLojaClick(Sender: TObject);
    procedure RLDBResult31BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
    procedure btnSalvarExcelClick(Sender: TObject);

  private
    Valor: Currency;
    procedure subtrai_estoque_reservado;
    procedure gerarPlanilhaExcel(caminho :String);
    procedure insereCabecalhoColunas(pSheet :Variant; var pLinha :integer);
    procedure totalizaProduto(pSheet :Variant; var linha :integer; pPM, pRN, pP, pM, pG, p1, p2, p3, p4, p6, p8, p10, p12, p14, pUnica, pTotal :integer);
    procedure mostraTotalTabela(pSheet :Variant; var pLinha, pTotal :integer);
    procedure mostraValorTotalEstoque(pSheet :Variant; var pLinha, pTotal :integer);
    procedure TotalizarEstoque;

  public
    { Public declarations }
  end;

var
  frmRelatorioTotalizarEstoque: TfrmRelatorioTotalizarEstoque;

implementation

uses PermissoesAcesso, RxCurrEdit, StrUtils, Math;

function getValorString(texto :String) :String;
  begin
    result := IfThen( trim(texto) = '0', '', texto);
  end;

{$R *.dfm}

procedure TfrmRelatorioTotalizarEstoque.gerarPlanilhaExcel(caminho :String);
var objExcel,Sheet,Chart,s : Variant;
    cTitulo, vProduto: string;
    i, linha, qtdProdutos : integer;
    valorTotal :Real;
    vPM, vRN, vP, vM, vG, v1, v2, v3, v4, v6, v8, v10, v12, v14, vUnica, vTotal :Integer;
    vtPM, vtRN, vtP, vtM, vtG, vt1, vt2, vt3, vt4, vt6, vt8, vt10, vt12, vt14, vtUnica, vtTotal :Integer;
begin
 try
 try
   vPM := 0; vRN := 0; vP := 0; vM := 0; vG := 0; v1 := 0; v2 := 0; v3 := 0; v4 := 0;
   v6 := 0; v8 := 0; v10 := 0; v12 := 0; v14 := 0; vUnica := 0; vTotal := 0;
   qtdProdutos := 0;
   vProduto := '';
   cTitulo := 'Relatório de Clientes';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := False;
   objExcel.Caption := cTitulo;

   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;

   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

   Sheet.Range['A1'].ColumnWidth := 20;
   Sheet.Range['B1'].ColumnWidth := 50;
   Sheet.Range['C1'].ColumnWidth := 8;
   Sheet.Range['D1'].ColumnWidth := 8;
   Sheet.Range['E1'].ColumnWidth := 8;
   Sheet.Range['F1'].ColumnWidth := 8;
   Sheet.Range['G1'].ColumnWidth := 8;
   Sheet.Range['H1'].ColumnWidth := 8;
   Sheet.Range['I1'].ColumnWidth := 8;
   Sheet.Range['J1'].ColumnWidth := 8;
   Sheet.Range['K1'].ColumnWidth := 8;
   Sheet.Range['L1'].ColumnWidth := 8;
   Sheet.Range['M1'].ColumnWidth := 8;
   Sheet.Range['N1'].ColumnWidth := 8;
   Sheet.Range['O1'].ColumnWidth := 8;
   Sheet.Range['P1'].ColumnWidth := 8;
   Sheet.Range['Q1'].ColumnWidth := 8;
   Sheet.Range['R1'].ColumnWidth := 15;

   linha := 1;

   valorTotal := 0;
   cdsEstoque.First;
   while not cdsEstoque.Eof do begin

     if vProduto <> cdsEstoquePRODUTO.AsString then
     begin
       inc(qtdProdutos);
       //imprime total apenas se existir mais de um produto e se esse produto tiver mais de uma cor
       if (vProduto <> '') then
       begin
         totalizaProduto(Sheet, linha, vtPM, vtRN, vtP, vtM, vtG, vt1, vt2, vt3, vt4, vt6, vt8, vt10, vt12, vt14, vtUnica, vtTotal);
         mostraTotalTabela(Sheet, linha, vtTotal);
         mostraValorTotalEstoque(Sheet, linha, vtTotal);
       end;

       vtPM := 0; vtRN := 0; vtP := 0; vtM := 0; vtG := 0; vt1 := 0; vt2 := 0; vt3 := 0; vt4 := 0;
       vt6 := 0; vt8 := 0; vt10 := 0; vt12 := 0; vt14 := 0; vtUnica := 0; vtTotal := 0;
       vProduto := cdsEstoquePRODUTO.AsString;
       inc(linha);
       Sheet.Range['A'+intToStr(linha)+':R'+intToStr(linha)].Mergecells := True; inc(linha);
       Sheet.Range['A'+intToStr(linha)+':R'+intToStr(linha)].Mergecells := True;
       Sheet.Cells[linha,1] := cdsEstoquePRODUTO.AsString;
       Sheet.Range['A'+intToStr(linha)+':R'+intToStr(linha)].Interior.Color := $00EEE6CC;
       inc(linha);
       insereCabecalhoColunas(Sheet, linha);
     end;
     inc(linha);

     Sheet.Range['A'+intToStr(linha)+':R'+intToStr(linha)].Interior.Color := IfThen((linha mod 2) = 0 ,$00F5F5F5, clWhite);
     Sheet.Cells[linha,1]  := getValorString(cdsEstoqueREFERENCIA.AsString);
     Sheet.Cells[linha,2]  := getValorString(cdsEstoqueCOR.AsString);
     Sheet.Cells[linha,3]  := getValorString(cdsEstoqueQTD_PM.AsString);
     Sheet.Cells[linha,4]  := getValorString(cdsEstoqueQTD_RN.AsString);
     Sheet.Cells[linha,5]  := getValorString(cdsEstoqueQTD_P.AsString);
     Sheet.Cells[linha,6]  := getValorString(cdsEstoqueQTD_M.AsString);
     Sheet.Cells[linha,7]  := getValorString(cdsEstoqueQTD_G.AsString);
     Sheet.Cells[linha,8]  := getValorString(cdsEstoqueQTD_1.AsString);
     Sheet.Cells[linha,9]  := getValorString(cdsEstoqueQTD_2.AsString);
     Sheet.Cells[linha,10] := getValorString(cdsEstoqueQTD_3.AsString);
     Sheet.Cells[linha,11] := getValorString(cdsEstoqueQTD_4.AsString);
     Sheet.Cells[linha,12] := getValorString(cdsEstoqueQTD_6.AsString);
     Sheet.Cells[linha,13] := getValorString(cdsEstoqueQTD_8.AsString);
     Sheet.Cells[linha,14] := getValorString(cdsEstoqueQTD_10.AsString);
     Sheet.Cells[linha,15] := getValorString(cdsEstoqueQTD_12.AsString);
     Sheet.Cells[linha,16] := getValorString(cdsEstoqueQTD_14.AsString);
     Sheet.Cells[linha,17] := getValorString(cdsEstoqueQTD_UNICA.AsString);
     Sheet.Cells[linha,18] := cdsEstoqueQTD_TOTAL.AsString;
     vPM    := vPM    + cdsEstoqueQTD_PM.AsInteger;
     vRN    := vRN    + cdsEstoqueQTD_RN.AsInteger;
     vP     := vP     + cdsEstoqueQTD_P.AsInteger;
     vM     := vM     + cdsEstoqueQTD_M.AsInteger;
     vG     := vG     + cdsEstoqueQTD_G.AsInteger;
     v1     := v1     + cdsEstoqueQTD_1.AsInteger;
     v2     := v2     + cdsEstoqueQTD_2.AsInteger;
     v3     := v3     + cdsEstoqueQTD_3.AsInteger;
     v4     := v4     + cdsEstoqueQTD_4.AsInteger;
     v6     := v6     + cdsEstoqueQTD_6.AsInteger;
     v8     := v8     + cdsEstoqueQTD_8.AsInteger;
     v10    := v10    + cdsEstoqueQTD_10.AsInteger;
     v12    := v12    + cdsEstoqueQTD_12.AsInteger;
     v14    := v14    + cdsEstoqueQTD_14.AsInteger;
     vUnica := vUnica + cdsEstoqueQTD_UNICA.AsInteger;
     vTotal := vTotal + cdsEstoqueQTD_TOTAL.AsInteger;

     vtPM    := vtPM    + cdsEstoqueQTD_PM.AsInteger;
     vtRN    := vtRN    + cdsEstoqueQTD_RN.AsInteger;
     vtP     := vtP     + cdsEstoqueQTD_P.AsInteger;
     vtM     := vtM     + cdsEstoqueQTD_M.AsInteger;
     vtG     := vtG     + cdsEstoqueQTD_G.AsInteger;
     vt1     := vt1     + cdsEstoqueQTD_1.AsInteger;
     vt2     := vt2     + cdsEstoqueQTD_2.AsInteger;
     vt3     := vt3     + cdsEstoqueQTD_3.AsInteger;
     vt4     := vt4     + cdsEstoqueQTD_4.AsInteger;
     vt6     := vt6     + cdsEstoqueQTD_6.AsInteger;
     vt8     := vt8     + cdsEstoqueQTD_8.AsInteger;
     vt10    := vt10    + cdsEstoqueQTD_10.AsInteger;
     vt12    := vt12    + cdsEstoqueQTD_12.AsInteger;
     vt14    := vt14    + cdsEstoqueQTD_14.AsInteger;
     vtUnica := vtUnica + cdsEstoqueQTD_UNICA.AsInteger;
     vtTotal := vtTotal + cdsEstoqueQTD_TOTAL.AsInteger;
     cdsEstoque.Next;

     if cdsEstoque.Eof then
     begin
       totalizaProduto(Sheet, linha, vtPM, vtRN, vtP, vtM, vtG, vt1, vt2, vt3, vt4, vt6, vt8, vt10, vt12, vt14, vtUnica, vtTotal);
       mostraTotalTabela(Sheet, linha, vtTotal);
       mostraValorTotalEstoque(Sheet, linha, vtTotal);
     end;
   end;
   inc(linha); inc(linha); inc(linha);
   insereCabecalhoColunas(Sheet, linha);
   Sheet.Range['C'+intToStr(linha)+':R'+intToStr(linha)].Interior.Color := $00D0E2C2;
   Sheet.Range['A'+intToStr(linha)+':B'+intToStr(linha)].Interior.Color := $00AECD98;
   Sheet.Cells[linha,1] := '';
   Sheet.Cells[linha,2] := '';
   Sheet.Range['A'+intToStr(linha)+':B'+intToStr(linha)].Mergecells     := True;
   Sheet.Cells[linha,1]  := '';
   totalizaProduto(Sheet, linha, vPM, vRN, vP, vM, vG, v1, v2, v3, v4, v6, v8, v10, v12, v14, vUnica, vTotal);
   mostraValorTotalEstoque(Sheet, linha, vTotal);

   Sheet.SaveAs(caminho);
   avisar('Planílha gerada com sucesso!');
 Except
  on e :Exception do
    avisar('Erro ao gerar planílha'+#13#10+e.Message);
 end;
 finally
   PostMessage(FindWindow('XLMAIN', nil), WM_CLOSE,0,0);
   Sheet := Unassigned;
   objExcel.Quit;
 end;
end;

procedure TfrmRelatorioTotalizarEstoque.insereCabecalhoColunas(pSheet: Variant; var pLinha :integer);
begin
  pSheet.Cells[pLinha,1]  := 'Ref.';
  pSheet.Cells[pLinha,2]  := 'Cor';
  pSheet.Cells[pLinha,3]  := 'PM';
  pSheet.Cells[pLinha,4]  := 'RN';
  pSheet.Cells[pLinha,5]  := 'P';
  pSheet.Cells[pLinha,6]  := 'M';
  pSheet.Cells[pLinha,7]  := 'G';
  pSheet.Cells[pLinha,8]  := '1';
  pSheet.Cells[pLinha,9]  := '2';
  pSheet.Cells[pLinha,10] := '3';
  pSheet.Cells[pLinha,11] := '4';
  pSheet.Cells[pLinha,12] := '6';
  pSheet.Cells[pLinha,13] := '8';
  pSheet.Cells[pLinha,14] := '10';
  pSheet.Cells[pLinha,15] := '12';
  pSheet.Cells[pLinha,16] := '14';
  pSheet.Cells[pLinha,17] := 'UNICA';
  pSheet.Range['Q'+intToStr(pLinha)].HorizontalAlignment := 4;
  pSheet.Cells[pLinha,18] := 'TOTAL';
  pSheet.Range['R'+intToStr(pLinha)].HorizontalAlignment := 4;
  pSheet.Range['A'+intToStr(pLinha)+':R'+intToStr(pLinha)].font.bold  := true;
end;

procedure TfrmRelatorioTotalizarEstoque.mostraTotalTabela(pSheet: Variant; var pLinha, pTotal: integer);
begin
  if BuscaTabelaPreco1.edtCodigo.AsInteger > 0 then
  begin
    inc(pLinha);
    pSheet.Range['A'+intToStr(pLinha)+':Q'+intToStr(pLinha)].Mergecells     := True;
    pSheet.Range['A'+intToStr(pLinha)].HorizontalAlignment := 4;
    pSheet.Cells[pLinha,1] := 'PREÇO TABELA';
    pSheet.Cells[pLinha,18].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
    pSheet.Cells[pLinha,18] := cdsEstoquePRECOTABELA.AsFloat;
  end;
end;

procedure TfrmRelatorioTotalizarEstoque.mostraValorTotalEstoque(pSheet: Variant; var pLinha, pTotal: integer);
begin
  if BuscaTabelaPreco1.edtCodigo.AsInteger > 0 then
  begin
    inc(pLinha);
    pSheet.Range['A'+intToStr(pLinha)+':Q'+intToStr(pLinha)].Mergecells     := True;
    pSheet.Range['A'+intToStr(pLinha)].HorizontalAlignment := 4;
    pSheet.Cells[pLinha,1] := 'VALOR ESTOQUE';
    pSheet.Cells[pLinha,18].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
    pSheet.Cells[pLinha,18] := cdsEstoquePRECOTABELA.AsFloat * pTotal;
  end;
end;

procedure TfrmRelatorioTotalizarEstoque.btnSalvarExcelClick(Sender: TObject);
var Dir :String;
    data :String;
begin
  data := StringReplace(DateToStr(Date),'/','_',[rfReplaceAll, rfIgnoreCase]);

  if cdsEstoque.IsEmpty then
    avisar('Primeiramente efetue a busca acima')
  else if selectdirectory('Select a directory', '', Dir) then
  begin
    try
      Aguarda('Gerando planilha...');
      gerarPlanilhaExcel(dir+'\RelatorioEstoque_'+data+'.xlsx');
    finally
      FimAguarda();
    end;
  end;
end;

procedure TfrmRelatorioTotalizarEstoque.chkSomenteLojaClick(Sender: TObject);
begin
  if chkSomenteLoja.Checked then
  begin
    BuscaProduto2.Limpar;
    BuscaProduto2.produtosLoja := true;
  end;
end;

procedure TfrmRelatorioTotalizarEstoque.FormShow(Sender: TObject);
begin
  //inherited;
  Valor:= 0;
  BuscaProduto2.edtCodColecao.SetFocus;
  if TPermissoesAcesso.ExibirComPermissao(49) then
  begin
    BuscaTabelaPreco1.Visible := False;
    Self.Height               := 320;
    chkEstoqueReservado.Top   := 210;
  end
  else
  begin
    BuscaTabelaPreco1.Visible:= True;
    Self.Height:= 371;
    chkEstoqueReservado.Top   := 265;
  end;
end;

procedure TfrmRelatorioTotalizarEstoque.TotalizarEstoque;
var cWhere, Cor, Produto, condicaoSetor : String;
    i  : Integer;
    quantidade :Real;
begin
  Aguarda('Buscando informações... Aguarde...');
  if not cdsEstoque.Active then
    cdsEstoque.CreateDataSet;

  cdsEstoque.EmptyDataSet;
  if not cdsValorTotal.Active then
    cdsValorTotal.CreateDataSet;

  cdsValorTotal.EmptyDataSet;
  cWhere:= '';
  Produto := '';
  Cor:= '';

  if BuscaProduto2.edtCodColecao.AsInteger > 0 then
    cWhere:= 'WHERE CORES.codigo_colecao = '+BuscaProduto2.edtCodColecao.Text+' ';

  if BuscaProduto2.edtReferencia.Text <> '' then
    cWhere:= cWhere + IfThen(cWhere <> '', 'AND', 'WHERE')+' PRODUTOS.REFERENCIA = '+QuotedStr(BuscaProduto2.edtReferencia.Text)+' ';
  if BuscaProduto2.edtRefCor.Text <> '' then
    cWhere:= cWhere+'AND CORES.CODIGO = '+intToStr(BuscaProduto2.CodigoCor)+' ';
  if BuscaProduto2.edtCodTamanho.Text <> '' then
    cWhere:= cWhere+'AND ESTOQUE.CODIGO_TAMANHO = '+BuscaProduto2.edtCodTamanho.Text+' ';
  if cWhere <> '' then
    cWhere := cWhere+'AND PRODUTOS.REFERENCIA IS NOT NULL '
  else
    cWhere := 'WHERE PRODUTOS.REFERENCIA IS NOT NULL ';

  if chkSomenteLoja.Checked then
    cWhere := cWhere + 'AND (PRODUTOS.REFERENCIA LIKE ''%L'' or PRODUTOS.referencia like ''%LOJA%'')';

  if rgpSetor.ItemIndex < 2 then
    condicaoSetor := IfThen(rgpSetor.ItemIndex = 0, ' and ESTOQUE.SETOR = 1 ',' and ESTOQUE.SETOR = 2 ');


  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Add('SELECT PRODUTOS.REFERENCIA AS REFPRODUTO,                                                        '+
              'PRODUTOS.REFERENCIA||'' - ''||PRODUTOS.DESCRICAO || iif(PRODUTOS.ativo = ''S'', '''', '' - Eliminado'') AS PRODUTO, '+
              'CORES.REFERENCIA AS REFERENCIA, iif((cores.desc_producao is null) or (TRIM(cores.desc_producao) = ''''), cores.descricao, cores.desc_producao|| '' '' ||cores.cor) cor, '+
              'TAMANHOS.DESCRICAO AS TAM, ESTOQUE.QUANTIDADE                                                    '+
              'FROM ESTOQUE                                                                                     '+
              'LEFT OUTER JOIN PRODUTOS ON (PRODUTOS.CODIGO = ESTOQUE.CODIGO_PRODUTO)                           '+
              'LEFT OUTER JOIN TAMANHOS ON (TAMANHOS.CODIGO = ESTOQUE.CODIGO_TAMANHO)                           '+
              'LEFT OUTER JOIN CORES ON (CORES.CODIGO = ESTOQUE.CODIGO_COR)                                     '+
              cWhere+{ ' and (ESTOQUE.QUANTIDADE > 0) '+} condicaoSetor +
              'ORDER BY 1, CORES.REFERENCIA');

  Qry.Open;
  if Qry.IsEmpty then
  begin
    Self.avisar('Não há dados para a impressão. Por favor, verifique.');
    BuscaProduto2.edtReferencia.SetFocus;
    Exit;
  end;

  Qry.First;
  while not Qry.Eof do
  begin

    Application.ProcessMessages;
    if (Produto = Qry.FieldByName('REFPRODUTO').AsString) and (Cor = Qry.FieldByName('COR').AsString) then
      cdsEstoque.Edit
    else
      cdsEstoque.Append;

    cdsEstoqueREFPRODUTO.AsString := Qry.FieldByName('REFPRODUTO').AsString;
    cdsEstoquePRODUTO.AsString    := Qry.FieldByName('PRODUTO').AsString;
    if BuscaTabelaPreco1.edtCodigo.Value <> 0 then
    begin
      QryF.Close;
      QryF.SQL.Clear;
      QryF.SQL.Add('SELECT PRODUTO_TABELA_PRECO.PRECO                                               '+
                   'FROM PRODUTO_TABELA_PRECO                                                       '+
                   'LEFT OUTER JOIN PRODUTOS ON (PRODUTOS.CODIGO = PRODUTO_TABELA_PRECO.CODPRODUTO) '+
                   'WHERE PRODUTO_TABELA_PRECO.CODTABELA = '+CurrToStr(BuscaTabelaPreco1.edtCodigo.Value)+' AND '+
                   'PRODUTOS.REFERENCIA = '+QuotedStr(Qry.FieldByName('REFPRODUTO').AsString));
      QryF.Open;

      if not QryF.IsEmpty then
        cdsEstoquePRECOTABELA.AsFloat:= QryF.Fields[0].AsFloat
      else
        cdsEstoquePRECOTABELA.AsFloat:= 0;
    end;

    cdsEstoqueREFERENCIA.AsString:= Qry.FieldByName('REFERENCIA').AsString;
    cdsEstoqueCOR.AsString:= Qry.FieldByName('COR').AsString;

    cdsEstoque.FieldByName('QTD_'+Qry.FieldByName('TAM').AsString).AsFloat := cdsEstoque.FieldByName('QTD_'+Qry.FieldByName('TAM').AsString).AsFloat +
                                                                              Qry.FieldByName('QUANTIDADE').AsFloat;
    cdsEstoqueQTD_TOTAL.AsFloat                                            := cdsEstoqueQTD_TOTAL.AsFloat + Qry.FieldByName('QUANTIDADE').AsFloat;

    cdsEstoque.Post;

    Cor     := Qry.FieldByName('COR').AsString;
    Produto := Qry.FieldByName('REFPRODUTO').AsString;
    Qry.Next;
  end;

  if BuscaTabelaPreco1.edtCodigo.Value <> 0 then
  begin
    RLGroup1.Height:= 120;
    RLBand4.Height:= 67;
    RLDraw4.Visible:= True;
    RLLabel20.Visible:= True;
    RLLabel21.Visible:= True;
    RLDBResult3.Visible:= True;
    RLDBResult4.Visible:= True;
    RLDraw5.Visible:= True;
    RLLabel22.Visible:= True;
    RLDBText16.Visible:= True;
  end
  else
  begin
    RLGroup1.Height:= 82;
    RLBand4.Height:= 25;
    RLDraw4.Visible:= False;
    RLLabel20.Visible:= False;
    RLLabel21.Visible:= False;
    RLDBResult3.Visible:= False;
    RLDBResult4.Visible:= False;
    RLDraw5.Visible:= False;
    RLLabel22.Visible:= False;
    RLDBText16.Visible:= False;
  end;

  if chkEstoqueReservado.Checked then
    subtrai_estoque_reservado;

  Application.ProcessMessages;
  FimAguarda('Gerando Relatório...');
  RLTotalizarEstoque.PreviewModal;
  Valor:= 0;
end;

procedure TfrmRelatorioTotalizarEstoque.btnImprimirClick(Sender: TObject);
begin
  inherited;
  TotalizarEstoque;
  btnSalvarExcel.Enabled := true;
end;

procedure TfrmRelatorioTotalizarEstoque.RLDBResult31BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  inherited;
  PrintIt := not (Text = '0');
end;

procedure TfrmRelatorioTotalizarEstoque.RLDBResult4BeforePrint(
  Sender: TObject; var Text: String; var PrintIt: Boolean);
begin
  if Valor = 0 then
    cdsValorTotal.Append
  else
    cdsValorTotal.Edit;
  Valor:= Valor + RLDBResult4.Value;
  cdsValorTotalVALOR.AsFloat:= Valor;
  cdsValorTotal.Post;
end;

procedure TfrmRelatorioTotalizarEstoque.subtrai_estoque_reservado;
var condicoes, joinsEcommerce, condicaoEcommerce :String;
begin
  if rgpSetor.ItemIndex in [1,0] then
  begin
    joinsEcommerce   := 'inner join pessoas            rep on rep.codigo = ped.cod_repres         '+
                        'left join  dados_representante dr on dr.codigo_representante = rep.codigo';

    if rgpSetor.ItemIndex = 1 then
      condicaoEcommerce := ' and (dr.rep_ecommerce = ''S'' and pro.tipo = ''E'') '
    else
      condicaoEcommerce := ' and ((dr.codigo is null) or (dr.rep_ecommerce <> ''S'') or ((dr.rep_ecommerce = ''S'') and (pro.tipo = ''L''))) '
  end;

  if BuscaProduto2.edtReferencia.Text <> '' then
    condicoes := ' and i.cod_produto = '+IntToStr(BuscaProduto2.CodigoProduto);

  if BuscaProduto2.edtRefCor.Text <> '' then
    condicoes := condicoes + ' and cor.codigo = '+IntToStr(BuscaProduto2.CodigoCor);


  qryEstoqueReservado.Close;
  qryEstoqueReservado.SQL.Text := 'select sum(ci.qtd_rn) QTD_RN, sum(ci.qtd_p) QTD_P, sum(ci.qtd_m) QTD_M, sum(ci.qtd_g) QTD_G,    '+
                                  ' sum(ci.qtd_1) QTD_1, sum(ci.qtd_2) QTD_2, sum(ci.qtd_3) QTD_3, sum(ci.qtd_4) QTD_4,            '+
                                  ' sum(ci.qtd_6) QTD_6, sum(ci.qtd_8) QTD_8, sum(ci.qtd_10) QTD_10, sum(ci.qtd_12) QTD_12,        '+
                                  ' sum(ci.qtd_14) QTD_14, sum(ci.qtd_unica) QTD_unica,                                            '+
                                  ' pro.referencia REFPRODUTO , cor.referencia REFCOR                       from ITENS i           '+

                                  ' left join conferencia_itens  ci on ci.codigo_item = i.codigo                                   '+
                                  ' left join conferencia_pedido cp on cp.codigo = ci.codigo_conferencia                           '+
                                  ' left join cores              cor on cor.codigo = i.cod_cor                                     '+
                                  ' left join produtos           pro on pro.codigo = i.cod_produto                                 '+
                                  ' left join pedidos            ped on ped.codigo = cp.codigo_pedido                              '+
                                   joinsEcommerce +
                                  ' where ped.cancelado <> ''S'' and cp.fim < ''01.01.1900'' ' + condicoes + condicaoEcommerce +

                                  ' group by pro.referencia, cor.referencia                                                        '+
                                  ' order by pro.referencia, cor.referencia                                                        ';

  qryEstoqueReservado.Open;

  if qryEstoqueReservado.IsEmpty then
    Exit;

  qryEstoqueReservado.First;
  while not qryEstoqueReservado.Eof do begin

   if cdsEstoque.Locate('REFPRODUTO;REFERENCIA',varArrayOf([qryEstoqueReservadoREFPRODUTO.AsString, qryEstoqueReservadoREFCOR.AsString]),[]) then
    begin
      cdsEstoque.Edit;

      if cdsEstoqueQTD_RN.AsInteger <> 0 then begin
        cdsEstoqueQTD_RN.AsInteger    := cdsEstoqueQTD_RN.AsInteger - qryEstoqueReservadoQTD_RN.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_RN.AsInteger;
      end;
      
      if cdsEstoqueQTD_P.AsInteger <> 0 then begin
        cdsEstoqueQTD_P.AsInteger := cdsEstoqueQTD_P.AsInteger - qryEstoqueReservadoQTD_P.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_P.AsInteger;
      end;

      if cdsEstoqueQTD_M.AsInteger <> 0 then begin
        cdsEstoqueQTD_M.AsInteger := cdsEstoqueQTD_M.AsInteger - qryEstoqueReservadoQTD_M.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_M.AsInteger;
      end;

      if cdsEstoqueQTD_G.AsInteger <> 0 then begin
        cdsEstoqueQTD_G.AsInteger := cdsEstoqueQTD_G.AsInteger - qryEstoqueReservadoQTD_G.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_G.AsInteger;
      end;

      if cdsEstoqueQTD_1.AsInteger <> 0 then begin
        cdsEstoqueQTD_1.AsInteger := cdsEstoqueQTD_1.AsInteger - qryEstoqueReservadoQTD_1.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_1.AsInteger;
      end;

      if cdsEstoqueQTD_2.AsInteger <> 0 then begin
        cdsEstoqueQTD_2.AsInteger := cdsEstoqueQTD_2.AsInteger - qryEstoqueReservadoQTD_2.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_2.AsInteger;
      end;

      if cdsEstoqueQTD_3.AsInteger <> 0 then begin
        cdsEstoqueQTD_3.AsInteger := cdsEstoqueQTD_3.AsInteger - qryEstoqueReservadoQTD_3.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_3.AsInteger;
      end;

      if cdsEstoqueQTD_4.AsInteger <> 0 then begin
        cdsEstoqueQTD_4.AsInteger := cdsEstoqueQTD_4.AsInteger - qryEstoqueReservadoQTD_4.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_4.AsInteger;
      end;

      if cdsEstoqueQTD_6.AsInteger <> 0 then begin
        cdsEstoqueQTD_6.AsInteger := cdsEstoqueQTD_6.AsInteger - qryEstoqueReservadoQTD_6.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_6.AsInteger;
      end;

      if cdsEstoqueQTD_8.AsInteger <> 0 then begin
        cdsEstoqueQTD_8.AsInteger := cdsEstoqueQTD_8.AsInteger - qryEstoqueReservadoQTD_8.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_8.AsInteger;
      end;

      if cdsEstoqueQTD_10.AsInteger <> 0 then begin
        cdsEstoqueQTD_10.AsInteger := cdsEstoqueQTD_10.AsInteger - qryEstoqueReservadoQTD_10.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_10.AsInteger;
      end;

      if cdsEstoqueQTD_12.AsInteger <> 0 then begin
        cdsEstoqueQTD_12.AsInteger := cdsEstoqueQTD_8.AsInteger - qryEstoqueReservadoQTD_12.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_12.AsInteger;
      end;

      if cdsEstoqueQTD_14.AsInteger <> 0 then begin
        cdsEstoqueQTD_14.AsInteger := cdsEstoqueQTD_14.AsInteger - qryEstoqueReservadoQTD_14.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_14.AsInteger;
      end;

      if cdsEstoqueQTD_UNICA.AsInteger <> 0 then begin
        cdsEstoqueQTD_UNICA.AsInteger := cdsEstoqueQTD_UNICA.AsInteger - qryEstoqueReservadoQTD_UNICA.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_UNICA.AsInteger;
      end;
      cdsEstoque.Post;
    end;
    qryEstoqueReservado.Next;
  end;

end;

procedure TfrmRelatorioTotalizarEstoque.totalizaProduto(pSheet :Variant; var linha :integer; pPM, pRN, pP, pM, pG, p1, p2, p3, p4, p6, p8, p10, p12, p14, pUnica, pTotal :integer);
begin
  inc(linha);
  pSheet.Range['A'+intToStr(linha)+':B'+intToStr(linha)].Mergecells     := True;
  pSheet.Range['A'+intToStr(linha)+':R'+intToStr(linha)].Interior.Color := $00D7CFCC;
  pSheet.Cells[linha,3]  := getValorString( intToStr( pPM    ));
  pSheet.Cells[linha,4]  := getValorString( intToStr( pRN    ));
  pSheet.Cells[linha,5]  := getValorString( intToStr( pP     ));
  pSheet.Cells[linha,6]  := getValorString( intToStr( pM     ));
  pSheet.Cells[linha,7]  := getValorString( intToStr( pG     ));
  pSheet.Cells[linha,8]  := getValorString( intToStr( p1     ));
  pSheet.Cells[linha,9]  := getValorString( intToStr( p2     ));
  pSheet.Cells[linha,10] := getValorString( intToStr( p3     ));
  pSheet.Cells[linha,11] := getValorString( intToStr( p4     ));
  pSheet.Cells[linha,12] := getValorString( intToStr( p6     ));
  pSheet.Cells[linha,13] := getValorString( intToStr( p8     ));
  pSheet.Cells[linha,14] := getValorString( intToStr( p10    ));
  pSheet.Cells[linha,15] := getValorString( intToStr( p12    ));
  pSheet.Cells[linha,16] := getValorString( intToStr( p14    ));
  pSheet.Cells[linha,17] := getValorString( intToStr( pUnica ));
  pSheet.Cells[linha,18] := intToStr( pTotal );
  pSheet.Range['A'+intToStr(linha)+':R'+intToStr(linha)].font.bold  := true;
end;

procedure TfrmRelatorioTotalizarEstoque.RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLDBResult5.Visible  := RLDBResult5.Value > 0;
  RLDBResult6.Visible  := RLDBResult6.Value > 0;
  RLDBResult7.Visible  := RLDBResult7.Value > 0;
  RLDBResult8.Visible  := RLDBResult8.Value > 0;
  RLDBResult9.Visible  := RLDBResult9.Value > 0;
  RLDBResult10.Visible := RLDBResult10.Value > 0;
  RLDBResult11.Visible := RLDBResult11.Value > 0;
  RLDBResult12.Visible := RLDBResult12.Value > 0;
  RLDBResult13.Visible := RLDBResult13.Value > 0;
  RLDBResult14.Visible := RLDBResult14.Value > 0;
  RLDBResult15.Visible := RLDBResult15.Value > 0;
  RLDBResult31.Visible := RLDBResult31.Value > 0;
  RLDBResult32.Visible := RLDBResult32.Value > 0;
  RLDBResult33.Visible := RLDBResult33.Value > 0;
end;

procedure TfrmRelatorioTotalizarEstoque.RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLDBResult16.Visible := RLDBResult16.Value > 0;
  RLDBResult17.Visible := RLDBResult17.Value > 0;
  RLDBResult18.Visible := RLDBResult18.Value > 0;
  RLDBResult19.Visible := RLDBResult19.Value > 0;
  RLDBResult20.Visible := RLDBResult20.Value > 0;
  RLDBResult21.Visible := RLDBResult21.Value > 0;
  RLDBResult22.Visible := RLDBResult22.Value > 0;
  RLDBResult23.Visible := RLDBResult23.Value > 0;
  RLDBResult24.Visible := RLDBResult24.Value > 0;
  RLDBResult25.Visible := RLDBResult25.Value > 0;
  RLDBResult26.Visible := RLDBResult26.Value > 0;
  RLDBResult28.Visible := RLDBResult28.Value > 0;
  RLDBResult29.Visible := RLDBResult29.Value > 0;
  RLDBResult30.Visible := RLDBResult30.Value > 0;
end;

end.
