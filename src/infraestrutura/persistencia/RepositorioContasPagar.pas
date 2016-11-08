unit RepositorioContasPagar;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioContasPagar = class(TRepositorio)

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

uses SysUtils, ContasPagar;

{ TRepositorioContasPagar }

function TRepositorioContasPagar.Get(Dataset: TDataSet): TObject;
var
  ContasPagar :TContasPagar;
begin
   ContasPagar:= TContasPagar.Create;
   ContasPagar.codigo         := self.FQuery.FieldByName('codigo').AsInteger;
   ContasPagar.codigo_nf      := self.FQuery.FieldByName('codigo_nf').AsInteger;
   ContasPagar.dt_documento   := self.FQuery.FieldByName('dt_documento').AsDateTime;
   ContasPagar.dt_lancamento  := self.FQuery.FieldByName('dt_lancamento').AsDateTime;
   ContasPagar.num_documento  := self.FQuery.FieldByName('num_documento').AsInteger;
   ContasPagar.cod_fornecedor := self.FQuery.FieldByName('cod_fornecedor').AsInteger;
   ContasPagar.status         := self.FQuery.FieldByName('status').AsString;
   ContasPagar.desc_status    := self.FQuery.FieldByName('desc_status').AsString;
   ContasPagar.valor          := self.FQuery.FieldByName('valor').AsFloat;
   ContasPagar.observacao     := self.FQuery.FieldByName('observacao').AsString;
   ContasPagar.codContaBanco  := self.FQuery.FieldByName('cod_conta_banco').AsInteger;

   result := ContasPagar;
end;

function TRepositorioContasPagar.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TContasPagar(Objeto).Codigo;
end;

function TRepositorioContasPagar.GetNomeDaTabela: String;
begin
  result := 'CONTAS_PAGAR';
end;

function TRepositorioContasPagar.GetRepositorio: TRepositorio;
begin
  result := TRepositorioContasPagar.Create;
end;

function TRepositorioContasPagar.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TContasPagar(Objeto).Codigo <= 0);
end;

procedure TRepositorioContasPagar.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  ContasPagarAntigo :TContasPagar;
  ContasPagarNovo :TContasPagar;
begin
   ContasPagarAntigo := (AntigoObjeto as TContasPagar);
   ContasPagarNovo   := (Objeto       as TContasPagar);

   if (ContasPagarAntigo.codigo_nf <> ContasPagarNovo.codigo_nf) then
     Auditoria.AdicionaCampoAlterado('codigo_nf', IntToStr(ContasPagarAntigo.codigo_nf), IntToStr(ContasPagarNovo.codigo_nf));

   if (ContasPagarAntigo.dt_documento <> ContasPagarNovo.dt_documento) then
     Auditoria.AdicionaCampoAlterado('dt_documento', DateTimeToStr(ContasPagarAntigo.dt_documento), DateTimeToStr(ContasPagarNovo.dt_documento));

   if (ContasPagarAntigo.dt_lancamento <> ContasPagarNovo.dt_lancamento) then
     Auditoria.AdicionaCampoAlterado('dt_lancamento', DateTimeToStr(ContasPagarAntigo.dt_lancamento), DateTimeToStr(ContasPagarNovo.dt_lancamento));

   if (ContasPagarAntigo.num_documento <> ContasPagarNovo.num_documento) then
     Auditoria.AdicionaCampoAlterado('num_documento', IntToStr(ContasPagarAntigo.num_documento), IntToStr(ContasPagarNovo.num_documento));

   if (ContasPagarAntigo.cod_fornecedor <> ContasPagarNovo.cod_fornecedor) then
     Auditoria.AdicionaCampoAlterado('cod_fornecedor', IntToStr(ContasPagarAntigo.cod_fornecedor), IntToStr(ContasPagarNovo.cod_fornecedor));

   if (ContasPagarAntigo.status <> ContasPagarNovo.status) then
     Auditoria.AdicionaCampoAlterado('status', ContasPagarAntigo.status, ContasPagarNovo.status);

   if (ContasPagarAntigo.desc_status <> ContasPagarNovo.desc_status) then
     Auditoria.AdicionaCampoAlterado('desc_status', ContasPagarAntigo.desc_status, ContasPagarNovo.desc_status);

   if (ContasPagarAntigo.valor <> ContasPagarNovo.valor) then
     Auditoria.AdicionaCampoAlterado('valor', FloatToStr(ContasPagarAntigo.valor), FloatToStr(ContasPagarNovo.valor));

   if (ContasPagarAntigo.cod_fornecedor <> ContasPagarNovo.cod_fornecedor) then
     Auditoria.AdicionaCampoAlterado('cod_fornecedor', IntToStr(ContasPagarAntigo.cod_fornecedor), IntToStr(ContasPagarNovo.cod_fornecedor));

   if (ContasPagarAntigo.codContaBanco <> ContasPagarNovo.codContaBanco) then
     Auditoria.AdicionaCampoAlterado('cod_Conta_Banco', IntToStr(ContasPagarAntigo.codContaBanco), IntToStr(ContasPagarNovo.codContaBanco));
end;

procedure TRepositorioContasPagar.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  ContasPagar :TContasPagar;
begin
  ContasPagar := (Objeto as TContasPagar);
  Auditoria.AdicionaCampoExcluido('codigo'        , IntToStr(ContasPagar.codigo));
  Auditoria.AdicionaCampoExcluido('codigo_nf'     , IntToStr(ContasPagar.codigo_nf));
  Auditoria.AdicionaCampoExcluido('dt_documento'  , DateTimeToStr(ContasPagar.dt_documento));
  Auditoria.AdicionaCampoExcluido('dt_lancamento' , DateTimeToStr(ContasPagar.dt_lancamento));
  Auditoria.AdicionaCampoExcluido('num_documento' , IntToStr(ContasPagar.num_documento));
  Auditoria.AdicionaCampoExcluido('cod_fornecedor', IntToStr(ContasPagar.cod_fornecedor));
  Auditoria.AdicionaCampoExcluido('status'        , ContasPagar.status);
  Auditoria.AdicionaCampoExcluido('desc_status'   , ContasPagar.desc_status);
  Auditoria.AdicionaCampoExcluido('valor'         , FloatToStr(ContasPagar.valor));
  Auditoria.AdicionaCampoExcluido('observacao'    , ContasPagar.observacao);
  Auditoria.AdicionaCampoExcluido('cod_conta_banco', IntToStr(ContasPagar.codContaBanco));
end;

procedure TRepositorioContasPagar.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  ContasPagar :TContasPagar;
begin
  ContasPagar := (Objeto as TContasPagar);
  Auditoria.AdicionaCampoIncluido('codigo'        ,    IntToStr(ContasPagar.codigo));
  Auditoria.AdicionaCampoIncluido('codigo_nf'     ,    IntToStr(ContasPagar.codigo_nf));
  Auditoria.AdicionaCampoIncluido('dt_documento'  ,    DateTimeToStr(ContasPagar.dt_documento));
  Auditoria.AdicionaCampoIncluido('dt_lancamento' ,    DateTimeToStr(ContasPagar.dt_lancamento));
  Auditoria.AdicionaCampoIncluido('num_documento' ,    IntToStr(ContasPagar.num_documento));
  Auditoria.AdicionaCampoIncluido('cod_fornecedor',    IntToStr(ContasPagar.cod_fornecedor));
  Auditoria.AdicionaCampoIncluido('status'        ,    ContasPagar.status);
  Auditoria.AdicionaCampoIncluido('desc_status'   ,    ContasPagar.desc_status);
  Auditoria.AdicionaCampoIncluido('valor'         ,    FloatToStr(ContasPagar.valor));
  Auditoria.AdicionaCampoIncluido('observacao'    ,    ContasPagar.observacao);
  Auditoria.AdicionaCampoIncluido('cod_conta_banco', IntToStr(ContasPagar.codContaBanco));
end;

procedure TRepositorioContasPagar.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TContasPagar(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioContasPagar.SetParametros(Objeto: TObject);
var
  ContasPagar :TContasPagar;
begin
  ContasPagar := (Objeto as TContasPagar);

  self.FQuery.ParamByName('codigo').AsInteger         := ContasPagar.codigo;

  if ContasPagar.codigo_nf > 0 then
    self.FQuery.ParamByName('codigo_nf').AsInteger      := ContasPagar.codigo_nf;

  self.FQuery.ParamByName('dt_documento').AsDateTime   := ContasPagar.dt_documento;
  self.FQuery.ParamByName('dt_lancamento').AsDateTime  := ContasPagar.dt_lancamento;
  self.FQuery.ParamByName('num_documento').AsInteger  := ContasPagar.num_documento;
  self.FQuery.ParamByName('cod_fornecedor').AsInteger := ContasPagar.cod_fornecedor;
  self.FQuery.ParamByName('status').AsString         := ContasPagar.status;
  self.FQuery.ParamByName('desc_status').AsString    := ContasPagar.desc_status;
  self.FQuery.ParamByName('valor').AsFloat          := ContasPagar.valor;
  self.FQuery.ParamByName('observacao').AsString     := ContasPagar.observacao;

  if ContasPagar.codContaBanco > 0 then
    self.FQuery.ParamByName('cod_conta_banco').AsInteger := ContasPagar.codContaBanco
  else
    self.FQuery.ParamByName('cod_conta_banco').Clear;
end;

function TRepositorioContasPagar.SQLGet: String;
begin
  result := 'select * from CONTAS_PAGAR where codigo = :ncod';
end;

function TRepositorioContasPagar.SQLGetAll: String;
begin
  result := 'select * from CONTAS_PAGAR';
end;

function TRepositorioContasPagar.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from CONTAS_PAGAR where '+ campo +' = :ncampo';
end;

function TRepositorioContasPagar.SQLRemover: String;
begin
  result := ' delete from CONTAS_PAGAR where codigo = :codigo ';
end;

function TRepositorioContasPagar.SQLSalvar: String;
begin
  result := 'update or insert into CONTAS_PAGAR (CODIGO ,CODIGO_NF ,DT_DOCUMENTO ,DT_LANCAMENTO ,NUM_DOCUMENTO ,COD_FORNECEDOR ,STATUS ,DESC_STATUS ,VALOR ,OBSERVACAO, COD_CONTA_BANCO) '+
           '                      values ( :CODIGO , :CODIGO_NF , :DT_DOCUMENTO , :DT_LANCAMENTO , :NUM_DOCUMENTO , :COD_FORNECEDOR , :STATUS , :DESC_STATUS , :VALOR ,:OBSERVACAO , :COD_CONTA_BANCO) ';
end;

end.


