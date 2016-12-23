unit EspecificacaoParcelaPorCodigoPedido;

interface

uses
  Especificacao, system.SysUtils;

type
  TEspecificacaoParcelaPorCodigoPedido = class(TEspecificacao)

  private
    FCodigoPedido :Integer;

  public
    constructor Create(codigoPedido :integer);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses
  Parcela;

{ TEspecificacaoParcelaPorCodigoPedido }

constructor TEspecificacaoParcelaPorCodigoPedido.Create(codigoPedido: integer);
begin
  FCodigoPedido := codigoPedido;
end;

function TEspecificacaoParcelaPorCodigoPedido.SatisfeitoPor(Objeto: TObject): Boolean;
begin
  result := TParcela(Objeto).codigo_pedido = self.FCodigoPedido;
end;

end.
