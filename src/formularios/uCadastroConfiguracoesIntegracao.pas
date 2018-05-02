unit uCadastroConfiguracoesIntegracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, DBGridCBN,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, contnrs;

type
  TfrmCadastroConfiguracoesIntegracao = class(TfrmCadastroPadrao)
    cdsCODIGO: TIntegerField;
    cdsURL_BASE: TStringField;
    edtApplicationToken: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtUrlBase: TEdit;
    Label3: TLabel;
    edtCompanyToken: TEdit;
    edtCodigo: TEdit;
  private
    { Altera um registro existente no CDS de consulta }
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
  frmCadastroConfiguracoesIntegracao: TfrmCadastroConfiguracoesIntegracao;

implementation

uses repositorio, fabricaRepositorio, ConfigIntegracao;

{$R *.dfm}

{ TfrmCadastroConfiguracoesIntegracao }

procedure TfrmCadastroConfiguracoesIntegracao.AlterarRegistroNoCDS(Registro: TObject);
var
  Config :TConfigIntegracao;
begin
  inherited;
  Config := (Registro as TConfigIntegracao);

  self.cds.Edit;
  self.cdsCODIGO.AsInteger  := Config.codigo;
  self.cdsURL_BASE.AsString := Config.url_base;
  self.cds.Post;
end;

procedure TfrmCadastroConfiguracoesIntegracao.CarregarDados;
var
  Configs     :TObjectList;
  Repositorio :TRepositorio;
  nX          :Integer;
begin
  inherited;

  Repositorio := nil;
  Configs    := nil;

  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TConfigIntegracao.ClassName);
    Configs     := Repositorio.GetAll;

    if Assigned(Configs) and (Configs.Count > 0) then begin

       for nX := 0 to (Configs.Count-1) do
         self.IncluirRegistroNoCDS(Configs.Items[nX]);

    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Configs);
  end;
end;

procedure TfrmCadastroConfiguracoesIntegracao.ExecutarDepoisAlterar;
begin
  inherited;
  edtApplicationToken.SetFocus;
end;

procedure TfrmCadastroConfiguracoesIntegracao.ExecutarDepoisIncluir;
begin
  inherited;
  edtApplicationToken.SetFocus;
end;

function TfrmCadastroConfiguracoesIntegracao.GravarDados: TObject;
var
  Config      :TConfigIntegracao;
  Repositorio :TRepositorio;
begin
   Config      := nil;
   Repositorio := nil;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TConfigIntegracao.ClassName);
     Config      := TConfigIntegracao(Repositorio.Get(StrToIntDef(self.edtCodigo.Text, 0)));

     if not Assigned(Config) then
      Config := TConfigIntegracao.Create;

     Config.company_token     := self.edtCompanyToken.Text;
     Config.application_token := self.edtApplicationToken.Text;
     Config.url_base          := self.edtUrlBase.Text;

     Repositorio.Salvar(Config);

     result := Config;

     //libera para recarregar ao chamar
//     fdm.configuracoesECommerce.Free;
//     fdm.configuracoesECommerce := nil;
   finally
     FreeAndNil(Repositorio);
   end;
end;

procedure TfrmCadastroConfiguracoesIntegracao.IncluirRegistroNoCDS(Registro: TObject);
var
  Config :TConfigIntegracao;
begin
  inherited;

  Config := (Registro as TConfigIntegracao);

  self.cds.Append;
  self.cdsCODIGO.AsInteger  := Config.codigo;
  self.cdsURL_BASE.AsString := Config.url_base;
  self.cds.Post;
end;

procedure TfrmCadastroConfiguracoesIntegracao.LimparDados;
begin
  inherited;
  edtCodigo.Clear;
  edtApplicationToken.Clear;
  edtCompanyToken.Clear;
  edtUrlBase.Clear;
end;

procedure TfrmCadastroConfiguracoesIntegracao.MostrarDados;
var
  Config                :TConfigIntegracao;
  Repositorio           :TRepositorio;
begin
  inherited;
  Config      := nil;
  Repositorio := nil;

  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TConfigIntegracao.ClassName);
    Config      := TConfigIntegracao(Repositorio.Get(self.cdsCODIGO.AsInteger));

    if not Assigned(Config) then exit;

    self.edtCodigo.Text           := IntToStr(Config.codigo);
    self.edtApplicationToken.Text := Config.application_token;
    self.edtCompanyToken.Text     := Config.company_token;
    self.edtUrlBase.Text          := Config.url_base;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Config);
  end;
end;

function TfrmCadastroConfiguracoesIntegracao.VerificaDados: Boolean;
begin
  result := verificar(trim(edtApplicationToken.Text) = '', 'Favor informar o token de autenticação da aplicação', edtApplicationToken) and
            verificar(trim(edtUrlBase.Text) = '', 'Favor informar a URL base da API', edtUrlBase) and
            verificar(trim(edtCompanyToken.Text) = '', 'Favor informar o token de autenticação da empresa', edtCompanyToken);
end;

end.
