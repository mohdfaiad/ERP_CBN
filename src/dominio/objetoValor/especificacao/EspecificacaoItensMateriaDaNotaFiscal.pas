unit EspecificacaoItensMateriaDaNotaFiscal;

interface

uses
  Especificacao,
  NotaFiscal;

type
  TEspecificacaoItensMateriaDaNotaFiscal = class(TEspecificacao)

  private
    FCodigoNotaFiscal :Integer;

  public
    constructor Create(NotaFiscal :TNotaFiscal);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses
  ExcecaoParametroInvalido, ItemNFMateria;

{ TEspecificacaoItensMateriaDaNotaFiscal }

constructor TEspecificacaoItensMateriaDaNotaFiscal.Create(
  NotaFiscal: TNotaFiscal);
begin
  self.FCodigoNotaFiscal := NotaFiscal.CodigoNotaFiscal;
end;

function TEspecificacaoItensMateriaDaNotaFiscal.SatisfeitoPor(
  Objeto: TObject): Boolean;
var
  Item :TItemNfMateria;
begin
   Item := (Objeto as TItemNfMateria);

   result := (Item.codigo_nota_fiscal = self.FCodigoNotaFiscal);
end;

end.
