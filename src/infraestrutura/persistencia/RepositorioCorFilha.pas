unit RepositorioCorFilha;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioCorFilha = class(TRepositorio)

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

  //==============================================================================
  // Auditoria
  //==============================================================================
  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;

end;

implementation

uses
  SysUtils,
  CorFilha;

{ TRepositorioCorFilha }

function TRepositorioCorFilha.Get(Dataset: TDataSet): TObject;
var
  CorFilha :TCorFilha;
begin
   CorFilha                  := TCorFilha.Create;
   CorFilha.Codigo           := self.FQuery.FieldByName('codigo'    ).AsInteger;
   CorFilha.codigo_cor_pai   := self.FQuery.FieldByName('codigo_cor_pai' ).AsInteger;
   CorFilha.codigo_cor_filha := self.FQuery.fieldByName('codigo_cor_filha').AsInteger;

   result := CorFilha;
end;

function TRepositorioCorFilha.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TCorFilha(Objeto).Codigo;
end;

function TRepositorioCorFilha.GetNomeDaTabela: String;
begin
  result := 'CORES_FILHAS';
end;

function TRepositorioCorFilha.GetRepositorio: TRepositorio;
begin
  result := TRepositorioCorFilha.Create;
end;

function TRepositorioCorFilha.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TCorFilha(Objeto).Codigo <= 0);
end;

procedure TRepositorioCorFilha.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  CorFilhaAntigo :TCorFilha;
  CorFilhaNovo   :TCorFilha;
begin
   CorFilhaAntigo := (AntigoObjeto as TCorFilha);
   CorFilhaNovo   := (Objeto       as TCorFilha);

   if (CorFilhaAntigo.codigo_cor_pai <> CorFilhaNovo.codigo_cor_pai) then
    Auditoria.AdicionaCampoAlterado('codigo_cor_pai', IntToStr(CorFilhaAntigo.codigo_cor_pai), IntToStr(CorFilhaNovo.codigo_cor_pai));
   if (CorFilhaAntigo.codigo_cor_filha <> CorFilhaNovo.codigo_cor_filha) then
    Auditoria.AdicionaCampoAlterado('codigo_cor_filha', IntToStr(CorFilhaAntigo.codigo_cor_filha), IntToStr(CorFilhaNovo.codigo_cor_filha));

end;

procedure TRepositorioCorFilha.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  CorFilha :TCorFilha;
begin
   CorFilha := (Objeto as TCorFilha);

   Auditoria.AdicionaCampoExcluido('codigo'           , intToStr(CorFilha.Codigo));
   Auditoria.AdicionaCampoExcluido('codigo_cor_pai'   , intToStr(CorFilha.codigo_cor_pai));
   Auditoria.AdicionaCampoExcluido('codigo_cor_filha' , intToStr(CorFilha.codigo_cor_filha));
end;

procedure TRepositorioCorFilha.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  CorFilha :TCorFilha;
begin
   CorFilha := (Objeto as TCorFilha);

   Auditoria.AdicionaCampoIncluido('codigo'           , intToStr(CorFilha.Codigo));
   Auditoria.AdicionaCampoIncluido('codigo_cor_pai'   , intToStr(CorFilha.codigo_cor_pai));
   Auditoria.AdicionaCampoIncluido('codigo_cor_filha' , intToStr(CorFilha.codigo_cor_filha));
end;

procedure TRepositorioCorFilha.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TCorFilha(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioCorFilha.SetParametros(Objeto: TObject);
var
  CorFilha :TCorFilha;
begin
   CorFilha := (Objeto as TCorFilha);

   if (CorFilha.Codigo > 0) then  inherited SetParametro('codigo', CorFilha.Codigo)
   else                         inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('codigo_cor_pai').AsInteger   := CorFilha.codigo_cor_pai;
   self.FQuery.ParamByName('codigo_cor_filha').AsInteger := CorFilha.codigo_cor_filha;

end;

function TRepositorioCorFilha.SQLGet: String;
begin
  result := 'select * from CORES_FILHAS where codigo = :ncod';
end;

function TRepositorioCorFilha.SQLGetAll: String;
begin
  result := 'select * from CORES_FILHAS';
end;

function TRepositorioCorFilha.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioCorFilha.SQLRemover: String;
begin
   result := ' delete from CORES_FILHAS where codigo = :codigo ';
end;

function TRepositorioCorFilha.SQLSalvar: String;
begin
  result := 'update or insert into CORES_FILHAS                    '+
            '(codigo, codigo_cor_pai, codigo_cor_filha)            '+
            ' Values (:codigo, :codigo_cor_pai, :codigo_cor_filha) ';
end;

end.
