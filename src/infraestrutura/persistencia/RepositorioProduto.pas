unit RepositorioProduto;

interface

uses
  DB,
  Repositorio,
  Auditoria;

type
  TRepositorioProduto = class(TRepositorio)

  protected
    function Get             (Dataset :TDataSet) :TObject; overload; override;
    function GetNomeDaTabela                     :String;            override;
    function GetIdentificador(Objeto :TObject)   :Variant;           override;
    function GetRepositorio                      :TRepositorio;      override;    

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
  Produto,
  FabricaRepositorio,
  SysUtils, Variants, Math, StrUtils;

{ TRepositorioProduto }

function TRepositorioProduto.Get(Dataset: TDataSet): TObject;
var
  Produto                     :TProduto;
begin
   Produto               := TProduto.Create;
   Produto.Codigo        := self.FQuery.FieldByName('codigo').AsInteger;
   Produto.Descricao     := self.FQuery.FieldByName('descricao').AsString;
   Produto.Cod_Ncm       := self.FQuery.FieldByName('cod_ncm').AsInteger;
   Produto.Cod_tipo      := self.FQuery.FieldByName('COD_TIPO').AsInteger;
   Produto.Cod_Grupo     := self.FQuery.FieldByName('COD_GRUPO').AsInteger;
   Produto.Cod_Colecao   := self.FQuery.FieldByName('COD_COLECAO').AsInteger;
   Produto.Cod_Grade     := self.FQuery.FieldByName('COD_GRADE').AsInteger;
   Produto.Linha_ano     := self.FQuery.FieldByName('LINHA_ANO').AsString;
   Produto.PrecoVenda    := self.FQuery.FieldByName('PRECO_CUSTO').AsFloat;
   Produto.PrecoCusto    := self.FQuery.FieldByName('PRECO_VENDA').AsFloat;
   Produto.PrecoAtacado  := self.FQuery.FieldByName('PRECO_ATACADO').AsFloat;
   Produto.PrecoMedio    := self.FQuery.FieldByName('PRECO_MEDIO').AsFloat;
   Produto.EstoqueFis    := self.FQuery.FieldByName('ESTOQUE_FIS').AsInteger;
   Produto.EstoqueMin    := self.FQuery.FieldByName('ESTOQUE_MIN').AsInteger;
   Produto.PesoLiq       := self.FQuery.FieldByName('PESO_LIQ').AsFloat;
   pRODUTO.PesoBru       := self.FQuery.FieldByName('PESO_BRU').AsFloat;
   Produto.Qtd_Pecas     := self.FQuery.fieldByName('Qtd_Pecas').AsInteger;
   Produto.Referencia    := trim(self.FQuery.fieldByName('referencia').AsString);
   Produto.Ativo         := (Dataset.FieldByName('ATIVO').AsString = 'S');
   Produto.Tipo          := self.FQuery.fieldByName('TIPO').AsString;
   Produto.UnidadeMedida := self.FQuery.fieldByName('UNIDADE_MEDIDA').AsString;
   Produto.Kit           := (self.FQuery.fieldByName('KIT').AsString = 'S');

   result := Produto;
end;

function TRepositorioProduto.GetIdentificador(Objeto: TObject): Variant;
begin
   result := TProduto(Objeto).Codigo;
end;

function TRepositorioProduto.GetNomeDaTabela: String;
begin
   result := 'ProdutoS';
end;

function TRepositorioProduto.GetRepositorio: TRepositorio;
begin
   result := TRepositorioProduto.Create;
end;

function TRepositorioProduto.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TProduto(Objeto).Codigo <= 0);
end;

procedure TRepositorioProduto.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  UAntigo, UNovo :TProduto;
begin
   UAntigo := (AntigoObjeto as TProduto);
   UNovo   := (Objeto       as TProduto);

   if (UAntigo.Descricao <> UNovo.Descricao) then
    Auditoria.AdicionaCampoAlterado('descricao', UAntigo.Descricao, UNovo.Descricao);

   if (UAntigo.Cod_Ncm <> UNovo.Cod_Ncm) then
    Auditoria.AdicionaCampoAlterado('cod_ncm', IntToStr(UAntigo.Cod_Ncm), IntToStr(UNovo.Cod_Ncm));

   if (UAntigo.Cod_tipo <> UNovo.Cod_tipo) then
    Auditoria.AdicionaCampoAlterado('cod_tipo', IntToStr(UAntigo.Cod_tipo), IntToStr(UNovo.Cod_tipo));

   if (UAntigo.Cod_Grupo <> UNovo.Cod_Grupo) then
    Auditoria.AdicionaCampoAlterado('cod_grupo', IntToStr(UAntigo.Cod_Grupo), IntToStr(UNovo.Cod_Grupo));

   if (UAntigo.Cod_Colecao <> UNovo.Cod_Colecao) then
    Auditoria.AdicionaCampoAlterado('cod_colecao', IntToStr(UAntigo.Cod_Colecao), IntToStr(UNovo.Cod_Colecao));

   if (UAntigo.Cod_Grade <> UNovo.Cod_Grade) then
    Auditoria.AdicionaCampoAlterado('cod_grade', IntToStr(UAntigo.Cod_Grade), IntToStr(UNovo.Cod_Grade));

   if (UAntigo.Linha_ano <> UNovo.Linha_ano) then
    Auditoria.AdicionaCampoAlterado('linha_ano', UAntigo.Linha_ano, UNovo.Linha_ano);

   if (UAntigo.PrecoVenda <> UNovo.PrecoVenda) then
    Auditoria.AdicionaCampoAlterado('preco_venda', FloatToStr(UAntigo.PrecoVenda), FloatToStr(UNovo.PrecoVenda));

   if (UAntigo.PrecoCusto <> UNovo.PrecoCusto) then
    Auditoria.AdicionaCampoAlterado('preco_custo', FloatToStr(UAntigo.PrecoCusto), FloatToStr(UNovo.PrecoCusto));

   if (UAntigo.PrecoAtacado <> UNovo.PrecoAtacado) then
    Auditoria.AdicionaCampoAlterado('preco_atacado', FloatToStr(UAntigo.PrecoAtacado), FloatToStr(UNovo.PrecoAtacado));

   if (UAntigo.PrecoMedio <> UNovo.PrecoMedio) then
    Auditoria.AdicionaCampoAlterado('preco_medio', FloatToStr(UAntigo.PrecoMedio), FloatToStr(UNovo.PrecoMedio));

   if (UAntigo.EstoqueFis <> UNovo.EstoqueFis) then
    Auditoria.AdicionaCampoAlterado('estoque_fis', IntToStr(UAntigo.EstoqueFis), IntToStr(UNovo.EstoqueFis));

   if (UAntigo.EstoqueMin <> UNovo.EstoqueMin) then
    Auditoria.AdicionaCampoAlterado('estoque_min', IntToStr(UAntigo.EstoqueMin), IntToStr(UNovo.EstoqueMin));

   if (UAntigo.PesoLiq <> UNovo.PesoLiq) then
    Auditoria.AdicionaCampoAlterado('peso_liq', FloatToStr(UAntigo.PesoLiq), FloatToStr(UNovo.PesoLiq));

   if (UAntigo.PesoBru <> UNovo.PesoBru) then
    Auditoria.AdicionaCampoAlterado('peso_bru', FloatToStr(UAntigo.PesoBru), FloatToStr(UNovo.PesoBru));

   if (UAntigo.Qtd_Pecas <> UNovo.Qtd_Pecas) then
    Auditoria.AdicionaCampoAlterado('qdt_pecas', FloatToStr(UAntigo.Qtd_Pecas), FloatToStr(UNovo.Qtd_Pecas));

   if (UAntigo.Referencia <> UNovo.Referencia) then
    Auditoria.AdicionaCampoAlterado('referencia', UAntigo.Referencia, UNovo.Referencia);

   if      (UAntigo.Ativo <> UNovo.Ativo) and UAntigo.Ativo then
    Auditoria.AdicionaCampoAlterado('ativo', 'S', 'N')
   else if (UAntigo.Ativo <> UNovo.Ativo) and (not UAntigo.Ativo) then
    Auditoria.AdicionaCampoAlterado('ativo', 'N', 'S');

   if (UAntigo.Tipo <> UNovo.Tipo) then
    Auditoria.AdicionaCampoAlterado('TIPO', UAntigo.Tipo, UNovo.Tipo);

   if (UAntigo.UnidadeMedida <> UNovo.UnidadeMedida) then
    Auditoria.AdicionaCampoAlterado('UNIDADE_MEDIDA', UAntigo.UnidadeMedida, UNovo.UnidadeMedida);
end;

procedure TRepositorioProduto.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  Produto :TProduto;
begin
   Produto := (Objeto as TProduto);

   Auditoria.AdicionaCampoExcluido('codigo',         intToStr(Produto.Codigo));
   Auditoria.AdicionaCampoExcluido('descricao',      Produto.Descricao);
   Auditoria.AdicionaCampoExcluido('cod_ncm',        intToStr(Produto.Cod_Ncm));
   Auditoria.AdicionaCampoExcluido('COD_TIPO',       intToStr(Produto.Cod_tipo));
   Auditoria.AdicionaCampoExcluido('COD_GRUPO',      intToStr(Produto.Cod_Grupo));
   Auditoria.AdicionaCampoExcluido('COD_COLECAO',    intToStr(Produto.Cod_Colecao));
   Auditoria.AdicionaCampoExcluido('COD_GRADE',      intToStr(Produto.Cod_Grade));
   Auditoria.AdicionaCampoExcluido('LINHA_ANO',      Produto.Linha_ano);
   Auditoria.AdicionaCampoExcluido('PRECO_CUSTO',    floatToStr(Produto.PrecoCusto));
   Auditoria.AdicionaCampoExcluido('PRECO_VENDA',    floatToStr(Produto.PrecoVenda));
   Auditoria.AdicionaCampoExcluido('PRECO_ATACADO',  floatToStr(Produto.PrecoAtacado));
   Auditoria.AdicionaCampoExcluido('PRECO_MEDIO',    floatToStr(Produto.PrecoMedio));
   Auditoria.AdicionaCampoExcluido('ESTOQUE_FIS',    intToStr(Produto.EstoqueFis));
   Auditoria.AdicionaCampoExcluido('ESTOQUE_MIN',    intToStr(Produto.EstoqueMin));
   Auditoria.AdicionaCampoExcluido('PESO_LIQ',       floatToStr(Produto.PesoLiq));
   Auditoria.AdicionaCampoExcluido('PESO_BRU',       floatToStr(Produto.PesoBru));
   Auditoria.AdicionaCampoExcluido('QTD_PECAS',      intToStr(Produto.Qtd_Pecas));
   Auditoria.AdicionaCampoExcluido('REFERENCIA',     Produto.Referencia);
   Auditoria.AdicionaCampoExcluido('TIPO',           Produto.Tipo);
   Auditoria.AdicionaCampoExcluido('UNIDADE_MEDIDA', Produto.UnidadeMedida);
   Auditoria.AdicionaCampoExcluido('ativo',          IfThen(Produto.Ativo,'S','N'));

end;

procedure TRepositorioProduto.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  Produto :TProduto;
begin
   Produto := (Objeto as TProduto);

   Auditoria.AdicionaCampoIncluido('codigo',         intToStr(Produto.Codigo));
   Auditoria.AdicionaCampoIncluido('descricao',      Produto.Descricao);
   Auditoria.AdicionaCampoIncluido('cod_ncm',        intToStr(Produto.Cod_Ncm));
   Auditoria.AdicionaCampoIncluido('COD_TIPO',       intToStr(Produto.Cod_tipo));
   Auditoria.AdicionaCampoIncluido('COD_GRUPO',      intToStr(Produto.Cod_Grupo));
   Auditoria.AdicionaCampoIncluido('COD_COLECAO',    intToStr(Produto.Cod_Colecao));
   Auditoria.AdicionaCampoIncluido('COD_GRADE',      intToStr(Produto.Cod_Grade));
   Auditoria.AdicionaCampoIncluido('LINHA_ANO',      Produto.Linha_ano);
   Auditoria.AdicionaCampoIncluido('PRECO_CUSTO',    floatToStr(Produto.PrecoCusto));
   Auditoria.AdicionaCampoIncluido('PRECO_VENDA',    floatToStr(Produto.PrecoVenda));
   Auditoria.AdicionaCampoIncluido('PRECO_ATACADO',  floatToStr(Produto.PrecoAtacado));
   Auditoria.AdicionaCampoIncluido('PRECO_MEDIO',    floatToStr(Produto.PrecoMedio));
   Auditoria.AdicionaCampoIncluido('ESTOQUE_FIS',    intToStr(Produto.EstoqueFis));
   Auditoria.AdicionaCampoIncluido('ESTOQUE_MIN',    intToStr(Produto.EstoqueMin));
   Auditoria.AdicionaCampoIncluido('PESO_LIQ',       floatToStr(Produto.PesoLiq));
   Auditoria.AdicionaCampoIncluido('PESO_BRU',       floatToStr(Produto.PesoBru));
   Auditoria.AdicionaCampoIncluido('QTD_PECAS',      intToStr(Produto.Qtd_Pecas));
   Auditoria.AdicionaCampoIncluido('REFERENCIA',     Produto.Referencia);
   Auditoria.AdicionaCampoIncluido('TIPO',           Produto.Tipo);
   Auditoria.AdicionaCampoIncluido('UNIDADE_MEDIDA', Produto.UnidadeMedida);

   if Produto.Ativo then Auditoria.AdicionaCampoIncluido('ativo',  'S')
   else                  Auditoria.AdicionaCampoIncluido('ativo',  'N');;
end;

procedure TRepositorioProduto.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
   TProduto(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioProduto.SetParametros(Objeto :TObject);
var
  Produto :TProduto;
begin
   Produto := (Objeto as TProduto);

   if (Produto.Codigo > 0) then inherited SetParametro('codigo', Produto.Codigo)
   else                         inherited LimpaParametro('codigo');

   inherited SetParametro('descricao',     Produto.Descricao);

   if Produto.Cod_Ncm > 0 then
     inherited SetParametro('cod_ncm',       Produto.Cod_Ncm);
   if Produto.Cod_tipo > 0 then
     inherited SetParametro('COD_TIPO',      Produto.Cod_tipo);
   if Produto.Cod_Grupo > 0 then
     inherited SetParametro('COD_GRUPO',     Produto.Cod_Grupo);
   if Produto.Cod_Colecao > 0 then
     inherited SetParametro('COD_COLECAO',   Produto.Cod_Colecao);
   if Produto.Cod_Grade > 0 then
     inherited SetParametro('COD_GRADE',     Produto.Cod_Grade);

   inherited SetParametro('LINHA_ANO',      Produto.Linha_ano);
   inherited SetParametro('PRECO_CUSTO',    Produto.PrecoCusto);
   inherited SetParametro('PRECO_VENDA',    Produto.PrecoVenda);
   inherited SetParametro('PRECO_ATACADO',  Produto.PrecoAtacado);
   inherited SetParametro('PRECO_MEDIO',    Produto.PrecoMedio);
   inherited SetParametro('ESTOQUE_FIS',    Produto.EstoqueFis);
   inherited SetParametro('ESTOQUE_MIN',    Produto.EstoqueMin);
   inherited SetParametro('PESO_LIQ',       Produto.PesoLiq);
   inherited SetParametro('PESO_BRU',       Produto.PesoBru);
   inherited SetParametro('QTD_PECAS',      Produto.Qtd_Pecas);
   inherited SetParametro('REFERENCIA',     Produto.Referencia);
   inherited SetParametro('TIPO',           Produto.Tipo);
   inherited SetParametro('UNIDADE_MEDIDA', Produto.UnidadeMedida);
   inherited SetParametro('ativo',          IfThen(Produto.Ativo,'S','N'));
   inherited SetParametro('KIT',            IfThen(Produto.Kit,'S','N'));

end;

function TRepositorioProduto.SQLGet: String;
begin
  result := 'select * from Produtos where codigo = :codigo ';
end;

function TRepositorioProduto.SQLGetAll: String;
begin
   result := 'select * from Produtos';
end;

function TRepositorioProduto.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from Produtos where '+ campo +' = :ncampo';
end;

function TRepositorioProduto.SQLRemover: String;
begin
   result := ' delete from Produtos where codigo = :codigo '; 
end;

function TRepositorioProduto.SQLSalvar: String;
begin
   result := 'update or INSERT INTO PRODUTOS (CODIGO, DESCRICAO, COD_NCM, COD_TIPO, COD_GRUPO, COD_COLECAO, COD_GRADE,        '+
             '                                LINHA_ANO, ATIVO, PRECO_CUSTO, PRECO_VENDA, PRECO_ATACADO, PRECO_MEDIO,         '+
             '                                ESTOQUE_FIS, ESTOQUE_MIN, PESO_LIQ, PESO_BRU, QTD_PECAS, REFERENCIA,            '+
             '                                TIPO, UNIDADE_MEDIDA, KIT)                                                      '+
             '                        values (:CODIGO, :DESCRICAO, :COD_NCM, :COD_TIPO, :COD_GRUPO, :COD_COLECAO, :COD_GRADE, '+
             '                                :LINHA_ANO, :ATIVO, :PRECO_CUSTO, :PRECO_VENDA, :PRECO_ATACADO, :PRECO_MEDIO,   '+
             '                                :ESTOQUE_FIS, :ESTOQUE_MIN, :PESO_LIQ, :PESO_BRU, :QTD_PECAS, :REFERENCIA,      '+
             '                                :TIPO, :UNIDADE_MEDIDA, :KIT)                                                   ';

end;

end.
