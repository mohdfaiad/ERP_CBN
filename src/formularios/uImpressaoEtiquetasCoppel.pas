unit uImpressaoEtiquetasCoppel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Mask, RxToolEdit, RxCurrEdit, Grids,
  DBGrids, DB, DBClient, ComObj, DBGridCBN, ExtCtrls;

type
  TfrmImpressaoEtiquetasCoppel = class(TfrmPadrao)
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    edtPreco: TCurrencyEdit;
    Label1: TLabel;
    edtCodBar: TEdit;
    Label2: TLabel;
    edtcodTam: TEdit;
    Label3: TLabel;
    edtClasseFam: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtTamanho: TEdit;
    edtProduto: TEdit;
    Label6: TLabel;
    edtQuantidade: TCurrencyEdit;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    btnImportar: TBitBtn;
    cds: TClientDataSet;
    ds: TDataSource;
    cdspreco: TStringField;
    cdscodbar: TStringField;
    cdscodTam: TStringField;
    cdsfamilia: TStringField;
    cdstamanho: TStringField;
    cdsproduto: TStringField;
    cdsquantidade: TIntegerField;
    GridCor: TDBGridCBN;
    Shape2: TShape;
    edtTotEtiquetas: TCurrencyEdit;
    labTotRef: TLabel;
    Label8: TLabel;
    edtTotProdutos: TCurrencyEdit;
    btnAdd: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure GridCorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure imprimir;
    procedure importarEtiquetasXLS(caminho, nomeArq :String);
    procedure adicionaProduto;
    procedure limpaCampos;

    function verificaObrigatorios :Boolean;
  public
    { Public declarations }
  end;

var
  frmImpressaoEtiquetasCoppel: TfrmImpressaoEtiquetasCoppel;

implementation

{$R *.dfm}

procedure TfrmImpressaoEtiquetasCoppel.BitBtn1Click(Sender: TObject);
begin
  inherited;
  imprimir;
end;

procedure TfrmImpressaoEtiquetasCoppel.imprimir;
var i, margem: integer;
    precoInteiro, precoDecimal, sifrao, produto, tam, tamanho, codbar, familia, codTam :String;
begin

  cds.First;
  while not cds.Eof do begin

    margem       := 390;
    precoInteiro := formatFloat('0.00',cdspreco.AsFloat);
    precoDecimal := copy(precoInteiro, pos(',',precoInteiro), length(precoInteiro) );
    precoInteiro := copy(precoInteiro, 1, pos(',',precoInteiro)-1 );
    sifrao       := 'R$';
    produto      := cdsproduto.AsString;
    tam          := 'TAM  ';
    tamanho      := cdstamanho.AsString;
    codbar       := cdscodbar.AsString;
    familia      := cdsfamilia.AsString;
    codTam       := cdscodTam.AsString;

    memo1.Clear;
    memo1.Lines.Add('^XA');
    memo1.Lines.Add('^LH000,000');
    memo1.Lines.Add('^FO160,075^AUI,118,106^FD'+precoInteiro+'^FS');
    memo1.Lines.Add('^FO110,135^ASI,20,20^FD'+precoDecimal+'^FS');
    memo1.Lines.Add('^FO'+intToStr(margem-( length(sifrao) * 12 ))       +',158^ASI,56,30^FD'+sifrao+'^FS');
    memo1.Lines.Add('^FO'+intToStr(margem-( length(produto) * 12 ))      +',205^A0I,30,24^FD'+produto+'^FS');
    memo1.Lines.Add('^FO'+intToStr(margem-( length(tam+tamanho) * 12 ))  +',235^A0I,30,24^FD'+tam + tamanho+'^FS');
    memo1.Lines.Add('^FO030,282^BY2,3,12^BAI,80,N,N,N^FD' + codbar       +'^FS');
    memo1.Lines.Add('^FO'+intToStr(margem-( length(familia) * 10 ))      +',374^API,13,10^FD'+familia+'^FS');
    memo1.Lines.Add('^FO030,370^ARI^FD'+codTam+'^FS');
    memo1.Lines.Add('^PQ'+cdsquantidade.AsString);
    memo1.Lines.Add('^XZ');

    memo1.Lines.SaveToFile(ExtractFilePath( Application.ExeName )+'\etiqueta1coluna.txt');
    WinExec(PAnsiChar(AnsiString('print :LPT1 ' + ExtractFilePath( Application.ExeName )+'\etiqueta1coluna.txt')),SW_HIDE);

    cds.Next;

    Sleep(400);
  end;
end;

function TfrmImpressaoEtiquetasCoppel.verificaObrigatorios: Boolean;
begin
  Result := false;

  if edtPreco.Value <= 0 then begin
    avisar('Informar preço do produto');
    edtPreco.SetFocus;
  end
  else if length(edtCodBar.Text) < 16 then begin
    avisar('Informar código de barras');
    edtCodBar.SetFocus;
  end
  else if edtcodTam.Text = '' then begin
    avisar('Informar Código - Tamanho');
    edtcodTam.SetFocus;
  end
  else if edtClasseFam.Text = '' then begin
    avisar('Informar Classe - Família');
    edtClasseFam.SetFocus;
  end
  else if edtTamanho.Text = '' then begin
    avisar('Informar Tamanho');
    edtTamanho.SetFocus;
  end
  else if edtProduto.Text = '' then begin
    avisar('Informar Produto');
    edtProduto.SetFocus;
  end
  else if edtQuantidade.Value <= 0 then begin
    avisar('Informar Quantidade de etiquetas a serem impressas');
    edtQuantidade.SetFocus;
  end
  else
    Result := true;
end;

procedure TfrmImpressaoEtiquetasCoppel.FormShow(Sender: TObject);
begin
  inherited;
  {edtPreco.Value := 129.90;
  edtCodBar.Text := '2066101090110029';
  edtcodTam.Text := '206611 090';
  edtClasseFam.Text := '31-015';
  edtTamanho.Text := '3';
  edtProduto.Text := 'CONJUNTO BEBES MESES O';
  edtQuantidade.Value := 1;   }
end;

procedure TfrmImpressaoEtiquetasCoppel.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmImpressaoEtiquetasCoppel.btnImportarClick(Sender: TObject);
var
  Dialog :TOpenDialog;
  caminho :String;
begin
  inherited;

  try
    Dialog            := TOpenDialog.Create(nil);
    Dialog.Title      := 'Selecione o XLS';
    Dialog.DefaultExt := 'xls';
    Dialog.Filter     := 'Arquivo Excel Lojas Coppel | *.xlsx;*.xls';

    if Dialog.Execute then
      caminho := Dialog.FileName;

    if caminho <> '' then
      importarEtiquetasXLS(caminho, copy(ExtractFileName(caminho),1, length(ExtractFileName(caminho))-4 ));

  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TfrmImpressaoEtiquetasCoppel.importarEtiquetasXLS(
  caminho, nomeArq: String);
var Excel, Sheet: OleVariant;
  i :integer;
begin
  try
    try
      Excel := CreateOleObject('Excel.Application');
      Excel.WorkBooks.Open(caminho);
      Excel.Visible := false;
      //Sheet := Excel.Workbooks[1].WorkSheets[nomeArq];
    except
      on e : Exception do
        begin
          avisar('Ocorreu um erro ao abrir o arquivo.'+#13#10+ e.Message);
        end;
    end;


    try

      i := 2;

      if not cds.Active then cds.CreateDataSet;

      cds.EmptyDataSet;

      edtTotEtiquetas.AsInteger := 0;


      while Excel.WorkBooks[1].Sheets[1].Cells[i,2].value <> '' do
        begin
          cds.Append;
          cdsquantidade.AsString :=  Excel.WorkBooks[1].Sheets[1].Cells[i,1];
          cdspreco.AsString      :=  formatFloat('0.00', strToFloatDef( Excel.WorkBooks[1].Sheets[1].Cells[i, 4],0) );
          cdscodbar.AsString     :=  Excel.WorkBooks[1].Sheets[1].Cells[i, 6];
          cdscodTam.AsString     :=  Excel.WorkBooks[1].Sheets[1].Cells[i, 7];
          cdsfamilia.AsString    :=  Excel.WorkBooks[1].Sheets[1].Cells[i, 8];
          cdstamanho.AsString    :=  Excel.WorkBooks[1].Sheets[1].Cells[i, 10];
          cdsproduto.AsString    :=  Excel.WorkBooks[1].Sheets[1].Cells[i, 13];
        cds.Post;

        edtTotEtiquetas.AsInteger := edtTotEtiquetas.AsInteger + strToIntDef( Excel.WorkBooks[1].Sheets[1].Cells[i, 1], 0);

          inc(i);
      end;

      edtTotProdutos.AsInteger  := cds.RecordCount;

    except
      on e : Exception do
        begin
          avisar('Ocorreu um erro ao importar os dados do arquivo.'+#13#10+ e.Message);
        end;
    end;

  finally
    PostMessage(FindWindow('XLMAIN', nil), WM_CLOSE,0,0);
  end;
end;

procedure TfrmImpressaoEtiquetasCoppel.btnAddClick(Sender: TObject);
begin
  if verificaObrigatorios then  AdicionaProduto;
end;

procedure TfrmImpressaoEtiquetasCoppel.adicionaProduto;
begin
  if not cds.Active then cds.CreateDataSet;

  cds.Append;
  cdsquantidade.AsInteger := edtQuantidade.asInteger;
  cdspreco.AsString       := formatFloat('0.00',edtPreco.Value);
  cdscodbar.AsString      := edtCodBar.Text;
  cdscodTam.AsString      := edtcodTam.Text;
  cdsfamilia.AsString     := edtClasseFam.Text;
  cdstamanho.AsString     := edtTamanho.Text;
  cdsproduto.AsString     := edtProduto.Text;
  cds.Post;

  edtTotEtiquetas.AsInteger := edtTotEtiquetas.AsInteger + edtQuantidade.AsInteger;
  edtTotProdutos.AsInteger  := cds.RecordCount;

  limpaCampos;

end;

procedure TfrmImpressaoEtiquetasCoppel.GridCorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_delete) and not (cds.IsEmpty) and (cds.Active) then begin
    edtTotEtiquetas.AsInteger := edtTotEtiquetas.AsInteger - cdsquantidade.AsInteger;
    cds.Delete;
    edtTotProdutos.AsInteger  := cds.RecordCount;
  end;
end;

procedure TfrmImpressaoEtiquetasCoppel.limpaCampos;
begin
  edtPreco.Clear;
  edtCodBar.Clear;
  edtcodTam.Clear;
  edtClasseFam.Clear;
  edtTamanho.Clear;
  edtProduto.Clear;
  edtQuantidade.Clear;
  edtPreco.SetFocus;
end;

end.
