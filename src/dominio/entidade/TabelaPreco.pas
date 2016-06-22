unit TabelaPreco;

interface

uses
  SysUtils,
  Contnrs;

type
  TTabelaPreco = class

  private
    FCodigo     :Integer;
    FDescricao  :String;

    procedure SetCodigo     (const value :Integer);
    procedure SetDescricao  (const value :String);

  public

    property Codigo     :Integer   read FCodigo     write SetCodigo;
    property Descricao  :String    read FDescricao  write SetDescricao;
  end;

implementation

uses Repositorio, FabricaRepositorio;

{ TTabelaPreco }

procedure TTabelaPreco.SetCodigo(const value: Integer);
begin
  FCodigo := value;
end;

procedure TTabelaPreco.SetDescricao(const value: String);
begin
  FDescricao := value;
end;

end.
