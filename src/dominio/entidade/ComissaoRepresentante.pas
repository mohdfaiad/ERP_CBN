unit ComissaoRepresentante;

interface

uses
  SysUtils,
  Contnrs;

type
  TComissaoRepresentante = class

  private
    Fcodigo: integer;
    Fmes: integer;
    Fcodigo_representante: integer;
    Fano: integer;
    procedure Setano(const Value: integer);
    procedure Setcodigo(const Value: integer);
    procedure Setcodigo_representante(const Value: integer);
    procedure Setmes(const Value: integer);

  public

    property codigo               :integer read Fcodigo write Setcodigo;
    property codigo_representante :integer read Fcodigo_representante write Setcodigo_representante;
    property ano                  :integer read Fano write Setano;
    property mes                  :integer read Fmes write Setmes;

end;

implementation

{ TComissaoRepresentante }

procedure TComissaoRepresentante.Setano(const Value: integer);
begin
  Fano := Value;
end;

procedure TComissaoRepresentante.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TComissaoRepresentante.Setcodigo_representante(
  const Value: integer);
begin
  Fcodigo_representante := Value;
end;

procedure TComissaoRepresentante.Setmes(const Value: integer);
begin
  Fmes := Value;
end;

end.
