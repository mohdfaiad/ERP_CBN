unit RepositorioTotaisNotaFiscal;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioTotaisNotaFiscal = class(TRepositorio)

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
  TotaisNotaFiscal,
  SysUtils;

{ TRepositorioTotaisNotaFiscal }

function TRepositorioTotaisNotaFiscal.Get(Dataset: TDataSet): TObject;
begin
   result := TTotaisNotaFiscal.Create(Dataset.FieldByName('frete').AsFloat,
                                      Dataset.FieldByName('seguro').AsFloat,
                                      Dataset.FieldByName('desconto').AsFloat,
                                      Dataset.FieldByName('outras_despesas').AsFloat);

   TTotaisNotaFiscal(result).PercentualDescontoFatura := Dataset.FieldByName('percentual_desconto_fatura').AsFloat;
end;

function TRepositorioTotaisNotaFiscal.GetIdentificador(
  Objeto: TObject): Variant;
begin
   result := TTotaisNotaFiscal(Objeto).CodigoNotaFiscal;
end;

function TRepositorioTotaisNotaFiscal.GetNomeDaTabela: String;
begin
   result := 'totais_notas_fiscais';
end;

function TRepositorioTotaisNotaFiscal.GetRepositorio: TRepositorio;
begin
   result := TRepositorioTotaisNotaFiscal.Create;
end;

function TRepositorioTotaisNotaFiscal.IsComponente: Boolean;
begin
   result := true;
end;

function TRepositorioTotaisNotaFiscal.IsInsercao(Objeto: TObject): Boolean;
begin
   result := True;
end;

procedure TRepositorioTotaisNotaFiscal.SetCamposExcluidos(
  Auditoria: TAuditoria; Objeto: TObject);
var
  Obj :TTotaisNotaFiscal;
begin
   Obj := (Objeto as TTotaisNotaFiscal);

   Auditoria.AdicionaCampoExcluido('codigo_nota_fiscal',         IntToStr(Obj.CodigoNotaFiscal));
   Auditoria.AdicionaCampoExcluido('frete',                      FloatToStr(Obj.Frete));
   Auditoria.AdicionaCampoExcluido('seguro',                     FloatToStr(Obj.Seguro));
   Auditoria.AdicionaCampoExcluido('desconto',                   FloatToStr(Obj.Descontos));
   Auditoria.AdicionaCampoExcluido('outras_despesas',            FloatToStr(Obj.OutrasDespesas));
   Auditoria.AdicionaCampoExcluido('percentual_desconto_fatura', FloatToStr(Obj.PercentualDescontoFatura));
end;

procedure TRepositorioTotaisNotaFiscal.SetCamposIncluidos(
  Auditoria: TAuditoria; Objeto: TObject);
var
  Obj :TTotaisNotaFiscal;
begin
   Obj := (Objeto as TTotaisNotaFiscal);

   Auditoria.AdicionaCampoIncluido('codigo_nota_fiscal',         IntToStr(Obj.CodigoNotaFiscal));
   Auditoria.AdicionaCampoIncluido('frete',                      FloatToStr(Obj.Frete));
   Auditoria.AdicionaCampoIncluido('seguro',                     FloatToStr(Obj.Seguro));
   Auditoria.AdicionaCampoIncluido('desconto',                   FloatToStr(Obj.Descontos));
   Auditoria.AdicionaCampoIncluido('outras_despesas',            FloatToStr(Obj.OutrasDespesas));
   Auditoria.AdicionaCampoIncluido('percentual_desconto_fatura', FloatToStr(Obj.PercentualDescontoFatura));
end;

procedure TRepositorioTotaisNotaFiscal.SetParametros(Objeto: TObject);
var
  Obj :TTotaisNotaFiscal;
begin
   Obj := (Objeto as TTotaisNotaFiscal);

   inherited SetParametro('codigo_nota_fiscal',         Obj.CodigoNotaFiscal);
   inherited SetParametro('frete',                      Obj.Frete);
   inherited SetParametro('seguro',                     Obj.Seguro);
   inherited SetParametro('desconto',                   Obj.Descontos);
   inherited SetParametro('outras_despesas',            Obj.OutrasDespesas);
   inherited SetParametro('percentual_desconto_fatura', Obj.PercentualDescontoFatura);
end;

function TRepositorioTotaisNotaFiscal.SQLGet: String;
begin
   result := 'select * from '+self.GetNomeDaTabela+' where codigo_nota_fiscal = :codigo_nota_fiscal';
end;

function TRepositorioTotaisNotaFiscal.SQLGetAll: String;
begin
   result := 'select * from'+self.GetNomeDaTabela;
end;

function TRepositorioTotaisNotaFiscal.SQLRemover: String;
begin
   result := 'delete from '+self.GetNomeDaTabela+' where codigo_nota_fiscal = :codigo_nota_fiscal';
end;

function TRepositorioTotaisNotaFiscal.SQLSalvar: String;
begin
   result := 'update or insert into '+self.GetNomeDaTabela+'  (codigo_nota_fiscal,  frete, seguro,     '+
                                                           '   desconto, outras_despesas, percentual_desconto_fatura)              '+
                                                      'values (:codigo_nota_fiscal,  :frete,  :seguro, '+
                                                           '   :desconto, :outras_despesas, :percentual_desconto_fatura)           ';
end;

end.
