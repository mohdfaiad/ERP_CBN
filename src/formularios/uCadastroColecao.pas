unit uCadastroColecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, StdCtrls, DB, DBClient, Grids, DBGrids,
  DBGridCBN, ComCtrls, Buttons, ExtCtrls, contNrs;

type
  TfrmCadastroColecao = class(TfrmCadastroPadrao)
    edtCodigo: TEdit;
    Label5: TLabel;
    edtDescricao: TEdit;
    cdsCODIGO: TIntegerField;
    cdsDESCRICAO: TStringField;
  private
    procedure AlterarRegistroNoCDS(Registro :TObject); override;

    { Carrega todos os registros pra aba de Consulta }
    procedure CarregarDados;                           override;

    procedure ExecutarDepoisAlterar;                   override;
    procedure ExecutarDepoisIncluir;                   override;

    { Inclui um registro no CDS }
    procedure IncluirRegistroNoCDS(Registro :TObject); override;

    { Limpa as informações da aba Dados }
    procedure LimparDados;                             override;

    { Mostra um registro detalhado na aba de Dados   }
    procedure MostrarDados;                            override;

  private
    { Persiste os dados no banco de dados }
    function GravarDados   :TObject;                   override;

    { Verifica os dados antes de persistir }
    function VerificaDados :Boolean;                   override;
  end;

var
  frmCadastroColecao: TfrmCadastroColecao;

implementation

uses Colecao, Repositorio, FabricaRepositorio;

{$R *.dfm}

{ TfrmCadastroPadrao1 }

procedure TfrmCadastroColecao.AlterarRegistroNoCDS(Registro: TObject);
var
  Colecao :TColecao;
begin
  inherited;

  Colecao := (Registro as TColecao);

  self.cds.Edit;
  self.cdsCODIGO.AsInteger   := Colecao.codigo;
  self.cdsDESCRICAO.AsString := Colecao.descricao;
  self.cds.Post;
end;

procedure TfrmCadastroColecao.CarregarDados;
var
  Colecoes    :TObjectList;
  Repositorio :TRepositorio;
  nX          :Integer;
begin
  inherited;

  Repositorio := nil;
  Colecoes    := nil;

  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TColecao.ClassName);
    Colecoes    := Repositorio.GetAll;

    if Assigned(Colecoes) and (Colecoes.Count > 0) then begin

       for nX := 0 to (Colecoes.Count-1) do
         self.IncluirRegistroNoCDS(Colecoes.Items[nX]);
         
    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Colecoes);
  end;
end;

procedure TfrmCadastroColecao.ExecutarDepoisAlterar;
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadastroColecao.ExecutarDepoisIncluir;
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TfrmCadastroColecao.GravarDados: TObject;
var
  Colecao             :TColecao;
  RepositorioColecao  :TRepositorio;
begin
   Colecao             := nil;
   RepositorioColecao  := nil;

   try
     RepositorioColecao  := TFabricaRepositorio.GetRepositorio(TColecao.ClassName);
     Colecao             := TColecao(RepositorioColecao.Get(StrToIntDef(self.edtCodigo.Text, 0)));

     if not Assigned(Colecao) then
      Colecao := TColecao.Create;

     Colecao.descricao                := self.edtDescricao.Text;

     RepositorioColecao.Salvar(Colecao);

     result := Colecao;

   finally
     FreeAndNil(RepositorioColecao);

   end;
end;

procedure TfrmCadastroColecao.IncluirRegistroNoCDS(Registro: TObject);
var
  Colecao :TColecao;
begin
  inherited;

  Colecao := (Registro as TColecao);

  self.cds.Append;
  self.cdsCODIGO.AsInteger   := Colecao.codigo;
  self.cdsDESCRICAO.AsString := Colecao.descricao;
  self.cds.Post;
end;

procedure TfrmCadastroColecao.LimparDados;
begin
  inherited;
  edtCodigo.Clear;
  edtDescricao.Clear;
end;

procedure TfrmCadastroColecao.MostrarDados;
var
  Colecao                              :TColecao;
  RepositorioColecao                   :TRepositorio;
begin
  inherited;

  Colecao                              := nil;
  RepositorioColecao                   := nil;

  try
    RepositorioColecao  := TFabricaRepositorio.GetRepositorio(TColecao.ClassName);

    Colecao             := TColecao(RepositorioColecao.Get(self.cdsCODIGO.AsInteger));

    if not Assigned(Colecao) then exit;

    self.edtCodigo.Text               := IntToStr(Colecao.codigo);
    self.edtDescricao.Text            := Colecao.descricao;

  finally
    FreeAndNil(RepositorioColecao);
    FreeAndNil(Colecao);
  end;
end;


function TfrmCadastroColecao.VerificaDados: Boolean;
begin
result := true;

  if trim(edtDescricao.Text) = '' then begin
    avisar('Favor informar a descrição da matéria');
    edtDescricao.SetFocus;
    result := false;
  end;
end;

end.
