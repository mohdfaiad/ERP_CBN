unit RepositoriocaixaPedido;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositoriocaixaPedido = class(TRepositorio)

  protected
    function Get             (Dataset :TDataSet) :TObject; overload; override;
    function GetNomeDaTabela                     :String;            override;
    function GetIdentificador(Objeto :TObject)   :Variant;           override;
    function GetRepositorio                     :TRepositorio;       override;

  protected
    function SQLGet                      :String;            override;
    function SQLSalvar                   :String;            override;
    function SQLGetAll                   :String;            override;
    function CondicaoSQLGetAll           :String;            override;
    function SQLRemover                  :String;            override;
    function SQLGetExiste(arrayDeCampos :array of string): String;            override;

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

uses SysUtils, caixaPedido, System.StrUtils;

{ TRepositoriocaixaPedido }

function TRepositoriocaixaPedido.CondicaoSQLGetAll: String;
begin
  result := ' WHERE CODIGO_CONFERENCIA = '+FIdentificador;
end;

function TRepositoriocaixaPedido.Get(Dataset: TDataSet): TObject;
var
  caixaPedido :TcaixaPedido;
begin
   caixaPedido:= TcaixaPedido.Create;
   caixaPedido.codigo             := self.FQuery.FieldByName('codigo').AsInteger;
   caixaPedido.numero             := self.FQuery.FieldByName('numero').AsInteger;
   caixaPedido.codigo_materia     := self.FQuery.FieldByName('codigo_materia').AsInteger;
   caixaPedido.codigo_conferencia := self.FQuery.FieldByName('codigo_conferencia').AsInteger;
   caixaPedido.baixou_estoque     := self.FQuery.FieldByName('baixou_estoque').AsString;

   result := caixaPedido;
end;

function TRepositoriocaixaPedido.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TcaixaPedido(Objeto).Codigo;
end;

function TRepositoriocaixaPedido.GetNomeDaTabela: String;
begin
  result := 'CAIXAS_PEDIDO';
end;

function TRepositoriocaixaPedido.GetRepositorio: TRepositorio;
begin
  result := TRepositoriocaixaPedido.Create;
end;

function TRepositoriocaixaPedido.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TcaixaPedido(Objeto).Codigo <= 0);
end;

procedure TRepositoriocaixaPedido.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  caixaPedidoAntigo :TcaixaPedido;
  caixaPedidoNovo :TcaixaPedido;
begin
   caixaPedidoAntigo := (AntigoObjeto as TcaixaPedido);
   caixaPedidoNovo   := (Objeto       as TcaixaPedido);

   if (caixaPedidoAntigo.numero <> caixaPedidoNovo.numero) then
     Auditoria.AdicionaCampoAlterado('numero', IntToStr(caixaPedidoAntigo.numero), IntToStr(caixaPedidoNovo.numero));

   if (caixaPedidoAntigo.codigo_materia <> caixaPedidoNovo.codigo_materia) then
     Auditoria.AdicionaCampoAlterado('codigo_materia', IntToStr(caixaPedidoAntigo.codigo_materia), IntToStr(caixaPedidoNovo.codigo_materia));

   if (caixaPedidoAntigo.codigo_conferencia <> caixaPedidoNovo.codigo_conferencia) then
     Auditoria.AdicionaCampoAlterado('codigo_conferencia', IntToStr(caixaPedidoAntigo.codigo_conferencia), IntToStr(caixaPedidoNovo.codigo_conferencia));

   if (caixaPedidoAntigo.baixou_estoque <> caixaPedidoNovo.baixou_estoque) then
     Auditoria.AdicionaCampoAlterado('baixou_estoque', caixaPedidoAntigo.baixou_estoque, caixaPedidoNovo.baixou_estoque);
end;

procedure TRepositoriocaixaPedido.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  caixaPedido :TcaixaPedido;
begin
  caixaPedido := (Objeto as TcaixaPedido);
  Auditoria.AdicionaCampoExcluido('codigo'            , IntToStr(caixaPedido.codigo));
  Auditoria.AdicionaCampoExcluido('numero'            , IntToStr(caixaPedido.numero));
  Auditoria.AdicionaCampoExcluido('codigo_materia'    , IntToStr(caixaPedido.codigo_materia));
  Auditoria.AdicionaCampoExcluido('codigo_conferencia', IntToStr(caixaPedido.codigo_conferencia));
  Auditoria.AdicionaCampoExcluido('baixou_estoque'    , caixaPedido.baixou_estoque);
end;

procedure TRepositoriocaixaPedido.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  caixaPedido :TcaixaPedido;
begin
  caixaPedido := (Objeto as TcaixaPedido);
  Auditoria.AdicionaCampoIncluido('codigo'            ,    IntToStr(caixaPedido.codigo));
  Auditoria.AdicionaCampoIncluido('numero'            ,    IntToStr(caixaPedido.numero));
  Auditoria.AdicionaCampoIncluido('codigo_materia'    ,    IntToStr(caixaPedido.codigo_materia));
  Auditoria.AdicionaCampoIncluido('codigo_conferencia',    IntToStr(caixaPedido.codigo_conferencia));
  Auditoria.AdicionaCampoIncluido('baixou_estoque'    ,     caixaPedido.baixou_estoque);
end;

procedure TRepositoriocaixaPedido.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TcaixaPedido(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositoriocaixaPedido.SetParametros(Objeto: TObject);
var
  caixaPedido :TcaixaPedido;
begin
  caixaPedido := (Objeto as TcaixaPedido);

  self.FQuery.ParamByName('codigo').AsInteger             := caixaPedido.codigo;
  self.FQuery.ParamByName('numero').AsInteger             := caixaPedido.numero;
  self.FQuery.ParamByName('codigo_materia').AsInteger     := caixaPedido.codigo_materia;
  self.FQuery.ParamByName('codigo_conferencia').AsInteger := caixaPedido.codigo_conferencia;
  self.FQuery.ParamByName('baixou_estoque').AsString      := caixaPedido.baixou_estoque;
end;

function TRepositoriocaixaPedido.SQLGet: String;
begin
  result := 'select * from CAIXAS_PEDIDO where codigo = :ncod';
end;

function TRepositoriocaixaPedido.SQLGetAll: String;
begin
  result := 'select * from CAIXAS_PEDIDO '+ IfThen(FIdentificador = '','', CondicaoSQLGetAll);
end;

function TRepositoriocaixaPedido.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositoriocaixaPedido.SQLRemover: String;
begin
  result := ' delete from CAIXAS_PEDIDO where codigo = :codigo ';
end;

function TRepositoriocaixaPedido.SQLSalvar: String;
begin
  result := 'update or insert into CAIXAS_PEDIDO (CODIGO ,NUMERO ,CODIGO_MATERIA ,CODIGO_CONFERENCIA, BAIXOU_ESTOQUE) '+
           '                      values ( :CODIGO , :NUMERO , :CODIGO_MATERIA , :CODIGO_CONFERENCIA, :BAIXOU_ESTOQUE) ';
end;

end.

