unit RepositorioRelacaoTabelasImportacao;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioRelacaoTabelasImportacao = class(TRepositorio)

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

uses SysUtils, RelacaoTabelasImportacao;

{ TRepositorioRelacaoTabelasImportacao }

function TRepositorioRelacaoTabelasImportacao.Get(Dataset: TDataSet): TObject;
var
  RelacaoTabelasImportacao :TRelacaoTabelasImportacao;
begin
   RelacaoTabelasImportacao:= TRelacaoTabelasImportacao.Create;
   RelacaoTabelasImportacao.codigo     := self.FQuery.FieldByName('codigo').AsInteger;
   RelacaoTabelasImportacao.url        := self.FQuery.FieldByName('url').AsString;
   RelacaoTabelasImportacao.id_externo := self.FQuery.FieldByName('id_externo').AsString;
   RelacaoTabelasImportacao.tabela_erp := self.FQuery.FieldByName('tabela_erp').AsString;
   RelacaoTabelasImportacao.id_erp     := self.FQuery.FieldByName('id_erp').AsString;
   RelacaoTabelasImportacao.data_alteracao     := self.FQuery.FieldByName('data_alteracao').AsDateTime;

   result := RelacaoTabelasImportacao;
end;

function TRepositorioRelacaoTabelasImportacao.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TRelacaoTabelasImportacao(Objeto).Codigo;
end;

function TRepositorioRelacaoTabelasImportacao.GetNomeDaTabela: String;
begin
  result := 'RELACAO_TAB_IMPORTACAO';
end;

function TRepositorioRelacaoTabelasImportacao.GetRepositorio: TRepositorio;
begin
  result := TRepositorioRelacaoTabelasImportacao.Create;
end;

function TRepositorioRelacaoTabelasImportacao.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TRelacaoTabelasImportacao(Objeto).Codigo <= 0);
end;

procedure TRepositorioRelacaoTabelasImportacao.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  RelacaoTabelasImportacaoAntigo :TRelacaoTabelasImportacao;
  RelacaoTabelasImportacaoNovo :TRelacaoTabelasImportacao;
begin
   RelacaoTabelasImportacaoAntigo := (AntigoObjeto as TRelacaoTabelasImportacao);
   RelacaoTabelasImportacaoNovo   := (Objeto       as TRelacaoTabelasImportacao);

   if (RelacaoTabelasImportacaoAntigo.url <> RelacaoTabelasImportacaoNovo.url) then
     Auditoria.AdicionaCampoAlterado('url', RelacaoTabelasImportacaoAntigo.url, RelacaoTabelasImportacaoNovo.url);

   if (RelacaoTabelasImportacaoAntigo.id_externo <> RelacaoTabelasImportacaoNovo.id_externo) then
     Auditoria.AdicionaCampoAlterado('id_externo', RelacaoTabelasImportacaoAntigo.id_externo, RelacaoTabelasImportacaoNovo.id_externo);

   if (RelacaoTabelasImportacaoAntigo.tabela_erp <> RelacaoTabelasImportacaoNovo.tabela_erp) then
     Auditoria.AdicionaCampoAlterado('tabela_erp', RelacaoTabelasImportacaoAntigo.tabela_erp, RelacaoTabelasImportacaoNovo.tabela_erp);

   if (RelacaoTabelasImportacaoAntigo.id_erp <> RelacaoTabelasImportacaoNovo.id_erp) then
     Auditoria.AdicionaCampoAlterado('id_erp', RelacaoTabelasImportacaoAntigo.id_erp, RelacaoTabelasImportacaoNovo.id_erp);

   if (RelacaoTabelasImportacaoAntigo.data_alteracao <> RelacaoTabelasImportacaoNovo.data_alteracao) then
     Auditoria.AdicionaCampoAlterado('data_alteracao', DateTimeToStr(RelacaoTabelasImportacaoAntigo.data_alteracao), DateTimeToStr(RelacaoTabelasImportacaoNovo.data_alteracao));
end;

procedure TRepositorioRelacaoTabelasImportacao.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  RelacaoTabelasImportacao :TRelacaoTabelasImportacao;
begin
  RelacaoTabelasImportacao := (Objeto as TRelacaoTabelasImportacao);
  Auditoria.AdicionaCampoExcluido('codigo'    , IntToStr(RelacaoTabelasImportacao.codigo));
  Auditoria.AdicionaCampoExcluido('url'       , RelacaoTabelasImportacao.url);
  Auditoria.AdicionaCampoExcluido('id_externo', RelacaoTabelasImportacao.id_externo);
  Auditoria.AdicionaCampoExcluido('tabela_erp', RelacaoTabelasImportacao.tabela_erp);
  Auditoria.AdicionaCampoExcluido('id_erp'    , RelacaoTabelasImportacao.id_erp);
  Auditoria.AdicionaCampoExcluido('data_alteracao' , DateTimeToStr(RelacaoTabelasImportacao.data_alteracao));
end;

procedure TRepositorioRelacaoTabelasImportacao.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  RelacaoTabelasImportacao :TRelacaoTabelasImportacao;
begin
  RelacaoTabelasImportacao := (Objeto as TRelacaoTabelasImportacao);
  Auditoria.AdicionaCampoIncluido('codigo'    ,    IntToStr(RelacaoTabelasImportacao.codigo));
  Auditoria.AdicionaCampoIncluido('url'       ,    RelacaoTabelasImportacao.url);
  Auditoria.AdicionaCampoIncluido('id_externo',    RelacaoTabelasImportacao.id_externo);
  Auditoria.AdicionaCampoIncluido('tabela_erp',    RelacaoTabelasImportacao.tabela_erp);
  Auditoria.AdicionaCampoIncluido('id_erp'    ,    RelacaoTabelasImportacao.id_erp);
  Auditoria.AdicionaCampoIncluido('data_alteracao' , DateTimeToStr(RelacaoTabelasImportacao.data_alteracao));
end;

procedure TRepositorioRelacaoTabelasImportacao.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TRelacaoTabelasImportacao(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioRelacaoTabelasImportacao.SetParametros(Objeto: TObject);
var
  RelacaoTabelasImportacao :TRelacaoTabelasImportacao;
begin
  RelacaoTabelasImportacao := (Objeto as TRelacaoTabelasImportacao);

  self.FQuery.ParamByName('codigo').AsInteger     := RelacaoTabelasImportacao.codigo;
  self.FQuery.ParamByName('url').AsString         := RelacaoTabelasImportacao.url;
  self.FQuery.ParamByName('id_externo').AsString  := RelacaoTabelasImportacao.id_externo;
  self.FQuery.ParamByName('tabela_erp').AsString  := RelacaoTabelasImportacao.tabela_erp;
  self.FQuery.ParamByName('id_erp').AsString      := RelacaoTabelasImportacao.id_erp;
  self.FQuery.ParamByName('data_alteracao').AsDateTime := RelacaoTabelasImportacao.data_alteracao;
end;

function TRepositorioRelacaoTabelasImportacao.SQLGet: String;
begin
  result := 'select * from RELACAO_TAB_IMPORTACAO where codigo = :ncod';
end;

function TRepositorioRelacaoTabelasImportacao.SQLGetAll: String;
begin
  result := 'select * from RELACAO_TAB_IMPORTACAO';
end;

function TRepositorioRelacaoTabelasImportacao.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioRelacaoTabelasImportacao.SQLRemover: String;
begin
  result := ' delete from RELACAO_TAB_IMPORTACAO where codigo = :codigo ';
end;

function TRepositorioRelacaoTabelasImportacao.SQLSalvar: String;
begin
  result := 'update or insert into RELACAO_TAB_IMPORTACAO (CODIGO ,URL ,ID_EXTERNO ,TABELA_ERP ,ID_ERP, DATA_ALTERACAO) '+
           '                      values ( :CODIGO , :URL , :ID_EXTERNO , :TABELA_ERP , :ID_ERP, :DATA_ALTERACAO) ';
end;

end.

