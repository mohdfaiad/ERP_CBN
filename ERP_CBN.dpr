program ERP_CBN;

uses
  Forms,
  MidasLib,
  Midas,
  windows,
  uPadrao in 'src\formularios\uPadrao.pas' {frmPadrao},
  uModulo in 'src\infraestrutura\uModulo.pas' {dm: TDataModule},
  LogErros in 'src\infraestrutura\LogErros.pas',
  uInputBox in 'src\formularios\uInputBox.pas' {frmInputBox},
  uInicial in 'src\formularios\uInicial.pas' {frmInicial},
  uAvisar in 'src\formularios\uAvisar.pas' {frmAvisar},
  ArquivoConfiguracao in 'src\infraestrutura\ArquivoConfiguracao.pas',
  TipoBanco in 'src\infraestrutura\tipo\TipoBanco.pas',
  ExcecaoBancoInvalido in 'src\infraestrutura\excecao\ExcecaoBancoInvalido.pas',
  ExcecaoBancoDeDadosInvalido in 'src\infraestrutura\excecao\ExcecaoBancoDeDadosInvalido.pas',
  ExcecaoBancoDeBackupInvalido in 'src\infraestrutura\excecao\ExcecaoBancoDeBackupInvalido.pas',
  uConfiguraBancoDeDados in 'src\formularios\uConfiguraBancoDeDados.pas' {frmConfiguraBancoDeDados},
  Repositorio in 'src\infraestrutura\persistencia\Repositorio.pas',
  Usuario in 'src\dominio\entidade\Usuario.pas',
  RepositorioUsuario in 'src\infraestrutura\persistencia\RepositorioUsuario.pas',
  Perfil in 'src\dominio\entidade\Perfil.pas',
  RepositorioPerfil in 'src\infraestrutura\persistencia\RepositorioPerfil.pas',
  PermissoesAcesso in 'src\dominio\entidade\PermissoesAcesso.pas',
  uSupervisor in 'src\formularios\uSupervisor.pas' {frmSupervisor},
  uLogin in 'src\formularios\uLogin.pas' {frmLogin},
  FabricaRepositorio in 'src\infraestrutura\persistencia\FabricaRepositorio.pas',
  ExcecaoRepositorioNaoEncontrado in 'src\infraestrutura\persistencia\excecao\ExcecaoRepositorioNaoEncontrado.pas',
  RepositorioDiretorioBackup in 'src\infraestrutura\persistencia\RepositorioDiretorioBackup.pas',
  uCadastroPerfilAcesso in 'src\formularios\uCadastroPerfilAcesso.pas' {frmCadastroPerfilAcesso},
  Especificacao in 'src\dominio\objetoValor\especificacao\Especificacao.pas',
  ExcecaoMetodoNaoImplementado in 'src\dominio\excecao\ExcecaoMetodoNaoImplementado.pas',
  EspecificacaoDiretorioBackupComUsuarioIgualA in 'src\dominio\objetoValor\especificacao\EspecificacaoDiretorioBackupComUsuarioIgualA.pas',
  ExcecaoParametroInvalido in 'src\dominio\excecao\ExcecaoParametroInvalido.pas',
  ExcecaoAtributoDuplicado in 'src\dominio\excecao\ExcecaoAtributoDuplicado.pas',
  uCadastroUsuario in 'src\formularios\uCadastroUsuario.pas' {frmCadastroUsuario},
  uConfirmacaoUsuario in 'src\formularios\uConfirmacaoUsuario.pas' {frmConfirmacaoUsuario},
  Criptografia in 'src\dominio\objetoValor\Criptografia.pas',
  DiretorioBackup in 'src\dominio\entidade\DiretorioBackup.pas',
  uBackup in 'src\formularios\uBackup.pas' {frmBackup},
  ServicoBackup in 'src\infraestrutura\servico\ServicoBackup.pas',
  uPesquisaSimples in 'src\formularios\uPesquisaSimples.pas' {frmPesquisaSimples},
  ObjetoGenerico in 'src\infraestrutura\persistencia\ObjetoGenerico.pas',
  EventoExecutandoOperacao in 'src\formularios\eventos\EventoExecutandoOperacao.pas',
  Auditoria in 'src\dominio\entidade\auditoria\Auditoria.pas',
  RepositorioCampoIncluidoAuditoria in 'src\infraestrutura\persistencia\RepositorioCampoIncluidoAuditoria.pas',
  RepositorioCampoExcluidoAuditoria in 'src\infraestrutura\persistencia\RepositorioCampoExcluidoAuditoria.pas',
  RepositorioAuditoria in 'src\infraestrutura\persistencia\RepositorioAuditoria.pas',
  RepositorioCampoAuditoria in 'src\infraestrutura\persistencia\RepositorioCampoAuditoria.pas',
  CampoAuditoria in 'src\dominio\entidade\auditoria\CampoAuditoria.pas',
  CampoAlteracaoAuditoria in 'src\dominio\entidade\auditoria\CampoAlteracaoAuditoria.pas',
  RepositorioCampoAlteradoAuditoria in 'src\infraestrutura\persistencia\RepositorioCampoAlteradoAuditoria.pas',
  EspecificacaoUsuarioComLoginIgualA in 'src\dominio\objetoValor\especificacao\EspecificacaoUsuarioComLoginIgualA.pas',
  uCadastroCliente in 'src\formularios\uCadastroCliente.pas' {frmCadastroCliente},
  Endereco in 'src\dominio\entidade\Endereco.pas',
  RepositorioEndereco in 'src\infraestrutura\persistencia\RepositorioEndereco.pas',
  ServicoAtualizadorBD in 'src\infraestrutura\servico\atualizacao\ServicoAtualizadorBD.pas',
  Parametros in 'src\dominio\entidade\Parametros.pas',
  BuscadorDeAtualizacoesBD in 'src\infraestrutura\servico\BuscadorDeAtualizacoesBD.pas',
  ExcecaoScriptDeAtualizacaoInvalido in 'src\infraestrutura\excecao\ExcecaoScriptDeAtualizacaoInvalido.pas',
  uScriptsDeAtualizacao in 'src\formularios\uScriptsDeAtualizacao.pas' {frmScriptsDeAtualizacao},
  ManutencaoSistema in 'src\dominio\entidade\ManutencaoSistema.pas',
  RepositorioManutencaoSistema in 'src\infraestrutura\persistencia\RepositorioManutencaoSistema.pas',
  RepositorioParametros in 'src\infraestrutura\persistencia\RepositorioParametros.pas',
  ExcecaoSistemaEmManutencao in 'src\infraestrutura\excecao\ExcecaoSistemaEmManutencao.pas',
  uManutencaoSistema in 'src\formularios\uManutencaoSistema.pas' {frmManutencaoSistema},
  RepositorioPessoa in 'src\infraestrutura\persistencia\RepositorioPessoa.pas',
  Pessoa in 'src\dominio\entidade\Pessoa.pas',
  ServicoVerificadorSistemaEmManutencao in 'src\infraestrutura\servico\ServicoVerificadorSistemaEmManutencao.pas',
  EventoAvisar in 'src\formularios\eventos\EventoAvisar.pas',
  EventoFechar in 'src\formularios\eventos\EventoFechar.pas',
  EventoExecutarOperacao in 'src\formularios\eventos\EventoExecutarOperacao.pas',
  uCadastroRepresentante in 'src\formularios\uCadastroRepresentante.pas' {frmPadrao1},
  uCadastroFornecedor in 'src\formularios\uCadastroFornecedor.pas' {frmCadastroFornecedor},
  uCadastroTabelaPreco in 'src\formularios\uCadastroTabelaPreco.pas' {frmCadastroTabelaPreco},
  TabelaPreco in 'src\dominio\entidade\TabelaPreco.pas',
  RepositorioTabelaPreco in 'src\infraestrutura\persistencia\RepositorioTabelaPreco.pas',
  uCadastroCores in 'src\formularios\uCadastroCores.pas' {frmCadastroCores},
  Cor in 'src\dominio\entidade\Cor.pas',
  RepositorioCor in 'src\infraestrutura\persistencia\RepositorioCor.pas',
  uCadastroFormasPagamento in 'src\formularios\uCadastroFormasPagamento.pas' {frmCadastroFormasPagamento},
  Cliente in 'src\dominio\entidade\Cliente.pas',
  RepositorioCliente in 'src\infraestrutura\persistencia\RepositorioCliente.pas',
  Tamanho in 'src\dominio\entidade\Tamanho.pas',
  RepositorioTamanho in 'src\infraestrutura\persistencia\RepositorioTamanho.pas',
  uCadastroTamanho in 'src\formularios\uCadastroTamanho.pas' {frmCadastroTamanho},
  Grade in 'src\dominio\entidade\Grade.pas',
  RepositorioGrade in 'src\infraestrutura\persistencia\RepositorioGrade.pas',
  uCadastroGrade in 'src\formularios\uCadastroGrade.pas' {frmCadastroGrade},
  RepositorioGrade_Tamanhos in 'src\infraestrutura\persistencia\RepositorioGrade_Tamanhos.pas',
  Grade_Tamanhos in 'src\dominio\entidade\Grade_Tamanhos.pas',
  FormaPagamento in 'src\dominio\entidade\FormaPagamento.pas',
  RepositorioFormaPagamento in 'src\infraestrutura\persistencia\RepositorioFormaPagamento.pas',
  FormaPagamentoParcelas in 'src\dominio\entidade\FormaPagamentoParcelas.pas',
  RepositorioFormaPagamentoParcelas in 'src\infraestrutura\persistencia\RepositorioFormaPagamentoParcelas.pas',
  uCadastroProduto in 'src\formularios\uCadastroProduto.pas' {frmCadastroProduto},
  Produto in 'src\dominio\entidade\Produto.pas',
  RepositorioProduto in 'src\infraestrutura\persistencia\RepositorioProduto.pas',
  ProdutoCores in 'src\dominio\entidade\ProdutoCores.pas',
  RepositorioProdutoCores in 'src\infraestrutura\persistencia\RepositorioProdutoCores.pas',
  ProdutoTabelaPreco in 'src\dominio\entidade\ProdutoTabelaPreco.pas',
  RepositorioProdutoTabelaPreco in 'src\infraestrutura\persistencia\RepositorioProdutoTabelaPreco.pas',
  CodigoBarras in 'src\dominio\entidade\CodigoBarras.pas',
  RepositorioCodigoBarras in 'src\infraestrutura\persistencia\RepositorioCodigoBarras.pas',
  uImpressaoEtiquetas in 'src\formularios\uImpressaoEtiquetas.pas' {frmImpressaoEtiquetas},
  uCadastroTransportadora in 'src\formularios\uCadastroTransportadora.pas' {frmCadastroTransportadora},
  uCadastroPadrao in 'src\formularios\uCadastroPadrao.pas' {frmCadastroPadrao},
  Empresa in 'src\dominio\entidade\Empresa.pas',
  TipoRegimeTributario in 'src\dominio\tipo\TipoRegimeTributario.pas',
  RepositorioEmpresa in 'src\infraestrutura\persistencia\RepositorioEmpresa.pas',
  uCadastroEmpresa in 'src\formularios\uCadastroEmpresa.pas' {frmCadastroEmpresa},
  EspecificacaoEnderecoComPessoaIgualA in 'src\dominio\objetoValor\especificacao\EspecificacaoEnderecoComPessoaIgualA.pas',
  uPedido in 'src\formularios\uPedido.pas' {frmPedido},
  TipoPessoa in 'src\dominio\tipo\TipoPessoa.pas',
  Pedido in 'src\dominio\entidade\Pedido.pas',
  Item in 'src\dominio\entidade\Item.pas',
  RepositorioPedido in 'src\infraestrutura\persistencia\RepositorioPedido.pas',
  RepositorioItem in 'src\infraestrutura\persistencia\RepositorioItem.pas',
  Cliente_Representante in 'src\dominio\entidade\Cliente_Representante.pas',
  RepositorioClienteRepresentante in 'src\infraestrutura\persistencia\RepositorioClienteRepresentante.pas',
  uRelatorioExpedicao in 'src\formularios\relatorios\uRelatorioExpedicao.pas' {frmRelatorioExpedicao},
  uRelatorioPedidoVenda in 'src\formularios\relatorios\uRelatorioPedidoVenda.pas' {frmRelatorioPedidoVenda},
  NaturezaOperacao in 'src\dominio\entidade\NaturezaOperacao.pas',
  TipoNaturezaOperacao in 'src\dominio\tipo\TipoNaturezaOperacao.pas',
  RepositorioNaturezaOperacao in 'src\infraestrutura\persistencia\RepositorioNaturezaOperacao.pas',
  uCadastroNaturezaOperacao in 'src\formularios\uCadastroNaturezaOperacao.pas' {frmCadastroNaturezaOperacao},
  ValidadorNaturezaOperacao in 'src\dominio\servico\ValidadorNaturezaOperacao.pas',
  ExcecaoCFOPDuplicada in 'src\dominio\excecao\ExcecaoCFOPDuplicada.pas',
  EspecificacaoNaturezaComCFOPIgualA in 'src\dominio\objetoValor\especificacao\EspecificacaoNaturezaComCFOPIgualA.pas',
  ExcecaoCFOPInvalida in 'src\dominio\excecao\ExcecaoCFOPInvalida.pas',
  NotaFiscal in 'src\dominio\entidade\NotaFiscal.pas',
  TipoFrete in 'src\dominio\tipo\TipoFrete.pas',
  TipoSerie in 'src\dominio\tipo\TipoSerie.pas',
  uFaturamentoPedidos in 'src\formularios\uFaturamentoPedidos.pas' {frmFaturamentoPedidos},
  uPesquisaDestinatario in 'src\formularios\uPesquisaDestinatario.pas' {frmPesquisaDestinatario},
  EspecificacaoApenasDestinatarios in 'src\dominio\objetoValor\especificacao\EspecificacaoApenasDestinatarios.pas',
  uPesquisaTransportadora in 'src\formularios\uPesquisaTransportadora.pas' {frmPesquisaTransportadora},
  EspecificacaoApenasTransportadoras in 'src\dominio\objetoValor\especificacao\EspecificacaoApenasTransportadoras.pas',
  EspecificacaoTransportadoraComCodigoIgualA in 'src\dominio\objetoValor\especificacao\EspecificacaoTransportadoraComCodigoIgualA.pas',
  EspecificacaoDestinatarioComCodigoIgualA in 'src\dominio\objetoValor\especificacao\EspecificacaoDestinatarioComCodigoIgualA.pas',
  ExcecaoNotaFiscalInvalida in 'src\dominio\excecao\ExcecaoNotaFiscalInvalida.pas',
  EspecificacaoPedidosAprovadosNaoFaturados in 'src\dominio\objetoValor\especificacao\EspecificacaoPedidosAprovadosNaoFaturados.pas',
  TipoSituacaoPedido in 'src\dominio\tipo\TipoSituacaoPedido.pas',
  RepositorioPedidoFaturado in 'src\infraestrutura\persistencia\RepositorioPedidoFaturado.pas',
  PedidoFaturado in 'src\dominio\entidade\PedidoFaturado.pas',
  MetodoDelegadoVerificaPedidoFaturado in 'src\dominio\metodoDelegado\MetodoDelegadoVerificaPedidoFaturado.pas',
  EspecificacaoPedidoFaturado in 'src\dominio\objetoValor\especificacao\EspecificacaoPedidoFaturado.pas',
  EspecificacaoItensDoPedido in 'src\dominio\objetoValor\especificacao\EspecificacaoItensDoPedido.pas',
  VolumesNotaFiscal in 'src\dominio\objetoValor\VolumesNotaFiscal.pas',
  TotaisNotaFiscal in 'src\dominio\objetoValor\TotaisNotaFiscal.pas',
  MetodoDelegadoSomarCampoEspecificoReal in 'src\dominio\metodoDelegado\MetodoDelegadoSomarCampoEspecificoReal.pas',
  MetodoDelegadoSomarCampoEspecificoInteger in 'src\dominio\metodoDelegado\MetodoDelegadoSomarCampoEspecificoInteger.pas',
  MetodoDelegadoObtemCampoInteger in 'src\dominio\metodoDelegado\MetodoDelegadoObtemCampoInteger.pas',
  MetodoDelegadoObtemCampoReal in 'src\dominio\metodoDelegado\MetodoDelegadoObtemCampoReal.pas',
  uImpressaoEtiquetasCoppel in 'src\formularios\uImpressaoEtiquetasCoppel.pas' {frmImpressaoEtiquetasCoppel},
  MetodoDelegadoAposAtualizarNotaFiscal in 'src\dominio\metodoDelegado\MetodoDelegadoAposAtualizarNotaFiscal.pas',
  ItemNotaFiscal in 'src\dominio\objetoValor\ItemNotaFiscal.pas',
  Icms20 in 'src\dominio\objetoValor\Icms20.pas',
  TipoOrigemMercadoria in 'src\dominio\tipo\TipoOrigemMercadoria.pas',
  TributacaoItemNotaFiscal in 'src\dominio\objetoValor\TributacaoItemNotaFiscal.pas',
  IcmsSn101 in 'src\dominio\objetoValor\IcmsSn101.pas',
  IpiNt in 'src\dominio\objetoValor\IpiNt.pas',
  PisNt in 'src\dominio\objetoValor\PisNt.pas',
  CofinsNt in 'src\dominio\objetoValor\CofinsNt.pas',
  PisAliq in 'src\dominio\objetoValor\PisAliq.pas',
  CofinsAliq in 'src\dominio\objetoValor\CofinsAliq.pas',
  IpiTrib in 'src\dominio\objetoValor\IpiTrib.pas',
  ObservacaoNotaFiscal in 'src\dominio\objetoValor\ObservacaoNotaFiscal.pas',
  MetodoDelegadoObtemCampoBoolean in 'src\dominio\metodoDelegado\MetodoDelegadoObtemCampoBoolean.pas',
  MetodoDelegadoObtemCampoString in 'src\dominio\metodoDelegado\MetodoDelegadoObtemCampoString.pas',
  uConfiguracoesNF in 'src\formularios\uConfiguracoesNF.pas' {frmConfiguracoesNF},
  ConfiguracoesNF in 'src\dominio\entidade\ConfiguracoesNF.pas',
  RepositorioConfiguracoesNF in 'src\infraestrutura\persistencia\RepositorioConfiguracoesNF.pas',
  Icms00 in 'src\dominio\objetoValor\Icms00.pas',
  LocalEntregaNotaFiscal in 'src\dominio\objetoValor\LocalEntregaNotaFiscal.pas',
  StringUtilitario in 'src\dominio\utilitario\StringUtilitario.pas',
  ExcecaoCampoNaoInformado in 'src\dominio\excecao\ExcecaoCampoNaoInformado.pas',
  RepositorioNotaFiscal in 'src\infraestrutura\persistencia\RepositorioNotaFiscal.pas',
  RepositorioItemNotaFiscal in 'src\infraestrutura\persistencia\RepositorioItemNotaFiscal.pas',
  RepositorioIcms00 in 'src\infraestrutura\persistencia\RepositorioIcms00.pas',
  RepositorioIpiTrib in 'src\infraestrutura\persistencia\RepositorioIpiTrib.pas',
  RepositorioPisAliq in 'src\infraestrutura\persistencia\RepositorioPisAliq.pas',
  RepositorioCofinsAliq in 'src\infraestrutura\persistencia\RepositorioCofinsAliq.pas',
  RepositorioIcmsSn101 in 'src\infraestrutura\persistencia\RepositorioIcmsSn101.pas',
  RepositorioIpiNt in 'src\infraestrutura\persistencia\RepositorioIpiNt.pas',
  RepositorioPisNt in 'src\infraestrutura\persistencia\RepositorioPisNt.pas',
  RepositorioCofinsNt in 'src\infraestrutura\persistencia\RepositorioCofinsNt.pas',
  RepositorioLocalEntregaNotaFiscal in 'src\infraestrutura\persistencia\RepositorioLocalEntregaNotaFiscal.pas',
  RepositorioObservacoesNotaFiscal in 'src\infraestrutura\persistencia\RepositorioObservacoesNotaFiscal.pas',
  RepositorioVolumesNotaFiscal in 'src\infraestrutura\persistencia\RepositorioVolumesNotaFiscal.pas',
  RepositorioTotaisNotaFiscal in 'src\infraestrutura\persistencia\RepositorioTotaisNotaFiscal.pas',
  EspecificacaoItensDaNotaFiscal in 'src\dominio\objetoValor\especificacao\EspecificacaoItensDaNotaFiscal.pas',
  EspecificacaoNaturezaPorTipo in 'src\dominio\objetoValor\especificacao\EspecificacaoNaturezaPorTipo.pas',
  uMonitorControleNFe in 'src\formularios\uMonitorControleNFe.pas' {frmMonitorControleNFe},
  TipoStatusNotaFiscal in 'src\dominio\tipo\TipoStatusNotaFiscal.pas',
  EspecificacaoNotaFiscalPorPeriodoEStatus in 'src\dominio\objetoValor\especificacao\EspecificacaoNotaFiscalPorPeriodoEStatus.pas',
  ExcecaoPeriodoInvalido in 'src\dominio\excecao\ExcecaoPeriodoInvalido.pas',
  EspecificacaoEmpresaPorCodigoPessoa in 'src\dominio\objetoValor\especificacao\EspecificacaoEmpresaPorCodigoPessoa.pas',
  uImpressaoEtiquetaCaixa in 'src\formularios\uImpressaoEtiquetaCaixa.pas' {frmImpressaoEtiquetaCaixa},
  GeradorNFe in 'src\infraestrutura\servico\GeradorNFe.pas',
  uImpressaoEtiquetasPicorrucho in 'src\formularios\uImpressaoEtiquetasPicorrucho.pas' {frmImpressaoEtiquetasPicorrucho},
  TipoAmbienteNFe in 'src\dominio\tipo\TipoAmbienteNFe.pas',
  LoteNFe in 'src\dominio\entidade\LoteNFe.pas',
  RetornoLoteNFe in 'src\dominio\entidade\RetornoLoteNFe.pas',
  NFe in 'src\dominio\entidade\NFe.pas',
  RetornoNFe in 'src\dominio\entidade\RetornoNFe.pas',
  EspecificacaoLoteNFePorCodigoNotaFiscal in 'src\dominio\objetoValor\especificacao\EspecificacaoLoteNFePorCodigoNotaFiscal.pas',
  RepositorioLoteNFe in 'src\infraestrutura\persistencia\RepositorioLoteNFe.pas',
  RepositorioRetornoLoteNFe in 'src\infraestrutura\persistencia\RepositorioRetornoLoteNFe.pas',
  RepositorioNFe in 'src\infraestrutura\persistencia\RepositorioNFe.pas',
  RepositorioRetornoNFe in 'src\infraestrutura\persistencia\RepositorioRetornoNFe.pas',
  DateTimeUtilitario in 'src\dominio\utilitario\DateTimeUtilitario.pas',
  ConfiguracoesNFEmail in 'src\dominio\objetoValor\ConfiguracoesNFEmail.pas',
  RepositorioConfiguracoesNFEmail in 'src\infraestrutura\persistencia\RepositorioConfiguracoesNFEmail.pas',
  GeradorFinanceiro in 'src\dominio\servico\GeradorFinanceiro.pas',
  Fatura in 'src\dominio\entidade\Fatura.pas',
  Duplicata in 'src\dominio\entidade\Duplicata.pas',
  EspecificacaoParcelasPorFormaPagamento in 'src\dominio\objetoValor\especificacao\EspecificacaoParcelasPorFormaPagamento.pas',
  uInformacoesPessoa in 'src\formularios\uInformacoesPessoa.pas' {frmInformacoesPessoa},
  EspecificacaoGradeTamanhoPorCodigoGrade in 'src\dominio\objetoValor\especificacao\EspecificacaoGradeTamanhoPorCodigoGrade.pas',
  uItensAvulsos in 'src\formularios\uItensAvulsos.pas' {frmItensAvulsos},
  ItemAvulso in 'src\dominio\objetoValor\ItemAvulso.pas',
  QuantidadeItemAvulso in 'src\dominio\objetoValor\QuantidadeItemAvulso.pas',
  RepositorioQuantidadeItemAvulso in 'src\infraestrutura\persistencia\RepositorioQuantidadeItemAvulso.pas',
  RepositorioItemAvulso in 'src\infraestrutura\persistencia\RepositorioItemAvulso.pas',
  EspecificacaoTamanhoPorDescricao in 'src\dominio\objetoValor\especificacao\EspecificacaoTamanhoPorDescricao.pas',
  uRelatorioPedidosProducao in 'src\formularios\relatorios\uRelatorioPedidosProducao.pas' {frmRelatorioPedidosProducao},
  EspecificacaoClientePorCodigoPessoa in 'src\dominio\objetoValor\especificacao\EspecificacaoClientePorCodigoPessoa.pas',
  uEntradaNota in 'src\formularios\uEntradaNota.pas' {frmEntradaNota},
  importadorNotaXML in 'src\dominio\utilitario\importadorNotaXML.pas',
  Materia in 'src\dominio\entidade\Materia.pas',
  ItemNfMateria in 'src\dominio\entidade\ItemNfMateria.pas',
  RepositorioMateria in 'src\infraestrutura\persistencia\RepositorioMateria.pas',
  uCadastroMateria in 'src\formularios\uCadastroMateria.pas' {frmCadastroMateria},
  MateriaFornecedor in 'src\dominio\entidade\MateriaFornecedor.pas',
  RepositorioMateriaFornecedor in 'src\infraestrutura\persistencia\RepositorioMateriaFornecedor.pas',
  uCadastroCfopCorrespondente in 'src\formularios\uCadastroCfopCorrespondente.pas' {frmCadastroCfopCorrespondente},
  CFOPCorrespondente in 'src\dominio\entidade\CFOPCorrespondente.pas',
  RepositorioCFOPCorrespondente in 'src\infraestrutura\persistencia\RepositorioCFOPCorrespondente.pas',
  Funcoes in 'src\infraestrutura\Funcoes.pas',
  uRelatorioVendas in 'src\formularios\relatorios\uRelatorioVendas.pas' {frmRelatorioVendas},
  RepositorioItemNfMateria in 'src\infraestrutura\persistencia\RepositorioItemNfMateria.pas',
  uRelatorioRaioXRepresentante in 'src\formularios\relatorios\uRelatorioRaioXRepresentante.pas' {frmRelatorioRaioXRepresentante},
  uRelatorioNotaEntrada in 'src\formularios\relatorios\uRelatorioNotaEntrada.pas' {frmRelatorioNotaEntrada},
  EspecificacaoNotaFiscalPorPeriodoTipoEmpresa in 'src\dominio\objetoValor\especificacao\EspecificacaoNotaFiscalPorPeriodoTipoEmpresa.pas',
  uRelatorioClientes in 'src\formularios\relatorios\uRelatorioClientes.pas' {frmRelatorioClientes},
  uRelatorioReferencias in 'src\formularios\relatorios\uRelatorioReferencias.pas' {frmRelatorioReferencias},
  uFechaComissaoRepresentante in 'src\formularios\uFechaComissaoRepresentante.pas' {frmFechaComissaoRepresentante},
  RepositorioLancamento in 'src\infraestrutura\persistencia\RepositorioLancamento.pas',
  Lancamento in 'src\dominio\entidade\Lancamento.pas',
  TipoLancamento in 'src\formularios\tipos\TipoLancamento.pas',
  EspecificacaoLancamentosPeriodoTipo in 'src\dominio\objetoValor\especificacao\EspecificacaoLancamentosPeriodoTipo.pas',
  uLancamentos in 'src\formularios\uLancamentos.pas' {frmLancamentos},
  ComissaoRepresentante in 'src\dominio\entidade\ComissaoRepresentante.pas',
  RepositorioComissaoRepresentante in 'src\infraestrutura\persistencia\RepositorioComissaoRepresentante.pas',
  EspecificacaoCodigosLancamentoPorCodigoComissao in 'src\dominio\objetoValor\especificacao\EspecificacaoCodigosLancamentoPorCodigoComissao.pas',
  ComissaoHasLancamentos in 'src\dominio\entidade\ComissaoHasLancamentos.pas',
  RepositorioComissaoHasLancamentos in 'src\infraestrutura\persistencia\RepositorioComissaoHasLancamentos.pas',
  EspecificacaoComissaoRepresentantePorAnoMes in 'src\dominio\objetoValor\especificacao\EspecificacaoComissaoRepresentantePorAnoMes.pas',
  uSintegra in 'src\formularios\uSintegra.pas' {frmSintegra},
  GeradorSintegra in 'src\dominio\objetoValor\GeradorSintegra.pas',
  Cidade in 'src\dominio\entidade\Cidade.pas',
  Estado in 'src\dominio\entidade\Estado.pas',
  RepositorioCidade in 'src\infraestrutura\persistencia\RepositorioCidade.pas',
  RepositorioEstado in 'src\infraestrutura\persistencia\RepositorioEstado.pas',
  Lista in 'src\dominio\utilitario\Lista.pas',
  Objeto in 'src\dominio\utilitario\Objeto.pas',
  EspecificacaoItemNfCfopAliq in 'src\dominio\objetoValor\especificacao\EspecificacaoItemNfCfopAliq.pas',
  EspecificacaoItensMateriaDaNotaFiscal in 'src\dominio\objetoValor\especificacao\EspecificacaoItensMateriaDaNotaFiscal.pas',
  uEFDContribuicoes in 'src\formularios\uEFDContribuicoes.pas' {frmEFDContribuicoes},
  GeradorEFDContribuicoes in 'src\dominio\objetoValor\GeradorEFDContribuicoes.pas',
  Contador in 'src\dominio\entidade\Contador.pas',
  RepositorioContador in 'src\infraestrutura\persistencia\RepositorioContador.pas',
  EFDPisCofinsFuncoes in 'src\dominio\objetoValor\EFDPisCofinsFuncoes.pas',
  uCadastroContador in 'src\formularios\uCadastroContador.pas' {frmCadastroContador},
  uAguarde in 'src\formularios\uAguarde.pas' {frmAguarde},
  uEFDFiscal in 'src\formularios\uEFDFiscal.pas' {frmEFDFiscal},
  GeradorEFDFiscal in 'src\dominio\objetoValor\GeradorEFDFiscal.pas',
  uRelatorioNotasFiscaisVenda in 'src\formularios\relatorios\uRelatorioNotasFiscaisVenda.pas' {frmRelatorioNotasFiscaisVenda},
  uFortesNotasFiscaisVenda in 'src\formularios\relatorios\Fortes\uFortesNotasFiscaisVenda.pas' {frmFortesNotasFiscaisVenda},
  uConferenciaPedido in 'src\formularios\uConferenciaPedido.pas' {frmConferenciaPedido},
  ConferenciaPedido in 'src\dominio\entidade\ConferenciaPedido.pas',
  ConferenciaItem in 'src\dominio\entidade\ConferenciaItem.pas',
  RepositorioConferenciaItem in 'src\infraestrutura\persistencia\RepositorioConferenciaItem.pas',
  RepositorioConferenciaPedido in 'src\infraestrutura\persistencia\RepositorioConferenciaPedido.pas',
  EspecificacaoConferenciaPorCodigoPedido in 'src\dominio\objetoValor\especificacao\EspecificacaoConferenciaPorCodigoPedido.pas',
  EspecificacaoItensConferenciaPedido in 'src\dominio\objetoValor\especificacao\EspecificacaoItensConferenciaPedido.pas',
  CriaBalaoInformacao in 'src\dominio\utilitario\CriaBalaoInformacao.pas',
  TipoBuscaPedido in 'src\dominio\tipo\TipoBuscaPedido.pas',
  EspecificacaoItemPorPedidoProdutoCor in 'src\dominio\objetoValor\especificacao\EspecificacaoItemPorPedidoProdutoCor.pas',
  Caixas in 'src\dominio\entidade\Caixas.pas',
  RepositorioCaixas in 'src\infraestrutura\persistencia\RepositorioCaixas.pas',
  uBuscaCodigoBarras in 'src\formularios\uBuscaCodigoBarras.pas' {frmBuscaCodigoBarras},
  uAtalhoCadastros in 'src\formularios\uAtalhoCadastros.pas' {frmAtalhoCadastros},
  uRelatorioRomaneio in 'src\formularios\relatorios\uRelatorioRomaneio.pas' {frmRelatorioRomaneio},
  uRelatorioMapaReferencias in 'src\formularios\relatorios\uRelatorioMapaReferencias.pas' {frmRelatorioMapaReferencias},
  Estoque in 'src\dominio\entidade\Estoque.pas',
  RepositorioEstoque in 'src\infraestrutura\persistencia\RepositorioEstoque.pas',
  uEntradaManualEstoque in 'src\formularios\uEntradaManualEstoque.pas' {frmEntradaManualEstoque},
  EspecificacaoEstoquePorProdutoCorTamanho in 'src\dominio\objetoValor\especificacao\EspecificacaoEstoquePorProdutoCorTamanho.pas',
  uCCe in 'src\formularios\uCCe.pas' {frmCCe},
  uImpCCE in 'src\formularios\uImpCCE.pas' {frm_impCCE},
  uRelatorioComissoesRepresentantes in 'src\formularios\relatorios\uRelatorioComissoesRepresentantes.pas' {frmRelatorioComissoesRepresentantes},
  EspecificacaoItemConferidoPorCodigoItem in 'src\dominio\objetoValor\especificacao\EspecificacaoItemConferidoPorCodigoItem.pas',
  EspecificacaoItemPorCodigo in 'src\dominio\objetoValor\especificacao\EspecificacaoItemPorCodigo.pas',
  uVisualizacaoPedidoSeparacao in 'src\formularios\relatorios\uVisualizacaoPedidoSeparacao.pas' {frmVisualizacaoPedidoSeparacao},
  CorFilha in 'src\dominio\entidade\CorFilha.pas',
  RepositorioCorFilha in 'src\infraestrutura\persistencia\RepositorioCorFilha.pas',
  EspecificacaoCoresFilhasPorCorPai in 'src\dominio\objetoValor\especificacao\EspecificacaoCoresFilhasPorCorPai.pas',
  uRelatorioTotalizarEstoque in 'src\formularios\relatorios\uRelatorioTotalizarEstoque.pas' {frmRelatorioTotalizarEstoque},
  EspecificacaoCaixaPorConferenciaItemCor in 'src\dominio\objetoValor\especificacao\EspecificacaoCaixaPorConferenciaItemCor.pas',
  uBuscarRomaneio in 'src\formularios\relatorios\uBuscarRomaneio.pas' {frmBuscarRomaneio},
  Unidade in 'src\dominio\entidade\Unidade.pas',
  RepositorioUnidade in 'src\infraestrutura\persistencia\RepositorioUnidade.pas',
  uRelatorioPrevisaoEstoque in 'src\formularios\relatorios\uRelatorioPrevisaoEstoque.pas' {frmRelatorioPrevisaoEstoque},
  Colecao in 'src\dominio\entidade\Colecao.pas',
  RepositorioColecao in 'src\infraestrutura\persistencia\RepositorioColecao.pas',
  uCadastroColecao in 'src\formularios\uCadastroColecao.pas' {frmCadastroColecao},
  EspecificacaoIcmsEstadoPorCodigoEstado in 'src\dominio\objetoValor\especificacao\EspecificacaoIcmsEstadoPorCodigoEstado.pas',
  IcmsEstado in 'src\dominio\entidade\IcmsEstado.pas',
  RepositorioIcmsEstado in 'src\infraestrutura\persistencia\RepositorioIcmsEstado.pas',
  uCadastroIntervaloProducao in 'src\formularios\uCadastroIntervaloProducao.pas' {frmCadastroIntervaloProducao},
  IntervaloProducao in 'src\dominio\entidade\IntervaloProducao.pas',
  RepositorioIntervaloProducao in 'src\infraestrutura\persistencia\RepositorioIntervaloProducao.pas',
  EntradaSaida in 'src\dominio\entidade\EntradaSaida.pas',
  RepositorioEntradaSaida in 'src\infraestrutura\persistencia\RepositorioEntradaSaida.pas',
  uRelatorioEntradas in 'src\formularios\relatorios\uRelatorioEntradas.pas' {frmRelatorioEntradas},
  AliqInternaIcms in 'src\dominio\entidade\AliqInternaIcms.pas',
  RepositorioAliqInternaIcms in 'src\infraestrutura\persistencia\RepositorioAliqInternaIcms.pas',
  EspecificacaoAliqInternaPorCodigoEstado in 'src\dominio\objetoValor\especificacao\EspecificacaoAliqInternaPorCodigoEstado.pas',
  ContasPagar in 'src\dominio\entidade\ContasPagar.pas',
  RepositorioContasPagar in 'src\infraestrutura\persistencia\RepositorioContasPagar.pas',
  uContasPagar in 'src\formularios\uContasPagar.pas' {frmContasPagar},
  uImportadadorClientesTricae in 'src\formularios\uImportadadorClientesTricae.pas' {frmImportadadorClientesTricae},
  EspecificacaoPessoaPorCpfCnpj in 'src\dominio\objetoValor\especificacao\EspecificacaoPessoaPorCpfCnpj.pas',
  EspecificacaoCidadePorNome in 'src\dominio\objetoValor\especificacao\EspecificacaoCidadePorNome.pas',
  EspecificacaoClienteHasRepresentantePorCodPessoa in 'src\dominio\objetoValor\especificacao\EspecificacaoClienteHasRepresentantePorCodPessoa.pas',
  ItemConta in 'src\dominio\entidade\ItemConta.pas',
  RepositorioItemConta in 'src\infraestrutura\persistencia\RepositorioItemConta.pas',
  RepositorioParcela in 'src\infraestrutura\persistencia\RepositorioParcela.pas',
  Parcela in 'src\dominio\entidade\Parcela.pas',
  EspecificacaoItensDaConta in 'src\dominio\objetoValor\especificacao\EspecificacaoItensDaConta.pas',
  EspecificacaoParcelasDaConta in 'src\dominio\objetoValor\especificacao\EspecificacaoParcelasDaConta.pas',
  EspecificacaoContaPorPeriodoTipo in 'src\dominio\objetoValor\especificacao\EspecificacaoContaPorPeriodoTipo.pas',
  uRelatorioContasPagar in 'src\formularios\relatorios\uRelatorioContasPagar.pas' {frmRelatorioContasPagar},
  ProdutosKit in 'src\dominio\entidade\ProdutosKit.pas',
  RepositorioProdutosKit in 'src\infraestrutura\persistencia\RepositorioProdutosKit.pas',
  EspecificacaoProdutosKit in 'src\dominio\objetoValor\especificacao\EspecificacaoProdutosKit.pas',
  CoresKit in 'src\dominio\entidade\CoresKit.pas',
  RepositorioCoresKit in 'src\infraestrutura\persistencia\RepositorioCoresKit.pas',
  EspecificacaoCoresKit in 'src\dominio\objetoValor\especificacao\EspecificacaoCoresKit.pas',
  uVisualizaPedidosNfes in 'src\formularios\uVisualizaPedidosNfes.pas' {Form1},
  frameBotaoImg in 'src\formularios\frameBotaoImg.pas' {BotaoImg: TFrame},
  frameBuscaCidade in 'src\formularios\frameBuscaCidade.pas' {BuscaCidade: TFrame},
  frameBuscaCliente in 'src\formularios\frameBuscaCliente.pas' {BuscaCliente: TFrame},
  frameBuscaContador in 'src\formularios\frameBuscaContador.pas' {BuscaContador: TFrame},
  frameBuscaCor in 'src\formularios\frameBuscaCor.pas' {BuscaCor: TFrame},
  frameBuscaDestinatario in 'src\formularios\frameBuscaDestinatario.pas' {BuscaDestinatario: TFrame},
  frameBuscaEmpresa in 'src\formularios\frameBuscaEmpresa.pas' {BuscaEmpresa: TFrame},
  frameBuscaEstado in 'src\formularios\frameBuscaEstado.pas' {BuscaEstado: TFrame},
  frameBuscaFormaPagamento in 'src\formularios\frameBuscaFormaPagamento.pas' {BuscaFormaPagamento: TFrame},
  frameBuscaMateria in 'src\formularios\frameBuscaMateria.pas' {BuscaMateria: TFrame},
  frameBuscaNaturezaOperacao in 'src\formularios\frameBuscaNaturezaOperacao.pas' {BuscaNaturezaOperacao: TFrame},
  frameBuscaNcm in 'src\formularios\frameBuscaNcm.pas' {BuscaNcm: TFrame},
  frameBuscaNotaFiscal in 'src\formularios\frameBuscaNotaFiscal.pas' {BuscaNotaFiscal: TFrame},
  frameBuscaPedido in 'src\formularios\frameBuscaPedido.pas' {BuscaPedido: TFrame},
  frameBuscaPessoa in 'src\formularios\frameBuscaPessoa.pas' {BuscaPessoa: TFrame},
  frameBuscaProduto in 'src\formularios\frameBuscaProduto.pas' {BuscaProduto: TFrame},
  frameBuscaProduto2 in 'src\formularios\frameBuscaProduto2.pas' {BuscaProduto2: TFrame},
  frameBuscaReferencia in 'src\formularios\frameBuscaReferencia.pas' {BuscaReferencia: TFrame},
  frameBuscaTabelaPreco in 'src\formularios\frameBuscaTabelaPreco.pas' {BuscaTabelaPreco: TFrame},
  frameBuscaTransportadora in 'src\formularios\frameBuscaTransportadora.pas' {BuscaTransportadora: TFrame},
  frameHorario in 'src\formularios\frameHorario.pas' {Horario: TFrame},
  frameListaCampo in 'src\formularios\frameListaCampo.pas' {ListaCampo: TFrame},
  frameMaskCpfCnpj in 'src\formularios\frameMaskCpfCnpj.pas' {MaskCpfCnpj: TFrame},
  frameRealEdit in 'src\formularios\frameRealEdit.pas' {RealEdit: TFrame},
  uGeraCotacao in 'src\formularios\uGeraCotacao.pas' {frmGeraCotacao},
  uPedidoConsumidorFinal in 'src\formularios\uPedidoConsumidorFinal.pas' {frmPedidoConsumidorFinal},
  uTransferenciaEstoque in 'src\formularios\uTransferenciaEstoque.pas' {frmTransferenciaEstoque},
  ContaBanco in 'src\dominio\entidade\ContaBanco.pas',
  RepositorioContaBanco in 'src\infraestrutura\persistencia\RepositorioContaBanco.pas',
  uCadastroContasBanco in 'src\formularios\uCadastroContasBanco.pas' {frmCadastroContasBanco},
  frameBuscaContaBanco in 'src\formularios\frameBuscaContaBanco.pas' {BuscaContaBanco: TFrame},
  ServicoEmissorNFCe in 'src\dominio\servico\ServicoEmissorNFCe.pas',
  Venda in 'src\dominio\objetoValor\Venda.pas',
  ItemVenda in 'src\dominio\objetoValor\ItemVenda.pas',
  CSOSNTributadoSNSemCredito in 'src\dominio\objetoValor\CSOSNTributadoSNSemCredito.pas',
  NcmIBPT in 'src\dominio\entidade\NcmIBPT.pas',
  CSTTributadoIntegralmente in 'src\dominio\objetoValor\CSTTributadoIntegralmente.pas',
  ParametrosNFCe in 'src\dominio\objetoValor\ParametrosNFCe.pas',
  CertificadoNFCE in 'src\dominio\objetoValor\CertificadoNFCE.pas',
  Token in 'src\dominio\objetoValor\Token.pas',
  TipoFormaEmissao in 'src\dominio\tipo\TipoFormaEmissao.pas',
  TipoVersaoDF in 'src\dominio\tipo\TipoVersaoDF.pas',
  ParametrosDANFE in 'src\dominio\objetoValor\ParametrosDANFE.pas',
  NFCE in 'src\dominio\entidade\NFCE.pas',
  EspecificacaoFiltraNFCe in 'src\dominio\objetoValor\especificacao\EspecificacaoFiltraNFCe.pas',
  ConfiguracoesNFCe in 'src\dominio\objetoValor\ConfiguracoesNFCe.pas',
  EspecificacaoMovimentosPorCodigoPedido in 'src\dominio\objetoValor\especificacao\EspecificacaoMovimentosPorCodigoPedido.pas',
  RepositorioNFCE in 'src\infraestrutura\persistencia\RepositorioNFCE.pas',
  RepositorioParametrosNFCe in 'src\infraestrutura\persistencia\RepositorioParametrosNFCe.pas',
  RepositorioMovimento in 'src\infraestrutura\persistencia\RepositorioMovimento.pas',
  Movimento in 'src\dominio\entidade\Movimento.pas',
  uRecebimentoPedido in 'src\formularios\uRecebimentoPedido.pas' {frmRecebimentoPedido},
  uRelatorioMovimentos in 'src\formularios\relatorios\uRelatorioMovimentos.pas' {frmRelatorioMovimentos},
  OrdemServico in 'src\dominio\entidade\OrdemServico.pas',
  RepositorioOrdemServico in 'src\infraestrutura\persistencia\RepositorioOrdemServico.pas',
  RepositorioNcmIBPT in 'src\infraestrutura\persistencia\RepositorioNcmIBPT.pas',
  frameBuscaNCMIbpt in 'src\formularios\frameBuscaNCMIbpt.pas' {BuscaNCMIbpt: TFrame},
  uImportadorOrdemServico in 'src\formularios\uImportadorOrdemServico.pas' {frmImportadorOrdemServico},
  frameBuscaOS in 'src\formularios\frameBuscaOS.pas' {BuscaOS: TFrame},
  EspecificacaoCaixaPorData in 'src\dominio\objetoValor\especificacao\EspecificacaoCaixaPorData.pas',
  uCaixa in 'src\formularios\uCaixa.pas' {frmCaixa},
  EspecificacaoMovimentosPorCodigoCaixa in 'src\dominio\objetoValor\especificacao\EspecificacaoMovimentosPorCodigoCaixa.pas',
  EspecificacaoMovimentosCaixa in 'src\dominio\objetoValor\especificacao\EspecificacaoMovimentosCaixa.pas',
  RepositorioCaixa in 'src\infraestrutura\persistencia\RepositorioCaixa.pas',
  Caixa in 'src\dominio\entidade\Caixa.pas',
  EntradaSaidaMoeda in 'src\dominio\entidade\EntradaSaidaMoeda.pas',
  RepositorioEntradaSaidaMoeda in 'src\infraestrutura\persistencia\RepositorioEntradaSaidaMoeda.pas',
  uEntradaSaidaMoeda in 'uEntradaSaidaMoeda.pas' {frmEntradaSaidaMoeda},
  uRelatorioCaixa in 'src\formularios\relatorios\uRelatorioCaixa.pas' {frmRelatorioCaixa};

{$R *.res}
{$R win7810.res}

var
  ConfiguraBanco :TfrmConfiguraBancoDeDados;
begin
  { FastMM4 }
//  FullDebugModeScanMemoryPoolBeforeEveryOperation := true;
//  SuppressMessageBoxes                            := false;
  { FastMM4 }

  Application.Initialize;
  Application.Title := 'ERP CBN';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmRelatorioMovimentos, frmRelatorioMovimentos);
  Application.CreateForm(TfrmImportadorOrdemServico, frmImportadorOrdemServico);
  Application.CreateForm(TfrmCaixa, frmCaixa);
  Application.CreateForm(TfrmEntradaSaidaMoeda, frmEntradaSaidaMoeda);
  Application.CreateForm(TfrmRelatorioCaixa, frmRelatorioCaixa);
  //------------------------------------------------------------------------------------------------//
  // Se n�o for encontrado o Banco de Dados, ent�o � solicitado para o us�rio configur�-lo.         //
  //------------------------------------------------------------------------------------------------//
  while not dm.IsConectadoBancoDeDados do begin
     try
        ConfiguraBanco := TfrmConfiguraBancoDeDados.Create(tbBancoDeDados);
        ConfiguraBanco.AbreConfiguracao;

        if not ConfiguraBanco.isBancoConfigurado then Halt
        else                                          dm.AbreConexaoBancoDeDados;

     finally
        ConfiguraBanco.Release;
        ConfiguraBanco := nil
     end;
  end;

  Application.CreateForm(TfrmLogin, frmLogin);

  try
    if (frmLogin.ShowModal = 1) then begin
      Application.CreateForm(TfrmInicial, frmInicial);
      frmInicial.ShowModal;
      frmInicial.Release;

    end;
  finally
    frmLogin.Release;
    frmLogin := nil;
  end;

  dm.FechaConexaoBancoDeDados;
end.
