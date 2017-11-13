unit RepositorioProdutoTabelaPreco;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioProdutoTabelaPreco = class(TRepositorio)

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
  SysUtils, ProdutoTabelaPreco;

{ TRepositorioProdutoTabelaPreco }

function TRepositorioProdutoTabelaPreco.Get(Dataset: TDataSet): TObject;
var
  ProdutoTabelaPreco :TProdutoTabelaPreco;
begin
   ProdutoTabelaPreco               := TProdutoTabelaPreco.Create;
   ProdutoTabelaPreco.Codigo        := self.FQuery.FieldByName('codigo').AsInteger;
   ProdutoTabelaPreco.CodProduto    := self.FQuery.fieldByName('codproduto').AsInteger;
   ProdutoTabelaPreco.CodTabela     := self.FQuery.fieldByName('codtabela').AsInteger;
   ProdutoTabelaPreco.Preco         := self.FQuery.fieldByName('preco').AsFloat;
   ProdutoTabelaPreco.Preco_Liq     := self.FQuery.fieldByName('preco_liq').AsFloat;
   ProdutoTabelaPreco.Preco_Atacado := self.FQuery.fieldByName('preco_atacado').AsFloat;

   result := ProdutoTabelaPreco;
end;

function TRepositorioProdutoTabelaPreco.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TProdutoTabelaPreco(Objeto).Codigo;
end;

function TRepositorioProdutoTabelaPreco.GetNomeDaTabela: String;
begin
  result := 'produto_tabela_preco';
end;

function TRepositorioProdutoTabelaPreco.GetRepositorio: TRepositorio;
begin
  result := TRepositorioProdutoTabelaPreco.Create;
end;

function TRepositorioProdutoTabelaPreco.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TProdutoTabelaPreco(Objeto).Codigo <= 0);
end;

procedure TRepositorioProdutoTabelaPreco.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  ProdutoTabelaPrecoAntigo :TProdutoTabelaPreco;
  ProdutoTabelaPrecoNovo   :TProdutoTabelaPreco;
begin
   ProdutoTabelaPrecoAntigo := (AntigoObjeto as TProdutoTabelaPreco);
   ProdutoTabelaPrecoNovo   := (Objeto       as TProdutoTabelaPreco);

   if (ProdutoTabelaPrecoAntigo.CodProduto <> ProdutoTabelaPrecoNovo.CodProduto) then
    Auditoria.AdicionaCampoAlterado('codproduto', intToStr(ProdutoTabelaPrecoAntigo.CodProduto), intToStr(ProdutoTabelaPrecoNovo.CodProduto));

   if (ProdutoTabelaPrecoAntigo.CodTabela <> ProdutoTabelaPrecoNovo.CodTabela) then
    Auditoria.AdicionaCampoAlterado('codtabela', intToStr(ProdutoTabelaPrecoAntigo.CodTabela), intToStr(ProdutoTabelaPrecoNovo.CodTabela));

   if (ProdutoTabelaPrecoAntigo.Preco <> ProdutoTabelaPrecoNovo.Preco) then
    Auditoria.AdicionaCampoAlterado('preco', floatToStr(ProdutoTabelaPrecoAntigo.Preco), floatToStr(ProdutoTabelaPrecoNovo.Preco));

   if (ProdutoTabelaPrecoAntigo.Preco_Liq <> ProdutoTabelaPrecoNovo.Preco_Liq) then
    Auditoria.AdicionaCampoAlterado('preco_liq', floatToStr(ProdutoTabelaPrecoAntigo.Preco_Liq), floatToStr(ProdutoTabelaPrecoNovo.Preco_Liq));

   if (ProdutoTabelaPrecoAntigo.Preco_Atacado <> ProdutoTabelaPrecoNovo.Preco_Atacado) then
    Auditoria.AdicionaCampoAlterado('preco_atacado', floatToStr(ProdutoTabelaPrecoAntigo.Preco_Atacado), floatToStr(ProdutoTabelaPrecoNovo.Preco_Atacado));
end;

procedure TRepositorioProdutoTabelaPreco.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  ProdutoTabelaPreco :TProdutoTabelaPreco;
begin
   ProdutoTabelaPreco := (Objeto as TProdutoTabelaPreco);

   Auditoria.AdicionaCampoExcluido('codigo'       , intToStr(ProdutoTabelaPreco.Codigo));
   Auditoria.AdicionaCampoExcluido('codproduto'   , intToStr(ProdutoTabelaPreco.CodProduto));
   Auditoria.AdicionaCampoExcluido('codtabela'    , intToStr(ProdutoTabelaPreco.CodTabela));
   Auditoria.AdicionaCampoExcluido('preco'        , floatToStr(ProdutoTabelaPreco.Preco));
   Auditoria.AdicionaCampoExcluido('preco_liq'    , floatToStr(ProdutoTabelaPreco.Preco_Liq));
   Auditoria.AdicionaCampoExcluido('preco_atacado', floatToStr(ProdutoTabelaPreco.Preco_Atacado));
end;

procedure TRepositorioProdutoTabelaPreco.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  ProdutoTabelaPreco :TProdutoTabelaPreco;
begin
   ProdutoTabelaPreco := (Objeto as TProdutoTabelaPreco);

   Auditoria.AdicionaCampoIncluido('codigo'     , intToStr(ProdutoTabelaPreco.Codigo));
   Auditoria.AdicionaCampoIncluido('codproduto' , intToStr(ProdutoTabelaPreco.CodProduto));
   Auditoria.AdicionaCampoIncluido('codtabela'    , intToStr(ProdutoTabelaPreco.CodTabela));
   Auditoria.AdicionaCampoIncluido('preco'        , floatToStr(ProdutoTabelaPreco.Preco));
   Auditoria.AdicionaCampoIncluido('preco_liq'    , floatToStr(ProdutoTabelaPreco.Preco_Liq));
   Auditoria.AdicionaCampoIncluido('preco_atacado', floatToStr(ProdutoTabelaPreco.Preco_Atacado));
end;

procedure TRepositorioProdutoTabelaPreco.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TProdutoTabelaPreco(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioProdutoTabelaPreco.SetParametros(Objeto: TObject);
var
  ProdutoTabelaPreco :TProdutoTabelaPreco;
begin
   ProdutoTabelaPreco := (Objeto as TProdutoTabelaPreco);

   if (ProdutoTabelaPreco.Codigo > 0) then  inherited SetParametro('codigo', ProdutoTabelaPreco.Codigo)
   else                         inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('codproduto').AsInteger  := ProdutoTabelaPreco.CodProduto;
   self.FQuery.ParamByName('codtabela').AsInteger   := ProdutoTabelaPreco.CodTabela;
   self.FQuery.ParamByName('preco').AsFloat         := ProdutoTabelaPreco.Preco;   
   self.FQuery.ParamByName('preco_liq').AsFloat     := ProdutoTabelaPreco.Preco_Liq;
   self.FQuery.ParamByName('preco_atacado').AsFloat := ProdutoTabelaPreco.Preco_Atacado;
end;

function TRepositorioProdutoTabelaPreco.SQLGet: String;
begin
  result := 'select * from produto_tabela_preco where codigo = :ncod';
end;

function TRepositorioProdutoTabelaPreco.SQLGetAll: String;
begin
  result := 'select * from produto_tabela_preco';
end;

function TRepositorioProdutoTabelaPreco.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), self.GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioProdutoTabelaPreco.SQLRemover: String;
begin
   result := ' delete from produto_tabela_preco where codigo = :codigo ';
end;

function TRepositorioProdutoTabelaPreco.SQLSalvar: String;
begin
  result := 'update or insert into produto_tabela_preco                                     '+
            '(codigo, codproduto, codtabela, preco, preco_liq, preco_atacado)               '+
            ' Values (:codigo, :codproduto, :codtabela, :preco, :preco_liq, :preco_atacado) ';
end;

end.







