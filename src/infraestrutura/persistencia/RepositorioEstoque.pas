unit RepositorioEstoque;

interface

uses
  DB,
  Auditoria,
  Repositorio,
  Math;

type
  TRepositorioEstoque = class(TRepositorio)

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
  Estoque, StrUtils;

{ TRepositorioEstoque }

function TRepositorioEstoque.CondicaoSQLGetAll: String;
begin
  result := ' WHERE CODIGO_PRODUTO = '+FIdentificador;
end;

function TRepositorioEstoque.Get(Dataset: TDataSet): TObject;
var
  Estoque :TEstoque;
begin
   Estoque                := TEstoque.Create;
   Estoque.Codigo         := self.FQuery.FieldByName('codigo'        ).AsInteger;
   Estoque.codigo_produto := self.FQuery.FieldByName('codigo_produto').AsInteger;
   Estoque.codigo_tamanho := self.FQuery.FieldByName('codigo_tamanho').AsInteger;
   Estoque.codigo_cor     := self.FQuery.FieldByName('codigo_cor'    ).AsInteger;
   Estoque.quantidade     := self.FQuery.FieldByName('quantidade'    ).AsFloat;
   Estoque.setor          := self.FQuery.FieldByName('setor'         ).AsInteger;
 //  Estoque.qtd_reservada  := self.FQuery.FieldByName('qtd_reservada' ).AsFloat;   
   result := Estoque;
end;

function TRepositorioEstoque.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TEstoque(Objeto).Codigo;
end;

function TRepositorioEstoque.GetNomeDaTabela: String;
begin
  result := 'Estoque';
end;

function TRepositorioEstoque.GetRepositorio: TRepositorio;
begin
  result := TRepositorioEstoque.Create;
end;

function TRepositorioEstoque.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TEstoque(Objeto).Codigo <= 0);
end;

procedure TRepositorioEstoque.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  EstoqueAntigo :TEstoque;
  EstoqueNovo   :TEstoque;
begin
   EstoqueAntigo := (AntigoObjeto as TEstoque);
   EstoqueNovo   := (Objeto       as TEstoque);

   if (EstoqueAntigo.codigo_produto <> EstoqueNovo.codigo_produto) then
    Auditoria.AdicionaCampoAlterado('codigo_produto', IntToStr(EstoqueAntigo.codigo_produto), IntToStr(EstoqueNovo.codigo_produto));
   if (EstoqueAntigo.codigo_tamanho <> EstoqueNovo.codigo_tamanho) then
    Auditoria.AdicionaCampoAlterado('codigo_tamanho', IntToStr(EstoqueAntigo.codigo_tamanho), IntToStr(EstoqueNovo.codigo_tamanho));
   if (EstoqueAntigo.codigo_cor <> EstoqueNovo.codigo_cor) then
    Auditoria.AdicionaCampoAlterado('codigo_cor', IntToStr(EstoqueAntigo.codigo_cor), IntToStr(EstoqueNovo.codigo_cor));
   if (EstoqueAntigo.quantidade <> EstoqueNovo.quantidade) then
    Auditoria.AdicionaCampoAlterado('quantidade', floatToStr(EstoqueAntigo.quantidade), floatToStr(EstoqueNovo.quantidade));
   if (EstoqueAntigo.setor <> EstoqueNovo.setor) then
    Auditoria.AdicionaCampoAlterado('setor', IntToStr(EstoqueAntigo.setor), IntToStr(EstoqueNovo.setor));
 //  if (EstoqueAntigo.qtd_reservada <> EstoqueNovo.qtd_reservada) then
//    Auditoria.AdicionaCampoAlterado('qtd_reservada', floatToStr(EstoqueAntigo.qtd_reservada), floatToStr(EstoqueNovo.qtd_reservada));
end;

procedure TRepositorioEstoque.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Estoque :TEstoque;
begin
   Estoque := (Objeto as TEstoque);

   Auditoria.AdicionaCampoExcluido('codigo'         , intToStr(Estoque.Codigo));
   Auditoria.AdicionaCampoExcluido('codigo_produto' , intToStr(Estoque.codigo_produto));
   Auditoria.AdicionaCampoExcluido('codigo_tamanho' , intToStr(Estoque.codigo_tamanho));
   Auditoria.AdicionaCampoExcluido('codigo_cor'     , intToStr(Estoque.codigo_cor));
   Auditoria.AdicionaCampoExcluido('quantidade'     , floatToStr(Estoque.quantidade));
   Auditoria.AdicionaCampoExcluido('setor'          , intToStr(Estoque.setor));
 //  Auditoria.AdicionaCampoExcluido('qtd_reservada'  , floatToStr(Estoque.qtd_reservada));
end;

procedure TRepositorioEstoque.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Estoque :TEstoque;
begin
   Estoque := (Objeto as TEstoque);

   Auditoria.AdicionaCampoIncluido('codigo'         , intToStr(Estoque.Codigo));
   Auditoria.AdicionaCampoIncluido('codigo_produto' , intToStr(Estoque.codigo_produto));
   Auditoria.AdicionaCampoIncluido('codigo_tamanho' , intToStr(Estoque.codigo_tamanho));
   Auditoria.AdicionaCampoIncluido('codigo_cor'     , intToStr(Estoque.codigo_cor));
   Auditoria.AdicionaCampoIncluido('quantidade'     , floatToStr(Estoque.quantidade));
   Auditoria.AdicionaCampoIncluido('setor'          , intToStr(Estoque.setor));
 //  Auditoria.AdicionaCampoIncluido('qtd_reservada'  , floatToStr(Estoque.qtd_reservada));
end;

procedure TRepositorioEstoque.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TEstoque(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioEstoque.SetParametros(Objeto: TObject);
var
  Estoque :TEstoque;
begin
   Estoque := (Objeto as TEstoque);

   if (Estoque.Codigo > 0) then  inherited SetParametro('codigo', Estoque.Codigo)
   else                         inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('codigo_produto').AsInteger        := Estoque.codigo_produto;
   self.FQuery.ParamByName('codigo_tamanho').AsInteger        := Estoque.codigo_tamanho;
   self.FQuery.ParamByName('codigo_cor'    ).AsInteger        := Estoque.codigo_cor;
   self.FQuery.ParamByName('quantidade'    ).AsFloat          := Estoque.quantidade;
   self.FQuery.ParamByName('setor'         ).AsInteger        := Estoque.setor;
  // self.FQuery.ParamByName('qtd_reservada' ).AsFloat          := Estoque.qtd_reservada;
end;

function TRepositorioEstoque.SQLGet: String;
begin
  result := 'select * from Estoque where codigo = :ncod';
end;

function TRepositorioEstoque.SQLGetAll: String;
begin
  result := 'select * from Estoque'+ IfThen(FIdentificador = '','', CondicaoSQLGetAll) +' order by codigo';
end;

function TRepositorioEstoque.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioEstoque.SQLRemover: String;
begin
   result := ' delete from Estoque where codigo = :codigo ';
end;

function TRepositorioEstoque.SQLSalvar: String;
begin
  result := 'update or insert into Estoque                                                         '+
            '        (codigo, codigo_produto, codigo_tamanho, codigo_cor, quantidade, setor)       '+
            ' Values (:codigo, :codigo_produto, :codigo_tamanho, :codigo_cor, :quantidade, :setor) ';
end;

end.








