unit PermissoesAcesso;

interface

uses Usuario;

type
  TPermissoesAcesso = class
  public
    class function VerificaPermissao(nPermissao: Integer): Boolean; overload;
    class function VerificaPermissao(nPermissao: Integer; lPedeSupervisor: Boolean): Boolean; overload;
    class function VerificaPermissao(nPermissao: Integer; cMens: String; lPedeSupervisor: Boolean): Boolean; overload;
    class function VerificaPermissao(nPermissao: Integer; cMens: String; lMensagem: Boolean; lPedeSupervisor: Boolean): Boolean; overload;
    class function ExibirComPermissao(nPermissao: Integer): Boolean;
  end;

const
  paLogarSistema                 = 1;
  paCadastroPerfil               = 2;
  paCadastroUsuario              = 3;
  paCadastroCliente              = 4;
  paCadastroCor                  = 5;
  paCadastroEmpresa              = 6;
  paCadastroFormaPagamento       = 7;
  paCadastroFornecedor           = 8;
  paCadastroGrade                = 9;
  paCadastroProduto              = 10;
  paCadastroRepresentante        = 11;
  paCadastroTabelapreco          = 12;
  paCadastroTamanho              = 13;
  paCadastroTransportadora       = 14;
  paBackup                       = 15;
  paImprimirCodigoBarras         = 16;
  paManutencaoSistema            = 17;
  paCriarPedido                  = 18;
  paAlterarPedido                = 19;
  paCadastroNaturezaOperacao     = 20;
  paAlteraStatusAprovacaoPedido  = 21;
  paRaioXRepresentante           = 22;
  paAlterarUsuario               = 23;
  paFechaComissaoRepresentante   = 24;
  paRelatorioNotasVenda          = 25;
  paConferenciaPedido            = 26;
  paCadastroMateria              = 27;
  paCadastroContador             = 28;
  paCadastroCFOPCorrespondente   = 29;
  paImportarXML                  = 30;
  paTelaFaturamento              = 31;
  paTelaMonitorControleNFe       = 32;
  paImpressaoEtiquetasCaixa      = 33;
  paImpressaoEtiquetasCoppel     = 34;
  paImpressaoEtiquetasPicorrucho = 35;
  paGeracaoSintegra              = 36;
  paGeracaoEFDContribuicoes      = 37;
  paGeracaoEFDFiscal             = 38;
  paRelatorioClientes            = 39;
  paRelatorioNotasFiscaisEntrada = 40;
  paRelatorioPedidosProducao     = 41;
  paRelatorioReferencias         = 42;
  paRelatorioVendas              = 43;
  paTelaConfiguracaoNotaFiscal   = 44;              
  paRelatorioMapaReferencias     = 45;
  paEntradaManualEstoque         = 46;
  paCartaCorrecaoEletronica      = 47;
  paRelatorioTotalizarEstoque    = 48;
  paTabelaPrecoTotalizarEstoque  = 49;
  paRelatorioPedidosNaoFaturados = 50;
  paBuscaImprimirRomaneio        = 51;
  paSaidaManualEstoque           = 52;
  paRelatorioPrevisaoEstoque     = 53;
  paCadastroColecao              = 54;
  paCadastroIntervaloProducao    = 55;
  paRelatorioEntradas            = 56;
  paImportadorClientesTricae     = 57;
  paContasPagar                  = 58;
  paRelatorioContasPagar         = 59;
  paConferenciaPedidoProducao    = 60;
  paVisualizaPeididosNFes        = 61;
  paPedidoConsumidorFinal        = 62;
  paTransferenciaEstoque         = 63;
  paCadastroContasBanco          = 64;
  paRelatorioMovimentos          = 65;
  paImportadorOrdensServico      = 66;
  paTelaCaixaLoja                = 67;
  paEntradaSaidaMoeda            = 68;
  paRelatorioCaixa               = 69;
  paRelatorioTabelaPrecos        = 70;
  paCadastroGrupo                = 71;
  paCadastroCidade               = 72;
  paCadastroNCM                  = 73;

implementation

uses SysUtils, USupervisor, uModulo, uPadrao;

class function TPermissoesAcesso.VerificaPermissao(nPermissao: Integer; lPedeSupervisor: Boolean): Boolean;
var cMens: String;
begin
  if dm.UsuarioLogado = nil then
    cMens  := 'Você não tem permissão para acessar esta rotina!'
  else
    cMens  := Trim(dm.UsuarioLogado.Nome) + #13 + 'Você não tem permissão para acessar esta rotina!';

  Result := VerificaPermissao(nPermissao, cMens, lPedeSupervisor);
end;

class function TPermissoesAcesso.VerificaPermissao(nPermissao: Integer; cMens: String; lPedeSupervisor: Boolean): Boolean;
begin
  Result := self.VerificaPermissao(nPermissao, cMens, True, lPedeSupervisor);
end;

class function TPermissoesAcesso.ExibirComPermissao(nPermissao: Integer): Boolean;
begin
  Result:= (Copy(dm.UsuarioLogado.Perfil.Acesso, nPermissao, 1) <> 'S');
end;

class function TPermissoesAcesso.VerificaPermissao(nPermissao: Integer; cMens: String; lMensagem: Boolean; lPedeSupervisor: Boolean): Boolean;
var cMenSup, msgRetorno: String;
begin

  Result := false;

  if dm.UsuarioLogado = nil then
    begin
      if lMensagem then
        raise Exception.Create('Não há usuário logado no sistema!');
      exit;
    end
  else if dm.UsuarioLogado.Perfil = nil then
    begin
      if lMensagem then
        raise Exception.Create('O usuário logado não tem um perfil definido!');
      exit;
    end;

  if (Copy(dm.UsuarioLogado.Perfil.Acesso, nPermissao, 1) <> 'S') then
    begin
      cMenSup := '';

      if lPedeSupervisor then
        cMenSup := #13#13 + ' Contate o seu supervisor para liberar o acesso!';

      if (lMensagem) then
        begin
          if (Length(Trim(cMenSup)) > 0) then
            msgRetorno := cMens + cMenSup
          else
            msgRetorno := Trim(cMens);
        end
      else if lPedeSupervisor then
        msgRetorno := cMenSup;

      try
        if (lPedeSupervisor) and (TfrmSupervisor.LiberaFuncao(nPermissao)) then
          Result := true
        else
           TfrmPadrao.Create(nil).avisar(msgRetorno);
          //raise Exception.Create(msgRetorno);

      Except
      On E: Exception Do
       begin
         TfrmPadrao.Create(nil).avisar(E.Message);
       end;
  end;

      exit;
    end
  else
    Result := true;
end;

class function TPermissoesAcesso.VerificaPermissao(nPermissao: Integer): Boolean;
begin
  Result := TPermissoesAcesso.VerificaPermissao(nPermissao, true);
end;

end.
