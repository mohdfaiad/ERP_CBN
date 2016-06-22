unit Icms00;

interface

uses
  TributacaoItemNotaFiscal,
  TipoOrigemMercadoria;

type
  TIcms00 = class(TTributacaoItemNotaFiscal)

  private
    FOrigemMercadoria   :TTipoOrigemMercadoria;
    FAliquota           :Real;
    FValor              :Real;
    FPercReducaoBC      :Real;
    procedure SetAliquota(const Value: Real);
    procedure SetValor(const Value: Real);
    function GetBaseDeCalculo: Real;

  private
    function GetCST   :String;
    function GetValor :Real;

  public
    constructor Create(OrigemMercadoria :TTipoOrigemMercadoria; Aliquota, PercReducaoBC :Real);

  public
    property OrigemMercadoria   :TTipoOrigemMercadoria read FOrigemMercadoria;
    property CST                :String                read GetCST;
    property Aliquota           :Real                  read FAliquota          write SetAliquota;
    property PercReducaoBC      :Real                  read FPercReducaoBC     write FPercReducaoBC;
    property Valor              :Real                  read GetValor           write SetValor;
    property BaseDeCalculo      :Real                  read GetBaseDeCalculo;
end;

implementation

uses
  ExcecaoParametroInvalido, Funcoes;

{ TIcms00 }

constructor TIcms00.Create(OrigemMercadoria: TTipoOrigemMercadoria;
  Aliquota, PercReducaoBC: Real);
begin
   if (Aliquota < 0) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, 'Create(Aliquota :Real)', 'Aliquota');

   self.FOrigemMercadoria  := OrigemMercadoria;
   self.FAliquota          := Aliquota;
   self.FPercReducaoBC     := PercReducaoBC;
end;

function TIcms00.GetBaseDeCalculo: Real;
begin
   {Se houver reducao, abate-se do valor da base de calculo}

     result := self.BaseCalculo;

end;

function TIcms00.GetCST: String;
begin
   result := '00';
end;

function TIcms00.GetValor: Real;
begin
   result := ((self.BaseDeCalculo * self.FAliquota) / 100);

   if FPercReducaoBC > 0 then
     result := result - ((FPercReducaoBC * result)/100);
end;

procedure TIcms00.SetAliquota(const Value: Real);
begin
  FAliquota := Value;
end;

procedure TIcms00.SetValor(const Value: Real);
begin
  FValor := Value;
end;

end.
