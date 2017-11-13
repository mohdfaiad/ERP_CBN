unit RepositorioCodigoBarras;

interface

uses
  DB,
  Auditoria,
  Repositorio, SysUtils;

type
  TRepositorioCodigoBarras = class(TRepositorio)

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
  CodigoBarras;

{ TRepositorioCodigoBarras }

function TRepositorioCodigoBarras.Get(Dataset: TDataSet): TObject;
var
  CodigoBarras :TCodigoBarras;
begin
   CodigoBarras               := TCodigoBarras.Create;
   CodigoBarras.Codigo        := self.FQuery.FieldByName('codigo').AsInteger;
   CodigoBarras.Tipo          := self.FQuery.fieldByName('tipo').AsInteger;
   CodigoBarras.Numeracao     := self.FQuery.fieldByName('numeracao').AsString;
   CodigoBarras.CodProduto    := self.FQuery.fieldByName('codproduto').AsInteger;
   CodigoBarras.CodCor        := self.FQuery.fieldByName('codcor').AsInteger;
   CodigoBarras.CodGrade      := self.FQuery.fieldByName('codgrade').AsInteger;
   CodigoBarras.CodTamanho    := self.FQuery.fieldByName('codtamanho').AsInteger;
   CodigoBarras.Cod_sku       := self.FQuery.fieldByName('Cod_sku').AsString;

   result := CodigoBarras;
end;

function TRepositorioCodigoBarras.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TCodigoBarras(Objeto).Codigo;
end;

function TRepositorioCodigoBarras.GetNomeDaTabela: String;
begin
  result := 'Codigo_Barras';
end;

function TRepositorioCodigoBarras.GetRepositorio: TRepositorio;
begin
  result := TRepositorioCodigoBarras.Create;
end;

function TRepositorioCodigoBarras.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TCodigoBarras(Objeto).Codigo <= 0);
end;

procedure TRepositorioCodigoBarras.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  CodigoBarrasAntigo :TCodigoBarras;
  CodigoBarrasNovo   :TCodigoBarras;
begin
   CodigoBarrasAntigo := (AntigoObjeto as TCodigoBarras);
   CodigoBarrasNovo   := (Objeto       as TCodigoBarras);

   if (CodigoBarrasAntigo.Tipo <> CodigoBarrasNovo.Tipo) then
    Auditoria.AdicionaCampoAlterado('tipo', intToStr(CodigoBarrasAntigo.Tipo), intToStr(CodigoBarrasNovo.Tipo));

   if (CodigoBarrasAntigo.Numeracao <> CodigoBarrasNovo.Numeracao) then
    Auditoria.AdicionaCampoAlterado('numeracao', CodigoBarrasAntigo.Numeracao, CodigoBarrasNovo.Numeracao);

   if (CodigoBarrasAntigo.CodProduto <> CodigoBarrasNovo.CodProduto) then
    Auditoria.AdicionaCampoAlterado('codproduto', intToStr(CodigoBarrasAntigo.CodProduto), intToStr(CodigoBarrasNovo.CodProduto));

   if (CodigoBarrasAntigo.CodCor <> CodigoBarrasNovo.CodCor) then
    Auditoria.AdicionaCampoAlterado('codcor', intToStr(CodigoBarrasAntigo.CodCor), intToStr(CodigoBarrasNovo.CodCor));

   if (CodigoBarrasAntigo.CodGrade <> CodigoBarrasNovo.CodGrade) then
    Auditoria.AdicionaCampoAlterado('codgrade', intToStr(CodigoBarrasAntigo.CodGrade), intToStr(CodigoBarrasNovo.CodGrade));

   if (CodigoBarrasAntigo.CodTamanho <> CodigoBarrasNovo.CodTamanho) then
    Auditoria.AdicionaCampoAlterado('codtamanho', intToStr(CodigoBarrasAntigo.CodTamanho), intToStr(CodigoBarrasNovo.CodTamanho));

   if (CodigoBarrasAntigo.Cod_sku <> CodigoBarrasNovo.Cod_sku) then
    Auditoria.AdicionaCampoAlterado('Cod_sku', CodigoBarrasAntigo.Cod_sku, CodigoBarrasNovo.Cod_sku);
end;

procedure TRepositorioCodigoBarras.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  CodigoBarras :TCodigoBarras;
begin
   CodigoBarras := (Objeto as TCodigoBarras);

   Auditoria.AdicionaCampoExcluido('codigo'     , intToStr(CodigoBarras.Codigo));
   Auditoria.AdicionaCampoExcluido('tipo'       , intToStr(CodigoBarras.Tipo));
   Auditoria.AdicionaCampoExcluido('numeracao'  , CodigoBarras.Numeracao);
   Auditoria.AdicionaCampoExcluido('codproduto' , intToStr(CodigoBarras.CodProduto));
   Auditoria.AdicionaCampoExcluido('codcor'     , intToStr(CodigoBarras.CodCor));
   Auditoria.AdicionaCampoExcluido('codgrade'   , intToStr(CodigoBarras.CodGrade));
   Auditoria.AdicionaCampoExcluido('codtamanho' , intToStr(CodigoBarras.CodTamanho));
   Auditoria.AdicionaCampoExcluido('Cod_sku'    , CodigoBarras.Cod_sku);
end;

procedure TRepositorioCodigoBarras.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  CodigoBarras :TCodigoBarras;
begin
   CodigoBarras := (Objeto as TCodigoBarras);

   Auditoria.AdicionaCampoIncluido('codigo'     , intToStr(CodigoBarras.Codigo));
   Auditoria.AdicionaCampoIncluido('tipo'       , intToStr(CodigoBarras.Tipo));
   Auditoria.AdicionaCampoIncluido('numeracao'  , CodigoBarras.Numeracao);
   Auditoria.AdicionaCampoIncluido('codproduto' , intToStr(CodigoBarras.CodProduto));
   Auditoria.AdicionaCampoIncluido('codcor'     , intToStr(CodigoBarras.CodCor));
   Auditoria.AdicionaCampoIncluido('codgrade'   , intToStr(CodigoBarras.CodGrade));
   Auditoria.AdicionaCampoIncluido('codtamanho' , intToStr(CodigoBarras.CodTamanho));
   Auditoria.AdicionaCampoIncluido('Cod_sku'    , CodigoBarras.Cod_sku);
end;

procedure TRepositorioCodigoBarras.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TCodigoBarras(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioCodigoBarras.SetParametros(Objeto: TObject);
var
  CodigoBarras :TCodigoBarras;
begin
   CodigoBarras := (Objeto as TCodigoBarras);

   if (CodigoBarras.Codigo > 0) then  inherited SetParametro('codigo', CodigoBarras.Codigo)
   else                         inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('tipo').AsInteger       := CodigoBarras.Tipo;
   self.FQuery.ParamByName('numeracao').AsString   := CodigoBarras.Numeracao;
   self.FQuery.ParamByName('codproduto').AsInteger := CodigoBarras.CodProduto;
   self.FQuery.ParamByName('codcor').AsInteger     := CodigoBarras.CodCor;
   self.FQuery.ParamByName('codgrade').AsInteger   := CodigoBarras.CodGrade;
   self.FQuery.ParamByName('codtamanho').AsInteger := CodigoBarras.CodTamanho;
   self.FQuery.ParamByName('Cod_sku').AsString     := CodigoBarras.Cod_sku;
end;

function TRepositorioCodigoBarras.SQLGet: String;
begin
  result := 'select * from Codigo_Barras where codigo = :ncod';
end;

function TRepositorioCodigoBarras.SQLGetAll: String;
begin
  result := 'select * from Codigo_Barras';
end;

function TRepositorioCodigoBarras.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), 'CODIGO_BARRAS', [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioCodigoBarras.SQLRemover: String;
begin
   result := ' delete from Codigo_Barras where codigo = :codigo ';
end;

function TRepositorioCodigoBarras.SQLSalvar: String;
begin
  result := 'update or insert into Codigo_Barras      '+
            '(codigo, tipo, numeracao, codproduto, codcor, codgrade, codtamanho, cod_sku)                '+
            ' Values (:codigo, :tipo, :numeracao, :codproduto, :codcor, :codgrade, :codtamanho, :cod_sku) ';
end;

end.

