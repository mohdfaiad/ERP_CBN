unit EspecificacaoApenasTransportadoras;

interface

uses
  Especificacao;

type
  TEspecificacaoApenasTransportadoras = class(TEspecificacao)

  public
    function SatisfeitoPor(Pessoa :TObject) :Boolean; override;
end;

implementation

uses
  Pessoa,
  TipoPessoa;

{ TEspecificacaoApenasTransportadoras }

function TEspecificacaoApenasTransportadoras.SatisfeitoPor(
  Pessoa: TObject): Boolean;
var
  Transportadora :TPessoa;
begin
   Transportadora := (Pessoa as TPessoa);

   result := TTipoPessoaUtilitario.IsTransportadora(TTipoPessoaUtilitario.DeStringParaEnumerado(Transportadora.Tipo));
end;

end.
