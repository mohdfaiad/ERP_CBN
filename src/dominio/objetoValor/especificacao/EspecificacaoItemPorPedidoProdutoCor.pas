unit EspecificacaoItemPorPedidoProdutoCor;

interface

uses
  Especificacao,
  Pedido;

type
  TEspecificacaoItemPorPedidoProdutoCor = class(TEspecificacao)

  private
    FCodigoPedido  :integer;
    FCodigoProduto :integer;
    FCodigoCor     :integer;

  public
    constructor Create(Codigo_pedido, Codigo_produto, Codigo_cor :integer);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses
  Item;
{ TEspecificacaoItemPorPedidoProdutoCor }

constructor TEspecificacaoItemPorPedidoProdutoCor.Create(Codigo_pedido,
  Codigo_produto, Codigo_cor: integer);
begin
   self.FCodigoPedido  := Codigo_pedido;
   self.FCodigoProduto := Codigo_produto;
   self.FCodigoCor     := Codigo_cor;
end;

function TEspecificacaoItemPorPedidoProdutoCor.SatisfeitoPor(
  Objeto: TObject): Boolean;
var
  Item :TItem;
begin
   Item := (Objeto as TItem);

   result := ( Item.cod_pedido  = self.FCodigoPedido  )  and
             ( Item.cod_produto = self.FCodigoProduto )  and
             ( Item.cod_cor     = self.FCodigoCor     );
end;

end.
