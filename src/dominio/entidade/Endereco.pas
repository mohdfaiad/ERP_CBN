unit Endereco;

interface

uses
  SysUtils,
  Contnrs,
  Cidade;

type
  TEndereco = class

  private
    FCodigo      :Integer;
    Fcodpessoa   :Integer;
    FLogradouro  :String;
    FNumero      :String;
    FBairro      :String;
    FCodCidade   :Integer;
    FCEP         :String;
    FPais        :String;
    FComplemento :String;
    FCidade      :TCidade;

    procedure SetCodigo     (const value:Integer);
    procedure Setcodpessoa     (const value:Integer);
    procedure SetLogradouro (const value:String);
    procedure SetNumero     (const value:String);
    procedure SetBairro     (const value:String);
    procedure SetCodCidade  (const value:Integer);
    procedure SetCEP        (const value:String);
    procedure SetPais       (const value:String);
    procedure SetComplemento(const value:String);
    function GetCidade: TCidade;

  public

    property Codigo      :Integer read FCodigo      write SetCodigo;
    property codpessoa   :Integer read Fcodpessoa      write Setcodpessoa;
    property Logradouro  :String  read FLogradouro  write SetLogradouro;
    property Numero      :String  read FNumero      write SetNumero;
    property Bairro      :String  read FBairro      write SetBairro;
    property CodCidade   :Integer read FCodCidade   write SetCodCidade;
    property CEP         :String  read FCEP         write SetCEP;
    property Pais        :String  read FPais        write SetPais;
    property Complemento :String  read FComplemento write SetComplemento;
    property Cidade      :TCidade read GetCidade;
    
  end;

implementation

uses Repositorio, FabricaRepositorio;

{ TEndereco }

procedure TEndereco.SetBairro(const value: String);
begin
  self.FBairro := value;
end;

procedure TEndereco.SetCEP(const value: String);
begin
  self.FCEP := value;
end;

procedure TEndereco.SetCodCidade(const value: Integer);
begin
  self.FCodCidade := value;
end;

procedure TEndereco.Setcodpessoa(const value: Integer);
begin
  self.Fcodpessoa := value;
end;

procedure TEndereco.SetCodigo(const value: Integer);
begin
  self.FCodigo := value;
end;

procedure TEndereco.SetComplemento(const value: String);
begin
  self.FComplemento := value;
end;

procedure TEndereco.SetLogradouro(const value: String);
begin
  self.FLogradouro := value;
end;

procedure TEndereco.SetNumero(const value: String);
begin
  self.FNumero := value;
end;

procedure TEndereco.SetPais(const value: String);
begin
  self.FPais := value;
end;

function TEndereco.GetCidade: TCidade;
var
  Repositorio   :TRepositorio;
begin
   if not Assigned(self.FCidade) then begin
     Repositorio   := nil;

     try
       Repositorio     := TFabricaRepositorio.GetRepositorio(TCidade.ClassName);
       self.FCidade    := TCidade(Repositorio.Get(self.FCodCidade,'codibge'));

     finally
       FreeAndNil(Repositorio);
     end;
   end;
   
   result := self.FCidade;
end;

end.
