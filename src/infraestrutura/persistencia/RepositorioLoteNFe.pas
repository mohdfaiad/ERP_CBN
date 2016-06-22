unit RepositorioLoteNFe;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioLoteNFe = class(TRepositorio)

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
  LoteNFe,
  SysUtils, FabricaRepositorio, RetornoLoteNFe;

{ TRepositorioLoteNFe }

procedure TRepositorioLoteNFe.ExecutaDepoisDeSalvar(Objeto: TObject);
var
  RepositorioRetornoLoteNFe :TRepositorio;
  Lote :TLoteNFe;
begin
   Lote := (Objeto as TLoteNFe);

   RepositorioRetornoLoteNFe := nil;

   try
     if Assigned(Lote.Retorno) then begin
       RepositorioRetornoLoteNFe := TFabricaRepositorio.GetRepositorio(TRetornoLoteNFe.ClassName);
       RepositorioRetornoLoteNFe.Remover(Lote.Retorno);
       RepositorioRetornoLoteNFe.Salvar(Lote.Retorno);
     end;
   finally
     FreeAndNil(RepositorioRetornoLoteNFe);
   end;
end;

function TRepositorioLoteNFe.Get(Dataset: TDataSet): TObject;
begin
   result := TLoteNFE.CriaParaRepositorio(Dataset.FieldByName('codigo').AsInteger,
                                          Dataset.FieldByName('codigo_nota_fiscal').AsInteger,
                                          Dataset.FieldByName('data').AsDateTime);
end;

function TRepositorioLoteNFe.GetIdentificador(Objeto: TObject): Variant;
begin
   result := TLoteNFe(Objeto).Codigo;
end;

function TRepositorioLoteNFe.GetNomeDaTabela: String;
begin
   result := 'lotes_nfe';
end;

function TRepositorioLoteNFe.GetRepositorio: TRepositorio;
begin
   result := TRepositorioLoteNFe.Create;
end;

function TRepositorioLoteNFe.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TLoteNFE(Objeto).Codigo <= 0); 
end;

procedure TRepositorioLoteNFe.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  LoteAntigo, LoteNovo :TLoteNFe;
begin
   LoteAntigo := (AntigoObjeto as TLoteNFe);
   LoteNovo   := (Objeto       as TLoteNFe);

   if (LoteAntigo.CodigoNotaFiscal <> LoteNovo.CodigoNotaFiscal) then
    Auditoria.AdicionaCampoAlterado('codigo_nota_fiscal', IntToStr(LoteAntigo.CodigoNotaFiscal), IntToStr(LoteNovo.CodigoNotaFiscal));

   if (LoteAntigo.Data <> LoteNovo.Data) then
    Auditoria.AdicionaCampoAlterado('data', FormatDateTime('dd/mm/yyyy', LoteAntigo.Data), FormatDateTime('dd/mm/yyyy', LoteNovo.Data));
end;

procedure TRepositorioLoteNFe.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Obj :TLoteNFe;
begin
   Obj := (Objeto as TLoteNFe);

   Auditoria.AdicionaCampoExcluido('codigo',              IntToStr(Obj.Codigo));
   Auditoria.AdicionaCampoExcluido('codigo_nota_fiscal',  IntToStr(Obj.CodigoNotaFiscal));
   Auditoria.AdicionaCampoExcluido('data',                FormatDateTime('dd/mm/yyyy', Obj.Data));
end;

procedure TRepositorioLoteNFe.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Obj :TLoteNFe;
begin
   Obj := (Objeto as TLoteNFe);

   Auditoria.AdicionaCampoIncluido('codigo',              IntToStr(Obj.Codigo));
   Auditoria.AdicionaCampoIncluido('codigo_nota_fiscal',  IntToStr(Obj.CodigoNotaFiscal));
   Auditoria.AdicionaCampoIncluido('data',                FormatDateTime('dd/mm/yyyy', Obj.Data));
end;

procedure TRepositorioLoteNFe.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
   TLoteNFe(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioLoteNFe.SetParametros(Objeto: TObject);
var
  obj :TLoteNFe;
begin
  obj := (Objeto as TLoteNFe);

  if (obj.Codigo > 0) then inherited SetParametro('codigo', obj.Codigo)
  else                     inherited LimpaParametro('codigo');

  inherited SetParametro('codigo_nota_fiscal', Obj.CodigoNotaFiscal);
  inherited SetParametro('data',               obj.Data);
end;

function TRepositorioLoteNFe.SQLGet: String;
begin
   result := ' select * from '+self.GetNomeDaTabela+' where codigo = :codigo ';
end;

function TRepositorioLoteNFe.SQLGetAll: String;
begin
   result := ' select * from ' + self.GetNomeDaTabela + ' order by codigo ';
end;

function TRepositorioLoteNFe.SQLRemover: String;
begin
   result := ' delete from '+self.GetNomeDaTabela+ ' order by codigo ';
end;

function TRepositorioLoteNFe.SQLSalvar: String;
begin
   result := ' update or insert into ' + self.GetNomeDaTabela  +
             '        (codigo,   codigo_nota_fiscal,  data)   '+
             ' values (:codigo, :codigo_nota_fiscal, :data)   ';
end;

end.
