unit frameBuscaTabelaPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask, RxToolEdit, RxCurrEdit, ObjetoGenerico;

type
  TBuscaTabelaPreco = class(TFrame)
    StaticText1: TStaticText;
    edtCodigo: TCurrencyEdit;
    btnBusca: TBitBtn;
    edtDescricao: TEdit;
    StaticText2: TStaticText;
    procedure edtCodigoExit(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure edtDescricaoEnter(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    Tabela :TObjetoGenerico;  
    FcodTabela: String;
    { Private declarations }
    procedure buscaTabela(codigo:String);
    procedure SetcodTabela(const Value: String);

  public
    procedure limpa;

    property codTabela :String read FcodTabela write SetcodTabela;
  end;

implementation

uses uPesquisaSimples;

{$R *.dfm}

procedure TBuscaTabelaPreco.buscaTabela(codigo: String);
var campoRetorno :String;
begin
  campoRetorno := 'CODIGO'; //campo que deseja que retorne

  if Tabela = nil then
    Tabela := TObjetoGenerico.Create;

  Tabela.SQL := 'Select first 1 codigo,descricao from tabelas_preco where '+campoRetorno+' = '+ codigo;

  if not Tabela.BuscaVazia then begin
    FcodTabela         := Tabela.getCampo('codigo').AsString;
    edtCodigo.Text    := Tabela.getCampo('codigo').AsString;
    edtDescricao.Text := Tabela.getCampo('descricao').AsString;
  end
  else
    limpa;

  FreeAndNil(Tabela);
end;

procedure TBuscaTabelaPreco.edtCodigoExit(Sender: TObject);
begin
  if edtCodigo.Value > 0 then
    buscaTabela(edtCodigo.Text)
  else
    limpa;
end;

procedure TBuscaTabelaPreco.SetcodTabela(const Value: String);
begin
  buscaTabela(value);
end;

procedure TBuscaTabelaPreco.btnBuscaClick(Sender: TObject);
var campoRetorno :String;
begin
  campoRetorno := 'CODIGO';

  frmPesquisaSimples := TFrmPesquisaSimples.Create(Self,'Select codigo,descricao from tabelas_preco',
                                                         campoRetorno, 'Selecione a Tabela desejada...');

  if frmPesquisaSimples.ShowModal = mrOk then
    buscaTabela(frmPesquisaSimples.cds_retorno.Fields[0].AsString);

  frmPesquisaSimples.Release;

  edtDescricao.SetFocus;
end;

procedure TBuscaTabelaPreco.edtDescricaoEnter(Sender: TObject);
begin
  keybd_event(VK_RETURN, 0, 0, 0);
end;

procedure TBuscaTabelaPreco.limpa;
begin
  edtCodigo.Text    := '';
  edtDescricao.Text := '';
  FcodTabela        := '';
end;

procedure TBuscaTabelaPreco.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    if edtCodigo.Value <= 0 then
      btnBusca.Click;
end;

end.
