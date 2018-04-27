unit RepositorioLogErroImportPedido;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioLogErroImportPedido = class(TRepositorio)

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

uses SysUtils, LogErroImportPedido, System.StrUtils;

{ TRepositorioLogErroImportPedido }

function TRepositorioLogErroImportPedido.Get(Dataset: TDataSet): TObject;
var
  LogErroImportPedido :TLogErroImportPedido;
begin
   LogErroImportPedido:= TLogErroImportPedido.Create;
   LogErroImportPedido.codigo     := self.FQuery.FieldByName('codigo').AsInteger;
   LogErroImportPedido.erro       := self.FQuery.FieldByName('erro').AsString;
   LogErroImportPedido.data       := self.FQuery.FieldByName('data').AsDateTime;
   LogErroImportPedido.hora       := self.FQuery.FieldByName('hora').AsDateTime;
   LogErroImportPedido.verificado := (self.FQuery.FieldByName('verificado').AsString = 'S');
   LogErroImportPedido.importador := self.FQuery.FieldByName('importador').AsString;

   result := LogErroImportPedido;
end;

function TRepositorioLogErroImportPedido.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TLogErroImportPedido(Objeto).Codigo;
end;

function TRepositorioLogErroImportPedido.GetNomeDaTabela: String;
begin
  result := 'LOG_ERROS_IMPORT_PEDIDOS';
end;

function TRepositorioLogErroImportPedido.GetRepositorio: TRepositorio;
begin
  result := TRepositorioLogErroImportPedido.Create;
end;

function TRepositorioLogErroImportPedido.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TLogErroImportPedido(Objeto).Codigo <= 0);
end;

procedure TRepositorioLogErroImportPedido.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  LogErroImportPedidoAntigo :TLogErroImportPedido;
  LogErroImportPedidoNovo :TLogErroImportPedido;
begin
   LogErroImportPedidoAntigo := (AntigoObjeto as TLogErroImportPedido);
   LogErroImportPedidoNovo   := (Objeto       as TLogErroImportPedido);

   if (LogErroImportPedidoAntigo.erro <> LogErroImportPedidoNovo.erro) then
     Auditoria.AdicionaCampoAlterado('erro', LogErroImportPedidoAntigo.erro, LogErroImportPedidoNovo.erro);

   if (LogErroImportPedidoAntigo.data <> LogErroImportPedidoNovo.data) then
     Auditoria.AdicionaCampoAlterado('data', DateTimeToStr(LogErroImportPedidoAntigo.data), DateTimeToStr(LogErroImportPedidoNovo.data));

   if (LogErroImportPedidoAntigo.hora <> LogErroImportPedidoNovo.hora) then
     Auditoria.AdicionaCampoAlterado('hora', DateTimeToStr(LogErroImportPedidoAntigo.hora), DateTimeToStr(LogErroImportPedidoNovo.hora));

   if (LogErroImportPedidoAntigo.verificado <> LogErroImportPedidoNovo.verificado) then
     Auditoria.AdicionaCampoAlterado('verificado', IfThen(LogErroImportPedidoAntigo.verificado,'S','N'), IfThen(LogErroImportPedidoNovo.verificado,'S','N'));

   if (LogErroImportPedidoAntigo.importador <> LogErroImportPedidoNovo.importador) then
     Auditoria.AdicionaCampoAlterado('importador', LogErroImportPedidoAntigo.importador, LogErroImportPedidoNovo.importador);
end;

procedure TRepositorioLogErroImportPedido.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  LogErroImportPedido :TLogErroImportPedido;
begin
  LogErroImportPedido := (Objeto as TLogErroImportPedido);
  Auditoria.AdicionaCampoExcluido('codigo'    , IntToStr(LogErroImportPedido.codigo));
  Auditoria.AdicionaCampoExcluido('erro'      , LogErroImportPedido.erro);
  Auditoria.AdicionaCampoExcluido('data'      , DateTimeToStr(LogErroImportPedido.data));
  Auditoria.AdicionaCampoExcluido('hora'      , DateTimeToStr(LogErroImportPedido.hora));
  Auditoria.AdicionaCampoExcluido('verificado', IfThen(LogErroImportPedido.verificado, 'S', 'N'));
  Auditoria.AdicionaCampoExcluido('importador', LogErroImportPedido.importador);
end;

procedure TRepositorioLogErroImportPedido.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  LogErroImportPedido :TLogErroImportPedido;
begin
  LogErroImportPedido := (Objeto as TLogErroImportPedido);
  Auditoria.AdicionaCampoIncluido('codigo'    , IntToStr(LogErroImportPedido.codigo));
  Auditoria.AdicionaCampoIncluido('erro'      , LogErroImportPedido.erro);
  Auditoria.AdicionaCampoIncluido('data'      , DateTimeToStr(LogErroImportPedido.data));
  Auditoria.AdicionaCampoIncluido('hora'      , DateTimeToStr(LogErroImportPedido.hora));
  Auditoria.AdicionaCampoIncluido('verificado', IfThen(LogErroImportPedido.verificado, 'S', 'N'));
  Auditoria.AdicionaCampoIncluido('importador', LogErroImportPedido.importador);
end;

procedure TRepositorioLogErroImportPedido.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TLogErroImportPedido(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioLogErroImportPedido.SetParametros(Objeto: TObject);
var
  LogErroImportPedido :TLogErroImportPedido;
begin
  LogErroImportPedido := (Objeto as TLogErroImportPedido);

  self.FQuery.ParamByName('codigo').AsInteger      := LogErroImportPedido.codigo;
  self.FQuery.ParamByName('erro').AsString         := LogErroImportPedido.erro;
  self.FQuery.ParamByName('data').AsDateTime       := LogErroImportPedido.data;
  self.FQuery.ParamByName('hora').AsDateTime       := LogErroImportPedido.hora;
  self.FQuery.ParamByName('verificado').AsString   := IfThen(LogErroImportPedido.verificado, 'S', 'N');
  self.FQuery.ParamByName('importador').AsString   := LogErroImportPedido.importador;
end;

function TRepositorioLogErroImportPedido.SQLGet: String;
begin
  result := 'select * from LOG_ERROS_IMPORT_PEDIDOS where codigo = :ncod';
end;

function TRepositorioLogErroImportPedido.SQLGetAll: String;
begin
  result := 'select * from LOG_ERROS_IMPORT_PEDIDOS';
end;

function TRepositorioLogErroImportPedido.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), self.GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioLogErroImportPedido.SQLRemover: String;
begin
  result := ' delete from LOG_ERROS_IMPORT_PEDIDOS where codigo = :codigo ';
end;

function TRepositorioLogErroImportPedido.SQLSalvar: String;
begin
  result := 'update or insert into LOG_ERROS_IMPORT_PEDIDOS (CODIGO ,ERRO ,DATA ,HORA ,VERIFICADO, IMPORTADOR) '+
           '                      values ( :CODIGO , :ERRO , :DATA , :HORA , :VERIFICADO, :IMPORTADOR) ';
end;

end.

