unit EspecificacaoPedidoPorCodigoMatriz;

interface

uses
  Especificacao, Pedido, ExcecaoParametroInvalido;

type
  TEspecificacaoPedidoPorCodigoMatriz = class(TEspecificacao)

  private
    FCodigoPedido :Integer;

  public
    constructor Create(CodigoPedido :Integer);

  public
    function SatisfeitoPor(Objeto :TObject) :Boolean; override;
end;

implementation

{ TEspecificacaoPedidoPorCodigoMatriz }

constructor TEspecificacaoPedidoPorCodigoMatriz.Create(
  CodigoPedido: Integer);
begin
  if (CodigoPedido <= 0) then
    raise TExcecaoParametroInvalido.Create(
                                           'TEspecificacaoPedidoFaturado',
                                           'Create(CodigoPedido :Integer)',
                                           'CodigoPedido');

  self.FCodigoPedido := CodigoPedido;
end;

function TEspecificacaoPedidoPorCodigoMatriz.SatisfeitoPor(
  Objeto: TObject): Boolean;
var
  Pedido :TPedido;
begin
   Pedido := (Objeto as TPedido);

   result := (self.FCodigoPedido = Pedido.cod_pedido_matriz);
end;

end.
