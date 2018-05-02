unit ClienteHttpMeusPedidos;

interface

uses HTTPJSON;

type
  TClienteHttpMeusPedidos = class(THTTPJSON)
  private
    function getIdResponse: String;
  public
    property IdResponse :String read getIdResponse;
  public
    constructor Create(applicationToken, companyToken, urlBase :String);
  end;

implementation

const
  NOME_ID_RESPOSTA = 'MeusPedidosID';

{ TClienteHttpMeusPedidos }

constructor TClienteHttpMeusPedidos.Create(applicationToken, companyToken, urlBase: String);
begin
  inherited Creat(urlBase);
  ClientHttp.Request.CustomHeaders.AddValue('ApplicationToken', applicationToken);
  ClientHttp.Request.CustomHeaders.AddValue('CompanyToken', companyToken);
end;

function TClienteHttpMeusPedidos.getIdResponse: String;
begin
  result := ClientHttp.Response.RawHeaders.Values[ NOME_ID_RESPOSTA ];
end;

end.
