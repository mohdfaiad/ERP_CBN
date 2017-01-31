unit RepositorioDadosRepresentante;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioDadosRepresentante = class(TRepositorio)

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

uses SysUtils, DadosRepresentante;

{ TRepositorioDadosRepresentante }

function TRepositorioDadosRepresentante.Get(Dataset: TDataSet): TObject;
var
  DadosRepresentante :TDadosRepresentante;
begin
   DadosRepresentante:= TDadosRepresentante.Create;
   DadosRepresentante.codigo               := self.FQuery.FieldByName('codigo').AsInteger;
   DadosRepresentante.codigo_representante := self.FQuery.FieldByName('codigo_representante').AsInteger;
   DadosRepresentante.percentagem_comissao := self.FQuery.FieldByName('percentagem_comissao').AsFloat;
   DadosRepresentante.rep_ecommerce        := self.FQuery.FieldByName('rep_ecommerce').AsString;

   result := DadosRepresentante;
end;

function TRepositorioDadosRepresentante.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TDadosRepresentante(Objeto).Codigo;
end;

function TRepositorioDadosRepresentante.GetNomeDaTabela: String;
begin
  result := 'DADOS_REPRESENTANTE';
end;

function TRepositorioDadosRepresentante.GetRepositorio: TRepositorio;
begin
  result := TRepositorioDadosRepresentante.Create;
end;

function TRepositorioDadosRepresentante.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TDadosRepresentante(Objeto).Codigo <= 0);
end;

procedure TRepositorioDadosRepresentante.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  DadosRepresentanteAntigo :TDadosRepresentante;
  DadosRepresentanteNovo :TDadosRepresentante;
begin
   DadosRepresentanteAntigo := (AntigoObjeto as TDadosRepresentante);
   DadosRepresentanteNovo   := (Objeto       as TDadosRepresentante);

   if (DadosRepresentanteAntigo.codigo_representante <> DadosRepresentanteNovo.codigo_representante) then
     Auditoria.AdicionaCampoAlterado('codigo_representante', IntToStr(DadosRepresentanteAntigo.codigo_representante), IntToStr(DadosRepresentanteNovo.codigo_representante));

   if (DadosRepresentanteAntigo.percentagem_comissao <> DadosRepresentanteNovo.percentagem_comissao) then
     Auditoria.AdicionaCampoAlterado('percentagem_comissao', FloatToStr(DadosRepresentanteAntigo.percentagem_comissao), FloatToStr(DadosRepresentanteNovo.percentagem_comissao));

   if (DadosRepresentanteAntigo.rep_ecommerce <> DadosRepresentanteNovo.rep_ecommerce) then
     Auditoria.AdicionaCampoAlterado('rep_ecommerce', DadosRepresentanteAntigo.rep_ecommerce, DadosRepresentanteNovo.rep_ecommerce);
end;

procedure TRepositorioDadosRepresentante.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  DadosRepresentante :TDadosRepresentante;
begin
  DadosRepresentante := (Objeto as TDadosRepresentante);
  Auditoria.AdicionaCampoExcluido('codigo'              , IntToStr(DadosRepresentante.codigo));
  Auditoria.AdicionaCampoExcluido('codigo_representante', IntToStr(DadosRepresentante.codigo_representante));
  Auditoria.AdicionaCampoExcluido('percentagem_comissao', FloatToStr(DadosRepresentante.percentagem_comissao));
  Auditoria.AdicionaCampoExcluido('rep_ecommerce',        DadosRepresentante.rep_ecommerce);
end;

procedure TRepositorioDadosRepresentante.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  DadosRepresentante :TDadosRepresentante;
begin
  DadosRepresentante := (Objeto as TDadosRepresentante);
  Auditoria.AdicionaCampoIncluido('codigo'              ,    IntToStr(DadosRepresentante.codigo));
  Auditoria.AdicionaCampoIncluido('codigo_representante',    IntToStr(DadosRepresentante.codigo_representante));
  Auditoria.AdicionaCampoIncluido('percentagem_comissao',    FloatToStr(DadosRepresentante.percentagem_comissao));
  Auditoria.AdicionaCampoIncluido('rep_ecommerce',           DadosRepresentante.rep_ecommerce);
end;

procedure TRepositorioDadosRepresentante.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TDadosRepresentante(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioDadosRepresentante.SetParametros(Objeto: TObject);
var
  DadosRepresentante :TDadosRepresentante;
begin
  DadosRepresentante := (Objeto as TDadosRepresentante);

  self.FQuery.ParamByName('codigo').AsInteger               := DadosRepresentante.codigo;
  self.FQuery.ParamByName('codigo_representante').AsInteger := DadosRepresentante.codigo_representante;
  self.FQuery.ParamByName('percentagem_comissao').AsFloat   := DadosRepresentante.percentagem_comissao;
  self.FQuery.ParamByName('rep_ecommerce').AsString         := DadosRepresentante.rep_ecommerce;
end;

function TRepositorioDadosRepresentante.SQLGet: String;
begin
  result := 'select * from DADOS_REPRESENTANTE where codigo = :ncod';
end;

function TRepositorioDadosRepresentante.SQLGetAll: String;
begin
  result := 'select * from DADOS_REPRESENTANTE';
end;

function TRepositorioDadosRepresentante.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from DADOS_REPRESENTANTE where '+ campo +' = :ncampo';
end;

function TRepositorioDadosRepresentante.SQLRemover: String;
begin
  result := ' delete from DADOS_REPRESENTANTE where codigo = :codigo ';
end;

function TRepositorioDadosRepresentante.SQLSalvar: String;
begin
  result := 'update or insert into DADOS_REPRESENTANTE (CODIGO ,CODIGO_REPRESENTANTE ,PERCENTAGEM_COMISSAO, REP_ECOMMERCE) '+
           '                      values ( :CODIGO , :CODIGO_REPRESENTANTE , :PERCENTAGEM_COMISSAO, :REP_ECOMMERCE) ';
end;

end.

