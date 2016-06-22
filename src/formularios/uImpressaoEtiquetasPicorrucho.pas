unit uImpressaoEtiquetasPicorrucho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uPadrao, Buttons, Mask, RxToolEdit, RxCurrEdit, DB, Grids, DBGrids,
  DBClient, DBGridCBN, ExtCtrls;

type
  TfrmImpressaoEtiquetasPicorrucho = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    edtPrecoParc: TCurrencyEdit;
    edtCodBar: TEdit;
    edtCodFornecedor: TEdit;
    edtProduto: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    edtQtdParc: TCurrencyEdit;
    Label3: TLabel;
    edtPrecoVenda: TCurrencyEdit;
    Label5: TLabel;
    ds: TDataSource;
    cds: TClientDataSet;
    lab: TLabel;
    cdscodbar: TStringField;
    cdsproduto: TStringField;
    cdscod_forn: TStringField;
    cdspreco_parc: TStringField;
    cdsqtd_parc: TStringField;
    cdspreco_venda: TStringField;
    Memo1: TMemo;
    GridCor: TDBGridCBN;
    btnAdicionar: TBitBtn;
    cdsproduto2: TStringField;
    edtQtdEtiquetas: TCurrencyEdit;
    Label7: TLabel;
    cdsqtd_etiquetas: TIntegerField;
    rgTipoEtiqueta: TRadioGroup;
    gpbCaminhoLogo: TGroupBox;
    btnSeleciona: TSpeedButton;
    edtCaminho: TEdit;
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtQtdParcChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rgTipoEtiquetaClick(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
  private
    procedure imprimir;
    procedure limpaCampos;

    function verificaObrigatorios :boolean;
    function retornaIdQuebra(texto :String; meio :integer; Left_Right :String):integer;
  public
    { Public declarations }
  end;

var
  frmImpressaoEtiquetasPicorrucho: TfrmImpressaoEtiquetasPicorrucho;

implementation

{$R *.dfm}

{ TForm1 }

procedure TfrmImpressaoEtiquetasPicorrucho.imprimir;
var
  F: TextFile;
  i, lin7, lin6, coluna, margem, margem_logo :integer;
  empresa ,codbar, prod, prod2, codForn, precoParc, precoVenda, QtdParc, nome_logo :String;
begin
  nome_Logo := '';

  coluna := 1;
  lin7 := 020;  lin6 := 020;  margem_logo := 0;

  cds.First;
  while not cds.Eof do begin

     for i := 1 to cdsqtd_etiquetas.AsInteger do begin

        if      coluna = 1 then   margem := 265
        else if coluna = 2 then   margem := 545
        else if coluna = 3 then   margem := 825;

        empresa    := 'PICORRUCHO';
        codbar     := cdscodbar.AsString;
        prod       := TRIM(copy(cdsproduto.AsString,1,retornaIdQuebra(cdsproduto.AsString,21,'L')));
        prod2      := TRIM(copy(cdsproduto.AsString,retornaIdQuebra(cdsproduto.AsString,21,'L'),20));
        codForn    := cdscod_forn.AsString;
        precoParc  := '    ' + formatFloat('0.00',cdspreco_parc.AsFloat);
        QtdParc    := cdsqtd_parc.AsString+'x';
        precoVenda := 'Total '+formatFloat('0.00',cdspreco_venda.AsFloat);
        nome_Logo := edtCaminho.Text;

        if nome_Logo <> '' then
          memo1.Lines.Add('^FO'+intToStr(margem_logo)                     +',320^XGE:'+ nome_Logo +'.GRF^FS');

        memo1.Lines.Add('^FO'+intToStr(margem-(length(precoVenda)*12))  +',020^ADI,15,12^FD'+precoVenda+'^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length(QtdParc)*12))     +',045^ADI,15,12^FD'+QtdParc+'^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length(precoParc)*12))   +',040^ARI,15,12^FD'+precoParc+'^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length(prod)*12))        +',105^ADI,15,12^FD'+prod+'^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length(prod2)*12))       +',080^ADI,15,12^FD'+prod2+'^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length(codbar)*12))      +',135^ADI,15,12^FD'+codbar+'^FS');
        memo1.Lines.Add('^FO'+intToStr(lin6)                            +',160^BY2,3,12^BCI,80,N,N,N^FD'+codbar+'^FS');
        memo1.Lines.Add('^FO'+intToStr(lin7)                            +',240^ADI,15,12^FD'+codForn+'^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length(empresa)*12))     +',260^AQI,15,12^FD'+empresa+'^FS');

        lin7 := lin7 + 278;   lin6 := lin6 + 278;  margem_logo := margem_logo + 282;

        inc(coluna);

        if (coluna = 4) or ((cds.RecNo = cds.RecordCount) and (i = cdsqtd_etiquetas.AsInteger)) then begin
          lin7 := 020;  lin6 := 020; margem_logo := 0;
          coluna := 1;
          memo1.Lines.Add('^XZ');
          memo1.Lines.SaveToFile(ExtractFilePath( Application.ExeName )+'\etiqueta3colunasPicorrucho.txt');
          WinExec(PAnsiChar(AnsiString('print :LPT1 '+ExtractFilePath( Application.ExeName )+'\etiqueta3colunasPicorrucho.txt')),SW_HIDE);
          sleep(600);
          memo1.Clear;
          memo1.Lines.Add('^XA');
          memo1.Lines.Add('^LH000,000');

      end;

     end;

    cds.Next;
  end;

  cds.EmptyDataSet;
end;

procedure TfrmImpressaoEtiquetasPicorrucho.btnAdicionarClick(
  Sender: TObject);
begin
  if not cds.Active then   cds.CreateDataSet;

  if not verificaObrigatorios then  exit;
  
  cds.Append;
  cdscodbar.AsString         := edtCodBar.Text;
  cdsproduto.AsString        := edtProduto.Text;
  cdscod_forn.AsString       := edtCodFornecedor.Text;
  cdspreco_parc.AsString     := formatFloat('0.00',edtPrecoParc.value);
  cdsqtd_parc.AsString       := edtQtdParc.Text;
  cdspreco_venda.AsString    := formatFloat('0.00',edtPrecoVenda.Value);
  cdsqtd_etiquetas.AsInteger := edtQtdEtiquetas.AsInteger;
  cds.Post;

  edtCodBar.SetFocus;

  limpaCampos;

end;

function TfrmImpressaoEtiquetasPicorrucho.verificaObrigatorios: boolean;
begin
  Result := false;

  if length(edtCodBar.Text) < 7 then begin
    avisar('Informar código de barras');
    edtCodBar.SetFocus;
  end
  else if edtProduto.Text = '' then begin
    avisar('Informar Produto');
    edtProduto.SetFocus;
  end
  else if edtCodFornecedor.Text = '' then begin
    avisar('Informar código do fornecedor');
    edtCodFornecedor.SetFocus;
  end
  else if edtPrecoParc.Value <= 0 then begin
    avisar('Informar preço da parcela');
    edtPrecoParc.SetFocus;
  end
  else if edtQtdParc.Value <= 0 then begin
    avisar('Informar quantidade de parcelas');
    edtQtdParc.SetFocus;
  end
  else if edtPrecoVenda.Value <= 0 then begin
    avisar('Informar preço de venda do produto');
    edtPrecoVenda.SetFocus;
  end
  else
    Result := true;
end;

procedure TfrmImpressaoEtiquetasPicorrucho.edtQtdParcChange(
  Sender: TObject);
begin
  edtPrecoVenda.Value := edtPrecoParc.Value * edtQtdParc.Value;
end;

procedure TfrmImpressaoEtiquetasPicorrucho.BitBtn1Click(Sender: TObject);
begin
  if (cds.Active) and not (cds.IsEmpty) then  imprimir;

  edtCodBar.SetFocus;
end;

procedure TfrmImpressaoEtiquetasPicorrucho.BitBtn2Click(Sender: TObject);
begin
  if confirma('Deseja cancelar impressão e voltar a tela inicial?') then  Close
                                                                    else  edtCodBar.SetFocus;
end;

procedure TfrmImpressaoEtiquetasPicorrucho.limpaCampos;
begin
  edtCodBar.Clear;
  edtProduto.Clear;
  edtCodFornecedor.Clear;
  edtPrecoParc.Clear;
  edtQtdParc.Clear;
  edtPrecoVenda.Clear;
  edtQtdEtiquetas.Clear;
end;

function TfrmImpressaoEtiquetasPicorrucho.retornaIdQuebra(texto: String;
  meio: integer; Left_Right: String): integer;
var i, pos :integer;
begin
  i := 1;

  if length(trim(texto)) < 22 then begin
    result := 21;
    exit;
  end;

  while i < meio do begin

    if Left_Right = 'L' then
      pos := meio-i
    else if Left_Right = 'R' then
      pos := meio + 1;

    if texto[pos] = ' ' then begin
      result := pos;
      break;
    end;

    inc(i);

  end;

end;

procedure TfrmImpressaoEtiquetasPicorrucho.rgTipoEtiquetaClick(
  Sender: TObject);
begin
  gpbCaminhoLogo.Visible := (rgTipoEtiqueta.ItemIndex = 1);

  if not gpbCaminhoLogo.Visible then
    edtCaminho.Clear;

end;

procedure TfrmImpressaoEtiquetasPicorrucho.btnSelecionaClick(
  Sender: TObject);
var Dialog :TOpenDialog;
  caminho  :String;
begin
  try
    caminho := '';

    Dialog            := TOpenDialog.Create(nil);
    Dialog.Title      := 'Selecione a Logomarca';
    Dialog.DefaultExt := 'png';
    Dialog.Filter     := 'Logomarca para etiqueta | *.png';

    if Dialog.Execute then
      caminho := Dialog.FileName;

    if caminho <> '' then
      edtCaminho.Text := copy(ExtractFileName(caminho), 1, length(ExtractFileName(caminho)) - 4);

  finally
    FreeAndNil(Dialog);
  end;
end;

end.
