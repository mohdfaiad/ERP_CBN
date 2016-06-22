unit EspecificacaoCodigosLancamentoPorCodigoComissao;

interface

uses Especificacao;

type
  TEspecificacaoCodigosLancamentoPorCodigoComissao = class(TEspecificacao)

  private
    FCodigoComissaoRepresentante :Integer;

  public
    constructor Create(CodigoComissaoRepresentante :Integer);

  public
    function SatisfeitoPor(Comissao_has_lancamento :TObject) :Boolean; override;
end;

implementation

uses ComissaoHasLancamentos;

{ TEspecificacaoCodigosLancamentoPorCodigoComissao }

constructor TEspecificacaoCodigosLancamentoPorCodigoComissao.Create(
  CodigoComissaoRepresentante: Integer);
begin
  self.FCodigoComissaoRepresentante := CodigoComissaoRepresentante;
end;

function TEspecificacaoCodigosLancamentoPorCodigoComissao.SatisfeitoPor(
  Comissao_has_lancamento: TObject): Boolean;
var
  C :TComissaoHasLancamentos;
begin
   C := (Comissao_has_lancamento as TComissaoHasLancamentos);

   result := (C.codigo_comissao_representante = self.FCodigoComissaoRepresentante);
end;

end.
