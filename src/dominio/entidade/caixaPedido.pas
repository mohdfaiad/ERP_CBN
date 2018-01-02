unit caixaPedido;

interface

uses SysUtils, Contnrs, Materia;

type
  TcaixaPedido = class

  private
    Fcodigo_conferencia: Integer;
    Fcodigo: Integer;
    Fnumero: Integer;
    Fcodigo_materia: Integer;
    FMateria :TMateria;
    FBaixou_estoque: String;
    function getMateria: TMateria;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property numero                :Integer read Fnumero                write Fnumero;
    property codigo_materia        :Integer read Fcodigo_materia        write Fcodigo_materia;
    property codigo_conferencia    :Integer read Fcodigo_conferencia    write Fcodigo_conferencia;
    property baixou_estoque        :String  read FBaixou_estoque        write FBaixou_estoque;

  public
    property Materia               :TMateria read getMateria              write FMateria;

    procedure baixarEstoque;
    procedure retornaEstoque;
  public
    destructor Destroy; override;
end;

implementation

uses Repositorio, FabricaRepositorio;

{ TcaixaPedido }

procedure TcaixaPedido.baixarEstoque;
var repositorio :TRepositorio;
begin
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TMateria.ClassName);
    self.Materia.estoque_fisico := self.Materia.estoque_fisico - 1;
    repositorio.Salvar(self.Materia);
    self.baixou_estoque := 'S';
  finally
    FreeAndNil(repositorio);
  end;
end;

destructor TcaixaPedido.Destroy;
begin
  if Assigned(FMateria) then
    FreeAndNil(FMateria);
  inherited;
end;

function TcaixaPedido.getMateria: TMateria;
var repositorio :TRepositorio;
begin
 try
   if not assigned(FMateria) then
   begin
     repositorio := TFabricaRepositorio.GetRepositorio(TMateria.ClassName);
     FMateria    := TMateria(repositorio.Get(self.Fcodigo_materia));
   end;

   Result := FMateria;
 finally
   FreeAndNil(repositorio);
 end;
end;

procedure TcaixaPedido.retornaEstoque;
var repositorio :TRepositorio;
begin
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TMateria.ClassName);
    self.Materia.estoque_fisico := self.Materia.estoque_fisico + 1;
    repositorio.Salvar(self.Materia);
    self.baixou_estoque := 'R';
  finally
    FreeAndNil(repositorio);
  end;
end;

end.
