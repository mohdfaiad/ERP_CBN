unit MateriaFornecedor;

interface

uses
  SysUtils,
  Perfil,
  Contnrs;

type
  TMateriaFornecedor = class

  private
    Fcodigo_fornecedor: integer;
    Fcodigo: integer;
    Fcodigo_materia: integer;
    Fcodigo_materia_fornecedor: String;
    
    procedure Setcodigo(const Value: integer);
    procedure Setcodigo_fornecedor(const Value: integer);
    procedure Setcodigo_materia(const Value: integer);
    procedure Setcodigo_materia_fornecedor(const Value: String);

  public
    property codigo                    :integer read Fcodigo                    write Setcodigo;
    property codigo_materia            :integer read Fcodigo_materia            write Setcodigo_materia;
    property codigo_fornecedor         :integer read Fcodigo_fornecedor         write Setcodigo_fornecedor;
    property codigo_materia_fornecedor :String  read Fcodigo_materia_fornecedor write Setcodigo_materia_fornecedor;

end;

implementation

{ TMateriaFornecedor }

procedure TMateriaFornecedor.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TMateriaFornecedor.Setcodigo_fornecedor(const Value: integer);
begin
  Fcodigo_fornecedor := Value;
end;

procedure TMateriaFornecedor.Setcodigo_materia(const Value: integer);
begin
  Fcodigo_materia := Value;
end;

procedure TMateriaFornecedor.Setcodigo_materia_fornecedor(
  const Value: String);
begin
  Fcodigo_materia_fornecedor := Value;
end;

end.
