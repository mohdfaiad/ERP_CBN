unit EspecificacaoProdutosKit;

interface

uses
  Especificacao,
  Produto;

type
  TEspecificacaoProdutosKit = class(TEspecificacao)

  private
    FProduto :TProduto;

  public
    constructor Create(Produto :TProduto);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses
  ProdutosKit;

{ TEspecificacaoProdutosKit }

constructor TEspecificacaoProdutosKit.Create(Produto: TProduto);
begin
  FProduto := Produto;
end;

function TEspecificacaoProdutosKit.SatisfeitoPor(Objeto: TObject): Boolean;
begin
  result := TProdutosKit(Objeto).codigo_kit = self.FProduto.Codigo;
end;

end.
