unit RepositorioCliente;

interface

uses
  DB,
  Auditoria,
  Repositorio;                                                                               

type
  TRepositorioCliente = class(TRepositorio)

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
  Cliente, Math, StrUtils;

{ TRepositorioCliente }

function TRepositorioCliente.CondicaoSQLGetAll: String;
begin
  result := ' WHERE CODCLI = '+FIdentificador;
end;

function TRepositorioCliente.Get(Dataset: TDataSet): TObject;
var
  Cliente :TCliente;
begin
   Cliente                   := TCliente.Create;
   Cliente.Codigo            := self.FQuery.FieldByName('codigo'    ).AsInteger;
   Cliente.CodCli            := self.FQuery.FieldByName('CodCli'    ).AsInteger;
   Cliente.CodTabelaPreco    := self.FQuery.FieldByName('CodTabelaPreco').AsInteger;
   Cliente.CodFormasPgto     := self.FQuery.FieldByName('CodFormasPgto').AsInteger;
   Cliente.CodTransportadora := self.FQuery.FieldByNAme('CodTransportadora').AsInteger;
   Cliente.Funcionario       := (self.FQuery.FieldByNAme('funcionario').AsString = 'S');

   result := Cliente;
end;

function TRepositorioCliente.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TCliente(Objeto).Codigo;
end;

function TRepositorioCliente.GetNomeDaTabela: String;
begin
  result := 'CLIENTES';
end;

function TRepositorioCliente.GetRepositorio: TRepositorio;
begin
  result := TRepositorioCliente.Create;
end;

function TRepositorioCliente.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TCliente(Objeto).Codigo <= 0);
end;

procedure TRepositorioCliente.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  ClienteAntigo :TCliente;
  ClienteNovo   :TCliente;
begin
   ClienteAntigo := (AntigoObjeto as TCliente);
   ClienteNovo   := (Objeto       as TCliente);

   if (ClienteAntigo.CodCli <> ClienteNovo.CodCli) then
    Auditoria.AdicionaCampoAlterado('CodCli', intToStr(ClienteAntigo.CodCli), intToStr(ClienteNovo.CodCli));
   if (ClienteAntigo.CodTabelaPreco <> ClienteNovo.CodTabelaPreco) then
    Auditoria.AdicionaCampoAlterado('CodTabelaPreco', intToStr(ClienteAntigo.CodTabelaPreco), intToStr(ClienteNovo.CodTabelaPreco));
   if (ClienteAntigo.CodFormasPgto <> ClienteNovo.CodFormasPgto) then
    Auditoria.AdicionaCampoAlterado('CodFormasPgto', intToStr(ClienteAntigo.CodFormasPgto), intToStr(ClienteNovo.CodFormasPgto));
   if (ClienteAntigo.CodTransportadora <> ClienteNovo.CodTransportadora) then
    Auditoria.AdicionaCampoAlterado('CodTransportadora', intToStr(ClienteAntigo.CodTransportadora), intToStr(ClienteNovo.CodTransportadora));
end;

procedure TRepositorioCliente.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Cliente :TCliente;
begin
   Cliente := (Objeto as TCliente);

   Auditoria.AdicionaCampoExcluido('codigo'           , intToStr(Cliente.Codigo));
   Auditoria.AdicionaCampoExcluido('codCli'           , intToStr(Cliente.CodCli));
   Auditoria.AdicionaCampoExcluido('codTabelaPreco'   , intToStr(Cliente.CodTabelaPreco));
   Auditoria.AdicionaCampoExcluido('CodFormasPgto'    , intToStr(Cliente.CodFormasPgto));
   Auditoria.AdicionaCampoExcluido('CodTransportadora', intToStr(Cliente.CodTransportadora));
end;

procedure TRepositorioCliente.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Cliente :TCliente;
begin
   Cliente := (Objeto as TCliente);

   Auditoria.AdicionaCampoIncluido('codigo'           , intToStr(Cliente.Codigo));
   Auditoria.AdicionaCampoIncluido('codCli'           , intToStr(Cliente.CodCli));
   Auditoria.AdicionaCampoIncluido('codTabelaPreco'   , intToStr(Cliente.CodTabelaPreco));
   Auditoria.AdicionaCampoIncluido('CodFormasPgto'    , intToStr(Cliente.CodFormasPgto));
   Auditoria.AdicionaCampoIncluido('CodTransportadora', intToStr(Cliente.CodTransportadora));
end;

procedure TRepositorioCliente.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TCliente(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioCliente.SetParametros(Objeto: TObject);
var
  Cliente :TCliente;
begin
   Cliente := (Objeto as TCliente);

   if (Cliente.Codigo > 0) then  inherited SetParametro('codigo', Cliente.Codigo)
   else                         inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('codcli').AsInteger         := Cliente.CodCli;
   if Cliente.CodTabelaPreco > 0 then
     self.FQuery.ParamByName('codTabelaPreco').AsInteger := Cliente.CodTabelaPreco;
   if Cliente.CodFormasPgto > 0 then
     self.FQuery.ParamByName('CodFormasPgto').AsInteger  := Cliente.CodFormasPgto;
   if Cliente.CodTransportadora > 0 then
     self.FQuery.ParamByName('CodTransportadora').AsInteger  := Cliente.CodTransportadora;

   self.FQuery.ParamByName('funcionario').AsString         := IfThen( Cliente.funcionario, 'S', 'N');
end;

function TRepositorioCliente.SQLGet: String;
begin
  result := 'select * from CLIENTES where codigo = :ncod';
end;

function TRepositorioCliente.SQLGetAll: String;
begin
  result := 'select * from CLIENTES '+ IfThen(FIdentificador = '','', CondicaoSQLGetAll);
end;

function TRepositorioCliente.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from CLIENTES where '+ campo +' = :ncampo';
end;

function TRepositorioCliente.SQLRemover: String;
begin
   result := ' delete from CLIENTES where codigo = :codigo ';
end;

function TRepositorioCliente.SQLSalvar: String;
begin
  result := 'update or insert into CLIENTES                                                                '+
            '(codigo, codcli, codtabelapreco, codformaspgto, CodTransportadora, funcionario)               '+
            ' Values (:codigo, :codcli, :codtabelapreco, :codformaspgto, :CodTransportadora, :funcionario) ';
end;

end.
              
              
              
              
              
              
              

