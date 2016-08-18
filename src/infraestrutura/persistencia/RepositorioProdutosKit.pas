unit RepositorioProdutosKit;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioProdutosKit = class(TRepositorio)

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

uses SysUtils, ProdutosKit, StrUtils;

{ TRepositorioProdutosKit }

function TRepositorioProdutosKit.CondicaoSQLGetAll: String;
begin
  result := ' WHERE CODIGO_KIT = '+FIdentificador;
end;

function TRepositorioProdutosKit.Get(Dataset: TDataSet): TObject;
var
  ProdutosKit :TProdutosKit;
begin
   ProdutosKit:= TProdutosKit.Create;
   ProdutosKit.codigo         := self.FQuery.FieldByName('codigo').AsInteger;
   ProdutosKit.codigo_kit     := self.FQuery.FieldByName('codigo_kit').AsInteger;
   ProdutosKit.codigo_produto := self.FQuery.FieldByName('codigo_produto').AsInteger;
   ProdutosKit.codigo_cor     := self.FQuery.FieldByName('codigo_cor').AsInteger;

   result := ProdutosKit;
end;

function TRepositorioProdutosKit.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TProdutosKit(Objeto).Codigo;
end;

function TRepositorioProdutosKit.GetNomeDaTabela: String;
begin
  result := 'PRODUTOS_KIT';
end;

function TRepositorioProdutosKit.GetRepositorio: TRepositorio;
begin
  result := TRepositorioProdutosKit.Create;
end;

function TRepositorioProdutosKit.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TProdutosKit(Objeto).Codigo <= 0);
end;

procedure TRepositorioProdutosKit.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  ProdutosKitAntigo :TProdutosKit;
  ProdutosKitNovo :TProdutosKit;
begin
   ProdutosKitAntigo := (AntigoObjeto as TProdutosKit);
   ProdutosKitNovo   := (Objeto       as TProdutosKit);

   if (ProdutosKitAntigo.codigo_kit <> ProdutosKitNovo.codigo_kit) then
     Auditoria.AdicionaCampoAlterado('codigo_kit', IntToStr(ProdutosKitAntigo.codigo_kit), IntToStr(ProdutosKitNovo.codigo_kit));

   if (ProdutosKitAntigo.codigo_produto <> ProdutosKitNovo.codigo_produto) then
     Auditoria.AdicionaCampoAlterado('codigo_produto', IntToStr(ProdutosKitAntigo.codigo_produto), IntToStr(ProdutosKitNovo.codigo_produto));

   if (ProdutosKitAntigo.codigo_cor <> ProdutosKitNovo.codigo_cor) then
     Auditoria.AdicionaCampoAlterado('codigo_cor', IntToStr(ProdutosKitAntigo.codigo_cor), IntToStr(ProdutosKitNovo.codigo_cor));
end;

procedure TRepositorioProdutosKit.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  ProdutosKit :TProdutosKit;
begin
  ProdutosKit := (Objeto as TProdutosKit);
  Auditoria.AdicionaCampoExcluido('codigo'        , IntToStr(ProdutosKit.codigo));
  Auditoria.AdicionaCampoExcluido('codigo_kit'    , IntToStr(ProdutosKit.codigo_kit));
  Auditoria.AdicionaCampoExcluido('codigo_produto', IntToStr(ProdutosKit.codigo_produto));
  Auditoria.AdicionaCampoExcluido('codigo_cor'    , IntToStr(ProdutosKit.codigo_cor));
end;

procedure TRepositorioProdutosKit.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  ProdutosKit :TProdutosKit;
begin
  ProdutosKit := (Objeto as TProdutosKit);
  Auditoria.AdicionaCampoIncluido('codigo'        ,    IntToStr(ProdutosKit.codigo));
  Auditoria.AdicionaCampoIncluido('codigo_kit'    ,    IntToStr(ProdutosKit.codigo_kit));
  Auditoria.AdicionaCampoIncluido('codigo_produto',    IntToStr(ProdutosKit.codigo_produto));
  Auditoria.AdicionaCampoIncluido('codigo_cor'    ,    IntToStr(ProdutosKit.codigo_cor));
end;

procedure TRepositorioProdutosKit.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TProdutosKit(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioProdutosKit.SetParametros(Objeto: TObject);
var
  ProdutosKit :TProdutosKit;
begin
  ProdutosKit := (Objeto as TProdutosKit);

  self.FQuery.ParamByName('codigo').AsInteger         := ProdutosKit.codigo;
  self.FQuery.ParamByName('codigo_kit').AsInteger     := ProdutosKit.codigo_kit;
  self.FQuery.ParamByName('codigo_produto').AsInteger := ProdutosKit.codigo_produto;
  self.FQuery.ParamByName('codigo_cor').AsInteger     := ProdutosKit.codigo_cor;
end;

function TRepositorioProdutosKit.SQLGet: String;
begin
  result := 'select * from PRODUTOS_KIT where codigo = :ncod';
end;

function TRepositorioProdutosKit.SQLGetAll: String;
begin
  result := 'select * from PRODUTOS_KIT'+ IfThen(FIdentificador = '','', CondicaoSQLGetAll) +' order by codigo';
end;

function TRepositorioProdutosKit.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from PRODUTOS_KIT where '+ campo +' = :ncampo';
end;

function TRepositorioProdutosKit.SQLRemover: String;
begin
  result := ' delete from PRODUTOS_KIT where codigo = :codigo ';
end;

function TRepositorioProdutosKit.SQLSalvar: String;
begin
  result := 'update or insert into PRODUTOS_KIT (CODIGO ,CODIGO_KIT ,CODIGO_PRODUTO, CODIGO_COR) '+
           '                      values ( :CODIGO , :CODIGO_KIT , :CODIGO_PRODUTO, :CODIGO_COR) ';
end;

end.

