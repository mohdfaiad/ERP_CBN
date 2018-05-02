unit RepositorioPlanoContasContabeis;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioPlanoContasContabeis = class(TRepositorio)

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

uses SysUtils, PlanoContasContabeis;

{ TRepositorioPlanoContasContabeis }

function TRepositorioPlanoContasContabeis.Get(Dataset: TDataSet): TObject;
var
  PlanoContasContabeis :TPlanoContasContabeis;
begin
   PlanoContasContabeis:= TPlanoContasContabeis.Create;
   PlanoContasContabeis.codigo     := self.FQuery.FieldByName('codigo').AsInteger;
   PlanoContasContabeis.dt_alt     := self.FQuery.FieldByName('dt_alt').AsDateTime;
   PlanoContasContabeis.cod_nat_cc := self.FQuery.FieldByName('cod_nat_cc').AsString;
   PlanoContasContabeis.ind_cta    := self.FQuery.FieldByName('ind_cta').AsString;
   PlanoContasContabeis.nivel      := self.FQuery.FieldByName('nivel').AsInteger;
   PlanoContasContabeis.cod_cta    := self.FQuery.FieldByName('cod_cta').AsString;
   PlanoContasContabeis.nome_cta   := self.FQuery.FieldByName('nome_cta').AsString;

   result := PlanoContasContabeis;
end;

function TRepositorioPlanoContasContabeis.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TPlanoContasContabeis(Objeto).Codigo;
end;

function TRepositorioPlanoContasContabeis.GetNomeDaTabela: String;
begin
  result := 'PLANO_CONTAS_CONTABEIS';
end;

function TRepositorioPlanoContasContabeis.GetRepositorio: TRepositorio;
begin
  result := TRepositorioPlanoContasContabeis.Create;
end;

function TRepositorioPlanoContasContabeis.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TPlanoContasContabeis(Objeto).Codigo <= 0);
end;

procedure TRepositorioPlanoContasContabeis.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  PlanoContasContabeisAntigo :TPlanoContasContabeis;
  PlanoContasContabeisNovo :TPlanoContasContabeis;
begin
   PlanoContasContabeisAntigo := (AntigoObjeto as TPlanoContasContabeis);
   PlanoContasContabeisNovo   := (Objeto       as TPlanoContasContabeis);

   if (PlanoContasContabeisAntigo.dt_alt <> PlanoContasContabeisNovo.dt_alt) then
     Auditoria.AdicionaCampoAlterado('dt_alt', DateTimeToStr(PlanoContasContabeisAntigo.dt_alt), DateTimeToStr(PlanoContasContabeisNovo.dt_alt));

   if (PlanoContasContabeisAntigo.cod_nat_cc <> PlanoContasContabeisNovo.cod_nat_cc) then
     Auditoria.AdicionaCampoAlterado('cod_nat_cc', PlanoContasContabeisAntigo.cod_nat_cc, PlanoContasContabeisNovo.cod_nat_cc);

   if (PlanoContasContabeisAntigo.ind_cta <> PlanoContasContabeisNovo.ind_cta) then
     Auditoria.AdicionaCampoAlterado('ind_cta', PlanoContasContabeisAntigo.ind_cta, PlanoContasContabeisNovo.ind_cta);

   if (PlanoContasContabeisAntigo.nivel <> PlanoContasContabeisNovo.nivel) then
     Auditoria.AdicionaCampoAlterado('nivel', IntToStr(PlanoContasContabeisAntigo.nivel), IntToStr(PlanoContasContabeisNovo.nivel));

   if (PlanoContasContabeisAntigo.cod_cta <> PlanoContasContabeisNovo.cod_cta) then
     Auditoria.AdicionaCampoAlterado('cod_cta', PlanoContasContabeisAntigo.cod_cta, PlanoContasContabeisNovo.cod_cta);

   if (PlanoContasContabeisAntigo.nome_cta <> PlanoContasContabeisNovo.nome_cta) then
     Auditoria.AdicionaCampoAlterado('nome_cta', PlanoContasContabeisAntigo.nome_cta, PlanoContasContabeisNovo.nome_cta);

end;

procedure TRepositorioPlanoContasContabeis.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  PlanoContasContabeis :TPlanoContasContabeis;
begin
  PlanoContasContabeis := (Objeto as TPlanoContasContabeis);
  Auditoria.AdicionaCampoExcluido('codigo'    , IntToStr(PlanoContasContabeis.codigo));
  Auditoria.AdicionaCampoExcluido('dt_alt'    , DateTimeToStr(PlanoContasContabeis.dt_alt));
  Auditoria.AdicionaCampoExcluido('cod_nat_cc', PlanoContasContabeis.cod_nat_cc);
  Auditoria.AdicionaCampoExcluido('ind_cta'   , PlanoContasContabeis.ind_cta);
  Auditoria.AdicionaCampoExcluido('nivel'     , IntToStr(PlanoContasContabeis.nivel));
  Auditoria.AdicionaCampoExcluido('cod_cta'   , PlanoContasContabeis.cod_cta);
  Auditoria.AdicionaCampoExcluido('nome_cta'  , PlanoContasContabeis.nome_cta);
end;

procedure TRepositorioPlanoContasContabeis.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  PlanoContasContabeis :TPlanoContasContabeis;
begin
  PlanoContasContabeis := (Objeto as TPlanoContasContabeis);
  Auditoria.AdicionaCampoIncluido('codigo'    ,    IntToStr(PlanoContasContabeis.codigo));
  Auditoria.AdicionaCampoIncluido('dt_alt'    ,    DateTimeToStr(PlanoContasContabeis.dt_alt));
  Auditoria.AdicionaCampoIncluido('cod_nat_cc',    PlanoContasContabeis.cod_nat_cc);
  Auditoria.AdicionaCampoIncluido('ind_cta'   ,    PlanoContasContabeis.ind_cta);
  Auditoria.AdicionaCampoIncluido('nivel'     ,    IntToStr(PlanoContasContabeis.nivel));
  Auditoria.AdicionaCampoIncluido('cod_cta'   ,    PlanoContasContabeis.cod_cta);
  Auditoria.AdicionaCampoIncluido('nome_cta'  ,    PlanoContasContabeis.nome_cta);
end;

procedure TRepositorioPlanoContasContabeis.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TPlanoContasContabeis(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioPlanoContasContabeis.SetParametros(Objeto: TObject);
var
  PlanoContasContabeis :TPlanoContasContabeis;
begin
  PlanoContasContabeis := (Objeto as TPlanoContasContabeis);

  self.FQuery.ParamByName('codigo').AsInteger     := PlanoContasContabeis.codigo;
  self.FQuery.ParamByName('dt_alt').AsDateTime     := PlanoContasContabeis.dt_alt;
  self.FQuery.ParamByName('cod_nat_cc').AsString := PlanoContasContabeis.cod_nat_cc;
  self.FQuery.ParamByName('ind_cta').AsString    := PlanoContasContabeis.ind_cta;
  self.FQuery.ParamByName('nivel').AsInteger      := PlanoContasContabeis.nivel;
  self.FQuery.ParamByName('cod_cta').AsString    := PlanoContasContabeis.cod_cta;
  self.FQuery.ParamByName('nome_cta').AsString   := PlanoContasContabeis.nome_cta;
end;

function TRepositorioPlanoContasContabeis.SQLGet: String;
begin
  result := 'select * from PLANO_CONTAS_CONTABEIS where codigo = :ncod';
end;

function TRepositorioPlanoContasContabeis.SQLGetAll: String;
begin
  result := 'select * from PLANO_CONTAS_CONTABEIS';
end;

function TRepositorioPlanoContasContabeis.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioPlanoContasContabeis.SQLRemover: String;
begin
  result := ' delete from PLANO_CONTAS_CONTABEIS where codigo = :codigo ';
end;

function TRepositorioPlanoContasContabeis.SQLSalvar: String;
begin
  result := 'update or insert into PLANO_CONTAS_CONTABEIS (CODIGO ,DT_ALT ,COD_NAT_CC ,IND_CTA ,NIVEL ,COD_CTA ,NOME_CTA) '+
           '                      values ( :CODIGO , :DT_ALT , :COD_NAT_CC , :IND_CTA , :NIVEL , :COD_CTA , :NOME_CTA) ';
end;

end.

