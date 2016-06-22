unit RepositorioConfiguracoesNFEmail;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioConfiguracoesNFEmail = class(TRepositorio)

  protected
    function Get             (Dataset :TDataSet) :TObject; overload; override;
    function GetNomeDaTabela                     :String;            override;
    function GetIdentificador(Objeto :TObject)   :Variant;           override;
    function GetRepositorio                     :TRepositorio;       override;

  protected
    function SQLGet                      :String;            override;
    function SQLSalvar                   :String;            override;
    function SQLGetAll                   :String;            override;
    function SQLRemover                  :String;            override;

  protected
    function IsInsercao(Objeto :TObject) :Boolean;           override;
    function IsComponente                :Boolean;           override;

  protected
    procedure SetParametros   (Objeto :TObject                        ); override;

  //==============================================================================
  // Auditoria
  //==============================================================================
  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
end;


implementation

uses
  ConfiguracoesNFEmail,
  SysUtils;

{ TRepositorioConfiguracoesNFEmail }

function TRepositorioConfiguracoesNFEmail.Get(Dataset: TDataSet): TObject;
begin
   result := TConfiguracoesNFEmail.CriaParaRepositorio(Dataset.FieldByName('codigo_empresa').AsInteger,
                                                       Dataset.FieldByName('smtp_host').AsString,
                                                       Dataset.FieldByName('smtp_port').AsString,
                                                       Dataset.FieldByName('smtp_user').AsString,
                                                       Dataset.FieldByName('smtp_password').AsString,
                                                       Dataset.FieldByName('assunto').AsString,
                                                       Dataset.FieldByName('mensagem').AsString,
                                                       (Dataset.FieldByName('usa_ssl').AsString = 'S')
                                                       );
end;

function TRepositorioConfiguracoesNFEmail.GetIdentificador(
  Objeto: TObject): Variant;
begin
   result := TConfiguracoesNFEmail(Objeto).CodigoEmpresa; 
end;

function TRepositorioConfiguracoesNFEmail.GetNomeDaTabela: String;
begin
   result := 'configuracoes_nf_email';
end;

function TRepositorioConfiguracoesNFEmail.GetRepositorio: TRepositorio;
begin
   result := TRepositorioConfiguracoesNFEmail.Create;
end;

function TRepositorioConfiguracoesNFEmail.IsComponente: Boolean;
begin
   result := true;
end;

function TRepositorioConfiguracoesNFEmail.IsInsercao(
  Objeto: TObject): Boolean;
begin
   result := true;
end;

procedure TRepositorioConfiguracoesNFEmail.SetCamposExcluidos(
  Auditoria: TAuditoria; Objeto: TObject);
var
  Obj :TConfiguracoesNFEmail;
begin
   Obj := (Objeto as TConfiguracoesNFEmail);

   Auditoria.AdicionaCampoExcluido('codigo_empresa', IntToStr(Obj.CodigoEmpresa));
   Auditoria.AdicionaCampoExcluido('smtp_host',               Obj.SMTPHost);
   Auditoria.AdicionaCampoExcluido('smtp_port',               Obj.SMTPPort);
   Auditoria.AdicionaCampoExcluido('smtp_user',               Obj.SMTPUser);
   Auditoria.AdicionaCampoExcluido('smtp_password',           Obj.SMTPPassword);
   Auditoria.AdicionaCampoExcluido('assunto',                 Obj.Assunto);
   Auditoria.AdicionaCampoExcluido('mensagem',                Obj.Mensagem.Text);

   if Obj.UsaSSL then
     Auditoria.AdicionaCampoExcluido('usa_ssl', 'S')
   else
     Auditoria.AdicionaCampoExcluido('usa_ssl', 'N');
end;

procedure TRepositorioConfiguracoesNFEmail.SetCamposIncluidos(
  Auditoria: TAuditoria; Objeto: TObject);
var
  Obj :TConfiguracoesNFEmail;
begin
   Obj := (Objeto as TConfiguracoesNFEmail);

   Auditoria.AdicionaCampoIncluido('codigo_empresa', IntToStr(Obj.CodigoEmpresa));
   Auditoria.AdicionaCampoIncluido('smtp_host',               Obj.SMTPHost);
   Auditoria.AdicionaCampoIncluido('smtp_port',               Obj.SMTPPort);
   Auditoria.AdicionaCampoIncluido('smtp_user',               Obj.SMTPUser);
   Auditoria.AdicionaCampoIncluido('smtp_password',           Obj.SMTPPassword);
   Auditoria.AdicionaCampoIncluido('assunto',                 Obj.Assunto);
   Auditoria.AdicionaCampoIncluido('mensagem',                Obj.Mensagem.Text);

   if Obj.UsaSSL then
     Auditoria.AdicionaCampoIncluido('usa_ssl', 'S')
   else
     Auditoria.AdicionaCampoIncluido('usa_ssl', 'N');
end;

procedure TRepositorioConfiguracoesNFEmail.SetParametros(Objeto: TObject);
var
  Obj :TConfiguracoesNFEmail;
begin
   Obj := (Objeto as TConfiguracoesNFEmail);

   inherited SetParametro('codigo_empresa',   Obj.CodigoEmpresa);
   inherited SetParametro('smtp_host',                 Obj.SMTPHost);
   inherited SetParametro('smtp_port',                 Obj.SMTPPort);
   inherited SetParametro('smtp_user',                 Obj.SMTPUser);
   inherited SetParametro('smtp_password',             Obj.SMTPPassword);
   inherited SetParametro('assunto',                   Obj.Assunto);
   inherited SetParametro('mensagem',                  Obj.Mensagem.Text);

   if Obj.UsaSSL then
     inherited SetParametro('usa_ssl', 'S')
   else
     inherited SetParametro('usa_ssl', 'N');
end;

function TRepositorioConfiguracoesNFEmail.SQLGet: String;
begin
   result := 'select * from '+self.GetNomeDaTabela+' where codigo_empresa = :codigo ';
end;

function TRepositorioConfiguracoesNFEmail.SQLGetAll: String;
begin
   result := 'select * from '+self.GetNomeDaTabela+' order by codigo_empresa ';
end;

function TRepositorioConfiguracoesNFEmail.SQLRemover: String;
begin
   result := 'delete from '+self.GetNomeDaTabela+' where codigo_empresa = :codigo ';
end;

function TRepositorioConfiguracoesNFEmail.SQLSalvar: String;
begin
   result := 'update or insert into '+self.GetNomeDaTabela+'  (codigo_empresa,   smtp_host,   smtp_user, '+
                                                           '   smtp_port, smtp_password, assunto, mensagem, usa_ssl)      '+
                                                      'values (:codigo_empresa,  :smtp_host, :smtp_user, '+
                                                           '   :smtp_port, :smtp_password, :assunto, :mensagem, :usa_ssl) ';
end;

end.
