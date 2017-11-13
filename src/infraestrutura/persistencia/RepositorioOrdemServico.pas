unit RepositorioOrdemServico;

interface

uses DB, Auditoria, Repositorio, System.StrUtils;

type
  TRepositorioOrdemServico = class(TRepositorio)

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

uses SysUtils, OrdemServico;

{ TRepositorioOrdemServico }

function TRepositorioOrdemServico.Get(Dataset: TDataSet): TObject;
var
  OrdemServico :TOrdemServico;
begin
   OrdemServico:= TOrdemServico.Create;
   OrdemServico.codigo         := self.FQuery.FieldByName('codigo').AsInteger;
   OrdemServico.numero         := self.FQuery.FieldByName('numero').AsInteger;
   OrdemServico.codigo_produto := self.FQuery.FieldByName('codigo_produto').AsInteger;
   OrdemServico.codigo_cor     := self.FQuery.FieldByName('codigo_cor').AsInteger;
   OrdemServico.codigo_tamanho := self.FQuery.FieldByName('codigo_tamanho').AsInteger;
   OrdemServico.quantidade     := self.FQuery.FieldByName('quantidade').AsInteger;
   OrdemServico.impresso       := self.FQuery.FieldByName('impresso').AsString = 'S';

   result := OrdemServico;
end;

function TRepositorioOrdemServico.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TOrdemServico(Objeto).Codigo;
end;

function TRepositorioOrdemServico.GetNomeDaTabela: String;
begin
  result := 'ORDEM_SERVICO';
end;

function TRepositorioOrdemServico.GetRepositorio: TRepositorio;
begin
  result := TRepositorioOrdemServico.Create;
end;

function TRepositorioOrdemServico.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TOrdemServico(Objeto).Codigo <= 0);
end;

procedure TRepositorioOrdemServico.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  OrdemServicoAntigo :TOrdemServico;
  OrdemServicoNovo :TOrdemServico;
begin
   OrdemServicoAntigo := (AntigoObjeto as TOrdemServico);
   OrdemServicoNovo   := (Objeto       as TOrdemServico);

   if (OrdemServicoAntigo.numero <> OrdemServicoNovo.numero) then
     Auditoria.AdicionaCampoAlterado('numero', IntToStr(OrdemServicoAntigo.numero), IntToStr(OrdemServicoNovo.numero));

   if (OrdemServicoAntigo.codigo_produto <> OrdemServicoNovo.codigo_produto) then
     Auditoria.AdicionaCampoAlterado('codigo_produto', IntToStr(OrdemServicoAntigo.codigo_produto), IntToStr(OrdemServicoNovo.codigo_produto));

   if (OrdemServicoAntigo.codigo_cor <> OrdemServicoNovo.codigo_cor) then
     Auditoria.AdicionaCampoAlterado('codigo_cor', IntToStr(OrdemServicoAntigo.codigo_cor), IntToStr(OrdemServicoNovo.codigo_cor));

   if (OrdemServicoAntigo.codigo_tamanho <> OrdemServicoNovo.codigo_tamanho) then
     Auditoria.AdicionaCampoAlterado('codigo_tamanho', IntToStr(OrdemServicoAntigo.codigo_tamanho), IntToStr(OrdemServicoNovo.codigo_tamanho));

   if (OrdemServicoAntigo.quantidade <> OrdemServicoNovo.quantidade) then
     Auditoria.AdicionaCampoAlterado('quantidade', IntToStr(OrdemServicoAntigo.quantidade), IntToStr(OrdemServicoNovo.quantidade));
end;

procedure TRepositorioOrdemServico.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  OrdemServico :TOrdemServico;
begin
  OrdemServico := (Objeto as TOrdemServico);
  Auditoria.AdicionaCampoExcluido('codigo'        , IntToStr(OrdemServico.codigo));
  Auditoria.AdicionaCampoExcluido('numero'        , IntToStr(OrdemServico.numero));
  Auditoria.AdicionaCampoExcluido('codigo_produto', IntToStr(OrdemServico.codigo_produto));
  Auditoria.AdicionaCampoExcluido('codigo_cor'    , IntToStr(OrdemServico.codigo_cor));
  Auditoria.AdicionaCampoExcluido('codigo_tamanho', IntToStr(OrdemServico.codigo_tamanho));
  Auditoria.AdicionaCampoExcluido('quantidade'    , IntToStr(OrdemServico.quantidade));
end;

procedure TRepositorioOrdemServico.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  OrdemServico :TOrdemServico;
begin
  OrdemServico := (Objeto as TOrdemServico);
  Auditoria.AdicionaCampoIncluido('codigo'        , IntToStr(OrdemServico.codigo));
  Auditoria.AdicionaCampoIncluido('numero'        , IntToStr(OrdemServico.numero));
  Auditoria.AdicionaCampoIncluido('codigo_produto', IntToStr(OrdemServico.codigo_produto));
  Auditoria.AdicionaCampoIncluido('codigo_cor'    , IntToStr(OrdemServico.codigo_cor));
  Auditoria.AdicionaCampoIncluido('codigo_tamanho', IntToStr(OrdemServico.codigo_tamanho));
  Auditoria.AdicionaCampoIncluido('quantidade'    , IntToStr(OrdemServico.quantidade));
end;

procedure TRepositorioOrdemServico.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TOrdemServico(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioOrdemServico.SetParametros(Objeto: TObject);
var
  OrdemServico :TOrdemServico;
begin
  OrdemServico := (Objeto as TOrdemServico);

  self.FQuery.ParamByName('codigo').AsInteger         := OrdemServico.codigo;
  self.FQuery.ParamByName('numero').AsInteger         := OrdemServico.numero;
  self.FQuery.ParamByName('codigo_produto').AsInteger := OrdemServico.codigo_produto;
  self.FQuery.ParamByName('codigo_cor').AsInteger     := OrdemServico.codigo_cor;
  self.FQuery.ParamByName('codigo_tamanho').AsInteger := OrdemServico.codigo_tamanho;
  self.FQuery.ParamByName('quantidade').AsInteger     := OrdemServico.quantidade;
  self.FQuery.ParamByName('impresso').AsString        := IfThen(OrdemServico.impresso,'S','');
end;

function TRepositorioOrdemServico.SQLGet: String;
begin
  result := 'select * from ORDEM_SERVICO where codigo = :ncod';
end;

function TRepositorioOrdemServico.SQLGetAll: String;
begin
  result := 'select * from ORDEM_SERVICO';
end;

function TRepositorioOrdemServico.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioOrdemServico.SQLRemover: String;
begin
  result := ' delete from ORDEM_SERVICO where codigo = :codigo ';
end;

function TRepositorioOrdemServico.SQLSalvar: String;
begin
  result := 'update or insert into ORDEM_SERVICO (CODIGO ,NUMERO ,CODIGO_PRODUTO ,CODIGO_COR ,CODIGO_TAMANHO ,QUANTIDADE, IMPRESSO) '+
           '                      values ( :CODIGO , :NUMERO , :CODIGO_PRODUTO , :CODIGO_COR , :CODIGO_TAMANHO , :QUANTIDADE, :IMPRESSO) ';
end;

end.

