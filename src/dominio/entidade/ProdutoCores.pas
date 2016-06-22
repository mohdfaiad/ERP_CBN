unit ProdutoCores;

interface

uses
  SysUtils,
  Contnrs;

type
  TProdutoCores = class

  private
    FCodigo     :Integer;
    FCodCor     :Integer;
    FCodProduto :Integer;
    Fgenero: String;

    procedure SetCodigo       (const value :Integer);
    procedure SetCodProduto   (const value :Integer);
    procedure SetCodCor       (const value :Integer);
    procedure Setgenero(const Value: String);


  public

    property Codigo      :Integer   read FCodigo      write SetCodigo;
    property CodProduto  :Integer   read FCodProduto  write SetCodProduto;
    property CodCor      :Integer   read FCodCor      write SetCodCor;
    property genero      :String    read Fgenero      write Setgenero;
  end;

implementation

uses Repositorio, FabricaRepositorio;

{ TProdutoCores }



{ TProdutoCores }

procedure TProdutoCores.SetCodCor(const value: Integer);
begin
  FCodCor := value;
end;

procedure TProdutoCores.SetCodigo(const value: Integer);
begin
  FCodigo := value;
end;

procedure TProdutoCores.SetCodProduto(const value: Integer);
begin
  FCodProduto := value;
end;

procedure TProdutoCores.Setgenero(const Value: String);
begin
  Fgenero := Value;
end;

end.
