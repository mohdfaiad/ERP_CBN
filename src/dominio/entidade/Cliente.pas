unit Cliente;

interface

uses
  SysUtils,
  Contnrs,
  TabelaPreco;

type
  TCliente = class

  private
    FCodigo          :Integer;
    FCodCli          :Integer;
    FCodTabelaPreco  :Integer;
    FCodFormasPgto   :Integer;
    FCodTransportadora: Integer;

    FTabelaPreco     :TTabelaPreco;
    FFuncionario: Boolean;

  private
    procedure SetCodigo         (const value :Integer);
    procedure SetCodCli         (const value :Integer);
    procedure SetCodTabelaPreco (const value :Integer);
    procedure SetCodFormasPgto  (const value :Integer);
    procedure SetCodTransportadora(const Value: Integer);

  private
    function GetTabelaPreco: TTabelaPreco;

  public
    constructor Create;

  public
    property Codigo            :Integer   read FCodigo            write SetCodigo;
    property CodCli            :Integer   read FCodCli            write SetCodCli;
    property CodTabelaPreco    :Integer   read FCodTabelaPreco    write SetCodTabelaPreco;
    property CodFormasPgto     :Integer   read FCodFormasPgto     write SetCodFormasPgto;
    property CodTransportadora :Integer   read FCodTransportadora write SetCodTransportadora;
    property Funcionario       :Boolean   read FFuncionario       write FFuncionario;

  public
    property TabelaPreco       :TTabelaPreco read GetTabelaPreco;
end;

implementation

uses
  Repositorio,
  FabricaRepositorio;

{ TCliente }

constructor TCliente.Create;
begin
   inherited Create;
   
   FTabelaPreco := nil;
end;

function TCliente.GetTabelaPreco: TTabelaPreco;
var
  Repositorio         :TRepositorio;
begin
   if not Assigned(self.FTabelaPreco) then begin
     Repositorio := nil;

     try
       Repositorio        := TFabricaRepositorio.GetRepositorio(TTabelaPreco.ClassName);
       self.FTabelaPreco  := (Repositorio.Get(self.FCodTabelaPreco) as TTabelaPreco);

     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FTabelaPreco;
end;

procedure TCliente.SetCodCli(const value: Integer);
begin
  FCodCli := value;
end;

procedure TCliente.SetCodFormasPgto(const value: Integer);
begin
  FCodFormasPgto := value;
end;

procedure TCliente.SetCodigo(const value: Integer);
begin
  FCodigo := value; //
end;

procedure TCliente.SetCodTabelaPreco(const value: Integer);
begin
  FCodTabelaPreco := value;
end;

procedure TCliente.SetCodTransportadora(const Value: Integer);
begin
  FCodTransportadora := Value;
end;

end.
