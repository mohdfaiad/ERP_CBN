unit EspecificacaoParcelaPorCodigoNotaFiscal;

interface

uses
  Especificacao, system.SysUtils;

type
  TEspecificacaoParcelaPorCodigoNotaFiscal = class(TEspecificacao)

  private
    FcodigoNF :Integer;

  public
    constructor Create(codigoNF :integer);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses
  Parcela;

{ TEspecificacaoParcelaPorCodigoNotaFiscal }

constructor TEspecificacaoParcelaPorCodigoNotaFiscal.Create(codigoNF: integer);
begin
  FcodigoNF := codigoNF;
end;

function TEspecificacaoParcelaPorCodigoNotaFiscal.SatisfeitoPor(Objeto: TObject): Boolean;
begin
  result := TParcela(Objeto).codigo_nota_fiscal = self.FcodigoNF;
end;

end.
