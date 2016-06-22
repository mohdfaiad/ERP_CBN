unit EspecificacaoNaturezaPorTipo;

interface

uses
  TipoNaturezaOperacao,
  Especificacao;

type
  TEspecificacaoNaturezaPorTipo = class(TEspecificacao)

  private
    FTipo :TTipoNaturezaOperacao;

  public
    constructor Create(TipoNatureza :TTipoNaturezaOperacao);

  public
    function SatisfeitoPor(Natureza :TObject) :Boolean; override;
end;

implementation

uses
  NaturezaOperacao,
  SysUtils;

{ TEspecificacaoNaturezaPorTipo }

constructor TEspecificacaoNaturezaPorTipo.Create(TipoNatureza :TTipoNaturezaOperacao);
begin
   self.FTipo := TipoNatureza;
end;

function TEspecificacaoNaturezaPorTipo.SatisfeitoPor(Natureza: TObject): Boolean;
var
  Nat :TNaturezaOperacao;
begin
   try
     Nat := (Natureza as TNaturezaOperacao);
   except
     on E: EInvalidCast do
      raise EInvalidCast.Create('Erro em TEspecificacaoNaturezaPorTipo.SatisfeitoPor(Natureza: TObject): Boolean; '+
                                'O parâmetro passado não é do tipo TNaturezaOperacao. Entre em contato com o suporte!');
   end;

   result := (self.FTipo = Nat.Tipo);
end;

end.
