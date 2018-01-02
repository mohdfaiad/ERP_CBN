unit uGeraArquivoMeusPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.Buttons, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uPadrao, Datasnap.DBClient, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmGeraArquivoMeusPedidos = class(TFrmPadrao)
    qry: TFDQuery;
    BitBtn1: TBitBtn;
    cds: TClientDataSet;
    cdsREFPRO: TStringField;
    cdsPRODUTO: TStringField;
    cdsUNIDADE: TStringField;
    cdsTIPO: TStringField;
    cdsGRUPO: TStringField;
    cdsCOLECAO: TStringField;
    cdsCOR: TStringField;
    cdsTAMANHO: TStringField;
    qryREFERENCIA: TStringField;
    qryDESCRICAO: TStringField;
    qryUNIDADE_MEDIDA: TStringField;
    qryTIPO: TStringField;
    qryGRUPO: TStringField;
    qryCOLECAO: TStringField;
    qryCOR: TStringField;
    qryTAM: TStringField;
    qryREFCOR: TStringField;
    qryCODIGO: TIntegerField;
    cdsCODPRO: TIntegerField;
    qryTab: TFDQuery;
    ProgressBar1: TProgressBar;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure geraArquivo;
    procedure separarLinhas;
  public
    { Public declarations }
  end;

var
  frmGeraArquivoMeusPedidos: TfrmGeraArquivoMeusPedidos;

implementation

uses ComObj, uModulo;

{$R *.dfm}

procedure TfrmGeraArquivoMeusPedidos.BitBtn1Click(Sender: TObject);
begin
  qry.Close;
  qry.Open;
  separarLinhas;
  geraArquivo;
end;

procedure TfrmGeraArquivoMeusPedidos.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Connection := dm.conexao;
  qryTab.Connection := dm.conexao;
end;

procedure TfrmGeraArquivoMeusPedidos.geraArquivo;
var objExcel,Sheet,Chart,s : Variant;
    cTitulo: string;
    i, linha, coluna : integer;
    valorTotal :Real;
    caminho :String;
begin
caminho := ExtractFilePath(Application.ExeName)+'ARQUIVO_MEUS_PEDIDOS.xlsx';
 try
 try
   cTitulo := 'ERP - Relação de produtos';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := False;
   objExcel.Caption := cTitulo;

   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;

   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

   dm.qryGenerica.Close;
   dm.qryGenerica.SQL.Text := 'select * from tabelas_preco tb    '+
                              'where tb.descricao like ''%2017%''';
   dm.qryGenerica.Open;

   linha := 1;
   Sheet.Range['A3'].HorizontalAlignment := 3;

   Sheet.Range['A1'] := 'Referência';
   Sheet.Range['A1'].ColumnWidth := 15;
   Sheet.Range['B1'] := 'Produto';
   Sheet.Range['B1'].ColumnWidth := 40;
   Sheet.Range['C1'] := 'Unidade';
   Sheet.Range['C1'].ColumnWidth := 10;
   Sheet.Range['D1'] := 'Tipo';
   Sheet.Range['D1'].ColumnWidth := 10;
   Sheet.Range['E1'] := 'Grupo';
   Sheet.Range['E1'].ColumnWidth := 10;
   Sheet.Range['F1'] := 'Coleção';
   Sheet.Range['F1'].ColumnWidth := 10;
   Sheet.Range['G1']:= 'Tamanhos';
   Sheet.Range['G1'].ColumnWidth := 20;
   Sheet.Range['H1']:= 'Cores';
   Sheet.Range['H1'].ColumnWidth := 50;
   coluna := 8;

   dm.qryGenerica.First;
   while not dm.qryGenerica.Eof do
   begin
     inc(coluna);
     Sheet.Cells[linha,coluna]              := dm.qryGenerica.FieldByName('DESCRICAO').AsString;
     Sheet.Cells[linha,coluna].ColumnWidth  := 20;
     dm.qryGenerica.next;
   end;

   Sheet.Range['A1:R1'].font.bold  := true;


   ProgressBar1.Max := cds.RecordCount;
   ProgressBar1.Position := 0;
   cds.First;
   while not cds.Eof do
   begin
     inc(linha);
     Sheet.Cells[linha,1]              := cdsREFPRO.AsString;
     Sheet.Cells[linha,2]              := cdsPRODUTO.AsString;
     Sheet.Cells[linha,3]              := cdsUNIDADE.AsString;
     Sheet.Cells[linha,4]              := cdsTIPO.AsString;
     Sheet.Cells[linha,5]              := cdsGRUPO.AsString;
     Sheet.Cells[linha,6]              := cdsCOLECAO.AsString;
     Sheet.Cells[linha,7]              := cdsTAMANHO.AsString;
     Sheet.Cells[linha,8]              := cdsCOR.AsString;
     coluna := 8;

     qryTab.Close;
     qryTab.SQL.Text := 'select tb.descricao tabela, pt.preco from tabelas_preco tb '+
                                 ' left join produto_tabela_preco pt on ((pt.codtabela = tb.codigo) and (pt.codproduto = :codpro)) '+
                                 ' where tb.descricao like ''%2017%''';
     qryTab.ParamByName('codpro').AsInteger := cdsCODPRO.AsInteger;
     qryTab.Open;

     qryTab.First;
     while not qryTab.Eof do
     begin
       inc(coluna);
       Sheet.Cells[linha,coluna].NumberFormat := ' #.##0,00_);( #.##0,00)';
       Sheet.Cells[linha,coluna] := qryTab.FieldByName('preco').AsFloat;
       qryTab.Next;
     end;

     ProgressBar1.Position := ProgressBar1.Position + 1;
     Application.ProcessMessages;
     cds.next;
   end;

  // Sheet.Range['A2','H2'].columns.AutoFit;

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

procedure TfrmGeraArquivoMeusPedidos.separarLinhas;
var
  refpro, produto, unidade, tipo, grupo, colecao, refcor, cor, tabela, tamanho :String;
  refAtual :String;
  codpro :integer;
begin
  cds.CreateDataSet;
  qry.First;
  produto := qryDESCRICAO.AsString;
  refAtual  := '';
  while not qry.Eof do
  begin
    if produto <> qryDESCRICAO.AsString then
    begin
      cor := copy(cor, 2, length(cor));
      tamanho := copy(tamanho, 2, length(tamanho));
      cds.Append;
     cdsCODPRO.AsInteger := codpro;
      cdsREFPRO.AsString := refpro;
      cdsPRODUTO.AsString := produto;
      cdsUNIDADE.AsString := unidade;
        cdsTIPO.AsString := tipo;
      cdsGRUPO.AsString := grupo;
      cdsCOLECAO.AsString := colecao;
      cdsCOR.AsString := cor;
      cdsTAMANHO.AsString := tamanho;
      cds.Post;
      cor := '';
      tamanho := '';
      refAtual := '';
      produto := qryDESCRICAO.AsString;
    end;

    if produto = qryDESCRICAO.AsString then
    begin

      if refAtual <> qryREFCOR.AsString then
      begin
        refAtual := qryREFCOR.AsString;
        cor   := cor + ', ' + (qryREFCOR.AsString +'-'+qryCOR.AsString);
      end;

      codpro    := qryCODIGO.AsInteger;
      refpro    := qryREFERENCIA.AsString;
      produto   := qryDESCRICAO.AsString;
      unidade   := qryUNIDADE_MEDIDA.AsString;
      tipo      := qryTIPO.AsString;
      grupo     := qryGRUPO.AsString;
      colecao   := qryCOLECAO.AsString;

      if pos(qryTAM.AsString, tamanho) = 0 then
        tamanho   := tamanho + ', '+qryTAM.AsString;

    end;

    if qry.RecNo = qry.RecordCount then
    begin
      cor := copy(cor, 2, length(cor));
      tamanho := copy(tamanho, 2, length(tamanho));

      cds.Append;
     cdsCODPRO.AsInteger := codpro;
      cdsREFPRO.AsString := refpro;
      cdsPRODUTO.AsString := produto;
      cdsUNIDADE.AsString := unidade;
        cdsTIPO.AsString := tipo;
      cdsGRUPO.AsString := grupo;
      cdsCOLECAO.AsString := colecao;
      cdsCOR.AsString := cor;
      cdsTAMANHO.AsString := tamanho;
      cds.Post;
    end;


    qry.Next;
  end;
end;

end.
