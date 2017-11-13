unit RepositorioItemConta;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioItemConta = class(TRepositorio)

  protected
    function Get             (Dataset :TDataSet) :TObject; overload; override;
    function GetNomeDaTabela                     :String;            override;
    function GetIdentificador(Objeto :TObject)   :Variant;           override;
    function GetRepositorio                     :TRepositorio;       override;

  protected
    function SQLGet                      :String;            override;
    function SQLSalvar                   :String;            override;
    function CondicaoSQLGetAll           :String;            override;
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

uses SysUtils, ItemConta, StrUtils;

{ TRepositorioItemConta }

function TRepositorioItemConta.CondicaoSQLGetAll: String;
begin
  result := ' WHERE CODIGO_CONTA = '+FIdentificador;
end;

function TRepositorioItemConta.Get(Dataset: TDataSet): TObject;
var
  ItemConta :TItemConta;
begin
   ItemConta:= TItemConta.Create;
   ItemConta.codigo         := self.FQuery.FieldByName('codigo').AsInteger;
   ItemConta.codigo_conta   := self.FQuery.FieldByName('codigo_conta').AsInteger;
   ItemConta.codigo_materia := self.FQuery.FieldByName('codigo_materia').AsInteger;
   ItemConta.quantidade     := self.FQuery.FieldByName('quantidade').AsFloat;
   ItemConta.preco_custo    := self.FQuery.FieldByName('preco_custo').AsFloat;

   result := ItemConta;
end;

function TRepositorioItemConta.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TItemConta(Objeto).Codigo;
end;

function TRepositorioItemConta.GetNomeDaTabela: String;
begin
  result := 'ITENS_CONTA';
end;

function TRepositorioItemConta.GetRepositorio: TRepositorio;
begin
  result := TRepositorioItemConta.Create;
end;

function TRepositorioItemConta.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TItemConta(Objeto).Codigo <= 0);
end;

procedure TRepositorioItemConta.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  ItemContaAntigo :TItemConta;
  ItemContaNovo :TItemConta;
begin
   ItemContaAntigo := (AntigoObjeto as TItemConta);
   ItemContaNovo   := (Objeto       as TItemConta);

   if (ItemContaAntigo.codigo_conta <> ItemContaNovo.codigo_conta) then
     Auditoria.AdicionaCampoAlterado('codigo_conta', IntToStr(ItemContaAntigo.codigo_conta), IntToStr(ItemContaNovo.codigo_conta));

   if (ItemContaAntigo.codigo_materia <> ItemContaNovo.codigo_materia) then
     Auditoria.AdicionaCampoAlterado('codigo_materia', IntToStr(ItemContaAntigo.codigo_materia), IntToStr(ItemContaNovo.codigo_materia));

   if (ItemContaAntigo.quantidade <> ItemContaNovo.quantidade) then
     Auditoria.AdicionaCampoAlterado('quantidade', FloatToStr(ItemContaAntigo.quantidade), FloatToStr(ItemContaNovo.quantidade));

   if (ItemContaAntigo.preco_custo <> ItemContaNovo.preco_custo) then
     Auditoria.AdicionaCampoAlterado('preco_custo', FloatToStr(ItemContaAntigo.preco_custo), FloatToStr(ItemContaNovo.preco_custo));

end;

procedure TRepositorioItemConta.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  ItemConta :TItemConta;
begin
  ItemConta := (Objeto as TItemConta);
  Auditoria.AdicionaCampoExcluido('codigo'        , IntToStr(ItemConta.codigo));
  Auditoria.AdicionaCampoExcluido('codigo_conta'  , IntToStr(ItemConta.codigo_conta));
  Auditoria.AdicionaCampoExcluido('codigo_materia', IntToStr(ItemConta.codigo_materia));
  Auditoria.AdicionaCampoExcluido('quantidade'    , FloatToStr(ItemConta.quantidade));
  Auditoria.AdicionaCampoExcluido('preco_custo'   , FloatToStr(ItemConta.preco_custo));
end;

procedure TRepositorioItemConta.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  ItemConta :TItemConta;
begin
  ItemConta := (Objeto as TItemConta);
  Auditoria.AdicionaCampoIncluido('codigo'        ,    IntToStr(ItemConta.codigo));
  Auditoria.AdicionaCampoIncluido('codigo_conta'  ,    IntToStr(ItemConta.codigo_conta));
  Auditoria.AdicionaCampoIncluido('codigo_materia',    IntToStr(ItemConta.codigo_materia));
  Auditoria.AdicionaCampoIncluido('quantidade'    ,    FloatToStr(ItemConta.quantidade));
  Auditoria.AdicionaCampoIncluido('preco_custo'   ,    FloatToStr(ItemConta.preco_custo));
end;

procedure TRepositorioItemConta.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TItemConta(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioItemConta.SetParametros(Objeto: TObject);
var
  ItemConta :TItemConta;
begin
  ItemConta := (Objeto as TItemConta);

  self.FQuery.ParamByName('codigo').AsInteger         := ItemConta.codigo;
  self.FQuery.ParamByName('codigo_conta').AsInteger   := ItemConta.codigo_conta;
  self.FQuery.ParamByName('codigo_materia').AsInteger := ItemConta.codigo_materia;
  self.FQuery.ParamByName('quantidade').AsFloat       := ItemConta.quantidade;
  self.FQuery.ParamByName('preco_custo').AsFloat      := ItemConta.preco_custo;
end;

function TRepositorioItemConta.SQLGet: String;
begin
  result := 'select * from ITENS_CONTA where codigo = :ncod';
end;

function TRepositorioItemConta.SQLGetAll: String;
begin
  result := 'select * from ITENS_CONTA '+ IfThen(FIdentificador = '','', CondicaoSQLGetAll);
end;

function TRepositorioItemConta.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioItemConta.SQLRemover: String;
begin
  result := ' delete from ITENS_CONTA where codigo = :codigo ';
end;

function TRepositorioItemConta.SQLSalvar: String;
begin
  result := 'update or insert into ITENS_CONTA (CODIGO ,CODIGO_CONTA ,CODIGO_MATERIA ,QUANTIDADE, PRECO_CUSTO) '+
           '                      values ( :CODIGO , :CODIGO_CONTA , :CODIGO_MATERIA , :QUANTIDADE, :PRECO_CUSTO) ';
end;

end.

