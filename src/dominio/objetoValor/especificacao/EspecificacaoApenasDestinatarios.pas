unit EspecificacaoApenasDestinatarios;

interface

uses
  Especificacao;

type
  TEspecificacaoApenasDestinatarios = class(TEspecificacao)

  public
    function SatisfeitoPor(Pessoa :TObject) :Boolean; override;
end;

implementation

uses
  Pessoa,
  TipoPessoa;

{ TEspecificacaoApenasDestinatarios }

function TEspecificacaoApenasDestinatarios.SatisfeitoPor(
  Pessoa: TObject): Boolean;
var
  P :TPessoa;
begin
   P := (Pessoa as TPessoa);

   result := TTipoPessoaUtilitario.IsDestinatarioNotaFiscal(TTipoPessoaUtilitario.DeStringParaEnumerado(P.Tipo));
end;

end.
