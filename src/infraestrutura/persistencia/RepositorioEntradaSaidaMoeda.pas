unit RepositorioEntradaSaidaMoeda;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioEntradaSaidaMoeda = class(TRepositorio)

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

uses SysUtils, EntradaSaidaMoeda;

{ TRepositorioEntradaSaidaMoeda }

function TRepositorioEntradaSaidaMoeda.Get(Dataset: TDataSet): TObject;
var
  EntradaSaidaMoeda :TEntradaSaidaMoeda;
begin
   EntradaSaidaMoeda:= TEntradaSaidaMoeda.Create;
   EntradaSaidaMoeda.codigo       := self.FQuery.FieldByName('codigo').AsInteger;
   EntradaSaidaMoeda.codigo_caixa := self.FQuery.FieldByName('codigo_caixa').AsInteger;
   EntradaSaidaMoeda.tipo         := self.FQuery.FieldByName('tipo').AsString;
   EntradaSaidaMoeda.valor        := self.FQuery.FieldByName('valor').AsFloat;
   EntradaSaidaMoeda.descricao    := self.FQuery.FieldByName('descricao').AsString;
   EntradaSaidaMoeda.hora         := self.FQuery.FieldByName('hora').AsDateTime;
   EntradaSaidaMoeda.tipo_moeda   := self.FQuery.FieldByName('tipo_moeda').AsInteger;

   result := EntradaSaidaMoeda;
end;

function TRepositorioEntradaSaidaMoeda.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TEntradaSaidaMoeda(Objeto).Codigo;
end;

function TRepositorioEntradaSaidaMoeda.GetNomeDaTabela: String;
begin
  result := 'ENTRADA_SAIDA_MOEDA';
end;

function TRepositorioEntradaSaidaMoeda.GetRepositorio: TRepositorio;
begin
  result := TRepositorioEntradaSaidaMoeda.Create;
end;

function TRepositorioEntradaSaidaMoeda.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TEntradaSaidaMoeda(Objeto).Codigo <= 0);
end;

procedure TRepositorioEntradaSaidaMoeda.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  EntradaSaidaMoedaAntigo :TEntradaSaidaMoeda;
  EntradaSaidaMoedaNovo :TEntradaSaidaMoeda;
begin
   EntradaSaidaMoedaAntigo := (AntigoObjeto as TEntradaSaidaMoeda);
   EntradaSaidaMoedaNovo   := (Objeto       as TEntradaSaidaMoeda);

   if (EntradaSaidaMoedaAntigo.codigo_caixa <> EntradaSaidaMoedaNovo.codigo_caixa) then
     Auditoria.AdicionaCampoAlterado('codigo_caixa', IntToStr(EntradaSaidaMoedaAntigo.codigo_caixa), IntToStr(EntradaSaidaMoedaNovo.codigo_caixa));

   if (EntradaSaidaMoedaAntigo.tipo <> EntradaSaidaMoedaNovo.tipo) then
     Auditoria.AdicionaCampoAlterado('tipo', EntradaSaidaMoedaAntigo.tipo, EntradaSaidaMoedaNovo.tipo);

   if (EntradaSaidaMoedaAntigo.valor <> EntradaSaidaMoedaNovo.valor) then
     Auditoria.AdicionaCampoAlterado('valor', FloatToStr(EntradaSaidaMoedaAntigo.valor), FloatToStr(EntradaSaidaMoedaNovo.valor));

   if (EntradaSaidaMoedaAntigo.descricao <> EntradaSaidaMoedaNovo.descricao) then
     Auditoria.AdicionaCampoAlterado('descricao', EntradaSaidaMoedaAntigo.descricao, EntradaSaidaMoedaNovo.descricao);

   if (EntradaSaidaMoedaAntigo.hora <> EntradaSaidaMoedaNovo.hora) then
     Auditoria.AdicionaCampoAlterado('hora', DateTimeToStr(EntradaSaidaMoedaAntigo.hora), DateTimeToStr(EntradaSaidaMoedaNovo.hora));

   if (EntradaSaidaMoedaAntigo.tipo_moeda <> EntradaSaidaMoedaNovo.tipo_moeda) then
     Auditoria.AdicionaCampoAlterado('descricao', IntToStr(EntradaSaidaMoedaAntigo.tipo_moeda), IntToStr(EntradaSaidaMoedaNovo.tipo_moeda));
end;

procedure TRepositorioEntradaSaidaMoeda.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  EntradaSaidaMoeda :TEntradaSaidaMoeda;
begin
  EntradaSaidaMoeda := (Objeto as TEntradaSaidaMoeda);
  Auditoria.AdicionaCampoExcluido('codigo'      , IntToStr(EntradaSaidaMoeda.codigo));
  Auditoria.AdicionaCampoExcluido('codigo_caixa', IntToStr(EntradaSaidaMoeda.codigo_caixa));
  Auditoria.AdicionaCampoExcluido('tipo'        , EntradaSaidaMoeda.tipo);
  Auditoria.AdicionaCampoExcluido('valor'       , FloatToStr(EntradaSaidaMoeda.valor));
  Auditoria.AdicionaCampoExcluido('descricao'   , EntradaSaidaMoeda.descricao);
  Auditoria.AdicionaCampoExcluido('hora'        , DateTimeToStr(EntradaSaidaMoeda.hora));
  Auditoria.AdicionaCampoExcluido('tipo_moeda'  , IntToStr(EntradaSaidaMoeda.tipo_moeda));
end;

procedure TRepositorioEntradaSaidaMoeda.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  EntradaSaidaMoeda :TEntradaSaidaMoeda;
begin
  EntradaSaidaMoeda := (Objeto as TEntradaSaidaMoeda);
  Auditoria.AdicionaCampoIncluido('codigo'      ,    IntToStr(EntradaSaidaMoeda.codigo));
  Auditoria.AdicionaCampoIncluido('codigo_caixa',    IntToStr(EntradaSaidaMoeda.codigo_caixa));
  Auditoria.AdicionaCampoIncluido('tipo'        ,    EntradaSaidaMoeda.tipo);
  Auditoria.AdicionaCampoIncluido('valor'       ,    FloatToStr(EntradaSaidaMoeda.valor));
  Auditoria.AdicionaCampoIncluido('descricao'   ,    EntradaSaidaMoeda.descricao);
  Auditoria.AdicionaCampoIncluido('hora'        ,    DateTimeToStr(EntradaSaidaMoeda.hora));
  Auditoria.AdicionaCampoIncluido('tipo_moeda'  , IntToStr(EntradaSaidaMoeda.tipo_moeda));
end;

procedure TRepositorioEntradaSaidaMoeda.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TEntradaSaidaMoeda(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioEntradaSaidaMoeda.SetParametros(Objeto: TObject);
var
  EntradaSaidaMoeda :TEntradaSaidaMoeda;
begin
  EntradaSaidaMoeda := (Objeto as TEntradaSaidaMoeda);

  self.FQuery.ParamByName('codigo').AsInteger       := EntradaSaidaMoeda.codigo;
  self.FQuery.ParamByName('codigo_caixa').AsInteger := EntradaSaidaMoeda.codigo_caixa;
  self.FQuery.ParamByName('tipo').AsString         := EntradaSaidaMoeda.tipo;
  self.FQuery.ParamByName('valor').AsFloat        := EntradaSaidaMoeda.valor;
  self.FQuery.ParamByName('descricao').AsString    := EntradaSaidaMoeda.descricao;
  self.FQuery.ParamByName('hora').AsDateTime         := EntradaSaidaMoeda.hora;
  self.FQuery.ParamByName('tipo_moeda').AsInteger    := EntradaSaidaMoeda.tipo_moeda;
end;

function TRepositorioEntradaSaidaMoeda.SQLGet: String;
begin
  result := 'select * from ENTRADA_SAIDA_MOEDA where codigo = :ncod';
end;

function TRepositorioEntradaSaidaMoeda.SQLGetAll: String;
begin
  result := 'select * from ENTRADA_SAIDA_MOEDA';
end;

function TRepositorioEntradaSaidaMoeda.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from ENTRADA_SAIDA_MOEDA where '+ campo +' = :ncampo';
end;

function TRepositorioEntradaSaidaMoeda.SQLRemover: String;
begin
  result := ' delete from ENTRADA_SAIDA_MOEDA where codigo = :codigo ';
end;

function TRepositorioEntradaSaidaMoeda.SQLSalvar: String;
begin
  result := 'update or insert into ENTRADA_SAIDA_MOEDA (CODIGO ,CODIGO_CAIXA ,TIPO ,VALOR ,DESCRICAO ,HORA, TIPO_MOEDA) '+
           '                      values ( :CODIGO , :CODIGO_CAIXA , :TIPO , :VALOR , :DESCRICAO , :HORA, :TIPO_MOEDA) ';
end;

end.

