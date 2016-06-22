unit Estoque;

interface

uses
  SysUtils,
  Contnrs;

type
  TEstoque = class

  private
    Fcodigo_produto: integer;
    Fcodigo: integer;
    Fcodigo_cor: integer;
    Fcodigo_tamanho: integer;
    Fquantidade: Real;
   // FQtd_reservada: Real;

    procedure Setcodigo(const Value: integer);
    procedure Setcodigo_cor(const Value: integer);
    procedure Setcodigo_produto(const Value: integer);
    procedure Setcodigo_tamanho(const Value: integer);
    procedure Setquantidade(const Value: Real);
 //   procedure SetQtd_reservada(const Value: Real);

  public
    property codigo         :integer read Fcodigo         write Setcodigo;
    property codigo_produto :integer read Fcodigo_produto write Setcodigo_produto;
    property codigo_tamanho :integer read Fcodigo_tamanho write Setcodigo_tamanho;
    property codigo_cor     :integer read Fcodigo_cor     write Setcodigo_cor;
    property quantidade     :Real    read Fquantidade     write Setquantidade;
  //  property qtd_reservada  :Real    read FQtd_reservada  write SetQtd_reservada;

  public
    constructor create(const cod_produto :integer =0; const cod_cor :integer =0; const cod_tamanho :integer =0);overload;

    {quando se quer diminuir, basta que o parametro seja passado com sinal negativo}
    procedure atualiza_estoque(quantidade :Real);
  //  procedure atualiza_estoque_reservado(quantidade :Real);
end;

implementation

uses repositorio, EspecificacaoEstoquePorProdutoCorTamanho, FabricaREpositorio;

{ TEstoque }

procedure TEstoque.atualiza_estoque(quantidade: Real);
begin
  self.Fquantidade := self.Fquantidade + quantidade;

  if self.Fquantidade < 0 then
    self.Fquantidade := 0;
end;

{procedure TEstoque.atualiza_estoque_reservado(quantidade: Real);
begin
  self.FQtd_reservada := self.FQtd_reservada + quantidade;

  if self.FQtd_reservada < 0 then
    self.FQtd_reservada := 0;
end;}

constructor TEstoque.create(const cod_produto, cod_cor, cod_tamanho: integer);
var
   Estoque       :TEstoque;
   repositorio   :TRepositorio;
   Especificacao :TEspecificacaoEstoquePorProdutoCorTamanho;
begin
   Estoque       := nil;
   repositorio   := nil;
   Especificacao := nil;
 try
   repositorio    := TFabricaRepositorio.GetRepositorio(TEstoque.ClassName);
   Especificacao  := TEspecificacaoEstoquePorProdutoCorTamanho.Create(cod_produto,
                                                                      cod_cor,
                                                                      cod_tamanho);

   Estoque     := TEstoque( repositorio.GetPorEspecificacao( Especificacao, intToStr(cod_produto)) );

   if assigned(Estoque) then
     self := Estoque
   else
   begin
     self.Fcodigo_produto := cod_produto;
     self.Fcodigo_cor     := cod_cor;
     self.codigo_tamanho  := cod_tamanho;
   end;

 Finally
   FreeAndNil(repositorio);
   FreeAndNil(Especificacao);
 end;
end;

procedure TEstoque.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TEstoque.Setcodigo_cor(const Value: integer);
begin
  Fcodigo_cor := Value;
end;

procedure TEstoque.Setcodigo_produto(const Value: integer);
begin
  Fcodigo_produto := Value;
end;

procedure TEstoque.Setcodigo_tamanho(const Value: integer);
begin
  Fcodigo_tamanho := Value;
end;

{procedure TEstoque.SetQtd_reservada(const Value: Real);
begin
  FQtd_reservada := value;
end;}

procedure TEstoque.Setquantidade(const Value: Real);
begin
  Fquantidade := Value;
end;

end.
 