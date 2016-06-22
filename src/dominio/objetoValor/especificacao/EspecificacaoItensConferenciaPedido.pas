unit EspecificacaoItensConferenciaPedido;

interface

uses
  Especificacao,
  ConferenciaPedido;

type
  TEspecificacaoItensConferenciaPedido = class(TEspecificacao)

  private
    FConferenciaPedido :TConferenciaPedido;

  public
    constructor Create(Pedido :TConferenciaPedido);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses ConferenciaItem, ExcecaoParametroInvalido;

{ TEspecificacaoItensConferenciaPedido }

constructor TEspecificacaoItensConferenciaPedido.Create(
  Pedido: TConferenciaPedido);
begin
  if not Assigned(Pedido) then
    raise TExcecaoParametroInvalido.Create('TEspecificacaoItensDoPedido', 'Create(Pedido: TPedido)', 'Pedido');

   self.FConferenciaPedido := Pedido;
end;

function TEspecificacaoItensConferenciaPedido.SatisfeitoPor(
  Objeto: TObject): Boolean;
var
  Item :TConferenciaItem;
begin
   Item := (Objeto as TConferenciaItem);

   result := (Item.codigo_conferencia = self.FConferenciaPedido.codigo);
end;

end.
