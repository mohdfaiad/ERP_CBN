unit HTTPJSON;

interface

uses System.SysUtils, IdHTTP, REST.types, System.JSon, IdSSLOpenSSL, System.Classes, dialogs;

type
  THTTPJSON = class
  private
    FIdHTTP: TIdHTTP;
    FIdSSL: TIdSSLIOHandlerSocketOpenSSL;
    FURLBase :String;

  public
    function Put(url, json :String) :String;
    function Post(url,json :String) :String;
    function Get(url :String) :String;
  protected
    constructor Creat(urlBase :String);
  public
    property ClientHttp :TIdHTTP read FIdHTTP;

    constructor CreateEcommerce(tokenAcesso, urlBase: String);
    constructor CreateIntegracao(applicationToken, companyToken, urlBase :String);
  private
    destructor Destroy;override;
  end;

implementation

{ THTTPJSON }

constructor THTTPJSON.Creat(urlBase: String);
begin
   //Necessita das DLLs libeay32.dll e ssleay32.dll
   FURLBase := urlBase;
   FIdSSL   := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
   FIdHTTP  := TIdHTTP.Create(nil);
   FIdHTTP.IOHandler   := FIdSSL;
   FIdHTTP.Request.CustomHeaders.AddValue('Content-Type','application/json');
   FIdHTTP.Request.ContentType   := 'application/json';
   FIdHTTP.Request.CharSet       := 'utf-8';
   FIdHttp.Request.Accept        := 'application/json';
   FIdHTTP.HandleRedirects       := true;

   FIdHTTP.Response.CustomHeaders.AddValue('access-control-allow-origin','*');
   FIdHTTP.Response.CustomHeaders.AddValue('access-control-allow-Methods','PUT, POST, GET');
   FIdHTTP.Response.CustomHeaders.AddValue('access-control-allow-Headers','accept, authorization, origin');
end;

constructor THTTPJSON.CreateEcommerce(tokenAcesso, urlBase: String);
begin
   self.Creat(urlBase);
   FIdHTTP.Request.CustomHeaders.AddValue('Authorization','Token '+tokenAcesso);
end;

constructor THTTPJSON.CreateIntegracao(applicationToken, companyToken, urlBase: String);
begin
   self.Creat(urlBase);
   FIdHTTP.Request.CustomHeaders.AddValue('ApplicationToken', applicationToken);
   FIdHTTP.Request.CustomHeaders.AddValue('CompanyToken', companyToken);
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
   on e:EIdHTTPProtocolException do
     raise Exception.Create(e.ErrorMessage);
  end;
end;

function THTTPJSON.Post(url,json: String): String;
var SJson :TStringStream;
begin
  try
    FIdHTTP.Request.Method := 'POST';
    SJson  := TStringStream.Create(json,TEncoding.UTF8);
    result := FIdHTTP.POST(FURLBase+url, SJson);
  Except
   on e:EIdHTTPProtocolException do
     raise Exception.Create(e.ErrorMessage);
  end;
end;

function THTTPJSON.Put(url, json: String): String;
var SJson :TStringStream;
begin
  try
    FIdHTTP.Request.Method := 'PUT';
    SJson  := TStringStream.Create(json,TEncoding.UTF8);
    result := FIdHTTP.Put(FURLBase + url,  TStringStream.Create(json,TEncoding.UTF8));
  Except
   on e:EIdHTTPProtocolException do
     raise Exception.Create(e.ErrorMessage);
  end;
end;

end.
