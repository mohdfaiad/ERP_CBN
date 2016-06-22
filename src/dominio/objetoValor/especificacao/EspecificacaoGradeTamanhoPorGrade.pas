unit EspecificacaoGradeTamanhoPorCodigoGrade;

interface

uses
  Especificacao;

type
  TEspecificacaoGradeTamanhoPorCodigoGrade = class(TEspecificacao)

  private
    FCodigoGrade :TInteger;

  public
    constructor Create(const CodigoGrade :Integer);

  public
    function SatisfeitoPor(GradeTamanho :TObject) :Boolean; override;
end;

implementation

uses
  Grade_Tamanhos;

{ TEspecificacaoGradeTamanhoPorCodigoGrade }

constructor TEspecificacaoGradeTamanhoPorCodigoGrade.Create(
  const CodigoGrade: Integer);
begin
   self.FCodigoGrade := CodigoGrade;
end;

function TEspecificacaoGradeTamanhoPorCodigoGrade.SatisfeitoPor(
  GradeTamanho: TObject): Boolean;
var
  GT :TGrade_Tamanhos;
begin
   GT     := (GradeTamanho as TGrade_Tamanhos);
   result := (GT.Codgrade = self.FCodigoGrade);
end;

end.
