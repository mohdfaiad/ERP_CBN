unit uGeraCotacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.StdCtrls, Vcl.Mask, Vcl.FileCtrl,
  RxToolEdit, RxCurrEdit, frameBuscaPessoa, frameBuscaEmpresa, Vcl.Buttons,
  Vcl.ExtCtrls, TipoPessoa;

type
  TfrmGeraCotacao = class(TfrmPadrao)
    BuscaEmpresa1: TBuscaEmpresa;
    GroupBox1: TGroupBox;
    BuscaPessoa1: TBuscaPessoa;
    Label1: TLabel;
    edtCidade: TEdit;
    edtEstado: TEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    edtPeso: TCurrencyEdit;
    edtVolume: TCurrencyEdit;
    edtValor: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    edtCaminho: TEdit;
    btnSeleciona: TBitBtn;
    pnlBotoes: TPanel;
    btnSair: TSpeedButton;
    btnImprimir: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BuscaPessoa1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    FNumPedido: String;
    { Private declarations }
  public
    property numPedido :String read FNumPedido write FNumPedido;
  end;

var
  frmGeraCotacao: TfrmGeraCotacao;

implementation

{$R *.dfm}

procedure TfrmGeraCotacao.btnImprimirClick(Sender: TObject);
var arq: TextFile;
begin
  AssignFile(arq, edtCaminho.Text+'\Cotacao_Ped_'+FNumPedido+'.txt');
  Rewrite(arq);

  Writeln(arq, 'CIDADE: '+edtCidade.Text);
  Writeln(arq, 'ESTADO: '+edtEstado.Text);
  Writeln(arq, 'PESO: '+FloatToStr(edtPeso.Value)+' KG   VOL: '+IntTostr(edtVolume.AsInteger));
  Writeln(arq, 'VALOR: '+FloatToStr(edtValor.Value));
  Writeln(arq, 'EMPRESA: '+BuscaEmpresa1.Empresa.CPF_CNPJ);
  Writeln(arq, 'CNPJ: '+BuscaPessoa1.cnpj);
  Writeln(arq, BuscaPessoa1.edtRazao.Text);
  CloseFile(arq);

  avisar('Cotação gerada com sucesso!');
end;

procedure TfrmGeraCotacao.btnSairClick(Sender: TObject);
begin
self.Close;
end;

procedure TfrmGeraCotacao.btnSelecionaClick(Sender: TObject);
var caminho :String;
begin
  SelectDirectory('Selecione a pasta destino','', caminho);

  if caminho <> '' then
    edtCaminho.Text := caminho;
end;

procedure TfrmGeraCotacao.BuscaPessoa1Exit(Sender: TObject);
begin
  if BuscaPessoa1.edtRazao.Text <> '' then
  begin
     edtCidade.Text                 := BuscaPessoa1.Cidade;
     edtEstado.Text                 := BuscaPessoa1.UF;
  end;
end;

procedure TfrmGeraCotacao.FormCreate(Sender: TObject);
begin
   BuscaPessoa1.TipoPessoa        := tpCliente;
end;

procedure TfrmGeraCotacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = VK_ESCAPE then
      btnSair.Click;
end;

procedure TfrmGeraCotacao.FormShow(Sender: TObject);
begin
  self.BuscaPessoa1Exit(nil);
end;

end.
