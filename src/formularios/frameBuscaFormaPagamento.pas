unit frameBuscaFormaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask, RxToolEdit, RxCurrEdit, ObjetoGenerico;

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
    formaPag :TObjetoGenerico;
    FcodFormaPagamento: String;
    FNumeroParcelas :integer;
    FDesconto :Real;
    FAcrescimo :Real;
    FAposAlterarFormaPagamento :TNotifyEvent;
    FPercComissao: Real;

    procedure SetcodFormaPagamento(const Value: String);
    procedure SetAposAlterarFormaPagamento(const Value: TNotifyEvent);

    procedure buscaFormaPagamento(codigo:String);

  public
     procedure limpa;

     property codFormaPagamento :String  read FcodFormaPagamento write SetcodFormaPagamento;
     property NumeroParcelas    :Integer read FNumeroParcelas;
     property Desconto          :Real    read FDesconto;
     property Acrescimo         :Real    read FAcrescimo;
     property PercComissao      :Real    read FPercComissao;

     property AposAlterarFormaPagamento :TNotifyEvent read FAposAlterarFormaPagamento write SetAposAlterarFormaPagamento;
  end;

implementation

uses uPesquisaSimples, FormaPagamento;

{$R *.dfm}

{ TBuscaFormaPagamento }

procedure TBuscaFormaPagamento.buscaFormaPagamento(codigo: String);
var
  campoRetorno :String;
  FormaPagamento :TFormaPagamento;
begin
  campoRetorno := 'CODIGO'; //campo que deseja que retorne

  if formaPag = nil then
    formaPag := TObjetoGenerico.Create;

  formaPag.SQL := 'Select first 1 codigo, descricao, numero_parcelas, desconto, acrescimo, perc_comissao from formas_pgto where '+campoRetorno+'='+ codigo;

  FormaPagamento := nil;

  try

    if not formaPag.BuscaVazia then begin
      edtDescricao.Text  := formaPag.getCampo('descricao').AsString;
      edtCodigo.Text     := formaPag.getCampo('codigo').AsString;
      FNumeroParcelas    := formaPag.getCampo('numero_parcelas').asInteger;
      FDesconto          := formaPag.getCampo('desconto').asFloat;
      FAcrescimo         := formaPag.getCampo('acrescimo').asFloat;
      FPercComissao      := formaPag.getCampo('perc_comissao').asFloat;

      FormaPagamento           := TFormaPagamento.Create;
      FormaPagamento.Codigo    := formaPag.getCampo('codigo').AsInteger;
      FcodFormaPagamento := formaPag.getCampo('codigo').AsString;
    end
    else
      limpa;

    if Assigned(self.FAposAlterarFormaPagamento) then
      self.FAposAlterarFormaPagamento(FormaPagamento);
  finally
    FreeAndNil(FormaPagamento);
  end;

  FreeAndNil(formaPag);
end;

procedure TBuscaFormaPagamento.SetcodFormaPagamento(const Value: String);
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
    buscaFormaPagamento(frmPesquisaSimples.cds_retorno.Fields[0].AsString);

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
    buscaFormaPagamento(edtCodigo.Text)
  else
    limpa;
end;

procedure TBuscaFormaPagamento.limpa;
begin
  edtCodigo.Text     := '';
  edtDescricao.Text  := '';
  FNumeroParcelas    := 0;
  FDesconto          := 0;
  FAcrescimo         := 0;
  FPercComissao      := 0;
  FcodFormaPagamento := '';
end;

procedure TBuscaFormaPagamento.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    if edtCodigo.Value <= 0 then
      btnBusca.Click;
end;

procedure TBuscaFormaPagamento.SetAposAlterarFormaPagamento(
  const Value: TNotifyEvent);
begin
  FAposAlterarFormaPagamento := Value;
end;

end.
