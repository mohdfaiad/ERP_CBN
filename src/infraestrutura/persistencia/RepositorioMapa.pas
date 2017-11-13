unit RepositorioMapa;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioMapa = class(TRepositorio)

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
    procedure ExecutaDepoisDeSalvar (Objeto :TObject); override;

  protected
    procedure SetParametros   (Objeto :TObject                        ); override;
    procedure SetIdentificador(Objeto :TObject; Identificador :Variant); override;

  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
end;

implementation

uses SysUtils, Mapa, PedidoMapa, FabricaRepositorio;

{ TRepositorioMapa }

procedure TRepositorioMapa.ExecutaDepoisDeSalvar(Objeto: TObject);
var Mapa :TMapa;
    i :integer;
    repositorio :TRepositorio;
begin
   Mapa         := (Objeto as TMapa);

   repositorio := TFabricaRepositorio.GetRepositorio(TPEdidoMapa.ClassName);
   for i := 0 to Mapa.Pedidos.Count-1 do
   begin
     TPedidoMapa(Mapa.Pedidos.Items[i]).codigo_mapa := Mapa.codigo;
     repositorio.Salvar(TPedidoMapa(Mapa.Pedidos.Items[i]));
   end;
end;

function TRepositorioMapa.Get(Dataset: TDataSet): TObject;
var
  Mapa :TMapa;
begin
   Mapa:= TMapa.Create;
   Mapa.codigo      := self.FQuery.FieldByName('codigo').AsInteger;
   Mapa.numero_mapa := self.FQuery.FieldByName('numero_mapa').AsInteger;
   Mapa.criacao     := self.FQuery.FieldByName('criacao').AsDateTime;
   Mapa.finalizado  := self.FQuery.FieldByName('finalizado').AsString;

   result := Mapa;
end;

function TRepositorioMapa.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TMapa(Objeto).Codigo;
end;

function TRepositorioMapa.GetNomeDaTabela: String;
begin
  result := 'MAPAS';
end;

function TRepositorioMapa.GetRepositorio: TRepositorio;
begin
  result := TRepositorioMapa.Create;
end;

function TRepositorioMapa.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TMapa(Objeto).Codigo <= 0);
end;

procedure TRepositorioMapa.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  MapaAntigo :TMapa;
  MapaNovo :TMapa;
begin
   MapaAntigo := (AntigoObjeto as TMapa);
   MapaNovo   := (Objeto       as TMapa);

   if (MapaAntigo.numero_mapa <> MapaNovo.numero_mapa) then
     Auditoria.AdicionaCampoAlterado('numero_mapa', intToStr(MapaAntigo.numero_mapa), intToStr(MapaNovo.numero_mapa));

   if (MapaAntigo.criacao <> MapaNovo.criacao) then
     Auditoria.AdicionaCampoAlterado('criacao', DateTimeToStr(MapaAntigo.criacao), DateTimeToStr(MapaNovo.criacao));

   if (MapaAntigo.finalizado <> MapaNovo.finalizado) then
     Auditoria.AdicionaCampoAlterado('finalizado', MapaAntigo.finalizado, MapaNovo.finalizado);

end;

procedure TRepositorioMapa.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  Mapa :TMapa;
begin
  Mapa := (Objeto as TMapa);
  Auditoria.AdicionaCampoExcluido('codigo'    , IntToStr(Mapa.codigo));
  Auditoria.AdicionaCampoExcluido('criacao'   , DateTimeToStr(Mapa.criacao));
  Auditoria.AdicionaCampoExcluido('finalizado', Mapa.finalizado);
end;

procedure TRepositorioMapa.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  Mapa :TMapa;
begin
  Mapa := (Objeto as TMapa);
  Auditoria.AdicionaCampoIncluido('codigo'    ,    IntToStr(Mapa.codigo));
  Auditoria.AdicionaCampoIncluido('numero_mapa',   IntToStr(Mapa.numero_mapa));
  Auditoria.AdicionaCampoIncluido('criacao'   ,    DateTimeToStr(Mapa.criacao));
  Auditoria.AdicionaCampoIncluido('finalizado',    Mapa.finalizado);
end;

procedure TRepositorioMapa.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TMapa(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioMapa.SetParametros(Objeto: TObject);
var
  Mapa :TMapa;
begin
  Mapa := (Objeto as TMapa);

  self.FQuery.ParamByName('codigo').AsInteger      := Mapa.codigo;
  self.FQuery.ParamByName('numero_mapa').AsInteger := Mapa.numero_mapa;
  self.FQuery.ParamByName('criacao').AsDateTime    := Mapa.criacao;
  self.FQuery.ParamByName('finalizado').AsString   := Mapa.finalizado;
end;

function TRepositorioMapa.SQLGet: String;
begin
  result := 'select * from MAPAS where codigo = :ncod';
end;

function TRepositorioMapa.SQLGetAll: String;
begin
  result := 'select * from MAPAS';
end;

function TRepositorioMapa.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioMapa.SQLRemover: String;
begin
  result := ' delete from MAPAS where codigo = :codigo ';
end;

function TRepositorioMapa.SQLSalvar: String;
begin
  result := 'update or insert into MAPAS (CODIGO, NUMERO_MAPA ,CRIACAO ,FINALIZADO) '+
           '                      values ( :CODIGO, :NUMERO_MAPA , :CRIACAO , :FINALIZADO) ';
end;

end.

