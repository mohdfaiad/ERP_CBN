unit RepositorioPedidoMapa;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioPedidoMapa = class(TRepositorio)

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
    function SQLGetExiste(campo: String): String;            override;

  protected
    function IsInsercao(Objeto :TObject) :Boolean;           override;
  protected
    procedure SetParametros   (Objeto :TObject                        ); override;
    procedure SetIdentificador(Objeto :TObject; Identificador :Variant); override;

  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
end;

implementation

uses SysUtils, PedidoMapa;

{ TRepositorioPedidoMapa }

function TRepositorioPedidoMapa.Get(Dataset: TDataSet): TObject;
var
  PedidoMapa :TPedidoMapa;
begin
   PedidoMapa:= TPedidoMapa.Create;
   PedidoMapa.codigo        := self.FQuery.FieldByName('codigo').AsInteger;
   PedidoMapa.codigo_mapa   := self.FQuery.FieldByName('codigo_mapa').AsInteger;
   PedidoMapa.codigo_pedido := self.FQuery.FieldByName('codigo_pedido').AsInteger;
   PedidoMapa.peso          := self.FQuery.FieldByName('peso').AsInteger;

   result := PedidoMapa;
end;

function TRepositorioPedidoMapa.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TPedidoMapa(Objeto).Codigo;
end;

function TRepositorioPedidoMapa.GetNomeDaTabela: String;
begin
  result := 'PEDIDOS_MAPA';
end;

function TRepositorioPedidoMapa.GetRepositorio: TRepositorio;
begin
  result := TRepositorioPedidoMapa.Create;
end;

function TRepositorioPedidoMapa.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TPedidoMapa(Objeto).Codigo <= 0);
end;

procedure TRepositorioPedidoMapa.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  PedidoMapaAntigo :TPedidoMapa;
  PedidoMapaNovo :TPedidoMapa;
begin
   PedidoMapaAntigo := (AntigoObjeto as TPedidoMapa);
   PedidoMapaNovo   := (Objeto       as TPedidoMapa);

   if (PedidoMapaAntigo.codigo_mapa <> PedidoMapaNovo.codigo_mapa) then
     Auditoria.AdicionaCampoAlterado('codigo_mapa', IntToStr(PedidoMapaAntigo.codigo_mapa), IntToStr(PedidoMapaNovo.codigo_mapa));

   if (PedidoMapaAntigo.codigo_pedido <> PedidoMapaNovo.codigo_pedido) then
     Auditoria.AdicionaCampoAlterado('codigo_pedido', IntToStr(PedidoMapaAntigo.codigo_pedido), IntToStr(PedidoMapaNovo.codigo_pedido));

   if (PedidoMapaAntigo.peso <> PedidoMapaNovo.peso) then
     Auditoria.AdicionaCampoAlterado('peso', IntToStr(PedidoMapaAntigo.peso), IntToStr(PedidoMapaNovo.peso));
end;

procedure TRepositorioPedidoMapa.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  PedidoMapa :TPedidoMapa;
begin
  PedidoMapa := (Objeto as TPedidoMapa);
  Auditoria.AdicionaCampoExcluido('codigo'       , IntToStr(PedidoMapa.codigo));
  Auditoria.AdicionaCampoExcluido('codigo_mapa'  , IntToStr(PedidoMapa.codigo_mapa));
  Auditoria.AdicionaCampoExcluido('codigo_pedido', IntToStr(PedidoMapa.codigo_pedido));
  Auditoria.AdicionaCampoExcluido('peso'         , IntToStr(PedidoMapa.peso));
end;

procedure TRepositorioPedidoMapa.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  PedidoMapa :TPedidoMapa;
begin
  PedidoMapa := (Objeto as TPedidoMapa);
  Auditoria.AdicionaCampoIncluido('codigo'       ,  IntToStr(PedidoMapa.codigo));
  Auditoria.AdicionaCampoIncluido('codigo_mapa'  ,  IntToStr(PedidoMapa.codigo_mapa));
  Auditoria.AdicionaCampoIncluido('codigo_pedido',  IntToStr(PedidoMapa.codigo_pedido));
  Auditoria.AdicionaCampoIncluido('peso'         ,  IntToStr(PedidoMapa.peso));
end;

procedure TRepositorioPedidoMapa.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TPedidoMapa(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioPedidoMapa.SetParametros(Objeto: TObject);
var
  PedidoMapa :TPedidoMapa;
begin
  PedidoMapa := (Objeto as TPedidoMapa);

  self.FQuery.ParamByName('codigo').AsInteger        := PedidoMapa.codigo;
  self.FQuery.ParamByName('codigo_mapa').AsInteger   := PedidoMapa.codigo_mapa;
  self.FQuery.ParamByName('codigo_pedido').AsInteger := PedidoMapa.codigo_pedido;
  self.FQuery.ParamByName('peso').AsInteger          := PedidoMapa.peso;
end;

function TRepositorioPedidoMapa.SQLGet: String;
begin
  result := 'select * from PEDIDOS_MAPA where codigo = :ncod';
end;

function TRepositorioPedidoMapa.SQLGetAll: String;
begin
  result := 'select * from PEDIDOS_MAPA';
end;

function TRepositorioPedidoMapa.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from PEDIDOS_MAPA where '+ campo +' = :ncampo';
end;

function TRepositorioPedidoMapa.SQLRemover: String;
begin
  result := ' delete from PEDIDOS_MAPA where codigo = :codigo ';
end;

function TRepositorioPedidoMapa.SQLSalvar: String;
begin
  result := 'update or insert into PEDIDOS_MAPA (CODIGO ,CODIGO_MAPA ,CODIGO_PEDIDO, PESO) '+
           '                      values ( :CODIGO , :CODIGO_MAPA , :CODIGO_PEDIDO, :PESO) ';
end;

end.

