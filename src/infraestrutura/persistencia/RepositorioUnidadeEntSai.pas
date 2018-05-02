unit RepositorioUnidadeEntSai;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioUnidadeEntSai = class(TRepositorio)

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
    function SQLGetExiste(arrayDeCampos :array of string): String; override;

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

uses SysUtils, UnidadeEntSai;

{ TRepositorioUnidadeEntSai }

function TRepositorioUnidadeEntSai.Get(Dataset: TDataSet): TObject;
var
  UnidadeEntSai :TUnidadeEntSai;
begin
   UnidadeEntSai := TUnidadeEntSai.Create;
   UnidadeEntSai.codigo         := self.FQuery.FieldByName('codigo').AsInteger;
   UnidadeEntSai.codigo_materia := self.FQuery.FieldByName('codigo_materia').AsInteger;
   UnidadeEntSai.unidade_movimento := self.FQuery.FieldByName('unidade_movimento').AsString;
   UnidadeEntSai.unidade_sistema := self.FQuery.FieldByName('unidade_sistema').AsString;
   UnidadeEntSai.quantidade     := self.FQuery.FieldByName('quantidade').AsFloat;
   UnidadeEntSai.tipo           := self.FQuery.FieldByName('tipo').AsString;
   result := UnidadeEntSai;
end;

function TRepositorioUnidadeEntSai.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TUnidadeEntSai(Objeto).Codigo;
end;

function TRepositorioUnidadeEntSai.GetNomeDaTabela: String;
begin
  result := 'UNIDADEs_ENT_SAI';
end;

function TRepositorioUnidadeEntSai.GetRepositorio: TRepositorio;
begin
  result := TRepositorioUnidadeEntSai.Create;
end;

function TRepositorioUnidadeEntSai.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TUnidadeEntSai(Objeto).Codigo <= 0);
end;

procedure TRepositorioUnidadeEntSai.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  UnidadeEntSaiAntigo :TUnidadeEntSai;
  UnidadeEntSaiNovo :TUnidadeEntSai;
begin
   UnidadeEntSaiAntigo := (AntigoObjeto as TUnidadeEntSai);
   UnidadeEntSaiNovo   := (Objeto       as TUnidadeEntSai);

   if (UnidadeEntSaiAntigo.codigo_materia <> UnidadeEntSaiNovo.codigo_materia) then
     Auditoria.AdicionaCampoAlterado('codigo_materia', IntToStr(UnidadeEntSaiAntigo.codigo_materia), IntToStr(UnidadeEntSaiNovo.codigo_materia));

   if (UnidadeEntSaiAntigo.unidade_movimento <> UnidadeEntSaiNovo.unidade_movimento) then
     Auditoria.AdicionaCampoAlterado('Funidade_movimento', UnidadeEntSaiAntigo.unidade_movimento, UnidadeEntSaiNovo.unidade_movimento);

   if (UnidadeEntSaiAntigo.quantidade <> UnidadeEntSaiNovo.quantidade) then
     Auditoria.AdicionaCampoAlterado('quantidade', FloatToStr(UnidadeEntSaiAntigo.quantidade), FloatToStr(UnidadeEntSaiNovo.quantidade));

   if (UnidadeEntSaiAntigo.unidade_sistema <> UnidadeEntSaiNovo.unidade_sistema) then
     Auditoria.AdicionaCampoAlterado('Funidade_sistema', UnidadeEntSaiAntigo.unidade_sistema, UnidadeEntSaiNovo.unidade_sistema);

   if (UnidadeEntSaiAntigo.tipo <> UnidadeEntSaiNovo.tipo) then
     Auditoria.AdicionaCampoAlterado('tipo', UnidadeEntSaiAntigo.tipo, UnidadeEntSaiNovo.tipo);
end;

procedure TRepositorioUnidadeEntSai.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  UnidadeEntSai :TUnidadeEntSai;
begin
  UnidadeEntSai := (Objeto as TUnidadeEntSai);
  Auditoria.AdicionaCampoExcluido('codigo'        , IntToStr(UnidadeEntSai.codigo));
  Auditoria.AdicionaCampoExcluido('codigo_materia', IntToStr(UnidadeEntSai.codigo_materia));
  Auditoria.AdicionaCampoExcluido('Funidade_movimento', UnidadeEntSai.unidade_movimento);
  Auditoria.AdicionaCampoExcluido('quantidade'    , FloatToStr(UnidadeEntSai.quantidade));
  Auditoria.AdicionaCampoExcluido('Funidade_sistema', UnidadeEntSai.unidade_sistema);
  Auditoria.AdicionaCampoExcluido('tipo'          , UnidadeEntSai.tipo);
end;

procedure TRepositorioUnidadeEntSai.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  UnidadeEntSai :TUnidadeEntSai;
begin
  UnidadeEntSai := (Objeto as TUnidadeEntSai);
  Auditoria.AdicionaCampoIncluido('codigo'        , IntToStr(UnidadeEntSai.codigo));
  Auditoria.AdicionaCampoIncluido('codigo_materia', IntToStr(UnidadeEntSai.codigo_materia));
  Auditoria.AdicionaCampoIncluido('Funidade_movimento', UnidadeEntSai.unidade_movimento);
  Auditoria.AdicionaCampoIncluido('quantidade'    , FloatToStr(UnidadeEntSai.quantidade));
  Auditoria.AdicionaCampoIncluido('Funidade_sistema', UnidadeEntSai.unidade_sistema);
  Auditoria.AdicionaCampoIncluido('tipo'          , UnidadeEntSai.tipo);
end;

procedure TRepositorioUnidadeEntSai.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TUnidadeEntSai(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioUnidadeEntSai.SetParametros(Objeto: TObject);
var
  UnidadeEntSai :TUnidadeEntSai;
begin
  UnidadeEntSai := (Objeto as TUnidadeEntSai);

  self.FQuery.ParamByName('codigo').AsInteger           := UnidadeEntSai.codigo;
  self.FQuery.ParamByName('codigo_materia').AsInteger   := UnidadeEntSai.codigo_materia;
  self.FQuery.ParamByName('unidade_movimento').AsString := UnidadeEntSai.unidade_movimento;
  self.FQuery.ParamByName('quantidade').AsFloat         := UnidadeEntSai.quantidade;
  self.FQuery.ParamByName('unidade_sistema').AsString   := UnidadeEntSai.unidade_sistema;
  self.FQuery.ParamByName('tipo').AsString              := UnidadeEntSai.tipo;
end;

function TRepositorioUnidadeEntSai.SQLGet: String;
begin
  result := 'select * from Unidades_Ent_Sai where codigo = :ncod';
end;

function TRepositorioUnidadeEntSai.SQLGetAll: String;
begin
  result := 'select * from Unidades_Ent_Sai';
end;

function TRepositorioUnidadeEntSai.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioUnidadeEntSai.SQLRemover: String;
begin
  result := ' delete from Unidades_Ent_Sai where codigo = :codigo ';
end;

function TRepositorioUnidadeEntSai.SQLSalvar: String;
begin
  result := 'update or insert into Unidades_Ent_Sai (CODIGO ,CODIGO_MATERIA ,unidade_movimento, unidade_sistema ,QUANTIDADE, TIPO) '+
           '                      values ( :CODIGO , :CODIGO_MATERIA , :unidade_movimento, :unidade_sistema , :QUANTIDADE, :TIPO) ';
end;

end.

