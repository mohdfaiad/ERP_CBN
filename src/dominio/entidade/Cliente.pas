unit Cliente;

interface

uses
  SysUtils,
  Contnrs,
  TabelaPreco, Pessoa, Representante;

type
  TCliente = class(TPessoa)

  private
    FCodigoCliente   :Integer;
    FCodTabelaPreco  :Integer;
    FCodFormasPgto   :Integer;
    FCodTransportadora: Integer;
    FCodRepresentante: Integer;
    FBloqueado: String;
    FMotivoBloqueio: String;

    FTabelaPreco     :TTabelaPreco;
    FRepresentante   :TRepresentante;
    FFuncionario: Boolean;

  private
    procedure SetCodigoCliente  (const value :Integer);
    procedure SetCodTabelaPreco (const value :Integer);
    procedure SetCodFormasPgto  (const value :Integer);
    procedure SetCodTransportadora(const Value: Integer);
    procedure SetCodRepresentante(const Value: Integer);

  private
    function GetTabelaPreco: TTabelaPreco;
    function GetRepresentante: TRepresentante;

  public
    constructor Create;

  public
    property CodigoCliente     :Integer   read FCodigoCliente     write SetCodigoCliente;
    property CodTabelaPreco    :Integer   read FCodTabelaPreco    write SetCodTabelaPreco;
    property CodFormasPgto     :Integer   read FCodFormasPgto     write SetCodFormasPgto;
    property CodTransportadora :Integer   read FCodTransportadora write SetCodTransportadora;
    property CodRepresentante  :Integer   read FCodRepresentante  write SetCodRepresentante;
    property Funcionario       :Boolean   read FFuncionario       write FFuncionario;
    property bloqueado         :String    read FBloqueado         write FBloqueado;
    property motivoBloqueio    :String    read FMotivoBloqueio    write FMotivoBloqueio;

  public
    property TabelaPreco       :TTabelaPreco   read GetTabelaPreco;
    property Representante     :TRepresentante read GetRepresentante;
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

function TCliente.GetRepresentante: TRepresentante;
var
  Repositorio         :TRepositorio;
begin
   if not Assigned(self.FRepresentante) then begin
     Repositorio := nil;

     try
       Repositorio    := TFabricaRepositorio.GetRepositorio(TRepresentante.ClassName);
       FRepresentante := TRepresentante(Repositorio.Get(self.FCodRepresentante));

     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FRepresentante;
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

procedure TCliente.SetCodFormasPgto(const value: Integer);
begin
  FCodFormasPgto := value;
end;

procedure TCliente.SetCodigoCliente(const value: Integer);
begin
  FCodigoCliente := value; //
end;

procedure TCliente.SetCodRepresentante(const Value: Integer);
begin
  FCodRepresentante := Value;
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
