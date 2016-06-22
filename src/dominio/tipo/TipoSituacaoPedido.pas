unit TipoSituacaoPedido;

interface

type TTipoSituacaoPedido = (tspEstudo=0, tspAprovado=1, tspReprovado=2);

type
  TTipoSituacaoPedidoUtilitario = class

  public
    class function DeEnumeradoParaString(TipoSituacaoPedido :TTipoSituacaoPedido) :String;
    class function DeStringParaEnumerado(TipoSituacaoPedido :String)              :TTipoSituacaoPedido;
end;

implementation

uses
  ExcecaoParametroInvalido;

{ TTipoSituacaoPedidoUtilitario }

class function TTipoSituacaoPedidoUtilitario.DeEnumeradoParaString(
  TipoSituacaoPedido: TTipoSituacaoPedido): String;
begin
//   if      (TipoSituacaoPedido = tspEstudo)    then result := 'E'
//   else if (TipoSituacaoPedido = tspAprovado)  then result := 'A'
//   else if (TipoSituacaoPedido = tspReprovado) then result := 'R'
//   else    raise TExcecaoParametroInvalido.Create('TTipoSituacaoPedidoUtilitario',
//                                                  'DeEnumeradoParaString',
//                                                  'TipoSituacaoPedido');

   case TipoSituacaoPedido of
      tspEstudo    :result := 'E';
      tspAprovado  :result := 'A';
      tspReprovado :result := 'R';
   else
      raise TExcecaoParametroInvalido.Create('TTipoSituacaoPedidoUtilitario',
                                             'DeEnumeradoParaString',
                                             'TipoSituacaoPedido');
   end;
end;

class function TTipoSituacaoPedidoUtilitario.DeStringParaEnumerado(
  TipoSituacaoPedido: String): TTipoSituacaoPedido;
begin
   case TipoSituacaoPedido[1] of
    'E': result := tspEstudo;
    'A': result := tspAprovado;
    'R': result := tspReprovado;
   else raise TExcecaoParametroInvalido.Create('TTipoSituacaoPedidoUtilitario',
                                               'DeStringParaEnumerado',
                                               'TipoSituacaoPedido');
   end;
end;

end.
