unit EspecificacaoNotaFiscalPorPeriodoTipoEmpresa;

interface

uses Especificacao;

type TEspecificacaoNotaFiscalPorPeriodoTipoEmpresa = class(Tespecificacao)

  private
    FData_inicial   :TdateTime;
    Fdata_final     :TdateTime;
    FTipo           :String;
    FCodigo_empresa :Integer;
    
  public
   function SatisfeitoPor(Objeto :TObject) :Boolean; override;
   constructor create(Data_inicial, data_final :TdateTime; tipo :String; codigo_empresa :Integer);

end;

implementation

uses NotaFiscal;

{ TEspecificacaoNotaFiscalPorPeriodoTipoEmpresa }

constructor TEspecificacaoNotaFiscalPorPeriodoTipoEmpresa.create(
  Data_inicial, data_final: TdateTime; tipo: String;
  codigo_empresa: Integer);
begin
  FData_inicial   := Data_inicial;
  Fdata_final     := data_final;
  FTipo           := tipo;
  FCodigo_empresa := codigo_empresa;
end;

function TEspecificacaoNotaFiscalPorPeriodoTipoEmpresa.SatisfeitoPor(
  Objeto: TObject): Boolean;
var nota_fiscal :TNotaFiscal;
    cod_empresa :Integer;
begin
  nota_fiscal := TNotaFiscal(Objeto);

  if FTipo = 'E' then
    cod_empresa := nota_fiscal.Destinatario.Codigo
  else
    cod_empresa := nota_fiscal.Emitente.Codigo;

  Result := (nota_fiscal.DataEmissao >= FData_inicial) and (nota_fiscal.DataEmissao <= Fdata_final) and
            (nota_fiscal.Entrada_saida = FTipo)        and ( cod_empresa = FCodigo_empresa);

end;

end.
