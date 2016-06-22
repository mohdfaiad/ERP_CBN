unit IpiTrib;

interface

uses
  TributacaoItemNotaFiscal;

type
  TIpiTrib = class(TTributacaoItemNotaFiscal)

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
    property CST            :String read GetCST;
    property Aliquota       :Real   read FAliquota write SetAliquota;
    property Valor          :Real   read GetValor  write SetValor;
end;

implementation

uses Funcoes;

{ TIpiTrib }

constructor TIpiTrib.Create(Aliquota: Real);
begin
   self.FAliquota    := Aliquota;
end;

function TIpiTrib.GetCST: String;
begin
   result := '50';
end;

function TIpiTrib.GetValor: Real;
begin
   result := arredonda(((self.BaseCalculo * self.FAliquota) / 100),3);
end;

procedure TIpiTrib.SetAliquota(const Value: Real);
begin
  FAliquota := Value;
end;

procedure TIpiTrib.SetValor(const Value: Real);
begin
  FValor := value;
end;

end.
