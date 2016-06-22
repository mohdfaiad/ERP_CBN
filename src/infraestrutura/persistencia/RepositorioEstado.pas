unit RepositorioEstado;                                                       
interface                                                                                          
uses DB,
     Auditoria,
     Repositorio;                                       
type
  TRepositorioEstado = class(TRepositorio)                      
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
  Estado;                                                                        

{ TRepositorioEstado }                                                      

function TRepositorioEstado.Get(Dataset: TDataSet): TObject;                  
var                                                                                                
  Estado :TEstado;                                                 
begin                                                                                              
   Estado  := TEstado.Create;                                      
   Estado.CODIGO     := self.FQuery.FieldByName('CODIGO'  ).AsInteger;
   Estado.SIGLA     := self.FQuery.FieldByName('SIGLA'  ).AsString;
   Estado.NOME     := self.FQuery.FieldByName('NOME'  ).AsString;
   result := Estado;
end;                                                                                               

function TRepositorioEstado.GetIdentificador(Objeto: TObject): Variant;       
begin                                                                                              
  result := TEstado(Objeto).Codigo;                                                 
end;                                                                                               

function TRepositorioEstado.GetNomeDaTabela: String;                          
begin                                                                                              
result := 'ESTADOS';                                                                          
end;                                                                                               

function TRepositorioEstado.GetRepositorio: TRepositorio;                     
begin                                                                                              
result := TRepositorioEstado.Create;                                          
end;                                                                                               

function TRepositorioEstado.IsInsercao(Objeto: TObject): Boolean;             
begin                                                                                              
  result := (TEstado(Objeto).Codigo <= 0);                                         
end;                                                                                               

procedure TRepositorioEstado.SetCamposAlterados(Auditoria: TAuditoria;        
  AntigoObjeto, Objeto: TObject);                                                                  
var                                                                                                
  EstadoAntigo :TEstado;                                           
  EstadoNovo   :TEstado;                                           
begin                                                                                              
   EstadoAntigo := (AntigoObjeto as TEstado);                      
   EstadoNovo   := (Objeto       as TEstado);                      

   if (EstadoAntigo.SIGLA <> EstadoNovo.SIGLA) then
   Auditoria.AdicionaCampoAlterado('SIGLA', EstadoAntigo.SIGLA, EstadoNovo.SIGLA);

   if (EstadoAntigo.NOME <> EstadoNovo.NOME) then
   Auditoria.AdicionaCampoAlterado('NOME', EstadoAntigo.NOME, EstadoNovo.NOME);


end;                                                                                               

procedure TRepositorioEstado.SetCamposExcluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  Estado :TEstado;                                                 
begin                                                                                              
   Estado := (Objeto as TEstado);                                  

   Auditoria.AdicionaCampoExcluido('CODIGO' , intToStr(Estado.CODIGO));
   Auditoria.AdicionaCampoExcluido('SIGLA' , Estado.SIGLA);
   Auditoria.AdicionaCampoExcluido('NOME' , Estado.NOME);

end;                                                                                               

procedure TRepositorioEstado.SetCamposIncluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  Estado :TEstado;                                                 
begin                                                                                              
   Estado := (Objeto as TEstado);                                  

   Auditoria.AdicionaCampoIncluido('CODIGO' , intToStr(Estado.CODIGO));
   Auditoria.AdicionaCampoIncluido('SIGLA' , Estado.SIGLA);
   Auditoria.AdicionaCampoIncluido('NOME' , Estado.NOME);

end;                                                                                               

procedure TRepositorioEstado.SetIdentificador(Objeto: TObject;                
  Identificador: Variant);                                                                         
begin                                                                                              
  TEstado(Objeto).Codigo := Integer(Identificador);                                
end;                                                                                               

procedure TRepositorioEstado.SetParametros(Objeto: TObject);                  
var                                                                                                
  Estado :TEstado;                                                 
begin                                                                                              
   Estado := (Objeto as TEstado);                                  
  if (Estado.Codigo > 0) then  inherited SetParametro('codigo', Estado.Codigo) 
  else                         inherited LimpaParametro('codigo');                     

   self.FQuery.ParamByName('CODIGO').AsInteger        := Estado.CODIGO; 
   self.FQuery.ParamByName('SIGLA').AsString        := Estado.SIGLA; 
   self.FQuery.ParamByName('NOME').AsString        := Estado.NOME; 

end;                                                                                               

function TRepositorioEstado.SQLGet: String;                                   
begin                                                                                              
  result := 'select * from ESTADOS where codigo = :ncod';                                     
end;                                                                                               

function TRepositorioEstado.SQLGetAll: String;                                
begin                                                                                              
  result := 'select * from ESTADOS';                                                          
end;                                                                                               

function TRepositorioEstado.SQLGetExiste(campo: String): String;              
begin                                                                                              
  result := 'select * from ESTADOS where '+ campo +' = :'+campo;
end;                                                                                               

function TRepositorioEstado.SQLRemover: String;                               
begin                                                                                              
   result := ' delete from ESTADOS where codigo = :codigo ';                                  
end;

function TRepositorioEstado.SQLSalvar: String;                                
begin                                                                                              
  result := 'update or insert into ESTADOS      '+
 ' ( CODIGO, SIGLA, NOME) ' + 
' Values ( :CODIGO, :SIGLA, :NOME) '
end;                                                                                               

end.                                                                                               
