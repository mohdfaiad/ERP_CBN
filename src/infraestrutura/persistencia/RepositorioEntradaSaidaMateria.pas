unit RepositorioEntradaSaidaMateria;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioEntradaSaidaMateria = class(TRepositorio)

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

uses SysUtils, EntradaSaidaMateria;

{ TRepositorioEntradaSaidaMateria }

function TRepositorioEntradaSaidaMateria.Get(Dataset: TDataSet): TObject;
var
  EntradaSaidaMateria :TEntradaSaidaMateria;
begin
   EntradaSaidaMateria:= TEntradaSaidaMateria.Create;
   EntradaSaidaMateria.codigo         := self.FQuery.FieldByName('codigo').AsInteger;
   EntradaSaidaMateria.codigo_materia := self.FQuery.FieldByName('codigo_materia').AsInteger;
   EntradaSaidaMateria.quantidade     := self.FQuery.FieldByName('quantidade').AsFloat;
   EntradaSaidaMateria.data_movimento := self.FQuery.FieldByName('data_movimento').AsDateTime;
   EntradaSaidaMateria.tipo           := self.FQuery.FieldByName('tipo').AsString;

   result := EntradaSaidaMateria;
end;

function TRepositorioEntradaSaidaMateria.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TEntradaSaidaMateria(Objeto).Codigo;
end;

function TRepositorioEntradaSaidaMateria.GetNomeDaTabela: String;
begin
  result := 'ENTRADAS_SAIDAS_MATERIA';
end;

function TRepositorioEntradaSaidaMateria.GetRepositorio: TRepositorio;
begin
  result := TRepositorioEntradaSaidaMateria.Create;
end;

function TRepositorioEntradaSaidaMateria.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TEntradaSaidaMateria(Objeto).Codigo <= 0);
end;

procedure TRepositorioEntradaSaidaMateria.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  EntradaSaidaMateriaAntigo :TEntradaSaidaMateria;
  EntradaSaidaMateriaNovo :TEntradaSaidaMateria;
begin
   EntradaSaidaMateriaAntigo := (AntigoObjeto as TEntradaSaidaMateria);
   EntradaSaidaMateriaNovo   := (Objeto       as TEntradaSaidaMateria);

   if (EntradaSaidaMateriaAntigo.codigo_materia <> EntradaSaidaMateriaNovo.codigo_materia) then
     Auditoria.AdicionaCampoAlterado('codigo_materia', IntToStr(EntradaSaidaMateriaAntigo.codigo_materia), IntToStr(EntradaSaidaMateriaNovo.codigo_materia));

   if (EntradaSaidaMateriaAntigo.quantidade <> EntradaSaidaMateriaNovo.quantidade) then
     Auditoria.AdicionaCampoAlterado('quantidade', FloatToStr(EntradaSaidaMateriaAntigo.quantidade), FloatToStr(EntradaSaidaMateriaNovo.quantidade));

   if (EntradaSaidaMateriaAntigo.data_movimento <> EntradaSaidaMateriaNovo.data_movimento) then
     Auditoria.AdicionaCampoAlterado('data_movimento', DateTimeToStr(EntradaSaidaMateriaAntigo.data_movimento), DateTimeToStr(EntradaSaidaMateriaNovo.data_movimento));

   if (EntradaSaidaMateriaAntigo.tipo <> EntradaSaidaMateriaNovo.tipo) then
     Auditoria.AdicionaCampoAlterado('tipo', EntradaSaidaMateriaAntigo.tipo, EntradaSaidaMateriaNovo.tipo);

end;

procedure TRepositorioEntradaSaidaMateria.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  EntradaSaidaMateria :TEntradaSaidaMateria;
begin
  EntradaSaidaMateria := (Objeto as TEntradaSaidaMateria);
  Auditoria.AdicionaCampoExcluido('codigo'        , IntToStr(EntradaSaidaMateria.codigo));
  Auditoria.AdicionaCampoExcluido('codigo_materia', IntToStr(EntradaSaidaMateria.codigo_materia));
  Auditoria.AdicionaCampoExcluido('quantidade'    , FloatToStr(EntradaSaidaMateria.quantidade));
  Auditoria.AdicionaCampoExcluido('data_movimento', DateTimeToStr(EntradaSaidaMateria.data_movimento));
  Auditoria.AdicionaCampoExcluido('tipo'          , EntradaSaidaMateria.tipo);
end;

procedure TRepositorioEntradaSaidaMateria.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  EntradaSaidaMateria :TEntradaSaidaMateria;
begin
  EntradaSaidaMateria := (Objeto as TEntradaSaidaMateria);
  Auditoria.AdicionaCampoIncluido('codigo'        ,    IntToStr(EntradaSaidaMateria.codigo));
  Auditoria.AdicionaCampoIncluido('codigo_materia',    IntToStr(EntradaSaidaMateria.codigo_materia));
  Auditoria.AdicionaCampoIncluido('quantidade'    ,    FloatToStr(EntradaSaidaMateria.quantidade));
  Auditoria.AdicionaCampoIncluido('data_movimento',    DateTimeToStr(EntradaSaidaMateria.data_movimento));
  Auditoria.AdicionaCampoIncluido('tipo'          ,    EntradaSaidaMateria.tipo);
end;

procedure TRepositorioEntradaSaidaMateria.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TEntradaSaidaMateria(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioEntradaSaidaMateria.SetParametros(Objeto: TObject);
var
  EntradaSaidaMateria :TEntradaSaidaMateria;
begin
  EntradaSaidaMateria := (Objeto as TEntradaSaidaMateria);

  self.FQuery.ParamByName('codigo').AsInteger         := EntradaSaidaMateria.codigo;
  self.FQuery.ParamByName('codigo_materia').AsInteger := EntradaSaidaMateria.codigo_materia;
  self.FQuery.ParamByName('quantidade').AsFloat     := EntradaSaidaMateria.quantidade;
  self.FQuery.ParamByName('data_movimento').AsDateTime := EntradaSaidaMateria.data_movimento;
  self.FQuery.ParamByName('tipo').AsString           := EntradaSaidaMateria.tipo;
end;

function TRepositorioEntradaSaidaMateria.SQLGet: String;
begin
  result := 'select * from ENTRADAS_SAIDAS_MATERIA where codigo = :ncod';
end;

function TRepositorioEntradaSaidaMateria.SQLGetAll: String;
begin
  result := 'select * from ENTRADAS_SAIDAS_MATERIA';
end;

function TRepositorioEntradaSaidaMateria.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioEntradaSaidaMateria.SQLRemover: String;
begin
  result := ' delete from ENTRADAS_SAIDAS_MATERIA where codigo = :codigo ';
end;

function TRepositorioEntradaSaidaMateria.SQLSalvar: String;
begin
  result := 'update or insert into ENTRADAS_SAIDAS_MATERIA (CODIGO ,CODIGO_MATERIA ,QUANTIDADE ,DATA_MOVIMENTO ,TIPO) '+
           '                      values ( :CODIGO , :CODIGO_MATERIA , :QUANTIDADE , :DATA_MOVIMENTO , :TIPO) ';
end;

end.

