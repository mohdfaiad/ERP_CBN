unit RepositorioUnidade;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioUnidade = class(TRepositorio)

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

uses SysUtils, Unidade;

{ TRepositorioUnidade }

function TRepositorioUnidade.Get(Dataset: TDataSet): TObject;
var
  Unidade :TUnidade;
begin
   Unidade:= TUnidade.Create;
   Unidade.codigo         := self.FQuery.FieldByName('codigo').AsInteger;
   Unidade.unidade_medida := self.FQuery.FieldByName('unidade_medida').AsInteger;
   Unidade.descricao      := self.FQuery.FieldByName('descricao').AsInteger;

   result := Unidade;
end;

function TRepositorioUnidade.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TUnidade(Objeto).Codigo;
end;

function TRepositorioUnidade.GetNomeDaTabela: String;
begin
  result := 'UNIDADES';
end;

function TRepositorioUnidade.GetRepositorio: TRepositorio;
begin
  result := TRepositorioUnidade.Create;
end;

function TRepositorioUnidade.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TUnidade(Objeto).Codigo <= 0);
end;

procedure TRepositorioUnidade.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  UnidadeAntigo :TUnidade;
  UnidadeNovo :TUnidade;
begin
   UnidadeAntigo := (AntigoObjeto as TUnidade);
   UnidadeNovo   := (Objeto       as TUnidade);

   if (UnidadeAntigo.unidade_medida <> UnidadeNovo.unidade_medida) then
     Auditoria.AdicionaCampoAlterado('unidade_medida', IntToStr(UnidadeAntigo.unidade_medida), IntToStr(UnidadeNovo.unidade_medida));

   if (UnidadeAntigo.descricao <> UnidadeNovo.descricao) then
     Auditoria.AdicionaCampoAlterado('descricao', IntToStr(UnidadeAntigo.descricao), IntToStr(UnidadeNovo.descricao));

end;

procedure TRepositorioUnidade.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  Unidade :TUnidade;
begin
  Unidade := (Objeto as TUnidade);
  Auditoria.AdicionaCampoExcluido('codigo'        , IntToStr(Unidade.codigo));
  Auditoria.AdicionaCampoExcluido('unidade_medida', IntToStr(Unidade.unidade_medida));
  Auditoria.AdicionaCampoExcluido('descricao'     , IntToStr(Unidade.descricao));
end;

procedure TRepositorioUnidade.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  Unidade :TUnidade;
begin
  Unidade := (Objeto as TUnidade);
  Auditoria.AdicionaCampoIncluido('codigo'        ,    IntToStr(Unidade.codigo));
  Auditoria.AdicionaCampoIncluido('unidade_medida',    IntToStr(Unidade.unidade_medida));
  Auditoria.AdicionaCampoIncluido('descricao'     ,    IntToStr(Unidade.descricao));
end;

procedure TRepositorioUnidade.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TUnidade(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioUnidade.SetParametros(Objeto: TObject);
var
  Unidade :TUnidade;
begin
  Unidade := (Objeto as TUnidade);

  self.FQuery.ParamByName('codigo').AsInteger         := Unidade.codigo;
  self.FQuery.ParamByName('unidade_medida').AsInteger := Unidade.unidade_medida;
  self.FQuery.ParamByName('descricao').AsInteger      := Unidade.descricao;
end;

function TRepositorioUnidade.SQLGet: String;
begin
  result := 'select * from UNIDADES where codigo = :ncod';
end;

function TRepositorioUnidade.SQLGetAll: String;
begin
  result := 'select * from UNIDADES';
end;

function TRepositorioUnidade.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), self.GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioUnidade.SQLRemover: String;
begin
  result := ' delete from UNIDADES where codigo = :codigo ';
end;

function TRepositorioUnidade.SQLSalvar: String;
begin
  result := 'update or insert into UNIDADES (,CODIGO ,UNIDADE_MEDIDA ,DESCRICAO) '+
           '                      values ( :CODIGO , :UNIDADE_MEDIDA , :DESCRICAO) ';
end;

end.

