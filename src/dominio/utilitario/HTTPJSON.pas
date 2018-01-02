unit HTTPJSON;

interface

uses System.SysUtils, IdHTTP, REST.types, System.JSon, IdSSLOpenSSL, System.Classes;

type
  THTTPJSON = class
  private
    FIdHTTP: TIdHTTP;
    FIdSSL: TIdSSLIOHandlerSocketOpenSSL;
    FURLBase :String;

  public
    function Post(json :String) :String;
    function Get(url :String) :String;
  public
    constructor Create(tokenAcesso, urlBase: String);
  private
    destructor Destroy;override;
  end;

implementation

{ THTTPJSON }

constructor THTTPJSON.Create(tokenAcesso, urlBase: String);
begin
   FURLBase := urlBase;
   //Necessita das DLLs libeay32.dll e ssleay32.dll
   FIdSSL   := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
   FIdHTTP  := TIdHTTP.Create(nil);
   FIdHTTP.IOHandler   := FIdSSL;

   FIdHTTP.Request.CustomHeaders.AddValue('Authorization','Token '+tokenAcesso);
   FIdHTTP.Request.CustomHeaders.AddValue('Content-Type','application/json');
   FIdHTTP.Request.ContentType   := 'application/json';
   //FIdHTTP.Request.Method        := 'POST';
   FIdHTTP.Request.CharSet       := 'utf-8';
   FIdHttp.Request.Accept        := 'application/json';
   FIdHTTP.HandleRedirects       := true;

   FIdHTTP.Response.CustomHeaders.AddValue('access-control-allow-origin','*');
   FIdHTTP.Response.CustomHeaders.AddValue('access-control-allow-Methods','PUT, GET');
   FIdHTTP.Response.CustomHeaders.AddValue('access-control-allow-Headers','accept, authorization, origin');
end;

destructor THTTPJSON.Destroy;
begin
  FreeAndNil(FIdHTTP);
  FreeAndNil(FIdSSL);
  inherited;
end;

function THTTPJSON.Get(url: String): String;
begin
  try
    FIdHTTP.Request.Method := 'GET';
    Result := FIdHTTP.Get(FURLBase+url);
  Except
   on e:Exception do
     raise Exception.Create(e.Message);
  end;
end;

function THTTPJSON.Post(json: String): String;
var SJson :TStringStream;
begin
  try
    FIdHTTP.Request.Method := 'POST';
    SJson  := TStringStream.Create(json,TEncoding.UTF8);
    result := FIdHTTP.POST(FURLBase+'produtos/', SJson);
  Except
   on e:Exception do
     raise Exception.Create(e.Message);
  end;
end;

end.
