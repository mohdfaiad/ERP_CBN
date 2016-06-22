unit EspecificacaoItemConferidoPorCodigoItem;

interface

uses
  Especificacao;

type
  TEspecificacaoItemConferidoPorCodigoItem = class(TEspecificacao)

  private
    FCodigoItemPedido :Integer;

  public
    constructor Create(codigoItemPedido :Integer);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses ConferenciaItem;

{ TEspecificacaoItemConferidoPorCodigoItem }

constructor TEspecificacaoItemConferidoPorCodigoItem.Create(
  codigoItemPedido: Integer);
begin
  self.FCodigoItemPedido := codigoItemPedido;
end;

function TEspecificacaoItemConferidoPorCodigoItem.SatisfeitoPor(
  Objeto: TObject): Boolean;
var
  Item :TConferenciaItem;
begin
   Item := (Objeto as TConferenciaItem);

   result := (Item.codigo_item = self.FCodigoItemPedido);
end;

end.
