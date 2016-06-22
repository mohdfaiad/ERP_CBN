unit RepositorioGrade;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioGrade = class(TRepositorio)

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
  Grade;

{ TRepositorioGrade }

function TRepositorioGrade.Get(Dataset: TDataSet): TObject;
var
  Grade :TGrade;
begin
   Grade            := TGrade.Create;
   Grade.Codigo     := self.FQuery.FieldByName('codigo'    ).AsInteger;
   Grade.Descricao  := self.FQuery.FieldByName('Descricao' ).AsString;
   result := Grade;
end;

function TRepositorioGrade.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TGrade(Objeto).Codigo;
end;

function TRepositorioGrade.GetNomeDaTabela: String;
begin
  result := 'GRADES';
end;

function TRepositorioGrade.GetRepositorio: TRepositorio;
begin
  result := TRepositorioGrade.Create;
end;

function TRepositorioGrade.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TGrade(Objeto).Codigo <= 0);
end;

procedure TRepositorioGrade.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  GradeAntigo :TGrade;
  GradeNovo   :TGrade;
begin
   GradeAntigo := (AntigoObjeto as TGrade);
   GradeNovo   := (Objeto       as TGrade);

   if (GradeAntigo.Descricao <> GradeNovo.Descricao) then
    Auditoria.AdicionaCampoAlterado('Descricao', GradeAntigo.Descricao, GradeNovo.Descricao);
end;

procedure TRepositorioGrade.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Grade :TGrade;
begin
   Grade := (Objeto as TGrade);

   Auditoria.AdicionaCampoExcluido('codigo'    , intToStr(Grade.Codigo));
   Auditoria.AdicionaCampoExcluido('Descricao' , Grade.Descricao);
end;

procedure TRepositorioGrade.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Grade :TGrade;
begin
   Grade := (Objeto as TGrade);

   Auditoria.AdicionaCampoIncluido('codigo'    , intToStr(Grade.Codigo));
   Auditoria.AdicionaCampoIncluido('Descricao' , Grade.Descricao);
end;

procedure TRepositorioGrade.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TGrade(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioGrade.SetParametros(Objeto: TObject);
var
  Grade :TGrade;
begin
   Grade := (Objeto as TGrade);

   if (Grade.Codigo > 0) then  inherited SetParametro('codigo', Grade.Codigo)
   else                         inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('descricao').AsString        := Grade.Descricao;
end;

function TRepositorioGrade.SQLGet: String;
begin
  result := 'select * from Grades where codigo = :ncod';
end;

function TRepositorioGrade.SQLGetAll: String;
begin
  result := 'select * from Grades';
end;

function TRepositorioGrade.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from Grades where '+ campo +' = :ncampo';
end;

function TRepositorioGrade.SQLRemover: String;
begin
   result := ' delete from Grades where codigo = :codigo ';
end;

function TRepositorioGrade.SQLSalvar: String;
begin
  result := 'update or insert into Grades '+
            '(codigo, descricao)            '+
            ' Values (:codigo, :descricao)  ';
end;

end.
              
              
              
              
              
              
              

