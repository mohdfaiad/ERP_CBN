unit Cliente_Representante;

interface

uses
  SysUtils,
  Contnrs;

type
  TCliente_Representante = class

  private
    Fcod_cliente: integer;
    Fcod_representante: integer;
    Fcodigo: integer;
    procedure Setcod_cliente(const Value: integer);
    procedure Setcod_representante(const Value: integer);
    procedure Setcodigo(const Value: integer);

  public
    property codigo            :integer read Fcodigo write Setcodigo;
    property cod_cliente       :integer read Fcod_cliente write Setcod_cliente;
    property cod_representante :integer read Fcod_representante write Setcod_representante;
  end;

implementation

{ TCliente_Representante }

procedure TCliente_Representante.Setcod_cliente(const Value: integer);
begin
  Fcod_cliente := Value;
end;

procedure TCliente_Representante.Setcod_representante(const Value: integer);
begin
  Fcod_representante := Value;
end;

procedure TCliente_Representante.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

end.
