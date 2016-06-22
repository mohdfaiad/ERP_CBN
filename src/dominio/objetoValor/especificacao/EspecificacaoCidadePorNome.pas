unit EspecificacaoCidadePorNome;

interface

uses
  Especificacao;

type
  TEspecificacaoCidadePorNome = class(TEspecificacao)

  private
    FCidade :String;
    FUf :String;

  public
    constructor Create(Cidade :String; UF :String);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses Cidade, SysUtils, Estado;

{ TEspecificacaoCidadePorNome }

constructor TEspecificacaoCidadePorNome.Create(Cidade: String; UF :String);
begin
  Fcidade := UpperCase(Cidade);
  FUf     := UF;
end;

function TEspecificacaoCidadePorNome.SatisfeitoPor(Objeto: TObject): Boolean;
begin
  result := (TCidade(Objeto).nome = FCidade) and (TCidade(Objeto).estado.sigla = FUf);
end;

end.
