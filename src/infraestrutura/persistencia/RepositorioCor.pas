unit RepositorioCor;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioCor = class(TRepositorio)

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

  //==============================================================================
  // Auditoria
  //==============================================================================
  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;

end;

implementation

uses
  SysUtils,
  Cor, StrUtils;

{ TRepositorioCor }

function TRepositorioCor.Get(Dataset: TDataSet): TObject;
var
  Cor :TCor;
begin
   Cor                := TCor.Create;
   Cor.Codigo         := self.FQuery.FieldByName('codigo'    ).AsInteger;
   Cor.Descricao      := self.FQuery.FieldByName('Descricao' ).AsString;
   cor.Referencia     := self.FQuery.fieldByName('referencia').AsString;
   cor.Desc_producao  := self.FQuery.fieldByName('desc_producao').AsString;
   cor.Cor            := self.FQuery.fieldByName('cor').AsString;
   cor.Tipo           := self.FQuery.fieldByName('tipo').AsString;
   cor.Cor_pai        := self.FQuery.fieldByName('cor_pai').AsString;
   cor.Codigo_colecao := self.FQuery.FieldByName('codigo_colecao').AsInteger;
   cor.kit            := (self.FQuery.fieldByName('KIT').AsString = 'S');
   cor.descricao_completa := self.FQuery.fieldByName('descricao_completa').AsString;

   result := Cor;
end;

function TRepositorioCor.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TCor(Objeto).Codigo;
end;

function TRepositorioCor.GetNomeDaTabela: String;
begin
  result := 'CORES';
end;

function TRepositorioCor.GetRepositorio: TRepositorio;
begin
  result := TRepositorioCor.Create;
end;

function TRepositorioCor.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TCor(Objeto).Codigo <= 0);
end;

procedure TRepositorioCor.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  CorAntigo :TCor;
  CorNovo   :TCor;
begin
   CorAntigo := (AntigoObjeto as TCor);
   CorNovo   := (Objeto       as TCor);

   if (CorAntigo.Descricao <> CorNovo.Descricao) then
    Auditoria.AdicionaCampoAlterado('Descricao', CorAntigo.Descricao, CorNovo.Descricao);
   if (CorAntigo.Referencia <> CorNovo.Referencia) then
    Auditoria.AdicionaCampoAlterado('referencia', CorAntigo.Referencia, CorNovo.Referencia);
   if (CorAntigo.Desc_producao <> CorNovo.Desc_producao) then
    Auditoria.AdicionaCampoAlterado('Desc_producao', CorAntigo.Desc_producao, CorNovo.Desc_producao);
   if (CorAntigo.Cor <> CorNovo.Cor) then
    Auditoria.AdicionaCampoAlterado('cor', CorAntigo.Cor, CorNovo.Cor);
   if (CorAntigo.Tipo <> CorNovo.Tipo) then
    Auditoria.AdicionaCampoAlterado('tipo', CorAntigo.Tipo, CorNovo.Tipo);
   if (CorAntigo.Cor_pai <> CorNovo.Cor_pai) then
    Auditoria.AdicionaCampoAlterado('cor_pai', CorAntigo.Cor_pai, CorNovo.Cor_pai);
   if (CorAntigo.Codigo_colecao <> CorNovo.Codigo_colecao) then
    Auditoria.AdicionaCampoAlterado('Codigo_colecao', IntToStr(CorAntigo.Codigo_colecao), IntToStr(CorNovo.Codigo_colecao));
   if (CorAntigo.descricao_completa <> CorNovo.descricao_completa) then
    Auditoria.AdicionaCampoAlterado('descricao_completa', CorAntigo.descricao_completa, CorNovo.descricao_completa);
end;

procedure TRepositorioCor.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Cor :TCor;
begin
   Cor := (Objeto as TCor);

   Auditoria.AdicionaCampoExcluido('codigo'       , intToStr(Cor.Codigo));
   Auditoria.AdicionaCampoExcluido('Descricao'    , Cor.Descricao);
   Auditoria.AdicionaCampoExcluido('referencia'   , Cor.Referencia);
   Auditoria.AdicionaCampoExcluido('desc_producao', Cor.Desc_producao);
   Auditoria.AdicionaCampoExcluido('cor'          , Cor.Cor);
   Auditoria.AdicionaCampoExcluido('tipo'         , Cor.Tipo);
   Auditoria.AdicionaCampoExcluido('cor_pai'      , Cor.Cor_pai);
   Auditoria.AdicionaCampoExcluido('codigo_colecao', intToStr(Cor.Codigo_colecao));
   Auditoria.AdicionaCampoExcluido('descricao_completa', Cor.descricao_completa);
end;

procedure TRepositorioCor.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Cor :TCor;
begin
   Cor := (Objeto as TCor);

   Auditoria.AdicionaCampoIncluido('codigo'       , intToStr(Cor.Codigo));
   Auditoria.AdicionaCampoIncluido('Descricao'    , Cor.Descricao);
   Auditoria.AdicionaCampoIncluido('referencia'   , Cor.Referencia);
   Auditoria.AdicionaCampoIncluido('desc_producao', Cor.Desc_producao);
   Auditoria.AdicionaCampoIncluido('cor'          , Cor.Cor);
   Auditoria.AdicionaCampoIncluido('tipo'         , Cor.Tipo);
   Auditoria.AdicionaCampoIncluido('cor_pai'      , Cor.Cor_pai);
   Auditoria.AdicionaCampoIncluido('codigo_colecao', intToStr(Cor.Codigo_colecao));
   Auditoria.AdicionaCampoIncluido('descricao_completa', Cor.descricao_completa);
end;

procedure TRepositorioCor.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TCor(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioCor.SetParametros(Objeto: TObject);
var
  Cor :TCor;
begin
   Cor := (Objeto as TCor);

   if (Cor.Codigo > 0) then  inherited SetParametro('codigo', Cor.Codigo)
   else                         inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('descricao').AsString        := Cor.Descricao;
   self.FQuery.ParamByName('referencia').AsString       := Cor.Referencia;
   self.FQuery.ParamByName('desc_producao').AsString    := Cor.Desc_producao;
   self.FQuery.ParamByName('cor').AsString              := Cor.Cor;
   self.FQuery.ParamByName('tipo').AsString             := Cor.Tipo;
   self.FQuery.ParamByName('cor_pai').AsString          := Cor.Cor_pai;
   self.FQuery.ParamByName('kit').AsString              := IfThen(Cor.Kit,'S','N');

   if Cor.Codigo_colecao > 0 then
     self.FQuery.ParamByName('codigo_colecao').AsInteger  := Cor.Codigo_colecao;

   self.FQuery.ParamByName('descricao_completa').AsString := Cor.descricao_completa;
end;

function TRepositorioCor.SQLGet: String;
begin
  result := 'select * from CORES where codigo = :ncod';
end;

function TRepositorioCor.SQLGetAll: String;
begin
  result := 'select * from CORES';
end;

function TRepositorioCor.SQLGetExiste(arrayDeCampos :array of string): String;
begin
   result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), self.GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioCor.SQLRemover: String;
begin
   result := ' delete from CORES where codigo = :codigo ';
end;

function TRepositorioCor.SQLSalvar: String;
begin
  result := 'update or insert into CORES                                                                        '+
            '(codigo, descricao, referencia, desc_producao, cor, tipo, cor_pai, codigo_colecao,  KIT, DESCRICAO_COMPLETA)                 '+
            ' Values (:codigo, :descricao, :referencia, :desc_producao, :cor, :tipo, :cor_pai, :codigo_colecao, :KIT, :DESCRICAO_COMPLETA) ';
end;

end.
              
              
              
              
              
              
              

