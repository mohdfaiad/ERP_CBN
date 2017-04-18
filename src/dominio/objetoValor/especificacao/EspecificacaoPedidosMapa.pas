unit EspecificacaoPedidosMapa;

interface

uses
  Especificacao;

type
  TEspecificacaoPedidosMapa = class(TEspecificacao)

  private
    FCodigoMapa :integer;

  public
    constructor Create(codigoMapa :integer);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;

end;

implementation

uses PedidoMapa;

{ TEspecificacaoPedidosMapa }

constructor TEspecificacaoPedidosMapa.Create(codigoMapa: integer);
begin
  self.FCodigoMapa := codigoMapa;
end;

function TEspecificacaoPedidosMapa.SatisfeitoPor(Objeto: TObject): Boolean;
begin
  result := TPedidoMapa(Objeto).codigo_mapa = self.FCodigoMapa;
end;

end.
