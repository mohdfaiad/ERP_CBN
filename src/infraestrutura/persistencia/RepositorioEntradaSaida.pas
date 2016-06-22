unit RepositorioEntradaSaida;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioEntradaSaida = class(TRepositorio)

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

uses SysUtils, EntradaSaida;

{ TRepositorioEntradaSaida }

function TRepositorioEntradaSaida.Get(Dataset: TDataSet): TObject;
var
  EntradaSaida :TEntradaSaida;
begin
   EntradaSaida:= TEntradaSaida.Create;
   EntradaSaida.codigo           := self.FQuery.FieldByName('codigo').AsInteger;
   EntradaSaida.codigo_produto   := self.FQuery.FieldByName('codigo_produto').AsInteger;
   EntradaSaida.codigo_cor       := self.FQuery.FieldByName('codigo_cor').AsInteger;
   EntradaSaida.codigo_tamanho   := self.FQuery.FieldByName('codigo_tamanho').AsInteger;
   EntradaSaida.codigo_intervalo := self.FQuery.FieldByName('codigo_intervalo').AsInteger;
   EntradaSaida.data_lancamento  := self.FQuery.FieldByName('data_lancamento').AsDateTime;
   EntradaSaida.data_producao    := self.FQuery.FieldByName('data_producao').AsDateTime;
   EntradaSaida.quantidade       := self.FQuery.FieldByName('quantidade').AsFloat;
   EntradaSaida.tipo             := self.FQuery.FieldByName('tipo').AsString;

   result := EntradaSaida;
end;

function TRepositorioEntradaSaida.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TEntradaSaida(Objeto).Codigo;
end;

function TRepositorioEntradaSaida.GetNomeDaTabela: String;
begin
  result := 'ENTRADAS_SAIDAS';
end;

function TRepositorioEntradaSaida.GetRepositorio: TRepositorio;
begin
  result := TRepositorioEntradaSaida.Create;
end;

function TRepositorioEntradaSaida.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TEntradaSaida(Objeto).Codigo <= 0);
end;

procedure TRepositorioEntradaSaida.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  EntradaSaidaAntigo :TEntradaSaida;
  EntradaSaidaNovo :TEntradaSaida;
begin
   EntradaSaidaAntigo := (AntigoObjeto as TEntradaSaida);
   EntradaSaidaNovo   := (Objeto       as TEntradaSaida);

   if (EntradaSaidaAntigo.codigo_produto <> EntradaSaidaNovo.codigo_produto) then
     Auditoria.AdicionaCampoAlterado('codigo_produto', IntToStr(EntradaSaidaAntigo.codigo_produto), IntToStr(EntradaSaidaNovo.codigo_produto));

   if (EntradaSaidaAntigo.codigo_cor <> EntradaSaidaNovo.codigo_cor) then
     Auditoria.AdicionaCampoAlterado('codigo_cor', IntToStr(EntradaSaidaAntigo.codigo_cor), IntToStr(EntradaSaidaNovo.codigo_cor));

   if (EntradaSaidaAntigo.codigo_tamanho <> EntradaSaidaNovo.codigo_tamanho) then
     Auditoria.AdicionaCampoAlterado('codigo_tamanho', IntToStr(EntradaSaidaAntigo.codigo_tamanho), IntToStr(EntradaSaidaNovo.codigo_tamanho));

   if (EntradaSaidaAntigo.codigo_intervalo <> EntradaSaidaNovo.codigo_intervalo) then
     Auditoria.AdicionaCampoAlterado('codigo_intervalo', IntToStr(EntradaSaidaAntigo.codigo_intervalo), IntToStr(EntradaSaidaNovo.codigo_intervalo));

   if (EntradaSaidaAntigo.data_lancamento <> EntradaSaidaNovo.data_lancamento) then
     Auditoria.AdicionaCampoAlterado('data_lancamento', DateToStr(EntradaSaidaAntigo.data_lancamento), DateToStr(EntradaSaidaNovo.data_lancamento));

   if (EntradaSaidaAntigo.data_producao <> EntradaSaidaNovo.data_producao) then
     Auditoria.AdicionaCampoAlterado('data_producao', DateToStr(EntradaSaidaAntigo.data_producao), DateToStr(EntradaSaidaNovo.data_producao));

   if (EntradaSaidaAntigo.quantidade <> EntradaSaidaNovo.quantidade) then
     Auditoria.AdicionaCampoAlterado('quantidade', FloatToStr(EntradaSaidaAntigo.quantidade), FloatToStr(EntradaSaidaNovo.quantidade));

   if (EntradaSaidaAntigo.tipo <> EntradaSaidaNovo.tipo) then
     Auditoria.AdicionaCampoAlterado('tipo', EntradaSaidaAntigo.tipo, EntradaSaidaNovo.tipo);

end;

procedure TRepositorioEntradaSaida.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  EntradaSaida :TEntradaSaida;
begin
  EntradaSaida := (Objeto as TEntradaSaida);
  Auditoria.AdicionaCampoExcluido('codigo'          , IntToStr(EntradaSaida.codigo));
  Auditoria.AdicionaCampoExcluido('codigo_produto'  , IntToStr(EntradaSaida.codigo_produto));
  Auditoria.AdicionaCampoExcluido('codigo_cor'      , IntToStr(EntradaSaida.codigo_cor));
  Auditoria.AdicionaCampoExcluido('codigo_tamanho'  , IntToStr(EntradaSaida.codigo_tamanho));
  Auditoria.AdicionaCampoExcluido('codigo_intervalo', IntToStr(EntradaSaida.codigo_intervalo));
  Auditoria.AdicionaCampoExcluido('data_lancamento' , DateToStr(EntradaSaida.data_lancamento));
  Auditoria.AdicionaCampoExcluido('data_producao'   , DateToStr(EntradaSaida.data_producao));
  Auditoria.AdicionaCampoExcluido('quantidade'      , FloatToStr(EntradaSaida.quantidade));
  Auditoria.AdicionaCampoExcluido('tipo'            , EntradaSaida.tipo);
end;

procedure TRepositorioEntradaSaida.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  EntradaSaida :TEntradaSaida;
begin
  EntradaSaida := (Objeto as TEntradaSaida);
  Auditoria.AdicionaCampoIncluido('codigo'          ,    IntToStr(EntradaSaida.codigo));
  Auditoria.AdicionaCampoIncluido('codigo_produto'  ,    IntToStr(EntradaSaida.codigo_produto));
  Auditoria.AdicionaCampoIncluido('codigo_cor'      ,    IntToStr(EntradaSaida.codigo_cor));
  Auditoria.AdicionaCampoIncluido('codigo_tamanho'  ,    IntToStr(EntradaSaida.codigo_tamanho));
  Auditoria.AdicionaCampoIncluido('codigo_intervalo',    IntToStr(EntradaSaida.codigo_intervalo));
  Auditoria.AdicionaCampoIncluido('data_lancamento' ,    DateToStr(EntradaSaida.data_lancamento));
  Auditoria.AdicionaCampoIncluido('data_producao'   ,    DateToStr(EntradaSaida.data_producao));
  Auditoria.AdicionaCampoIncluido('quantidade'      ,    FloatToStr(EntradaSaida.quantidade));
  Auditoria.AdicionaCampoIncluido('tipo'            ,    EntradaSaida.tipo);
end;

procedure TRepositorioEntradaSaida.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TEntradaSaida(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioEntradaSaida.SetParametros(Objeto: TObject);
var
  EntradaSaida :TEntradaSaida;
begin
  EntradaSaida := (Objeto as TEntradaSaida);

  self.FQuery.ParamByName('codigo').AsInteger           := EntradaSaida.codigo;
  self.FQuery.ParamByName('codigo_produto').AsInteger   := EntradaSaida.codigo_produto;
  self.FQuery.ParamByName('codigo_cor').AsInteger       := EntradaSaida.codigo_cor;
  self.FQuery.ParamByName('codigo_tamanho').AsInteger   := EntradaSaida.codigo_tamanho;

  if EntradaSaida.codigo_intervalo > 0 then
    self.FQuery.ParamByName('codigo_intervalo').AsInteger := EntradaSaida.codigo_intervalo;
    
  self.FQuery.ParamByName('data_lancamento').AsDateTime := EntradaSaida.data_lancamento;
  self.FQuery.ParamByName('data_producao').AsDateTime   := EntradaSaida.data_producao;
  self.FQuery.ParamByName('quantidade').AsFloat         := EntradaSaida.quantidade;
  self.FQuery.ParamByName('tipo').AsString              := EntradaSaida.tipo;
end;

function TRepositorioEntradaSaida.SQLGet: String;
begin
  result := 'select * from ENTRADAS_SAIDAS where codigo = :ncod';
end;

function TRepositorioEntradaSaida.SQLGetAll: String;
begin
  result := 'select * from ENTRADAS_SAIDAS';
end;

function TRepositorioEntradaSaida.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from ENTRADAS_SAIDAS where '+ campo +' = :ncampo';
end;

function TRepositorioEntradaSaida.SQLRemover: String;
begin
  result := ' delete from ENTRADAS_SAIDAS where codigo = :codigo ';
end;

function TRepositorioEntradaSaida.SQLSalvar: String;
begin
  result := 'update or insert into ENTRADAS_SAIDAS (CODIGO ,CODIGO_PRODUTO ,CODIGO_COR ,CODIGO_TAMANHO ,CODIGO_INTERVALO ,DATA_LANCAMENTO ,DATA_PRODUCAO ,QUANTIDADE ,TIPO) '+
           '                      values ( :CODIGO , :CODIGO_PRODUTO , :CODIGO_COR , :CODIGO_TAMANHO , :CODIGO_INTERVALO , :DATA_LANCAMENTO , :DATA_PRODUCAO , :QUANTIDADE , :TIPO) ';
end;

end.

