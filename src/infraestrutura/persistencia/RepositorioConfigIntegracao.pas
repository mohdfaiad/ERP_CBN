unit RepositorioConfigIntegracao;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioConfigIntegracao = class(TRepositorio)

  protected
    function Get             (Dataset :TDataSet) :TObject; overload; override;
    function GetNomeDaTabela                     :String;            override;
    function GetIdentificador(Objeto :TObject)   :Variant;           override;
    function GetRepositorio                     :TRepositorio;       override;

  protected
    function SQLGet                      :String;            override;
    function SQLSalvar                   :String;            override;
    function SQLGetAll                   :String;            override;
    function SQLRemover                  :String;            override;
    function SQLGetExiste(arrayDeCampos :array of string): String;            override;

  protected
    function IsInsercao(Objeto :TObject) :Boolean;           override;
  protected
    procedure SetParametros   (Objeto :TObject                        ); override;
    procedure SetIdentificador(Objeto :TObject; Identificador :Variant); override;

  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
end;

implementation

uses SysUtils, ConfigIntegracao;

{ TRepositorioConfigIntegracao }

function TRepositorioConfigIntegracao.Get(Dataset: TDataSet): TObject;
var
  ConfigIntegracao :TConfigIntegracao;
begin
   ConfigIntegracao:= TConfigIntegracao.Create;
   ConfigIntegracao.codigo            := self.FQuery.FieldByName('codigo').AsInteger;
   ConfigIntegracao.url_base          := self.FQuery.FieldByName('url_base').AsString;
   ConfigIntegracao.company_token     := self.FQuery.FieldByName('company_token').AsString;
   ConfigIntegracao.application_token := self.FQuery.FieldByName('application_token').AsString;

   result := ConfigIntegracao;
end;

function TRepositorioConfigIntegracao.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TConfigIntegracao(Objeto).Codigo;
end;

function TRepositorioConfigIntegracao.GetNomeDaTabela: String;
begin
  result := 'CONFIG_INTEGRACAO';
end;

function TRepositorioConfigIntegracao.GetRepositorio: TRepositorio;
begin
  result := TRepositorioConfigIntegracao.Create;
end;

function TRepositorioConfigIntegracao.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TConfigIntegracao(Objeto).Codigo <= 0);
end;

procedure TRepositorioConfigIntegracao.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  ConfigIntegracaoAntigo :TConfigIntegracao;
  ConfigIntegracaoNovo :TConfigIntegracao;
begin
   ConfigIntegracaoAntigo := (AntigoObjeto as TConfigIntegracao);
   ConfigIntegracaoNovo   := (Objeto       as TConfigIntegracao);

   if (ConfigIntegracaoAntigo.url_base <> ConfigIntegracaoNovo.url_base) then
     Auditoria.AdicionaCampoAlterado('url_base', ConfigIntegracaoAntigo.url_base, ConfigIntegracaoNovo.url_base);

   if (ConfigIntegracaoAntigo.company_token <> ConfigIntegracaoNovo.company_token) then
     Auditoria.AdicionaCampoAlterado('company_token', ConfigIntegracaoAntigo.company_token, ConfigIntegracaoNovo.company_token);

   if (ConfigIntegracaoAntigo.application_token <> ConfigIntegracaoNovo.application_token) then
     Auditoria.AdicionaCampoAlterado('application_token', ConfigIntegracaoAntigo.application_token, ConfigIntegracaoNovo.application_token);

end;

procedure TRepositorioConfigIntegracao.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  ConfigIntegracao :TConfigIntegracao;
begin
  ConfigIntegracao := (Objeto as TConfigIntegracao);
  Auditoria.AdicionaCampoExcluido('codigo'           , IntToStr(ConfigIntegracao.codigo));
  Auditoria.AdicionaCampoExcluido('url_base'         , ConfigIntegracao.url_base);
  Auditoria.AdicionaCampoExcluido('company_token'    , ConfigIntegracao.company_token);
  Auditoria.AdicionaCampoExcluido('application_token', ConfigIntegracao.application_token);
end;

procedure TRepositorioConfigIntegracao.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  ConfigIntegracao :TConfigIntegracao;
begin
  ConfigIntegracao := (Objeto as TConfigIntegracao);
  Auditoria.AdicionaCampoIncluido('codigo'           ,    IntToStr(ConfigIntegracao.codigo));
  Auditoria.AdicionaCampoIncluido('url_base'         ,    ConfigIntegracao.url_base);
  Auditoria.AdicionaCampoIncluido('company_token'    ,    ConfigIntegracao.company_token);
  Auditoria.AdicionaCampoIncluido('application_token',    ConfigIntegracao.application_token);
end;

procedure TRepositorioConfigIntegracao.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TConfigIntegracao(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioConfigIntegracao.SetParametros(Objeto: TObject);
var
  ConfigIntegracao :TConfigIntegracao;
begin
  ConfigIntegracao := (Objeto as TConfigIntegracao);

  self.FQuery.ParamByName('codigo').AsInteger           := ConfigIntegracao.codigo;
  self.FQuery.ParamByName('url_base').AsString          := ConfigIntegracao.url_base;
  self.FQuery.ParamByName('company_token').AsString     := ConfigIntegracao.company_token;
  self.FQuery.ParamByName('application_token').AsString := ConfigIntegracao.application_token;
end;

function TRepositorioConfigIntegracao.SQLGet: String;
begin
  result := 'select * from CONFIG_INTEGRACAO where codigo = :ncod';
end;

function TRepositorioConfigIntegracao.SQLGetAll: String;
begin
  result := 'select * from CONFIG_INTEGRACAO';
end;

function TRepositorioConfigIntegracao.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioConfigIntegracao.SQLRemover: String;
begin
  result := ' delete from CONFIG_INTEGRACAO where codigo = :codigo ';
end;

function TRepositorioConfigIntegracao.SQLSalvar: String;
begin
  result := 'update or insert into CONFIG_INTEGRACAO (CODIGO ,URL_BASE ,COMPANY_TOKEN ,APPLICATION_TOKEN) '+
           '                      values ( :CODIGO , :URL_BASE , :COMPANY_TOKEN , :APPLICATION_TOKEN) ';
end;

end.

