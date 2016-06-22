unit Estado;

interface

uses
  SysUtils,
  Contnrs;

type
  TEstado = class

  private
    Fcodigo: integer;
    Fnome: String;
    Fsigla: String;
    procedure Setcodigo(const Value: integer);
    procedure Setnome(const Value: String);
    procedure Setsigla(const Value: String);

  public
    property codigo :integer read Fcodigo write Setcodigo;
    property sigla  :String read Fsigla write Setsigla;
    property nome   :String read Fnome write Setnome;
end;

implementation

{ TEstado }

procedure TEstado.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TEstado.Setnome(const Value: String);
begin
  Fnome := Value;
end;

procedure TEstado.Setsigla(const Value: String);
begin
  Fsigla := Value;
end;

end.
