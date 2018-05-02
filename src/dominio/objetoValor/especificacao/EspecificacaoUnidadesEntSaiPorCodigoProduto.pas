unit EspecificacaoUnidadesEntSaiPorCodigoProduto;

interface

uses
  Especificacao;

type
  TEspecificacaoUnidadesEntSaiPorCodigoProduto = class(TEspecificacao)

  private
    FCodProduto :integer;
    FUnidade :String;

  public
    constructor Create(codProduto :integer; Unidade :String);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses UnidadeEntSai, SysUtils;

{ TEspecificacaoUnidadesEntSaiPorCodigoProduto }

constructor TEspecificacaoUnidadesEntSaiPorCodigoProduto.Create(codProduto: integer; Unidade: String);
begin
  FUnidade := Unidade;
  FCodProduto := codProduto;
end;

function TEspecificacaoUnidadesEntSaiPorCodigoProduto.SatisfeitoPor(Objeto: TObject): Boolean;
begin
  result := (TUnidadeEntSai(Objeto).codigo_materia = FCodProduto);
end;

end.
