unit RepositorioDirecionamentoEntrada;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioDirecionamentoEntrada = class(TRepositorio)

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

uses SysUtils, DirecionamentoEntrada;

{ TRepositorioDirecionamentoEntrada }

function TRepositorioDirecionamentoEntrada.Get(Dataset: TDataSet): TObject;
var
  DirecionamentoEntrada :TDirecionamentoEntrada;
begin
   DirecionamentoEntrada:= TDirecionamentoEntrada.Create;
   DirecionamentoEntrada.quantidade_conf := self.FQuery.FieldByName('quantidade_conf').AsFloat;
   DirecionamentoEntrada.codigo          := self.FQuery.FieldByName('codigo').AsInteger;
   DirecionamentoEntrada.codigo_entrada  := self.FQuery.FieldByName('codigo_entrada').AsInteger;
   DirecionamentoEntrada.codigo_pedido   := self.FQuery.FieldByName('codigo_pedido').AsInteger;
   DirecionamentoEntrada.quantidade      := self.FQuery.FieldByName('quantidade').AsFloat;
   DirecionamentoEntrada.conferido       := self.FQuery.FieldByName('conferido').AsString;

   result := DirecionamentoEntrada;
end;

function TRepositorioDirecionamentoEntrada.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TDirecionamentoEntrada(Objeto).Codigo;
end;

function TRepositorioDirecionamentoEntrada.GetNomeDaTabela: String;
begin
  result := 'DIRECIONAMENTO_ENTRADA';
end;

function TRepositorioDirecionamentoEntrada.GetRepositorio: TRepositorio;
begin
  result := TRepositorioDirecionamentoEntrada.Create;
end;

function TRepositorioDirecionamentoEntrada.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TDirecionamentoEntrada(Objeto).Codigo <= 0);
end;

procedure TRepositorioDirecionamentoEntrada.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  DirecionamentoEntradaAntigo :TDirecionamentoEntrada;
  DirecionamentoEntradaNovo :TDirecionamentoEntrada;
begin
   DirecionamentoEntradaAntigo := (AntigoObjeto as TDirecionamentoEntrada);
   DirecionamentoEntradaNovo   := (Objeto       as TDirecionamentoEntrada);

   if (DirecionamentoEntradaAntigo.codigo <> DirecionamentoEntradaNovo.codigo) then
     Auditoria.AdicionaCampoAlterado('codigo', IntToStr(DirecionamentoEntradaAntigo.codigo), IntToStr(DirecionamentoEntradaNovo.codigo));

   if (DirecionamentoEntradaAntigo.codigo_entrada <> DirecionamentoEntradaNovo.codigo_entrada) then
     Auditoria.AdicionaCampoAlterado('codigo_entrada', IntToStr(DirecionamentoEntradaAntigo.codigo_entrada), IntToStr(DirecionamentoEntradaNovo.codigo_entrada));

   if (DirecionamentoEntradaAntigo.codigo_pedido <> DirecionamentoEntradaNovo.codigo_pedido) then
     Auditoria.AdicionaCampoAlterado('codigo_pedido', IntToStr(DirecionamentoEntradaAntigo.codigo_pedido), IntToStr(DirecionamentoEntradaNovo.codigo_pedido));

   if (DirecionamentoEntradaAntigo.quantidade <> DirecionamentoEntradaNovo.quantidade) then
     Auditoria.AdicionaCampoAlterado('quantidade', FloatToStr(DirecionamentoEntradaAntigo.quantidade), FloatToStr(DirecionamentoEntradaNovo.quantidade));

   if (DirecionamentoEntradaAntigo.conferido <> DirecionamentoEntradaNovo.conferido) then
     Auditoria.AdicionaCampoAlterado('conferido', DirecionamentoEntradaAntigo.conferido, DirecionamentoEntradaNovo.conferido);

end;

procedure TRepositorioDirecionamentoEntrada.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  DirecionamentoEntrada :TDirecionamentoEntrada;
begin
  DirecionamentoEntrada := (Objeto as TDirecionamentoEntrada);
  Auditoria.AdicionaCampoExcluido('quantidade_conf', FloatToStr(DirecionamentoEntrada.quantidade_conf));
  Auditoria.AdicionaCampoExcluido('codigo'         , IntToStr(DirecionamentoEntrada.codigo));
  Auditoria.AdicionaCampoExcluido('codigo_entrada' , IntToStr(DirecionamentoEntrada.codigo_entrada));
  Auditoria.AdicionaCampoExcluido('codigo_pedido'  , IntToStr(DirecionamentoEntrada.codigo_pedido));
  Auditoria.AdicionaCampoExcluido('quantidade'     , FloatToStr(DirecionamentoEntrada.quantidade));
  Auditoria.AdicionaCampoExcluido('conferido'      , DirecionamentoEntrada.conferido);
end;

procedure TRepositorioDirecionamentoEntrada.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  DirecionamentoEntrada :TDirecionamentoEntrada;
begin
  DirecionamentoEntrada := (Objeto as TDirecionamentoEntrada);
  Auditoria.AdicionaCampoIncluido('quantidade_conf',    FloatToStr(DirecionamentoEntrada.quantidade_conf));
  Auditoria.AdicionaCampoIncluido('codigo'         ,    IntToStr(DirecionamentoEntrada.codigo));
  Auditoria.AdicionaCampoIncluido('codigo_entrada' ,    IntToStr(DirecionamentoEntrada.codigo_entrada));
  Auditoria.AdicionaCampoIncluido('codigo_pedido'  ,    IntToStr(DirecionamentoEntrada.codigo_pedido));
  Auditoria.AdicionaCampoIncluido('quantidade'     ,    FloatToStr(DirecionamentoEntrada.quantidade));
  Auditoria.AdicionaCampoIncluido('conferido'      ,    DirecionamentoEntrada.conferido);
end;

procedure TRepositorioDirecionamentoEntrada.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TDirecionamentoEntrada(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioDirecionamentoEntrada.SetParametros(Objeto: TObject);
var
  DirecionamentoEntrada :TDirecionamentoEntrada;
begin
  DirecionamentoEntrada := (Objeto as TDirecionamentoEntrada);

  self.FQuery.ParamByName('quantidade_conf').AsFloat := DirecionamentoEntrada.quantidade_conf;
  self.FQuery.ParamByName('codigo').AsInteger          := DirecionamentoEntrada.codigo;
  self.FQuery.ParamByName('codigo_entrada').AsInteger  := DirecionamentoEntrada.codigo_entrada;
  self.FQuery.ParamByName('codigo_pedido').AsInteger   := DirecionamentoEntrada.codigo_pedido;
  self.FQuery.ParamByName('quantidade').AsFloat      := DirecionamentoEntrada.quantidade;
  self.FQuery.ParamByName('conferido').AsString       := DirecionamentoEntrada.conferido;
end;

function TRepositorioDirecionamentoEntrada.SQLGet: String;
begin
  result := 'select * from DIRECIONAMENTO_ENTRADA where codigo = :ncod';
end;

function TRepositorioDirecionamentoEntrada.SQLGetAll: String;
begin
  result := 'select * from DIRECIONAMENTO_ENTRADA';
end;

function TRepositorioDirecionamentoEntrada.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from DIRECIONAMENTO_ENTRADA where '+ campo +' = :ncampo';
end;

function TRepositorioDirecionamentoEntrada.SQLRemover: String;
begin
  result := ' delete from DIRECIONAMENTO_ENTRADA where codigo = :codigo ';
end;

function TRepositorioDirecionamentoEntrada.SQLSalvar: String;
begin
  result := 'update or insert into DIRECIONAMENTO_ENTRADA (QUANTIDADE_CONF ,CODIGO ,CODIGO_ENTRADA ,CODIGO_PEDIDO ,QUANTIDADE ,CONFERIDO) '+
           '                      values ( :QUANTIDADE_CONF , :CODIGO , :CODIGO_ENTRADA , :CODIGO_PEDIDO , :QUANTIDADE , :CONFERIDO) ';
end;

end.

