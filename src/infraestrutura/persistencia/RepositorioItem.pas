unit RepositorioItem;

interface

uses
  DB,
  Auditoria,
  Repositorio,
  math;

type
  TRepositorioItem = class(TRepositorio)

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
    function SQLGetExiste(campo: String): String;            override;

  protected
    function IsInsercao(Objeto :TObject) :Boolean;           override;

  protected
    procedure SetParametros   (Objeto :TObject                        ); override;
    procedure SetIdentificador(Objeto :TObject; Identificador :Variant); override;

  protected
    procedure ExecutaDepoisDeSalvar (Objeto :TObject); override;  

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
  Item, StrUtils;

{ TRepositorioItem }

function TRepositorioItem.CondicaoSQLGetAll: String;
begin
  result := ' WHERE COD_PEDIDO = '+FIdentificador;
end;

procedure TRepositorioItem.ExecutaDepoisDeSalvar(Objeto: TObject);
begin
   if TITem(Objeto).ZeraCodigo then
     TItem(Objeto).Codigo := 0;
end;

function TRepositorioItem.Get(Dataset: TDataSet): TObject;
var
  Item :TItem;
begin
   Item                   := TItem.Create;
   Item.Codigo            := self.FQuery.FieldByName('CODIGO'      ).AsInteger;
   Item.cod_pedido        := self.FQuery.FieldByName('COD_Pedido'  ).AsInteger;
   Item.cod_produto       := self.FQuery.FieldByName('COD_PRODUTO' ).AsInteger;
   Item.cod_cor           := self.FQuery.FieldByName('COD_COR'     ).AsInteger;
   Item.preco             := self.FQuery.FieldByName('PRECO'       ).AsFloat;
   Item.desconto          := self.FQuery.FieldByName('DESCONTO'    ).AsFloat;
   Item.valor_total       := self.FQuery.FieldByName('VALOR_TOTAL' ).AsFloat;
   Item.qtd_RN            := self.FQuery.FieldByName('QTD_RN'      ).AsInteger;
   Item.qtd_P             := self.FQuery.FieldByName('QTD_P'       ).AsInteger;
   Item.qtd_M             := self.FQuery.FieldByName('QTD_M'       ).AsInteger;
   Item.qtd_G             := self.FQuery.FieldByName('QTD_G'       ).AsInteger;
   Item.qtd_1             := self.FQuery.FieldByName('QTD_1'       ).AsInteger;
   Item.qtd_2             := self.FQuery.FieldByName('QTD_2'       ).AsInteger;
   Item.qtd_3             := self.FQuery.FieldByName('QTD_3'       ).AsInteger;
   Item.qtd_4             := self.FQuery.FieldByName('QTD_4'       ).AsInteger;
   Item.qtd_6             := self.FQuery.FieldByName('QTD_6'       ).AsInteger;
   Item.qtd_8             := self.FQuery.FieldByName('QTD_8'       ).AsInteger;
   Item.qtd_10            := self.FQuery.FieldByName('qtd_10'      ).AsInteger;
   Item.qtd_12            := self.FQuery.FieldByName('qtd_12'      ).AsInteger;
   Item.qtd_14            := self.FQuery.FieldByName('qtd_14'      ).AsInteger;
   Item.qtd_UNICA         := self.FQuery.FieldByName('QTD_UNICA'   ).AsFloat;
   Item.qtd_total         := self.FQuery.FieldByName('QTD_TOTAL'   ).AsFloat;
   Item.observacao        := self.FQuery.FieldByName('OBSERVACAO'  ).AsString;
   Item.peso              := self.FQuery.FieldByName('PESO'        ).AsFloat;
   Item.devolvido         := self.FQuery.FieldByName('DEVOLVIDO'   ).AsString;
   Item.codigoProdutoKit         := self.FQuery.FieldByName('codigo_kit'  ).AsInteger;

   result := Item;
end;

function TRepositorioItem.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TItem(Objeto).Codigo;
end;

function TRepositorioItem.GetNomeDaTabela: String;
begin
  result := 'ItenS';
end;

function TRepositorioItem.GetRepositorio: TRepositorio;
begin
  result := TRepositorioItem.Create;
end;

function TRepositorioItem.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TItem(Objeto).Codigo <= 0);
end;

procedure TRepositorioItem.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  ItemAntigo :TItem;
  ItemNovo   :TItem;
begin
   ItemAntigo := (AntigoObjeto as TItem);
   ItemNovo   := (Objeto       as TItem);

   if (ItemAntigo.cod_pedido <> ItemNovo.cod_pedido) then
    Auditoria.AdicionaCampoAlterado('cod_pedido', intToStr(ItemAntigo.cod_pedido), intToStr(ItemNovo.cod_pedido));
   if (ItemAntigo.cod_produto <> ItemNovo.cod_produto) then
    Auditoria.AdicionaCampoAlterado('cod_produto', intToStr(ItemAntigo.cod_produto), intToStr(ItemNovo.cod_produto));
   if (ItemAntigo.cod_cor <> ItemNovo.cod_cor) then
    Auditoria.AdicionaCampoAlterado('cod_cor', intToStr(ItemAntigo.cod_cor), intToStr(ItemNovo.cod_cor));
   if (ItemAntigo.preco <> ItemNovo.preco) then
    Auditoria.AdicionaCampoAlterado('preco', FloatToStr(ItemAntigo.preco), floatToStr(ItemNovo.preco));
   if (ItemAntigo.desconto <> ItemNovo.desconto) then
    Auditoria.AdicionaCampoAlterado('desconto', FloatToStr(ItemAntigo.desconto), floatToStr(ItemNovo.desconto));
   if (ItemAntigo.valor_total <> ItemNovo.valor_total) then
    Auditoria.AdicionaCampoAlterado('valor_total', FloatToStr(ItemAntigo.valor_total), floatToStr(ItemNovo.valor_total));
   if (ItemAntigo.qtd_RN <> ItemNovo.qtd_RN) then
    Auditoria.AdicionaCampoAlterado('qtd_RN', IntToStr(ItemAntigo.qtd_RN), IntToStr(ItemNovo.qtd_RN));
   if (ItemAntigo.qtd_P <> ItemNovo.qtd_P) then
    Auditoria.AdicionaCampoAlterado('qtd_P', IntToStr(ItemAntigo.qtd_P), IntToStr(ItemNovo.qtd_P));
   if (ItemAntigo.qtd_M <> ItemNovo.qtd_M) then
    Auditoria.AdicionaCampoAlterado('qtd_M', IntToStr(ItemAntigo.qtd_M), IntToStr(ItemNovo.qtd_M));
   if (ItemAntigo.qtd_G <> ItemNovo.qtd_G) then
    Auditoria.AdicionaCampoAlterado('qtd_G', IntToStr(ItemAntigo.qtd_G), IntToStr(ItemNovo.qtd_G));
   if (ItemAntigo.qtd_1 <> ItemNovo.qtd_1) then
    Auditoria.AdicionaCampoAlterado('qtd_1', IntToStr(ItemAntigo.qtd_1), IntToStr(ItemNovo.qtd_1));
   if (ItemAntigo.qtd_2 <> ItemNovo.qtd_2) then
    Auditoria.AdicionaCampoAlterado('qtd_RN', IntToStr(ItemAntigo.qtd_2), IntToStr(ItemNovo.qtd_2));
   if (ItemAntigo.qtd_3 <> ItemNovo.qtd_3) then
    Auditoria.AdicionaCampoAlterado('qtd_3', IntToStr(ItemAntigo.qtd_3), IntToStr(ItemNovo.qtd_3));
   if (ItemAntigo.qtd_4 <> ItemNovo.qtd_4) then
    Auditoria.AdicionaCampoAlterado('qtd_4', IntToStr(ItemAntigo.qtd_4), IntToStr(ItemNovo.qtd_4));
   if (ItemAntigo.qtd_6 <> ItemNovo.qtd_6) then
    Auditoria.AdicionaCampoAlterado('qtd_6', IntToStr(ItemAntigo.qtd_6), IntToStr(ItemNovo.qtd_6));
   if (ItemAntigo.qtd_8 <> ItemNovo.qtd_8) then
    Auditoria.AdicionaCampoAlterado('qtd_8', IntToStr(ItemAntigo.qtd_8), IntToStr(ItemNovo.qtd_8));
   if (ItemAntigo.qtd_10 <> ItemNovo.qtd_10) then
    Auditoria.AdicionaCampoAlterado('qtd_10', IntToStr(ItemAntigo.qtd_10), IntToStr(ItemNovo.qtd_10));
   if (ItemAntigo.qtd_12 <> ItemNovo.qtd_12) then
    Auditoria.AdicionaCampoAlterado('qtd_12', IntToStr(ItemAntigo.qtd_12), IntToStr(ItemNovo.qtd_12));
   if (ItemAntigo.qtd_14 <> ItemNovo.qtd_14) then
    Auditoria.AdicionaCampoAlterado('qtd_14', IntToStr(ItemAntigo.qtd_14), IntToStr(ItemNovo.qtd_14));
   if (ItemAntigo.qtd_UNICA <> ItemNovo.qtd_UNICA) then
    Auditoria.AdicionaCampoAlterado('qtd_UNICA', FloatToStr(ItemAntigo.qtd_UNICA), FloatToStr(ItemNovo.qtd_UNICA));
   if (ItemAntigo.qtd_total <> ItemNovo.qtd_total) then
    Auditoria.AdicionaCampoAlterado('qtd_total', FloatToStr(ItemAntigo.qtd_total), floatToStr(ItemNovo.qtd_total));
   if (ItemAntigo.observacao <> ItemNovo.observacao) then
    Auditoria.AdicionaCampoAlterado('OBSERVACAO', ItemAntigo.observacao, ItemNovo.observacao);
   if (ItemAntigo.peso <> ItemNovo.peso) then
    Auditoria.AdicionaCampoAlterado('peso', FloatToStr(ItemAntigo.peso), floatToStr(ItemNovo.peso));
   if (ItemAntigo.devolvido <> ItemNovo.devolvido) then
    Auditoria.AdicionaCampoAlterado('devolvido', ItemAntigo.devolvido, ItemNovo.devolvido);
   if (ItemAntigo.codigoProdutoKit <> ItemNovo.codigoProdutoKit) then
    Auditoria.AdicionaCampoAlterado('codigo_kit', IntToStr(ItemAntigo.codigoProdutoKit), IntToStr(ItemNovo.codigoProdutoKit));
end;

procedure TRepositorioItem.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Item :TItem;
begin
   Item := (Objeto as TItem);

   Auditoria.AdicionaCampoExcluido('CODIGO'           , intToStr(Item.codigo)            );
   Auditoria.AdicionaCampoExcluido('COD_PEDIDO'       , intToStr(Item.cod_pedido)      );
   Auditoria.AdicionaCampoExcluido('COD_PRODUTO'      , intToStr(Item.cod_produto)      );
   Auditoria.AdicionaCampoExcluido('COD_COR'          , intToStr(Item.cod_cor)          );
   Auditoria.AdicionaCampoExcluido('PRECO'            , FloatToStr(Item.preco)            );
   Auditoria.AdicionaCampoExcluido('DESCONTO'         , FloatToStr(Item.desconto)         );   
   Auditoria.AdicionaCampoExcluido('VALOR_TOTAL'      , FloatToStr(Item.valor_total)      );
   Auditoria.AdicionaCampoExcluido('QTD_RN'           , intToStr(Item.qtd_RN   )          );
   Auditoria.AdicionaCampoExcluido('QTD_P'            , intToStr(Item.qtd_P    )          );
   Auditoria.AdicionaCampoExcluido('QTD_M'            , intToStr(Item.qtd_M    )          );
   Auditoria.AdicionaCampoExcluido('QTD_G'            , intToStr(Item.qtd_G    )          );
   Auditoria.AdicionaCampoExcluido('QTD_1'            , intToStr(Item.qtd_1    )          );
   Auditoria.AdicionaCampoExcluido('QTD_2'            , intToStr(Item.qtd_2    )          );
   Auditoria.AdicionaCampoExcluido('QTD_3'            , intToStr(Item.qtd_3    )          );
   Auditoria.AdicionaCampoExcluido('QTD_4'            , intToStr(Item.qtd_4    )          );
   Auditoria.AdicionaCampoExcluido('QTD_6'            , intToStr(Item.qtd_6    )          );
   Auditoria.AdicionaCampoExcluido('QTD_8'            , intToStr(Item.qtd_8    )          );
   Auditoria.AdicionaCampoExcluido('qtd_10'           , intToStr(Item.qtd_10    )          );
   Auditoria.AdicionaCampoExcluido('qtd_12'           , intToStr(Item.qtd_12    )          );
   Auditoria.AdicionaCampoExcluido('qtd_14'           , intToStr(Item.qtd_14    )          );
   Auditoria.AdicionaCampoExcluido('QTD_UNICA'        , FloatToStr(Item.qtd_UNICA)        );
   Auditoria.AdicionaCampoExcluido('QTD_TOTAL'        , FloatToStr(Item.qtd_total)        );
   Auditoria.AdicionaCampoExcluido('OBSERVACAO'       , Item.observacao                   );
   Auditoria.AdicionaCampoExcluido('PESO'             , FloatToStr(Item.peso)        );
   Auditoria.AdicionaCampoExcluido('devolvido'        , Item.devolvido                   );
   Auditoria.AdicionaCampoExcluido('codigo_kit'       , intToStr(Item.codigoProdutoKit    )     );
end;

procedure TRepositorioItem.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Item :TItem;
begin
   Item := (Objeto as TItem);

   Auditoria.AdicionaCampoIncluido('CODIGO'           , intToStr(Item.codigo)             );
   Auditoria.AdicionaCampoIncluido('COD_PEDIDO'       , intToStr(Item.cod_pedido)         );
   Auditoria.AdicionaCampoIncluido('COD_PRODUTO'      , intToStr(Item.cod_produto)        );
   Auditoria.AdicionaCampoIncluido('COD_COR'          , intToStr(Item.cod_cor)            );
   Auditoria.AdicionaCampoIncluido('PRECO'            , FloatToStr(Item.preco)            );
   Auditoria.AdicionaCampoIncluido('DESCONTO'         , FloatToStr(Item.desconto)         );
   Auditoria.AdicionaCampoIncluido('VALOR_TOTAL'      , FloatToStr(Item.valor_total)      );
   Auditoria.AdicionaCampoIncluido('QTD_RN'           , intToStr(Item.qtd_RN   )          );
   Auditoria.AdicionaCampoIncluido('QTD_P'            , intToStr(Item.qtd_P    )          );
   Auditoria.AdicionaCampoIncluido('QTD_M'            , intToStr(Item.qtd_M    )          );
   Auditoria.AdicionaCampoIncluido('QTD_G'            , intToStr(Item.qtd_G    )          );
   Auditoria.AdicionaCampoIncluido('QTD_1'            , intToStr(Item.qtd_1    )          );
   Auditoria.AdicionaCampoIncluido('QTD_2'            , intToStr(Item.qtd_2    )          );
   Auditoria.AdicionaCampoIncluido('QTD_3'            , intToStr(Item.qtd_3    )          );
   Auditoria.AdicionaCampoIncluido('QTD_4'            , intToStr(Item.qtd_4    )          );
   Auditoria.AdicionaCampoIncluido('QTD_6'            , intToStr(Item.qtd_6    )          );
   Auditoria.AdicionaCampoIncluido('QTD_8'            , intToStr(Item.qtd_8    )          );
   Auditoria.AdicionaCampoIncluido('qtd_10'           , intToStr(Item.qtd_10    )         );
   Auditoria.AdicionaCampoIncluido('qtd_12'           , intToStr(Item.qtd_12    )         );
   Auditoria.AdicionaCampoIncluido('qtd_14'           , intToStr(Item.qtd_14    )         );
   Auditoria.AdicionaCampoIncluido('QTD_UNICA'        , FloatToStr(Item.qtd_UNICA)        );
   Auditoria.AdicionaCampoIncluido('QTD_TOTAL'        , FloatToStr(Item.qtd_total)        );
   Auditoria.AdicionaCampoIncluido('OBSERVACAO'       , Item.observacao                   );
   Auditoria.AdicionaCampoIncluido('PESO'             , FloatToStr(Item.peso)        );
   Auditoria.AdicionaCampoIncluido('devolvido'        , Item.devolvido                   );
   Auditoria.AdicionaCampoIncluido('codigo_kit'       , intToStr(Item.codigoProdutoKit    )     );
end;

procedure TRepositorioItem.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TItem(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioItem.SetParametros(Objeto: TObject);
var                                    
  Item :TItem;
begin
   Item := (Objeto as TItem);

   if (Item.Codigo > 0) then  inherited SetParametro('codigo', Item.Codigo)
   else                       inherited LimpaParametro('codigo');

   if Item.cod_pedido = 0 then
     inherited SetParametro('COD_PEDIDO'    , self.FDM.GetValorGenerator('GEN_PEDIDOS_ID'))
   else
     inherited SetParametro('COD_PEDIDO'    , Item.cod_pedido);

   inherited SetParametro('COD_PRODUTO'      , Item.cod_produto);
   inherited SetParametro('COD_COR'          , Item.cod_cor);
   inherited SetParametro('PRECO'            , Item.preco);
   inherited SetParametro('DESCONTO'         , Item.desconto);
   inherited SetParametro('VALOR_TOTAL'      , Item.valor_total);
   inherited SetParametro('QTD_RN'           , Item.qtd_RN   );
   inherited SetParametro('QTD_P'            , Item.qtd_P    );
   inherited SetParametro('QTD_M'            , Item.qtd_M    );
   inherited SetParametro('QTD_G'            , Item.qtd_G    );
   inherited SetParametro('QTD_1'            , Item.qtd_1    );
   inherited SetParametro('QTD_2'            , Item.qtd_2    );
   inherited SetParametro('QTD_3'            , Item.qtd_3    );
   inherited SetParametro('QTD_4'            , Item.qtd_4    );
   inherited SetParametro('QTD_6'            , Item.qtd_6    );
   inherited SetParametro('QTD_8'            , Item.qtd_8    );
   inherited SetParametro('qtd_10'           , Item.qtd_10    );
   inherited SetParametro('qtd_12'           , Item.qtd_12    );
   inherited SetParametro('qtd_14'           , Item.qtd_14    );
   inherited SetParametro('QTD_UNICA'        , Item.qtd_UNICA);
   inherited SetParametro('QTD_TOTAL'        , Item.qtd_total);
   inherited SetParametro('OBSERVACAO'       , Item.observacao);
   inherited SetParametro('PESO'             , Item.peso);
   inherited SetParametro('devolvido'        , Item.devolvido);
   inherited SetParametro('codigo_kit'       , Item.codigoProdutoKit );
end;

function TRepositorioItem.SQLGet: String;
begin
  result := 'select * from ItenS where codigo = :ncod';
end;

function TRepositorioItem.SQLGetAll: String;
begin
  result := 'select * from ItenS '+ IfThen(FIdentificador = '','', CondicaoSQLGetAll) +' order by codigo';
end;

function TRepositorioItem.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from ItenS where '+ campo +' = :ncampo';
end;

function TRepositorioItem.SQLRemover: String;
begin
   result := ' delete from ItenS where codigo = :codigo ';
end;

function TRepositorioItem.SQLSalvar: String;
begin
  result := 'UPDATE OR INSERT INTO ITENS (CODIGO, COD_PEDIDO, COD_PRODUTO, COD_COR, QTD_TOTAL,      '+
            '                             PRECO, DESCONTO,VALOR_TOTAL, QTD_RN, QTD_P, QTD_M,        '+
            '                             QTD_G, QTD_1, QTD_2, QTD_3,QTD_4, QTD_6, QTD_8,           '+
            '                             QTD_10, QTD_12, QTD_14, QTD_UNICA, OBSERVACAO, PESO, devolvido, codigo_kit)      '+
            'VALUES (:CODIGO, :COD_PEDIDO, :COD_PRODUTO, :COD_COR, :QTD_TOTAL, :PRECO, :DESCONTO,   '+
            '        :VALOR_TOTAL, :QTD_RN, :QTD_P, :QTD_M, :QTD_G, :QTD_1, :QTD_2, :QTD_3, :QTD_4, '+
            '        :QTD_6, :QTD_8, :QTD_10, :QTD_12, :QTD_14, :QTD_UNICA, :OBSERVACAO, :PESO, :devolvido, :codigo_kit)     ';

end;

end.
              
              
              
              
              
              
              

