unit ProdutoTabelaPreco;

interface

uses
  SysUtils,
  Contnrs;

type
  TProdutoTabelaPreco = class

  private
    FCodigo     :Integer;
    FCodProduto :Integer;
    FCodTabela  :Integer;
    FPreco_Atacado: Real;
    FPreco_Liq: Real;
    FPreco: Real;

    procedure SetCodigo       (const value :Integer);
    procedure SetCodProduto   (const value :Integer);
    procedure SetCodTabela    (const value :Integer);
    procedure SetPreco(const Value: Real);
    procedure SetPreco_Atacado(const Value: Real);
    procedure SetPreco_Liq(const Value: Real);


  public

    property Codigo        :Integer   read FCodigo        write SetCodigo;
    property CodProduto    :Integer   read FCodProduto    write SetCodProduto;
    property CodTabela     :Integer   read FCodTabela     write SetCodTabela;
    property Preco         :Real      read FPreco         write SetPreco;
    property Preco_Liq     :Real      read FPreco_Liq     write SetPreco_Liq;
    property Preco_Atacado :Real      read FPreco_Atacado write SetPreco_Atacado;
  end;

implementation

uses Repositorio, FabricaRepositorio;

{ TProdutoTabelaPreco }



{ TProdutoTabelaPreco }


procedure TProdutoTabelaPreco.SetCodigo(const value: Integer);
begin
  FCodigo := value;
end;

procedure TProdutoTabelaPreco.SetCodProduto(const value: Integer);
begin
  FCodProduto := value;
end;

procedure TProdutoTabelaPreco.SetCodTabela(const value: Integer);
begin
  FCodTabela := value;
end;

procedure TProdutoTabelaPreco.SetPreco(const Value: Real);
begin
  FPreco := Value;
end;

procedure TProdutoTabelaPreco.SetPreco_Atacado(const Value: Real);
begin
  FPreco_Atacado := Value;
end;

procedure TProdutoTabelaPreco.SetPreco_Liq(const Value: Real);
begin
  FPreco_Liq := Value;
end;

end.
