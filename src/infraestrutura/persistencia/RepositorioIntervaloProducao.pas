unit RepositorioIntervaloProducao;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioIntervaloProducao = class(TRepositorio)

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

uses SysUtils, IntervaloProducao;

{ TRepositorioIntervaloProducao }

function TRepositorioIntervaloProducao.Get(Dataset: TDataSet): TObject;
var
  IntervaloProducao :TIntervaloProducao;
begin
   IntervaloProducao:= TIntervaloProducao.Create;
   IntervaloProducao.codigo      := self.FQuery.FieldByName('codigo').AsInteger;
   IntervaloProducao.hora_inicio := self.FQuery.FieldByName('hora_inicio').AsDateTime;
   IntervaloProducao.hora_fim    := self.FQuery.FieldByName('hora_fim').AsDateTime;

   result := IntervaloProducao;
end;

function TRepositorioIntervaloProducao.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TIntervaloProducao(Objeto).Codigo;
end;

function TRepositorioIntervaloProducao.GetNomeDaTabela: String;
begin
  result := 'INTERVALOS_PRODUCAO';
end;

function TRepositorioIntervaloProducao.GetRepositorio: TRepositorio;
begin
  result := TRepositorioIntervaloProducao.Create;
end;

function TRepositorioIntervaloProducao.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TIntervaloProducao(Objeto).Codigo <= 0);
end;

procedure TRepositorioIntervaloProducao.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  IntervaloProducaoAntigo :TIntervaloProducao;
  IntervaloProducaoNovo :TIntervaloProducao;
begin
   IntervaloProducaoAntigo := (AntigoObjeto as TIntervaloProducao);
   IntervaloProducaoNovo   := (Objeto       as TIntervaloProducao);

   if (IntervaloProducaoAntigo.hora_inicio <> IntervaloProducaoNovo.hora_inicio) then
     Auditoria.AdicionaCampoAlterado('hora_inicio', DateTimeToStr(IntervaloProducaoAntigo.hora_inicio), DateTimeToStr(IntervaloProducaoNovo.hora_inicio));

   if (IntervaloProducaoAntigo.hora_fim <> IntervaloProducaoNovo.hora_fim) then
     Auditoria.AdicionaCampoAlterado('hora_fim', DateTimeToStr(IntervaloProducaoAntigo.hora_fim), DateTimeToStr(IntervaloProducaoNovo.hora_fim));

end;

procedure TRepositorioIntervaloProducao.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  IntervaloProducao :TIntervaloProducao;
begin
  IntervaloProducao := (Objeto as TIntervaloProducao);
  Auditoria.AdicionaCampoExcluido('codigo'     , IntToStr(IntervaloProducao.codigo));
  Auditoria.AdicionaCampoExcluido('hora_inicio', DateTimeToStr(IntervaloProducao.hora_inicio));
  Auditoria.AdicionaCampoExcluido('hora_fim'   , DateTimeToStr(IntervaloProducao.hora_fim));
end;

procedure TRepositorioIntervaloProducao.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  IntervaloProducao :TIntervaloProducao;
begin
  IntervaloProducao := (Objeto as TIntervaloProducao);
  Auditoria.AdicionaCampoIncluido('codigo'     ,    IntToStr(IntervaloProducao.codigo));
  Auditoria.AdicionaCampoIncluido('hora_inicio',    DateTimeToStr(IntervaloProducao.hora_inicio));
  Auditoria.AdicionaCampoIncluido('hora_fim'   ,    DateTimeToStr(IntervaloProducao.hora_fim));
end;

procedure TRepositorioIntervaloProducao.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TIntervaloProducao(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioIntervaloProducao.SetParametros(Objeto: TObject);
var
  IntervaloProducao :TIntervaloProducao;
begin
  IntervaloProducao := (Objeto as TIntervaloProducao);

  self.FQuery.ParamByName('codigo').AsInteger      := IntervaloProducao.codigo;
  self.FQuery.ParamByName('hora_inicio').AsDateTime := IntervaloProducao.hora_inicio;
  self.FQuery.ParamByName('hora_fim').AsDateTime    := IntervaloProducao.hora_fim;
end;

function TRepositorioIntervaloProducao.SQLGet: String;
begin
  result := 'select * from INTERVALOS_PRODUCAO where codigo = :ncod';
end;

function TRepositorioIntervaloProducao.SQLGetAll: String;
begin
  result := 'select * from INTERVALOS_PRODUCAO';
end;

function TRepositorioIntervaloProducao.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioIntervaloProducao.SQLRemover: String;
begin
  result := ' delete from INTERVALOS_PRODUCAO where codigo = :codigo ';
end;

function TRepositorioIntervaloProducao.SQLSalvar: String;
begin
  result := 'update or insert into INTERVALOS_PRODUCAO ( CODIGO ,HORA_INICIO ,HORA_FIM) '+
           '                      values ( :CODIGO , :HORA_INICIO , :HORA_FIM) ';
end;

end.

