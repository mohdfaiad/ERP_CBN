unit PedidoFaturado;

interface

uses
  MetodoDelegadoObtemCampoInteger,
  NotaFiscal, Pedido;

type
  TPedidoFaturado = class

  private
    FCodigoNotaFiscal         :Integer;
    FCodigoPedido             :Integer;
    FBuscadorCodigoNotaFiscal :TMetodoDelegadoObtemCampoInteger;
    FPedido: TPedido;
    procedure SetPedido(const Value: TPedido);

  private
    function GetCodigoNotaFiscal: Integer;
    function GetPedido :TPedido;

  public
    constructor Create(CodigoNotaFiscal :Integer; CodigoPedido :Integer); overload;
    constructor Create(CodigoPedido :Integer); overload;

  public
    procedure AdicionarBuscadorDeCodigoNotaFiscal(Buscador :TMetodoDelegadoObtemCampoInteger);

  public
    property CodigoNotaFiscal :Integer  read GetCodigoNotaFiscal;
    property CodigoPedido     :Integer  read FCodigoPedido;
    property Pedido           :TPedido  read GetPedido write SetPedido;
end;

implementation

uses
  SysUtils,
  ExcecaoParametroInvalido, Repositorio, FabricaRepositorio;

{ TPedidoFaturado }

procedure TPedidoFaturado.AdicionarBuscadorDeCodigoNotaFiscal(Buscador: TMetodoDelegadoObtemCampoInteger);
begin
   self.FBuscadorCodigoNotaFiscal := Buscador;
end;

constructor TPedidoFaturado.Create(CodigoNotaFiscal :Integer; CodigoPedido :Integer);
const
  NOME_DA_CLASSE = 'TPedidoFaturado';
  NOME_DO_METODO = 'Create(CodigoNotaFiscal :TCodigoNotaFiscal; CodigoPedido :Integer)';
begin
//   if (CodigoNotaFiscal <= 0) then
//    raise TExcecaoParametroInvalido.Create(NOME_DA_CLASSE, NOME_DO_METODO, 'CodigoNotaFiscal');

   if (CodigoPedido <= 0) then
    raise TExcecaoParametroInvalido.Create(NOME_DA_CLASSE, NOME_DO_METODO, 'CodigoPedido');

   self.FCodigoNotaFiscal := CodigoNotaFiscal;
   self.FCodigoPedido     := CodigoPedido;
end;

constructor TPedidoFaturado.Create(CodigoPedido: Integer);
begin
   self.Create(0, CodigoPedido);
end;

function TPedidoFaturado.GetCodigoNotaFiscal: Integer;
begin
   try
     if (self.FCodigoNotaFiscal = 0) then
      self.FCodigoNotaFiscal := self.FBuscadorCodigoNotaFiscal;
   except
     on E: EAccessViolation do
      raise EInvalidOp.Create('Erro em TPedidoFaturado.GetCodigoNotaFiscal'+#13+
                              'Não foi possível realizar a chamada do método self.FBuscadorCodigoNotaFiscal!');
   end;

   result := self.FCodigoNotaFiscal;
end;

function TPedidoFaturado.GetPedido: TPedido;
var repositorio :TRepositorio;
begin
  Result := nil;

  if not assigned(FPedido) and (FCodigoPedido > 0) then begin
    repositorio := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);
    FPedido     := TPedido( repositorio.Get( self.FCodigoPedido ) );
  end;

  Result := FPedido;
end;

procedure TPedidoFaturado.SetPedido(const Value: TPedido);
begin
  FPedido := Value;
end;

end.
