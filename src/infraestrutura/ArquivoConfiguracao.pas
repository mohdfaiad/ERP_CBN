unit ArquivoConfiguracao;

interface

uses
   IniFiles;

type
  TArquivoConfiguracao = class(TIniFile)

  private
    FDiretorioSistema         :String;

  private
    function GetCaminhoBancoDeDados       :String;
    function GetNomeServidorBancoDeDados  :String;
    function GetPortaBancoDeDados         :Integer;
    function GetProtocoloBancoDeDados     :String;
    function GetSenhaBancoDeDados         :String;
    function GetUsuarioBancoDeDados       :String;

  private
    procedure SetCaminhoBancoDeDados     (const Value: String);
    procedure SetNomeServidorBancoDeDados(const Value: String);
    procedure SetPortaBancoDeDados       (const Value: Integer);
    procedure SetProtocoloBancoDeDados   (const Value: String);
    procedure SetSenhaBancoDeDados       (const Value: String);
    procedure SetUsuarioBancoDeDados     (const Value: String);

    procedure InicializaTags;
  private
    function GetNomeArquivo: String;

  private
    property NomeArquivo :String read GetNomeArquivo;

  public
    constructor Create(DiretorioSistema :String);

  public
    property CaminhoBancoDeDados                :String read  GetCaminhoBancoDeDados write SetCaminhoBancoDeDados;
    property NomeServidorBancoDeDados           :String read  GetNomeServidorBancoDeDados write SetNomeServidorBancoDeDados;
    property UsuarioBancoDeDados                :String read  GetUsuarioBancoDeDados write SetUsuarioBancoDeDados;
    property SenhaBancoDeDados                  :String read  GetSenhaBancoDeDados write SetSenhaBancoDeDados;
    property PortaBancoDeDados                  :Integer read GetPortaBancoDeDados write SetPortaBancoDeDados;
    property ProtocoloBancoDeDados              :String read  GetProtocoloBancoDeDados write SetProtocoloBancoDeDados;
end;

implementation

uses
  SysUtils;

const
  NOME_ARQUIVO = 'configuracao.ini';

  // Tags do arquivo de configuração
  TAG_BANCO_DE_DADOS         = 'BANCO_DE_DADOS';
  TAG_BANCO_DE_BACKUP        = 'BANCO_DE_BACKUP';
    TAG_CAMINHO                  = 'CAMINHO';
    TAG_NOME_DO_SERVIDOR         = 'NOME_DO_SERVIDOR';
    TAG_USUARIO                  = 'USUARIO';
    TAG_SENHA                    = 'SENHA';
    TAG_PORTA                    = 'PORTA';
    TAG_PROTOCOLO                = 'PROTOCOLO';

  // Valores padrão
    USUARIO_PADRAO     = 'SYSDBA';
    SENHA_PADRAO       = 'masterkey';
    PORTA_PADRAO       = 3050;
    PROTOCOLO_PADRAO   = 'firebird-2.1';
    SERVIDOR_PADRAO    = 'localhost';

{ TArquivoConfiguracao }

constructor TArquivoConfiguracao.Create(DiretorioSistema: String);
begin
   self.FDiretorioSistema := DiretorioSistema;

   inherited Create(self.NomeArquivo);

   self.InicializaTags;
end;

function TArquivoConfiguracao.GetCaminhoBancoDeDados: String;
begin
   result := inherited ReadString(TAG_BANCO_DE_DADOS, TAG_CAMINHO, '');

   self.SetCaminhoBancoDeDados(result);
end;

function TArquivoConfiguracao.GetNomeArquivo: String;
begin
   result := (self.FDiretorioSistema + NOME_ARQUIVO);
end;

function TArquivoConfiguracao.GetNomeServidorBancoDeDados: String;
begin
   result := inherited ReadString(TAG_BANCO_DE_DADOS, TAG_NOME_DO_SERVIDOR, SERVIDOR_PADRAO);

   self.SetNomeServidorBancoDeDados(result);
end;

function TArquivoConfiguracao.GetPortaBancoDeDados: Integer;
begin
   result := inherited ReadInteger(TAG_BANCO_DE_DADOS, TAG_PORTA, PORTA_PADRAO);

   self.SetPortaBancoDeDados(result);
end;

function TArquivoConfiguracao.GetProtocoloBancoDeDados: String;
begin
   result := inherited ReadString(TAG_BANCO_DE_DADOS, TAG_PROTOCOLO, PROTOCOLO_PADRAO);

   self.SetProtocoloBancoDeDados(result);
end;

function TArquivoConfiguracao.GetSenhaBancoDeDados: String;
begin
   result := inherited ReadString(TAG_BANCO_DE_DADOS, TAG_SENHA, SENHA_PADRAO);

   self.SetSenhaBancoDeDados(result);
end;

function TArquivoConfiguracao.GetUsuarioBancoDeDados: String;
begin
   result := inherited ReadString(TAG_BANCO_DE_DADOS, TAG_USUARIO, USUARIO_PADRAO);

   self.SetUsuarioBancoDeDados(result);
end;

procedure TArquivoConfiguracao.InicializaTags;
begin
   self.CaminhoBancoDeDados;
   self.NomeServidorBancoDeDados;
   self.UsuarioBancoDeDados;
   self.SenhaBancoDeDados;
   self.PortaBancoDeDados;
   self.ProtocoloBancoDeDados;
end;

procedure TArquivoConfiguracao.SetCaminhoBancoDeDados(const Value: String);
begin
   inherited WriteString(TAG_BANCO_DE_DADOS, TAG_CAMINHO, Value);
end;

procedure TArquivoConfiguracao.SetNomeServidorBancoDeDados(
  const Value: String);
begin
  inherited WriteString(TAG_BANCO_DE_DADOS, TAG_NOME_DO_SERVIDOR, Value);
end;

procedure TArquivoConfiguracao.SetPortaBancoDeDados(const Value: Integer);
begin
  inherited WriteInteger(TAG_BANCO_DE_DADOS, TAG_PORTA, Value);
end;

procedure TArquivoConfiguracao.SetProtocoloBancoDeDados(
  const Value: String);
begin
  inherited WriteString(TAG_BANCO_DE_DADOS, TAG_PROTOCOLO, Value);
end;

procedure TArquivoConfiguracao.SetSenhaBancoDeDados(const Value: String);
begin
  inherited WriteString(TAG_BANCO_DE_DADOS, TAG_SENHA, Value);
end;

procedure TArquivoConfiguracao.SetUsuarioBancoDeDados(const Value: String);
begin
  inherited WriteString(TAG_BANCO_DE_DADOS, TAG_USUARIO, Value);
end;

end.
