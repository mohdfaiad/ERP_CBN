unit EspecificacaoTransportadoraComCodigoIgualA;

interface

uses
  Especificacao;

type
  TEspecificacaoTransportadoraComCodigoIgualA = class(TEspecificacao)

  private
    FCodigo :Integer;

  public
    constructor Create(const Codigo :Integer);

  public
    function SatisfeitoPor(Transportadora :TObject) :Boolean; override;
end;

implementation

uses
  Pessoa,
  TipoPessoa;

{ TEspecificacaoTransportadoraComCodigoIgualA }

constructor TEspecificacaoTransportadoraComCodigoIgualA.Create(
  const Codigo: Integer);
begin
   self.FCodigo := Codigo;
end;

function TEspecificacaoTransportadoraComCodigoIgualA.SatisfeitoPor(
  Transportadora: TObject): Boolean;
var
  T :TPessoa;
begin
   T := (Transportadora as TPessoa);

   result := (T.Codigo = self.FCodigo) and TTipoPessoaUtilitario.IsTransportadora(TTipoPessoaUtilitario.DeStringParaEnumerado(T.Tipo));
end;

end.
