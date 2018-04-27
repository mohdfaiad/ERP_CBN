unit uModulo;

interface

uses
  SysUtils,
  Classes,
  ArquivoConfiguracao,
  LogErros,
  DB,
  Usuario, Caixa,
  Windows,
  Parametros,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef, ConfiguracoesECommerce, ConfigIntegracao;

type
  Tdm = class(TDataModule)
    FDConnection: TFDConnection;
    qryGenerica2: TFDQuery;
    FDTransaction1: TFDTransaction;
    qryGenerica: TFDQuery;

  // Eventos
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);

  private
    FArquivoConfiguracao      :TArquivoConfiguracao;
    FLogErros                 :TLogErros;
    FNomeDoExecutavel         :String;
    FConexaoBancoDeDados      :TFDConnection;
    FUsuario                  :TUsuario;
    FParametros               :TParametros;
    FInformouSenhaSertificado :Boolean;

    function GetParametros    :TParametros;
    function GetConexao       :TFDConnection;
    function GetLogo: String;
    function GetCaixaLoja: TCaixa;

  private
    function GetDiretorioSistema        :String;
    function GetIsConectadoBancoDeDados :Boolean;
    function GetNomeDoTerminal          :String;

  private
    FCaixaLoja: TCaixa;
    FCaixaAberto: Boolean;
    FConfiguracoesECommerce: TConfiguracoesECommerce;
    FConfiguracoesIntegracao: TConfigIntegracao;

    procedure SetArquivoConfiguracao(const Value: TArquivoConfiguracao);
    procedure SetLogErros           (const Value: TLogErros);
    procedure SetUsuario            (const Value: TUsuario);
    procedure SetParametros         (const Value: TParametros);

    procedure PreencheDadosConexaoBancoDeDados(Sender: TObject);
    function getCaixaAberto: Boolean;
    function getConfiguracoesECommerce: TConfiguracoesECommerce;
    function getConfiguracoesIntegracao: TConfigIntegracao;

  public
    constructor Create(AOwner :TComponent); override;

  // Propriedades
  public
     property LogErros                 :TLogErros               read FLogErros            write SetLogErros;
     property ArquivoConfiguracao      :TArquivoConfiguracao    read FArquivoConfiguracao write SetArquivoConfiguracao;
     property UsuarioLogado            :TUsuario                read FUsuario             write SetUsuario;
     property Parametros               :TParametros             read GetParametros        write SetParametros;
     property CaixaLoja                :TCaixa                  read GetCaixaLoja         write FCaixaLoja;
     property caixaAberto              :Boolean                 read getCaixaAberto       write FCaixaAberto;
     property configuracoesECommerce   :TConfiguracoesECommerce read getConfiguracoesECommerce write FConfiguracoesECommerce;
     property configuracoesIntegracao  :TConfigIntegracao       read getConfiguracoesIntegracao  write FConfiguracoesIntegracao;
     property informouSenhaSertificado :Boolean                 read FInformouSenhaSertificado write FInformouSenhaSertificado;

     // Apenas leitura
     property DiretorioSistema          :String        read GetDiretorioSistema;
     property NomeDoTerminal            :String        read GetNomeDoTerminal;
     property IsConectadoBancoDeDados   :Boolean       read GetIsConectadoBancoDeDados;
     property conexao                   :TFDConnection read GetConexao;
     property Logo                      :String        read GetLogo;

  public
     procedure AbreConexaoBancoDeDados;
     procedure FechaConexaoBancoDeDados;

     function GetConsulta                            :TFDQuery; overload;
     function GetConsulta(const SQL         :String) :TFDQuery; overload;
     function GetValorGenerator(const NomeDoGenerator :String; const op :integer = 0) :Integer;
end;



var
  dm: Tdm;

implementation

uses
  FabricaRepositorio,
  Forms, Funcoes,
  ExcecaoBancoDeDadosInvalido,
  ExcecaoBancoDeBackupInvalido,
  Repositorio,
  ZDbcIntfs;

{$R *.dfm}

{ Tdm }

procedure Tdm.SetArquivoConfiguracao(const Value: TArquivoConfiguracao);
begin
  FArquivoConfiguracao := Value;
end;

procedure Tdm.SetLogErros(const Value: TLogErros);
begin
  FLogErros := Value;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  Aplicacao :TApplication;
begin
   FDConnection.Params.Database         := '';
   Aplicacao                            := (self.Owner as TApplication);
   self.FNomeDoExecutavel               := ExtractFilePath(Aplicacao.ExeName);
   self.FLogErros                       := TLogErros.Create(self.DiretorioSistema);
   self.FArquivoConfiguracao            := TArquivoConfiguracao.Create(self.DiretorioSistema);
   self.AbreConexaoBancoDeDados;

   FUsuario                             := nil;
   FParametros                          := nil;
   FInformouSenhaSertificado            := false;

   qryGenerica.Connection  := self.FConexaoBancoDeDados;
   qryGenerica2.Connection := self.FConexaoBancoDeDados;
end;

function Tdm.GetDiretorioSistema: String;
begin
   result := ExtractFilePath(self.FNomeDoExecutavel); 
end;

procedure Tdm.DataModuleDestroy(Sender: TObject);
begin
   FreeAndNil(self.FArquivoConfiguracao);
   FreeAndNil(self.FLogErros);
   FreeAndNil(self.FConexaoBancoDeDados);
   FreeAndNil(self.FUsuario);
   FreeAndNil(self.FParametros);
   if assigned(FConfiguracoesECommerce) then
     FreeAndNil(self.FConfiguracoesECommerce);
end;

procedure Tdm.PreencheDadosConexaoBancoDeDados(Sender: TObject);
begin
    self.FConexaoBancoDeDados.Connected := False;

    self.FConexaoBancoDeDados.Params.Clear;
    self.FConexaoBancoDeDados.Params.Add('server='+ self.FArquivoConfiguracao.NomeServidorBancoDeDados);
    self.FConexaoBancoDeDados.Params.Add('user_name='+ self.FArquivoConfiguracao.UsuarioBancoDeDados);
    self.FConexaoBancoDeDados.Params.Add('password='+ self.FArquivoConfiguracao.SenhaBancoDeDados);
    self.FConexaoBancoDeDados.Params.Add('port='+ IntToStr(self.FArquivoConfiguracao.PortaBancoDeDados));
    self.FConexaoBancoDeDados.Params.Add('Database='+ self.FArquivoConfiguracao.CaminhoBancoDeDados);
    self.FConexaoBancoDeDados.Params.Add('Protocol='+ self.FArquivoConfiguracao.ProtocoloBancoDeDados);
    self.FConexaoBancoDeDados.Params.Add('DriverID='+ 'FB');

    self.FDConnection.Connected         := False;

    self.FDConnection.Params.Clear;
    self.FDConnection.Params.Add('server='+ self.FArquivoConfiguracao.NomeServidorBancoDeDados);
    self.FDConnection.Params.Add('user_name='+ self.FArquivoConfiguracao.UsuarioBancoDeDados);
    self.FDConnection.Params.Add('password='+ self.FArquivoConfiguracao.SenhaBancoDeDados);
    self.FDConnection.Params.Add('port='+ IntToStr(self.FArquivoConfiguracao.PortaBancoDeDados));
    self.FDConnection.Params.Add('Database='+ self.FArquivoConfiguracao.CaminhoBancoDeDados);
    self.FDConnection.Params.Add('Protocol='+ self.FArquivoConfiguracao.ProtocoloBancoDeDados);
    self.FDConnection.Params.Add('DriverID='+ 'FB');
end;

constructor Tdm.Create(AOwner: TComponent);
begin
  inherited;

  self.FConexaoBancoDeDados               := TFDConnection.Create(nil);
  self.FConexaoBancoDeDados.BeforeConnect := self.PreencheDadosConexaoBancoDeDados;
  FConfiguracoesECommerce := nil;
end;

procedure Tdm.AbreConexaoBancoDeDados;
begin
   try
     try

       self.FConexaoBancoDeDados.TxOptions.Isolation    := xiReadCommitted;
     //  self.FConexaoBancoDeDados.UpdateOptions.LockWait := true;
     //  self.FConexaoBancoDeDados.UpdateOptions.LockMode := lmPessimistic;

//       self.FConexaoBancoDeDados.UpdateTransaction      := FDTransaction1;
       self.FConexaoBancoDeDados.TxOptions.AutoCommit   := true;
       self.FConexaoBancoDeDados.Connected              := true;

       FDConnection.Connected                           := true;
     except
       on E: Exception do
        raise TExcecaoBancoDeDadosInvalido.Create;
     end;
   except
     on E: TExcecaoBancoDeDadosInvalido do
        self.FLogErros.AdicionaErro('uModulo', 'TExcecaoBancoDeDadosInvalido', E.Message);
   end;
end;

function Tdm.GetIsConectadoBancoDeDados: Boolean;
begin
   result := self.FConexaoBancoDeDados.Connected;
end;

procedure Tdm.FechaConexaoBancoDeDados;
begin
   self.FConexaoBancoDeDados.Connected := false;
   self.FDConnection.Connected         := false;
end;

function Tdm.getCaixaAberto: Boolean;
begin
  if not assigned(FCaixaLoja) then
    FCaixaLoja := GetCaixaLoja;

  Result := FCaixaAberto;
end;

function Tdm.GetConsulta: TFDQuery;
begin
   result               := TFDQuery.Create(nil);
   result.Connection    := self.FConexaoBancoDeDados;
   result.CachedUpdates := true;
   result.Close;
   result.SQL.Clear;
end;

function Tdm.GetConsulta(const SQL: String): TFDQuery;
begin
   result := self.GetConsulta;
   result.SQL.Add(SQL);
end;

procedure Tdm.SetUsuario(const Value: TUsuario);
begin
  FUsuario := Value;
end;

function Tdm.GetValorGenerator(const NomeDoGenerator: String; const op :integer): Integer;
begin
   try
     qryGenerica.sql.Text := 'select gen_id(' + NomeDoGenerator + ', '+intToStr(op)+' ) from rdb$database';
     qryGenerica.Open;

     result := qryGenerica.Fields[0].AsInteger;
   finally
     qryGenerica.Close;
    // FreeAndNil(qryGenerica);
   end;
end;

function Tdm.GetNomeDoTerminal: String;
var
  Buffer       :Array [0 .. 255] of Char;
  Size         :DWORD;
  ComputerName :String;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  GetComputerName(Buffer, Size);
  ComputerName := Buffer;
  Result := ComputerName;
end;

procedure Tdm.SetParametros(const Value: TParametros);
begin
  FParametros := Value;
end;

function Tdm.GetParametros: TParametros;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FParametros) then begin
      Repositorio := TFabricaRepositorio.GetRepositorio(TParametros.ClassName);

      try
        self.FParametros := TParametros(Repositorio.Get(0));
      finally
        FreeAndNil(Repositorio);
      end;
   end;

   if not Assigned(self.FParametros) then
    raise Exception.Create('ATENÇÃO!'+#13+'Não foi possível encontrar o registro de parâmetros no banco de dados. Informe o suporte!');

   result := self.FParametros;
end;

function Tdm.GetCaixaLoja: TCaixa;
var
  repositorio        :TRepositorio;
begin
  repositorio          := nil;
  try
    if not assigned(FCaixaLoja) then
    begin
      repositorio := TFabricaRepositorio.GetRepositorio(TCaixa.ClassName);
      FCaixaLoja  := TCaixa( repositorio.Get( StrToIntDef( Maior_Valor_Cadastrado('Caixa', 'Codigo') ,0) ) );
    end;

    result := FCaixaLoja;

    self.FcaixaAberto := not (not assigned(FCaixaLoja) or (FCaixaLoja.data_fechamento > 0));

  finally
    FreeAndNil(repositorio);
  end;
end;

function Tdm.GetConexao: TFDConnection;
begin
  Result := FConexaoBancoDeDados;
end;

function Tdm.getConfiguracoesECommerce: TConfiguracoesECommerce;
var repositorio :TRepositorio;
begin
  if not Assigned(FConfiguracoesECommerce) then
  begin
    try
      repositorio    := TFabricaRepositorio.GetRepositorio(TConfiguracoesECommerce.ClassName);
      FConfiguracoesECommerce := TConfiguracoesECommerce(repositorio.Get(1));
    finally
      FreeAndNil(repositorio);
    end;
  end;

  Result := FConfiguracoesECommerce;
end;

function Tdm.getConfiguracoesIntegracao: TConfigIntegracao;
var repositorio :TRepositorio;
begin
  if not Assigned(FConfiguracoesIntegracao) then
  begin
    try
      repositorio              := TFabricaRepositorio.GetRepositorio(TConfigIntegracao.ClassName);
      FConfiguracoesIntegracao := TConfigIntegracao(repositorio.Get(1));
    finally
      FreeAndNil(repositorio);
    end;
  end;

  Result := FConfiguracoesIntegracao;
end;

function Tdm.GetLogo: String;
begin
   result := self.DiretorioSistema + 'logo.png';
end;

end.
