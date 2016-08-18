unit EspecificacaoContaPorPeriodoTipo;

interface

uses
  Especificacao, system.SysUtils;

type
  TEspecificacaoContaPorPeriodoTipo = class(TEspecificacao)

  private
    FDti :TDateTIme;
    FDtf :TDateTIme;
    FStatus :String;
    FCodigoFornecedor :integer;
    FNRDoc :integer;

  public
    constructor Create(const dti :TDateTime = 0; const dtf :TDateTime = 0; const status :String = ''; const codigoFornecedor :Integer = 0; const NrDoc :integer = 0);

  public
    function SatisfeitoPor(Objeto :TObject): Boolean; override;
end;

implementation

uses
  ContasPagar, Classes, Parcela, Contnrs, dialogs;

{ TEspecificacaoContaPorPeriodoTipo }

constructor TEspecificacaoContaPorPeriodoTipo.Create(const dti, dtf: TDateTime; const status: String; const codigoFornecedor :Integer; const NrDoc :integer);
begin
  FDti := dti;
  FDtf := dtf;
  FStatus := status;
  FCodigoFornecedor := codigoFornecedor;
  FNrDoc  := NRDoc;
end;

function TEspecificacaoContaPorPeriodoTipo.SatisfeitoPor(Objeto: TObject): Boolean;
var i :integer;
begin
  result := true;

  if FNRDoc > 0 then
  begin
    result := (TContasPagar(Objeto).num_documento = FNRDoc);
    exit;
  end;

  if FDti > 0 then
  begin
    for i := 0 to TContasPagar(Objeto).Parcelas.Count - 1 do
    begin
      result := (TParcela(TContasPagar(Objeto).Parcelas.Items[i]).dt_vencimento >= FDti) and
                (TParcela(TContasPagar(Objeto).Parcelas.Items[i]).dt_vencimento <= FDtf);

      if result then
        break;
    end;
  end;

  if not result then
    exit;

  if FStatus <> '' then
    result := (FStatus = TContasPagar(Objeto).desc_status);

  if result and (FCodigoFornecedor > 0) then
    result := (TContasPagar(Objeto).cod_fornecedor = FCodigoFornecedor);
end;

end.
