unit GeradorFinanceiro;

interface

uses
  Fatura,
  NotaFiscal;

type
  TGeradorFinanceiro = class

  public
    function GerarFatura(NotaFiscal :TNotaFiscal) :TFatura;
end;

implementation

uses
  SysUtils,
  DateUtils,
  ExcecaoParametroInvalido,
  FormaPagamentoParcelas,
  Funcoes; //Math;

{ TGeradorFinanceiro }

function TGeradorFinanceiro.GerarFatura(NotaFiscal: TNotaFiscal): TFatura;
const
  NOME_METODO = 'GerarFatura(NotaFiscal: TNotaFiscal): TFatura';
var
  DataInicio      :TDateTime;
  ValorDuplicata  :Real;
  nX              :Integer;
  Parcela         :TFormaPagamentoParcelas;
  Resto           :Real;
  TotalFatura     :Real;
  TotalDuplicatas :Real;
begin
   result := nil;

   if not Assigned(NotaFiscal) then
     raise TExcecaoParametroInvalido.Create(self.ClassName, NOME_METODO, 'NotaFiscal');

   // Se a forma de pagamento é à vista não gera fatura
   if NotaFiscal.FormaPagamento.IsAVista then
    exit;

   TotalFatura := NotaFiscal.Totais.TotalNF;

   // Se a nota fiscal tiver percentual de desconto para fatura, então é feito esse desconto aqui
   if (NotaFiscal.Totais.PercentualDescontoFatura > 0) then begin
     TotalFatura := (TotalFatura - ((TotalFatura * NotaFiscal.Totais.PercentualDescontoFatura) / 100))
   end;

   TotalFatura := Arredonda(TotalFatura);
   // Arredondo o valor pra cima sem nenhuma casa decimal
//   SetRoundMode(rmUp);
//   TotalFatura := RoundTo(TotalFatura, -1);
//   SetRoundMode(rmNearest);

   result := TFatura.Create(NotaFiscal.NumeroNotaFiscal,
                            NotaFiscal.Totais.TotalProdutos,
                            NotaFiscal.Totais.Descontos,
                            TotalFatura);

   DataInicio       := Date;
//   ValorDuplicata   := ((TotalFatura / 100) / NotaFiscal.FormaPagamento.NumParcelas);
   ValorDuplicata   := (TotalFatura / NotaFiscal.FormaPagamento.NumParcelas);

   // Truncando o valor. Depois o resto será somado na primeira parcela. (Para evitar problemas de arredondamento)
   ValorDuplicata := Trunc(ValorDuplicata);

   TotalDuplicatas := (ValorDuplicata * NotaFiscal.FormaPagamento.NumParcelas);
   Resto           := (TotalFatura - TotalDuplicatas);

   for nX := 0 to (NotaFiscal.FormaPagamento.Parcelas.Count-1) do begin
      Parcela := (NotaFiscal.FormaPagamento.Parcelas[nX] as TFormaPagamentoParcelas);

      // Jogo o resto na primeira parcela
      if (nX = 0) then
        result.AdicionarDuplicata((ValorDuplicata + Resto), IncDay(DataInicio, Parcela.DiasParcela))
      else
        result.AdicionarDuplicata(ValorDuplicata, IncDay(DataInicio, Parcela.DiasParcela));
   end;
end;

end.
