unit frameBuscaFormaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask, RxToolEdit, RxCurrEdit, ObjetoGenerico, FormaPagamento;

type
  TBuscaFormaPagamento = class(TFrame)
    StaticText1: TStaticText;
    edtCodigo: TCurrencyEdit;
    btnBusca: TBitBtn;
    edtDescricao: TEdit;
    StaticText2: TStaticText;
    procedure btnBuscaClick(Sender: TObject);
    procedure edtDescricaoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    FFormaPagamento :TFormaPagamento;
    FAposAlterarFormaPagamento: TNotifyEvent;

    procedure SetFormaPagamento(const Value: Integer);
    procedure SetAposAlterarFormaPagamento(const Value: TNotifyEvent);
    procedure buscaFormaPagamento(codigo:Integer);

  public
     procedure limpa;

  public
     property codigoFormaPagamento       :Integer         write SetFormaPagamento;
     property FormaPagamento             :TFormaPagamento read  FFormaPagamento write FFormaPagamento;
     property AposAlterarFormaPagamento  :TNotifyEvent    read  FAposAlterarFormaPagamento write SetAposAlterarFormaPagamento;
  end;

implementation

uses uPesquisaSimples, repositorio, fabricaRepositorio;

{$R *.dfm}

{ TBuscaFormaPagamento }

procedure TBuscaFormaPagamento.buscaFormaPagamento(codigo: Integer);
var
  repositorio  :TRepositorio;
  campoRetorno :String;
  FormaPagamento :TFormaPagamento;
begin
  repositorio     := nil;
  FFormaPagamento := nil;
  repositorio     := TFabricaRepositorio.GetRepositorio(TFormaPagamento.ClassName);
  FFormaPagamento := TFormaPagamento(repositorio.Get(codigo));

  if assigned(FFormaPagamento) then
  begin
    edtCodigo.Value   := FFormaPagamento.Codigo;
    edtDescricao.Text := FFormaPagamento.Descricao;
  end
  else
    limpa;

  if Assigned(self.FAposAlterarFormaPagamento) then
    self.FAposAlterarFormaPagamento(FFormaPagamento);
end;

procedure TBuscaFormaPagamento.SetAposAlterarFormaPagamento(const Value: TNotifyEvent);
begin
  FAposAlterarFormaPagamento := Value;
end;

procedure TBuscaFormaPagamento.SetFormaPagamento(const Value: Integer);
begin
  buscaFormaPagamento(value);
end;

procedure TBuscaFormaPagamento.btnBuscaClick(Sender: TObject);
var campoRetorno :String;
begin
  campoRetorno := 'CODIGO';

  frmPesquisaSimples := TFrmPesquisaSimples.Create(Self,'Select codigo, descricao, numero_parcelas, desconto, acrescimo from formas_pgto',
                                                         campoRetorno, 'Selecione a Forma de Pagamento desejada...');

  if frmPesquisaSimples.ShowModal = mrOk then
    buscaFormaPagamento(frmPesquisaSimples.cds_retorno.Fields[0].AsInteger);

  frmPesquisaSimples.Release;

  edtDescricao.SetFocus;
end;

procedure TBuscaFormaPagamento.edtDescricaoEnter(Sender: TObject);
begin
  keybd_event(VK_RETURN, 0, 0, 0);
end;

procedure TBuscaFormaPagamento.edtCodigoExit(Sender: TObject);
begin
  if edtCodigo.Value > 0 then
    buscaFormaPagamento(edtCodigo.AsInteger)
  else
    limpa;
end;

procedure TBuscaFormaPagamento.limpa;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;

  if Assigned(FFormaPagamento) then
    FreeAndNil(FFormaPagamento);
end;

procedure TBuscaFormaPagamento.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    if edtCodigo.Value <= 0 then
      btnBusca.Click;
end;

end.
