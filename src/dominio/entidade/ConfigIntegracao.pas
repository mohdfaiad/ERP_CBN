unit ConfigIntegracao;

interface

uses SysUtils, Contnrs;

type
  TConfigIntegracao = class

  private
    FCodigo :Integer;
    Furl_base :String;
    Fcompany_token :String;
    Fapplication_token :String;

  public
    property codigo                :Integer read FCodigo               write FCodigo;
    property url_base              :String read Furl_base              write Furl_base;
    property company_token         :String read Fcompany_token         write Fcompany_token;
    property application_token     :String read Fapplication_token     write Fapplication_token;
end;

implementation

{ TConfigIntegracao }

end.
