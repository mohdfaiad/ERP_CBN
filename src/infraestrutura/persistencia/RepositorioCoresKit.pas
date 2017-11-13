unit RepositorioCoresKit;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioCoresKit = class(TRepositorio)

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

uses SysUtils, CoresKit;

{ TRepositorioCoresKit }

function TRepositorioCoresKit.Get(Dataset: TDataSet): TObject;
var
  CoresKit :TCoresKit;
begin
   CoresKit:= TCoresKit.Create;
   CoresKit.codigo     := self.FQuery.FieldByName('codigo').AsInteger;
   CoresKit.codigo_kit := self.FQuery.FieldByName('codigo_kit').AsInteger;
   CoresKit.codigo_cor := self.FQuery.FieldByName('codigo_cor').AsInteger;

   result := CoresKit;
end;

function TRepositorioCoresKit.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TCoresKit(Objeto).Codigo;
end;

function TRepositorioCoresKit.GetNomeDaTabela: String;
begin
  result := 'CORES_KIT';
end;

function TRepositorioCoresKit.GetRepositorio: TRepositorio;
begin
  result := TRepositorioCoresKit.Create;
end;

function TRepositorioCoresKit.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TCoresKit(Objeto).Codigo <= 0);
end;

procedure TRepositorioCoresKit.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  CoresKitAntigo :TCoresKit;
  CoresKitNovo :TCoresKit;
begin
   CoresKitAntigo := (AntigoObjeto as TCoresKit);
   CoresKitNovo   := (Objeto       as TCoresKit);

   if (CoresKitAntigo.codigo_kit <> CoresKitNovo.codigo_kit) then
     Auditoria.AdicionaCampoAlterado('codigo_kit', IntToStr(CoresKitAntigo.codigo_kit), IntToStr(CoresKitNovo.codigo_kit));

   if (CoresKitAntigo.codigo_cor <> CoresKitNovo.codigo_cor) then
     Auditoria.AdicionaCampoAlterado('codigo_cor', IntToStr(CoresKitAntigo.codigo_cor), IntToStr(CoresKitNovo.codigo_cor));

end;

procedure TRepositorioCoresKit.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  CoresKit :TCoresKit;
begin
  CoresKit := (Objeto as TCoresKit);
  Auditoria.AdicionaCampoExcluido('codigo'    , IntToStr(CoresKit.codigo));
  Auditoria.AdicionaCampoExcluido('codigo_kit', IntToStr(CoresKit.codigo_kit));
  Auditoria.AdicionaCampoExcluido('codigo_cor', IntToStr(CoresKit.codigo_cor));
end;

procedure TRepositorioCoresKit.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  CoresKit :TCoresKit;
begin
  CoresKit := (Objeto as TCoresKit);
  Auditoria.AdicionaCampoIncluido('codigo'    ,    IntToStr(CoresKit.codigo));
  Auditoria.AdicionaCampoIncluido('codigo_kit',    IntToStr(CoresKit.codigo_kit));
  Auditoria.AdicionaCampoIncluido('codigo_cor',    IntToStr(CoresKit.codigo_cor));
end;

procedure TRepositorioCoresKit.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TCoresKit(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioCoresKit.SetParametros(Objeto: TObject);
var
  CoresKit :TCoresKit;
begin
  CoresKit := (Objeto as TCoresKit);

  self.FQuery.ParamByName('codigo').AsInteger     := CoresKit.codigo;
  self.FQuery.ParamByName('codigo_kit').AsInteger := CoresKit.codigo_kit;
  self.FQuery.ParamByName('codigo_cor').AsInteger := CoresKit.codigo_cor;
end;

function TRepositorioCoresKit.SQLGet: String;
begin
  result := 'select * from CORES_KIT where codigo = :ncod';
end;

function TRepositorioCoresKit.SQLGetAll: String;
begin
  result := 'select * from CORES_KIT';
end;

function TRepositorioCoresKit.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioCoresKit.SQLRemover: String;
begin
  result := ' delete from CORES_KIT where codigo = :codigo ';
end;

function TRepositorioCoresKit.SQLSalvar: String;
begin
  result := 'update or insert into CORES_KIT (CODIGO ,CODIGO_KIT ,CODIGO_COR) '+
           '                      values ( :CODIGO , :CODIGO_KIT , :CODIGO_COR) ';
end;

end.

