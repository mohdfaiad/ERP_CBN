unit RepositorioConfiguracoesECommerce;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioConfiguracoesECommerce = class(TRepositorio)

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

uses SysUtils, ConfiguracoesECommerce;

{ TRepositorioConfiguracoesECommerce }

function TRepositorioConfiguracoesECommerce.Get(Dataset: TDataSet): TObject;
var
  ConfiguracoesECommerce :TConfiguracoesECommerce;
begin
   ConfiguracoesECommerce:= TConfiguracoesECommerce.Create;
   ConfiguracoesECommerce.codigo               := self.FQuery.FieldByName('codigo').AsInteger;
   ConfiguracoesECommerce.token                := self.FQuery.FieldByName('token').AsString;
   ConfiguracoesECommerce.url_base             := self.FQuery.FieldByName('url_base').AsString;
   ConfiguracoesECommerce.cod_tabela_preco     := self.FQuery.FieldByName('cod_tabela_preco').AsInteger;
   ConfiguracoesECommerce.intervalo_verificacao := self.FQuery.FieldByName('intervalo_verificacao').AsInteger;
   ConfiguracoesECommerce.codigo_empresa       := self.FQuery.FieldByName('codigo_empresa').AsInteger;
   ConfiguracoesECommerce.codigo_representante := self.FQuery.FieldByName('codigo_representante').AsInteger;
   ConfiguracoesECommerce.codigo_forma_pagto   := self.FQuery.FieldByName('codigo_forma_pagto').AsInteger;

   result := ConfiguracoesECommerce;
end;

function TRepositorioConfiguracoesECommerce.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TConfiguracoesECommerce(Objeto).Codigo;
end;

function TRepositorioConfiguracoesECommerce.GetNomeDaTabela: String;
begin
  result := 'CONFIGUCAROES_ECOMMERCE';
end;

function TRepositorioConfiguracoesECommerce.GetRepositorio: TRepositorio;
begin
  result := TRepositorioConfiguracoesECommerce.Create;
end;

function TRepositorioConfiguracoesECommerce.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TConfiguracoesECommerce(Objeto).Codigo <= 0);
end;

procedure TRepositorioConfiguracoesECommerce.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  ConfiguracoesECommerceAntigo :TConfiguracoesECommerce;
  ConfiguracoesECommerceNovo :TConfiguracoesECommerce;
begin
   ConfiguracoesECommerceAntigo := (AntigoObjeto as TConfiguracoesECommerce);
   ConfiguracoesECommerceNovo   := (Objeto       as TConfiguracoesECommerce);

   if (ConfiguracoesECommerceAntigo.token <> ConfiguracoesECommerceNovo.token) then
     Auditoria.AdicionaCampoAlterado('token', ConfiguracoesECommerceAntigo.token, ConfiguracoesECommerceNovo.token);

   if (ConfiguracoesECommerceAntigo.url_base <> ConfiguracoesECommerceNovo.url_base) then
     Auditoria.AdicionaCampoAlterado('url_base', ConfiguracoesECommerceAntigo.url_base, ConfiguracoesECommerceNovo.url_base);

   if (ConfiguracoesECommerceAntigo.cod_tabela_preco <> ConfiguracoesECommerceNovo.cod_tabela_preco) then
     Auditoria.AdicionaCampoAlterado('cod_tabela_preco', IntToStr(ConfiguracoesECommerceAntigo.cod_tabela_preco), IntToStr(ConfiguracoesECommerceNovo.cod_tabela_preco));

   if (ConfiguracoesECommerceAntigo.intervalo_verificacao <> ConfiguracoesECommerceNovo.intervalo_verificacao) then
     Auditoria.AdicionaCampoAlterado('intervalo_verificacao', IntToStr(ConfiguracoesECommerceAntigo.intervalo_verificacao), IntToStr(ConfiguracoesECommerceNovo.intervalo_verificacao));

   if (ConfiguracoesECommerceAntigo.codigo_empresa <> ConfiguracoesECommerceNovo.codigo_empresa) then
     Auditoria.AdicionaCampoAlterado('codigo_empresa', IntToStr(ConfiguracoesECommerceAntigo.codigo_empresa), IntToStr(ConfiguracoesECommerceNovo.codigo_empresa));

   if (ConfiguracoesECommerceAntigo.codigo_representante <> ConfiguracoesECommerceNovo.codigo_representante) then
     Auditoria.AdicionaCampoAlterado('codigo_representante', IntToStr(ConfiguracoesECommerceAntigo.codigo_representante), IntToStr(ConfiguracoesECommerceNovo.codigo_representante));

   if (ConfiguracoesECommerceAntigo.codigo_forma_pagto <> ConfiguracoesECommerceNovo.codigo_forma_pagto) then
     Auditoria.AdicionaCampoAlterado('codigo_forma_pagto', IntToStr(ConfiguracoesECommerceAntigo.codigo_forma_pagto), IntToStr(ConfiguracoesECommerceNovo.codigo_forma_pagto));
end;

procedure TRepositorioConfiguracoesECommerce.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  ConfiguracoesECommerce :TConfiguracoesECommerce;
begin
  ConfiguracoesECommerce := (Objeto as TConfiguracoesECommerce);
  Auditoria.AdicionaCampoExcluido('codigo'          , IntToStr(ConfiguracoesECommerce.codigo));
  Auditoria.AdicionaCampoExcluido('token'           , ConfiguracoesECommerce.token);
  Auditoria.AdicionaCampoExcluido('url_base'        , ConfiguracoesECommerce.url_base);
  Auditoria.AdicionaCampoExcluido('cod_tabela_preco', IntToStr(ConfiguracoesECommerce.cod_tabela_preco));
  Auditoria.AdicionaCampoExcluido('intervalo_verificacao', IntToStr(ConfiguracoesECommerce.intervalo_verificacao));
  Auditoria.AdicionaCampoExcluido('codigo_empresa', IntToStr(ConfiguracoesECommerce.codigo_empresa));
  Auditoria.AdicionaCampoExcluido('codigo_representante', IntToStr(ConfiguracoesECommerce.codigo_representante));
  Auditoria.AdicionaCampoExcluido('codigo_forma_pagto', IntToStr(ConfiguracoesECommerce.codigo_forma_pagto));
end;

procedure TRepositorioConfiguracoesECommerce.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  ConfiguracoesECommerce :TConfiguracoesECommerce;
begin
  ConfiguracoesECommerce := (Objeto as TConfiguracoesECommerce);
  Auditoria.AdicionaCampoIncluido('codigo'          ,    IntToStr(ConfiguracoesECommerce.codigo));
  Auditoria.AdicionaCampoIncluido('token'           ,    ConfiguracoesECommerce.token);
  Auditoria.AdicionaCampoIncluido('url_base'        ,    ConfiguracoesECommerce.url_base);
  Auditoria.AdicionaCampoIncluido('cod_tabela_preco',    IntToStr(ConfiguracoesECommerce.cod_tabela_preco));
  Auditoria.AdicionaCampoIncluido('intervalo_verificacao', IntToStr(ConfiguracoesECommerce.intervalo_verificacao));
  Auditoria.AdicionaCampoIncluido('codigo_empresa', IntToStr(ConfiguracoesECommerce.codigo_empresa));
  Auditoria.AdicionaCampoIncluido('codigo_representante', IntToStr(ConfiguracoesECommerce.codigo_representante));
  Auditoria.AdicionaCampoIncluido('codigo_forma_pagto', IntToStr(ConfiguracoesECommerce.codigo_forma_pagto));
end;

procedure TRepositorioConfiguracoesECommerce.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TConfiguracoesECommerce(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioConfiguracoesECommerce.SetParametros(Objeto: TObject);
var
  ConfiguracoesECommerce :TConfiguracoesECommerce;
begin
  ConfiguracoesECommerce := (Objeto as TConfiguracoesECommerce);

  self.FQuery.ParamByName('codigo').AsInteger           := 1;
  self.FQuery.ParamByName('token').AsString             := ConfiguracoesECommerce.token;
  self.FQuery.ParamByName('url_base').AsString          := ConfiguracoesECommerce.url_base;
  if ConfiguracoesECommerce.cod_tabela_preco > 0 then
    self.FQuery.ParamByName('cod_tabela_preco').AsInteger := ConfiguracoesECommerce.cod_tabela_preco;
  self.FQuery.ParamByName('intervalo_verificacao').AsInteger := ConfiguracoesECommerce.intervalo_verificacao;
  self.FQuery.ParamByName('codigo_empresa').AsInteger := ConfiguracoesECommerce.codigo_empresa;
  self.FQuery.ParamByName('codigo_representante').AsInteger := ConfiguracoesECommerce.codigo_representante;
  self.FQuery.ParamByName('codigo_forma_pagto').AsInteger := ConfiguracoesECommerce.codigo_forma_pagto;
end;

function TRepositorioConfiguracoesECommerce.SQLGet: String;
begin
  result := 'select * from CONFIGUCAROES_ECOMMERCE where codigo = :ncod';
end;

function TRepositorioConfiguracoesECommerce.SQLGetAll: String;
begin
  result := 'select * from CONFIGUCAROES_ECOMMERCE';
end;

function TRepositorioConfiguracoesECommerce.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), self.GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioConfiguracoesECommerce.SQLRemover: String;
begin
  result := ' delete from CONFIGUCAROES_ECOMMERCE where codigo = :codigo ';
end;

function TRepositorioConfiguracoesECommerce.SQLSalvar: String;
begin
  result := 'update or insert into CONFIGUCAROES_ECOMMERCE (CODIGO ,TOKEN ,URL_BASE ,COD_TABELA_PRECO, INTERVALO_VERIFICACAO, CODIGO_EMPRESA, CODIGO_REPRESENTANTE, CODIGO_FORMA_PAGTO) '+
            '                      values ( :CODIGO , :TOKEN , :URL_BASE , :COD_TABELA_PRECO, :INTERVALO_VERIFICACAO, :CODIGO_EMPRESA, :CODIGO_REPRESENTANTE, :CODIGO_FORMA_PAGTO) ';
end;

end.

