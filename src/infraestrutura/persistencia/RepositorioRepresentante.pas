unit RepositorioRepresentante;

interface

uses
  DB,
  Auditoria,
  Repositorio,
  RepositorioPessoa;

type
  TRepositorioRepresentante = class(TRepositorioPessoa)

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
  SysUtils,
  Representante, Math, StrUtils, FabricaRepositorio, DadosRepresentante;

{ TRepositorioRepresentante }

procedure TRepositorioRepresentante.ExecutaDepoisDeSalvar(Objeto: TObject);
var
  Repositorio :TRepositorio;
begin
   inherited;
   Repositorio   := nil;
   try
     if Assigned(TRepresentante(Objeto).DadosRepresentante) then begin
       Repositorio := TFabricaRepositorio.GetRepositorio(TDadosRepresentante.ClassName);
       TRepresentante(Objeto).DadosRepresentante.codigo_representante := TRepresentante(Objeto).Codigo;
       Repositorio.Salvar(TRepresentante(Objeto).DadosRepresentante);
     end;
   finally
     FreeAndNil(Repositorio);
   end;
end;

function TRepositorioRepresentante.Get(Dataset: TDataSet): TObject;
begin
   result := inherited Get(DataSet);
end;

function TRepositorioRepresentante.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TRepresentante(Objeto).Codigo;
end;

function TRepositorioRepresentante.GetNomeDaTabela: String;
begin
  result := inherited GetNomeDaTabela;
end;

function TRepositorioRepresentante.GetRepositorio: TRepositorio;
begin
  result := TRepositorioRepresentante.Create;
end;

function TRepositorioRepresentante.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TRepresentante(Objeto).Codigo <= 0);
end;

procedure TRepositorioRepresentante.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
begin
  inherited SetCamposAlterados(Auditoria, AntigoObjeto, Objeto);
end;

procedure TRepositorioRepresentante.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
begin
  inherited SetCamposExcluidos(Auditoria, Objeto);
end;

procedure TRepositorioRepresentante.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
begin
  inherited SetCamposIncluidos(Auditoria, Objeto);
end;

procedure TRepositorioRepresentante.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  inherited SetIdentificador(Objeto, Identificador);
end;

procedure TRepositorioRepresentante.SetParametros(Objeto: TObject);
begin
  inherited SetParametros(Objeto);
end;

function TRepositorioRepresentante.SQLGet: String;
begin
 result := inherited SQLGet;
end;

function TRepositorioRepresentante.SQLGetAll: String;
begin
  result := inherited SQLGetAll;
end;

function TRepositorioRepresentante.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited SQLGetExiste(arrayDeCampos);
end;

function TRepositorioRepresentante.SQLRemover: String;
begin
  result := inherited SQLRemover;
end;

function TRepositorioRepresentante.SQLSalvar: String;
begin
  result := inherited SQLSalvar;
end;

end.








