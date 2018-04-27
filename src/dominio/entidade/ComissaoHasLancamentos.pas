unit ComissaoHasLancamentos;

interface

uses
  SysUtils,
  Contnrs, Lancamento;

type
  TComissaoHasLancamentos = class

  private
    Fcodigo: integer;
    Fcodigo_comissao_representante: integer;
    Fcodigo_lancamento: Real;
    Ftipo: String;
    FLancamento :TLancamento;

    procedure Setcodigo(const Value: integer);
    procedure Setcodigo_comissao_representante(const Value: integer);
    procedure Setcodigo_lancamento(const Value: Real);
    procedure Settipo(const Value: String);
    function GetLancamento: TLancamento;

  public
    property codigo                        :integer read Fcodigo                        write Setcodigo;
    property codigo_comissao_representante :integer read Fcodigo_comissao_representante write Setcodigo_comissao_representante;
    property codigo_lancamento             :Real    read Fcodigo_lancamento             write Setcodigo_lancamento;
    property tipo                          :String  read Ftipo                          write Settipo;

  public
    property Lancamento :TLancamento read GetLancamento;

  public
    destructor destroy;override;
end;

implementation

uses repositorio, FabricaRepositorio;

{ TComissaoHasLancamentos }

destructor TComissaoHasLancamentos.destroy;
begin
//  if assigned(FLancamento) then
//    FreeAndNil(FLancamento);
  inherited;
end;

function TComissaoHasLancamentos.GetLancamento: TLancamento;
var repositorio :TRepositorio;
begin
  repositorio := nil;
  try
    if not assigned(FLancamento) then
    begin
      repositorio := TFabricaRepositorio.GetRepositorio(TLancamento.ClassName);
      FLancamento := TLancamento( repositorio.Get(self.codigo_lancamento) );
    end;

    result := FLancamento;
  finally
    FreeAndNil(repositorio);
  end;
end;

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
