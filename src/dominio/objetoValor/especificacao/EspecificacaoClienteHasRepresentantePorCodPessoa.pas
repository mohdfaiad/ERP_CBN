unit EspecificacaoClienteHasRepresentantePorCodPessoa;

interface

uses
  Especificacao;

type
  TEspecificacaoClienteHasRepresentantePorCodPessoa = class(TEspecificacao)

  private
    FCodigoPessoa :Integer;

  public
    constructor Create(CodigoPessoa :Integer);

  public
    function SatisfeitoPor(Objeto :TObject) :Boolean; override;
end;

implementation

uses Cliente_Representante;

{ TEspecificacaoClienteHasRepresentantePorCodPessoa }

constructor TEspecificacaoClienteHasRepresentantePorCodPessoa.Create(CodigoPessoa: Integer);
begin
  self.FCodigoPessoa := CodigoPessoa;
end;

function TEspecificacaoClienteHasRepresentantePorCodPessoa.SatisfeitoPor(Objeto: TObject): Boolean;
begin
  result := (TCliente_Representante(Objeto).cod_cliente = self.FCodigoPessoa);
end;

end.
