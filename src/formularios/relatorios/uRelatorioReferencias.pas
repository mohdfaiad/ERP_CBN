unit uRelatorioReferencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, frameBuscaPedido, ExtCtrls,
  frameBuscaReferencia, Grids, DBGrids, DBGridCBN, Provider, DB, DBClient, RLReport,
  RLXLSFilter, RLFilters, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ComObj;

type
  TfrmRelatorioReferencias = class(TfrmPadrao)
    Panel1: TPanel;
    gpbReferencia: TGroupBox;
    BuscaReferencia1: TBuscaReferencia;
    gpbPedido: TGroupBox;
    BuscaPedido1: TBuscaPedido;
    Splitter1: TSplitter;
    dsRel: TDataSource;
    cdsRel: TClientDataSet;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    GridUsuarios: TDBGridCBN;
    cdsRelREFERENCIA: TStringField;
    cdsRelPRODUTO: TStringField;
    cdsRelCOR: TStringField;
    cdsRelGRADE: TStringField;
    cdsRelTAMANHO: TStringField;
    cdsRelCOD_BARRA: TStringField;
    cdsRelCOD_GRUPO: TIntegerField;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    cdsRelGRUPO: TStringField;
    RLLabel8: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    GroupBox1: TGroupBox;
    btnImprimir: TSpeedButton;
    RLXLSFilter1: TRLXLSFilter;
    RLDraw2: TRLDraw;
    SaveDialog1: TSaveDialog;
    btnSalvaPDF: TBitBtn;
    cdsRelCODIGO: TStringField;
    Label1: TLabel;
    btnAdicionar: TBitBtn;
    rgTipoInsercao: TRadioGroup;
    qry: TFDQuery;
    cdsREFERENCIA: TStringField;
    cdsCOD_PRODUTO: TIntegerField;
    cdsPRODUTO: TStringField;
    cdsCOD_COR: TIntegerField;
    cdsCOR: TStringField;
    cdsCOD_GRADE: TIntegerField;
    cdsGRADE: TStringField;
    cdsQTD_RN: TIntegerField;
    cdsQTD_P: TIntegerField;
    cdsCOD_GRUPO: TIntegerField;
    cdsGRUPO: TStringField;
    cdsQTD_M: TIntegerField;
    cdsQTD_G: TIntegerField;
    cdsQTD_1: TIntegerField;
    cdsQTD_2: TIntegerField;
    cdsQTD_3: TIntegerField;
    cdsQTD_4: TIntegerField;
    cdsQTD_6: TIntegerField;
    cdsQTD_8: TIntegerField;
    cdsQTD_UNICA: TBCDField;
    cdsRelREFERENCIACOR: TStringField;
    cdsREFCOR: TStringField;
    btnExportar: TBitBtn;
    btnLimpar: TBitBtn;
    procedure rgTipoInsercaoClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSalvaPDFClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridUsuariosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExportarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    procedure adicionar_do_pedido;
    procedure adicionar_individualmente;
    procedure adiciona(tamanho:String);

    function seleciona_cod_barras (tamanho :String):String;
    procedure gerarPlanilha(caminho :String);
  public
    { Public declarations }
  end;

var
  frmRelatorioReferencias: TfrmRelatorioReferencias;

implementation

uses funcoes;

{$R *.dfm}

procedure TfrmRelatorioReferencias.rgTipoInsercaoClick(Sender: TObject);
begin
  inherited;
  gpbPedido.Visible     := (rgTipoInsercao.ItemIndex = 0);
  gpbReferencia.Visible := (rgTipoInsercao.ItemIndex = 1);

  if gpbPedido.Visible then      BuscaPedido1.edtNumPedido.SetFocus;
  if gpbReferencia.Visible then  BuscaReferencia1.edtCodigo.SetFocus;
end;

procedure TfrmRelatorioReferencias.btnAdicionarClick(Sender: TObject);
begin
  try

    if rgTipoInsercao.ItemIndex = 0 then
      adicionar_do_pedido
    else
      adicionar_individualmente;

    cdsRel.IndexFieldNames := 'COD_GRUPO';

  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;    
end;

procedure TfrmRelatorioReferencias.adicionar_do_pedido;
begin
  cdsRel.EmptyDataSet;

  cds.Close;
  qry.ParamByName('cod_pedido').AsInteger := BuscaPedido1.codigo;
  cds.Open;

  cds.First;
  while not cds.Eof do begin

    if cdsQTD_RN.AsInteger > 0    then   adiciona( 'RN'    );
    if cdsQTD_P.AsInteger > 0     then   adiciona( 'P'     );
    if cdsQTD_M.AsInteger > 0     then   adiciona( 'M'     );
    if cdsQTD_G.AsInteger > 0     then   adiciona( 'G'     );
    if cdsQTD_1.AsInteger > 0     then   adiciona( '1'     );
    if cdsQTD_2.AsInteger > 0     then   adiciona( '2'     );
    if cdsQTD_3.AsInteger > 0     then   adiciona( '3'     );
    if cdsQTD_4.AsInteger > 0     then   adiciona( '4'     );
    if cdsQTD_6.AsInteger > 0     then   adiciona( '6'     );
    if cdsQTD_8.AsInteger > 0     then   adiciona( '8'     );
    if cdsQTD_UNICA.AsInteger > 0 then   adiciona( 'UNICA' );

    cds.Next;
  end;

  BuscaPedido1.limpa;
  BuscaPedido1.edtNumPedido.Clear;
end;

procedure TfrmRelatorioReferencias.adicionar_individualmente;
begin
  try
    BuscaReferencia1.cds_selecionados.first;

    while not BuscaReferencia1.cds_selecionados.Eof do begin

      if not (cdsRel.Locate('CODIGO', BuscaReferencia1.cds_selecionados.Fields[0].AsString, []) )
         and (BuscaReferencia1.edtCodigo.AsInteger > 0) then begin

        BuscaReferencia1.codReferencia := BuscaReferencia1.cds_selecionados.Fields[0].AsString;

        cdsRel.Append;
        cdsRelCODIGO.asString     := BuscaReferencia1.edtCodigo.text;
        cdsRelREFERENCIA.AsString := BuscaReferencia1.edtReferencia.Text;
        cdsRelPRODUTO.AsString    := BuscaReferencia1.produto;
        cdsRelCOR.AsString        := BuscaReferencia1.edtCor.Text;
        cdsRelGRADE.AsString      := BuscaReferencia1.edtGrade.Text;
        cdsRelTAMANHO.AsString    := BuscaReferencia1.edtTamanho.Text;
        cdsRelCOD_BARRA.AsString  := BuscaReferencia1.numeracao;
        cdsRelCOD_GRUPO.AsInteger := BuscaReferencia1.codGrupo;
        cdsRelGRUPO.AsString      := BuscaReferencia1.grupo;
        cdsRel.Post;

      end;

      BuscaReferencia1.cds_selecionados.next;
    end;

    BuscaReferencia1.limpa;
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmRelatorioReferencias.btnExportarClick(Sender: TObject);
var
  Dialog :TSaveDialog;
begin
  if cdsrel.IsEmpty then
    exit;
  try
    Dialog            := TSaveDialog.Create(nil);
    Dialog.Title      := 'Selecione o caminho para salvar o arquivo';

    if Dialog.Execute then
      gerarPlanilha(Dialog.FileName);

  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TfrmRelatorioReferencias.adiciona(tamanho: String);
var codigo_de_barras :String;
begin
  codigo_de_barras := seleciona_cod_barras(tamanho);

  if codigo_de_barras = '' then exit;

  cdsRel.Append;
  cdsRelREFERENCIA.AsString := cdsREFERENCIA.AsString;
  cdsRelREFERENCIACOR.AsString := cdsREFCOR.AsString;
  cdsRelPRODUTO.AsString    := cdsPRODUTO.AsString;
  cdsRelCOR.AsString        := cdsCOR.AsString;
  cdsRelGRADE.AsString      := cdsGRADE.AsString;
  cdsRelTAMANHO.AsString    := tamanho;
  cdsRelCOD_BARRA.AsString  := codigo_de_barras;
  cdsRelCOD_GRUPO.AsInteger := cdsCOD_GRUPO.AsInteger;
  cdsRelGRUPO.AsString      := cdsGRUPO.AsString;
  cdsRel.Post;
end;

function TfrmRelatorioReferencias.seleciona_cod_barras(tamanho: String): String;
var codigo_tamanho :String;
begin
  result         := '';
  codigo_tamanho := Campo_por_campo('TAMANHOS', 'CODIGO', 'DESCRICAO', tamanho);
  result         := buscaCodigoBarras(cdscod_produto.AsInteger, cdscod_cor.AsInteger, strToIntDef(codigo_tamanho, 0), cdsCOD_GRADE.AsInteger);
end;

procedure TfrmRelatorioReferencias.FormCreate(Sender: TObject);
begin
  inherited;
  cdsrel.CreateDataSet;
end;

procedure TfrmRelatorioReferencias.btnImprimirClick(Sender: TObject);
begin
  if not cdsRel.IsEmpty then
    RLReport1.PreviewModal;

end;

procedure TfrmRelatorioReferencias.btnLimparClick(Sender: TObject);
begin
  cdsRel.EmptyDataSet;
end;

procedure TfrmRelatorioReferencias.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( (ssCtrl in Shift) AND (Key = ord('P')) ) then  btnImprimir.Click;
end;

procedure TfrmRelatorioReferencias.btnSalvaPDFClick(Sender: TObject);
begin
  if cdsRel.IsEmpty then exit;

  SaveDialog1.Execute;

  if SaveDialog1.FileName <> '' then begin

    RLReport1.SaveToFile( SaveDialog1.FileName );
    RLReport1.Prepare;

  end;
end;

procedure TfrmRelatorioReferencias.gerarPlanilha(caminho :String);
var objExcel,Sheet,Chart,s : Variant;
    cTitulo, grupo : string;
    i, linha : integer;
begin
 try
   cTitulo := 'Referências';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := False;
   objExcel.Caption := cTitulo;
   objExcel.DisplayAlerts := False;


   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;

   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

   Sheet.cells.font.size := 10;
   inc(linha);
   Sheet.Range['A'+intToStr(linha)] := 'Referência';
   Sheet.Range['A'+intToStr(linha)].ColumnWidth := 16;
   Sheet.Range['B'+intToStr(linha)] := 'Produto';
   Sheet.Range['B'+intToStr(linha)].ColumnWidth := 40;
   Sheet.Range['C'+intToStr(linha)] := 'Referência';
   Sheet.Range['C'+intToStr(linha)].ColumnWidth := 16;
   Sheet.Range['D'+intToStr(linha)] := 'Cor';
   Sheet.Range['D'+intToStr(linha)].ColumnWidth := 30;
   Sheet.Range['E'+intToStr(linha)] := 'Grade';
   Sheet.Range['E'+intToStr(linha)].ColumnWidth := 10;
   Sheet.Range['F'+intToStr(linha)] := 'TAM';
   Sheet.Range['F'+intToStr(linha)].ColumnWidth := 5;
   Sheet.Range['G'+intToStr(linha)] := 'Cód.Barras';
   Sheet.Range['G'+intToStr(linha)].ColumnWidth := 16;
   Sheet.Range['A'+intToStr(linha)+':G'+intToStr(linha)].font.bold  := true;
   Sheet.Range['A'+intToStr(linha)+':G'+intToStr(linha)].font.color := $00BD895E;
   inc(linha);

   cdsRel.First;
   while not cdsRel.Eof do begin
      Sheet.Cells[linha,1].NumberFormat := '@';
      Sheet.Cells[linha,1] := cdsRelREFERENCIA.AsString;
      Sheet.Cells[linha,2] := copy(cdsRelPRODUTO.AsString,1,50);
      Sheet.Cells[linha,3].NumberFormat := '@';
      Sheet.Cells[linha,3] := ' '+cdsRelREFERENCIACOR.AsString ;
      Sheet.Cells[linha,4] := cdsRelCOR.AsString;
      Sheet.Cells[linha,5].NumberFormat := '@';
      Sheet.Cells[linha,5] := cdsRelGRADE.AsString;
      Sheet.Cells[linha,6].NumberFormat := '@';
      Sheet.Cells[linha,6] := cdsRelTAMANHO.AsString;
      Sheet.Cells[linha,7].NumberFormat := '@';
      Sheet.Cells[linha,7] := cdsRelCOD_BARRA.AsString;

      cdsRel.Next;

     inc(linha);
   end;

   // Formatando o Cabeçalho
   Sheet.Range['A1','G1'].font.name      := 'Verdana'; // Fonte
   Sheet.Range['A1','G1'].font.size      := 11; // Tamanho da Fonte
   Sheet.Range['A1','G1'].font.bold      := true; // Negrito
  // Sheet.Range['A1''E1'].font.italic    := true; // Italico
   Sheet.Range['A1','G1'].font.color     := $00F0E4DB; // Cor da Fonte
   Sheet.Range['A1','G1'].Interior.Color := $00BD895E; // Cor da Célula

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

procedure TfrmRelatorioReferencias.FormShow(Sender: TObject);
begin
  BuscaPedido1.edtNumPedido.SetFocus;
end;

procedure TfrmRelatorioReferencias.GridUsuariosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_delete then
    cdsRel.Delete;
end;

end.

