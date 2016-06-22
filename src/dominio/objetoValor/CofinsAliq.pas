unit CofinsAliq;

interface

uses
  TributacaoItemNotaFiscal;

type
  TCofinsAliq = class(TTributacaoItemNotaFiscal)

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

{ TCofinsAliq }

constructor TCofinsAliq.Create(Aliquota: Real);
begin
   if (Aliquota < 0) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, 'Create(Aliquota: Real)', 'Aliquota');

   self.FAliquota    := Aliquota;
end;

function TCofinsAliq.GetCST: String;
begin
   result := '01';
end;

function TCofinsAliq.GetValor: Real;
begin
   result := arredonda(((self.BaseCalculo * self.FAliquota) / 100));
end;

procedure TCofinsAliq.SetAliquota(const Value: Real);
begin
  FAliquota := Value;
end;

procedure TCofinsAliq.SetValor(const Value: Real);
begin
  FValor := Value;
end;

end.
