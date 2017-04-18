unit RepositorioDevolucao;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioDevolucao = class(TRepositorio)

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

uses SysUtils, Devolucao;

{ TRepositorioDevolucao }

function TRepositorioDevolucao.Get(Dataset: TDataSet): TObject;
var
  Devolucao :TDevolucao;
begin
   Devolucao:= TDevolucao.Create;
   Devolucao.codigo        := self.FQuery.FieldByName('codigo').AsInteger;
   Devolucao.codigo_pedido := self.FQuery.FieldByName('codigo_pedido').AsInteger;
   Devolucao.data          := self.FQuery.FieldByName('data').AsDateTime;
   Devolucao.motivo        := self.FQuery.FieldByName('motivo').AsString;
   Devolucao.parcial_total := self.FQuery.FieldByName('parcial_total').AsString;

   result := Devolucao;
end;

function TRepositorioDevolucao.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TDevolucao(Objeto).Codigo;
end;

function TRepositorioDevolucao.GetNomeDaTabela: String;
begin
  result := 'DEVOLUCOES';
end;

function TRepositorioDevolucao.GetRepositorio: TRepositorio;
begin
  result := TRepositorioDevolucao.Create;
end;

function TRepositorioDevolucao.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TDevolucao(Objeto).Codigo <= 0);
end;

procedure TRepositorioDevolucao.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  DevolucaoAntigo :TDevolucao;
  DevolucaoNovo :TDevolucao;
begin
   DevolucaoAntigo := (AntigoObjeto as TDevolucao);
   DevolucaoNovo   := (Objeto       as TDevolucao);

   if (DevolucaoAntigo.codigo_pedido <> DevolucaoNovo.codigo_pedido) then
     Auditoria.AdicionaCampoAlterado('codigo_pedido', IntToStr(DevolucaoAntigo.codigo_pedido), IntToStr(DevolucaoNovo.codigo_pedido));

   if (DevolucaoAntigo.data <> DevolucaoNovo.data) then
     Auditoria.AdicionaCampoAlterado('data', DateTimeToStr(DevolucaoAntigo.data), DateTimeToStr(DevolucaoNovo.data));

   if (DevolucaoAntigo.motivo <> DevolucaoNovo.motivo) then
     Auditoria.AdicionaCampoAlterado('motivo', DevolucaoAntigo.motivo, DevolucaoNovo.motivo);

   if (DevolucaoAntigo.parcial_total <> DevolucaoNovo.parcial_total) then
     Auditoria.AdicionaCampoAlterado('parcial_total', DevolucaoAntigo.parcial_total, DevolucaoNovo.parcial_total);

end;

procedure TRepositorioDevolucao.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  Devolucao :TDevolucao;
begin
  Devolucao := (Objeto as TDevolucao);
  Auditoria.AdicionaCampoExcluido('codigo'       , IntToStr(Devolucao.codigo));
  Auditoria.AdicionaCampoExcluido('codigo_pedido', IntToStr(Devolucao.codigo_pedido));
  Auditoria.AdicionaCampoExcluido('data'         , DateTimeToStr(Devolucao.data));
  Auditoria.AdicionaCampoExcluido('motivo'       , Devolucao.motivo);
  Auditoria.AdicionaCampoExcluido('parcial_total', Devolucao.parcial_total);
end;

procedure TRepositorioDevolucao.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  Devolucao :TDevolucao;
begin
  Devolucao := (Objeto as TDevolucao);
  Auditoria.AdicionaCampoIncluido('codigo'       ,    IntToStr(Devolucao.codigo));
  Auditoria.AdicionaCampoIncluido('codigo_pedido',    IntToStr(Devolucao.codigo_pedido));
  Auditoria.AdicionaCampoIncluido('data'         ,    DateTimeToStr(Devolucao.data));
  Auditoria.AdicionaCampoIncluido('motivo'       ,    Devolucao.motivo);
  Auditoria.AdicionaCampoIncluido('parcial_total',    Devolucao.parcial_total);
end;

procedure TRepositorioDevolucao.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TDevolucao(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioDevolucao.SetParametros(Objeto: TObject);
var
  Devolucao :TDevolucao;
begin
  Devolucao := (Objeto as TDevolucao);

  self.FQuery.ParamByName('codigo').AsInteger        := Devolucao.codigo;
  self.FQuery.ParamByName('codigo_pedido').AsInteger := Devolucao.codigo_pedido;
  self.FQuery.ParamByName('data').AsDateTime          := Devolucao.data;
  self.FQuery.ParamByName('motivo').AsString        := Devolucao.motivo;
  self.FQuery.ParamByName('parcial_total').AsString := Devolucao.parcial_total;
end;

function TRepositorioDevolucao.SQLGet: String;
begin
  result := 'select * from DEVOLUCOES where codigo = :ncod';
end;

function TRepositorioDevolucao.SQLGetAll: String;
begin
  result := 'select * from DEVOLUCOES';
end;

function TRepositorioDevolucao.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from DEVOLUCOES where '+ campo +' = :ncampo';
end;

function TRepositorioDevolucao.SQLRemover: String;
begin
  result := ' delete from DEVOLUCOES where codigo = :codigo ';
end;

function TRepositorioDevolucao.SQLSalvar: String;
begin
  result := 'update or insert into DEVOLUCOES (CODIGO ,CODIGO_PEDIDO ,DATA ,MOTIVO ,PARCIAL_TOTAL) '+
           '                      values ( :CODIGO , :CODIGO_PEDIDO , :DATA , :MOTIVO , :PARCIAL_TOTAL) ';
end;

end.

