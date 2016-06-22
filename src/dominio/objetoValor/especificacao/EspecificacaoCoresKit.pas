unit EspecificacaoCoresKit;

interface

uses
  Especificacao, Cor;

type
  TEspecificacaoCoresKit = class(TEspecificacao)

  private
    FCor :TCor;

  public
    constructor Create(Cor :TCor);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses CoresKit;

{ TEspecificacaoCoresKit }

constructor TEspecificacaoCoresKit.Create(Cor :TCor);
begin
  FCor := Cor;
end;

function TEspecificacaoCoresKit.SatisfeitoPor(Objeto: TObject): Boolean;
begin
  result := TCoresKit(Objeto).codigo_kit = self.FCor.Codigo;
end;

end.
