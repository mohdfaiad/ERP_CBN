unit uEntradaSaidaMoeda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Vcl.Buttons, Vcl.ExtCtrls, System.StrUtils;

type
  TfrmEntradaSaidaMoeda = class(TfrmPadrao)
    rgpOpcao: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cmbMoeda: TComboBox;
    edtValor: TCurrencyEdit;
    edtDescricao: TEdit;
    Label3: TLabel;
    pnlbotoes: TPanel;
    btnConfirmar: TBitBtn;
    btnVoltar: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure rgpOpcaoClick(Sender: TObject);
  private
    function verificaObrigatorios :Boolean;
    procedure lancaMovimentacao;
    procedure limpaCampos;
  public
    { Public declarations }
  end;

var
  frmEntradaSaidaMoeda: TfrmEntradaSaidaMoeda;

implementation

uses repositorio, fabricaRepositorio, EntradaSaidaMoeda;

{$R *.dfm}

procedure TfrmEntradaSaidaMoeda.btnConfirmarClick(Sender: TObject);
begin
  if verificaObrigatorios then
    if confirma('Confirma '+IfThen(rgpOpcao.ItemIndex = 0, 'ENTRADA', 'SAÍDA')+' de '+
                FormatFloat('R$ ,0.00; -,0.00', edtValor.Value)+' em '+ cmbMoeda.items[cmbMoeda.ItemIndex]+'?') then
    lancaMovimentacao;
end;

procedure TfrmEntradaSaidaMoeda.btnVoltarClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmEntradaSaidaMoeda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F6 then
    btnConfirmar.Click;
end;

procedure TfrmEntradaSaidaMoeda.lancaMovimentacao;
var repositorio  :TRepositorio;
    movimentacao :TEntradaSaidaMoeda;
begin
  repositorio  := nil;
  movimentacao := nil;
  try
    repositorio  := TFabricaRepositorio.GetRepositorio(TEntradaSaidaMoeda.ClassName);
    movimentacao := TEntradaSaidaMoeda.Create;

    movimentacao.codigo_caixa := fdm.CaixaLoja.codigo;
    movimentacao.tipo         := copy(rgpOpcao.Items[rgpOpcao.ItemIndex],1,1);
    movimentacao.valor        := edtValor.Value;
    movimentacao.descricao    := edtDescricao.Text;
    movimentacao.hora         := time;
    movimentacao.tipo_moeda   := cmbMoeda.ItemIndex;

    repositorio.Salvar(movimentacao);

    avisar('Operação realizada com sucesso!');
    limpaCampos;

  finally
    FreeAndNil(repositorio);
    FreeAndNil(Movimentacao);
  end;
end;

procedure TfrmEntradaSaidaMoeda.limpaCampos;
begin
  cmbMoeda.ItemIndex := 0;
  edtValor.Clear;
  edtDescricao.Clear;
end;

procedure TfrmEntradaSaidaMoeda.rgpOpcaoClick(Sender: TObject);
begin
  cmbMoeda.Enabled     := true;
  edtValor.Enabled     := true;
  edtDescricao.Enabled := true;
end;

function TfrmEntradaSaidaMoeda.verificaObrigatorios: Boolean;
begin
  result := false;

  if cmbMoeda.ItemIndex <= 0 then
  begin
    avisar('Favor informar a moeda para movimentação');
    cmbMoeda.SetFocus;
    cmbMoeda.DroppedDown := True;
  end
  else if edtValor.Value <= 0 then
  begin
    avisar('Favor informar o valor da movimentação');
    edtValor.SetFocus;
  end
  else if length(edtDescricao.Text) < 5 then
  begin
    avisar('Favor descrever a movimentação');
    edtDescricao.SetFocus;
  end
  else
    result := true;
end;

end.
