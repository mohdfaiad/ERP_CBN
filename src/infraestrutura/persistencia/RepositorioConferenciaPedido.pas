unit RepositorioConferenciaPedido;
interface                                                                                          
uses DB,
     Auditoria,
     Repositorio;                                       
type
  TRepositorioConferenciaPedido = class(TRepositorio)                      
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
  SysUtils, ConferenciaPedido, ConferenciaItem, FabricaRepositorio;

{ TRepositorioConferenciaPedido }                                                      

procedure TRepositorioConferenciaPedido.ExecutaDepoisDeSalvar(
  Objeto: TObject);
var repositorio :TRepositorio;
    ConferenciaPedido :TConferenciaPedido;
    i :integer;
begin
  ConferenciaPedido := (Objeto as TConferenciaPedido);
  repositorio       := nil;
  try
    repositorio := TFabricaRepositorio.GetRepositorio( TConferenciaItem.ClassName );
    if not assigned(ConferenciaPedido.Itens) then  EXIT;

    for i := 0 to ConferenciaPedido.Itens.Count - 1 do begin
      (ConferenciaPedido.Itens[i] as TConferenciaItem).codigo_conferencia := ConferenciaPedido.codigo;
      repositorio.Salvar( (ConferenciaPedido.Itens[i] as TConferenciaItem) )
    end;

  finally
    FreeAndNil( repositorio );
  end;
end;

function TRepositorioConferenciaPedido.Get(Dataset: TDataSet): TObject;
var                                                                                                
  ConferenciaPedido :TConferenciaPedido;                                                 
begin                                                                                              
   ConferenciaPedido                  := TConferenciaPedido.Create;
   ConferenciaPedido.CODIGO           := self.FQuery.FieldByName('CODIGO'  ).AsInteger;
   ConferenciaPedido.CODIGO_PEDIDO    := self.FQuery.FieldByName('CODIGO_PEDIDO'  ).AsInteger;
   ConferenciaPedido.CODIGO_USUARIO   := self.FQuery.FieldByName('CODIGO_USUARIO'  ).AsInteger;
   ConferenciaPedido.tempo_decorrido  := self.FQuery.FieldByName('tempo_decorrido').AsFloat;
   ConferenciaPedido.INICIO           := self.FQuery.FieldByName('INICIO'  ).AsDateTime;
   ConferenciaPedido.FIM              := self.FQuery.FieldByName('FIM'  ).AsDateTime;

   result := ConferenciaPedido;
end;                                                                                               

function TRepositorioConferenciaPedido.GetIdentificador(Objeto: TObject): Variant;       
begin                                                                                              
  result := TConferenciaPedido(Objeto).Codigo;                                                 
end;                                                                                               

function TRepositorioConferenciaPedido.GetNomeDaTabela: String;                          
begin                                                                                              
result := 'CONFERENCIA_PEDIDO';                                                                          
end;                                                                                               

function TRepositorioConferenciaPedido.GetRepositorio: TRepositorio;                     
begin                                                                                              
result := TRepositorioConferenciaPedido.Create;                                          
end;                                                                                               

function TRepositorioConferenciaPedido.IsInsercao(Objeto: TObject): Boolean;             
begin                                                                                              
  result := (TConferenciaPedido(Objeto).Codigo <= 0);                                         
end;                                                                                               

procedure TRepositorioConferenciaPedido.SetCamposAlterados(Auditoria: TAuditoria;        
  AntigoObjeto, Objeto: TObject);                                                                  
var                                                                                                
  ConferenciaPedidoAntigo :TConferenciaPedido;                                           
  ConferenciaPedidoNovo   :TConferenciaPedido;                                           
begin                                                                                              
   ConferenciaPedidoAntigo := (AntigoObjeto as TConferenciaPedido);                      
   ConferenciaPedidoNovo   := (Objeto       as TConferenciaPedido);                      

   if (ConferenciaPedidoAntigo.CODIGO_PEDIDO <> ConferenciaPedidoNovo.CODIGO_PEDIDO) then
   Auditoria.AdicionaCampoAlterado('CODIGO_PEDIDO', intToStr(ConferenciaPedidoAntigo.CODIGO_PEDIDO), intToStr(ConferenciaPedidoNovo.CODIGO_PEDIDO));

   if (ConferenciaPedidoAntigo.CODIGO_USUARIO <> ConferenciaPedidoNovo.CODIGO_USUARIO) then
   Auditoria.AdicionaCampoAlterado('CODIGO_USUARIO', intToStr(ConferenciaPedidoAntigo.CODIGO_USUARIO), intToStr(ConferenciaPedidoNovo.CODIGO_USUARIO));

   if (ConferenciaPedidoAntigo.tempo_decorrido <> ConferenciaPedidoNovo.tempo_decorrido) then
   Auditoria.AdicionaCampoAlterado('tempo_decorrido', FloatToStr(ConferenciaPedidoAntigo.tempo_decorrido), FloatToStr(ConferenciaPedidoNovo.tempo_decorrido));

   if (ConferenciaPedidoAntigo.INICIO <> ConferenciaPedidoNovo.INICIO) then
   Auditoria.AdicionaCampoAlterado('INICIO', DateToStr(ConferenciaPedidoAntigo.INICIO), DateToStr(ConferenciaPedidoNovo.INICIO) );

   if (ConferenciaPedidoAntigo.FIM <> ConferenciaPedidoNovo.FIM) then
   Auditoria.AdicionaCampoAlterado('FIM', DateToStr(ConferenciaPedidoAntigo.FIM), DateToStr(ConferenciaPedidoNovo.FIM) );
end;                                                                                               

procedure TRepositorioConferenciaPedido.SetCamposExcluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  ConferenciaPedido :TConferenciaPedido;                                                 
begin                                                                                              
   ConferenciaPedido := (Objeto as TConferenciaPedido);                                  

   Auditoria.AdicionaCampoExcluido('CODIGO' , intToStr(ConferenciaPedido.CODIGO));
   Auditoria.AdicionaCampoExcluido('CODIGO_PEDIDO' , intToStr(ConferenciaPedido.CODIGO_PEDIDO));
   Auditoria.AdicionaCampoExcluido('CODIGO_USUARIO' , intToStr(ConferenciaPedido.CODIGO_USUARIO));
   Auditoria.AdicionaCampoExcluido('TEMPO_DECORRIDO' , FloatToStr(ConferenciaPedido.tempo_decorrido));
   Auditoria.AdicionaCampoExcluido('INICIO' , DateToStr(ConferenciaPedido.INICIO));
   Auditoria.AdicionaCampoExcluido('FIM' , DateToStr(ConferenciaPedido.FIM));

end;                                                                                               

procedure TRepositorioConferenciaPedido.SetCamposIncluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  ConferenciaPedido :TConferenciaPedido;                                                 
begin                                                                                              
   ConferenciaPedido := (Objeto as TConferenciaPedido);                                  

   Auditoria.AdicionaCampoIncluido('CODIGO' , intToStr(ConferenciaPedido.CODIGO));
   Auditoria.AdicionaCampoIncluido('CODIGO_PEDIDO' , intToStr(ConferenciaPedido.CODIGO_PEDIDO));
   Auditoria.AdicionaCampoIncluido('CODIGO_USUARIO' , intToStr(ConferenciaPedido.CODIGO_USUARIO));
   Auditoria.AdicionaCampoIncluido('TEMPO_DECORRIDO' , FloatToStr(ConferenciaPedido.tempo_decorrido));
   Auditoria.AdicionaCampoIncluido('INICIO' , DateToStr(ConferenciaPedido.INICIO));
   Auditoria.AdicionaCampoIncluido('FIM' , DateToStr(ConferenciaPedido.FIM));

end;                                                                                               

procedure TRepositorioConferenciaPedido.SetIdentificador(Objeto: TObject;                
  Identificador: Variant);                                                                         
begin                                                                                              
  TConferenciaPedido(Objeto).Codigo := Integer(Identificador);                                
end;                                                                                               

procedure TRepositorioConferenciaPedido.SetParametros(Objeto: TObject);                  
var                                                                                                
  ConferenciaPedido :TConferenciaPedido;                                                 
begin                                                                                              
   ConferenciaPedido := (Objeto as TConferenciaPedido);                                  
  if (ConferenciaPedido.Codigo > 0) then  inherited SetParametro('codigo', ConferenciaPedido.Codigo) 
  else                         inherited LimpaParametro('codigo');                     

   self.FQuery.ParamByName('CODIGO').AsInteger          := ConferenciaPedido.CODIGO;
   self.FQuery.ParamByName('CODIGO_PEDIDO').AsInteger   := ConferenciaPedido.CODIGO_PEDIDO;
   self.FQuery.ParamByName('CODIGO_USUARIO').AsInteger  := ConferenciaPedido.CODIGO_USUARIO;
   self.FQuery.ParamByName('TEMPO_DECORRIDO').AsFloat   := ConferenciaPedido.tempo_decorrido;
   self.FQuery.ParamByName('INICIO').AsDateTime         := ConferenciaPedido.INICIO;
   self.FQuery.ParamByName('FIM').AsDateTime            := ConferenciaPedido.FIM;

end;                                                                                               

function TRepositorioConferenciaPedido.SQLGet: String;                                   
begin                                                                                              
  result := 'select * from CONFERENCIA_PEDIDO where codigo = :ncod';                                     
end;                                                                                               

function TRepositorioConferenciaPedido.SQLGetAll: String;                                
begin                                                                                              
  result := 'select * from CONFERENCIA_PEDIDO';                                                          
end;                                                                                               

function TRepositorioConferenciaPedido.SQLGetExiste(arrayDeCampos :array of string): String;
begin                                                                                              
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;                                                                                               

function TRepositorioConferenciaPedido.SQLRemover: String;                               
begin                                                                                              
   result := ' delete from CONFERENCIA_PEDIDO where codigo = :codigo ';                                  
end;                                                                                               

function TRepositorioConferenciaPedido.SQLSalvar: String;                                
begin                                                                                              
  result := 'update or insert into CONFERENCIA_PEDIDO                                             '+
            ' ( CODIGO, CODIGO_PEDIDO, CODIGO_USUARIO, TEMPO_DECORRIDO, INICIO, FIM)              '+
            ' Values ( :CODIGO, :CODIGO_PEDIDO, :CODIGO_USUARIO, :TEMPO_DECORRIDO, :INICIO, :FIM) '
end;

end.
