unit EspecificacaoPedidosAprovadosNaoFaturados;

interface

uses
  Especificacao,
  Pessoa,
  Pedido,
  MetodoDelegadoVerificaPedidoFaturado;

type
  TEspecificacaoPedidosAprovadosNaoFaturados = class(TEspecificacao)

  private
    FPessoa         :TPessoa;
    FPedidoFaturado :TMetodoDelegadoVerificaPedidoFaturado;

  public
    constructor Create(Pessoa :TPessoa; PedidoFaturado :TMetodoDelegadoVerificaPedidoFaturado);

  public
    function SatisfeitoPor(Pedido :TObject) :Boolean; override;

end;

implementation

uses
  TipoSituacaoPedido,
  ExcecaoParametroInvalido;

{ TEspecificacaoPedidosAprovadosNaoFaturados }

constructor TEspecificacaoPedidosAprovadosNaoFaturados.Create(Pessoa :TPessoa; PedidoFaturado :TMetodoDelegadoVerificaPedidoFaturado);
begin
   if not Assigned(Pessoa) then
    raise TExcecaoParametroInvalido.Create('TEspecificacaoPedidosAprovadosNaoFaturados',
                                           'Create(Pessoa :TPessoa)',
                                           'Pessoa');

   if not Assigned(PedidoFaturado) then
    raise TExcecaoParametroInvalido.Create('TEspecificacaoPedidosAprovadosNaoFaturados',
                                           'Create(PedidoFaturado :TMetodoDelegadoVerificaPedidoFaturado)',
                                           'PedidoFaturado');
   self.FPessoa         := Pessoa;
   self.FPedidoFaturado := PedidoFaturado;
end;

function TEspecificacaoPedidosAprovadosNaoFaturados.SatisfeitoPor(
  Pedido: TObject): Boolean;
var
  P :TPedido;
begin
   P      := (Pedido as TPedido);

   // Pedidos não faturados que foram aprovados referente aquela pessoa
   result := (
              (TTipoSituacaoPedidoUtilitario.DeStringParaEnumerado(P.aprovacao) = tspAprovado) and // Nessa linha verifico se foi aprovado
              (P.cod_cliente = self.FPessoa.Codigo)                                            and // Nessa linha verifico se o pedido é referente a pessoa
              (not self.FPedidoFaturado(P.Codigo))                                             and // Nessa linha por meio do método delegado eu verifico se o pedido já foi faturado
               not (P.despachado = 'S')                                                        and
               (P.cancelado <> 'S')
             );
end;

end.
