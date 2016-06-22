unit EspecificacaoConferenciaPorCodigoPedido;

interface

uses
  Especificacao,
  ConferenciaPedido;

type
  TEspecificacaoConferenciaPorCodigoPedido = class(TEspecificacao)

  private
    FCodigo_pedido :Integer;

  public
    constructor Create(Codigo_pedido :Integer);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

{ TEspecificacaoConferenciaPorCodigoPedido }

constructor TEspecificacaoConferenciaPorCodigoPedido.Create(
  Codigo_pedido: Integer);
begin
  self.FCodigo_pedido := Codigo_pedido;
end;

function TEspecificacaoConferenciaPorCodigoPedido.SatisfeitoPor(
  Objeto: TObject): Boolean;
var
  Conferencia :TConferenciaPedido;
begin
   Conferencia := (Objeto as TConferenciaPedido);

   result := (Conferencia.codigo_pedido = self.FCodigo_pedido);
end;

end.
