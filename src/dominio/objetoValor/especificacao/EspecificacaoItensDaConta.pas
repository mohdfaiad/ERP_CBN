unit EspecificacaoItensDaConta;

interface

uses
  Especificacao,
  ContasPagar;

type
  TEspecificacaoItensDaConta = class(TEspecificacao)

  private
    FConta :TContasPagar;

  public
    constructor Create(Conta :TContasPagar);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses
  ItemConta;

{ TEspecificacaoItensDaConta }

constructor TEspecificacaoItensDaConta.Create(Conta: TContasPagar);
begin
  FConta := Conta;
end;

function TEspecificacaoItensDaConta.SatisfeitoPor(Objeto: TObject): Boolean;
begin
  result := (TItemConta(Objeto).codigo_conta = Fconta.codigo);
end;

end.
