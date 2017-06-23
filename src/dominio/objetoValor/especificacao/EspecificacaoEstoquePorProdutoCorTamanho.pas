unit EspecificacaoEstoquePorProdutoCorTamanho;

interface

uses
  Especificacao;

type
  TEspecificacaoEstoquePorProdutoCorTamanho = class(TEspecificacao)

  private
    FCodigoProduto :integer;
    FCodigocor     :integer;
    FCodigoTamanho :integer;
    FSetor         :integer;

  public
    constructor Create(setor, Codigo_produto, codigo_cor, codigo_tamanho :integer);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses Estoque;

{ TEspecificacaoEstoquePorProdutoCorTamanho }

constructor TEspecificacaoEstoquePorProdutoCorTamanho.Create(
  setor, Codigo_produto, codigo_cor, codigo_tamanho: integer);
begin
  self.FCodigoProduto := Codigo_produto;
  self.FCodigocor     := codigo_cor;
  self.FCodigoTamanho := codigo_tamanho;
  self.FSetor         := setor;
end;

function TEspecificacaoEstoquePorProdutoCorTamanho.SatisfeitoPor(
  Objeto: TObject): Boolean;
var
  Estoque :TEstoque;
begin
   Estoque := (Objeto as TEstoque);

   result  := (Estoque.codigo_produto = self.FCodigoProduto) and
              (Estoque.codigo_tamanho = self.FCodigoTamanho) and
              (Estoque.setor = self.FSetor);

   if not result then exit;           

   if self.FCodigocor > 0 then
     result  := (Estoque.codigo_cor = self.FCodigocor);
end;

end.
 