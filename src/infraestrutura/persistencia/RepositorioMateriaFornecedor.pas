unit RepositorioMateriaFornecedor;                                                       
interface                                                                                          
uses DB,
     Auditoria,
     Repositorio;                                       
type
  TRepositorioMateriaFornecedor = class(TRepositorio)                      
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
  MateriaFornecedor;                                                                        

{ TRepositorioMateriaFornecedor }                                                      

function TRepositorioMateriaFornecedor.Get(Dataset: TDataSet): TObject;                  
var                                                                                                
  MateriaFornecedor :TMateriaFornecedor;                                                 
begin                                                                                              
   MateriaFornecedor  := TMateriaFornecedor.Create;                                      
   MateriaFornecedor.CODIGO                     := self.FQuery.FieldByName('CODIGO'  ).AsInteger;
   MateriaFornecedor.CODIGO_MATERIA             := self.FQuery.FieldByName('CODIGO_MATERIA'  ).AsInteger;
   MateriaFornecedor.CODIGO_FORNECEDOR          := self.FQuery.FieldByName('CODIGO_FORNECEDOR'  ).AsInteger;
   MateriaFornecedor.CODIGO_MATERIA_FORNECEDOR  := self.FQuery.FieldByName('CODIGO_MATERIA_FORNECEDOR'  ).AsString;
   result := MateriaFornecedor;
end;                                                                                               

function TRepositorioMateriaFornecedor.GetIdentificador(Objeto: TObject): Variant;       
begin                                                                                              
  result := TMateriaFornecedor(Objeto).Codigo;                                                 
end;                                                                                               

function TRepositorioMateriaFornecedor.GetNomeDaTabela: String;                          
begin                                                                                              
result := 'MATERIA_FORNECEDOR';                                                                          
end;                                                                                               

function TRepositorioMateriaFornecedor.GetRepositorio: TRepositorio;                     
begin                                                                                              
result := TRepositorioMateriaFornecedor.Create;                                          
end;                                                                                               

function TRepositorioMateriaFornecedor.IsInsercao(Objeto: TObject): Boolean;             
begin                                                                                              
  result := (TMateriaFornecedor(Objeto).Codigo <= 0);                                         
end;                                                                                               

procedure TRepositorioMateriaFornecedor.SetCamposAlterados(Auditoria: TAuditoria;        
  AntigoObjeto, Objeto: TObject);                                                                  
var                                                                                                
  MateriaFornecedorAntigo :TMateriaFornecedor;                                           
  MateriaFornecedorNovo   :TMateriaFornecedor;                                           
begin                                                                                              
   MateriaFornecedorAntigo := (AntigoObjeto as TMateriaFornecedor);                      
   MateriaFornecedorNovo   := (Objeto       as TMateriaFornecedor);                      

   if (MateriaFornecedorAntigo.CODIGO_MATERIA <> MateriaFornecedorNovo.CODIGO_MATERIA) then
   Auditoria.AdicionaCampoAlterado('CODIGO_MATERIA', intToStr(MateriaFornecedorAntigo.CODIGO_MATERIA), intToStr(MateriaFornecedorNovo.CODIGO_MATERIA));

   if (MateriaFornecedorAntigo.CODIGO_FORNECEDOR <> MateriaFornecedorNovo.CODIGO_FORNECEDOR) then
   Auditoria.AdicionaCampoAlterado('CODIGO_FORNECEDOR', intToStr(MateriaFornecedorAntigo.CODIGO_FORNECEDOR), intToStr(MateriaFornecedorNovo.CODIGO_FORNECEDOR));

   if (MateriaFornecedorAntigo.CODIGO_MATERIA_FORNECEDOR <> MateriaFornecedorNovo.CODIGO_MATERIA_FORNECEDOR) then
   Auditoria.AdicionaCampoAlterado('CODIGO_MATERIA_FORNECEDOR', MateriaFornecedorAntigo.CODIGO_MATERIA_FORNECEDOR, MateriaFornecedorNovo.CODIGO_MATERIA_FORNECEDOR);


end;                                                                                               

procedure TRepositorioMateriaFornecedor.SetCamposExcluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  MateriaFornecedor :TMateriaFornecedor;                                                 
begin                                                                                              
   MateriaFornecedor := (Objeto as TMateriaFornecedor);                                  

   Auditoria.AdicionaCampoExcluido('CODIGO' , intToStr(MateriaFornecedor.CODIGO));
   Auditoria.AdicionaCampoExcluido('CODIGO_MATERIA' , intToStr(MateriaFornecedor.CODIGO_MATERIA));
   Auditoria.AdicionaCampoExcluido('CODIGO_FORNECEDOR' , intToStr(MateriaFornecedor.CODIGO_FORNECEDOR));
   Auditoria.AdicionaCampoExcluido('CODIGO_MATERIA_FORNECEDOR' , MateriaFornecedor.CODIGO_MATERIA_FORNECEDOR);

end;                                                                                               

procedure TRepositorioMateriaFornecedor.SetCamposIncluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  MateriaFornecedor :TMateriaFornecedor;                                                 
begin                                                                                              
   MateriaFornecedor := (Objeto as TMateriaFornecedor);                                  

   Auditoria.AdicionaCampoIncluido('CODIGO' , intToStr(MateriaFornecedor.CODIGO));
   Auditoria.AdicionaCampoIncluido('CODIGO_MATERIA' , intToStr(MateriaFornecedor.CODIGO_MATERIA));
   Auditoria.AdicionaCampoIncluido('CODIGO_FORNECEDOR' , intToStr(MateriaFornecedor.CODIGO_FORNECEDOR));
   Auditoria.AdicionaCampoIncluido('CODIGO_MATERIA_FORNECEDOR' , MateriaFornecedor.CODIGO_MATERIA_FORNECEDOR);

end;                                                                                               

procedure TRepositorioMateriaFornecedor.SetIdentificador(Objeto: TObject;                
  Identificador: Variant);                                                                         
begin                                                                                              
  TMateriaFornecedor(Objeto).Codigo := Integer(Identificador);                                
end;                                                                                               

procedure TRepositorioMateriaFornecedor.SetParametros(Objeto: TObject);                  
var                                                                                                
  MateriaFornecedor :TMateriaFornecedor;                                                 
begin                                                                                              
   MateriaFornecedor := (Objeto as TMateriaFornecedor);                                  
  if (MateriaFornecedor.Codigo > 0) then  inherited SetParametro('codigo', MateriaFornecedor.Codigo) 
  else                         inherited LimpaParametro('codigo');                     

   self.FQuery.ParamByName('CODIGO').AsInteger        := MateriaFornecedor.CODIGO; 
   self.FQuery.ParamByName('CODIGO_MATERIA').AsInteger        := MateriaFornecedor.CODIGO_MATERIA; 
   self.FQuery.ParamByName('CODIGO_FORNECEDOR').AsInteger        := MateriaFornecedor.CODIGO_FORNECEDOR; 
   self.FQuery.ParamByName('CODIGO_MATERIA_FORNECEDOR').AsString        := MateriaFornecedor.CODIGO_MATERIA_FORNECEDOR;

end;                                                                                               

function TRepositorioMateriaFornecedor.SQLGet: String;                                   
begin                                                                                              
  result := 'select * from MATERIA_FORNECEDOR where codigo = :ncod';                                     
end;                                                                                               

function TRepositorioMateriaFornecedor.SQLGetAll: String;                                
begin                                                                                              
  result := 'select * from MATERIA_FORNECEDOR';                                                          
end;                                                                                               

function TRepositorioMateriaFornecedor.SQLGetExiste(campo: String): String;              
begin                                                                                              
  result := 'select '+ campo +' from MATERIA_FORNECEDOR where '+ campo +' = :ncampo';                
end;                                                                                               

function TRepositorioMateriaFornecedor.SQLRemover: String;                               
begin                                                                                              
   result := ' delete from MATERIA_FORNECEDOR where codigo = :codigo ';                                  
end;                                                                                               

function TRepositorioMateriaFornecedor.SQLSalvar: String;                                
begin                                                                                              
  result := 'update or insert into MATERIA_FORNECEDOR                                            '+
            ' ( CODIGO, CODIGO_MATERIA, CODIGO_FORNECEDOR, CODIGO_MATERIA_FORNECEDOR)            '+
            ' Values ( :CODIGO, :CODIGO_MATERIA, :CODIGO_FORNECEDOR, :CODIGO_MATERIA_FORNECEDOR) ';
end;                                                                                               

end.                                                                                               
