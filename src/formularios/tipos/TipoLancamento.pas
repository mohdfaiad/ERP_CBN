unit TipoLancamento;

interface

type TTipoLancamento = (tPagar = 0,  tReceber = 1, tTodas = 2);

type
  TTipoLancamentoUtilitario = class

  public
      // Conversão
    class function DeEnumeradoParaString(TipoLancamento :TTipoLancamento) :String;
    class function DeStringParaEnumerado(TipoLancamento :String)          :TTipoLancamento;
end;

implementation

uses
  ExcecaoParametroInvalido;

{ TTipoLancamentoUtilitario }

class function TTipoLancamentoUtilitario.DeEnumeradoParaString(
  TipoLancamento: TTipoLancamento): String;
begin
   if      (TipoLancamento = tPagar)      then result := 'P'
   else if (TipoLancamento = tReceber)    then result := 'R'
   else
     raise TExcecaoParametroInvalido.Create(self.ClassName, 'TipoLancamento :TTipoLancamento', 'Lancamento' );
end;

class function TTipoLancamentoUtilitario.DeStringParaEnumerado(
  TipoLancamento: String): TTipoLancamento;
begin
   case TipoLancamento[1] of
     'P': result := tPagar;
     'R': result := tReceber;
   else raise TExcecaoParametroInvalido.Create(self.ClassName, 'TipoLancamento :String', 'Lancamento' );
   end;
end;

end.

