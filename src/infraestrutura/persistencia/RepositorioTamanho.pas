unit RepositorioTamanho;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioTamanho = class(TRepositorio)

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
  Tamanho;

{ TRepositorioTamanho }

function TRepositorioTamanho.Get(Dataset: TDataSet): TObject;
var
  Tamanho :TTamanho;
begin
   Tamanho            := TTamanho.Create;
   Tamanho.Codigo     := self.FQuery.FieldByName('codigo'    ).AsInteger;
   Tamanho.Descricao  := self.FQuery.FieldByName('Descricao' ).AsString;
   Tamanho.Ordem      := self.FQuery.FieldByName('Ordem'     ).AsInteger;
   result := Tamanho;
end;

function TRepositorioTamanho.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TTamanho(Objeto).Codigo;
end;

function TRepositorioTamanho.GetNomeDaTabela: String;
begin
  result := 'TAMANHOS';
end;

function TRepositorioTamanho.GetRepositorio: TRepositorio;
begin
  result := TRepositorioTamanho.Create;
end;

function TRepositorioTamanho.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TTamanho(Objeto).Codigo <= 0);
end;

procedure TRepositorioTamanho.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  TamanhoAntigo :TTamanho;
  TamanhoNovo   :TTamanho;
begin
   TamanhoAntigo := (AntigoObjeto as TTamanho);
   TamanhoNovo   := (Objeto       as TTamanho);

   if (TamanhoAntigo.Descricao <> TamanhoNovo.Descricao) then
    Auditoria.AdicionaCampoAlterado('Descricao', TamanhoAntigo.Descricao, TamanhoNovo.Descricao);

   if (TamanhoAntigo.Ordem <> TamanhoNovo.Ordem) then
    Auditoria.AdicionaCampoAlterado('Ordem', intToStr(TamanhoAntigo.Ordem), intToStr(TamanhoNovo.Ordem));
end;

procedure TRepositorioTamanho.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Tamanho :TTamanho;
begin
   Tamanho := (Objeto as TTamanho);

   Auditoria.AdicionaCampoExcluido('codigo'    , intToStr(Tamanho.Codigo));
   Auditoria.AdicionaCampoExcluido('Descricao' , Tamanho.Descricao);
   Auditoria.AdicionaCampoExcluido('Ordem'     , intToStr(Tamanho.Ordem));
end;

procedure TRepositorioTamanho.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Tamanho :TTamanho;
begin
   Tamanho := (Objeto as TTamanho);

   Auditoria.AdicionaCampoIncluido('codigo'    , intToStr(Tamanho.Codigo));
   Auditoria.AdicionaCampoIncluido('Descricao' , Tamanho.Descricao);
   Auditoria.AdicionaCampoIncluido('Ordem'     , intToStr(Tamanho.Ordem));
end;

procedure TRepositorioTamanho.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TTamanho(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioTamanho.SetParametros(Objeto: TObject);
var
  Tamanho :TTamanho;
begin
   Tamanho := (Objeto as TTamanho);

   if (Tamanho.Codigo > 0) then  inherited SetParametro('codigo', Tamanho.Codigo)
   else                          inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('descricao').AsString  := Tamanho.Descricao;
   self.FQuery.ParamByName('Ordem').AsInteger     := Tamanho.Ordem;
end;

function TRepositorioTamanho.SQLGet: String;
begin
  result := 'select * from Tamanhos where codigo = :ncod';
end;

function TRepositorioTamanho.SQLGetAll: String;
begin
  result := 'select * from Tamanhos order by ordem';
end;

function TRepositorioTamanho.SQLGetExiste(arrayDeCampos :array of string): String;
begin
   result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), self.GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioTamanho.SQLRemover: String;
begin
   result := ' delete from Tamanhos where codigo = :codigo ';
end;

function TRepositorioTamanho.SQLSalvar: String;
begin
  result := 'update or insert into Tamanhos        '+
            '(codigo, descricao, ordem)            '+
            ' Values (:codigo, :descricao, :ordem) ';
end;

end.
              
              
              
              
              
              
              

