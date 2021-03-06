unit EspecificacaoItensDoPedido;

interface

uses
  Especificacao,
  Pedido;

type
  TEspecificacaoItensDoPedido = class(TEspecificacao)

  private
    FPedido :TPedido;

  public
    constructor Create(Pedido :TPedido);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses
  Item,
  ExcecaoParametroInvalido;

{ TEspecificacaoItensDoPedido }

constructor TEspecificacaoItensDoPedido.Create(Pedido: TPedido);
begin
   if not Assigned(Pedido) then
    raise TExcecaoParametroInvalido.Create('TEspecificacaoItensDoPedido', 'Create(Pedido: TPedido)', 'Pedido');

   self.FPedido := Pedido;    
end;

function TEspecificacaoItensDoPedido.SatisfeitoPor(
  Objeto: TObject): Boolean;
var
  Item :TItem;
begin
   Item := (Objeto as TItem);

   result := (Item.cod_pedido = self.FPedido.Codigo);
end;

end.
