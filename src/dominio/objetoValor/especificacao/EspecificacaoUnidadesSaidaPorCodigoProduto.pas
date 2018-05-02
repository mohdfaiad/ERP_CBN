unit EspecificacaoUnidadesSaidaPorCodigoProduto;

interface

uses
  Especificacao, Materia;

type
  TEspecificacaoUnidadesSaidaPorCodigoProduto = class(TEspecificacao)

  private
    FMateria :TMateria;

  public
    constructor Create(Materia :TMateria);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses UnidadeEntSai;

{ TEspecificacaoUnidadesSaidaPorCodigoProduto }

constructor TEspecificacaoUnidadesSaidaPorCodigoProduto.Create(Materia: TMateria);
begin
  FMateria := Materia;
end;

function TEspecificacaoUnidadesSaidaPorCodigoProduto.SatisfeitoPor(Objeto: TObject): Boolean;
begin
  result := TUnidadeEntSai(Objeto).codigo_materia = FMateria.codigo;
end;

end.
