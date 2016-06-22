unit Cidade;

interface

uses
  SysUtils,
  Contnrs,
  Estado;

type
  TCidade = class

  private
    Fcodest  : integer;
    Fcodibge : integer;
    Fcodigo  : integer;
    Fcep     : String;
    Fnome    : String;
    Festado  : TEstado;

    procedure Setcep(const Value: String);
    procedure Setcodest(const Value: integer);
    procedure Setcodibge(const Value: integer);
    procedure Setcodigo(const Value: integer);
    procedure Setnome(const Value: String);
    function GetEstado: TEstado;

  public
    property codigo  :integer read Fcodigo  write Setcodigo;
    property codest  :integer read Fcodest  write Setcodest;
    property nome    :String  read Fnome    write Setnome;
    property cep     :String  read Fcep     write Setcep;
    property codibge :integer read Fcodibge write Setcodibge;
    property estado  :TEstado read GetEstado;

end;

implementation

uses Repositorio, FabricaRepositorio;

{ TCidade }

function TCidade.GetEstado: TEstado;
var
  Repositorio   :TRepositorio;
begin
   if not Assigned(self.Festado) then begin
     Repositorio   := nil;

     try
       Repositorio     := TFabricaRepositorio.GetRepositorio(TEstado.ClassName);
       self.FEstado    := TEstado(Repositorio.Get(self.FCodest,'codigo'));

     finally
       FreeAndNil(Repositorio);
     end;
   end;
   
   result := self.Festado;
end;

procedure TCidade.Setcep(const Value: String);
begin
  Fcep := Value;
end;

procedure TCidade.Setcodest(const Value: integer);
begin
  Fcodest := Value;
end;

procedure TCidade.Setcodibge(const Value: integer);
begin
  Fcodibge := Value;
end;

procedure TCidade.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TCidade.Setnome(const Value: String);
begin
  Fnome := Value;
end;

end.
