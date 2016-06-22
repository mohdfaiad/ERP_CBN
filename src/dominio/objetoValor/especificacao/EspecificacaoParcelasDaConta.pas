unit EspecificacaoParcelasDaConta;

interface

uses
  Especificacao,
  ContasPagar;

type
  TEspecificacaoParcelasDaConta = class(TEspecificacao)

  private
    FConta :TContasPagar;

  public
    constructor Create(Conta :TContasPagar);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses
  Parcela;

{ TEspecificacaoParcelasDaConta }

constructor TEspecificacaoParcelasDaConta.Create(Conta: TContasPagar);
begin
  self.FConta := Conta;
end;

function TEspecificacaoParcelasDaConta.SatisfeitoPor(Objeto: TObject): Boolean;
begin
  result := ( TParcela(Objeto).codigo_conta = self.FConta.codigo);
end;

end.
