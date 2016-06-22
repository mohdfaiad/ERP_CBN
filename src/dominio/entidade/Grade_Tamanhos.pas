unit Grade_Tamanhos;

interface

uses
  SysUtils,
  Contnrs;

type
  TGrade_Tamanhos = class

  private
    FCodigo     :Integer;
    FCodgrade   :Integer;
    FCodtamanho :Integer;

    procedure SetCodigo     (const value :Integer);
    procedure SetCodgrade   (const value :Integer);
    procedure SetCodtamanho (const value :Integer);

  public
    property Codigo     :Integer   read FCodigo     write SetCodigo;
    property Codgrade   :Integer   read FCodgrade   write SetCodgrade;
    property Codtamanho :Integer   read FCodtamanho write SetCodtamanho;
  end;

implementation

uses Repositorio, FabricaRepositorio;

{ TGrade_Tamanhos }

procedure TGrade_Tamanhos.SetCodgrade(const value: Integer);
begin
  FCodgrade := value;
end;

procedure TGrade_Tamanhos.SetCodigo(const value: Integer);
begin
  FCodigo := value;
end;

procedure TGrade_Tamanhos.SetCodtamanho(const value: Integer);
begin
  FCodtamanho := value;
end;

end.
