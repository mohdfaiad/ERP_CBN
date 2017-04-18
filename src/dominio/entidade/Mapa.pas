unit Mapa;

interface

uses SysUtils, Contnrs, PedidoMapa;

type
  TMapa = class

  private
    Fcodigo: Integer;
    FNumero_mapa: integer;
    Fcriacao: TDateTime;
    Ffinalizado: String;
    FPedidos :TObjectList;

    function GetPedidos: TObjectList;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property numero_mapa           :integer read FNumero_mapa           write FNumero_mapa;
    property criacao               :TDateTime read Fcriacao             write Fcriacao;
    property finalizado            :String read Ffinalizado             write Ffinalizado;
  public
    property Pedidos    :TObjectList  read GetPedidos  write FPedidos;
  public
    destructor destroy;override;
end;

implementation

uses EspecificacaoPedidosMapa, Repositorio, FabricaRepositorio;

{ TMapa }

destructor TMapa.destroy;
begin
  if assigned(FPedidos) then
    FreeAndNil(FPedidos);
  inherited;
end;

function TMapa.GetPedidos: TObjectList;
var Especificacao :TEspecificacaoPedidosMapa;
    repositorio   :TRepositorio;
begin
  repositorio   := nil;
  Especificacao := nil;
  try
    if not assigned(FPedidos) then
    begin
      repositorio   := TFabricaRepositorio.GetRepositorio(TPedidoMapa.ClassName);
      Especificacao := TEspecificacaoPedidosMapa.Create(self.codigo);
      FPedidos      := repositorio.GetListaPorEspecificacao(Especificacao);
    end;

    result := FPedidos;
  finally
    FreeAndNil(repositorio);
    FreeAndNil(Especificacao);
  end;
end;

end.
