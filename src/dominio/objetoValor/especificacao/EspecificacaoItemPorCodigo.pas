unit EspecificacaoItemPorCodigo;

interface

uses
  Especificacao;

type
  TEspecificacaoItemPorCodigo = class(TEspecificacao)

  private
    FCodigoItem :Integer;

  public
    constructor Create(codigoItem :Integer);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses Item;

{ TEspecificacaoItemPorCodigo }

constructor TEspecificacaoItemPorCodigo.Create(codigoItem: Integer);
begin
  self.FCodigoItem := codigoItem;
end;

function TEspecificacaoItemPorCodigo.SatisfeitoPor(
  Objeto: TObject): Boolean;
var
  Item :TItem;
begin
   Item := (Objeto as TItem);

   result := (Item.codigo = self.FCodigoItem);
end;

end.
 