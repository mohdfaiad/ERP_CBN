unit RepositorioCliente;

interface

uses
  DB,
  Auditoria,
  Repositorio,
  RepositorioPessoa;

type
  TRepositorioCliente = class(TRepositorioPessoa)

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
    procedure SetCamposIncluidos(Auditoria: TAuditoria;               Objeto: TObject); override;
    procedure SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;

  public
    function Salvar (Objeto              :TObject) :Boolean; override;
    function Remover(Objeto              :TObject) :Boolean; override;
end;

implementation

uses
  SysUtils,
  Cliente, Math, StrUtils, Pessoa, fabricaRepositorio;

{ TRepositorioCliente }

function TRepositorioCliente.CondicaoSQLGetAll: String;
begin
  result := ' WHERE CLI.CODCLI = '+FIdentificador;
end;

function TRepositorioCliente.Get(Dataset: TDataSet): TObject;
var
  Cliente          :TCliente;
begin
   result := nil;

   Cliente                := TCliente.Create;
   Cliente.Codigo         := Dataset.FieldByName('CODIGO').AsInteger;
   Cliente.Razao          := Dataset.FieldByName('razao').AsString;
   Cliente.Pessoa         := Dataset.FieldByName('pessoa').AsString;
   Cliente.Tipo           := Dataset.FieldByName('tipo').AsString;
   Cliente.CPF_CNPJ       := Dataset.FieldByName('cpf_cnpj').AsString;
   Cliente.RG_IE          := Dataset.FieldByName('rg_ie').AsString;
   Cliente.DtCadastro     := Dataset.FieldByName('dtcadastro').AsDateTime;
   Cliente.Fone1          := Dataset.FieldByName('fone1').AsString;
   Cliente.Fone2          := Dataset.FieldByName('fone2').AsString;
   Cliente.Fax            := Dataset.FieldByName('fax').AsString;
   Cliente.Email          := Dataset.FieldByName('email').AsString;
   Cliente.Observacao     := Dataset.FieldByName('observacao').AsString;
   Cliente.CodigoCliente  := Dataset.FieldByName('CODIGO_CLIENTE').AsInteger;
   Cliente.CodTabelaPreco := Dataset.FieldByName('codtabelapreco').AsInteger;
   Cliente.CodFormasPgto  := Dataset.FieldByName('codformaspgto').AsInteger;
   Cliente.CodTransportadora := Dataset.FieldByName('codtransportadora').AsInteger;
   Cliente.CodRepresentante  := Dataset.FieldByName('CodRepresentante').AsInteger;
   Cliente.Funcionario    := Dataset.FieldByName('funcionario').AsString = 'S';
   Cliente.bloqueado      := Dataset.FieldByName('bloqueado').AsString;
   Cliente.motivoBloqueio := Dataset.FieldByName('motivo_bloqueio').AsString;
   Cliente.ECommerce      := Dataset.FieldByName('ECommerce').AsString = 'S';

   result := Cliente;
end;

function TRepositorioCliente.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TCliente(Objeto).CodigoCliente;
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
   result := (TCliente(Objeto).CodigoCliente <= 0);
end;

function TRepositorioCliente.Remover(Objeto: TObject): Boolean;
var
  RepositorioPessoa :TRepositorio;
begin
   RepositorioPessoa := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);

   try
     result := inherited Remover(Objeto);
     RepositorioPessoa.Remover(Objeto);
   finally
     FreeAndNil(RepositorioPessoa);
   end;
end;

function TRepositorioCliente.Salvar(Objeto: TObject): Boolean;
var
  RepositorioPessoa :TRepositorio;
begin
   RepositorioPessoa := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);

   try
     RepositorioPessoa.Salvar(Objeto);

     Result := inherited Salvar(Objeto);
   finally
     FreeAndNil(RepositorioPessoa);
   end;
end;

procedure TRepositorioCliente.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  ClienteAntigo :TCliente;
  ClienteNovo   :TCliente;
begin

   ClienteAntigo := (AntigoObjeto as TCliente);
   ClienteNovo   := (Objeto       as TCliente);

   if (ClienteAntigo.CodTabelaPreco <> ClienteNovo.CodTabelaPreco) then
    Auditoria.AdicionaCampoAlterado('CodTabelaPreco', IntToStr(ClienteAntigo.CodTabelaPreco), IntToStr(ClienteNovo.CodTabelaPreco));

   if (ClienteAntigo.CodFormasPgto <> ClienteNovo.CodFormasPgto) then
    Auditoria.AdicionaCampoAlterado('CodFormasPgto', IntToStr(ClienteAntigo.CodFormasPgto), IntToStr(ClienteNovo.CodFormasPgto));

   if (ClienteAntigo.CodFormasPgto <> ClienteNovo.CodFormasPgto) then
    Auditoria.AdicionaCampoAlterado('CodFormasPgto', IntToStr(ClienteAntigo.CodFormasPgto), IntToStr(ClienteNovo.CodFormasPgto));

   if (ClienteAntigo.CodTransportadora <> ClienteNovo.CodTransportadora) then
    Auditoria.AdicionaCampoAlterado('CodTransportadora', IntToStr(ClienteAntigo.CodTransportadora), IntToStr(ClienteNovo.CodTransportadora));

   if (ClienteAntigo.CodRepresentante <> ClienteNovo.CodRepresentante) then
    Auditoria.AdicionaCampoAlterado('CodRepresentante', IntToStr(ClienteAntigo.CodRepresentante), IntToStr(ClienteNovo.CodRepresentante));

   if (ClienteAntigo.Funcionario <> ClienteNovo.Funcionario) then
    Auditoria.AdicionaCampoAlterado('Funcionario', IfThen(ClienteAntigo.Funcionario, 'S', 'N'), IfThen(ClienteNovo.Funcionario, 'S', 'N'));

   if (ClienteAntigo.bloqueado <> ClienteNovo.bloqueado) then
    Auditoria.AdicionaCampoAlterado('bloqueado', ClienteAntigo.bloqueado, ClienteNovo.bloqueado);

   if (ClienteAntigo.motivoBloqueio <> ClienteNovo.motivoBloqueio) then
    Auditoria.AdicionaCampoAlterado('motivo_Bloqueio', ClienteAntigo.motivoBloqueio, ClienteNovo.motivoBloqueio);

   if (ClienteAntigo.ECommerce <> ClienteNovo.ECommerce) then
    Auditoria.AdicionaCampoAlterado('ECommerce', IfThen(ClienteAntigo.ECommerce,'S','N'), IfThen(ClienteNovo.ECommerce,'S','N'));
end;

procedure TRepositorioCliente.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Cliente :TCliente;
begin
   Cliente := (Objeto as TCliente);

   Auditoria.AdicionaCampoExcluido('codigo'           , intToStr(Cliente.Codigo));
   Auditoria.AdicionaCampoExcluido('codCli'           , intToStr(Cliente.Codigo));
   Auditoria.AdicionaCampoExcluido('codTabelaPreco'   , intToStr(Cliente.CodTabelaPreco));
   Auditoria.AdicionaCampoExcluido('CodFormasPgto'    , intToStr(Cliente.CodFormasPgto));
   Auditoria.AdicionaCampoExcluido('CodTransportadora', intToStr(Cliente.CodTransportadora));
   Auditoria.AdicionaCampoExcluido('CodRepresentante' , intToStr(Cliente.CodRepresentante));
   Auditoria.AdicionaCampoExcluido('bloqueado'        , Cliente.bloqueado);
   Auditoria.AdicionaCampoExcluido('motivo_Bloqueio'  , Cliente.motivoBloqueio);
   Auditoria.AdicionaCampoExcluido('ECommerce'        , IfThen(Cliente.ECommerce,'S','N'));
end;

procedure TRepositorioCliente.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Cliente :TCliente;
begin
   Cliente := (Objeto as TCliente);

   Auditoria.AdicionaCampoIncluido('codigo'           , intToStr(Cliente.Codigo));
   Auditoria.AdicionaCampoIncluido('codCli'           , intToStr(Cliente.Codigo));
   Auditoria.AdicionaCampoIncluido('codTabelaPreco'   , intToStr(Cliente.CodTabelaPreco));
   Auditoria.AdicionaCampoIncluido('CodFormasPgto'    , intToStr(Cliente.CodFormasPgto));
   Auditoria.AdicionaCampoIncluido('CodTransportadora', intToStr(Cliente.CodTransportadora));
   Auditoria.AdicionaCampoIncluido('CodRepresentante' , intToStr(Cliente.CodRepresentante));
   Auditoria.AdicionaCampoIncluido('bloqueado'        , Cliente.bloqueado);
   Auditoria.AdicionaCampoIncluido('motivo_Bloqueio'  , Cliente.motivoBloqueio);
   Auditoria.AdicionaCampoIncluido('ECommerce'        , IfThen(Cliente.ECommerce,'S','N'));
end;

procedure TRepositorioCliente.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TCliente(Objeto).CodigoCliente := Integer(Identificador);
end;

procedure TRepositorioCliente.SetParametros(Objeto: TObject);
var
  Cliente :TCliente;
begin
   Cliente := (Objeto as TCliente);

   if (Cliente.CodigoCliente > 0) then  inherited SetParametro('codigo', Cliente.CodigoCliente)
   else                                 inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('codcli').AsInteger         := Cliente.Codigo;
   if Cliente.CodTabelaPreco > 0 then
     self.FQuery.ParamByName('codTabelaPreco').AsInteger := Cliente.CodTabelaPreco;
   if Cliente.CodFormasPgto > 0 then
     self.FQuery.ParamByName('CodFormasPgto').AsInteger  := Cliente.CodFormasPgto;
   if Cliente.CodTransportadora > 0 then
     self.FQuery.ParamByName('CodTransportadora').AsInteger  := Cliente.CodTransportadora;
   if Cliente.CodRepresentante > 0 then
     self.FQuery.ParamByName('CodRepresentante').AsInteger  := Cliente.CodRepresentante;

   self.FQuery.ParamByName('funcionario').AsString         := IfThen( Cliente.funcionario, 'S', 'N');
   self.FQuery.ParamByName('bloqueado').AsString           := Cliente.bloqueado;
   self.FQuery.ParamByName('motivo_bloqueio').AsString     := Cliente.motivoBloqueio;
   self.FQuery.ParamByName('ECommerce').AsString           := IfThen(Cliente.ECommerce, 'S', 'N');
end;

function TRepositorioCliente.SQLGet: String;
begin
   result := ' select p.*, cli.codigo CODIGO_CLIENTE, cli.codtabelapreco, cli.codformaspgto, cli.ecommerce, '+
             ' cli.codtransportadora, cli.funcionario, cli.codrepresentante, cli.bloqueado, cli.motivo_bloqueio '+
             ' from pessoas p                                        '+
             ' left join clientes cli on (cli.codcli = p.codigo)          '+
             ' where p.codigo = :nCodigo                                ';
end;

function TRepositorioCliente.SQLGetAll: String;
begin
  result := ' select p.*, cli.codigo CODIGO_CLIENTE, cli.codtabelapreco, cli.codformaspgto, cli.ecommerce, '+
            ' cli.codtransportadora, cli.funcionario, cli.codrepresentante, cli.bloqueado, cli.motivo_bloqueio '+
            ' from clientes cli      '+
            ' inner join pessoas p on (cli.codcli = p.codigo) order by CODIGO_EMPRESA '
            + IfThen(FIdentificador = '','', self.CondicaoSQLGetAll);
end;

function TRepositorioCliente.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), self.GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioCliente.SQLRemover: String;
begin
   result := ' delete from CLIENTES where codigo = :codigo ';
end;

function TRepositorioCliente.SQLSalvar: String;
begin
  result := 'update or insert into CLIENTES                                                                    '+
            '(codigo, codcli, codtabelapreco, codformaspgto, CodTransportadora, funcionario, codrepresentante, bloqueado, motivo_bloqueio, ecommerce) '+
            ' Values (:codigo, :codcli, :codtabelapreco, :codformaspgto, :CodTransportadora, :funcionario, :codrepresentante, :bloqueado, :motivo_bloqueio, :ecommerce) ';
end;

end.
              
              
              
              
              
              
              

