unit EspecificacaoPedidoFaturado;

interface

uses
  Especificacao;

type
  TEspecificacaoPedidoFaturado = class(TEspecificacao)

  private
    FCodigoPedido :Integer;

  public
    constructor Create(CodigoPedido :Integer);

  public
    function SatisfeitoPor(Objeto :TObject) :Boolean; override;
end;

implementation

uses
  Pedido, ExcecaoParametroInvalido, PedidoFaturado;

{ TEspecificacaoPedidoFaturado }

constructor TEspecificacaoPedidoFaturado.Create(CodigoPedido: Integer);
begin
   if (CodigoPedido <= 0) then
    raise TExcecaoParametroInvalido.Create(
                                           'TEspecificacaoPedidoFaturado',
                                           'Create(CodigoPedido :Integer)',
                                           'CodigoPedido');

   self.FCodigoPedido := CodigoPedido;
end;

function TEspecificacaoPedidoFaturado.SatisfeitoPor(
  Objeto: TObject): Boolean;
var
  PedFat :TPedidoFaturado;
begin
   PedFat := (Objeto as TPedidoFaturado);

   result := (self.FCodigoPedido = PedFat.CodigoPedido);
end;

end.
