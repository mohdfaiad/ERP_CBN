unit EspecificacaoDevolucaoPedido;

interface

uses
  Especificacao;

type
  TEspecificacaoDevolucaoPedido = class(TEspecificacao)

  private
    FCodigoPedido :Integer;

  public
    constructor Create(CodigoPedido :Integer);

  public
    function SatisfeitoPor(Devolucao :TObject) :Boolean; override;
end;

implementation

uses Devolucao;

{ TEspecificacaoDevolucaoPedido }

constructor TEspecificacaoDevolucaoPedido.Create(CodigoPedido: Integer);
begin
  FCodigoPedido := CodigoPedido;
end;

function TEspecificacaoDevolucaoPedido.SatisfeitoPor(Devolucao: TObject): Boolean;
begin
  result := TDevolucao(Devolucao).codigo_pedido = self.FCodigoPedido;
end;

end.
