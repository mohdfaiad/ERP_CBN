unit TipoBuscaPedido;

interface
type           
  TTipoBuscaPedido = (tbpTodos=0, tbpFaturados=1, tbpNaoFaturados=2);

type
  TTipoBuscaPedidoUtilitario = class

  public
    class function DeEnumeradoParaInteiro(TipoBuscaPedido :TTipoBuscaPedido) :Integer;
    class function DeInteiroParaEnumerado(TipoBuscaPedido :Integer) :TTipoBuscaPedido;
end;

implementation

uses
  ExcecaoParametroInvalido;

{ TTipoBuscaPedidoUtilitario }

class function TTipoBuscaPedidoUtilitario.DeEnumeradoParaInteiro(
  TipoBuscaPedido: TTipoBuscaPedido): Integer;
begin
   if      (TipoBuscaPedido = tbpTodos) then result := 0
   else if (TipoBuscaPedido = tbpFaturados) then result := 1
   else if (TipoBuscaPedido = tbpNaoFaturados) then result := 2
   else
    raise TExcecaoParametroInvalido.Create('TTipoBuscaPedidoUtilitario', 'DeEnumeradoParaInteiro', 'TipoBuscaPedido :TTipoBuscaPedido');
end;

class function TTipoBuscaPedidoUtilitario.DeInteiroParaEnumerado(
  TipoBuscaPedido: Integer): TTipoBuscaPedido;
begin
   case TipoBuscaPedido of
     0: result := tbpTodos;
     1: result := tbpFaturados;
     2: result := tbpNaoFaturados;
   else raise TExcecaoParametroInvalido.Create('TTipoBuscaPedidoUtilitario', 'DeInteiroParaEnumerado', 'TipoBuscaPedido :TTipoBuscaPedido');
   end;
end;

end.
