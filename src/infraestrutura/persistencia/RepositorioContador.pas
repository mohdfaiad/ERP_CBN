unit RepositorioContador;                                                       
interface                                                                                          
uses DB,
     Auditoria,
     Repositorio;                                       
type
  TRepositorioContador = class(TRepositorio)                      
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
  Contador;                                                                        

{ TRepositorioContador }                                                      

function TRepositorioContador.Get(Dataset: TDataSet): TObject;                  
var                                                                                                
  Contador :TContador;                                                 
begin                                                                                              
   Contador                := TContador.Create;
   Contador.CODIGO         := self.FQuery.FieldByName('CODIGO'  ).AsInteger;
   Contador.NOME           := self.FQuery.FieldByName('NOME'  ).AsString;
   Contador.CRC            := self.FQuery.FieldByName('CRC'  ).AsString;
   Contador.CPF            := self.FQuery.FieldByName('CPF'  ).AsString;
   Contador.CNPJ           := self.FQuery.FieldByName('CNPJ'  ).AsString;
   Contador.CEP            := self.FQuery.FieldByName('CEP'  ).AsString;
   Contador.RUA            := self.FQuery.FieldByName('RUA'  ).AsString;
   Contador.NUMERO         := self.FQuery.FieldByName('NUMERO'  ).AsString;
   Contador.BAIRRO         := self.FQuery.FieldByName('BAIRRO'  ).AsString;
   Contador.CODIGO_CIDADE  := self.FQuery.FieldByName('CODIGO_CIDADE'  ).AsInteger;
   Contador.FONE           := self.FQuery.FieldByName('FONE'  ).AsString;
   Contador.EMAIL          := self.FQuery.FieldByName('EMAIL'  ).AsString;
   result := Contador;
end;                                                                                               

function TRepositorioContador.GetIdentificador(Objeto: TObject): Variant;       
begin                                                                                              
  result := TContador(Objeto).Codigo;                                                 
end;                                                                                               

function TRepositorioContador.GetNomeDaTabela: String;                          
begin                                                                                              
result := 'CONTADORES';                                                                          
end;                                                                                               

function TRepositorioContador.GetRepositorio: TRepositorio;                     
begin                                                                                              
result := TRepositorioContador.Create;                                          
end;                                                                                               

function TRepositorioContador.IsInsercao(Objeto: TObject): Boolean;             
begin                                                                                              
  result := (TContador(Objeto).Codigo <= 0);                                         
end;                                                                                               

procedure TRepositorioContador.SetCamposAlterados(Auditoria: TAuditoria;        
  AntigoObjeto, Objeto: TObject);                                                                  
var                                                                                                
  ContadorAntigo :TContador;                                           
  ContadorNovo   :TContador;                                           
begin                                                                                              
   ContadorAntigo := (AntigoObjeto as TContador);                      
   ContadorNovo   := (Objeto       as TContador);                      

   if (ContadorAntigo.NOME <> ContadorNovo.NOME) then
   Auditoria.AdicionaCampoAlterado('NOME', ContadorAntigo.NOME, ContadorNovo.NOME);

   if (ContadorAntigo.CRC <> ContadorNovo.CRC) then
   Auditoria.AdicionaCampoAlterado('CRC', ContadorAntigo.CRC, ContadorNovo.CRC);

   if (ContadorAntigo.CPF <> ContadorNovo.CPF) then
   Auditoria.AdicionaCampoAlterado('CPF', ContadorAntigo.CPF, ContadorNovo.CPF);

   if (ContadorAntigo.CNPJ <> ContadorNovo.CNPJ) then
   Auditoria.AdicionaCampoAlterado('CNPJ', ContadorAntigo.CNPJ, ContadorNovo.CNPJ);

   if (ContadorAntigo.CEP <> ContadorNovo.CEP) then
   Auditoria.AdicionaCampoAlterado('CEP', ContadorAntigo.CEP, ContadorNovo.CEP);

   if (ContadorAntigo.RUA <> ContadorNovo.RUA) then
   Auditoria.AdicionaCampoAlterado('RUA', ContadorAntigo.RUA, ContadorNovo.RUA);

   if (ContadorAntigo.NUMERO <> ContadorNovo.NUMERO) then
   Auditoria.AdicionaCampoAlterado('NUMERO', ContadorAntigo.NUMERO, ContadorNovo.NUMERO);

   if (ContadorAntigo.BAIRRO <> ContadorNovo.BAIRRO) then
   Auditoria.AdicionaCampoAlterado('BAIRRO', ContadorAntigo.BAIRRO, ContadorNovo.BAIRRO);

   if (ContadorAntigo.CODIGO_CIDADE <> ContadorNovo.CODIGO_CIDADE) then
   Auditoria.AdicionaCampoAlterado('CODIGO_CIDADE', intToStr(ContadorAntigo.CODIGO_CIDADE), intToStr(ContadorNovo.CODIGO_CIDADE));

   if (ContadorAntigo.FONE <> ContadorNovo.FONE) then
   Auditoria.AdicionaCampoAlterado('FONE', ContadorAntigo.FONE, ContadorNovo.FONE);

   if (ContadorAntigo.EMAIL <> ContadorNovo.EMAIL) then
   Auditoria.AdicionaCampoAlterado('EMAIL', ContadorAntigo.EMAIL, ContadorNovo.EMAIL);


end;                                                                                               

procedure TRepositorioContador.SetCamposExcluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  Contador :TContador;                                                 
begin                                                                                              
   Contador := (Objeto as TContador);                                  

   Auditoria.AdicionaCampoExcluido('CODIGO' , intToStr(Contador.CODIGO));
   Auditoria.AdicionaCampoExcluido('NOME' , Contador.NOME);
   Auditoria.AdicionaCampoExcluido('CRC' , Contador.CRC);
   Auditoria.AdicionaCampoExcluido('CPF' , Contador.CPF);
   Auditoria.AdicionaCampoExcluido('CNPJ' , Contador.CNPJ);
   Auditoria.AdicionaCampoExcluido('CEP' , Contador.CEP);
   Auditoria.AdicionaCampoExcluido('RUA' , Contador.RUA);
   Auditoria.AdicionaCampoExcluido('NUMERO' , Contador.NUMERO);
   Auditoria.AdicionaCampoExcluido('BAIRRO' , Contador.BAIRRO);
   Auditoria.AdicionaCampoExcluido('CODIGO_CIDADE' , intToStr(Contador.CODIGO_CIDADE));
   Auditoria.AdicionaCampoExcluido('FONE' , Contador.FONE);
   Auditoria.AdicionaCampoExcluido('EMAIL' , Contador.EMAIL);

end;                                                                                               

procedure TRepositorioContador.SetCamposIncluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  Contador :TContador;                                                 
begin                                                                                              
   Contador := (Objeto as TContador);                                  

   Auditoria.AdicionaCampoIncluido('CODIGO' , intToStr(Contador.CODIGO));
   Auditoria.AdicionaCampoIncluido('NOME' , Contador.NOME);
   Auditoria.AdicionaCampoIncluido('CRC' , Contador.CRC);
   Auditoria.AdicionaCampoIncluido('CPF' , Contador.CPF);
   Auditoria.AdicionaCampoIncluido('CNPJ' , Contador.CNPJ);
   Auditoria.AdicionaCampoIncluido('CEP' , Contador.CEP);
   Auditoria.AdicionaCampoIncluido('RUA' , Contador.RUA);
   Auditoria.AdicionaCampoIncluido('NUMERO' , Contador.NUMERO);
   Auditoria.AdicionaCampoIncluido('BAIRRO' , Contador.BAIRRO);
   Auditoria.AdicionaCampoIncluido('CODIGO_CIDADE' , intToStr(Contador.CODIGO_CIDADE));
   Auditoria.AdicionaCampoIncluido('FONE' , Contador.FONE);
   Auditoria.AdicionaCampoIncluido('EMAIL' , Contador.EMAIL);

end;                                                                                               

procedure TRepositorioContador.SetIdentificador(Objeto: TObject;                
  Identificador: Variant);                                                                         
begin                                                                                              
  TContador(Objeto).Codigo := Integer(Identificador);                                
end;                                                                                               

procedure TRepositorioContador.SetParametros(Objeto: TObject);                  
var                                                                                                
  Contador :TContador;                                                 
begin                                                                                              
   Contador := (Objeto as TContador);                                  
  if (Contador.Codigo > 0) then  inherited SetParametro('codigo', Contador.Codigo) 
  else                         inherited LimpaParametro('codigo');                     

   self.FQuery.ParamByName('CODIGO').AsInteger        := Contador.CODIGO; 
   self.FQuery.ParamByName('NOME').AsString        := Contador.NOME; 
   self.FQuery.ParamByName('CRC').AsString        := Contador.CRC; 
   self.FQuery.ParamByName('CPF').AsString        := Contador.CPF; 
   self.FQuery.ParamByName('CNPJ').AsString        := Contador.CNPJ; 
   self.FQuery.ParamByName('CEP').AsString        := Contador.CEP; 
   self.FQuery.ParamByName('RUA').AsString        := Contador.RUA; 
   self.FQuery.ParamByName('NUMERO').AsString        := Contador.NUMERO; 
   self.FQuery.ParamByName('BAIRRO').AsString        := Contador.BAIRRO; 
   self.FQuery.ParamByName('CODIGO_CIDADE').AsInteger        := Contador.CODIGO_CIDADE; 
   self.FQuery.ParamByName('FONE').AsString        := Contador.FONE; 
   self.FQuery.ParamByName('EMAIL').AsString        := Contador.EMAIL;

end;                                                                                               

function TRepositorioContador.SQLGet: String;                                   
begin                                                                                              
  result := 'select * from CONTADORES where codigo = :ncod';                                     
end;                                                                                               

function TRepositorioContador.SQLGetAll: String;                                
begin                                                                                              
  result := 'select * from CONTADORES';
end;

function TRepositorioContador.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;                                                                                               

function TRepositorioContador.SQLRemover: String;                               
begin                                                                                              
   result := ' delete from CONTADORES where codigo = :codigo ';
end;                                                                                               

function TRepositorioContador.SQLSalvar: String;                                
begin                                                                                              
  result := 'update or insert into CONTADORES                                                                          '+
            ' ( CODIGO, NOME, CRC, CPF, CNPJ, CEP, RUA, NUMERO, BAIRRO, CODIGO_CIDADE, FONE, EMAIL)                    ' +
            ' Values ( :CODIGO, :NOME, :CRC, :CPF, :CNPJ, :CEP, :RUA, :NUMERO, :BAIRRO, :CODIGO_CIDADE, :FONE, :EMAIL) '
end;                                                                                               

end.                                                                                               
