unit PisAliq;

interface

uses
  TributacaoItemNotaFiscal;

type
  TPisAliq = class(TTributacaoItemNotaFiscal)

  private
    FAliquota    :Real;
    FValor       :Real;
    procedure SetAliquota(const Value: Real);
    procedure SetValor(const Value: Real);

  private
    function GetCST   :String;
    function GetValor :Real;

  public
    constructor Create(Aliquota :Real);

  public
    property CST         :String   read GetCST;
    property Aliquota    :Real     read FAliquota write SetAliquota;
    property Valor       :Real     read GetValor  write SetValor;
end;

implementation

uses
  ExcecaoParametroInvalido, Funcoes;

{ TPisAliq }

constructor TPisAliq.Create(Aliquota: Real);
begin
   if (Aliquota < 0) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, 'Create(Aliquota: Real)', 'Aliquota');

   self.FAliquota    := Aliquota;
end;

function TPisAliq.GetCST: String;
begin
   result := '01';
end;

function TPisAliq.GetValor: Real;
begin
   result := Arredonda(((self.BaseCalculo * self.FAliquota) / 100));
end;

procedure TPisAliq.SetAliquota(const Value: Real);
begin
  FAliquota := Value;
end;

procedure TPisAliq.SetValor(const Value: Real);
begin
  FValor := value;
end;

end.
