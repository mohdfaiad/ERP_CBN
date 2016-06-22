unit frameBuscaEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, uModulo, ObjetoGenerico, Mask, RxToolEdit,
  RxCurrEdit;

type
  TBuscaEstado = class(TFrame)
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    btnBusca: TBitBtn;
    edtEstado: TEdit;
    edtUF: TEdit;
    edtCodigo: TCurrencyEdit;
    procedure btnBuscaClick(Sender: TObject);
    procedure edtEstadoEnter(Sender: TObject);
  private
//    cidades :TObjetoGenerico;
    FUF :String;
    FCodigoMunicipio :Integer;

    procedure SetUF(const value:String);
    procedure buscaEstado(uf :String);

    function UFValida(UF :String) :Boolean;

  public
//    destructor Destroy; override;
    procedure limpa;

  public
    property UF :String read FUF write SetUF;

  public
    procedure Clear;
  end;

implementation

uses uPesquisaSimples, DB;

{$R *.dfm}

{ TFrame1 }

procedure TBuscaEstado.buscaEstado(uf: String);
var
  campoRetorno :String;
  Estados :TObjetoGenerico;
begin
  Estados := nil;
  
  try
    campoRetorno := 'SIGLA'; //campo que deseja que retorne

    if Estados = nil then
      Estados := TObjetoGenerico.Create;

    Estados.SQL := 'Select first 1 * from Estados where '+campoRetorno+'= '''+ uf+'''';

    if not Estados.BuscaVazia then begin
      edtCodigo.Value  := Estados.getCampo('codigo').AsInteger;
      edtUF.Text       := Estados.getCampo('sigla').AsString;
      edtEstado.Text   := Estados.getCampo('nome').AsString;
    end
    else
      limpa;
  finally
    FreeAndNil(Estados);
  end;
end;

procedure TBuscaEstado.Clear;
begin
  self.limpa;
end;

procedure TBuscaEstado.limpa;
begin
  edtCodigo.Clear;
  edtUF.Clear;
  edtEstado.Clear;
end;

procedure TBuscaEstado.SetUF(const value: String);
begin
  if (value = '') or not UFValida(value) then
    limpa
  else
    buscaEstado(value);
end;

procedure TBuscaEstado.btnBuscaClick(Sender: TObject);
var campoRetorno :String;
begin
  campoRetorno := 'SIGLA';
  
  frmPesquisaSimples := TFrmPesquisaSimples.Create(Self,'select e.sigla, e.nome estado from estados e ',
                                                        campoRetorno, 'Selecione um estado...');

  if frmPesquisaSimples.ShowModal = mrOk then
    buscaEstado(frmPesquisaSimples.cds_retorno.Fields[0].AsString);

  frmPesquisaSimples.Release;

  edtEstado.SetFocus;
end;

procedure TBuscaEstado.edtEstadoEnter(Sender: TObject);
begin
  if edtUF.Text <> '' then
    buscaEstado(edtUF.Text)
  else begin
    limpa;
    btnBusca.Click;
  end;
end;

function TBuscaEstado.UFValida(UF: String): Boolean;
begin
  dm.qryGenerica.Close;
  dm.qryGenerica.SQL.Text := 'select first 1 codigo from estados where sigla = :sig';
  dm.qryGenerica.ParamByName('sig').AsString := UF;
  dm.qryGenerica.Open;

  result := dm.qryGenerica.RecordCount > 0;
end;

end.
