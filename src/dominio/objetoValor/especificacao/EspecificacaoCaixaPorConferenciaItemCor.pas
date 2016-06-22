unit EspecificacaoCaixaPorConferenciaItemCor;

interface

uses Especificacao;

type TEspecificacaoCaixaPorConferenciaItemCor = class(TEspecificacao)

  private
    FCod_Conferencia, FCod_Item, FCod_Cor: Integer;

  public
    function SatisfeitoPor(Objeto: TObject): Boolean; override;
    constructor Create(Cod_Conferencia, Cod_Item, Cod_Cor: Integer);

end;

implementation

uses Caixas;

{ TEspecificacaoCaixaPorConferenciaItemCor }

constructor TEspecificacaoCaixaPorConferenciaItemCor.Create(Cod_Conferencia, Cod_Item, Cod_Cor: Integer);
begin
  FCod_Conferencia:= Cod_Conferencia;
  FCod_Item:= Cod_Item;
  FCod_Cor:= Cod_Cor;
end;

function TEspecificacaoCaixaPorConferenciaItemCor.SatisfeitoPor(Objeto: TObject): Boolean;
var Caixa: TCaixas;
begin
  Caixa:= TCaixas(Objeto);
  Result:= (Caixa.codigo_conferencia=FCod_Conferencia)and(Caixa.codigo_item=FCod_Item)and(Caixa.codigo_cor=FCod_Cor);
end;

end.
