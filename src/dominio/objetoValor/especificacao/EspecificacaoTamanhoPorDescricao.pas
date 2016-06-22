unit EspecificacaoTamanhoPorDescricao;

interface

uses
  Especificacao;

type
  TEspecificacaoTamanhoPorDescricao = class(TEspecificacao)

  private
    FDescricao :String;

  public
    constructor Create(const Descricao :String);

  public
    function SatisfeitoPor(Objeto :TObject) :Boolean; override;
end;

implementation

uses
  SysUtils, Tamanho;

{ TEspecificacaoTamanhoPorDescricao }

constructor TEspecificacaoTamanhoPorDescricao.Create(
  const Descricao: String);
begin
   self.FDescricao := Descricao;
end;

function TEspecificacaoTamanhoPorDescricao.SatisfeitoPor(
  Objeto: TObject): Boolean;
begin
   result := (UpperCase(Trim(self.FDescricao)) = TTamanho(Objeto).Descricao);
end;

end.
