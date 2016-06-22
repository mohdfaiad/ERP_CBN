unit RepositorioEndereco;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioEndereco = class(TRepositorio)

  protected
    function Get             (Dataset :TDataSet) :TObject; overload; override;
    function GetNomeDaTabela                     :String;            override;
    function GetIdentificador(Objeto :TObject)   :Variant;           override;
    function GetRepositorio                     :TRepositorio;       override;

  protected
    function SQLGet                      :String;            override;
    function SQLSalvar                   :String;            override;
    function CondicaoSQLGetAll           :String;            override;    
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
  Endereco, StrUtils;

{ TRepositorioEndereco }

function TRepositorioEndereco.CondicaoSQLGetAll: String;
begin
  result := ' WHERE CODPESSOA = '+FIdentificador;
end;

function TRepositorioEndereco.Get(Dataset: TDataSet): TObject;
var
  Endereco :TEndereco;
begin
   Endereco             := TEndereco.Create;
   Endereco.Codigo      := self.FQuery.FieldByName('codigo'     ).AsInteger;
   Endereco.codpessoa   := self.FQuery.FieldByName('codpessoa'  ).AsInteger;
   Endereco.Logradouro  := self.FQuery.FieldByName('logradouro' ).AsString;
   Endereco.Numero      := self.FQuery.FieldByName('Numero'     ).AsString;
   Endereco.Bairro      := self.FQuery.FieldByName('Bairro'     ).AsString;
   Endereco.CodCidade   := self.FQuery.FieldByName('CodCidade'  ).AsInteger;
   Endereco.CEP         := self.FQuery.FieldByName('CEP'        ).AsString;
   Endereco.Pais        := self.FQuery.FieldByName('Pais'       ).AsString;
   Endereco.Complemento := self.FQuery.FieldByName('Complemento').AsString;

   result := Endereco;
end;

function TRepositorioEndereco.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TEndereco(Objeto).Codigo;
end;

function TRepositorioEndereco.GetNomeDaTabela: String;
begin
  result := 'ENDERECOS';
end;

function TRepositorioEndereco.GetRepositorio: TRepositorio;
begin
  result := TRepositorioEndereco.Create;
end;

function TRepositorioEndereco.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TEndereco(Objeto).Codigo <= 0);
end;

procedure TRepositorioEndereco.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  EnderecoAntigo :TEndereco;
  EnderecoNovo   :TEndereco;
begin
   EnderecoAntigo := (AntigoObjeto as TEndereco);
   EnderecoNovo   := (Objeto       as TEndereco);

   if (EnderecoAntigo.codpessoa <> EnderecoNovo.codpessoa) then
    Auditoria.AdicionaCampoAlterado('codpessoa', intToStr(EnderecoAntigo.codpessoa), intToStr(EnderecoNovo.codpessoa));

   if (EnderecoAntigo.Logradouro <> EnderecoNovo.logradouro) then                                                
    Auditoria.AdicionaCampoAlterado('logradouro', EnderecoAntigo.logradouro, EnderecoNovo.logradouro);           

   if (EnderecoAntigo.Numero <> EnderecoNovo.Numero) then
    Auditoria.AdicionaCampoAlterado('numero', EnderecoAntigo.Numero, EnderecoNovo.Numero);   

   if (EnderecoAntigo.Bairro <> EnderecoNovo.Bairro) then
    Auditoria.AdicionaCampoAlterado('Bairro', EnderecoAntigo.Bairro, EnderecoNovo.Bairro);
                                                                                           
   if (EnderecoAntigo.CodCidade <> EnderecoNovo.CodCidade) then
    Auditoria.AdicionaCampoAlterado('CodCidade', intToStr(EnderecoAntigo.CodCidade), intToStr(EnderecoNovo.CodCidade));

   if (EnderecoAntigo.CEP <> EnderecoNovo.CEP) then
    Auditoria.AdicionaCampoAlterado('CEP', EnderecoAntigo.CEP, EnderecoNovo.CEP);

   if (EnderecoAntigo.Pais <> EnderecoNovo.Pais) then
    Auditoria.AdicionaCampoAlterado('Pais', EnderecoAntigo.Pais, EnderecoNovo.Pais);

   if (EnderecoAntigo.Complemento <> EnderecoNovo.Complemento) then
    Auditoria.AdicionaCampoAlterado('Complemento', EnderecoAntigo.Complemento, EnderecoNovo.Complemento);

end;

procedure TRepositorioEndereco.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Endereco :TEndereco;
begin
   Endereco := (Objeto as TEndereco);

   Auditoria.AdicionaCampoExcluido('codigo'     , intToStr(Endereco.Codigo ));
   Auditoria.AdicionaCampoExcluido('codpessoa'  , intToStr(Endereco.codpessoa));
   Auditoria.AdicionaCampoExcluido('logradouro' , Endereco.Logradouro );
   Auditoria.AdicionaCampoExcluido('Numero'     , Endereco.Numero     );
   Auditoria.AdicionaCampoExcluido('Bairro'     , Endereco.Bairro     );
   Auditoria.AdicionaCampoExcluido('CodCidade'  , intToStr(Endereco.CodCidade ));
   Auditoria.AdicionaCampoExcluido('CEP'        , Endereco.CEP        );
   Auditoria.AdicionaCampoExcluido('Pais'       , Endereco.Pais       );
   Auditoria.AdicionaCampoExcluido('Complemento', Endereco.Complemento);

end;

procedure TRepositorioEndereco.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Endereco :TEndereco;
begin
   Endereco := (Objeto as TEndereco);

   Auditoria.AdicionaCampoIncluido('codigo'     , intToStr(Endereco.Codigo ));
   Auditoria.AdicionaCampoIncluido('codpessoa'  , intToStr(Endereco.codpessoa));
   Auditoria.AdicionaCampoIncluido('logradouro' , Endereco.Logradouro );
   Auditoria.AdicionaCampoIncluido('Numero'     , Endereco.Numero );
   Auditoria.AdicionaCampoIncluido('Bairro'     , Endereco.Bairro     );
   Auditoria.AdicionaCampoIncluido('CodCidade'  , intToStr(Endereco.CodCidade ));
   Auditoria.AdicionaCampoIncluido('CEP'        , Endereco.CEP        );
   Auditoria.AdicionaCampoIncluido('Pais'       , Endereco.Pais       );
   Auditoria.AdicionaCampoIncluido('Complemento', Endereco.Complemento);

end;

procedure TRepositorioEndereco.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TEndereco(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioEndereco.SetParametros(Objeto: TObject);
var
  Endereco :TEndereco;
begin
   Endereco := (Objeto as TEndereco);

   self.FQuery.ParamByName('codigo'     ).AsInteger := Endereco.Codigo;
   self.FQuery.ParamByName('codpessoa'  ).AsInteger := Endereco.codpessoa;
   self.FQuery.ParamByName('logradouro' ).AsString  := Endereco.Logradouro;
   self.FQuery.ParamByName('Numero'     ).AsString  := Endereco.Numero;
   self.FQuery.ParamByName('Bairro'     ).AsString  := Endereco.Bairro;
   self.FQuery.ParamByName('CodCidade'  ).AsInteger := Endereco.CodCidade;
   self.FQuery.ParamByName('CEP'        ).AsString  := Endereco.CEP;
   self.FQuery.ParamByName('Pais'       ).AsString  := Endereco.Pais;
   self.FQuery.ParamByName('Complemento').AsString  := Endereco.Complemento;
   
end;

function TRepositorioEndereco.SQLGet: String;
begin
  result := 'select * from Enderecos where codigo = :ncod';
end;

function TRepositorioEndereco.SQLGetAll: String;
begin
  result := 'select * from Enderecos '+ IfThen(FIdentificador = '','', CondicaoSQLGetAll);
end;
                                                                                    
function TRepositorioEndereco.SQLGetExiste(campo: String): String;                         
begin                                                                                      
  result := 'select '+ campo +' from Enderecos where '+ campo +' = :ncampo';               
end;                                                                                       
                                                                                           
function TRepositorioEndereco.SQLRemover: String;                                          
begin                                                                                      
   result := ' delete from Enderecos where codigo = :codigo ';
end;

function TRepositorioEndereco.SQLSalvar: String;
begin
  result := 'update or insert into Enderecos                                                                     '+
            '(codigo, codpessoa, logradouro, Numero, Bairro, CodCidade, CEP, Pais, Complemento)                  '+
            ' Values (:codigo, :codpessoa, :logradouro, :Numero, :Bairro, :CodCidade, :CEP, :Pais, :Complemento) ';
end;
              
end.          









