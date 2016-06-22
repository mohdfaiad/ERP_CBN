unit RepositorioGrade_Tamanhos;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioGrade_Tamanhos = class(TRepositorio)

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
  Grade_Tamanhos;

{ TRepositorioGrade_Tamanhos }

function TRepositorioGrade_Tamanhos.Get(Dataset: TDataSet): TObject;
var
  Grade_Tamanhos :TGrade_Tamanhos;
begin
   Grade_Tamanhos            := TGrade_Tamanhos.Create;
   Grade_Tamanhos.Codigo     := self.FQuery.FieldByName('codigo'    ).AsInteger;
   Grade_Tamanhos.Codgrade   := self.FQuery.FieldByName('codgrade'  ).AsInteger;
   Grade_Tamanhos.Codtamanho := self.FQuery.FieldByName('codtamanho').AsInteger;
   result := Grade_Tamanhos;
end;

function TRepositorioGrade_Tamanhos.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TGrade_Tamanhos(Objeto).Codigo;
end;

function TRepositorioGrade_Tamanhos.GetNomeDaTabela: String;
begin
  result := 'GRADE_TAMANHOS';
end;

function TRepositorioGrade_Tamanhos.GetRepositorio: TRepositorio;
begin
  result := TRepositorioGrade_Tamanhos.Create;
end;

function TRepositorioGrade_Tamanhos.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TGrade_Tamanhos(Objeto).Codigo <= 0);
end;

procedure TRepositorioGrade_Tamanhos.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  Grade_TamanhosAntigo :TGrade_Tamanhos;
  Grade_TamanhosNovo   :TGrade_Tamanhos;
begin
   Grade_TamanhosAntigo := (AntigoObjeto as TGrade_Tamanhos);
   Grade_TamanhosNovo   := (Objeto       as TGrade_Tamanhos);

   if (Grade_TamanhosAntigo.Codgrade <> Grade_TamanhosNovo.Codgrade) then
    Auditoria.AdicionaCampoAlterado('codgrade', intToStr(Grade_TamanhosAntigo.Codgrade), intToStr(Grade_TamanhosNovo.Codgrade));

   if (Grade_TamanhosAntigo.Codtamanho <> Grade_TamanhosNovo.Codtamanho) then
    Auditoria.AdicionaCampoAlterado('Codtamanho', intToStr(Grade_TamanhosAntigo.Codtamanho), intToStr(Grade_TamanhosNovo.Codtamanho));
end;

procedure TRepositorioGrade_Tamanhos.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Grade_Tamanhos :TGrade_Tamanhos;
begin
   Grade_Tamanhos := (Objeto as TGrade_Tamanhos);

   Auditoria.AdicionaCampoExcluido('codigo'    , intToStr(Grade_Tamanhos.Codigo));
   Auditoria.AdicionaCampoExcluido('codgrade'  , intToStr(Grade_Tamanhos.Codgrade));
   Auditoria.AdicionaCampoExcluido('codtamanho', intToStr(Grade_Tamanhos.Codtamanho));
end;

procedure TRepositorioGrade_Tamanhos.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Grade_Tamanhos :TGrade_Tamanhos;
begin
   Grade_Tamanhos := (Objeto as TGrade_Tamanhos);

   Auditoria.AdicionaCampoIncluido('codigo'    , intToStr(Grade_Tamanhos.Codigo));
   Auditoria.AdicionaCampoIncluido('codgrade'  , intToStr(Grade_Tamanhos.Codgrade));
   Auditoria.AdicionaCampoIncluido('codtamanho', intToStr(Grade_Tamanhos.Codtamanho));
end;

procedure TRepositorioGrade_Tamanhos.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TGrade_Tamanhos(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioGrade_Tamanhos.SetParametros(Objeto: TObject);
var
  Grade_Tamanhos :TGrade_Tamanhos;
begin
   Grade_Tamanhos := (Objeto as TGrade_Tamanhos);

   if (Grade_Tamanhos.Codigo > 0) then  inherited SetParametro('codigo', Grade_Tamanhos.Codigo)
   else                         inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('codgrade').AsInteger        := Grade_Tamanhos.Codgrade;
   self.FQuery.ParamByName('codtamanho').AsInteger      := Grade_Tamanhos.Codtamanho;
end;

function TRepositorioGrade_Tamanhos.SQLGet: String;
begin
  result := 'select * from grade_Tamanhos where codigo = :ncod';
end;

function TRepositorioGrade_Tamanhos.SQLGetAll: String;
begin
  result := 'select * from grade_Tamanhos';
end;

function TRepositorioGrade_Tamanhos.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from Grade_Tamanhos where '+ campo +' = :ncampo';
end;

function TRepositorioGrade_Tamanhos.SQLRemover: String;
begin
   result := ' delete from Grade_Tamanhos where codigo = :codigo ';
end;

function TRepositorioGrade_Tamanhos.SQLSalvar: String;
begin
  result := 'update or insert into Grade_Tamanhos      '+
            '(codigo, codgrade, codtamanho)            '+
            ' Values (:codigo, :codgrade, :codtamanho) ';
end;

end.
              
              
              
              
              
              
              

