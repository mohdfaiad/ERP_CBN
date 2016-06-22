unit ComissaoHasLancamentos;

interface

uses
  SysUtils,
  Contnrs;

type
  TComissaoHasLancamentos = class

  private
    Fcodigo: integer;
    Fcodigo_comissao_representante: integer;
    Fcodigo_lancamento: Real;
    Ftipo: String;
    procedure Setcodigo(const Value: integer);
    procedure Setcodigo_comissao_representante(const Value: integer);
    procedure Setcodigo_lancamento(const Value: Real);
    procedure Settipo(const Value: String);

  public
    property codigo                        :integer read Fcodigo                        write Setcodigo;
    property codigo_comissao_representante :integer read Fcodigo_comissao_representante write Setcodigo_comissao_representante;
    property codigo_lancamento             :Real    read Fcodigo_lancamento             write Setcodigo_lancamento;
    property tipo                          :String  read Ftipo                          write Settipo;
end;

implementation

{ TComissaoHasLancamentos }

procedure TComissaoHasLancamentos.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TComissaoHasLancamentos.Setcodigo_comissao_representante(
  const Value: integer);
begin
  Fcodigo_comissao_representante := Value;
end;

procedure TComissaoHasLancamentos.Setcodigo_lancamento(const Value: Real);
begin
  Fcodigo_lancamento := Value;
end;

procedure TComissaoHasLancamentos.Settipo(const Value: String);
begin
  Ftipo := Value;
end;

end.
