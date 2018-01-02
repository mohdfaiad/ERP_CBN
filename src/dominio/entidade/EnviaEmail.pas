unit EnviaEmail;

interface

uses ConfiguracoesNFEmail, ACBrMail, System.SysUtils, System.Classes;

type TEnviaEmail = class
  private
    FACBrMail :TACBrMail;

    destructor Destroy;override;
  public
    function EnviaEmail(Remetente, Destinatario : String; Assunto: String = ''; Texto: String = ''; emailCopia :String = ''; stlAnexo: TStringList = nil): Boolean;

  public
    constructor Create;
end;

implementation

uses repositorio, fabricaRepositorio;

{ TEnviaEmail }

constructor TEnviaEmail.Create;
begin
  FACBrMail := TACBrMail.Create(nil);
end;

destructor TEnviaEmail.Destroy;
begin
  FreeAndNil(FACBrMail);
  inherited;
end;

function TEnviaEmail.EnviaEmail(Remetente, Destinatario, Assunto, Texto: String; emailCopia :String; stlAnexo: TStringList): Boolean;
var
  nX                  :integer;
  configuracoes_email :TConfiguracoesNFEmail;
  repositorio         :TRepositorio;
begin
 try
  try
    result              := true;
    repositorio         := nil;
    repositorio         := TFabricaRepositorio.GetRepositorio( TConfiguracoesNFEmail.ClassName );
    configuracoes_email := TConfiguracoesNFEmail( repositorio.Get( 1 ) );

    if assigned(configuracoes_email) then
    begin
      FACBrMail.Host         := configuracoes_email.SMTPHost;
      FACBrMail.Port         := configuracoes_email.SMTPPort;
      FACBrMail.Username     := configuracoes_email.SMTPUser;
      FACBrMail.Password     := configuracoes_email.SMTPPassword;
      FACBrMail.AddReplyTo(emailCopia);
      FACBrMail.AddAddress(Destinatario);

      FACBrMail.From                := Remetente;
    //  FACBrMail.FromName            := edtNome.Text;
      FACBrMail.IsHTML := false;

      FACBrMail.Subject      := Assunto;
      FACBrMail.Body.Text    := Texto;
      FACBrMail.AltBody.Text := FACBrMail.Body.Text;

      for nX := 0 to stlAnexo.Count -1 do
        FACBrMail.AddAttachment(TFileName( stlAnexo[nX] ));

      FACBrMail.Send;
    end
    else
      raise Exception.Create('Não foi possível enviar e-mail, pois não há configurações de e-mail cadastradas');

  Except
    on e : Exception do
      begin
        result := false;
        raise Exception.Create(e.Message);
      end;
  end;

 Finally
   FreeAndNil(configuracoes_email );
   FreeAndNil(repositorio);
 end;
end;

end.
