unit EspecificacaoDadosRepresentantePorCodPessoa;

interface

uses
  Especificacao;

type
  TEspecificacaoDadosRepresentantePorCodPessoa = class(TEspecificacao)

  private
    FCodigoPessoa :Integer;

  public
    constructor Create(codigoPessoa :Integer);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses DadosRepresentante;

{ TEspecificacaoDadosRepresentantePorCodPessoa }

constructor TEspecificacaoDadosRepresentantePorCodPessoa.Create(codigoPessoa: Integer);
begin
  self.FCodigoPessoa := codigoPessoa;
end;

function TEspecificacaoDadosRepresentantePorCodPessoa.SatisfeitoPor(Objeto: TObject): Boolean;
begin
  result := TDadosRepresentante(Objeto).codigo_representante = self.FCodigoPessoa;
end;

end.
