unit Empresa;

interface

uses
  TipoRegimeTributario,
  Pessoa,
  ConfiguracoesNF,
  ConfiguracoesNFEmail;

type
  TEmpresa = class(TPessoa)

  private
    FRegimeTributario   :TTipoRegimeTributario;
    FCodigoEmpresa      :Integer;
    FConfiguracoesNF    :TConfiguracoesNF;
    FConfiguracoesEmail :TConfiguracoesNFEmail;

  private
    procedure SetCodigoEmpresa          (const Value: Integer);
    procedure SetRegimeTributario       (const Value: TTipoRegimeTributario);
    procedure SetRegimeTributarioInteger(const Value: Integer);

  private
    function GetCodigoEmpresa           :Integer;
    function GetRegimeTributarioInteger :Integer;
    function GetConfiguracoesEmail      :TConfiguracoesNFEmail;
    function GetConfiguracoesNF         :TConfiguracoesNF;

  public
    constructor Create;
    destructor  Destroy; override;

  public
    property CodigoEmpresa            :Integer               read GetCodigoEmpresa            write SetCodigoEmpresa;
    property RegimeTributario         :TTipoRegimeTributario read FRegimeTributario           write SetRegimeTributario;
    property RegimeTributarioInteger  :Integer               read GetRegimeTributarioInteger  write SetRegimeTributarioInteger;
    property ConfiguracoesNF          :TConfiguracoesNF      read GetConfiguracoesNF;
    property ConfiguracoesEmail       :TConfiguracoesNFEmail read GetConfiguracoesEmail;

  public
    procedure AdicionarConfiguracoes(
                                     AliquotaCreditoSN :Real;
                                     AliquotaICMS      :Real;
                                     AliquotaPIS       :Real;
                                     AliquotaCOFINS    :Real;
                                     NumeroCertificado :String;
                                     AmbienteNFe       :String;
                                     SenhaCertificado  :String;
                                     SequenciaNotaFiscal :Integer;
                                     TipoEmissao       :integer
                                    );
                                    
    procedure AdicionarConfiguracoesEmail(SMTPHost,
                                          SMTPPort,
                                          SMTPUser,
                                          SMTPPassword,
                                          Assunto,
                                          Mensagem :String;
                                          UsaSSL :Boolean);


end;

implementation

uses
  SysUtils,
  Repositorio,
  FabricaRepositorio,
  StringUtilitario,
  ExcecaoParametroInvalido;

{ TEmpresa }

procedure TEmpresa.AdicionarConfiguracoes(AliquotaCreditoSN, AliquotaICMS,
  AliquotaPIS, AliquotaCOFINS: Real; NumeroCertificado, AmbienteNFe,
  SenhaCertificado: String; SequenciaNotaFiscal :Integer; TipoEmissao :integer);
begin
   if TStringUtilitario.EstaVazia(AmbienteNFe) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, 'AdicionarConfiguracoes(AliquotaCreditoSN, AliquotaICMS, AliquotaPIS, '+
                                                           ' AliquotaCOFINS: Real; NumeroCertificado, AmbienteNFe, '+
                                                           '  SenhaCertificado: String)', 'AmbienteNFe' );

   self.FConfiguracoesNF                     := TConfiguracoesNF.Create(self.GetCodigoEmpresa);
   self.FConfiguracoesNF.aliq_cred_sn        := AliquotaCreditoSN;
   self.FConfiguracoesNF.aliq_icms           := AliquotaICMS;
   self.FConfiguracoesNF.aliq_pis            := AliquotaPIS;
   self.FConfiguracoesNF.aliq_cofins         := AliquotaCOFINS;
   self.FConfiguracoesNF.num_certificado     := NumeroCertificado;
   self.FConfiguracoesNF.SenhaCertificado    := SenhaCertificado;
   self.FConfiguracoesNF.ambiente_nfe        := AmbienteNFe;
   self.FConfiguracoesNF.SequenciaNotaFiscal := SequenciaNotaFiscal;

   {7 = SVCRS}
   if (tipoEmissao = 7) then
     self.FConfiguracoesNF.Dt_contingencia := now;

   self.FConfiguracoesNF.Tipo_emissao        := TipoEmissao;
end;

procedure TEmpresa.AdicionarConfiguracoesEmail(SMTPHost, SMTPPort,
  SMTPUser, SMTPPassword, Assunto, Mensagem: String; UsaSSL: Boolean);
const
  NOME_METODO = ' AdicionarConfiguracoesEmail(SMTPHost, SMTPPort, SMTPUser, SMTPPassword, Assunto, Mensagem: String; UsaSSL: Boolean) ';
begin
   if TStringUtilitario.EstaVazia(SMTPHost) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, NOME_METODO, 'SMTPHost');

   if TStringUtilitario.EstaVazia(SMTPPort) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, NOME_METODO, 'SMTPPort');

   if TStringUtilitario.EstaVazia(SMTPUser) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, NOME_METODO, 'SMTPUser');

   if TStringUtilitario.EstaVazia(SMTPPassword) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, NOME_METODO, 'SMTPPassword');

   if TStringUtilitario.EstaVazia(Assunto) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, NOME_METODO, 'Assunto');

   if TStringUtilitario.EstaVazia(Mensagem) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, NOME_METODO, 'Mensagem');

   self.FConfiguracoesEmail := TConfiguracoesNFEmail.Create(self.GetCodigoEmpresa,
                                                            SMTPHost,
                                                            SMTPPort,
                                                            SMTPUser,
                                                            SMTPPassword,
                                                            Assunto,
                                                            Mensagem,
                                                            UsaSSL);
end;

constructor TEmpresa.Create;
begin
   inherited Pessoa       := 'J';
   inherited Tipo         := 'E';
   inherited DtCadastro   := Date;

   self.FConfiguracoesNF    := nil;
   self.FConfiguracoesEmail := nil;
end;

destructor TEmpresa.Destroy;
begin
   FreeAndNil(self.FConfiguracoesNF);
   FreeAndNil(self.FConfiguracoesEmail);

  inherited;
end;

function TEmpresa.GetCodigoEmpresa: Integer;
begin
   result := self.FCodigoEmpresa;
end;

function TEmpresa.GetConfiguracoesEmail: TConfiguracoesNFEmail;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FConfiguracoesEmail) then begin
     Repositorio := nil;

     try
       Repositorio              := TFabricaRepositorio.GetRepositorio(TConfiguracoesNFEmail.ClassName);
       self.FConfiguracoesEmail := (Repositorio.Get(self.FCodigoEmpresa) as TConfiguracoesNFEmail);
     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FConfiguracoesEmail;
end;

function TEmpresa.GetConfiguracoesNF: TConfiguracoesNF;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FConfiguracoesNF) then begin
     Repositorio := nil;

     try
       Repositorio              := TFabricaRepositorio.GetRepositorio(TConfiguracoesNF.ClassName);
       self.FConfiguracoesNF := (Repositorio.Get(self.FCodigoEmpresa) as TConfiguracoesNF);
     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FConfiguracoesNF;
end;

function TEmpresa.GetRegimeTributarioInteger: Integer;
begin
   Result := 0;

   if      (self.FRegimeTributario = trtSimplesNacional) then result := 0
   else if (self.FRegimeTributario = trtLucroPresumido)  then result := 1
   else if (self.FRegimeTributario = trtLucroReal)       then result := 2;
end;

procedure TEmpresa.SetCodigoEmpresa(const Value: Integer);
begin
  FCodigoEmpresa := Value;
end;

procedure TEmpresa.SetRegimeTributario(const Value: TTipoRegimeTributario);
begin
  FRegimeTributario := Value;
end;

procedure TEmpresa.SetRegimeTributarioInteger(const Value: Integer);
begin
   case Value of
     0: self.FRegimeTributario := trtSimplesNacional;
     1: self.FRegimeTributario := trtLucroPresumido;
     2: self.FRegimeTributario := trtLucroReal;
   end;
end;

end.
