unit EspecificacaoDestinatarioComCodigoIgualA;

interface

uses
  Especificacao;

type
  TEspecificacaoDestinatarioComCodigoIgualA = class(TEspecificacao)

  private
    FCodigo :Integer;

  public
    constructor Create(const Codigo :Integer);

  public
    function SatisfeitoPor(Destinatario :TObject) :Boolean; override;
end;

implementation

uses
  Pessoa,
  TipoPessoa;

{ TEspecificacaoDestinatarioComCodigoIgualA }

constructor TEspecificacaoDestinatarioComCodigoIgualA.Create(
  const Codigo: Integer);
begin
   self.FCodigo := Codigo;
end;

function TEspecificacaoDestinatarioComCodigoIgualA.SatisfeitoPor(
  Destinatario: TObject): Boolean;
var
  D :TPessoa;
begin
   D := (Destinatario as TPessoa);

   result := (self.FCodigo = D.Codigo) and TTipoPessoaUtilitario.IsDestinatarioNotaFiscal(TTipoPessoaUtilitario.DeStringParaEnumerado(D.Tipo));
end;

end.
