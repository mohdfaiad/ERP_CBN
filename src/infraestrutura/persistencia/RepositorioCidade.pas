unit RepositorioCidade;                                                       
interface                                                                                          
uses DB,
     Auditoria,
     Repositorio;                                       
type
  TRepositorioCidade = class(TRepositorio)                      
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
  Cidade;                                                                        

{ TRepositorioCidade }                                                      

function TRepositorioCidade.Get(Dataset: TDataSet): TObject;                  
var                                                                                                
  Cidade :TCidade;                                                 
begin                                                                                              
   Cidade  := TCidade.Create;                                      
   Cidade.CODIGO     := self.FQuery.FieldByName('CODIGO'  ).AsInteger;
   Cidade.CODEST     := self.FQuery.FieldByName('CODEST'  ).AsInteger;
   Cidade.NOME     := self.FQuery.FieldByName('NOME'  ).AsString;
   Cidade.CEP     := self.FQuery.FieldByName('CEP'  ).AsString;
   Cidade.CODIBGE     := self.FQuery.FieldByName('CODIBGE'  ).AsInteger;
   result := Cidade;
end;                                                                                               

function TRepositorioCidade.GetIdentificador(Objeto: TObject): Variant;       
begin                                                                                              
  result := TCidade(Objeto).Codigo;                                                 
end;                                                                                               

function TRepositorioCidade.GetNomeDaTabela: String;                          
begin                                                                                              
result := 'CIDADES';                                                                          
end;                                                                                               

function TRepositorioCidade.GetRepositorio: TRepositorio;                     
begin                                                                                              
result := TRepositorioCidade.Create;                                          
end;                                                                                               

function TRepositorioCidade.IsInsercao(Objeto: TObject): Boolean;             
begin                                                                                              
  result := (TCidade(Objeto).Codigo <= 0);                                         
end;                                                                                               

procedure TRepositorioCidade.SetCamposAlterados(Auditoria: TAuditoria;        
  AntigoObjeto, Objeto: TObject);                                                                  
var                                                                                                
  CidadeAntigo :TCidade;                                           
  CidadeNovo   :TCidade;                                           
begin                                                                                              
   CidadeAntigo := (AntigoObjeto as TCidade);                      
   CidadeNovo   := (Objeto       as TCidade);                      

   if (CidadeAntigo.CODEST <> CidadeNovo.CODEST) then
   Auditoria.AdicionaCampoAlterado('CODEST', intToStr(CidadeAntigo.CODEST), intToStr(CidadeNovo.CODEST));

   if (CidadeAntigo.NOME <> CidadeNovo.NOME) then
   Auditoria.AdicionaCampoAlterado('NOME', CidadeAntigo.NOME, CidadeNovo.NOME);

   if (CidadeAntigo.CEP <> CidadeNovo.CEP) then
   Auditoria.AdicionaCampoAlterado('CEP', CidadeAntigo.CEP, CidadeNovo.CEP);

   if (CidadeAntigo.CODIBGE <> CidadeNovo.CODIBGE) then
   Auditoria.AdicionaCampoAlterado('CODIBGE', intToStr(CidadeAntigo.CODIBGE), intToStr(CidadeNovo.CODIBGE));


end;                                                                                               

procedure TRepositorioCidade.SetCamposExcluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  Cidade :TCidade;                                                 
begin                                                                                              
   Cidade := (Objeto as TCidade);                                  

   Auditoria.AdicionaCampoExcluido('CODIGO' , intToStr(Cidade.CODIGO));
   Auditoria.AdicionaCampoExcluido('CODEST' , intToStr(Cidade.CODEST));
   Auditoria.AdicionaCampoExcluido('NOME' , Cidade.NOME);
   Auditoria.AdicionaCampoExcluido('CEP' , Cidade.CEP);
   Auditoria.AdicionaCampoExcluido('CODIBGE' , intToStr(Cidade.CODIBGE));

end;                                                                                               

procedure TRepositorioCidade.SetCamposIncluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  Cidade :TCidade;                                                 
begin                                                                                              
   Cidade := (Objeto as TCidade);                                  

   Auditoria.AdicionaCampoIncluido('CODIGO' , intToStr(Cidade.CODIGO));
   Auditoria.AdicionaCampoIncluido('CODEST' , intToStr(Cidade.CODEST));
   Auditoria.AdicionaCampoIncluido('NOME' , Cidade.NOME);
   Auditoria.AdicionaCampoIncluido('CEP' , Cidade.CEP);
   Auditoria.AdicionaCampoIncluido('CODIBGE' , intToStr(Cidade.CODIBGE));

end;                                                                                               

procedure TRepositorioCidade.SetIdentificador(Objeto: TObject;                
  Identificador: Variant);                                                                         
begin                                                                                              
  TCidade(Objeto).Codigo := Integer(Identificador);                                
end;                                                                                               

procedure TRepositorioCidade.SetParametros(Objeto: TObject);                  
var                                                                                                
  Cidade :TCidade;                                                 
begin                                                                                              
   Cidade := (Objeto as TCidade);                                  
  if (Cidade.Codigo > 0) then  inherited SetParametro('codigo', Cidade.Codigo) 
  else                         inherited LimpaParametro('codigo');                     

   self.FQuery.ParamByName('CODIGO').AsInteger        := Cidade.CODIGO; 
   self.FQuery.ParamByName('CODEST').AsInteger        := Cidade.CODEST; 
   self.FQuery.ParamByName('NOME').AsString        := Cidade.NOME; 
   self.FQuery.ParamByName('CEP').AsString        := Cidade.CEP; 
   self.FQuery.ParamByName('CODIBGE').AsInteger        := Cidade.CODIBGE; 

end;                                                                                               

function TRepositorioCidade.SQLGet: String;                                   
begin                                                                                              
  result := 'select * from CIDADES where codigo = :ncod';                                     
end;                                                                                               

function TRepositorioCidade.SQLGetAll: String;                                
begin                                                                                              
  result := 'select * from CIDADES';                                                          
end;                                                                                               

function TRepositorioCidade.SQLGetExiste(campo: String): String;
begin
  result := 'select * from CIDADES where '+ campo +' = :'+campo;
end;

function TRepositorioCidade.SQLRemover: String;                               
begin                                                                                              
   result := ' delete from CIDADES where codigo = :codigo ';                                  
end;                                                                                               

function TRepositorioCidade.SQLSalvar: String;                                
begin                                                                                              
  result := 'update or insert into CIDADES      '+
 ' ( CODIGO, CODEST, NOME, CEP, CODIBGE) ' + 
' Values ( :CODIGO, :CODEST, :NOME, :CEP, :CODIBGE) '
end;                                                                                               

end.                                                                                               
