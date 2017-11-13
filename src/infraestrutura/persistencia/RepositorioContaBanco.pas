unit RepositorioContaBanco;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioContaBanco = class(TRepositorio)

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

uses SysUtils, ContaBanco;

{ TRepositorioContaBanco }

function TRepositorioContaBanco.Get(Dataset: TDataSet): TObject;
var
  ContaBanco :TContaBanco;
begin
   ContaBanco:= TContaBanco.Create;
   ContaBanco.codigo       := self.FQuery.FieldByName('codigo').AsInteger;
   ContaBanco.banco        := self.FQuery.FieldByName('banco').AsString;
   ContaBanco.titular      := self.FQuery.FieldByName('titular').AsString;
   ContaBanco.agencia      := self.FQuery.FieldByName('agencia').AsString;
   ContaBanco.numero_conta := self.FQuery.FieldByName('numero_conta').AsString;

   result := ContaBanco;
end;

function TRepositorioContaBanco.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TContaBanco(Objeto).Codigo;
end;

function TRepositorioContaBanco.GetNomeDaTabela: String;
begin
  result := 'CONTAS_BANCO';
end;

function TRepositorioContaBanco.GetRepositorio: TRepositorio;
begin
  result := TRepositorioContaBanco.Create;
end;

function TRepositorioContaBanco.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TContaBanco(Objeto).Codigo <= 0);
end;

procedure TRepositorioContaBanco.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  ContaBancoAntigo :TContaBanco;
  ContaBancoNovo :TContaBanco;
begin
   ContaBancoAntigo := (AntigoObjeto as TContaBanco);
   ContaBancoNovo   := (Objeto       as TContaBanco);

   if (ContaBancoAntigo.banco <> ContaBancoNovo.banco) then
     Auditoria.AdicionaCampoAlterado('banco', ContaBancoAntigo.banco, ContaBancoNovo.banco);

   if (ContaBancoAntigo.titular <> ContaBancoNovo.titular) then
     Auditoria.AdicionaCampoAlterado('titular', ContaBancoAntigo.titular, ContaBancoNovo.titular);

   if (ContaBancoAntigo.agencia <> ContaBancoNovo.agencia) then
     Auditoria.AdicionaCampoAlterado('agencia', ContaBancoAntigo.agencia, ContaBancoNovo.agencia);

   if (ContaBancoAntigo.numero_conta <> ContaBancoNovo.numero_conta) then
     Auditoria.AdicionaCampoAlterado('numero_conta', ContaBancoAntigo.numero_conta, ContaBancoNovo.numero_conta);

end;

procedure TRepositorioContaBanco.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  ContaBanco :TContaBanco;
begin
  ContaBanco := (Objeto as TContaBanco);
  Auditoria.AdicionaCampoExcluido('codigo'      , IntToStr(ContaBanco.codigo));
  Auditoria.AdicionaCampoExcluido('banco'       , ContaBanco.banco);
  Auditoria.AdicionaCampoExcluido('titular'     , ContaBanco.titular);
  Auditoria.AdicionaCampoExcluido('agencia'     , ContaBanco.agencia);
  Auditoria.AdicionaCampoExcluido('numero_conta', ContaBanco.numero_conta);
end;

procedure TRepositorioContaBanco.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  ContaBanco :TContaBanco;
begin
  ContaBanco := (Objeto as TContaBanco);
  Auditoria.AdicionaCampoIncluido('codigo'      ,    IntToStr(ContaBanco.codigo));
  Auditoria.AdicionaCampoIncluido('banco'       ,    ContaBanco.banco);
  Auditoria.AdicionaCampoIncluido('titular'     ,    ContaBanco.titular);
  Auditoria.AdicionaCampoIncluido('agencia'     ,    ContaBanco.agencia);
  Auditoria.AdicionaCampoIncluido('numero_conta',    ContaBanco.numero_conta);
end;

procedure TRepositorioContaBanco.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TContaBanco(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioContaBanco.SetParametros(Objeto: TObject);
var
  ContaBanco :TContaBanco;
begin
  ContaBanco := (Objeto as TContaBanco);

  self.FQuery.ParamByName('codigo').AsInteger       := ContaBanco.codigo;
  self.FQuery.ParamByName('banco').AsString        := ContaBanco.banco;
  self.FQuery.ParamByName('titular').AsString      := ContaBanco.titular;
  self.FQuery.ParamByName('agencia').AsString      := ContaBanco.agencia;
  self.FQuery.ParamByName('numero_conta').AsString := ContaBanco.numero_conta;
end;

function TRepositorioContaBanco.SQLGet: String;
begin
  result := 'select * from CONTAS_BANCO where codigo = :ncod';
end;

function TRepositorioContaBanco.SQLGetAll: String;
begin
  result := 'select * from CONTAS_BANCO';
end;

function TRepositorioContaBanco.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioContaBanco.SQLRemover: String;
begin
  result := ' delete from CONTAS_BANCO where codigo = :codigo ';
end;

function TRepositorioContaBanco.SQLSalvar: String;
begin
  result := 'update or insert into CONTAS_BANCO (CODIGO ,BANCO ,TITULAR ,AGENCIA ,NUMERO_CONTA) '+
            '                  values ( :CODIGO , :BANCO , :TITULAR , :AGENCIA , :NUMERO_CONTA) ';
end;

end.

