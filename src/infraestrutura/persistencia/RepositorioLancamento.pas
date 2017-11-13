unit RepositorioLancamento;

interface

uses DB,
     Auditoria,
     Repositorio;                                       
type
  TRepositorioLancamento = class(TRepositorio)
                        
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
  Lancamento,
  TipoLancamento;                                                                        

{ TRepositorioLancamento }                                                      

function TRepositorioLancamento.Get(Dataset: TDataSet): TObject;                  
var                                                                                                
  Lancamento :TLancamento;                                                 
begin                                                                                              
   Lancamento  := TLancamento.Create;                                      
   Lancamento.CODIGO          := self.FQuery.FieldByName('CODIGO'  ).AsInteger;
   Lancamento.VALOR_TOTAL     := self.FQuery.FieldByName('VALOR_TOTAL'  ).AsFloat;
   Lancamento.VALOR_PAGO      := self.FQuery.FieldByName('VALOR_PAGO'  ).AsFloat;
   Lancamento.DATA_VENCIMENTO := self.FQuery.FieldByName('DATA_VENCIMENTO'  ).AsDateTime;
   Lancamento.DATA_CADASTRO   := self.FQuery.FieldByName('DATA_CADASTRO'  ).AsDateTime;
   Lancamento.DESCRICAO       := self.FQuery.FieldByName('DESCRICAO'  ).AsString;
   Lancamento.tipo            := TTipoLancamentoUtilitario.DeStringParaEnumerado(Dataset.FieldByName('tipo').AsString);
   Lancamento.observacao      := self.FQuery.FieldByName('OBSERVACAO'  ).AsString;

   result := Lancamento;
end;                                                                                               

function TRepositorioLancamento.GetIdentificador(Objeto: TObject): Variant;       
begin                                                                                              
  result := TLancamento(Objeto).Codigo;                                                 
end;                                                                                               

function TRepositorioLancamento.GetNomeDaTabela: String;                          
begin                                                                                              
result := 'LANCAMENTOS';                                                                          
end;                                                                                               

function TRepositorioLancamento.GetRepositorio: TRepositorio;                     
begin                                                                                              
result := TRepositorioLancamento.Create;                                          
end;                                                                                               

function TRepositorioLancamento.IsInsercao(Objeto: TObject): Boolean;             
begin                                                                                              
  result := (TLancamento(Objeto).Codigo <= 0);                                         
end;                                                                                               

procedure TRepositorioLancamento.SetCamposAlterados(Auditoria: TAuditoria;        
  AntigoObjeto, Objeto: TObject);                                                                  
var                                                                                                
  LancamentoAntigo :TLancamento;                                           
  LancamentoNovo   :TLancamento;                                           
begin                                                                                              
   LancamentoAntigo := (AntigoObjeto as TLancamento);                      
   LancamentoNovo   := (Objeto       as TLancamento);                      

   if (LancamentoAntigo.VALOR_TOTAL <> LancamentoNovo.VALOR_TOTAL) then
   Auditoria.AdicionaCampoAlterado('VALOR_TOTAL', FloatToStr(LancamentoAntigo.VALOR_TOTAL), FloatToStr(LancamentoNovo.VALOR_TOTAL));

   if (LancamentoAntigo.VALOR_PAGO <> LancamentoNovo.VALOR_PAGO) then
   Auditoria.AdicionaCampoAlterado('VALOR_PAGO', FloatToStr(LancamentoAntigo.VALOR_PAGO), FloatToStr(LancamentoNovo.VALOR_PAGO));

   if (LancamentoAntigo.DATA_VENCIMENTO <> LancamentoNovo.DATA_VENCIMENTO) then
   Auditoria.AdicionaCampoAlterado('DATA_VENCIMENTO', DateToStr(LancamentoAntigo.DATA_VENCIMENTO), DateToStr(LancamentoNovo.DATA_VENCIMENTO));

   if (LancamentoAntigo.DATA_CADASTRO <> LancamentoNovo.DATA_CADASTRO) then
   Auditoria.AdicionaCampoAlterado('DATA_CADASTRO', DateToStr(LancamentoAntigo.DATA_CADASTRO), DateToStr(LancamentoNovo.DATA_CADASTRO));

   if (LancamentoAntigo.DESCRICAO <> LancamentoNovo.DESCRICAO) then
   Auditoria.AdicionaCampoAlterado('DESCRICAO', LancamentoAntigo.DESCRICAO, LancamentoNovo.DESCRICAO);

   if (LancamentoAntigo.tipo <> LancamentoNovo.tipo) then
   Auditoria.AdicionaCampoAlterado('tipo', TTipoLancamentoUtilitario.DeEnumeradoParaString(LancamentoAntigo.tipo), TTipoLancamentoUtilitario.DeEnumeradoParaString(LancamentoNovo.tipo));

   if (LancamentoAntigo.observacao <> LancamentoNovo.observacao) then
   Auditoria.AdicionaCampoAlterado('OBSERVACAO', LancamentoAntigo.observacao, LancamentoNovo.observacao);

end;                                                                                               

procedure TRepositorioLancamento.SetCamposExcluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  Lancamento :TLancamento;                                                 
begin                                                                                              
   Lancamento := (Objeto as TLancamento);

   Auditoria.AdicionaCampoExcluido('CODIGO' , FloatToStr(Lancamento.CODIGO));
   Auditoria.AdicionaCampoExcluido('VALOR_TOTAL' , FloatToStr(Lancamento.VALOR_TOTAL));
   Auditoria.AdicionaCampoExcluido('VALOR_PAGO' , FloatToStr(Lancamento.VALOR_PAGO));
   Auditoria.AdicionaCampoExcluido('DATA_VENCIMENTO' , DateToStr(Lancamento.DATA_VENCIMENTO));
   Auditoria.AdicionaCampoExcluido('DATA_CADASTRO' , DateToStr(Lancamento.DATA_CADASTRO));
   Auditoria.AdicionaCampoExcluido('DESCRICAO' , Lancamento.DESCRICAO);
   Auditoria.AdicionaCampoExcluido('tipo' , TTipoLancamentoUtilitario.DeEnumeradoParaString(Lancamento.tipo));
   Auditoria.AdicionaCampoExcluido('OBSERVACAO' , Lancamento.observacao);
end;                                                                                               

procedure TRepositorioLancamento.SetCamposIncluidos(Auditoria: TAuditoria;        
  Objeto: TObject);                                                                                
var                                                                                                
  Lancamento :TLancamento;                                                 
begin                                                                                              
   Lancamento := (Objeto as TLancamento);                                  

   Auditoria.AdicionaCampoIncluido('CODIGO' , FloatToStr(Lancamento.CODIGO));
   Auditoria.AdicionaCampoIncluido('VALOR_TOTAL' , FloatToStr(Lancamento.VALOR_TOTAL));
   Auditoria.AdicionaCampoIncluido('VALOR_PAGO' , FloatToStr(Lancamento.VALOR_PAGO));
   Auditoria.AdicionaCampoIncluido('DATA_VENCIMENTO' , DateToStr(Lancamento.DATA_VENCIMENTO));
   Auditoria.AdicionaCampoIncluido('DATA_CADASTRO' , DateToStr(Lancamento.DATA_CADASTRO));
   Auditoria.AdicionaCampoIncluido('DESCRICAO' , Lancamento.DESCRICAO);
   Auditoria.AdicionaCampoIncluido('tipo' , TTipoLancamentoUtilitario.DeEnumeradoParaString(Lancamento.tipo));   
   Auditoria.AdicionaCampoIncluido('OBSERVACAO' , Lancamento.observacao);
end;                                                                                               

procedure TRepositorioLancamento.SetIdentificador(Objeto: TObject;                
  Identificador: Variant);                                                                         
begin                                                                                              
  TLancamento(Objeto).Codigo := Integer(Identificador);                                
end;                                                                                               

procedure TRepositorioLancamento.SetParametros(Objeto: TObject);                  
var                                                                                                
  Lancamento :TLancamento;                                                 
begin                                                                                              
   Lancamento := (Objeto as TLancamento);                                  
  if (Lancamento.Codigo > 0) then  inherited SetParametro('codigo', Lancamento.Codigo) 
  else                         inherited LimpaParametro('codigo');                     

   self.FQuery.ParamByName('CODIGO').AsFloat           := Lancamento.CODIGO;
   self.FQuery.ParamByName('VALOR_TOTAL').AsFloat        := Lancamento.VALOR_TOTAL;
   self.FQuery.ParamByName('VALOR_PAGO').AsFloat         := Lancamento.VALOR_PAGO;
   self.FQuery.ParamByName('DATA_VENCIMENTO').AsDateTime := Lancamento.DATA_VENCIMENTO;
   self.FQuery.ParamByName('DATA_CADASTRO').AsDateTime   := Lancamento.DATA_CADASTRO;
   self.FQuery.ParamByName('DESCRICAO').AsString        := Lancamento.DESCRICAO;

   inherited SetParametro('tipo', TTipoLancamentoUtilitario.DeEnumeradoParaString(Lancamento.tipo));
   self.FQuery.ParamByName('OBSERVACAO').AsString        := Lancamento.observacao;

end;                                                                                               

function TRepositorioLancamento.SQLGet: String;                                   
begin                                                                                              
  result := 'select * from LANCAMENTOS where codigo = :ncod';                                     
end;                                                                                               

function TRepositorioLancamento.SQLGetAll: String;                                
begin                                                                                              
  result := 'select * from LANCAMENTOS';                                                          
end;                                                                                               

function TRepositorioLancamento.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;                                                                                               

function TRepositorioLancamento.SQLRemover: String;                               
begin                                                                                              
   result := ' delete from LANCAMENTOS where codigo = :codigo ';                                  
end;                                                                                               

function TRepositorioLancamento.SQLSalvar: String;                                
begin                                                                                              
  result := 'update or insert into LANCAMENTOS                                                                               '+
            ' ( CODIGO, VALOR_TOTAL, VALOR_PAGO, DATA_VENCIMENTO, DATA_CADASTRO, DESCRICAO, tipo, OBSERVACAO)                '+
            ' Values ( :CODIGO, :VALOR_TOTAL, :VALOR_PAGO, :DATA_VENCIMENTO, :DATA_CADASTRO, :DESCRICAO, :tipo, :OBSERVACAO) ';
end;                                                                                               

end.                                                                                               
