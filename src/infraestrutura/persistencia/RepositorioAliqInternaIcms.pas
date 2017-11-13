unit RepositorioAliqInternaIcms;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioAliqInternaIcms = class(TRepositorio)

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

uses SysUtils, AliqInternaIcms;

{ TRepositorioAliqInternaIcms }

function TRepositorioAliqInternaIcms.Get(Dataset: TDataSet): TObject;
var
  AliqInternaIcms :TAliqInternaIcms;
begin
   AliqInternaIcms:= TAliqInternaIcms.Create;
   AliqInternaIcms.codigo        := self.FQuery.FieldByName('codigo').AsInteger;
   AliqInternaIcms.codigo_estado := self.FQuery.FieldByName('codigo_estado').AsInteger;
   AliqInternaIcms.aliquota      := self.FQuery.FieldByName('aliquota').AsFloat;

   result := AliqInternaIcms;
end;

function TRepositorioAliqInternaIcms.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TAliqInternaIcms(Objeto).Codigo;
end;

function TRepositorioAliqInternaIcms.GetNomeDaTabela: String;
begin
  result := 'ALIQ_INTERNA_ICMS';
end;

function TRepositorioAliqInternaIcms.GetRepositorio: TRepositorio;
begin
  result := TRepositorioAliqInternaIcms.Create;
end;

function TRepositorioAliqInternaIcms.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TAliqInternaIcms(Objeto).Codigo <= 0);
end;

procedure TRepositorioAliqInternaIcms.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  AliqInternaIcmsAntigo :TAliqInternaIcms;
  AliqInternaIcmsNovo :TAliqInternaIcms;
begin
   AliqInternaIcmsAntigo := (AntigoObjeto as TAliqInternaIcms);
   AliqInternaIcmsNovo   := (Objeto       as TAliqInternaIcms);

   if (AliqInternaIcmsAntigo.codigo_estado <> AliqInternaIcmsNovo.codigo_estado) then
     Auditoria.AdicionaCampoAlterado('codigo_estado', IntToStr(AliqInternaIcmsAntigo.codigo_estado), IntToStr(AliqInternaIcmsNovo.codigo_estado));

   if (AliqInternaIcmsAntigo.aliquota <> AliqInternaIcmsNovo.aliquota) then
     Auditoria.AdicionaCampoAlterado('aliquota', FloatToStr(AliqInternaIcmsAntigo.aliquota), FloatToStr(AliqInternaIcmsNovo.aliquota));

end;

procedure TRepositorioAliqInternaIcms.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  AliqInternaIcms :TAliqInternaIcms;
begin
  AliqInternaIcms := (Objeto as TAliqInternaIcms);
  Auditoria.AdicionaCampoExcluido('codigo'       , IntToStr(AliqInternaIcms.codigo));
  Auditoria.AdicionaCampoExcluido('codigo_estado', IntToStr(AliqInternaIcms.codigo_estado));
  Auditoria.AdicionaCampoExcluido('aliquota'     , FloatToStr(AliqInternaIcms.aliquota));
end;

procedure TRepositorioAliqInternaIcms.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  AliqInternaIcms :TAliqInternaIcms;
begin
  AliqInternaIcms := (Objeto as TAliqInternaIcms);
  Auditoria.AdicionaCampoIncluido('codigo'       ,    IntToStr(AliqInternaIcms.codigo));
  Auditoria.AdicionaCampoIncluido('codigo_estado',    IntToStr(AliqInternaIcms.codigo_estado));
  Auditoria.AdicionaCampoIncluido('aliquota'     ,    FloatToStr(AliqInternaIcms.aliquota));
end;

procedure TRepositorioAliqInternaIcms.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TAliqInternaIcms(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioAliqInternaIcms.SetParametros(Objeto: TObject);
var
  AliqInternaIcms :TAliqInternaIcms;
begin
  AliqInternaIcms := (Objeto as TAliqInternaIcms);

  self.FQuery.ParamByName('codigo').AsInteger        := AliqInternaIcms.codigo;
  self.FQuery.ParamByName('codigo_estado').AsInteger := AliqInternaIcms.codigo_estado;
  self.FQuery.ParamByName('aliquota').AsFloat      := AliqInternaIcms.aliquota;
end;

function TRepositorioAliqInternaIcms.SQLGet: String;
begin
  result := 'select * from ALIQ_INTERNA_ICMS where codigo = :ncod';
end;

function TRepositorioAliqInternaIcms.SQLGetAll: String;
begin
  result := 'select * from ALIQ_INTERNA_ICMS';
end;

function TRepositorioAliqInternaIcms.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioAliqInternaIcms.SQLRemover: String;
begin
  result := ' delete from ALIQ_INTERNA_ICMS where codigo = :codigo ';
end;

function TRepositorioAliqInternaIcms.SQLSalvar: String;
begin
  result := 'update or insert into ALIQ_INTERNA_ICMS (CODIGO ,CODIGO_ESTADO ,ALIQUOTA) '+
           '                      values ( :CODIGO , :CODIGO_ESTADO , :ALIQUOTA) ';
end;

end.

