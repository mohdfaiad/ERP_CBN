unit EspecificacaoCoresFilhasPorCorPai;

interface

uses
  Especificacao;

type
  TEspecificacaoCoresFilhasPorCorPai = class(TEspecificacao)

  private
    FCodigo_cor :integer;

  public
    constructor Create(codigo_cor :integer);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses CorFilha;

{ TEspecificacaoCoresFilhasPorCorPai }

constructor TEspecificacaoCoresFilhasPorCorPai.Create(codigo_cor: integer);
begin
  self.FCodigo_cor := codigo_cor;
end;

function TEspecificacaoCoresFilhasPorCorPai.SatisfeitoPor(Objeto: TObject): Boolean;
var CorFilha :TCorFilha;
begin
  CorFilha := (Objeto as TCorFilha);

  result := (CorFilha.codigo_cor_pai = self.FCodigo_cor);

end;

end.
