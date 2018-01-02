unit ServicoVerificadorPedidosShoppub;

interface

uses EventoAvisar, ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ConfiguracoesECommerce;

type
  TServicoVerificadorPedidosShoppub = class
  private
    FMostrarAviso  :TEventoAvisar;
    FCronometroVerificador :TTimer;
    FConfiguracoes :TConfiguracoesECommerce;
    FOperando :Boolean;

  private
    procedure VerificaPedidosNovos;
    function getPedidos :String;
  public
    property Operando :Boolean read FOperando write FOperando;
    property Configuracoes :TConfiguracoesECommerce read FConfiguracoes;
  public
    constructor Create;
end;

implementation

uses REST.types, System.JSon, System.SysUtils, Pedido, Item, Estoque, DateTimeUtilitario, Repositorio, FabricaRepositorio, uPrincipal;

{ TServicoVerificadorPedidosShoppub }

constructor TServicoVerificadorPedidosShoppub.Create;
CONST SEGUNDO = 1000;
var   umMinuto :integer;
      tempoIntervalo :integer;
      repositorio :TRepositorio;
begin
  FOperando      := false;
  umMinuto       := 60 * SEGUNDO;
  tempoIntervalo := 5 * umMinuto;

  repositorio    := TFabricaRepositorio.GetRepositorio(TConfiguracoesECommerce.ClassName);
  FConfiguracoes := TConfiguracoesECommerce(repositorio.Get(1));

  if not assigned(FConfiguracoes) then
  begin
    VerificaPedidosNovos;

    self.FCronometroVerificador                  := TTimer.Create(nil);
    self.FCronometroVerificador.Interval         := tempoIntervalo;
    self.FCronometroVerificador.Enabled          := true;
    FOperando := true;
  end
  else
    FOperando := false;
end;

function TServicoVerificadorPedidosShoppub.getPedidos: String;
var
    IdHTTP1: TIdHTTP;
begin
  try
    IdHTTP1 := TIdHTTP.Create(nil);
    IdHTTP1.Request.CustomHeaders.AddValue('Authorization','Token cbfeddc6568b7ff9bbfcd4f6340a1e8c2d9f8c27');
    IdHTTP1.Request.CustomHeaders.AddValue('Content-Type','application/json');
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.Accept      := 'application/json';
    IdHTTP1.Request.Method      := 'GET';
    IdHTTP1.Request.CharSet     := 'utf-8';
    IdHTTP1.HandleRedirects     := true;

    result := IdHTTP1.Get('http://dinamize.shoppub.com.br/api/v1/pedidos');
  finally
    FreeAndNil(IdHTTP1);
  end;
end;

procedure TServicoVerificadorPedidosShoppub.VerificaPedidosNovos;
var
  Pedidos, Produtos :TJSONArray;
  Objeto :TJSONObject;
  PedidoJSON, ProdutoJSON :TJSONObject;
  Pedido :TPedido;
  i, x :integer;
begin
  try
    Objeto := TJSONObject.ParseJSONValue( getPedidos ) as TJSONObject;
    Pedidos := Objeto.GetValue('results') as TJSONArray;

    for i := 0 to Pedidos.Count-1 do
    begin
      PedidoJSON := (Pedidos.Items[i] as TJSONObject);

      Pedido := TPedido.Create;
      Pedido.numpedido := '';

      TDateTimeUtilitario.padrao_EUA_to_BR(PedidoJSON.GetValue('data').Value);

      Produtos := PedidoJSON.GetValue('pedidoitem_set') as TJSONArray;
      for x := 0 to Produtos.Count-1 do
      begin
        ProdutoJSON := (Produtos.Items[x] as TJSONObject);

        Pedido.Item := TItem.Create;

        //Pedido.Item.cod_produto

        Pedido.AdicionarItem(Pedido.Item);

        FMostrarAviso(ProdutoJSON.GetValue('produto_sku').Value);
      end;
    end;

  finally
    FreeAndNil(Objeto);
    FreeAndNil(PedidoJSON);
    FreeAndNil(ProdutoJSON);
    FreeAndNil(Produtos);
    FreeAndNil(Pedidos);
  end;
end;

end.
