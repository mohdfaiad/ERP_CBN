unit RepositorioClienteRepresentante;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioClienteRepresentante = class(TRepositorio)

  protected
    function Get             (Dataset :TDataSet) :TObject; overload; override;
    function GetNomeDaTabela                     :String;            override;
    function GetIdentificador(Objeto :TObject)   :Variant;           override;
    function GetRepositorio                     :TRepositorio;       override;

  protected
    function SQLGet                      :String;            override;
    function SQLSalvar                   :String;            override;
    function CondicaoSQLGetAll           :String;
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
  Cliente_Representante, StrUtils;

{ TRepositorioClienteRepresentante }

function TRepositorioClienteRepresentante.Get(Dataset: TDataSet): TObject;
var
  ClienteRepresentante :TCliente_Representante;
begin
   ClienteRepresentante                   := TCliente_Representante.Create;
   ClienteRepresentante.Codigo            := self.FQuery.FieldByName('codigo').AsInteger;
   ClienteRepresentante.cod_cliente       := self.FQuery.FieldByName('cod_cliente').AsInteger;
   ClienteRepresentante.cod_representante := self.FQuery.FieldByName('cod_representante').AsInteger;

   result := ClienteRepresentante;
end;

function TRepositorioClienteRepresentante.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TCliente_Representante(Objeto).Codigo;
end;

function TRepositorioClienteRepresentante.GetNomeDaTabela: String;
begin
  result := 'Cliente_Representante';
end;

function TRepositorioClienteRepresentante.GetRepositorio: TRepositorio;
begin
  result := TRepositorioClienteRepresentante.Create;
end;

function TRepositorioClienteRepresentante.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TCliente_Representante(Objeto).Codigo <= 0);
end;

procedure TRepositorioClienteRepresentante.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  ClienteRepresentanteAntigo :TCliente_Representante;
  ClienteRepresentanteNovo   :TCliente_Representante;
begin
   ClienteRepresentanteAntigo := (AntigoObjeto as TCliente_Representante);
   ClienteRepresentanteNovo   := (Objeto       as TCliente_Representante);

   if (ClienteRepresentanteAntigo.cod_cliente <> ClienteRepresentanteNovo.cod_cliente) then
    Auditoria.AdicionaCampoAlterado('cod_cliente', intToStr(ClienteRepresentanteAntigo.cod_cliente), intToStr(ClienteRepresentanteNovo.cod_cliente));

   if (ClienteRepresentanteAntigo.cod_representante <> ClienteRepresentanteNovo.cod_representante) then
    Auditoria.AdicionaCampoAlterado('cod_representante', intToStr(ClienteRepresentanteAntigo.cod_representante), intToStr(ClienteRepresentanteNovo.cod_representante));

end;

procedure TRepositorioClienteRepresentante.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  ClienteRepresentante :TCliente_Representante;
begin
   ClienteRepresentante := (Objeto as TCliente_Representante);

   Auditoria.AdicionaCampoExcluido('codigo'     ,        intToStr(ClienteRepresentante.Codigo ));
   Auditoria.AdicionaCampoExcluido('cod_cliente'  ,      intToStr(ClienteRepresentante.cod_cliente));
   Auditoria.AdicionaCampoExcluido('cod_representante' , intToStr(ClienteRepresentante.cod_representante));

end;

procedure TRepositorioClienteRepresentante.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  ClienteRepresentante :TCliente_Representante;
begin
   ClienteRepresentante := (Objeto as TCliente_Representante);

   Auditoria.AdicionaCampoIncluido('codigo'     ,        intToStr(ClienteRepresentante.Codigo ));
   Auditoria.AdicionaCampoIncluido('cod_cliente'  ,      intToStr(ClienteRepresentante.cod_cliente));
   Auditoria.AdicionaCampoIncluido('cod_representante' , intToStr(ClienteRepresentante.cod_representante));

end;

procedure TRepositorioClienteRepresentante.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TCliente_Representante(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioClienteRepresentante.SetParametros(Objeto: TObject);
var
  ClienteRepresentante :TCliente_Representante;
begin
   ClienteRepresentante := (Objeto as TCliente_Representante);

   self.FQuery.ParamByName('codigo'     ).AsInteger        := ClienteRepresentante.Codigo;

   if ClienteRepresentante.cod_cliente > 0 then
     self.FQuery.ParamByName('cod_cliente'  ).AsInteger      := ClienteRepresentante.cod_cliente;
   if ClienteRepresentante.cod_representante > 0 then
     self.FQuery.ParamByName('cod_representante' ).AsInteger := ClienteRepresentante.cod_representante;
end;

function TRepositorioClienteRepresentante.SQLGet: String;
begin
  result := 'select * from Cliente_Representante where codigo = :ncod';
end;

function TRepositorioClienteRepresentante.SQLGetAll: String;
begin
  result := 'select * from Cliente_Representante '+ IfThen(FIdentificador = '','', CondicaoSQLGetAll);
end;
                                                                                    
function TRepositorioClienteRepresentante.SQLGetExiste(arrayDeCampos :array of string): String;
begin                                                                                      
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), self.GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;                                                                                       
                                                                                           
function TRepositorioClienteRepresentante.SQLRemover: String;                                          
begin                                                                                      
   result := ' delete from Cliente_Representante where codigo = :codigo ';
end;

function TRepositorioClienteRepresentante.CondicaoSQLGetAll: String;
begin
  result := ' WHERE COD_CLIENTE = '+FIdentificador;
end;

function TRepositorioClienteRepresentante.SQLSalvar: String;
begin
  result := 'update or insert into Cliente_Representante          '+
            '(codigo, cod_cliente, cod_representante)             '+
            ' Values (:codigo, :cod_cliente, :cod_representante)  ';
end;
              
end.          









