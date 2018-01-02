unit EspecificacaoCaixasDaConferencia;

interface

uses
  Especificacao;

type
  TEspecificacaoCaixasDaConferencia = class(TEspecificacao)

  private
    FCodigo_conferencia :integer;

  public
    constructor Create(pCodigo_conferencia :integer);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses caixaPedido;

{ TEspecificacaoCaixasDaConferencia }

constructor TEspecificacaoCaixasDaConferencia.Create(pCodigo_conferencia: integer);
begin
  FCodigo_conferencia := pCodigo_conferencia;
end;

function TEspecificacaoCaixasDaConferencia.SatisfeitoPor(Objeto: TObject): Boolean;
begin
  result := (Objeto as TCaixaPedido).codigo_conferencia = FCodigo_conferencia;
end;

end.
