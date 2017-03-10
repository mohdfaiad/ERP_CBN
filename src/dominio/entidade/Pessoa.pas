unit Pessoa;

interface

uses
  SysUtils,
  Endereco,
  Contnrs,
  DadosRepresentante;

type
  TPessoa = class

  private
    FCodigo     :Integer;
    FRazao      :String;
    FNomeFantasia :String;
    FPessoa     :String;
    FTipo       :String;
    FCPF_CNPJ   :String;
    FRG_IE      :String;
    FDtCadastro :TDateTime;
    FFone1      :String;
    FFone2      :String;
    FFax        :String;
    FEmail      :String;
    FObservacao :String;
    FEndereco   :TEndereco;
    FBloqueado: String;
    FMotivoBloq: String;
    FDadosRepresentante :TDadosRepresentante;

    procedure SetCodigo     (const value :Integer);
    procedure SetRazao      (const value :String);
    procedure SetPessoa     (const value :String);
    procedure SetTipo       (const value :String);
    procedure SetCPF_CNPJ   (const value :String);
    procedure SetRG_IE      (const value :String);
    procedure SetDtCadastro (const value :TDateTime);
    procedure SetFone1      (const value :String);
    procedure SetFone2      (const value :String);
    procedure SetFax        (const value :String);
    procedure SetEmail      (const value :String);
    procedure SetObservacao (const value :String);

  public
    function GetIsPessoaJuridica  :Boolean;
    function GetIsPessoaFisica    :Boolean;
    function GetDadosRepresentante: TDadosRepresentante;
    function GetEndereco          :TEndereco;

  public
    constructor Create;
    destructor  Destroy; override;

  public
    property Codigo       :Integer   read FCodigo       write SetCodigo;
    property Razao        :String    read FRazao        write SetRazao;
    property NomeFantasia :String    read FNomeFantasia write FNomeFantasia;
    property Pessoa       :String    read FPessoa       write SetPessoa;
    property Tipo         :String    read FTipo         write SetTipo;
    property CPF_CNPJ     :String    read FCPF_CNPJ     write SetCPF_CNPJ;
    property RG_IE        :String    read FRG_IE        write SetRG_IE;
    property DtCadastro   :TDateTime read FDtCadastro   write SetDtCadastro;
    property Fone1        :String    read FFone1        write SetFone1;
    property Fone2        :String    read FFone2        write SetFone2;
    property Fax          :String    read FFax          write SetFax;
    property Email        :String    read FEmail        write SetEmail;
    property Observacao   :String    read FObservacao   write SetObservacao;
    property Bloqueado    :String    read FBloqueado    write FBloqueado;
    property MotivoBloq   :String    read FMotivoBloq   write FMotivoBloq;

  public
    property Endereco           :TEndereco  read GetEndereco;
    property DadosRepresentante :TDadosRepresentante read GetDadosRepresentante write FDadosRepresentante;
    property IsPessoaJuridica   :Boolean    read GetIsPessoaJuridica;
    property IsPessoaFisica     :Boolean    read GetIsPessoaFisica;
end;

implementation

uses
    Repositorio,
    FabricaRepositorio,
    Especificacao,
    EspecificacaoEnderecoComPessoaIgualA,
    EspecificacaoDadosRepresentantePorCodPessoa;

{ TPessoa }

constructor TPessoa.Create;
begin
   self.FEndereco := nil;
end;

destructor TPessoa.Destroy;
begin
   FreeAndNil(self.FEndereco);
   FreeAndNil(self.FDadosRepresentante);
  inherited;
end;

function TPessoa.GetDadosRepresentante: TDadosRepresentante;
var
  Repositorio   :TRepositorio;
  Especificacao :TEspecificacaoDadosRepresentantePorCodPessoa;
begin
   if not Assigned(self.FDadosRepresentante) then begin
     Repositorio   := nil;

     try
       Repositorio              := TFabricaRepositorio.GetRepositorio(TDadosRepresentante.ClassName);
       Especificacao            := TEspecificacaoDadosRepresentantePorCodPessoa.Create(self.Codigo);
       self.FDadosRepresentante := (Repositorio.GetPorEspecificacao(Especificacao) as TDadosRepresentante);
     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FDadosRepresentante;
end;

function TPessoa.GetEndereco: TEndereco;
var
  Repositorio   :TRepositorio;
  Especificacao :TEspecificacao;
begin
   if not Assigned(self.FEndereco) then begin
     Repositorio   := nil;
     Especificacao := nil;

     try
       Especificacao    := TEspecificacaoEnderecoComPessoaIgualA.Create(self);
       Repositorio      := TFabricaRepositorio.GetRepositorio(TEndereco.ClassName);
       self.FEndereco   := (Repositorio.GetPorEspecificacao(Especificacao) as TEndereco);
     finally
       FreeAndNil(Especificacao);
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FEndereco;
end;

function TPessoa.GetIsPessoaFisica: Boolean;
begin
   result := (not self.IsPessoaJuridica);
end;

function TPessoa.GetIsPessoaJuridica: Boolean;
begin
   result := (Trim(self.FPessoa) = 'J');
end;

procedure TPessoa.SetCodigo(const value: Integer);
begin
  self.FCodigo := value;
end;

procedure TPessoa.SetCPF_CNPJ(const value: String);
begin
  self.FCPF_CNPJ := value;
end;

procedure TPessoa.SetDtCadastro(const value: TDateTime);
begin
  self.FDtCadastro := value;
end;

procedure TPessoa.SetEmail(const value: String);
begin
  self.FEmail := LowerCase(value);
end;

procedure TPessoa.SetFax(const value: String);
begin
  self.FFax := value;
end;

procedure TPessoa.SetFone1(const value: String);
begin
  self.FFone1 := value;
end;

procedure TPessoa.SetFone2(const value: String);
begin
  self.FFone2 := value;
end;

procedure TPessoa.SetObservacao(const value: String);
begin
  self.FObservacao := value;
end;

procedure TPessoa.SetPessoa(const value: String);
begin
  self.FPessoa := value;
end;

procedure TPessoa.SetRazao(const value: String);
begin
  self.FRazao := value;
end;

procedure TPessoa.SetRG_IE(const value: String);
begin
  self.FRG_IE := value;
end;

procedure TPessoa.SetTipo(const value: String);
begin
  self.FTipo := value;
end;

end.
 