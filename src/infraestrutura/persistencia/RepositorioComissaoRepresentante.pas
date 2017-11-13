unit RepositorioComissaoRepresentante;                                                       
interface                                                                                          
uses DB,
     Auditoria,
     Repositorio;                                       
type
  TRepositorioComissaoRepresentante = class(TRepositorio)                      
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
  ComissaoRepresentante;                                                                        

{ TRepositorioComissaoRepresentante }                                                      

function TRepositorioComissaoRepresentante.Get(Dataset: TDataSet): TObject;                  
var                                                                                                
  ComissaoRepresentante :TComissaoRepresentante;                                                 
begin                                                                                              
   ComissaoRepresentante                      := TComissaoRepresentante.Create;
   ComissaoRepresentante.CODIGO               := self.FQuery.FieldByName('CODIGO'  ).AsInteger;
   ComissaoRepresentante.CODIGO_REPRESENTANTE := self.FQuery.FieldByName('CODIGO_REPRESENTANTE'  ).AsInteger;
   ComissaoRepresentante.ANO                  := self.FQuery.FieldByName('ANO'  ).AsInteger;
   ComissaoRepresentante.MES                  := self.FQuery.FieldByName('MES'  ).AsInteger;
   result := ComissaoRepresentante;
end;                                                                                               

function TRepositorioComissaoRepresentante.GetIdentificador(Objeto: TObject): Variant;       
begin                                                                                              
  result := TComissaoRepresentante(Objeto).Codigo;                                                 
end;                                                                                               

function TRepositorioComissaoRepresentante.GetNomeDaTabela: String;                          
begin                                                                                              
result := 'COMISSAO_REPRESENTANTE';                                                                          
end;                                                                                               

function TRepositorioComissaoRepresentante.GetRepositorio: TRepositorio;                     
begin                                                                                              
result := TRepositorioComissaoRepresentante.Create;                                          
end;                                                                                               

function TRepositorioComissaoRepresentante.IsInsercao(Objeto: TObject): Boolean;             
begin                                                                                              
  result := (TComissaoRepresentante(Objeto).Codigo <= 0);                                         
end;                                                                                               

procedure TRepositorioComissaoRepresentante.SetCamposAlterados(Auditoria: TAuditoria;        
  AntigoObjeto, Objeto: TObject);                                                                  
var                                                                                                
  ComissaoRepresentanteAntigo :TComissaoRepresentante;                                           
  ComissaoRepresentanteNovo   :TComissaoRepresentante;                                           
begin                                                                                              
   ComissaoRepresentanteAntigo := (AntigoObjeto as TComissaoRepresentante);                      
   ComissaoRepresentanteNovo   := (Objeto       as TComissaoRepresentante);                      

   if (ComissaoRepresentanteAntigo.CODIGO_REPRESENTANTE <> ComissaoRepresentanteNovo.CODIGO_REPRESENTANTE) then
   Auditoria.AdicionaCampoAlterado('CODIGO_REPRESENTANTE', intToStr(ComissaoRepresentanteAntigo.CODIGO_REPRESENTANTE), intToStr(ComissaoRepresentanteNovo.CODIGO_REPRESENTANTE));

   if (ComissaoRepresentanteAntigo.ANO <> ComissaoRepresentanteNovo.ANO) then
   Auditoria.AdicionaCampoAlterado('ANO', intToStr(ComissaoRepresentanteAntigo.ANO), intToStr(ComissaoRepresentanteNovo.ANO));

   if (ComissaoRepresentanteAntigo.MES <> ComissaoRepresentanteNovo.MES) then
   Auditoria.AdicionaCampoAlterado('MES', intToStr(ComissaoRepresentanteAntigo.MES), intToStr(ComissaoRepresentanteNovo.MES));


end;                                                                                               

procedure TRepositorioComissaoRepresentante.SetCamposExcluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  ComissaoRepresentante :TComissaoRepresentante;                                                 
begin                                                                                              
   ComissaoRepresentante := (Objeto as TComissaoRepresentante);                                  

   Auditoria.AdicionaCampoExcluido('CODIGO' , intToStr(ComissaoRepresentante.CODIGO));
   Auditoria.AdicionaCampoExcluido('CODIGO_REPRESENTANTE' , intToStr(ComissaoRepresentante.CODIGO_REPRESENTANTE));
   Auditoria.AdicionaCampoExcluido('ANO' , intToStr(ComissaoRepresentante.ANO));
   Auditoria.AdicionaCampoExcluido('MES' , intToStr(ComissaoRepresentante.MES));

end;                                                                                               

procedure TRepositorioComissaoRepresentante.SetCamposIncluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  ComissaoRepresentante :TComissaoRepresentante;                                                 
begin                                                                                              
   ComissaoRepresentante := (Objeto as TComissaoRepresentante);                                  

   Auditoria.AdicionaCampoIncluido('CODIGO' , intToStr(ComissaoRepresentante.CODIGO));
   Auditoria.AdicionaCampoIncluido('CODIGO_REPRESENTANTE' , intToStr(ComissaoRepresentante.CODIGO_REPRESENTANTE));
   Auditoria.AdicionaCampoIncluido('ANO' , intToStr(ComissaoRepresentante.ANO));
   Auditoria.AdicionaCampoIncluido('MES' , intToStr(ComissaoRepresentante.MES));

end;                                                                                               

procedure TRepositorioComissaoRepresentante.SetIdentificador(Objeto: TObject;                
  Identificador: Variant);                                                                         
begin                                                                                              
  TComissaoRepresentante(Objeto).Codigo := Integer(Identificador);                                
end;                                                                                               

procedure TRepositorioComissaoRepresentante.SetParametros(Objeto: TObject);                  
var                                                                                                
  ComissaoRepresentante :TComissaoRepresentante;                                                 
begin                                                                                              
   ComissaoRepresentante := (Objeto as TComissaoRepresentante);                                  
  if (ComissaoRepresentante.Codigo > 0) then  inherited SetParametro('codigo', ComissaoRepresentante.Codigo) 
  else                         inherited LimpaParametro('codigo');                     

   self.FQuery.ParamByName('CODIGO').AsInteger        := ComissaoRepresentante.CODIGO; 
   self.FQuery.ParamByName('CODIGO_REPRESENTANTE').AsInteger        := ComissaoRepresentante.CODIGO_REPRESENTANTE; 
   self.FQuery.ParamByName('ANO').AsInteger        := ComissaoRepresentante.ANO; 
   self.FQuery.ParamByName('MES').AsInteger        := ComissaoRepresentante.MES; 

end;                                                                                               

function TRepositorioComissaoRepresentante.SQLGet: String;                                   
begin                                                                                              
  result := 'select * from COMISSAO_REPRESENTANTE where codigo = :ncod';                                     
end;                                                                                               

function TRepositorioComissaoRepresentante.SQLGetAll: String;                                
begin                                                                                              
  result := 'select * from COMISSAO_REPRESENTANTE';                                                          
end;                                                                                               

function TRepositorioComissaoRepresentante.SQLGetExiste(arrayDeCampos :array of string): String;
begin                                                                                              
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;                                                                                               

function TRepositorioComissaoRepresentante.SQLRemover: String;                               
begin                                                                                              
   result := ' delete from COMISSAO_REPRESENTANTE where codigo = :codigo ';                                  
end;                                                                                               

function TRepositorioComissaoRepresentante.SQLSalvar: String;                                
begin                                                                                              
  result := 'update or insert into COMISSAO_REPRESENTANTE      '+
 ' ( CODIGO, CODIGO_REPRESENTANTE, ANO, MES) ' + 
' Values ( :CODIGO, :CODIGO_REPRESENTANTE, :ANO, :MES) '
end;                                                                                               

end.                                                                                               
