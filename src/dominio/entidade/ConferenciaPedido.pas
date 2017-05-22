unit ConferenciaPedido;

interface

uses
  SysUtils,
  Contnrs;

type
  TConferenciaPedido = class

  private
    Fcodigo_usuario : integer;
    Fcodigo         : integer;
    Fcodigo_pedido  : integer;
    Finicio         : TDateTime;
    FFim            : TDateTime;
    Ftempo_decorrido: Real;
    FItens          : TObjectList;

    procedure Setcodigo(const Value: integer);
    procedure Setcodigo_pedido(const Value: integer);
    procedure Setcodigo_usuario(const Value: integer);
    procedure Settempo_decorrido(const Value: Real);
    procedure SetFim(const Value: TDateTime);
    procedure Setinicio(const Value: TDateTime);
    procedure SetItens(const Value: TObjectList);
    
    function GetItens: TObjectList;


  public
    property codigo          :integer   read Fcodigo write Setcodigo;
    property codigo_pedido   :integer   read Fcodigo_pedido write Setcodigo_pedido;
    property codigo_usuario  :integer   read Fcodigo_usuario write Setcodigo_usuario;
    property tempo_decorrido :Real      read Ftempo_decorrido write Settempo_decorrido;
    property inicio          :TDateTime read Finicio write Setinicio;
    property Fim             :TDateTime read FFim write SetFim;
    property Itens           :TObjectList read GetItens       write SetItens;

  public
    procedure RemoverItensZerados;

  public
    constructor Create(const codigo_pedido :Integer = 0);
end;

implementation

uses ConferenciaItem, Repositorio, FabricaRepositorio, EspecificacaoItensConferenciaPedido,
     EspecificacaoConferenciaPorCodigoPedido, Classes;

{ TConferenciaPedido }

procedure TConferenciaPedido.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TConferenciaPedido.Setcodigo_pedido(const Value: integer);
begin
  Fcodigo_pedido := Value;
end;

procedure TConferenciaPedido.Setcodigo_usuario(const Value: integer);
begin
  Fcodigo_usuario := Value;
end;

procedure TConferenciaPedido.Settempo_decorrido(const Value: Real);
begin
  Ftempo_decorrido := Value;
end;

procedure TConferenciaPedido.SetFim(const Value: TDateTime);
begin
  FFim := Value;
end;

procedure TConferenciaPedido.Setinicio(const Value: TDateTime);
begin
  Finicio := Value;
end;

procedure TConferenciaPedido.SetItens(const Value: TObjectList);
begin
  FItens := Value;
end;

function TConferenciaPedido.GetItens: TObjectList;
var  Repositorio   :TRepositorio;
     Especificacao :TEspecificacaoItensConferenciaPedido;
begin
   Repositorio    := nil;
   Especificacao  := nil;
   
   try
      if not Assigned(self.FItens) and (self.FCodigo > 0) then begin
        Especificacao         := TEspecificacaoItensConferenciaPedido.Create(self);
        Repositorio           := TFabricaRepositorio.GetRepositorio(TConferenciaItem.ClassName);
        self.FItens           := Repositorio.GetListaPorEspecificacao(Especificacao, inttostr(self.Fcodigo));
      end;

      result := self.FItens;
      
   finally
     FreeAndNil(Especificacao);
     FreeAndNil(Repositorio);
   end;
end;

constructor TConferenciaPedido.Create(const codigo_pedido: Integer);
var repositorio        :TRepositorio;
    Especificacao      :TEspecificacaoConferenciaPorCodigoPedido;
    ConferenciaPedido  :TConferenciaPedido;
begin
  repositorio        := nil;
  ConferenciaPedido  := nil;
  Especificacao      := nil;

  if codigo_pedido = 0 then
    exit;
    
 try

   repositorio       := TFabricaRepositorio.GetRepositorio(TConferenciaPedido.ClassName);
   Especificacao     := TEspecificacaoConferenciaPorCodigoPedido.Create( codigo_pedido );
   ConferenciaPedido := TConferenciaPedido(repositorio.GetPorEspecificacao( Especificacao ));

  if assigned(ConferenciaPedido) then
    self := ConferenciaPedido;

 finally
   FreeAndNil( repositorio );
   FreeAndNil( Especificacao );
 end;
end;

procedure TConferenciaPedido.RemoverItensZerados;
var
  ItensRemover :TObjectList;
  i :Integer;
begin
   ItensRemover := TObjectList.Create(false);

  for i := 0 to (Itens.Count-1) do begin
     if (TConferenciaItem(Itens[i]).QTD_TOTAL <= 0) then
      ItensRemover.Add(Itens[i]);
  end;

  for i := 0 to (ItensRemover.Count-1) do begin
    Itens.Remove(ItensRemover[i]);
  end;

  FreeAndNil(ItensRemover);
end;

end.
