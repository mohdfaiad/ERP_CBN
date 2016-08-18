unit RepositorioConferenciaItem;                                                       
interface                                                                                          
uses DB,
     Auditoria,
     Repositorio;                                       
type
  TRepositorioConferenciaItem = class(TRepositorio)                      
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
  ConferenciaItem;                                                                        

{ TRepositorioConferenciaItem }                                                      

function TRepositorioConferenciaItem.Get(Dataset: TDataSet): TObject;                  
var                                                                                                
  ConferenciaItem :TConferenciaItem;                                                 
begin                                                                                              
   ConferenciaItem                     := TConferenciaItem.Create;
   ConferenciaItem.CODIGO              := self.FQuery.FieldByName('CODIGO'  ).AsInteger;
   ConferenciaItem.CODIGO_CONFERENCIA  := self.FQuery.FieldByName('CODIGO_CONFERENCIA'  ).AsInteger;
   ConferenciaItem.CODIGO_ITEM         := self.FQuery.FieldByName('CODIGO_ITEM'  ).AsInteger;
   ConferenciaItem.QTD_RN              := self.FQuery.FieldByName('QTD_RN'  ).AsInteger;
   ConferenciaItem.QTD_P               := self.FQuery.FieldByName('QTD_P'  ).AsInteger;
   ConferenciaItem.QTD_M               := self.FQuery.FieldByName('QTD_M'  ).AsInteger;
   ConferenciaItem.QTD_G               := self.FQuery.FieldByName('QTD_G'  ).AsInteger;
   ConferenciaItem.QTD_1               := self.FQuery.FieldByName('QTD_1'  ).AsInteger;
   ConferenciaItem.QTD_2               := self.FQuery.FieldByName('QTD_2'  ).AsInteger;
   ConferenciaItem.QTD_3               := self.FQuery.FieldByName('QTD_3'  ).AsInteger;
   ConferenciaItem.QTD_4               := self.FQuery.FieldByName('QTD_4'  ).AsInteger;
   ConferenciaItem.QTD_6               := self.FQuery.FieldByName('QTD_6'  ).AsInteger;
   ConferenciaItem.QTD_8               := self.FQuery.FieldByName('QTD_8'  ).AsInteger;
   ConferenciaItem.qtd_10              := self.FQuery.FieldByName('qtd_10' ).AsInteger;
   ConferenciaItem.qtd_12              := self.FQuery.FieldByName('qtd_12' ).AsInteger;
   ConferenciaItem.qtd_14              := self.FQuery.FieldByName('qtd_14' ).AsInteger;
   ConferenciaItem.QTD_UNICA           := self.FQuery.FieldByName('QTD_UNICA'  ).AsInteger;
   ConferenciaItem.Numero_caixa        := self.FQuery.FieldByName('NUMERO_CAIXA').AsInteger;
  // ConferenciaItem.Novo                := self.FQuery.FieldByName('NOVO').AsString;
   result := ConferenciaItem;
end;                                                                                               

function TRepositorioConferenciaItem.GetIdentificador(Objeto: TObject): Variant;       
begin                                                                                              
  result := TConferenciaItem(Objeto).Codigo;                                                 
end;                                                                                               

function TRepositorioConferenciaItem.GetNomeDaTabela: String;                          
begin                                                                                              
result := 'CONFERENCIA_ITENS';                                                                          
end;                                                                                               

function TRepositorioConferenciaItem.GetRepositorio: TRepositorio;                     
begin                                                                                              
result := TRepositorioConferenciaItem.Create;                                          
end;                                                                                               

function TRepositorioConferenciaItem.IsInsercao(Objeto: TObject): Boolean;             
begin                                                                                              
  result := (TConferenciaItem(Objeto).Codigo <= 0);                                         
end;                                                                                               

procedure TRepositorioConferenciaItem.SetCamposAlterados(Auditoria: TAuditoria;        
  AntigoObjeto, Objeto: TObject);                                                                  
var                                                                                                
  ConferenciaItemAntigo :TConferenciaItem;                                           
  ConferenciaItemNovo   :TConferenciaItem;                                           
begin                                                                                              
   ConferenciaItemAntigo := (AntigoObjeto as TConferenciaItem);                      
   ConferenciaItemNovo   := (Objeto       as TConferenciaItem);                      

   if (ConferenciaItemAntigo.CODIGO_CONFERENCIA <> ConferenciaItemNovo.CODIGO_CONFERENCIA) then
   Auditoria.AdicionaCampoAlterado('CODIGO_CONFERENCIA', intToStr(ConferenciaItemAntigo.CODIGO_CONFERENCIA), intToStr(ConferenciaItemNovo.CODIGO_CONFERENCIA));

   if (ConferenciaItemAntigo.CODIGO_ITEM <> ConferenciaItemNovo.CODIGO_ITEM) then
   Auditoria.AdicionaCampoAlterado('CODIGO_ITEM', intToStr(ConferenciaItemAntigo.CODIGO_ITEM), intToStr(ConferenciaItemNovo.CODIGO_ITEM));

   if (ConferenciaItemAntigo.QTD_RN <> ConferenciaItemNovo.QTD_RN) then
   Auditoria.AdicionaCampoAlterado('QTD_RN', intToStr(ConferenciaItemAntigo.QTD_RN), intToStr(ConferenciaItemNovo.QTD_RN));

   if (ConferenciaItemAntigo.QTD_P <> ConferenciaItemNovo.QTD_P) then
   Auditoria.AdicionaCampoAlterado('QTD_P', intToStr(ConferenciaItemAntigo.QTD_P), intToStr(ConferenciaItemNovo.QTD_P));

   if (ConferenciaItemAntigo.QTD_M <> ConferenciaItemNovo.QTD_M) then
   Auditoria.AdicionaCampoAlterado('QTD_M', intToStr(ConferenciaItemAntigo.QTD_M), intToStr(ConferenciaItemNovo.QTD_M));

   if (ConferenciaItemAntigo.QTD_G <> ConferenciaItemNovo.QTD_G) then
   Auditoria.AdicionaCampoAlterado('QTD_G', intToStr(ConferenciaItemAntigo.QTD_G), intToStr(ConferenciaItemNovo.QTD_G));

   if (ConferenciaItemAntigo.QTD_1 <> ConferenciaItemNovo.QTD_1) then
   Auditoria.AdicionaCampoAlterado('QTD_1', intToStr(ConferenciaItemAntigo.QTD_1), intToStr(ConferenciaItemNovo.QTD_1));

   if (ConferenciaItemAntigo.QTD_2 <> ConferenciaItemNovo.QTD_2) then
   Auditoria.AdicionaCampoAlterado('QTD_2', intToStr(ConferenciaItemAntigo.QTD_2), intToStr(ConferenciaItemNovo.QTD_2));

   if (ConferenciaItemAntigo.QTD_3 <> ConferenciaItemNovo.QTD_3) then
   Auditoria.AdicionaCampoAlterado('QTD_3', intToStr(ConferenciaItemAntigo.QTD_3), intToStr(ConferenciaItemNovo.QTD_3));

   if (ConferenciaItemAntigo.QTD_4 <> ConferenciaItemNovo.QTD_4) then
   Auditoria.AdicionaCampoAlterado('QTD_4', intToStr(ConferenciaItemAntigo.QTD_4), intToStr(ConferenciaItemNovo.QTD_4));

   if (ConferenciaItemAntigo.QTD_6 <> ConferenciaItemNovo.QTD_6) then
   Auditoria.AdicionaCampoAlterado('QTD_6', intToStr(ConferenciaItemAntigo.QTD_6), intToStr(ConferenciaItemNovo.QTD_6));

   if (ConferenciaItemAntigo.QTD_8 <> ConferenciaItemNovo.QTD_8) then
   Auditoria.AdicionaCampoAlterado('QTD_8', intToStr(ConferenciaItemAntigo.QTD_8), intToStr(ConferenciaItemNovo.QTD_8));

   if (ConferenciaItemAntigo.qtd_10 <> ConferenciaItemNovo.qtd_10) then
    Auditoria.AdicionaCampoAlterado('qtd_10', IntToStr(ConferenciaItemAntigo.qtd_10), IntToStr(ConferenciaItemNovo.qtd_10));
   if (ConferenciaItemAntigo.qtd_12 <> ConferenciaItemNovo.qtd_12) then
    Auditoria.AdicionaCampoAlterado('qtd_12', IntToStr(ConferenciaItemAntigo.qtd_12), IntToStr(ConferenciaItemNovo.qtd_12));
   if (ConferenciaItemAntigo.qtd_14 <> ConferenciaItemNovo.qtd_14) then
    Auditoria.AdicionaCampoAlterado('qtd_14', IntToStr(ConferenciaItemAntigo.qtd_14), IntToStr(ConferenciaItemNovo.qtd_14));

   if (ConferenciaItemAntigo.QTD_UNICA <> ConferenciaItemNovo.QTD_UNICA) then
   Auditoria.AdicionaCampoAlterado('QTD_UNICA', intToStr(ConferenciaItemAntigo.QTD_UNICA), intToStr(ConferenciaItemNovo.QTD_UNICA));

   if (ConferenciaItemAntigo.Numero_caixa <> ConferenciaItemNovo.Numero_caixa) then
   Auditoria.AdicionaCampoAlterado('NUMERO_CAIXA', intToStr(ConferenciaItemAntigo.Numero_caixa), intToStr(ConferenciaItemNovo.Numero_caixa));

 //  if (ConferenciaItemAntigo.Novo <> ConferenciaItemNovo.Novo) then
//   Auditoria.AdicionaCampoAlterado('NOVO', ConferenciaItemAntigo.Novo, ConferenciaItemNovo.Novo)
end;

procedure TRepositorioConferenciaItem.SetCamposExcluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  ConferenciaItem :TConferenciaItem;                                                 
begin                                                                                              
   ConferenciaItem := (Objeto as TConferenciaItem);                                  

   Auditoria.AdicionaCampoExcluido('CODIGO' , intToStr(ConferenciaItem.CODIGO));
   Auditoria.AdicionaCampoExcluido('CODIGO_CONFERENCIA' , intToStr(ConferenciaItem.CODIGO_CONFERENCIA));
   Auditoria.AdicionaCampoExcluido('CODIGO_ITEM' , intToStr(ConferenciaItem.CODIGO_ITEM));
   Auditoria.AdicionaCampoExcluido('QTD_RN' , intToStr(ConferenciaItem.QTD_RN));
   Auditoria.AdicionaCampoExcluido('QTD_P' , intToStr(ConferenciaItem.QTD_P));
   Auditoria.AdicionaCampoExcluido('QTD_M' , intToStr(ConferenciaItem.QTD_M));
   Auditoria.AdicionaCampoExcluido('QTD_G' , intToStr(ConferenciaItem.QTD_G));
   Auditoria.AdicionaCampoExcluido('QTD_1' , intToStr(ConferenciaItem.QTD_1));
   Auditoria.AdicionaCampoExcluido('QTD_2' , intToStr(ConferenciaItem.QTD_2));
   Auditoria.AdicionaCampoExcluido('QTD_3' , intToStr(ConferenciaItem.QTD_3));
   Auditoria.AdicionaCampoExcluido('QTD_4' , intToStr(ConferenciaItem.QTD_4));
   Auditoria.AdicionaCampoExcluido('QTD_6' , intToStr(ConferenciaItem.QTD_6));
   Auditoria.AdicionaCampoExcluido('QTD_8' , intToStr(ConferenciaItem.QTD_8));
   Auditoria.AdicionaCampoExcluido('qtd_10', intToStr(ConferenciaItem.qtd_10    )          );
   Auditoria.AdicionaCampoExcluido('qtd_12', intToStr(ConferenciaItem.qtd_12    )          );
   Auditoria.AdicionaCampoExcluido('qtd_14', intToStr(ConferenciaItem.qtd_14    )          );
   Auditoria.AdicionaCampoExcluido('QTD_UNICA' , intToStr(ConferenciaItem.QTD_UNICA));
   Auditoria.AdicionaCampoExcluido('NUMERO_CAIXA' , intToStr(ConferenciaItem.Numero_caixa));
 //  Auditoria.AdicionaCampoExcluido('NOVO' , ConferenciaItem.Novo);
end;                                                                                               

procedure TRepositorioConferenciaItem.SetCamposIncluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  ConferenciaItem :TConferenciaItem;                                                 
begin                                                                                              
   ConferenciaItem := (Objeto as TConferenciaItem);                                  

   Auditoria.AdicionaCampoIncluido('CODIGO' , intToStr(ConferenciaItem.CODIGO));
   Auditoria.AdicionaCampoIncluido('CODIGO_CONFERENCIA' , intToStr(ConferenciaItem.CODIGO_CONFERENCIA));
   Auditoria.AdicionaCampoIncluido('CODIGO_ITEM' , intToStr(ConferenciaItem.CODIGO_ITEM));
   Auditoria.AdicionaCampoIncluido('QTD_RN' , intToStr(ConferenciaItem.QTD_RN));
   Auditoria.AdicionaCampoIncluido('QTD_P' , intToStr(ConferenciaItem.QTD_P));
   Auditoria.AdicionaCampoIncluido('QTD_M' , intToStr(ConferenciaItem.QTD_M));
   Auditoria.AdicionaCampoIncluido('QTD_G' , intToStr(ConferenciaItem.QTD_G));
   Auditoria.AdicionaCampoIncluido('QTD_1' , intToStr(ConferenciaItem.QTD_1));
   Auditoria.AdicionaCampoIncluido('QTD_2' , intToStr(ConferenciaItem.QTD_2));
   Auditoria.AdicionaCampoIncluido('QTD_3' , intToStr(ConferenciaItem.QTD_3));
   Auditoria.AdicionaCampoIncluido('QTD_4' , intToStr(ConferenciaItem.QTD_4));
   Auditoria.AdicionaCampoIncluido('QTD_6' , intToStr(ConferenciaItem.QTD_6));
   Auditoria.AdicionaCampoIncluido('QTD_8' , intToStr(ConferenciaItem.QTD_8));
   Auditoria.AdicionaCampoIncluido('qtd_10', intToStr(ConferenciaItem.qtd_10));
   Auditoria.AdicionaCampoIncluido('qtd_12', intToStr(ConferenciaItem.qtd_12));
   Auditoria.AdicionaCampoIncluido('qtd_14', intToStr(ConferenciaItem.qtd_14));
   Auditoria.AdicionaCampoIncluido('QTD_UNICA' , intToStr(ConferenciaItem.QTD_UNICA));
   Auditoria.AdicionaCampoIncluido('NUMERO_CAIXA' , intToStr(ConferenciaItem.Numero_caixa));
  // Auditoria.AdicionaCampoIncluido('NOVO' , ConferenciaItem.Novo);
end;                                                                                               

procedure TRepositorioConferenciaItem.SetIdentificador(Objeto: TObject;                
  Identificador: Variant);                                                                         
begin                                                                                              
  TConferenciaItem(Objeto).Codigo := Integer(Identificador);                                
end;                                                                                               

procedure TRepositorioConferenciaItem.SetParametros(Objeto: TObject);                  
var                                                                                                
  ConferenciaItem :TConferenciaItem;                                                 
begin                                                                                              
   ConferenciaItem := (Objeto as TConferenciaItem);                                  
  if (ConferenciaItem.Codigo > 0) then  inherited SetParametro('codigo', ConferenciaItem.Codigo) 
  else                         inherited LimpaParametro('codigo');                     

   self.FQuery.ParamByName('CODIGO').AsInteger        := ConferenciaItem.CODIGO; 
   self.FQuery.ParamByName('CODIGO_CONFERENCIA').AsInteger        := ConferenciaItem.CODIGO_CONFERENCIA; 
   self.FQuery.ParamByName('CODIGO_ITEM').AsInteger        := ConferenciaItem.CODIGO_ITEM; 
   self.FQuery.ParamByName('QTD_RN').AsInteger        := ConferenciaItem.QTD_RN; 
   self.FQuery.ParamByName('QTD_P').AsInteger        := ConferenciaItem.QTD_P; 
   self.FQuery.ParamByName('QTD_M').AsInteger        := ConferenciaItem.QTD_M; 
   self.FQuery.ParamByName('QTD_G').AsInteger        := ConferenciaItem.QTD_G; 
   self.FQuery.ParamByName('QTD_1').AsInteger        := ConferenciaItem.QTD_1; 
   self.FQuery.ParamByName('QTD_2').AsInteger        := ConferenciaItem.QTD_2; 
   self.FQuery.ParamByName('QTD_3').AsInteger        := ConferenciaItem.QTD_3; 
   self.FQuery.ParamByName('QTD_4').AsInteger        := ConferenciaItem.QTD_4;
   self.FQuery.ParamByName('QTD_6').AsInteger        := ConferenciaItem.QTD_6; 
   self.FQuery.ParamByName('QTD_8').AsInteger        := ConferenciaItem.QTD_8;
   inherited SetParametro('qtd_10'           , ConferenciaItem.qtd_10    );
   inherited SetParametro('qtd_12'           , ConferenciaItem.qtd_12    );
   inherited SetParametro('qtd_14'           , ConferenciaItem.qtd_14    );
   self.FQuery.ParamByName('QTD_UNICA').AsInteger        := ConferenciaItem.QTD_UNICA; 
   self.FQuery.ParamByName('NUMERO_CAIXA').AsInteger        := ConferenciaItem.Numero_caixa;
 //  self.FQuery.ParamByName('NOVO').AsString          := ConferenciaItem.Novo;
end;                                                                                               

function TRepositorioConferenciaItem.SQLGet: String;                                   
begin                                                                                              
  result := 'select * from CONFERENCIA_ITENS where codigo = :ncod';                                     
end;                                                                                               

function TRepositorioConferenciaItem.SQLGetAll: String;                                
begin                                                                                              
  result := 'select * from CONFERENCIA_ITENS';                                                          
end;                                                                                               

function TRepositorioConferenciaItem.SQLGetExiste(campo: String): String;              
begin                                                                                              
  result := 'select '+ campo +' from CONFERENCIA_ITENS where '+ campo +' = :ncampo';                
end;                                                                                               

function TRepositorioConferenciaItem.SQLRemover: String;                               
begin                                                                                              
   result := ' delete from CONFERENCIA_ITENS where codigo_conferencia = :codigo ';                                  
end;                                                                                               

function TRepositorioConferenciaItem.SQLSalvar: String;                                
begin                                                                                              
  result := 'update or insert into CONFERENCIA_ITENS                                  '+
            '        ( CODIGO, CODIGO_CONFERENCIA, CODIGO_ITEM, QTD_RN, QTD_P, QTD_M, QTD_G, QTD_1, QTD_2, QTD_3,   '+
            '          QTD_4, QTD_6, QTD_8, QTD_10, QTD_12, QTD_14, QTD_UNICA, NUMERO_CAIXA)                        '+
            ' Values ( :CODIGO, :CODIGO_CONFERENCIA, :CODIGO_ITEM, :QTD_RN, :QTD_P, :QTD_M, :QTD_G, :QTD_1, :QTD_2, '+
            '          :QTD_3, :QTD_4, :QTD_6, :QTD_8, :QTD_10, :QTD_12, :QTD_14, :QTD_UNICA, :NUMERO_CAIXA)        ';
end;                                                                                               

end.                                                                                               
