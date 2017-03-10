unit Item;

interface

uses
  SysUtils,
  Contnrs,
  Produto,
  Cor;

type
  TItem = class

  private
    Fqtd_total: Double;
    Fcod_produto: integer;
    Fcod_cor: integer;
    Fcodigo: integer;
    Fpreco: Real;
    Fvalor_total: Real;
    Fcod_pedido: integer;
    Fref_cor: String;
    Fref_prod: String;
    Fqtd_RN: integer;
    Fqtd_UNICA: Real;
    Fqtd_6: integer;
    Fqtd_1: integer;
    Fqtd_3: integer;
    Fqtd_P: integer;
    Fqtd_2: integer;
    Fqtd_8: integer;
    Fqtd_M: integer;
    Fqtd_4: integer;
    Fqtd_G: integer;
    Fdesconto: Real;
    Fobservacao: String;
    FProduto :TProduto;
    FCor     :TCor;
    FZeraCodigo :Boolean;
    FPeso: Real;

    function GetQtd_total: Double;
    function GetValor_total: Real;

  private
    procedure Setcod_cor(const Value: integer);
    procedure Setcod_produto(const Value: integer);
    procedure Setcodigo(const Value: integer);
    procedure Setpreco(const Value: Real);
    procedure Setdesconto(const Value: Real);
    procedure Setqtd_total(const Value: Double);
    procedure Setvalor_total(const Value: Real);
    procedure Setcod_pedido(const Value: integer);
    procedure Setref_cor(const Value: String);
    procedure Setref_prod(const Value: String);
    procedure Setqtd_1(const Value: integer);
    procedure Setqtd_2(const Value: integer);
    procedure Setqtd_3(const Value: integer);
    procedure Setqtd_4(const Value: integer);
    procedure Setqtd_6(const Value: integer);
    procedure Setqtd_8(const Value: integer);
    procedure Setqtd_G(const Value: integer);
    procedure Setqtd_M(const Value: integer);
    procedure Setqtd_P(const Value: integer);
    procedure Setqtd_RN(const Value: integer);
    procedure Setqtd_UNICA(const Value: Real);
    procedure Setobservacao(const Value: String);

  private
    Fqtd_12: integer;
    Fqtd_10: integer;
    Fqtd_14: integer;
    FDevolvido: String;
    function GetCor              :TCor;
    function GetPesoBrutoTotal   :Real;
    function GetPesoLiquidoTotal :Real;
    function GetProduto          :TProduto;
    procedure Setqtd_10(const Value: integer);
    procedure Setqtd_12(const Value: integer);
    procedure Setqtd_14(const Value: integer);

  public
    constructor Create(const zera_codigo :boolean = true);
    destructor  Destroy; override;

  public
    property codigo            :integer   read Fcodigo            write Setcodigo;
    property cod_pedido        :integer   read Fcod_pedido        write Setcod_pedido;
    property cod_produto       :integer   read Fcod_produto       write Setcod_produto;
    property cod_cor           :integer   read Fcod_cor           write Setcod_cor;
    property preco             :Real      read Fpreco             write Setpreco;
    property desconto          :Real      read Fdesconto write Setdesconto;
    property valor_total       :Real      read GetValor_total     write Setvalor_total;
    property ref_prod          :String    read Fref_prod          write Setref_prod;
    property ref_cor           :String    read Fref_cor           write Setref_cor;
    property qtd_RN            :integer   read Fqtd_RN            write Setqtd_RN;
    property qtd_P             :integer   read Fqtd_P             write Setqtd_P;
    property qtd_M             :integer   read Fqtd_M             write Setqtd_M;
    property qtd_G             :integer   read Fqtd_G             write Setqtd_G;
    property qtd_1             :integer   read Fqtd_1             write Setqtd_1;
    property qtd_2             :integer   read Fqtd_2             write Setqtd_2;
    property qtd_3             :integer   read Fqtd_3             write Setqtd_3;
    property qtd_4             :integer   read Fqtd_4             write Setqtd_4;
    property qtd_6             :integer   read Fqtd_6             write Setqtd_6;
    property qtd_8             :integer   read Fqtd_8             write Setqtd_8;
    property qtd_10            :integer   read Fqtd_10            write Setqtd_10;
    property qtd_12            :integer   read Fqtd_12            write Setqtd_12;
    property qtd_14            :integer   read Fqtd_14            write Setqtd_14;
    property qtd_UNICA         :Real      read Fqtd_UNICA         write Setqtd_UNICA;
    property qtd_total         :Double    read GetQtd_total       write Setqtd_total;
    property observacao        :String    read Fobservacao        write Setobservacao;
    property peso              :Real      read FPeso              write FPeso;
    property devolvido         :String    read FDevolvido         write FDevolvido;

  public
    property Cor               :TCor      read GetCor;
    property PesoBrutoTotal    :Real      read GetPesoBrutoTotal;
    property PesoLiquidoTotal  :Real      read GetPesoLiquidoTotal;
    property Produto           :TProduto  read GetProduto;
    property ZeraCodigo        :Boolean   read FZeraCodigo;
  end;

implementation

uses
  Repositorio, Math,
  FabricaRepositorio;

{ TItem }

procedure TItem.Setcod_cor(const Value: integer);
begin
  Fcod_cor := Value;
end;

procedure TItem.Setcod_produto(const Value: integer);
begin
  Fcod_produto := Value;
end;

procedure TItem.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TItem.Setpreco(const Value: Real);
begin
  Fpreco := Value;
end;

procedure TItem.Setqtd_total(const Value: Double);
begin
  Fqtd_total := Value;
end;

procedure TItem.Setvalor_total(const Value: Real);
begin
  Fvalor_total := Value;
end;

procedure TItem.Setcod_pedido(const Value: integer);
begin
  Fcod_pedido := Value;
end;

procedure TItem.Setref_cor(const Value: String);
begin
  Fref_cor := Value;
end;

procedure TItem.Setref_prod(const Value: String);
begin
  Fref_prod := Value;
end;

procedure TItem.Setqtd_1(const Value: integer);
begin
  Fqtd_1 := Value;
end;

procedure TItem.Setqtd_10(const Value: integer);
begin
  Fqtd_10 := Value;
end;

procedure TItem.Setqtd_12(const Value: integer);
begin
  Fqtd_12 := Value;
end;

procedure TItem.Setqtd_14(const Value: integer);
begin
  Fqtd_14 := Value;
end;

procedure TItem.Setqtd_2(const Value: integer);
begin
  Fqtd_2 := Value;
end;

procedure TItem.Setqtd_3(const Value: integer);
begin
  Fqtd_3 := Value;
end;

procedure TItem.Setqtd_4(const Value: integer);
begin
  Fqtd_4 := Value;
end;

procedure TItem.Setqtd_6(const Value: integer);
begin
  Fqtd_6 := Value;
end;

procedure TItem.Setqtd_8(const Value: integer);
begin
  Fqtd_8 := Value;
end;

procedure TItem.Setqtd_G(const Value: integer);
begin
  Fqtd_G := Value;
end;

procedure TItem.Setqtd_M(const Value: integer);
begin
  Fqtd_M := Value;
end;

procedure TItem.Setqtd_P(const Value: integer);
begin
  Fqtd_P := Value;
end;

procedure TItem.Setqtd_RN(const Value: integer);
begin
  Fqtd_RN := Value;
end;

procedure TItem.Setqtd_UNICA(const Value: Real);
begin
  Fqtd_UNICA := Value;
end;

procedure TItem.Setdesconto(const Value: Real);
begin
  Fdesconto := Value;
end;

procedure TItem.Setobservacao(const Value: String);
begin
  Fobservacao := Value;
end;

function TItem.GetCor: TCor;
var
  Repositorio :TRepositorio;
begin
   Repositorio := nil;

   try
     if not Assigned(self.FCor) then begin
       Repositorio := TFabricaRepositorio.GetRepositorio(TCor.ClassName);
       self.FCor   := (Repositorio.Get(self.Fcod_cor) as TCor);
     end;

     result := self.FCor;
   finally
     FreeAndNil(Repositorio);
   end;
end;

function TItem.GetProduto: TProduto;
var
  Repositorio :TRepositorio;
begin
   Repositorio := nil;

   try
     if not Assigned(self.FProduto) then begin
       Repositorio   := TFabricaRepositorio.GetRepositorio(TProduto.ClassName);
       self.FProduto := (Repositorio.Get(self.Fcod_produto) as TProduto);
     end;

     result := self.FProduto;
   finally
     FreeAndNil(Repositorio);
   end;
end;

constructor TItem.Create(const zera_codigo :boolean);
begin
   inherited Create;

   self.FProduto := nil;
   self.FCor     := nil;
   self.FZeraCodigo := zera_codigo;
end;

function TItem.GetPesoBrutoTotal: Real;
begin
   try
     result := (self.Fqtd_total * self.Produto.PesoBru);
   except
     on E: EAccessViolation do
      result := 0;
   end;
end;

function TItem.GetPesoLiquidoTotal: Real;
begin
   try
     result := (self.Fqtd_total * self.Produto.PesoLiq);
   except
     on E: EAccessViolation do
      result := 0;
   end;
end;

destructor TItem.Destroy;
begin
   if Assigned(self.FCor) then
    FreeAndNil(self.FCor);

   if Assigned(self.FProduto) then
    FreeAndNil(self.FProduto);
    
  inherited;
end;

function TItem.GetQtd_total: Double;
begin
  Result := ( self.Fqtd_RN + self.qtd_P + self.qtd_M + self.qtd_G + self.qtd_1 + self.qtd_2 + self.qtd_3 + self.qtd_4 +
              self.qtd_6   + self.qtd_8 + self.qtd_10 + self.qtd_12 + self.qtd_14 + self.qtd_UNICA );
end;

function TItem.GetValor_total: Real;
begin
  Result := ( IfThen(self.FPeso > 0, self.FPeso, self.GetQtd_total) * self.Fpreco) - self.Fdesconto;
end;

end.

