unit RepositorioParametros;

interface

uses
  DB,
  Repositorio;

type
  TRepositorioParametros = class(TRepositorio)

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

end;

implementation

uses Parametros;

{ TRepositorioParametros }

function TRepositorioParametros.Get(Dataset: TDataSet): TObject;
var
  Parametros :TParametros;
begin
   Parametros                    := TParametros.Create;
   Parametros.Codigo             := self.FQuery.FieldByName('codigo').AsInteger;
   Parametros.VersaoBancoDeDados := self.FQuery.FieldByName('versao_banco_de_dados').AsInteger;

   result := Parametros;
end;

function TRepositorioParametros.GetIdentificador(Objeto: TObject): Variant;
begin
   result := TParametros(Objeto).Codigo;
end;

function TRepositorioParametros.GetNomeDaTabela: String;
begin
   result := 'PARAMETROS';
end;

function TRepositorioParametros.GetRepositorio: TRepositorio;
begin
   result := TRepositorioParametros.Create;
end;

function TRepositorioParametros.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TParametros(Objeto).Codigo <= 0);
end;

procedure TRepositorioParametros.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
   TParametros(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioParametros.SetParametros(Objeto: TObject);
var
  Parametros :TParametros;
begin
   Parametros := (Objeto as TParametros);

   if (Parametros.Codigo > 0) then inherited SetParametro('codigo', Parametros.Codigo)
   else                            inherited LimpaParametro('codigo');

   inherited SetParametro('versao_banco_de_dados', Parametros.VersaoBancoDeDados);
end;

function TRepositorioParametros.SQLGet: String;
begin
   result := ' select * from parametros where (codigo = 1) and (:migue = 0) ';
end;

function TRepositorioParametros.SQLGetAll: String;
begin
   result := ' select * from parametros ';
end;

function TRepositorioParametros.SQLGetExiste(campo: String): String;
begin
   result := 'select '+ campo +' from '+ self.GetNomeDaTabela+' where '+ campo +' = :ncampo';
end;

function TRepositorioParametros.SQLRemover: String;
begin
   result := ' delete from parametros where (codigo >= 0) and (:migue >= 0)';
end;

function TRepositorioParametros.SQLSalvar: String;
begin
   result := ' update or insert into parametros (codigo, versao_banco_de_dados) values (:codigo, :versao_banco_de_dados) ';
end;

end.
