unit Perfil;

interface

type
  TPerfil = class

  private
    FCodigo :Integer;
    FAcesso :String;
    FNome   :String;

    procedure SetAcesso(const Value: String);
    procedure SetCodigo(const Value: Integer);
    procedure SetNome  (const Value: String);
  public
    property Codigo :Integer read FCodigo write SetCodigo;
    property Nome   :String  read FNome   write SetNome;
    property Acesso :String  read FAcesso write SetAcesso;
  end;

implementation

uses
  SysUtils;

{ TPerfil }

procedure TPerfil.SetAcesso(const Value: String);
begin
  FAcesso := Value;
end;

procedure TPerfil.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPerfil.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
