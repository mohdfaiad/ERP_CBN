unit FabricaRepositorio;

interface

uses
  Repositorio;

type
  TFabricaRepositorio = class

  public
    class function GetRepositorio(NomeDaEntidade :String) :TRepositorio;
end;

implementation

uses
  SysUtils,
  uModulo,
  ExcecaoRepositorioNaoEncontrado,
  RepositorioUsuario,
  RepositorioDiretorioBackup,
  RepositorioPerfil,
  RepositorioCampoExcluidoAuditoria,
  RepositorioCampoIncluidoAuditoria,
  RepositorioAuditoria,
  RepositorioCampoAlteradoAuditoria,
  RepositorioManutencaoSistema,
  RepositorioParametros,
  RepositorioPessoa,
  RepositorioEndereco,
  RepositorioTabelaPreco,
  RepositorioCor,
  RepositorioCliente,
  RepositorioTamanho,
  RepositorioGrade,
  RepositorioGrade_Tamanhos,
  RepositorioFormaPagamento,
  RepositorioFormaPagamentoParcelas,
  RepositorioProduto,
  RepositorioProdutoCores,
  RepositorioProdutoTabelaPreco,
  RepositorioCodigoBarras,
  RepositorioEmpresa,
  RepositorioClienteRepresentante,
  RepositorioPedido,
  RepositorioItem,
  RepositorioNaturezaOperacao,
  RepositorioPedidoFaturado,
  RepositorioConfiguracoesNF,
  RepositorioIcms00,
  RepositorioIcmsSn101,
  RepositorioIpiNt,
  RepositorioIpiTrib,
  RepositorioPisAliq,
  RepositorioPisNt,
  RepositorioCofinsAliq,
  RepositorioCofinsNt,
  RepositorioItemNotaFiscal,
  RepositorioLocalEntregaNotaFiscal,
  ObservacaoNotaFiscal,
  RepositorioObservacoesNotaFiscal,
  RepositorioNotaFiscal,
  RepositorioVolumesNotaFiscal,
  RepositorioTotaisNotaFiscal,
  RepositorioLoteNFe,
  RepositorioRetornoLoteNFe,
  RepositorioNFe,
  RepositorioRetornoNFe,
  RepositorioConfiguracoesNFEmail, RepositorioItemAvulso,
  RepositorioQuantidadeItemAvulso,
  RepositorioMateria,
  RepositorioItemNfMateria,
  RepositorioMateriaFornecedor,
  RepositorioCFOPCorrespondente,
  RepositorioLancamento,
  RepositorioComissaoRepresentante,
  RepositorioComissaoHasLancamentos,
  RepositorioCidade,
  RepositorioEstado,
  RepositorioContador,
  RepositorioConferenciaPedido,
  RepositorioConferenciaItem,
  RepositorioCaixas,
  RepositorioEstoque,
  RepositorioCorFilha,
  REpositorioColecao,
  RepositorioIcmsEstado,
  RepositorioIntervaloProducao,
  RepositorioEntradaSaida,
  RepositorioAliqInternaIcms,
  RepositorioContasPagar,
  RepositorioItemConta,
  RepositorioParcela,
  RepositorioProdutosKit,
  RepositorioCoresKit,
  RepositorioContaBanco,
  RepositorioNFCe,
  RepositorioParametrosNFCe,
  RepositorioMovimento,
  RepositorioOrdemServico,
  RepositorioNcmIBPT,
  RepositorioCaixa,
  RepositorioEntradaSaidaMoeda;


{ TFabricaRepositorio }

class function TFabricaRepositorio.GetRepositorio(NomeDaEntidade: String) :TRepositorio;
begin
   result           := nil;
   NomeDaEntidade   := Trim(NomeDaEntidade);

   if      (NomeDaEntidade  = 'TUsuario')                   then result := TRepositorioUsuario.Create
   else if (NomeDaEntidade  = 'TDiretorioBackup')           then result := TRepositorioDiretorioBackup.Create
   else if (NomeDaEntidade  = 'TPerfil')                    then result := TRepositorioPerfil.Create
   else if (NomeDaEntidade  = 'TAuditoria')                 then result := TRepositorioAuditoria.Create
   else if (NomeDaEntidade  = 'TCampoIncluidoAuditoria')    then result := TRepositorioCampoIncluidoAuditoria.Create
   else if (NomeDaEntidade  = 'TCampoExcluidoAuditoria')    then result := TRepositorioCampoExcluidoAuditoria.Create
   else if (NomeDaEntidade  = 'TCampoAlteradoAuditoria')    then result := TRepositorioCampoAlteradoAuditoria.Create
   else if (NomeDaEntidade  = 'TManutencaoSistema')         then result := TRepositorioManutencaoSistema.Create
   else if (NomeDaEntidade  = 'TPessoa')                    then result := TRepositorioPessoa.Create
   else if (NomeDaEntidade  = 'TEndereco')                  then result := TRepositorioEndereco.Create
   else if (NomeDaEntidade  = 'TTabelaPreco')               then result := TRepositorioTabelaPreco.Create
   else if (NomeDaEntidade  = 'TCor')                       then result := TRepositorioCor.Create
   else if (NomeDaEntidade  = 'TCliente')                   then result := TRepositorioCliente.Create
   else if (NomeDaEntidade  = 'TTamanho')                   then result := TRepositorioTamanho.Create
   else if (NomeDaEntidade  = 'TGrade')                     then result := TRepositorioGrade.Create
   else if (NomeDaEntidade  = 'TGrade_Tamanhos')            then result := TRepositorioGrade_Tamanhos.Create
   else if (NomeDaEntidade  = 'TFormaPagamento')            then result := TRepositorioFormaPagamento.Create
   else if (NomeDaEntidade  = 'TFormaPagamentoParcelas')    then result := TRepositorioFormaPagamentoParcelas.Create
   else if (NomeDaEntidade  = 'TProduto')                   then result := TRepositorioProduto.Create
   else if (NomeDaEntidade  = 'TProdutoCores')              then result := TRepositorioProdutoCores.Create
   else if (NomeDaEntidade  = 'TProdutoTabelaPreco')        then result := TRepositorioProdutoTabelaPreco.Create
   else if (NomeDaEntidade  = 'TCodigoBarras')              then result := TRepositorioCodigoBarras.Create
   else if (NomeDaEntidade  = 'TEmpresa')                   then result := TRepositorioEmpresa.Create
   else if (NomeDaEntidade  = 'TCliente_Representante')     then result := TRepositorioClienteRepresentante.Create
   else if (NomeDaEntidade  = 'TPedido')                    then result := TRepositorioPedido.Create
   else if (NomeDaEntidade  = 'TItem')                      then result := TRepositorioItem.Create
   else if (NomeDaEntidade  = 'TNaturezaOperacao')          then result := TRepositorioNaturezaOperacao.Create
   else if (NomeDaEntidade  = 'TPedidoFaturado')            then result := TRepositorioPedidoFaturado.Create
   else if (NomeDaEntidade  = 'TConfiguracoesNF')           then result := TRepositorioConfiguracoesNF.Create
   else if (NomeDaEntidade  = 'TIcms00')                    then result := TRepositorioIcms00.Create
   else if (NomeDaEntidade  = 'TIcmsSn101')                 then result := TRepositorioIcmsSn101.Create
   else if (NomeDaEntidade  = 'TIpiTrib')                   then result := TRepositorioIpiTrib.Create
   else if (NomeDaEntidade  = 'TIpiNt')                     then result := TRepositorioIpiNt.Create
   else if (NomeDaEntidade  = 'TPisAliq')                   then result := TRepositorioPisAliq.Create
   else if (NomeDaEntidade  = 'TPisNt')                     then result := TRepositorioPisNt.Create
   else if (NomeDaEntidade  = 'TCofinsAliq')                then result := TRepositorioCofinsAliq.Create
   else if (NomeDaEntidade  = 'TCofinsNt')                  then result := TRepositorioCofinsNt.Create
   else if (NomeDaEntidade  = 'TItemNotaFiscal')            then result := TRepositorioItemNotaFiscal.Create
   else if (NomeDaEntidade  = 'TLocalEntregaNotaFiscal')    then result := TRepositorioLocalEntregaNotaFiscal.Create
   else if (NomeDaEntidade  = 'TObservacaoNotaFiscal')      then result := TRepositorioObservacoesNotaFiscal.Create
   else if (NomeDaEntidade  = 'TNotaFiscal')                then result := TRepositorioNotaFiscal.Create
   else if (NomeDaEntidade  = 'TVolumesNotaFiscal')         then result := TRepositorioVolumesNotafiscal.Create
   else if (NomeDaEntidade  = 'TTotaisNotaFiscal')          then result := TRepositorioTotaisNotaFiscal.Create
   else if (NomeDaEntidade  = 'TLoteNFe')                   then result := TRepositorioLoteNFe.Create
   else if (NomeDaEntidade  = 'TRetornoLoteNFe')            then result := TRepositorioRetornoLoteNFe.Create
   else if (NomeDaEntidade  = 'TNFe')                       then result := TRepositorioNFe.Create
   else if (NomeDaEntidade  = 'TRetornoNFe')                then result := TRepositorioRetornoNFe.Create
   else if (NomeDaEntidade  = 'TConfiguracoesNFEmail')      then result := TRepositorioConfiguracoesNFEmail.Create
   else if (NomeDaEntidade  = 'TItemAvulso')                then result := TRepositorioItemAvulso.Create
   else if (NomeDaEntidade  = 'TQuantidadeItemAvulso')      then result := TRepositorioQuantidadeItemAvulso.Create
   else if (NomeDaEntidade  = 'TMateria')                   then result := TRepositorioMateria.Create
   else if (NomeDaEntidade  = 'TItemNfMateria')             then result := TRepositorioItemNfMateria.Create
   else if (NomeDaEntidade  = 'TMateriaFornecedor')         then result := TRepositorioMateriaFornecedor.Create
   else if (NomeDaEntidade  = 'TCFOPCorrespondente')        then result := TRepositorioCFOPCorrespondente.Create
   else if (NomeDaEntidade  = 'TLancamento')                then result := TRepositorioLancamento.Create
   else if (NomeDaEntidade  = 'TComissaoRepresentante')     then result := TRepositorioComissaoRepresentante.Create
   else if (NomeDaEntidade  = 'TComissaoHasLancamentos')    then result := TRepositorioComissaoHasLancamentos.Create
   else if (NomeDaEntidade  = 'TCidade')                    then result := TRepositorioCidade.Create
   else if (NomeDaEntidade  = 'TEstado')                    then result := TRepositorioEstado.Create
   else if (NomeDaEntidade  = 'TContador')                  then result := TRepositorioContador.Create
   else if (NomeDaEntidade  = 'TConferenciaPedido')         then result := TRepositorioConferenciaPedido.Create
   else if (NomeDaEntidade  = 'TConferenciaItem')           then result := TRepositorioConferenciaItem.Create
   else if (NomeDaEntidade  = 'TCaixas')                    then result := TRepositorioCaixas.Create
   else if (NomeDaEntidade  = 'TEstoque')                   then result := TRepositorioEstoque.Create   
   else if (NomeDaEntidade  = 'TParametros')                then result := TRepositorioParametros.Create
   else if (NomeDaEntidade  = 'TCorFilha')                  then result := TRepositorioCorFilha.Create
   else if (NomeDaEntidade  = 'TColecao')                   then result := TRepositorioColecao.Create
   else if (NomeDaEntidade  = 'TIcmsEstado')                then result := TRepositorioIcmsEstado.Create
   else if (NomeDaEntidade  = 'TIntervaloProducao')         then result := TRepositorioIntervaloProducao.Create
   else if (NomeDaEntidade  = 'TEntradaSaida')              then result := TRepositorioEntradaSaida.Create
   else if (NomeDaEntidade  = 'TAliqInternaIcms')           then result := TRepositorioAliqInternaIcms.Create            
   else if (NomeDaEntidade  = 'TContasPagar')               then result := TRepositorioContasPagar.Create
   else if (NomeDaEntidade  = 'TItemConta')                 then result := TRepositorioItemConta.Create
   else if (NomeDaEntidade  = 'TParcela')                   then result := TRepositorioParcela.Create
   else if (NomeDaEntidade  = 'TProdutosKit')               then result := TRepositorioProdutosKit.Create
   else if (NomeDaEntidade  = 'TCoresKit')                  then result := TRepositorioCoresKit.Create
   else if (NomeDaEntidade  = 'TContaBanco')                then result := TRepositorioContaBanco.Create
   else if (NomeDaEntidade  = 'TNFCe')                      then result := TRepositorioNFCe.Create
   else if (NomeDaEntidade  = 'TParametrosNFCe')            then result := TRepositorioParametrosNFCe.Create
   else if (NomeDaEntidade  = 'TMovimento')                 then result := TRepositorioMovimento.Create
   else if (NomeDaEntidade  = 'TOrdemServico')              then result := TRepositorioOrdemServico.Create
   else if (NomeDaEntidade  = 'TNcmIBPT')                   then result := TRepositorioNcmIBPT.Create
   else if (NomeDaEntidade  = 'TCaixa')                     then result := TRepositorioCaixa.Create
   else if (NomeDaEntidade  = 'TEntradaSaidaMoeda')         then result := TRepositorioEntradaSaidaMoeda.Create

   else begin
     dm.LogErros.AdicionaErro('FabricaRepositorio', 'TExcecaoRepositorioNaoEncontrado', 'Repositório para a '+ NomeDaEntidade + ' não foi encontrado!');
     raise TExcecaoRepositorioNaoEncontrado.Create(NomeDaEntidade);
   end;
end;

end.
