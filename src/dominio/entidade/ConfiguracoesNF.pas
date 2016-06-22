unit ConfiguracoesNF;

interface

uses
  SysUtils,
  Contnrs,
  Criptografia,
  MetodoDelegadoObtemCampoInteger;

type
  TConfiguracoesNF = class

  private
    FCodigoEmpresa: Integer;
    FBuscadorCodigoEmpresa :TMetodoDelegadoObtemCampoInteger;
    Faliq_pis: Real;
    Faliq_icms: Real;
    Faliq_cred_sn: Real;
    Faliq_cofins: Real;
    Fnum_certificado: String;
    Fambiente_nfe: String;
    FSequenciaNotaFiscal: Integer;
    FSenhaCertificado :String;
    FCriptografia :TCriptografia;
    FTipo_emissao :integer;
    FDt_contingencia :TDateTime;

  private
    function GetCodigoEmpresa: Integer;
    function GetSenhaCertificado              :String;
    function GetSenhaCertificadoCriptografada :String;

  private
    procedure Setaliq_cofins(const Value: Real);
    procedure Setaliq_cred_sn(const Value: Real);
    procedure Setaliq_icms(const Value: Real);
    procedure Setaliq_pis(const Value: Real);
    procedure Setambiente_nfe(const Value: String);
    procedure Setnum_certificado(const Value: String);
    procedure SetSequenciaNotaFiscal(const Value: Integer);
    procedure SetSenhaCertificado(const Value: String);


  public
    constructor Create(BuscadorCodigoEmpresa :TMetodoDelegadoObtemCampoInteger);
    constructor CriarParaRepositorio(const CodigoEmpresa :Integer; const SenhaCriptografada :String);

    destructor  Destroy; override;

  public
    property aliq_cred_sn         :Real    read Faliq_cred_sn        write Setaliq_cred_sn;
    property aliq_icms            :Real    read Faliq_icms           write Setaliq_icms;
    property aliq_pis             :Real    read Faliq_pis            write Setaliq_pis;
    property aliq_cofins          :Real    read Faliq_cofins         write Setaliq_cofins;
    property num_certificado      :String  read Fnum_certificado     write Setnum_certificado;
    property SenhaCertificado     :String  read GetSenhaCertificado  write SetSenhaCertificado;
    property ambiente_nfe         :String  read Fambiente_nfe        write Setambiente_nfe;
    property SequenciaNotaFiscal  :Integer read FSequenciaNotaFiscal write SetSequenciaNotaFiscal;
    property Tipo_emissao         :Integer read FTipo_emissao        write FTipo_emissao;
    property Dt_contingencia      :TDateTIme read FDt_contingencia   write FDt_contingencia;

  public
    property CodigoEmpresa                  :Integer               read GetCodigoEmpresa;
    property SenhaCertificadoCriptografada  :String                read GetSenhaCertificadoCriptografada;

  public
    procedure AdicionarConfiguracoesEmail(SMTPHost,
                                          SMTPPort,
                                          SMTPUser,
                                          SMTPPassword,
                                          Assunto,
                                          Mensagem :String;
                                          UsaSSL :Boolean);

  public
    function IncrementarSequencia :Integer;
end;


implementation

uses StringUtilitario, ExcecaoParametroInvalido, FabricaRepositorio,
  Repositorio;

{ TConfiguracoesNF }

procedure TConfiguracoesNF.AdicionarConfiguracoesEmail(SMTPHost, SMTPPort,
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

//   self.FConfiguracoesEmail := TConfiguracoesNFEmail.Create(self.GetCodigo,
//                                                            SMTPHost,
//                                                            SMTPPort,
//                                                            SMTPUser,
//                                                            SMTPPassword,
//                                                            Assunto,
//                                                            Mensagem,
//                                                            UsaSSL);
end;

constructor TConfiguracoesNF.Create(BuscadorCodigoEmpresa :TMetodoDelegadoObtemCampoInteger);
begin
   self.FCriptografia := TCriptografia.Create;
   self.FBuscadorCodigoEmpresa := BuscadorCodigoEmpresa;
end;

constructor TConfiguracoesNF.CriarParaRepositorio(const CodigoEmpresa :Integer;
  const SenhaCriptografada: String);
begin
   self.Create(nil);

   self.FCodigoEmpresa    := CodigoEmpresa;
   self.FSenhaCertificado := SenhaCriptografada;
end;

destructor TConfiguracoesNF.Destroy;
begin
  FreeAndNil(self.FCriptografia);
  
  inherited;
end;

function TConfiguracoesNF.GetCodigoEmpresa: Integer;
begin
   if (self.FCodigoEmpresa <= 0) then
    self.FCodigoEmpresa := self.FBuscadorCodigoEmpresa;
    
   result := self.FCodigoEmpresa;
end;

function TConfiguracoesNF.GetSenhaCertificado: String;
begin
   result := self.FCriptografia.DesencriptRC4(self.FSenhaCertificado);
end;

function TConfiguracoesNF.GetSenhaCertificadoCriptografada: String;
begin
   result := self.FSenhaCertificado;
end;

function TConfiguracoesNF.IncrementarSequencia: Integer;
begin
   self.FSequenciaNotaFiscal := (self.FSequenciaNotaFiscal + 1);
   result                    := self.FSequenciaNotaFiscal;
end;

procedure TConfiguracoesNF.Setaliq_cofins(const Value: Real);
begin
  Faliq_cofins := Value;
end;

procedure TConfiguracoesNF.Setaliq_cred_sn(const Value: Real);
begin
  Faliq_cred_sn := Value;
end;

procedure TConfiguracoesNF.Setaliq_icms(const Value: Real);
begin
  Faliq_icms := Value;
end;

procedure TConfiguracoesNF.Setaliq_pis(const Value: Real);
begin
  Faliq_pis := Value;
end;

procedure TConfiguracoesNF.Setambiente_nfe(const Value: String);
begin
  Fambiente_nfe := Value;
end;

procedure TConfiguracoesNF.Setnum_certificado(const Value: String);
begin
  Fnum_certificado := Value;
end;

procedure TConfiguracoesNF.SetSenhaCertificado(const Value: String);
begin
   self.FSenhaCertificado := self.FCriptografia.EncriptRC4(Value);
end;

procedure TConfiguracoesNF.SetSequenciaNotaFiscal(const Value: Integer);
begin
  FSequenciaNotaFiscal := Value;
end;

end.
