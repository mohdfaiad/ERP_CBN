unit Tamanho;

interface

uses
  SysUtils,
  Contnrs;

type
  TTamanho = class

  private
    FCodigo     :Integer;
    FDescricao  :String;
    FOrdem: Integer;

    procedure SetCodigo     (const value :Integer);
    procedure SetDescricao  (const value :String);

  public
    property Codigo     :Integer   read FCodigo     write SetCodigo;
    property Descricao  :String    read FDescricao  write SetDescricao;
    property Ordem      :Integer   read FOrdem      write FOrdem;
  end;

implementation

uses Repositorio, FabricaRepositorio;

{ TTamanho }

procedure TTamanho.SetCodigo(const value: Integer);
begin
  FCodigo := value;
end;

procedure TTamanho.SetDescricao(const value: String);
begin
  FDescricao := value;
end;

end.
