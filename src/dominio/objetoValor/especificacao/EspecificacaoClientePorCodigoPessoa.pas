unit EspecificacaoClientePorCodigoPessoa;

interface

uses
  Especificacao;

type
  TEspecificacaoClientePorCodigoPessoa = class(TEspecificacao)

  private
    FCodigoPessoa :Integer;

  public
    constructor Create(CodigoPessoa :Integer);

  public
    function SatisfeitoPor(Cliente :TObject) :Boolean; override;
end;

implementation

uses Cliente;

{ TEspecificacaoClientePorCodigoPessoa }

constructor TEspecificacaoClientePorCodigoPessoa.Create(
  CodigoPessoa: Integer);
begin
   self.FCodigoPessoa := CodigoPessoa;
end;

function TEspecificacaoClientePorCodigoPessoa.SatisfeitoPor(
  Cliente: TObject): Boolean;
var
  C :TCliente;
begin
   C := (Cliente as TCliente);

   result := (C.CodCli = self.FCodigoPessoa);
end;

end.
