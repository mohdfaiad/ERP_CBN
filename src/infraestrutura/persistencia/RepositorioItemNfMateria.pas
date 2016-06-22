unit RepositorioItemNfMateria;                                                       
interface                                                                                          
uses DB,
     Auditoria,
     Repositorio;                                       
type
  TRepositorioItemNfMateria = class(TRepositorio)                      
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
  ItemNfMateria,
  Funcoes;                                                                        

{ TRepositorioItemNfMateria }                                                      

function TRepositorioItemNfMateria.Get(Dataset: TDataSet): TObject;                  
var                                                                                                
  ItemNfMateria :TItemNfMateria;                                                 
begin                                                                                              
   ItemNfMateria                        := TItemNfMateria.Create;
   ItemNfMateria.CODIGO                 := self.FQuery.FieldByName('CODIGO'  ).AsInteger;
   ItemNfMateria.CODIGO_NOTA_FISCAL     := self.FQuery.FieldByName('CODIGO_NOTA_FISCAL'  ).AsInteger;
   ItemNfMateria.CODIGO_MATERIA         := self.FQuery.FieldByName('CODIGO_MATERIA'  ).AsInteger;
   ItemNfMateria.QUANTIDADE             := self.FQuery.FieldByName('QUANTIDADE'  ).AsFloat;
   ItemNfMateria.UNIDADE                := self.FQuery.FieldByName('UNIDADE'  ).AsString;
   ItemNfMateria.CLASSIFICACAO_FISCAL   := self.FQuery.FieldByName('CLASSIFICACAO_FISCAL'  ).AsString;
   ItemNfMateria.ORIGEM                 := self.FQuery.FieldByName('ORIGEM'  ).AsInteger;
   ItemNfMateria.VALOR_UNITARIO         := self.FQuery.FieldByName('VALOR_UNITARIO'  ).AsFloat;
   ItemNfMateria.VALOR_BRUTO            := self.FQuery.FieldByName('VALOR_BRUTO'  ).AsFloat;
   ItemNfMateria.VALOR_FRETE            := self.FQuery.FieldByName('VALOR_FRETE'  ).AsFloat;
   ItemNfMateria.VALOR_SEGURO           := self.FQuery.FieldByName('VALOR_SEGURO'  ).AsFloat;
   ItemNfMateria.VALOR_DESCONTO         := self.FQuery.FieldByName('VALOR_DESCONTO'  ).AsFloat;
   ItemNfMateria.VALOR_OUTRAS_DESPESAS     := self.FQuery.FieldByName('VALOR_OUTRAS_DESPESAS'  ).AsFloat;
   ItemNfMateria.PER_ICM     := self.FQuery.FieldByName('PER_ICM'  ).AsFloat;
   ItemNfMateria.PER_IPI     := self.FQuery.FieldByName('PER_IPI'  ).AsFloat;
   ItemNfMateria.PER_SUB     := self.FQuery.FieldByName('PER_SUB'  ).AsFloat;
   ItemNfMateria.PER_PIS     := self.FQuery.FieldByName('PER_PIS'  ).AsFloat;
   ItemNfMateria.PER_COFINS     := self.FQuery.FieldByName('PER_COFINS'  ).AsFloat;
   ItemNfMateria.BASE_ICM     := self.FQuery.FieldByName('BASE_ICM'  ).AsFloat;
   ItemNfMateria.BASE_IPI     := self.FQuery.FieldByName('BASE_IPI'  ).AsFloat;
   ItemNfMateria.BASE_SUB     := self.FQuery.FieldByName('BASE_SUB'  ).AsFloat;
   ItemNfMateria.BASE_PIS     := self.FQuery.FieldByName('BASE_PIS'  ).AsFloat;
   ItemNfMateria.BASE_COFINS     := self.FQuery.FieldByName('BASE_COFINS'  ).AsFloat;
   ItemNfMateria.cst                  := self.FQuery.FieldByName('CST').AsString;
   ItemNfMateria.csosn                := self.FQuery.FieldByName('CSOSN').AsString;
   ItemNfMateria.cFOP                := self.FQuery.FieldByName('CFOP').AsString;         
   result := ItemNfMateria;
end;                                                                                               

function TRepositorioItemNfMateria.GetIdentificador(Objeto: TObject): Variant;       
begin                                                                                              
  result := TItemNfMateria(Objeto).Codigo;                                                 
end;                                                                                               

function TRepositorioItemNfMateria.GetNomeDaTabela: String;                          
begin                                                                                              
result := 'ITENS_NF_MATERIA';                                                                          
end;                                                                                               

function TRepositorioItemNfMateria.GetRepositorio: TRepositorio;                     
begin                                                                                              
result := TRepositorioItemNfMateria.Create;                                          
end;                                                                                               

function TRepositorioItemNfMateria.IsInsercao(Objeto: TObject): Boolean;             
begin                                                                                              
  result := (TItemNfMateria(Objeto).Codigo <= 0);                                         
end;                                                                                               

procedure TRepositorioItemNfMateria.SetCamposAlterados(Auditoria: TAuditoria;        
  AntigoObjeto, Objeto: TObject);                                                                  
var                                                                                                
  ItemNfMateriaAntigo :TItemNfMateria;                                           
  ItemNfMateriaNovo   :TItemNfMateria;                                           
begin                                                                                              
   ItemNfMateriaAntigo := (AntigoObjeto as TItemNfMateria);                      
   ItemNfMateriaNovo   := (Objeto       as TItemNfMateria);                      

   if (ItemNfMateriaAntigo.CODIGO_NOTA_FISCAL <> ItemNfMateriaNovo.CODIGO_NOTA_FISCAL) then
   Auditoria.AdicionaCampoAlterado('CODIGO_NOTA_FISCAL', intToStr(ItemNfMateriaAntigo.CODIGO_NOTA_FISCAL), intToStr(ItemNfMateriaNovo.CODIGO_NOTA_FISCAL));

   if (ItemNfMateriaAntigo.CODIGO_MATERIA <> ItemNfMateriaNovo.CODIGO_MATERIA) then
   Auditoria.AdicionaCampoAlterado('CODIGO_MATERIA', intToStr(ItemNfMateriaAntigo.CODIGO_MATERIA), intToStr(ItemNfMateriaNovo.CODIGO_MATERIA));

   if (ItemNfMateriaAntigo.QUANTIDADE <> ItemNfMateriaNovo.QUANTIDADE) then
   Auditoria.AdicionaCampoAlterado('QUANTIDADE', FloatToStr(ItemNfMateriaAntigo.QUANTIDADE), FloatToStr(ItemNfMateriaNovo.QUANTIDADE));

   if (ItemNfMateriaAntigo.UNIDADE <> ItemNfMateriaNovo.UNIDADE) then
   Auditoria.AdicionaCampoAlterado('UNIDADE', ItemNfMateriaAntigo.UNIDADE, ItemNfMateriaNovo.UNIDADE);

   if (ItemNfMateriaAntigo.CLASSIFICACAO_FISCAL <> ItemNfMateriaNovo.CLASSIFICACAO_FISCAL) then
   Auditoria.AdicionaCampoAlterado('CLASSIFICACAO_FISCAL', ItemNfMateriaAntigo.CLASSIFICACAO_FISCAL, ItemNfMateriaNovo.CLASSIFICACAO_FISCAL);

   if (ItemNfMateriaAntigo.ORIGEM <> ItemNfMateriaNovo.ORIGEM) then
   Auditoria.AdicionaCampoAlterado('ORIGEM', intToStr(ItemNfMateriaAntigo.ORIGEM), intToStr(ItemNfMateriaNovo.ORIGEM));

   if (ItemNfMateriaAntigo.VALOR_UNITARIO <> ItemNfMateriaNovo.VALOR_UNITARIO) then
   Auditoria.AdicionaCampoAlterado('VALOR_UNITARIO', FloatToStr(ItemNfMateriaAntigo.VALOR_UNITARIO), FloatToStr(ItemNfMateriaNovo.VALOR_UNITARIO));

   if (ItemNfMateriaAntigo.VALOR_BRUTO <> ItemNfMateriaNovo.VALOR_BRUTO) then
   Auditoria.AdicionaCampoAlterado('VALOR_BRUTO', FloatToStr(ItemNfMateriaAntigo.VALOR_BRUTO), FloatToStr(ItemNfMateriaNovo.VALOR_BRUTO));

   if (ItemNfMateriaAntigo.VALOR_FRETE <> ItemNfMateriaNovo.VALOR_FRETE) then
   Auditoria.AdicionaCampoAlterado('VALOR_FRETE', FloatToStr(ItemNfMateriaAntigo.VALOR_FRETE), FloatToStr(ItemNfMateriaNovo.VALOR_FRETE));

   if (ItemNfMateriaAntigo.VALOR_SEGURO <> ItemNfMateriaNovo.VALOR_SEGURO) then
   Auditoria.AdicionaCampoAlterado('VALOR_SEGURO', FloatToStr(ItemNfMateriaAntigo.VALOR_SEGURO), FloatToStr(ItemNfMateriaNovo.VALOR_SEGURO));

   if (ItemNfMateriaAntigo.VALOR_DESCONTO <> ItemNfMateriaNovo.VALOR_DESCONTO) then
   Auditoria.AdicionaCampoAlterado('VALOR_DESCONTO', FloatToStr(ItemNfMateriaAntigo.VALOR_DESCONTO), FloatToStr(ItemNfMateriaNovo.VALOR_DESCONTO));

   if (ItemNfMateriaAntigo.VALOR_OUTRAS_DESPESAS <> ItemNfMateriaNovo.VALOR_OUTRAS_DESPESAS) then
   Auditoria.AdicionaCampoAlterado('VALOR_OUTRAS_DESPESAS', FloatToStr(ItemNfMateriaAntigo.VALOR_OUTRAS_DESPESAS), FloatToStr(ItemNfMateriaNovo.VALOR_OUTRAS_DESPESAS));

   if (ItemNfMateriaAntigo.PER_ICM <> ItemNfMateriaNovo.PER_ICM) then
   Auditoria.AdicionaCampoAlterado('PER_ICM', FloatToStr(ItemNfMateriaAntigo.PER_ICM), FloatToStr(ItemNfMateriaNovo.PER_ICM));

   if (ItemNfMateriaAntigo.PER_IPI <> ItemNfMateriaNovo.PER_IPI) then
   Auditoria.AdicionaCampoAlterado('PER_IPI', FloatToStr(ItemNfMateriaAntigo.PER_IPI), FloatToStr(ItemNfMateriaNovo.PER_IPI));

   if (ItemNfMateriaAntigo.PER_SUB <> ItemNfMateriaNovo.PER_SUB) then
   Auditoria.AdicionaCampoAlterado('PER_SUB', FloatToStr(ItemNfMateriaAntigo.PER_SUB), FloatToStr(ItemNfMateriaNovo.PER_SUB));

   if (ItemNfMateriaAntigo.PER_PIS <> ItemNfMateriaNovo.PER_PIS) then
   Auditoria.AdicionaCampoAlterado('PER_PIS', FloatToStr(ItemNfMateriaAntigo.PER_PIS), FloatToStr(ItemNfMateriaNovo.PER_PIS));

   if (ItemNfMateriaAntigo.PER_COFINS <> ItemNfMateriaNovo.PER_COFINS) then
   Auditoria.AdicionaCampoAlterado('PER_COFINS', FloatToStr(ItemNfMateriaAntigo.PER_COFINS), FloatToStr(ItemNfMateriaNovo.PER_COFINS));

   if (ItemNfMateriaAntigo.BASE_ICM <> ItemNfMateriaNovo.BASE_ICM) then
   Auditoria.AdicionaCampoAlterado('BASE_ICM', FloatToStr(ItemNfMateriaAntigo.BASE_ICM), FloatToStr(ItemNfMateriaNovo.BASE_ICM));

   if (ItemNfMateriaAntigo.BASE_IPI <> ItemNfMateriaNovo.BASE_IPI) then
   Auditoria.AdicionaCampoAlterado('BASE_IPI', FloatToStr(ItemNfMateriaAntigo.BASE_IPI), FloatToStr(ItemNfMateriaNovo.BASE_IPI));

   if (ItemNfMateriaAntigo.BASE_SUB <> ItemNfMateriaNovo.BASE_SUB) then
   Auditoria.AdicionaCampoAlterado('BASE_SUB', FloatToStr(ItemNfMateriaAntigo.BASE_SUB), FloatToStr(ItemNfMateriaNovo.BASE_SUB));

   if (ItemNfMateriaAntigo.BASE_PIS <> ItemNfMateriaNovo.BASE_PIS) then
   Auditoria.AdicionaCampoAlterado('BASE_PIS', FloatToStr(ItemNfMateriaAntigo.BASE_PIS), FloatToStr(ItemNfMateriaNovo.BASE_PIS));

   if (ItemNfMateriaAntigo.BASE_COFINS <> ItemNfMateriaNovo.BASE_COFINS) then
   Auditoria.AdicionaCampoAlterado('BASE_COFINS', FloatToStr(ItemNfMateriaAntigo.BASE_COFINS), FloatToStr(ItemNfMateriaNovo.BASE_COFINS));

   if (ItemNfMateriaAntigo.cst <> ItemNfMateriaNovo.cst) then
   Auditoria.AdicionaCampoAlterado('cst', ItemNfMateriaAntigo.cst, ItemNfMateriaNovo.cst);

   if (ItemNfMateriaAntigo.csosn <> ItemNfMateriaNovo.csosn) then
   Auditoria.AdicionaCampoAlterado('csosn', ItemNfMateriaAntigo.csosn, ItemNfMateriaNovo.csosn);

   if (ItemNfMateriaAntigo.cfop <> ItemNfMateriaNovo.cfop) then
   Auditoria.AdicionaCampoAlterado('cfop', ItemNfMateriaAntigo.cfop, ItemNfMateriaNovo.cfop);

end;                                                                                               

procedure TRepositorioItemNfMateria.SetCamposExcluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  ItemNfMateria :TItemNfMateria;                                                 
begin                                                                                              
   ItemNfMateria := (Objeto as TItemNfMateria);                                  

   Auditoria.AdicionaCampoExcluido('CODIGO' , intToStr(ItemNfMateria.CODIGO));
   Auditoria.AdicionaCampoExcluido('CODIGO_NOTA_FISCAL' , intToStr(ItemNfMateria.CODIGO_NOTA_FISCAL));
   Auditoria.AdicionaCampoExcluido('CODIGO_MATERIA' , intToStr(ItemNfMateria.CODIGO_MATERIA));
   Auditoria.AdicionaCampoExcluido('QUANTIDADE' , FloatToStr(ItemNfMateria.QUANTIDADE));
   Auditoria.AdicionaCampoExcluido('UNIDADE' , ItemNfMateria.UNIDADE);
   Auditoria.AdicionaCampoExcluido('CLASSIFICACAO_FISCAL' , ItemNfMateria.CLASSIFICACAO_FISCAL);
   Auditoria.AdicionaCampoExcluido('ORIGEM' , intToStr(ItemNfMateria.ORIGEM));
   Auditoria.AdicionaCampoExcluido('VALOR_UNITARIO' , FloatToStr(ItemNfMateria.VALOR_UNITARIO));
   Auditoria.AdicionaCampoExcluido('VALOR_BRUTO' , FloatToStr(ItemNfMateria.VALOR_BRUTO));
   Auditoria.AdicionaCampoExcluido('VALOR_FRETE' , FloatToStr(ItemNfMateria.VALOR_FRETE));
   Auditoria.AdicionaCampoExcluido('VALOR_SEGURO' , FloatToStr(ItemNfMateria.VALOR_SEGURO));
   Auditoria.AdicionaCampoExcluido('VALOR_DESCONTO' , FloatToStr(ItemNfMateria.VALOR_DESCONTO));
   Auditoria.AdicionaCampoExcluido('VALOR_OUTRAS_DESPESAS' , FloatToStr(ItemNfMateria.VALOR_OUTRAS_DESPESAS));
   Auditoria.AdicionaCampoExcluido('PER_ICM' , FloatToStr(ItemNfMateria.PER_ICM));
   Auditoria.AdicionaCampoExcluido('PER_IPI' , FloatToStr(ItemNfMateria.PER_IPI));
   Auditoria.AdicionaCampoExcluido('PER_SUB' , FloatToStr(ItemNfMateria.PER_SUB));
   Auditoria.AdicionaCampoExcluido('PER_PIS' , FloatToStr(ItemNfMateria.PER_PIS));
   Auditoria.AdicionaCampoExcluido('PER_COFINS' , FloatToStr(ItemNfMateria.PER_COFINS));
   Auditoria.AdicionaCampoExcluido('BASE_ICM' , FloatToStr(ItemNfMateria.BASE_ICM));
   Auditoria.AdicionaCampoExcluido('BASE_IPI' , FloatToStr(ItemNfMateria.BASE_IPI));
   Auditoria.AdicionaCampoExcluido('BASE_SUB' , FloatToStr(ItemNfMateria.BASE_SUB));
   Auditoria.AdicionaCampoExcluido('BASE_PIS' , FloatToStr(ItemNfMateria.BASE_PIS));
   Auditoria.AdicionaCampoExcluido('BASE_COFINS' , FloatToStr(ItemNfMateria.BASE_COFINS));
   Auditoria.AdicionaCampoExcluido('CST' , ItemNfMateria.cst);
   Auditoria.AdicionaCampoExcluido('CSOSN' , ItemNfMateria.csosn);
   Auditoria.AdicionaCampoExcluido('Cfop' , ItemNfMateria.cfop);   
end;                                                                                               

procedure TRepositorioItemNfMateria.SetCamposIncluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  ItemNfMateria :TItemNfMateria;                                                 
begin                                                                                              
   ItemNfMateria := (Objeto as TItemNfMateria);                                  

   Auditoria.AdicionaCampoIncluido('CODIGO' , intToStr(ItemNfMateria.CODIGO));
   Auditoria.AdicionaCampoIncluido('CODIGO_NOTA_FISCAL' , intToStr(ItemNfMateria.CODIGO_NOTA_FISCAL));
   Auditoria.AdicionaCampoIncluido('CODIGO_MATERIA' , intToStr(ItemNfMateria.CODIGO_MATERIA));
   Auditoria.AdicionaCampoIncluido('QUANTIDADE' , FloatToStr(ItemNfMateria.QUANTIDADE));
   Auditoria.AdicionaCampoIncluido('UNIDADE' , ItemNfMateria.UNIDADE);
   Auditoria.AdicionaCampoIncluido('CLASSIFICACAO_FISCAL' , ItemNfMateria.CLASSIFICACAO_FISCAL);
   Auditoria.AdicionaCampoIncluido('ORIGEM' , intToStr(ItemNfMateria.ORIGEM));
   Auditoria.AdicionaCampoIncluido('VALOR_UNITARIO' , FloatToStr(ItemNfMateria.VALOR_UNITARIO));
   Auditoria.AdicionaCampoIncluido('VALOR_BRUTO' , FloatToStr(ItemNfMateria.VALOR_BRUTO));
   Auditoria.AdicionaCampoIncluido('VALOR_FRETE' , FloatToStr(ItemNfMateria.VALOR_FRETE));
   Auditoria.AdicionaCampoIncluido('VALOR_SEGURO' , FloatToStr(ItemNfMateria.VALOR_SEGURO));
   Auditoria.AdicionaCampoIncluido('VALOR_DESCONTO' , FloatToStr(ItemNfMateria.VALOR_DESCONTO));
   Auditoria.AdicionaCampoIncluido('VALOR_OUTRAS_DESPESAS' , FloatToStr(ItemNfMateria.VALOR_OUTRAS_DESPESAS));
   Auditoria.AdicionaCampoIncluido('PER_ICM' , FloatToStr(ItemNfMateria.PER_ICM));
   Auditoria.AdicionaCampoIncluido('PER_IPI' , FloatToStr(ItemNfMateria.PER_IPI));
   Auditoria.AdicionaCampoIncluido('PER_SUB' , FloatToStr(ItemNfMateria.PER_SUB));
   Auditoria.AdicionaCampoIncluido('PER_PIS' , FloatToStr(ItemNfMateria.PER_PIS));
   Auditoria.AdicionaCampoIncluido('PER_COFINS' , FloatToStr(ItemNfMateria.PER_COFINS));
   Auditoria.AdicionaCampoIncluido('BASE_ICM' , FloatToStr(ItemNfMateria.BASE_ICM));
   Auditoria.AdicionaCampoIncluido('BASE_IPI' , FloatToStr(ItemNfMateria.BASE_IPI));
   Auditoria.AdicionaCampoIncluido('BASE_SUB' , FloatToStr(ItemNfMateria.BASE_SUB));
   Auditoria.AdicionaCampoIncluido('BASE_PIS' , FloatToStr(ItemNfMateria.BASE_PIS));
   Auditoria.AdicionaCampoIncluido('BASE_COFINS' , FloatToStr(ItemNfMateria.BASE_COFINS));
   Auditoria.AdicionaCampoIncluido('CST' , ItemNfMateria.cst);
   Auditoria.AdicionaCampoIncluido('CSOSN' , ItemNfMateria.csosn);
   Auditoria.AdicionaCampoIncluido('CFOP' , ItemNfMateria.cfop);   
end;                                                                                               

procedure TRepositorioItemNfMateria.SetIdentificador(Objeto: TObject;                
  Identificador: Variant);                                                                         
begin                                                                                              
  TItemNfMateria(Objeto).Codigo := Integer(Identificador);                                
end;                                                                                               

procedure TRepositorioItemNfMateria.SetParametros(Objeto: TObject);                  
var                                                                                                
  ItemNfMateria :TItemNfMateria;                                                 
begin                                                                                              
   ItemNfMateria := (Objeto as TItemNfMateria);                                  
  if (ItemNfMateria.Codigo > 0) then  inherited SetParametro('codigo', ItemNfMateria.Codigo) 
  else                         inherited LimpaParametro('codigo');                     

   self.FQuery.ParamByName('CODIGO').AsInteger        := ItemNfMateria.CODIGO; 
   self.FQuery.ParamByName('CODIGO_NOTA_FISCAL').AsInteger        := strToInt(Maior_Valor_Cadastrado('NOTAS_FISCAIS','CODIGO'));
   self.FQuery.ParamByName('CODIGO_MATERIA').AsInteger        := ItemNfMateria.CODIGO_MATERIA;
   self.FQuery.ParamByName('QUANTIDADE').AsFloat        := ItemNfMateria.QUANTIDADE; 
   self.FQuery.ParamByName('UNIDADE').AsString        := ItemNfMateria.UNIDADE; 
   self.FQuery.ParamByName('CLASSIFICACAO_FISCAL').AsString        := ItemNfMateria.CLASSIFICACAO_FISCAL; 
   self.FQuery.ParamByName('ORIGEM').AsInteger        := ItemNfMateria.ORIGEM; 
   self.FQuery.ParamByName('VALOR_UNITARIO').AsFloat        := ItemNfMateria.VALOR_UNITARIO; 
   self.FQuery.ParamByName('VALOR_BRUTO').AsFloat        := ItemNfMateria.VALOR_BRUTO; 
   self.FQuery.ParamByName('VALOR_FRETE').AsFloat        := ItemNfMateria.VALOR_FRETE; 
   self.FQuery.ParamByName('VALOR_SEGURO').AsFloat        := ItemNfMateria.VALOR_SEGURO; 
   self.FQuery.ParamByName('VALOR_DESCONTO').AsFloat        := ItemNfMateria.VALOR_DESCONTO; 
   self.FQuery.ParamByName('VALOR_OUTRAS_DESPESAS').AsFloat        := ItemNfMateria.VALOR_OUTRAS_DESPESAS; 
   self.FQuery.ParamByName('PER_ICM').AsFloat        := ItemNfMateria.PER_ICM; 
   self.FQuery.ParamByName('PER_IPI').AsFloat        := ItemNfMateria.PER_IPI; 
   self.FQuery.ParamByName('PER_SUB').AsFloat        := ItemNfMateria.PER_SUB; 
   self.FQuery.ParamByName('PER_PIS').AsFloat        := ItemNfMateria.PER_PIS; 
   self.FQuery.ParamByName('PER_COFINS').AsFloat        := ItemNfMateria.PER_COFINS; 
   self.FQuery.ParamByName('BASE_ICM').AsFloat        := ItemNfMateria.BASE_ICM; 
   self.FQuery.ParamByName('BASE_IPI').AsFloat        := ItemNfMateria.BASE_IPI; 
   self.FQuery.ParamByName('BASE_SUB').AsFloat        := ItemNfMateria.BASE_SUB; 
   self.FQuery.ParamByName('BASE_PIS').AsFloat        := ItemNfMateria.BASE_PIS; 
   self.FQuery.ParamByName('BASE_COFINS').AsFloat        := ItemNfMateria.BASE_COFINS;
   self.FQuery.ParamByName('CST').AsString        := ItemNfMateria.cst;
   self.FQuery.ParamByName('CSOSN').AsString        := ItemNfMateria.csosn;
   self.FQuery.ParamByName('CFOP').AsString        := ItemNfMateria.cfop;   
end;                                                                                               

function TRepositorioItemNfMateria.SQLGet: String;                                   
begin                                                                                              
  result := 'select * from ITENS_NF_MATERIA where codigo = :ncod';                                     
end;                                                                                               

function TRepositorioItemNfMateria.SQLGetAll: String;                                
begin                                                                                              
  result := 'select * from ITENS_NF_MATERIA';                                                          
end;                                                                                               

function TRepositorioItemNfMateria.SQLGetExiste(campo: String): String;              
begin                                                                                              
  result := 'select '+ campo +' from ITENS_NF_MATERIA where '+ campo +' = :ncampo';                
end;                                                                                               

function TRepositorioItemNfMateria.SQLRemover: String;                               
begin                                                                                              
   result := ' delete from ITENS_NF_MATERIA where codigo = :codigo ';                                  
end;                                                                                               

function TRepositorioItemNfMateria.SQLSalvar: String;                                
begin                                                                                              
  result := 'update or insert into ITENS_NF_MATERIA                                                                             '+
            ' ( CODIGO, CODIGO_NOTA_FISCAL, CODIGO_MATERIA, QUANTIDADE, UNIDADE, CLASSIFICACAO_FISCAL, ORIGEM,                  '+
            ' VALOR_UNITARIO, VALOR_BRUTO, VALOR_FRETE, VALOR_SEGURO, VALOR_DESCONTO, VALOR_OUTRAS_DESPESAS, PER_ICM,           '+
            ' PER_IPI, PER_SUB, PER_PIS, PER_COFINS, BASE_ICM, BASE_IPI, BASE_SUB, BASE_PIS, BASE_COFINS, CST, CSOSN, CFOP)           '+
            ' Values ( :CODIGO, :CODIGO_NOTA_FISCAL, :CODIGO_MATERIA, :QUANTIDADE, :UNIDADE, :CLASSIFICACAO_FISCAL, :ORIGEM,    '+
            ':VALOR_UNITARIO, :VALOR_BRUTO, :VALOR_FRETE, :VALOR_SEGURO, :VALOR_DESCONTO, :VALOR_OUTRAS_DESPESAS, :PER_ICM,     '+
            ':PER_IPI, :PER_SUB, :PER_PIS, :PER_COFINS, :BASE_ICM, :BASE_IPI, :BASE_SUB, :BASE_PIS, :BASE_COFINS, :CST, :CSOSN, :CFOP) ';
end;

end.                                                                                               
