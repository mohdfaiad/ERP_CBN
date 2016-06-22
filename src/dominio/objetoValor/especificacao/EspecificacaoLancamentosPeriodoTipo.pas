unit EspecificacaoLancamentosPeriodoTipo;

interface

uses
  Especificacao,
  Lancamento,
  TipoLancamento;

type
  TEspecificacaoLancamentosPeriodoTipo = class(TEspecificacao)

  private
    FLancamento     :TLancamento;
    FDataInicial    :TDateTime;
    FDataFinal      :TDateTime;
    FTipoLancamento :TTipoLancamento;

  public
    constructor Create(DataInicial, DataFinal :TDateTime;
                       TipoLancamento         :TTipoLancamento);

  public
    function SatisfeitoPor(Objeto :TObject) :Boolean; override;
end;

implementation

{ TEspecificacaoLancamentosPeriodoTipo }

constructor TEspecificacaoLancamentosPeriodoTipo.Create(DataInicial,
  DataFinal: TDateTime; TipoLancamento: TTipoLancamento);
begin
  FDataInicial    := DataInicial;
  FDataFinal      := DataFinal;
  FTipoLancamento := TipoLancamento;
end;

function TEspecificacaoLancamentosPeriodoTipo.SatisfeitoPor(
  Objeto: TObject): Boolean;
begin
  result := (TLancamento(Objeto).data_vencimento >= FDataInicial) and (TLancamento(Objeto).data_vencimento <= FDataFinal);

  if (result = false) then  Exit;

  if (FTipoLancamento = tTodas) then
    result := (TLancamento(Objeto).tipo = tPagar) or (TLancamento(Objeto).tipo = tReceber)
  else
    result := (TLancamento(Objeto).tipo = self.FTipoLancamento);
end;

end.
