unit RepositorioEmpresa;

interface

uses
  DB,
  Auditoria,
  Repositorio,
  RepositorioPessoa;

type
  TRepositorioEmpresa = class(TRepositorioPessoa)

  protected
    function Get             (Dataset :TDataSet) :TObject; overload; override;
    function GetNomeDaTabela                     :String;            override;
    function GetIdentificador(Objeto :TObject)   :Variant;           override;
    function GetRepositorio                      :TRepositorio;      override;

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

  protected
    procedure ExecutaDepoisDeSalvar (Objeto :TObject); override;

  //==============================================================================
  // Auditoria
  //==============================================================================
  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;

  //==============================================================================
  // Métodos de persistência no banco dados.
  //==============================================================================
  public
    function Salvar (Objeto              :TObject) :Boolean; override;
    function Remover(Objeto              :TObject) :Boolean; override;
end;

implementation

uses
  Empresa,
  Pessoa,
  TipoRegimeTributario,
  SysUtils, FabricaRepositorio, ConfiguracoesNF, ConfiguracoesNFEmail;

{ TRepositorioEmpresa }

procedure TRepositorioEmpresa.ExecutaDepoisDeSalvar(Objeto: TObject);
var
  Empresa                       :TEmpresa;
  RepositorioConfiguracoes      :TRepositorio;
  RepositorioConfiguracoesEmail :TRepositorio;
begin
   RepositorioConfiguracoes       := nil;
   RepositorioConfiguracoesEmail  := nil;

   Empresa := (Objeto as TEmpresa);

   try
     if Assigned(Empresa.ConfiguracoesNF) then begin
       RepositorioConfiguracoes := TFabricaRepositorio.GetRepositorio(TConfiguracoesNF.ClassName);
       RepositorioConfiguracoes.Remover(Empresa.ConfiguracoesNF);
       RepositorioConfiguracoes.Salvar(Empresa.ConfiguracoesNF);
     end;

     if Assigned(Empresa.ConfiguracoesEmail) then begin
       RepositorioConfiguracoesEmail := TFabricaRepositorio.GetRepositorio(TConfiguracoesNFEmail.ClassName);
       RepositorioConfiguracoesEmail.Remover(Empresa.ConfiguracoesEmail);
       RepositorioConfiguracoesEmail.Salvar(Empresa.ConfiguracoesEmail);
     end;
   finally
     FreeAndNil(RepositorioConfiguracoes);
     FreeAndNil(RepositorioConfiguracoesEmail);
   end;
end;

function TRepositorioEmpresa.Get(Dataset: TDataSet): TObject;
var
  Pessoa           :TPessoa;
  RegimeTributario :Integer;
  Empresa          :TEmpresa;
begin
   Pessoa   := TPessoa(inherited Get(Dataset));

   result := nil;

   if not Assigned(Pessoa) then begin
     exit;
   end;

   Empresa                := TEmpresa.Create;
   Empresa.Codigo         := Pessoa.Codigo;
   Empresa.Razao          := Pessoa.Razao;
   Empresa.CPF_CNPJ       := Pessoa.CPF_CNPJ;
   Empresa.RG_IE          := Pessoa.RG_IE;
   Empresa.DtCadastro     := Pessoa.DtCadastro;
   Empresa.Fone1          := Pessoa.Fone1;
   Empresa.Fone2          := Pessoa.Fone2;
   Empresa.Fax            := Pessoa.Fax;
   Empresa.Email          := Pessoa.Email;
   Empresa.Observacao     := Pessoa.Observacao;
   Empresa.CodigoEmpresa  := Dataset.FieldByName('codigo_empresa').AsInteger;


   RegimeTributario       := Dataset.FieldByName('regime_tributario').AsInteger;

   case RegimeTributario of
     0: Empresa.RegimeTributario := trtSimplesNacional;
     1: Empresa.RegimeTributario := trtLucroPresumido;
     2: Empresa.RegimeTributario := trtLucroReal;
   else raise Exception.Create('Regime tributário não encontrado!');
   end;

   result := Empresa;
   FreeAndNil(Pessoa);
end;

function TRepositorioEmpresa.GetIdentificador(Objeto: TObject): Variant;
begin
   result := TEmpresa(Objeto).CodigoEmpresa;
end;

function TRepositorioEmpresa.GetNomeDaTabela: String;
begin
   result := 'EMPRESAS';
end;

function TRepositorioEmpresa.GetRepositorio: TRepositorio;
begin
   result := TRepositorioEmpresa.Create;
end;

function TRepositorioEmpresa.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TEmpresa(Objeto).CodigoEmpresa <= 0);
end;

function TRepositorioEmpresa.Remover(Objeto: TObject): Boolean;
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

function TRepositorioEmpresa.Salvar(Objeto: TObject): Boolean;
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

procedure TRepositorioEmpresa.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  EmpresaAntigo :TEmpresa;
  EmpresaNovo   :TEmpresa;
begin
//   inherited SetCamposAlterados(Auditoria, AntigoObjeto, Objeto);

   EmpresaAntigo := (AntigoObjeto as TEmpresa);
   EmpresaNovo   := (Objeto       as TEmpresa);

   if (EmpresaAntigo.RegimeTributario <> EmpresaNovo.RegimeTributario) then
    Auditoria.AdicionaCampoAlterado('codigo', IntToStr(EmpresaAntigo.RegimeTributarioInteger), IntToStr(EmpresaNovo.RegimeTributarioInteger));
end;

procedure TRepositorioEmpresa.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Empresa :TEmpresa;
begin
//   inherited SetCamposExcluidos(Auditoria, Objeto);

   Empresa := (Objeto as TEmpresa);

   Auditoria.AdicionaCampoExcluido('codigo'            , intToStr(Empresa.CodigoEmpresa));
   Auditoria.AdicionaCampoExcluido('codigo_pessoa'     , IntToStr(Empresa.Codigo));
   Auditoria.AdicionaCampoExcluido('regime_tributario' , IntToStr(Empresa.RegimeTributarioInteger));
end;

procedure TRepositorioEmpresa.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Empresa :TEmpresa;
begin
//   inherited SetCamposIncluidos(Auditoria, Objeto);

   Empresa := (Objeto as TEmpresa);

   Auditoria.AdicionaCampoIncluido('codigo'            , intToStr(Empresa.CodigoEmpresa));
   Auditoria.AdicionaCampoIncluido('codigo_pessoa'     , IntToStr(Empresa.Codigo));
   Auditoria.AdicionaCampoIncluido('regime_tributario' , IntToStr(Empresa.RegimeTributarioInteger));
end;

procedure TRepositorioEmpresa.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
   TEmpresa(Objeto).CodigoEmpresa := Integer(Identificador);
end;

procedure TRepositorioEmpresa.SetParametros(Objeto: TObject);
var
  Empresa :TEmpresa;
begin
   Empresa := (Objeto as TEmpresa);

   if (Empresa.CodigoEmpresa > 0) then  inherited SetParametro('codigo_empresa', Empresa.CodigoEmpresa)
   else                                 inherited LimpaParametro('codigo_empresa');

   inherited SetParametro('codigo', Empresa.Codigo);

   if      (Empresa.RegimeTributario = trtSimplesNacional) then SetParametro('regime_tributario', 0)
   else if (Empresa.RegimeTributario = trtLucroPresumido)  then SetParametro('regime_tributario', 1)
   else if (Empresa.RegimeTributario = trtLucroReal)       then SetParametro('regime_tributario', 2);
end;

function TRepositorioEmpresa.SQLGet: String;
begin
   result := ' select p.*, e.codigo CODIGO_EMPRESA, e.regime_tributario '+
             ' from empresas e                                          '+
             ' inner join pessoas p on (e.codigo_pessoa = p.codigo)     '+
             ' where e.codigo = :nCodigo                                ';
end;

function TRepositorioEmpresa.SQLGetAll: String;
begin
   result := ' select p.*, e.codigo CODIGO_EMPRESA, e.regime_tributario from empresas e inner join pessoas p on (e.codigo_pessoa = p.codigo) order by CODIGO_EMPRESA';
end;

function TRepositorioEmpresa.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from '+ self.GetNomeDaTabela +' where '+ campo +' = :ncampo';
end;

function TRepositorioEmpresa.SQLRemover: String;
begin
//   result := ' delete from pessoas                                                                            '+
//             ' where codigo = (select first 1 codigo_pessoa from empresas e where e.codigo = :codigo_empresa) ';
   result := ' delete from empresas                                                                            '+
             ' where codigo = :codigo_empresa ';
end;

function TRepositorioEmpresa.SQLSalvar: String;
begin
   result := '  update or insert into empresas                       '+
             '        (codigo, codigo_pessoa, regime_tributario)     '+
             ' values (:codigo_empresa, :codigo, :regime_tributario) ';
end;

end.
