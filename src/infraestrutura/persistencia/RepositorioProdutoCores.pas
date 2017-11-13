unit RepositorioProdutoCores;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioProdutoCores = class(TRepositorio)

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
  SysUtils, ProdutoCores;

{ TRepositorioProdutoCores }

function TRepositorioProdutoCores.Get(Dataset: TDataSet): TObject;
var
  ProdutoCores :TProdutoCores;
begin
   ProdutoCores               := TProdutoCores.Create;
   ProdutoCores.Codigo        := self.FQuery.FieldByName('codigo').AsInteger;
   ProdutoCores.CodProduto    := self.FQuery.fieldByName('codproduto').AsInteger;
   ProdutoCores.CodCor        := self.FQuery.fieldByName('codcor').AsInteger;
   ProdutoCores.genero        := self.FQuery.fieldByName('genero').AsString;
   result := ProdutoCores;
end;

function TRepositorioProdutoCores.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TProdutoCores(Objeto).Codigo;
end;

function TRepositorioProdutoCores.GetNomeDaTabela: String;
begin
  result := 'produto_cores';
end;

function TRepositorioProdutoCores.GetRepositorio: TRepositorio;
begin
  result := TRepositorioProdutoCores.Create;
end;

function TRepositorioProdutoCores.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TProdutoCores(Objeto).Codigo <= 0);
end;

procedure TRepositorioProdutoCores.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  ProdutoCoresAntigo :TProdutoCores;
  ProdutoCoresNovo   :TProdutoCores;
begin
   ProdutoCoresAntigo := (AntigoObjeto as TProdutoCores);
   ProdutoCoresNovo   := (Objeto       as TProdutoCores);

   if (ProdutoCoresAntigo.CodProduto <> ProdutoCoresNovo.CodProduto) then
    Auditoria.AdicionaCampoAlterado('codproduto', intToStr(ProdutoCoresAntigo.CodProduto), intToStr(ProdutoCoresNovo.CodProduto));

   if (ProdutoCoresAntigo.CodCor <> ProdutoCoresNovo.CodCor) then
    Auditoria.AdicionaCampoAlterado('codcor', intToStr(ProdutoCoresAntigo.CodCor), intToStr(ProdutoCoresNovo.CodCor));

   if (ProdutoCoresAntigo.genero <> ProdutoCoresNovo.genero) then
    Auditoria.AdicionaCampoAlterado('genero', ProdutoCoresAntigo.genero, ProdutoCoresNovo.genero);
end;

procedure TRepositorioProdutoCores.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  ProdutoCores :TProdutoCores;
begin
   ProdutoCores := (Objeto as TProdutoCores);

   Auditoria.AdicionaCampoExcluido('codigo'     , intToStr(ProdutoCores.Codigo));
   Auditoria.AdicionaCampoExcluido('codproduto' , intToStr(ProdutoCores.CodProduto));
   Auditoria.AdicionaCampoExcluido('codcor'     , intToStr(ProdutoCores.CodCor));
   Auditoria.AdicionaCampoExcluido('genero'     , ProdutoCores.genero);
end;

procedure TRepositorioProdutoCores.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  ProdutoCores :TProdutoCores;
begin
   ProdutoCores := (Objeto as TProdutoCores);

   Auditoria.AdicionaCampoIncluido('codigo'     , intToStr(ProdutoCores.Codigo));
   Auditoria.AdicionaCampoIncluido('codproduto' , intToStr(ProdutoCores.CodProduto));
   Auditoria.AdicionaCampoIncluido('codcor'     , intToStr(ProdutoCores.CodCor));
   Auditoria.AdicionaCampoIncluido('genero'     , ProdutoCores.genero);
end;

procedure TRepositorioProdutoCores.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TProdutoCores(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioProdutoCores.SetParametros(Objeto: TObject);
var
  ProdutoCores :TProdutoCores;
begin
   ProdutoCores := (Objeto as TProdutoCores);

   if (ProdutoCores.Codigo > 0) then  inherited SetParametro('codigo', ProdutoCores.Codigo)
   else                         inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('codproduto').AsInteger := ProdutoCores.CodProduto;
   self.FQuery.ParamByName('codcor').AsInteger     := ProdutoCores.CodCor;
   self.FQuery.ParamByName('genero').AsString      := ProdutoCores.genero;
end;

function TRepositorioProdutoCores.SQLGet: String;
begin
  result := 'select * from produto_cores where codigo = :ncod';
end;

function TRepositorioProdutoCores.SQLGetAll: String;
begin
  result := 'select * from produto_cores';
end;

function TRepositorioProdutoCores.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), self.GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioProdutoCores.SQLRemover: String;
begin
   result := ' delete from produto_cores where codigo = :codigo ';
end;

function TRepositorioProdutoCores.SQLSalvar: String;
begin
  result := 'update or insert into produto_cores              '+
            '(codigo, codproduto, codcor, genero)             '+
            ' Values (:codigo, :codproduto, :codcor, :genero) ';
end;

end.







