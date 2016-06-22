unit RepositorioQuantidadeItemAvulso;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioQuantidadeItemAvulso = class(TRepositorio)

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

  protected
    function IsInsercao(Objeto :TObject) :Boolean;           override;
    function IsComponente                :Boolean;           override;

  protected
    procedure SetParametros   (Objeto :TObject                        ); override;

  //==============================================================================
  // Auditoria
  //==============================================================================
  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
end;

implementation

uses
  QuantidadeItemAvulso,
  SysUtils;

{ TRepositorioQuantidadeItemAvulso }

function TRepositorioQuantidadeItemAvulso.Get(Dataset: TDataSet): TObject;
begin
   result := TQuantidadeItemAvulso.CriarParaRepositorio(Dataset.FieldByName('CODIGO').AsInteger,
                                                        Dataset.FieldByName('CODIGO_ITEM_AVULSO').AsInteger,
                                                        Dataset.FieldByName('CODIGO_TAMANHO').AsInteger,
                                                        Dataset.FieldByName('QUANTIDADE').AsInteger);

end;

function TRepositorioQuantidadeItemAvulso.GetIdentificador(
  Objeto: TObject): Variant;
begin
   result := TQuantidadeItemAvulso(Objeto).CodigoItemAvulso;
end;

function TRepositorioQuantidadeItemAvulso.GetNomeDaTabela: String;
begin
   result := 'ITENS_AVULSOS_QUANTIDADES';
end;

function TRepositorioQuantidadeItemAvulso.GetRepositorio: TRepositorio;
begin
   result := TRepositorioQuantidadeItemAvulso.Create;
end;

function TRepositorioQuantidadeItemAvulso.IsComponente: Boolean;
begin
   result := true;
end;

function TRepositorioQuantidadeItemAvulso.IsInsercao(
  Objeto: TObject): Boolean;
begin
   result := true;
end;

procedure TRepositorioQuantidadeItemAvulso.SetCamposExcluidos(
  Auditoria: TAuditoria; Objeto: TObject);
var
  QuantidadeItemAvulso :TQuantidadeItemAvulso;
begin
   QuantidadeItemAvulso := (Objeto as TQuantidadeItemAvulso);

   Auditoria.AdicionaCampoExcluido('codigo',             IntToStr(QuantidadeItemAvulso.Codigo));
   Auditoria.AdicionaCampoExcluido('codigo_item_Avulso', IntToStr(QuantidadeItemAvulso.CodigoItemAvulso));
   Auditoria.AdicionaCampoExcluido('codigo_tamanho',     IntToStr(QuantidadeItemAvulso.Tamanho.Codigo));
   Auditoria.AdicionaCampoExcluido('quantidade',         IntToStr(QuantidadeItemAvulso.Quantidade));
end;

procedure TRepositorioQuantidadeItemAvulso.SetCamposIncluidos(
  Auditoria: TAuditoria; Objeto: TObject);
var
  QuantidadeItemAvulso :TQuantidadeItemAvulso;
begin
   QuantidadeItemAvulso := (Objeto as TQuantidadeItemAvulso);

   Auditoria.AdicionaCampoIncluido('codigo',             IntToStr(QuantidadeItemAvulso.Codigo));
   Auditoria.AdicionaCampoIncluido('codigo_item_Avulso', IntToStr(QuantidadeItemAvulso.CodigoItemAvulso));
   Auditoria.AdicionaCampoIncluido('codigo_tamanho',     IntToStr(QuantidadeItemAvulso.Tamanho.Codigo));
   Auditoria.AdicionaCampoIncluido('quantidade',         IntToStr(QuantidadeItemAvulso.Quantidade));
end;

procedure TRepositorioQuantidadeItemAvulso.SetParametros(Objeto: TObject);
var
   QuantidadeItemAvulso :TQuantidadeItemAvulso;
begin
   QuantidadeItemAvulso := (Objeto as TQuantidadeItemAvulso);

   inherited SetParametro('codigo_item_avulso',  QuantidadeItemAvulso.CodigoItemAvulso);
   inherited SetParametro('codigo_tamanho',      QuantidadeItemAvulso.Tamanho.Codigo);
   inherited SetParametro('quantidade',          QuantidadeItemAvulso.Quantidade);
end;

function TRepositorioQuantidadeItemAvulso.SQLGet: String;
begin
   result := 'select * from '+ self.GetNomeDaTabela + ' where codigo_item_avulso = :codigo_item_avulso '; 
end;

function TRepositorioQuantidadeItemAvulso.SQLGetAll: String;
begin
   result := 'select * from '+ self.GetNomeDaTabela;
end;

function TRepositorioQuantidadeItemAvulso.SQLRemover: String;
begin
   result := 'delete from '+self.GetNomeDaTabela+' where codigo_item_avulso = :codigo_item_avulso ';
end;

function TRepositorioQuantidadeItemAvulso.SQLSalvar: String;
begin
   result := 'update or insert into '+self.GetNomeDaTabela +' (codigo,  codigo_item_avulso, codigo_tamanho, quantidade )'+
                             '                        values  (0,      :codigo_item_avulso, :codigo_tamanho, :quantidade )';
end;

end.
