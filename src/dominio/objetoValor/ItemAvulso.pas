unit ItemAvulso;

interface

uses
  MetodoDelegadoObtemCampoInteger,
  Cor,
  Produto,
  Contnrs,
  Tamanho,
  QuantidadeItemAvulso;

type
  TItemAvulso = class

  private
    FCodigo                     :Integer;
    FCodigoNotaFiscal           :Integer;
    FBuscadorCodigoNotaFiscal   :TMetodoDelegadoObtemCampoInteger;
    FCodigoProduto              :Integer;
    FCodigoCor                  :Integer;
    FPreco                      :Real;
    FPercentualDesconto         :Real;
    FCor                        :TCor;
    FProduto                    :TProduto;
    FQuantidades                :TObjectList;

    procedure SetCodigo (const Value: Integer);
    procedure SetCor    (const Value: TCor);
    procedure SetProduto(const Value: TProduto);

  private
    function GetCodigo           :Integer;
    function GetCodigoNotaFiscal :Integer;
    function GetCor              :TCor;
    function GetProduto          :TProduto;
    function GetQuantidadeTotal  :Real;
    function GetQuantidades      :TObjectList;
    function GetValorBruto       :Real;
    function GetValorDesconto    :Real;
    function GetValorTotal       :Real;

    function ObtemQuantidadeItemAvulso(Tamanho :TTamanho) :TQuantidadeItemAvulso;

  private
    procedure SetPercentualDesconto(const Value: Real);
    procedure SetPreco             (const Value: Real);

  public
    constructor Create;
    constructor CriaParaRepositorio(Codigo             :Integer;
                                    CodigoNotaFiscal   :Integer;
                                    CodigoProduto      :Integer;
                                    CodigoCor          :Integer;
                                    Preco              :Real;
                                    PercentualDesconto :Real);

  public
    destructor  Destroy; override;

  public
    property Codigo             :Integer      read GetCodigo          write SetCodigo;    
    property CodigoNotaFiscal   :Integer      read GetCodigoNotaFiscal;
    property Produto            :TProduto     read GetProduto          write SetProduto;
    property Cor                :TCor         read GetCor              write SetCor;
    property Preco              :Real         read FPreco              write SetPreco;
    property PercentualDesconto :Real         read FPercentualDesconto write SetPercentualDesconto;
    property Quantidades        :TObjectList  read GetQuantidades;
    property QuantidadeTotal    :Real         read GetQuantidadeTotal;
    property ValorBruto         :Real         read GetValorBruto;
    property ValorDesconto      :Real         read GetValorDesconto;
    property ValorTotal         :Real         read GetValorTotal;

  public
    procedure AdicionarBuscadorCodigoNotaFiscal(Buscador :TMetodoDelegadoObtemCampoInteger);
    procedure AdicionarQuantidade              (Tamanho  :TTamanho; Quantidade :Integer);
end;

implementation

uses
  SysUtils,
  FabricaRepositorio,
  Repositorio;

{ TItemAvulso }

procedure TItemAvulso.AdicionarBuscadorCodigoNotaFiscal(
  Buscador: TMetodoDelegadoObtemCampoInteger);
begin
   self.FBuscadorCodigoNotaFiscal := Buscador;
end;

procedure TItemAvulso.AdicionarQuantidade(Tamanho: TTamanho;
  Quantidade: Integer);
var
  QuantidadeItemAvulso :TQuantidadeItemAvulso;
begin
   if (not Assigned(self.Quantidades)) then
    self.FQuantidades := TObjectList.Create;

   QuantidadeItemAvulso := self.ObtemQuantidadeItemAvulso(Tamanho);

   if Assigned(QuantidadeItemAvulso) then
      self.Quantidades.Remove(QuantidadeItemAvulso);

   QuantidadeItemAvulso := TQuantidadeItemAvulso.Create(self.GetCodigo, Tamanho, Quantidade);

   self.Quantidades.Add(QuantidadeItemAvulso);
end;

constructor TItemAvulso.Create;
begin
   self.FCor          := nil;
   self.FProduto      := nil;
   self.FQuantidades  := nil;
end;

constructor TItemAvulso.CriaParaRepositorio(Codigo, CodigoNotaFiscal,
  CodigoProduto, CodigoCor: Integer; Preco, PercentualDesconto :Real);
begin
   self.FCodigo               := Codigo;
   self.FCodigoNotaFiscal     := CodigoNotaFiscal;
   self.FCodigoProduto        := CodigoProduto;
   self.FCodigoCor            := CodigoCor;
   self.FPreco                := Preco;
   self.FPercentualDesconto   := PercentualDesconto;
end;

destructor TItemAvulso.Destroy;
begin
  FreeAndNil(self.FProduto);
  FreeAndNil(self.FCor);
  FreeAndNil(self.FQuantidades);
  
  inherited;
end;

function TItemAvulso.GetCodigo: Integer;
begin
   result := self.FCodigo;
end;

function TItemAvulso.GetCodigoNotaFiscal: Integer;
begin
   if (self.FCodigoNotaFiscal <= 0) then begin
     if Assigned(self.FBuscadorCodigoNotaFiscal) then begin
       self.FCodigoNotaFiscal := self.FBuscadorCodigoNotaFiscal;
     end;
   end;

   result := self.FCodigoNotaFiscal;
end;

function TItemAvulso.GetCor: TCor;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FCor) then begin
     Repositorio := nil;

     try
       Repositorio := TFabricaRepositorio.GetRepositorio(TCor.ClassName);
       self.FCor   := (Repositorio.Get(self.FCodigoCor) as TCor);
     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FCor;
end;

function TItemAvulso.GetProduto: TProduto;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FProduto) then begin
     Repositorio := nil;

     try
       Repositorio   := TFabricaRepositorio.GetRepositorio(TProduto.ClassName);
       self.FProduto := (Repositorio.Get(self.FCodigoProduto) as TProduto);
     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FProduto;
end;

function TItemAvulso.GetQuantidades: TObjectList;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FQuantidades) then begin
     Repositorio := nil;

     try
       Repositorio        := TFabricaRepositorio.GetRepositorio(TQuantidadeItemAvulso.ClassName);
       self.FQuantidades  := Repositorio.GetListaPorIdentificador(self.FCodigo);
     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FQuantidades;
end;

function TItemAvulso.GetQuantidadeTotal: Real;
var
  nX         :Integer;
  Quantidade :TQuantidadeItemAvulso;
begin
   result := 0;

   if not Assigned(self.Quantidades) then
    exit;

   for nX := 0 to (self.Quantidades.Count-1) do begin
      Quantidade := (self.Quantidades[nX] as TQuantidadeItemAvulso);
      result     := (result + Quantidade.Quantidade);
   end;
end;

function TItemAvulso.GetValorBruto: Real;
begin
   result := (self.FPreco * self.QuantidadeTotal);
end;

function TItemAvulso.GetValorDesconto: Real;
begin
   result := ((self.ValorBruto * self.PercentualDesconto) / 100);
end;

function TItemAvulso.GetValorTotal: Real;
begin
   result := (self.ValorBruto - self.ValorDesconto);
end;

function TItemAvulso.ObtemQuantidadeItemAvulso(
  Tamanho: TTamanho): TQuantidadeItemAvulso;
var
  nX :Integer;
begin
   result := nil;

   if not Assigned(self.FQuantidades) then
    exit;

   for nX := 0 to (self.FQuantidades.Count-1) do begin
      if (Tamanho.Codigo = TQuantidadeItemAvulso(self.FQuantidades.Items[nX]).Tamanho.Codigo) then begin
        result := TQuantidadeItemAvulso(self.FQuantidades[nX]);
        exit;
      end;
   end;
end;

procedure TItemAvulso.SetCodigo(const Value: Integer);
begin
   self.FCodigo := Value;
end;

procedure TItemAvulso.SetCor(const Value: TCor);
begin
   { Verificação de tipo igual aqui }
//   if Assigned(self.FCor) and (Value <> self.FCor) then
     FreeAndNil(self.FCor);

   if Assigned(Value) then
    self.FCodigoCor := Value.Codigo;
end;

procedure TItemAvulso.SetPercentualDesconto(const Value: Real);
begin
  FPercentualDesconto := Value;
end;

procedure TItemAvulso.SetPreco(const Value: Real);
begin
  FPreco := Value;
end;

procedure TItemAvulso.SetProduto(const Value: TProduto);
begin
   FreeAndNil(self.FProduto);

   if Assigned(Value) then
    self.FCodigoProduto := Value.Codigo;
end;

end.
