unit RepositorioTabelaPreco;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioTabelaPreco = class(TRepositorio)

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
  TabelaPreco, system.StrUtils;

{ TRepositorioTabelaPreco }

function TRepositorioTabelaPreco.Get(Dataset: TDataSet): TObject;
var
  TabelaPreco :TTabelaPreco;
begin
   TabelaPreco            := TTabelaPreco.Create;
   TabelaPreco.Codigo     := self.FQuery.FieldByName('codigo'    ).AsInteger;
   TabelaPreco.Descricao  := self.FQuery.FieldByName('Descricao' ).AsString;
   TabelaPreco.Ativa      := self.FQuery.FieldByName('ativa').AsString = 'S';
   result := TabelaPreco;
end;

function TRepositorioTabelaPreco.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TTabelaPreco(Objeto).Codigo;
end;

function TRepositorioTabelaPreco.GetNomeDaTabela: String;
begin
  result := 'TABELAS_PRECO';
end;

function TRepositorioTabelaPreco.GetRepositorio: TRepositorio;
begin
  result := TRepositorioTabelaPreco.Create;
end;

function TRepositorioTabelaPreco.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TTabelaPreco(Objeto).Codigo <= 0);
end;

procedure TRepositorioTabelaPreco.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  TabelaPrecoAntigo :TTabelaPreco;
  TabelaPrecoNovo   :TTabelaPreco;
begin
   TabelaPrecoAntigo := (AntigoObjeto as TTabelaPreco);
   TabelaPrecoNovo   := (Objeto       as TTabelaPreco);

   if (TabelaPrecoAntigo.Descricao <> TabelaPrecoNovo.Descricao) then
    Auditoria.AdicionaCampoAlterado('Descricao', TabelaPrecoAntigo.Descricao, TabelaPrecoNovo.Descricao);
end;

procedure TRepositorioTabelaPreco.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  TabelaPreco :TTabelaPreco;
begin
   TabelaPreco := (Objeto as TTabelaPreco);

   Auditoria.AdicionaCampoExcluido('codigo'    , intToStr(TabelaPreco.Codigo));
   Auditoria.AdicionaCampoExcluido('Descricao' , TabelaPreco.Descricao);
end;

procedure TRepositorioTabelaPreco.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  TabelaPreco :TTabelaPreco;
begin
   TabelaPreco := (Objeto as TTabelaPreco);

   Auditoria.AdicionaCampoIncluido('codigo'    , intToStr(TabelaPreco.Codigo));
   Auditoria.AdicionaCampoIncluido('Descricao' , TabelaPreco.Descricao);
end;

procedure TRepositorioTabelaPreco.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TTabelaPreco(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioTabelaPreco.SetParametros(Objeto: TObject);
var
  TabelaPreco :TTabelaPreco;
begin
   TabelaPreco := (Objeto as TTabelaPreco);

   if (TabelaPreco.Codigo > 0) then  inherited SetParametro('codigo', TabelaPreco.Codigo)
   else                         inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('descricao').AsString     := TabelaPreco.Descricao;
   self.FQuery.ParamByName('ativa').AsString         := IfThen(TabelaPreco.Ativa,'S','N');
end;

function TRepositorioTabelaPreco.SQLGet: String;
begin
  result := 'select * from TABELAS_PRECO where codigo = :ncod';
end;

function TRepositorioTabelaPreco.SQLGetAll: String;
begin
  result := 'select * from TABELAS_PRECO';
end;

function TRepositorioTabelaPreco.SQLGetExiste(arrayDeCampos :array of string): String;
begin
   result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), self.GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioTabelaPreco.SQLRemover: String;
begin
   result := ' delete from TABELAS_PRECO where codigo = :codigo ';
end;

function TRepositorioTabelaPreco.SQLSalvar: String;
begin
  result := 'update or insert into TABELAS_PRECO  '+
            '(codigo, descricao, ativa)                  '+
            ' Values (:codigo, :descricao, :ativa)        ';
end;

end.
              
              
              
              
              
              
              

