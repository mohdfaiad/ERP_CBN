unit PedidoMapa;

interface

uses SysUtils, Contnrs, Pedido;

type
  TPedidoMapa = class

  private
    Fcodigo :Integer;
    Fcodigo_mapa :Integer;
    Fcodigo_pedido :Integer;
    FPedido :TPedido;
    FPeso: Integer;

    function GetPedido: TPedido;

  public
    property codigo          :Integer read Fcodigo          write Fcodigo;
    property codigo_mapa     :Integer read Fcodigo_mapa     write Fcodigo_mapa;
    property codigo_pedido   :Integer read Fcodigo_pedido   write Fcodigo_pedido;
    property peso            :Integer read FPeso            write FPeso;

  public
    property Pedido :TPedido       read GetPedido;
end;

implementation

uses repositorio, fabricaRepositorio;

{ TPedidoMapa }

function TPedidoMapa.GetPedido: TPedido;
var
  Repositorio   :TRepositorio;
begin
   Repositorio    := nil;

   try
      if not Assigned(self.FPedido) then begin
        Repositorio    := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);
        self.FPedido   := TPedido( Repositorio.Get(self.Fcodigo_pedido) );
      end;

      result := self.FPedido;

   finally
     FreeAndNil(Repositorio);
   end;
end;

end.
