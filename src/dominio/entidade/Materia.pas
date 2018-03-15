unit Materia;

interface

uses
  SysUtils,
  Perfil,
  Contnrs, UnidadeEntSai;

type
  TMateria = class

  private
    Fcodigo: integer;
    Festoque_fisico: Real;
    Fpreco_custo: Real;
    Fpreco_venda: Real;
    Festoque_minimo: Real;
    Fcod_ncm: String;
    Fdescricao: String;
    Funidade: String;
    FControla_estoque: Boolean;
    FUnidadesEntSai: TObjectList;
    
    procedure Setcod_ncm(const Value: String);
    procedure Setcodigo(const Value: integer);
    procedure Setdescricao(const Value: String);
    procedure Setestoque_fisico(const Value: Real);
    procedure Setestoque_minimo(const Value: Real);
    procedure Setpreco_custo(const Value: Real);
    procedure Setpreco_venda(const Value: Real);
    procedure Setunidade(const Value: String);
    function GetUnidadesEntSai: TObjectList;

  public
    procedure incrementaEstoque(value :Real);
    procedure decrementaEstoque(value :Real);

  public
    property codigo          :integer read Fcodigo         write Setcodigo;
    property descricao       :String  read Fdescricao      write Setdescricao;
    property cod_ncm         :String  read Fcod_ncm        write Setcod_ncm;
    property preco_custo     :Real    read Fpreco_custo    write Setpreco_custo;
    property preco_venda     :Real    read Fpreco_venda    write Setpreco_venda;
    property estoque_fisico  :Real    read Festoque_fisico write Setestoque_fisico;
    property estoque_minimo  :Real    read Festoque_minimo write Setestoque_minimo;
    property unidade         :String  read Funidade        write Setunidade;
    property controla_estoque:Boolean  read FControla_estoque write FControla_estoque;

  public
    property UnidadesEntSai   :TObjectList read GetUnidadesEntSai write FUnidadesEntSai;

end;

implementation

uses Repositorio, FabricaRepositorio, EspecificacaoUnidadesSaidaPorCodigoProduto;

{ TMateria }

procedure TMateria.Setcod_ncm(const Value: String);
begin
  Fcod_ncm := Value;
end;

procedure TMateria.decrementaEstoque(value: Real);
begin
  self.Festoque_fisico := self.Festoque_fisico - value;
end;

function TMateria.GetUnidadesEntSai: TObjectList;
var repositorio :TRepositorio;
    especificacao :TEspecificacaoUnidadesSaidaPorCodigoProduto;
begin
  if not assigned(FUnidadesEntSai) then
  begin
    repositorio    := TFabricaRepositorio.GetRepositorio(TUnidadeEntSai.ClassName);
    especificacao  := TEspecificacaoUnidadesSaidaPorCodigoProduto.Create(self);
    FUnidadesEntSai := repositorio.GetListaPorEspecificacao(especificacao);
  end;
  Result := FUnidadesEntSai;
end;

procedure TMateria.incrementaEstoque(value: Real);
begin
  self.Festoque_fisico := self.Festoque_fisico + value;
end;

procedure TMateria.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TMateria.Setdescricao(const Value: String);
begin
  Fdescricao := Value;
end;

procedure TMateria.Setestoque_fisico(const Value: Real);
begin
  Festoque_fisico := Value;
end;

procedure TMateria.Setestoque_minimo(const Value: Real);
begin
  Festoque_minimo := Value;
end;

procedure TMateria.Setpreco_custo(const Value: Real);
begin
  Fpreco_custo := Value;
end;

procedure TMateria.Setpreco_venda(const Value: Real);
begin
  Fpreco_venda := Value;
end;

procedure TMateria.Setunidade(const Value: String);
begin
  Funidade := Value;
end;

end.
