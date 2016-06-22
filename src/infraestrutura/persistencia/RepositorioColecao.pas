unit RepositorioColecao;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioColecao = class(TRepositorio)

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
    function SQLGetExiste(campo: String): String;            override;

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

uses SysUtils, Colecao;

{ TRepositorioColecao }

function TRepositorioColecao.Get(Dataset: TDataSet): TObject;
var
  Colecao :TColecao;
begin
   Colecao:= TColecao.Create;
   Colecao.codigo    := self.FQuery.FieldByName('codigo').AsInteger;
   Colecao.descricao := self.FQuery.FieldByName('descricao').AsString;

   result := Colecao;
end;

function TRepositorioColecao.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TColecao(Objeto).Codigo;
end;

function TRepositorioColecao.GetNomeDaTabela: String;
begin
  result := 'COLECOES';
end;

function TRepositorioColecao.GetRepositorio: TRepositorio;
begin
  result := TRepositorioColecao.Create;
end;

function TRepositorioColecao.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TColecao(Objeto).Codigo <= 0);
end;

procedure TRepositorioColecao.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  ColecaoAntigo :TColecao;
  ColecaoNovo :TColecao;
begin
   ColecaoAntigo := (AntigoObjeto as TColecao);
   ColecaoNovo   := (Objeto       as TColecao);

   if (ColecaoAntigo.descricao <> ColecaoNovo.descricao) then
     Auditoria.AdicionaCampoAlterado('descricao', ColecaoAntigo.descricao, ColecaoNovo.descricao);

end;

procedure TRepositorioColecao.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  Colecao :TColecao;
begin
  Colecao := (Objeto as TColecao);
  Auditoria.AdicionaCampoExcluido('codigo'   , IntToStr(Colecao.codigo));
  Auditoria.AdicionaCampoExcluido('descricao', Colecao.descricao);
end;

procedure TRepositorioColecao.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  Colecao :TColecao;
begin
  Colecao := (Objeto as TColecao);
  Auditoria.AdicionaCampoIncluido('codigo'   ,    IntToStr(Colecao.codigo));
  Auditoria.AdicionaCampoIncluido('descricao',    Colecao.descricao);
end;

procedure TRepositorioColecao.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TColecao(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioColecao.SetParametros(Objeto: TObject);
var
  Colecao :TColecao;
begin
  Colecao := (Objeto as TColecao);

  self.FQuery.ParamByName('codigo').AsInteger    := Colecao.codigo;
  self.FQuery.ParamByName('descricao').AsString  := Colecao.descricao;
end;

function TRepositorioColecao.SQLGet: String;
begin
  result := 'select * from COLECOES where codigo = :ncod';
end;

function TRepositorioColecao.SQLGetAll: String;
begin
  result := 'select * from COLECOES';
end;

function TRepositorioColecao.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from COLECOES where '+ campo +' = :ncampo';
end;

function TRepositorioColecao.SQLRemover: String;
begin
  result := ' delete from COLECOES where codigo = :codigo ';
end;

function TRepositorioColecao.SQLSalvar: String;
begin
  result := 'update or insert into COLECOES (CODIGO ,DESCRICAO) '+
           '                      values ( :CODIGO , :DESCRICAO) ';
end;

end.

