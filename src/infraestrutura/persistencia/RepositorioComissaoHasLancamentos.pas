unit RepositorioComissaoHasLancamentos;                                                       
interface                                                                                          
uses DB,
     Auditoria,
     Repositorio;                                       
type
  TRepositorioComissaoHasLancamentos = class(TRepositorio)                      
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
  ComissaoHasLancamentos;                                                                        

{ TRepositorioComissaoHasLancamentos }                                                      

function TRepositorioComissaoHasLancamentos.Get(Dataset: TDataSet): TObject;                  
var                                                                                                
  ComissaoHasLancamentos :TComissaoHasLancamentos;                                                 
begin                                                                                              
   ComissaoHasLancamentos  := TComissaoHasLancamentos.Create;                                      
   ComissaoHasLancamentos.CODIGO     := self.FQuery.FieldByName('CODIGO'  ).AsInteger;
   ComissaoHasLancamentos.CODIGO_COMISSAO_REPRESENTANTE     := self.FQuery.FieldByName('CODIGO_COMISSAO_REPRESENTANTE'  ).AsInteger;
   ComissaoHasLancamentos.CODIGO_LANCAMENTO     := self.FQuery.FieldByName('CODIGO_LANCAMENTO'  ).AsFloat;
   ComissaoHasLancamentos.TIPO     := self.FQuery.FieldByName('TIPO'  ).AsString;
   result := ComissaoHasLancamentos;
end;                                                                                               

function TRepositorioComissaoHasLancamentos.GetIdentificador(Objeto: TObject): Variant;       
begin                                                                                              
  result := TComissaoHasLancamentos(Objeto).Codigo;                                                 
end;                                                                                               

function TRepositorioComissaoHasLancamentos.GetNomeDaTabela: String;                          
begin                                                                                              
result := 'COMISSAO_HAS_LANCAMENTOS';                                                                          
end;                                                                                               

function TRepositorioComissaoHasLancamentos.GetRepositorio: TRepositorio;                     
begin                                                                                              
result := TRepositorioComissaoHasLancamentos.Create;                                          
end;                                                                                               

function TRepositorioComissaoHasLancamentos.IsInsercao(Objeto: TObject): Boolean;             
begin                                                                                              
  result := (TComissaoHasLancamentos(Objeto).Codigo <= 0);                                         
end;                                                                                               

procedure TRepositorioComissaoHasLancamentos.SetCamposAlterados(Auditoria: TAuditoria;        
  AntigoObjeto, Objeto: TObject);                                                                  
var                                                                                                
  ComissaoHasLancamentosAntigo :TComissaoHasLancamentos;                                           
  ComissaoHasLancamentosNovo   :TComissaoHasLancamentos;                                           
begin                                                                                              
   ComissaoHasLancamentosAntigo := (AntigoObjeto as TComissaoHasLancamentos);                      
   ComissaoHasLancamentosNovo   := (Objeto       as TComissaoHasLancamentos);                      

   if (ComissaoHasLancamentosAntigo.CODIGO_COMISSAO_REPRESENTANTE <> ComissaoHasLancamentosNovo.CODIGO_COMISSAO_REPRESENTANTE) then
   Auditoria.AdicionaCampoAlterado('CODIGO_COMISSAO_REPRESENTANTE', intToStr(ComissaoHasLancamentosAntigo.CODIGO_COMISSAO_REPRESENTANTE), intToStr(ComissaoHasLancamentosNovo.CODIGO_COMISSAO_REPRESENTANTE));

   if (ComissaoHasLancamentosAntigo.CODIGO_LANCAMENTO <> ComissaoHasLancamentosNovo.CODIGO_LANCAMENTO) then
   Auditoria.AdicionaCampoAlterado('CODIGO_LANCAMENTO', FloatToStr(ComissaoHasLancamentosAntigo.CODIGO_LANCAMENTO), FloatToStr(ComissaoHasLancamentosNovo.CODIGO_LANCAMENTO));

   if (ComissaoHasLancamentosAntigo.TIPO <> ComissaoHasLancamentosNovo.TIPO) then
   Auditoria.AdicionaCampoAlterado('TIPO', ComissaoHasLancamentosAntigo.TIPO, ComissaoHasLancamentosNovo.TIPO);


end;                                                                                               

procedure TRepositorioComissaoHasLancamentos.SetCamposExcluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  ComissaoHasLancamentos :TComissaoHasLancamentos;                                                 
begin                                                                                              
   ComissaoHasLancamentos := (Objeto as TComissaoHasLancamentos);                                  

   Auditoria.AdicionaCampoExcluido('CODIGO' , intToStr(ComissaoHasLancamentos.CODIGO));
   Auditoria.AdicionaCampoExcluido('CODIGO_COMISSAO_REPRESENTANTE' , intToStr(ComissaoHasLancamentos.CODIGO_COMISSAO_REPRESENTANTE));
   Auditoria.AdicionaCampoExcluido('CODIGO_LANCAMENTO' , FloatToStr(ComissaoHasLancamentos.CODIGO_LANCAMENTO));
   Auditoria.AdicionaCampoExcluido('TIPO' , ComissaoHasLancamentos.TIPO);

end;                                                                                               

procedure TRepositorioComissaoHasLancamentos.SetCamposIncluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  ComissaoHasLancamentos :TComissaoHasLancamentos;                                                 
begin                                                                                              
   ComissaoHasLancamentos := (Objeto as TComissaoHasLancamentos);                                  

   Auditoria.AdicionaCampoIncluido('CODIGO' , intToStr(ComissaoHasLancamentos.CODIGO));
   Auditoria.AdicionaCampoIncluido('CODIGO_COMISSAO_REPRESENTANTE' , intToStr(ComissaoHasLancamentos.CODIGO_COMISSAO_REPRESENTANTE));
   Auditoria.AdicionaCampoIncluido('CODIGO_LANCAMENTO' , FloatToStr(ComissaoHasLancamentos.CODIGO_LANCAMENTO));
   Auditoria.AdicionaCampoIncluido('TIPO' , ComissaoHasLancamentos.TIPO);

end;                                                                                               

procedure TRepositorioComissaoHasLancamentos.SetIdentificador(Objeto: TObject;                
  Identificador: Variant);                                                                         
begin                                                                                              
  TComissaoHasLancamentos(Objeto).Codigo := Integer(Identificador);                                
end;                                                                                               

procedure TRepositorioComissaoHasLancamentos.SetParametros(Objeto: TObject);                  
var                                                                                                
  ComissaoHasLancamentos :TComissaoHasLancamentos;                                                 
begin                                                                                              
   ComissaoHasLancamentos := (Objeto as TComissaoHasLancamentos);                                  
  if (ComissaoHasLancamentos.Codigo > 0) then  inherited SetParametro('codigo', ComissaoHasLancamentos.Codigo) 
  else                         inherited LimpaParametro('codigo');                     

   self.FQuery.ParamByName('CODIGO').AsInteger        := ComissaoHasLancamentos.CODIGO; 
   self.FQuery.ParamByName('CODIGO_COMISSAO_REPRESENTANTE').AsInteger        := ComissaoHasLancamentos.CODIGO_COMISSAO_REPRESENTANTE; 
   self.FQuery.ParamByName('CODIGO_LANCAMENTO').AsFloat        := ComissaoHasLancamentos.CODIGO_LANCAMENTO; 
   self.FQuery.ParamByName('TIPO').AsString        := ComissaoHasLancamentos.TIPO;

end;

function TRepositorioComissaoHasLancamentos.SQLGet: String;                                   
begin                                                                                              
  result := 'select * from COMISSAO_HAS_LANCAMENTOS where codigo = :ncod';                                     
end;                                                                                               

function TRepositorioComissaoHasLancamentos.SQLGetAll: String;                                
begin                                                                                              
  result := 'select * from COMISSAO_HAS_LANCAMENTOS';                                                          
end;                                                                                               

function TRepositorioComissaoHasLancamentos.SQLGetExiste(campo: String): String;              
begin                                                                                              
  result := 'select '+ campo +' from COMISSAO_HAS_LANCAMENTOS where '+ campo +' = :ncampo';                
end;                                                                                               

function TRepositorioComissaoHasLancamentos.SQLRemover: String;                               
begin                                                                                              
   result := ' delete from COMISSAO_HAS_LANCAMENTOS where codigo = :codigo ';                                  
end;                                                                                               

function TRepositorioComissaoHasLancamentos.SQLSalvar: String;                                
begin                                                                                              
  result := 'update or insert into COMISSAO_HAS_LANCAMENTOS                                '+
            ' ( CODIGO, CODIGO_COMISSAO_REPRESENTANTE, CODIGO_LANCAMENTO, TIPO)            '+
            ' Values ( :CODIGO, :CODIGO_COMISSAO_REPRESENTANTE, :CODIGO_LANCAMENTO, :TIPO) '
end;                                                                                               

end.
