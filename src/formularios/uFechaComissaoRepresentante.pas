unit uFechaComissaoRepresentante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, TipoPessoa, Dialogs, uPadrao,
  StdCtrls, frameBuscaPessoa, ComCtrls, Buttons, Grids, Math, DBGrids, DBGridCBN, DB, DBClient, Provider,
  contnrs, Mask, DBCtrls, RxToolEdit, RxCurrEdit, ExtCtrls,
  Repositorio, ComissaoRepresentante, Lancamento, RLReport, DateUtils, Mapi,
  RLFilters, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ACBrBase, ACBrMail;

type
  TfrmFechaComissaoRepresentante = class(TfrmPadrao)
    BuscaPessoa1: TBuscaPessoa;
    cbMes: TComboBox;
    Label1: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    dspQuinzena1: TDataSetProvider;
    cdsPedidosPeriodo: TClientDataSet;
    dsQuinzena1: TDataSource;
    gridQuinzena1: TDBGridCBN;
    btnBuscar: TBitBtn;
    cdsPedidosPeriodoTOT_PEDIDO: TAggregateField;
    cdsPedidosPeriodoTOT_VLRCOMISS: TAggregateField;
    cdsComissoes1: TClientDataSet;
    dsComissoes1: TDataSource;
    cdsComissoes1PERC_COMISSAO: TFloatField;
    cdsComissoes1TOTAL_PERCENTAGEM: TFloatField;
    edtAno: TEdit;
    UpDown1: TUpDown;
    cdsComissoes1TOTAL_PEDIDO: TFloatField;
    gpbDebCred: TGroupBox;
    gridDebCred1: TDBGridCBN;
    Label12: TLabel;
    btnIncluir: TBitBtn;
    btnCancelar: TBitBtn;
    pnlDados: TPanel;
    Label10: TLabel;
    memoDescricao: TMemo;
    cbTipo: TComboBox;
    Label11: TLabel;
    Label9: TLabel;
    edtValor: TCurrencyEdit;
    btnOK: TBitBtn;
    cdsDebCred1: TClientDataSet;
    dsDebCred1: TDataSource;
    cdsDebCred1VALOR: TFloatField;
    cdsDebCred1TIPO: TStringField;
    cdsDebCred1DESCRICAO: TStringField;
    cdsDebCred1CODIGO: TFloatField;
    GroupBox7: TGroupBox;
    edtComissaoSaldo1: TCurrencyEdit;
    edtDebitoSaldo1: TCurrencyEdit;
    edtCreditoSaldo1: TCurrencyEdit;
    edtSaldoTotal1: TCurrencyEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Panel1: TPanel;
    btnSalvar: TBitBtn;
    btnImprimir: TBitBtn;
    edtCodigo: TCurrencyEdit;
    Label26: TLabel;
    DBEdit2: TDBEdit;
    edtEmail: TEdit;
    Label6: TLabel;
    Label27: TLabel;
    BitBtn1: TBitBtn;
    lbEnvio: TLabel;
    btnconfigEmail: TSpeedButton;
    cdsRemovidos: TClientDataSet;
    cdsRemovidosCODIGO_LANCAMENTO: TIntegerField;
    btnRemover: TSpeedButton;
    btnAlterar: TSpeedButton;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtNome: TEdit;
    edtAssunto: TEdit;
    memoTexto: TMemo;
    edtEmailCopia: TEdit;
    pnlconfigEmail: TPanel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label4: TLabel;
    DBGridCBN2: TDBGridCBN;
    edtTotPedidos1: TCurrencyEdit;
    edtTotComissoes1: TCurrencyEdit;
    edtCodComissao1: TCurrencyEdit;
    GroupBox3: TGroupBox;
    obsQuinzena1: TMemo;
    Label32: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    Label33: TLabel;
    qryQuinzena1: TFDQuery;
    cdsPedidosPeriodoDT_ENVIO: TDateField;
    cdsPedidosPeriodoDIA_PEDIDO: TSmallintField;
    cdsPedidosPeriodoCLIENTE: TStringField;
    cdsPedidosPeriodoFPGTO: TStringField;
    cdsPedidosPeriodoNUMPEDIDO: TStringField;
    cdsPedidosPeriodoCOMISSAO: TBCDField;
    cdsPedidosPeriodoVALOR_TOTAL: TBCDField;
    cdsPedidosPeriodoVLRCOMISSAO: TBCDField;
    ACBrMail1: TACBrMail;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel1: TRLLabel;
    RLLabel3: TRLLabel;
    rlMesAno: TRLLabel;
    rlRepresentante: TRLLabel;
    RLLabel27: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RLBand5: TRLBand;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLBand6: TRLBand;
    RLDBText8: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText9: TRLDBText;
    RLBand7: TRLBand;
    RLDBResult2: TRLDBResult;
    RLLabel14: TRLLabel;
    RLBand8: TRLBand;
    RLLabel15: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel10: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand2: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLBand9: TRLBand;
    RLLabel16: TRLLabel;
    RLSubDetail2: TRLSubDetail;
    RLBand10: TRLBand;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLBand11: TRLBand;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBMemo1: TRLDBMemo;
    RLBand13: TRLBand;
    RLLabel21: TRLLabel;
    RLBand14: TRLBand;
    RLDraw2: TRLDraw;
    RLDraw1: TRLDraw;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    lbTotComissao: TRLLabel;
    lbTotDebito: TRLLabel;
    lbTotCredito: TRLLabel;
    lbTotPagar: TRLLabel;
    RLBand30: TRLBand;
    RLLabel58: TRLLabel;
    rlObservacoes1: TRLMemo;
    RLLabel28: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    lbDataParcela1: TRLLabel;
    lbDataParcela2: TRLLabel;
    RLLabel33: TRLLabel;
    lbValorParcela1: TRLLabel;
    lbValorParcela2: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    Label3: TLabel;
    Label5: TLabel;
    dtpDataPrevista: TDateTimePicker;
    Label8: TLabel;
    dtpDataPrevista2: TDateTimePicker;
    RLDraw4: TRLDraw;
    RLDraw6: TRLDraw;
    cdsDebCred1NUM_PARCELA: TStringField;
    cbParcelaDestino: TComboBox;
    Label2: TLabel;
    RLLabel29: TRLLabel;
    RLDBText12: TRLDBText;
    RLDraw3: TRLDraw;
    RLDraw5: TRLDraw;
    Label13: TLabel;
    Label14: TLabel;
    edtVlrParcela1: TCurrencyEdit;
    edtVlrParcela2: TCurrencyEdit;
    chkApenasUmaParcela: TCheckBox;
    RLBand12: TRLBand;
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtSaldoTotal1Change(Sender: TObject);
    procedure memoDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure BuscaPessoa1Exit(Sender: TObject);
    procedure gridDebCred1Enter(Sender: TObject);
    procedure gridDebCred1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnconfigEmailClick(Sender: TObject);
    procedure pnlConfigEmailExit(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridQuinzena1DblClick(Sender: TObject);
    procedure chkApenasUmaParcelaClick(Sender: TObject);

  private
    procedure seleciona_comissoes;
    procedure carrega_comissao;
    procedure carrega_lancamento( lancamento :TLancamento; tipo :STring);
    procedure carrega_primeira_quinzena(lancamento :TLancamento);
    procedure carrega_debito_credito(lancamento :TLancamento; tipo :String; cds :TClientDataSet);
    procedure preenche_data_prevista;
    procedure limpa_dados;
    procedure limpa_deb_cred;

    procedure atualiza_saldo1;
    procedure separa_porcentegens(cdsQuinzena, cdsPercentagens :TClientDataSet; editC, editP: TCurrencyEdit);
    function  verifica_condicoes :Boolean;
    procedure remove_deb_cred(cds :TClientDataSet);
    procedure Deleta_lancamentos_removidos;

    procedure salvar;

    function salva_comissao_representante(comissao_representante :TComissaoRepresentante) :Boolean;
    function salva_debitos_creditos(comissao_representante :TComissaoRepresentante): Boolean;

    procedure imprimeEnviaRelatorio( acao :String);
    function EnviarEmail(Endereco: String; Assunto: String = ''; Texto: String = '';
             stlAnexo: TStringList = nil): Boolean;

    procedure abre_pedido(numero_pedido :String);

  public
    { Public declarations }
  end;

var
  frmFechaComissaoRepresentante: TfrmFechaComissaoRepresentante;

implementation

uses FabricaRepositorio, ComissaoHasLancamentos, EspecificacaoCodigosLancamentoPorCodigoComissao,
     Especificacao, EspecificacaoComissaoRepresentantePorAnoMes, TipoLancamento, Funcoes, IdIOHandlerStack,
     StrUtils, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient,
     IdSMTP, IdAttachmentFile, IdExplicitTLSClientServerBase, IdSSLOpenSSL, IdIOHandler, IdIOHandlerSocket,
     ConfiguracoesNFEmail, uPedido, dateTimeUtilitario, StringUtilitario;

{$R *.dfm}

procedure TfrmFechaComissaoRepresentante.FormShow(Sender: TObject);
begin
  BuscaPessoa1.TipoPessoa := tpRepresentante;
  cdsComissoes1.CreateDataSet;

  cdsDebCred1.CreateDataSet;
  edtAno.Text          := FormatDateTime('yyyy', date);
  self.Top             := 7;
  self.Left            := 75;
  pnlconfigEmail.Align := alBottom;
  self.WindowState     := wsMaximized;
  dtpInicio.DateTime   := StartOfTheMonth(Date);
  dtpFim.DateTime      := EndOfTheMonth(Date);
end;

procedure TfrmFechaComissaoRepresentante.btnBuscarClick(Sender: TObject);
begin
  btnconfigEmail.visible := false;

  if BuscaPessoa1.edtCodigo.AsInteger <= 0 then begin
    BuscaPessoa1.edtCodigo.SetFocus;
    avisar('Favor selecionar o representante');
  end
  else
    seleciona_comissoes;
end;

procedure TfrmFechaComissaoRepresentante.seleciona_comissoes;
begin
  limpa_dados;

  cdsPedidosPeriodo.Close;
  qryQuinzena1.ParamByName('dt_ini').AsDateTime  := dtpInicio.DateTime;
  qryQuinzena1.ParamByName('dt_fim').AsDateTime  := dtpFim.DateTime;
  qryQuinzena1.ParamByName('codrep').AsInteger   := BuscaPessoa1.edtCodigo.AsInteger;
  cdsPedidosPeriodo.Open;

{  cdsQuinzena2.Close;
  qryQuinzena2.ParamByName('dt_ini').AsDateTime  := StrToDateTime( formatDateTime('16/mm/yyyy 00:00:00',dtpFim.DateTime) );
  qryQuinzena2.ParamByName('dt_fim').AsDateTime  := dtpFim.DateTime;
  qryQuinzena2.ParamByName('codrep').AsInteger   := BuscaPessoa1.edtCodigo.AsInteger;
  cdsQuinzena2.Open;  }

  preenche_data_prevista;

  if(cdsPedidosPeriodo.IsEmpty) then
    avisar('Não foi encontrado nenhum registro utilizando os filtros informados')
  else
    separa_porcentegens(cdsPedidosPeriodo, cdsComissoes1, edtTotComissoes1, edtTotPedidos1);

  edtComissaoSaldo1.Value := edtTotComissoes1.Value;

  carrega_comissao;

  atualiza_saldo1;

  memoTexto.Text := 'Segue em anexo o relatório de comissão referente ao mês de '+TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ));
  btnconfigEmail.visible := true;
end;

procedure TfrmFechaComissaoRepresentante.separa_porcentegens(cdsQuinzena,
  cdsPercentagens: TClientDataSet; editC, editP: TCurrencyEdit);
begin
  editC.Value := 0;
  editP.Value := 0;
  cdsQuinzena.First;

  while not cdsQuinzena.Eof do begin

    if cdsPercentagens.Locate('PERC_COMISSAO', cdsQuinzena.fieldByName('COMISSAO').AsFloat, []) then begin
      cdsPercentagens.Edit;
      cdsPercentagens.FieldByName('TOTAL_PERCENTAGEM').AsFloat := cdsPercentagens.FieldByName('TOTAL_PERCENTAGEM').AsFloat +
                                                                   cdsQuinzena.fieldByName('VLRCOMISSAO').AsFloat;
      cdsPercentagens.FieldByName('TOTAL_PEDIDO').AsFloat      := cdsPercentagens.FieldByName('TOTAL_PEDIDO').AsFloat +
                                                                  cdsQuinzena.fieldByName('VALOR_TOTAL').AsFloat;
    end
    else begin
      cdsPercentagens.Append;
      cdsPercentagens.FieldByName('PERC_COMISSAO').AsFloat     := cdsQuinzena.fieldByName('COMISSAO').AsFloat;
      cdsPercentagens.FieldByName('TOTAL_PERCENTAGEM').AsFloat := cdsQuinzena.fieldByName('VLRCOMISSAO').AsFloat;
      cdsPercentagens.FieldByName('TOTAL_PEDIDO').AsFloat      := cdsQuinzena.fieldByName('VALOR_TOTAL').AsFloat;
    end;

    cdsPercentagens.Post;
    cdsQuinzena.Next;
  end;

  cdsPercentagens.First;
  while not cdsPercentagens.Eof do begin

    editC.Value := editC.Value + cdsPercentagens.fieldByName('TOTAL_PERCENTAGEM').AsFloat;
    editP.Value := editP.Value + cdsPercentagens.fieldByName('TOTAL_PEDIDO').AsFloat;

    cdsPercentagens.Next;
  end;

  editC.Value := arredonda(editC.Value);
  editP.Value := arredonda(editP.Value);
end;

procedure TfrmFechaComissaoRepresentante.btnIncluirClick(Sender: TObject);
begin
  inherited;

  if cdsPedidosPeriodo.IsEmpty then exit;

  btnIncluir.Tag          := 1;
  pnlDados.Enabled        := true;
  btnAlterar.Enabled      := false;
  btnRemover.Enabled      := false;
  btnIncluir.Enabled      := false;
  gridDebCred1.Enabled    := false;
  btnCancelar.Enabled     := true;
  edtValor.SetFocus;
end;

procedure TfrmFechaComissaoRepresentante.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if cdsDebCred1.IsEmpty then exit;
  
 // cdsDebCred1.AfterScroll := nil;
  pnlDados.Enabled        := true;
  btnAlterar.Tag          := 1;
  btnIncluir.Enabled      := false;
  gridDebCred1.Enabled    := false;
  btnCancelar.Enabled     := true;
  edtValor.Value       := cdsDebCred1VALOR.AsFloat;
  cbTipo.ItemIndex     := cbTipo.Items.IndexOf( cdsDebCred1TIPO.AsString );
  cbParcelaDestino.ItemIndex := cdsDebCred1NUM_PARCELA.AsInteger;
  memoDescricao.Text   := cdsDebCred1DESCRICAO.AsString;
  edtValor.SetFocus;
end;

procedure TfrmFechaComissaoRepresentante.btnCancelarClick(Sender: TObject);
begin
  gridDebCred1.Enabled := true;
  gridDebCred1.SetFocus;
  pnlDados.Enabled    := false;
  btnIncluir.Tag      := 0;
  btnAlterar.Tag      := 0;
  btnAlterar.Enabled  := true;
  btnRemover.Enabled  := true;
  btnIncluir.Enabled  := true;
  btnCancelar.Enabled := false;
  limpa_deb_cred;
 // cdsDebCred1.AfterScroll := cdsDebCred1AfterScroll;
end;

procedure TfrmFechaComissaoRepresentante.btnOKClick(Sender: TObject);
begin
  inherited;
  if edtValor.Value <= 0 then begin
    avisar('Favor informar o valor');
    edtValor.SetFocus;
  end
  else if cbTipo.ItemIndex < 1 then begin
    avisar('Favor informar o tipo');
    cbTipo.SetFocus;
  end
  else if cbParcelaDestino.ItemIndex < 1 then begin
    avisar('Favor informar a parcela de destino');
    cbParcelaDestino.SetFocus;
  end
  else if length(memoDescricao.Text) < 5 then begin
    avisar('Favor informar uma descrição');
    memoDescricao.SetFocus;
  end
  else if (cbParcelaDestino.ItemIndex = 2) and chkApenasUmaParcela.Checked then begin
    avisar('Nenhum lançamento pode ser efetuado para a 2ª parcela, pois a opção "Pagamento total na 1ª parcela" está habilitada.');
  end
  else begin
    { se for débito }
    if (cbTipo.ItemIndex = 1) then
    begin
      if ((cbParcelaDestino.ItemIndex = 1) and (edtValor.Value > edtVlrParcela1.Value)) or
         ((cbParcelaDestino.ItemIndex = 2) and (edtValor.Value > edtVlrParcela2.Value)) then
      begin
        avisar('O valor do débito não pode ser maior que o da parcela');
        exit;
      end;
    end;

    if btnIncluir.Tag = 1 then begin
      cdsDebCred1.Append;
      cdsDebCred1CODIGO.AsFloat := 0;
    end
    else
      cdsDebCred1.Edit;

    cdsDebCred1VALOR.AsFloat        := edtValor.Value;
    cdsDebCred1TIPO.AsString        := cbTipo.Text;
    cdsDebCred1DESCRICAO.AsString   := memoDescricao.Text;
    cdsDebCred1NUM_PARCELA.AsString := copy(cbParcelaDestino.Items[cbParcelaDestino.ItemIndex],1,1);
    cdsDebCred1.Post;

    btnCancelar.Click;

    atualiza_saldo1;
  end;
end;

procedure TfrmFechaComissaoRepresentante.edtSaldoTotal1Change(
  Sender: TObject);
begin
  inherited;
  if TCurrencyEdit(Sender).Value >= 0 then
    TCurrencyEdit(Sender).Font.Color := $0021501F
  else
    TCurrencyEdit(Sender).Font.Color := $00000062;
end;

procedure TfrmFechaComissaoRepresentante.atualiza_saldo1;
var debParc1, debParc2, credParc1, credParc2 :Real;
begin
  debParc1 := 0; debParc2 := 0; credParc1 := 0; credParc2 := 0;
  edtDebitoSaldo1.Clear;
  edtCreditoSaldo1.Clear;
  edtVlrParcela1.Clear;
  edtVlrParcela2.Clear;

  cdsDebCred1.First;

  while not cdsDebCred1.Eof do begin
    if cdsDebCred1TIPO.AsString = 'Débito' then
    begin
      if cdsDebCred1NUM_PARCELA.AsInteger = 1 then
        debParc1 := debParc1 + cdsDebCred1VALOR.AsFloat
      else
        debParc2 := debParc2 + cdsDebCred1VALOR.AsFloat;

      edtDebitoSaldo1.Value := edtDebitoSaldo1.Value + cdsDebCred1VALOR.AsFloat
    end
    else
    begin
      if cdsDebCred1NUM_PARCELA.AsInteger = 1 then
        credParc1 := credParc1 + cdsDebCred1VALOR.AsFloat
      else
        credParc2 := credParc2 + cdsDebCred1VALOR.AsFloat;

      edtCreditoSaldo1.Value := edtCreditoSaldo1.Value + cdsDebCred1VALOR.AsFloat;
    end;

    cdsDebCred1.Next;
  end;

  edtSaldoTotal1.Value := edtComissaoSaldo1.Value - edtDebitoSaldo1.Value + edtCreditoSaldo1.Value;

  if chkApenasUmaParcela.Checked then
    edtVlrParcela1.Value := edtComissaoSaldo1.Value - debParc1 + credParc1
  else
  begin
    edtVlrParcela1.Value := trunc(edtComissaoSaldo1.Value/2) - debParc1 + credParc1;
    edtVlrParcela2.Value := edtComissaoSaldo1.Value-trunc(edtComissaoSaldo1.Value/2) - debParc2 + credParc2;
  end;

  chkApenasUmaParcela.enabled := not(not cdsDebCred1.IsEmpty and cdsDebCred1.Locate('NUM_PARCELA','2',[]));

  if chkApenasUmaParcela.Checked and (edtDebitoSaldo1.Value > (edtComissaoSaldo1.Value/2)) then
    chkApenasUmaParcela.Enabled := false;

end;

procedure TfrmFechaComissaoRepresentante.memoDescricaoKeyPress(
  Sender: TObject; var Key: Char);
begin
 // if (ssCtrl in Shift) AND (Key = #13) then


  Key := AnsiUpperCase(key)[1];
end;

procedure TfrmFechaComissaoRepresentante.btnSalvarClick(Sender: TObject);
begin
  if not (verifica_condicoes) or not confirma('As informações salvas, referêntes a esta comissão, não poderão mais serem alteradas. Confirma?') then  Exit;
  try
    fdm.conexao.TxOptions.AutoCommit := false;

  try

    self.salvar;

    avisar('Operação realizada com sucesso!');

    fdm.conexao.Commit;

    btnBuscar.Click;

  except
    on e : Exception do
      begin
        fdm.conexao.Rollback;
        Avisar(e.Message);
      end;
  end;
  finally
    fdm.conexao.TxOptions.AutoCommit := true;
  end;
end;

procedure TfrmFechaComissaoRepresentante.salvar;
var
    repositorio            :TRepositorio;
    comissao_representante :TComissaoRepresentante;
    Especificacao          :TEspecificacaoComissaoRepresentantePorAnoMes;
begin
  try
  try
    { Salva comissão do representante }
    Especificacao               := TEspecificacaoComissaoRepresentantePorAnoMes.Create( BuscaPessoa1.edtCodigo.AsInteger,
                                                                                       strToInt( formatDateTime('yyyy', dtpFim.DateTime) ),
                                                                                       StrToInt(formatDateTime('mm',dtpFim.DateTime)) );
    repositorio                 := TFabricaRepositorio.GetRepositorio( TComissaoRepresentante.ClassName );
    comissao_representante      := TComissaoRepresentante(repositorio.GetPorEspecificacao(Especificacao));

    if not assigned(comissao_representante) then
    begin
      comissao_representante  := TComissaoRepresentante.Create;
      comissao_representante.codigo_representante := BuscaPessoa1.edtCodigo.AsInteger;
      comissao_representante.ano                  := strToInt( formatDateTime('yyyy', dtpFim.DateTime) );
      comissao_representante.mes                  := strToInt( formatDateTime('mm', dtpFim.DateTime) );
    end;

    comissao_representante.Apenas_uma_parcela := chkApenasUmaParcela.Checked;
    repositorio.Salvar(comissao_representante);

    Deleta_lancamentos_removidos;

    { Se existir pedidos no mes informado, salva o registro da comissão do representante selecionado }
    if not cdsPedidosPeriodo.IsEmpty then
      salva_comissao_representante(comissao_representante);

  except
    on e : Exception do
      begin
        raise exception.Create( e.Message );
      end;
  end;
  finally
    FreeAndNil(comissao_representante);
    FreeAndNil(repositorio);
    FreeAndNil(Especificacao);
  end;
end;

function TfrmFechaComissaoRepresentante.salva_comissao_representante(comissao_representante :TComissaoRepresentante): Boolean;
var repositorio :TRepositorio;
    Lancamento :TLancamento;
    comissao_has_lancamentos :TComissaoHasLancamentos;
    novoLancamento :Boolean;
begin
  try
    novoLancamento := false;
    repositorio := nil;
    Lancamento  := nil;
    comissao_has_lancamentos   := nil;

    try
      repositorio                := TFabricaRepositorio.GetRepositorio(TLancamento.ClassName);
      Lancamento                 := comissao_representante.LancamentoReferenteComissao;

      if not assigned(Lancamento) then
      begin
        novoLancamento := true;
        Lancamento     := TLancamento.Create;
      end;

      //Lancamento.codigo          := edtCodComissao1.AsInteger;
      Lancamento.valor_total     := edtComissaoSaldo1.Value;
      Lancamento.data_vencimento := dtpDataPrevista.DateTime;
      Lancamento.data_cadastro   := Date;
      Lancamento.descricao       := 'PAGAMENTO COMISSAO PARA REPRESENTANTE '+BuscaPessoa1.edtRazao.Text+
                                    ' REFERENTE A 1ª QUINZENA DE '+TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ))
                                   +' DE '+ formatDateTime('yyyy', dtpFim.DateTime);
      Lancamento.tipo            := TTipoLancamentoUtilitario.DeStringParaEnumerado('P'); //um lançamento a pagar (comissao rep.)
      Lancamento.tipoStr         := 'P';
      Lancamento.observacao      := obsQuinzena1.Text;

      repositorio.Salvar( Lancamento );


      { Se o código = ZERO, é necessário criar a relação }
      if novoLancamento then begin

          { Salva relação entre as tabelas COMISSAO_REPRESENTANTE e LANCAMENTOS, especificando o tipo como Quinzena 'Q' }

         repositorio                := TFabricaRepositorio.GetRepositorio( TComissaoHasLancamentos.ClassName );
         comissao_has_lancamentos   := TComissaoHasLancamentos.Create;

         comissao_has_lancamentos.codigo_comissao_representante := comissao_representante.codigo;
         comissao_has_lancamentos.codigo_lancamento             := Lancamento.codigo;
         comissao_has_lancamentos.tipo                          := 'Q';

         repositorio.Salvar( comissao_has_lancamentos );

      end;

      salva_debitos_creditos(comissao_representante);

    finally
      FreeAndNil(repositorio);
      FreeAndNil(Lancamento);
      FreeAndNil(comissao_has_lancamentos);
    end;

  except
    on e : Exception do
      begin
        raise exception.Create( e.Message );
      end;
  end;
end;

function TfrmFechaComissaoRepresentante.salva_debitos_creditos(comissao_representante :TComissaoRepresentante): Boolean;
var repositorio :TRepositorio;
    Lancamento :TLancamento;
    comissao_has_lancamentos :TComissaoHasLancamentos;
begin
  try
    repositorio := nil;
    Lancamento  := nil;
    comissao_has_lancamentos := nil;

    try
      cdsDebCred1.First;
      while not cdsDebCred1.Eof do begin
        repositorio             := TFabricaRepositorio.GetRepositorio(TLancamento.ClassName);
        Lancamento              := TLancamento( repositorio.Get( cdsDebCred1CODIGO.AsInteger ) );

        if not Assigned(Lancamento) then
          Lancamento := TLancamento.Create;

        Lancamento.valor_total     := cdsDebCred1VALOR.AsFloat;
        Lancamento.data_vencimento := dtpDataPrevista.DateTime;
        Lancamento.data_cadastro   := Date;
        Lancamento.descricao       := cdsDebCred1DESCRICAO.AsString;
        Lancamento.tipo            := TTipoLancamentoUtilitario.DeStringParaEnumerado( IfThen(cdsDebCred1TIPO.AsString = 'Débito','R','P'));
        Lancamento.tipoStr         := IfThen(cdsDebCred1TIPO.AsString = 'Débito','R','P') + cdsDebCred1NUM_PARCELA.AsString;
                                                                                    // se for débito do representante é a receber para a empresa
        repositorio.Salvar( Lancamento );


        if cdsDebCred1CODIGO.AsInteger = 0 then begin

           { Salva relação entre as tabelas COMISSAO_REPRESENTANTE e LANCAMENTOS, especificando o tipo como Débito ou Crédito 'D' ou 'C' }

           repositorio                := TFabricaRepositorio.GetRepositorio( TComissaoHasLancamentos.ClassName );
           comissao_has_lancamentos   := TComissaoHasLancamentos.Create;

           if cdsDebCred1CODIGO.AsInteger > 0 then
             comissao_has_lancamentos.codigo_lancamento             := cdsDebCred1CODIGO.AsInteger
           else
             comissao_has_lancamentos.codigo_lancamento             := Lancamento.codigo;

           comissao_has_lancamentos.codigo_comissao_representante := comissao_representante.codigo;
           comissao_has_lancamentos.tipo                          := copy(cdsDebCred1TIPO.AsString, 1, 1);

           repositorio.Salvar( comissao_has_lancamentos );

        end;

        cdsDebCred1.Next;
      end;

    finally
      FreeAndNil(repositorio);
      FreeAndNil(Lancamento);
      FreeAndNil(comissao_has_lancamentos);
    end;

  except
    on e : Exception do
      begin
        raise exception.Create( e.Message );
      end;
  end;
end;

procedure TfrmFechaComissaoRepresentante.carrega_comissao;
var  comissao_representante :TComissaoRepresentante;
     comissao_lancamento :TComissaoHasLancamentos;
     Especificacao :TEspecificacaoComissaoRepresentantePorAnoMes;
     repositorio :TRepositorio;
     i :Integer;
begin
  repositorio                := nil;
  comissao_representante     := nil;
  comissao_lancamento        := nil;
  Especificacao              := nil;
  try

    Especificacao              := TEspecificacaoComissaoRepresentantePorAnoMes.Create( BuscaPessoa1.edtCodigo.AsInteger,
                                                                                       strToInt( formatDateTime('yyyy', dtpFim.DateTime) ),
                                                                                       StrToInt(formatDateTime('mm',dtpFim.DateTime)) );
    repositorio                 := TFabricaRepositorio.GetRepositorio( TComissaoRepresentante.ClassName );
    comissao_representante      := TComissaoRepresentante(repositorio.GetPorEspecificacao(Especificacao));

    if not assigned(comissao_representante) then exit;

    edtCodigo.AsInteger         := comissao_representante.codigo;
    chkApenasUmaParcela.Checked := comissao_representante.Apenas_uma_parcela;

    if assigned(comissao_representante.HasLancamentos) then
      for i := 0 to comissao_representante.HasLancamentos.Count - 1 do begin
        comissao_lancamento := ( comissao_representante.HasLancamentos.Items[i] as TComissaoHasLancamentos);
        carrega_lancamento( comissao_lancamento.Lancamento, comissao_lancamento.tipo );
      end;

     chkApenasUmaParcela.enabled := not(not cdsDebCred1.IsEmpty and cdsDebCred1.Locate('NUM_PARCELA','2',[]));

  finally
    freeAndNil(repositorio   );
    freeAndNil(Especificacao );
    FreeAndNil(comissao_representante);
  end;
end;

procedure TfrmFechaComissaoRepresentante.carrega_lancamento(lancamento: TLancamento; tipo: String);
begin
  if tipo = 'Q' then
    carrega_primeira_quinzena(lancamento)
  else
    carrega_debito_credito(lancamento, tipo, cdsDebCred1);
end;

procedure TfrmFechaComissaoRepresentante.carrega_debito_credito(
  lancamento: TLancamento; tipo: String; cds :TClientDataSet);
begin
  cds.Append;
  cds.fieldByName('CODIGO').AsInteger     := lancamento.codigo;
  cds.fieldByName('VALOR').AsFloat        := lancamento.valor_total;
  cds.fieldByName('TIPO').AsString        := IfThen( tipo = 'D', 'Débito', 'Crédito');
  cds.fieldByName('DESCRICAO').AsString   := lancamento.descricao;
  cds.fieldByName('NUM_PARCELA').AsString := copy(lancamento.tipoStr,2,1);
  cds.Post;
end;

procedure TfrmFechaComissaoRepresentante.carrega_primeira_quinzena(
  lancamento: TLancamento);
begin
  dtpDataPrevista.DateTime  := lancamento.data_vencimento;
  edtTotComissoes1.Value    := lancamento.valor_total;
  edtCodComissao1.AsInteger := lancamento.codigo;
  obsQuinzena1.Text         := lancamento.observacao;
end;

procedure TfrmFechaComissaoRepresentante.chkApenasUmaParcelaClick(Sender: TObject);
begin
  atualiza_saldo1;
end;

function TfrmFechaComissaoRepresentante.verifica_condicoes: Boolean;
begin
  Result := false;

  if (edtTotComissoes1.Value <= 0) then
     avisar('Nenhum dado foi buscado')
  {else if (edtCodigo.AsInteger > 0) then
     avisar('Comissão referente a este mês ja foi gerada e salva') }
  else
    if ( FormatDateTime('MM', Date)   = formatDateTime('mm',dtpFim.DateTime)   ) and
       ( FormatDateTime('YYYY', Date) = formatDateTime('yyyy',dtpFim.DateTime) ) then
     avisar('Não é possível salvar a comissão de um mês em aberto')
  else
    Result := true;

end;

procedure TfrmFechaComissaoRepresentante.limpa_dados;
begin
  if cdsPedidosPeriodo.Active then  cdsPedidosPeriodo.EmptyDataSet;
  cdsComissoes1.EmptyDataSet;

  cdsDebCred1.EmptyDataSet;
  edtTotPedidos1.Clear;
  edtTotComissoes1.Clear;
  edtCodigo.clear;
  limpa_deb_cred;
  obsQuinzena1.Clear;
end;

procedure TfrmFechaComissaoRepresentante.preenche_data_prevista;
var data :TDateTime;
begin
  data := strToDate('01/'+formatDateTime('mm',dtpFim.DateTime)+'/'+formatDateTime('yyyy',dtpFim.DateTime));
  data := data + 31; //para ir para o proximo mes

  dtpDataPrevista.Date := strToDateTime( '20/'+formatDateTime('mm/yyyy 00:00:00', data) );

  data := strToDate('01/'+formatDateTime('mm',data)+'/'+formatDateTime('yyyy',data));
  data := data + 31; //para ir para o proximo mes

  dtpDataPrevista2.DateTime := strToDateTime( '20/'+formatDateTime('mm/yyyy 00:00:00', data) );

       if DayOfWeek(dtpDataPrevista.Date) = 7 then  dtpDataPrevista.Date := dtpDataPrevista.Date + 2  //se for sabado
  else if DayOfWeek(dtpDataPrevista.Date) = 1 then  dtpDataPrevista.Date := dtpDataPrevista.Date + 1; //se for domingo

       if DayOfWeek(dtpDataPrevista2.Date) = 7 then  dtpDataPrevista2.Date := dtpDataPrevista2.Date - 1  //se for sabado
  else if DayOfWeek(dtpDataPrevista2.Date) = 1 then  dtpDataPrevista2.Date := dtpDataPrevista2.Date - 2; //se for domingo
end;

procedure TfrmFechaComissaoRepresentante.btnImprimirClick(Sender: TObject);
begin
  imprimeEnviaRelatorio('IMPRIMIR');
end;

procedure TfrmFechaComissaoRepresentante.imprimeEnviaRelatorio( acao :String);
var lista: TStringList;
    debitoP1, debitoP2, creditoP1, creditoP2 :Real;
begin
 try
    lista := TStringList.Create;
    debitoP1 := 0; debitoP2 := 0; creditoP1 := 0; creditoP2 := 0;

    // imprime 1ª quinzena

    if UPPERCASE(acao) = 'ENVIAR' then
      if not DirectoryExists(ExtractFilePath(Application.ExeName)+'/comissoes') then
        CreateDir(ExtractFilePath(Application.ExeName)+'/comissoes');

    if not cdsPedidosPeriodo.IsEmpty then begin
      rlRepresentante.Caption := BuscaPessoa1.edtCodigo.Text + ' - ' + BuscaPessoa1.edtRazao.Text;
      rlMesAno.Caption        := TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) )) + ' de '+formatDateTime('yyyy', dtpFim.DateTime);
      lbTotComissao.Caption   := formatfloat('##,###,##0.00', edtComissaoSaldo1.Value);
      lbTotDebito.Caption     := formatfloat('##,###,##0.00', edtDebitoSaldo1.Value);
      lbTotCredito.Caption    := formatfloat('##,###,##0.00', edtCreditoSaldo1.Value);
      lbTotPagar.Caption      := formatfloat('##,###,##0.00', edtSaldoTotal1.Value);

      {cdsDebCred1.First;
      while not cdsDebCred1.Eof do
      begin
        case AnsiIndexStr(AnsiUpperCase(cdsDebCred1TIPO.AsString), ['DÉBITO', 'CRÉDITO']) of
          0 : begin
            if cdsDebCred1NUM_PARCELA.AsInteger = 1 then
              debitoP1 := debitoP1 + cdsDebCred1VALOR.AsFloat
            else
              debitoP2 := debitoP2 + cdsDebCred1VALOR.AsFloat;
          end;
          1 : begin
            if cdsDebCred1NUM_PARCELA.AsInteger = 1 then
              creditoP1 := creditoP1 + cdsDebCred1VALOR.AsFloat
            else
              creditoP2 := creditoP2 + cdsDebCred1VALOR.AsFloat;
          end;
        end;
        cdsDebCred1.Next;
      end;   }

      lbDataParcela1.Caption  := DateToStr(dtpDataPrevista.Date);
      lbValorParcela1.Caption := TStringUtilitario.FormataDinheiro(edtVlrParcela1.Value);

      lbDataParcela2.Caption  := DateToStr(dtpDataPrevista2.Date);
      lbValorParcela2.Caption := TStringUtilitario.FormataDinheiro(edtVlrParcela2.Value);

   //   lbSaldoP1.Caption       := FormatFloat(',0.00; -,0.00;',creditoP1 - debitoP1);
   //   lbSaldoP2.Caption       := FormatFloat(',0.00; -,0.00;',creditoP2 - debitoP2);

      if cdsDebCred1.IsEmpty then  RLSubDetail2.Visible := false
                             else  RLSubDetail2.Visible := true;

      rlObservacoes1.Lines.Text := obsQuinzena1.Text;

      if UPPERCASE(acao) = 'IMPRIMIR' then
        RLReport1.PreviewModal;

      if UPPERCASE(acao) = 'ENVIAR' then begin
        RLReport1.SaveToFile( ExtractFilePath(Application.ExeName)+'/comissoes/'+BuscaPessoa1.edtRazao.Text+'_'+
                             TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ))+
                             formatDateTime('yyyy', dtpFim.DateTime) +'.pdf' );
        RLReport1.Prepare;
        lista.Add( ExtractFilePath(Application.ExeName)+'/comissoes/'+BuscaPessoa1.edtRazao.Text+'_'+
                   TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ))+
                   formatDateTime('yyyy', dtpFim.DateTime) +'.pdf' );
      end;

    end;

    if UPPERCASE(acao) = 'ENVIAR' then begin

      if lista.Count <= 0 then  Exit;

      if trim(BuscaPessoa1.Email) = '' then
         avisar('Relatório de comissão não enviado. Representante não possui E-mail cadastrado.')
      else
         EnviarEmail(BuscaPessoa1.Email,
                     trim( edtAssunto.Text ),
                     trim( memoTexto.Text ),
                     lista);

      lista.Free;
      lista := nil;
    end;

    RLReport1.Clear;

 Except
   on e : Exception do
      begin
        raise Exception.Create( e.Message );
      end;
 end;
end;

function TfrmFechaComissaoRepresentante.EnviarEmail(Endereco: String; Assunto: String = ''; Texto: String = '';
  stlAnexo: TStringList = nil): Boolean;
var
  nX                  :integer;
  configuracoes_email :TConfiguracoesNFEmail;
  repositorio         :TRepositorio;
begin
 try
  try
    repositorio         := TFabricaRepositorio.GetRepositorio( TConfiguracoesNFEmail.ClassName );
    configuracoes_email := TConfiguracoesNFEmail( repositorio.Get( 1 ) );

    if assigned(configuracoes_email) then begin {configuracoes_email - é a classe com as informações do email do cliente}

      ACBrMail1.Host         := configuracoes_email.SMTPHost;//'smtp.live.com';//'smtp.gmail.com';
      ACBrMail1.Port         := configuracoes_email.SMTPPort;
      ACBrMail1.Username     := configuracoes_email.SMTPUser;
      ACBrMail1.Password     := configuracoes_email.SMTPPassword;
      ACBrMail1.AddReplyTo(edtEmailCopia.Text);
      ACBrMail1.AddAddress(Endereco);// + ';' +configuracoes_email.SMTPUser;

      ACBrMail1.From                := edtEmailCopia.Text;//configuracoes_email.SMTPUser;
      ACBrMail1.FromName            := edtNome.Text;
      ACBrMail1.IsHTML := false;

      ACBrMail1.Subject      := Assunto;
      ACBrMail1.Body.Text    := Texto;
      ACBrMail1.AltBody.Text := ACBrMail1.Body.Text;

      for nX := 0 to stlAnexo.Count -1 do
        ACBrMail1.AddAttachment(TFileName( stlAnexo[nX] ));

      Application.ProcessMessages;
      ACBrMail1.Send;

      avisar('O relatório de comissão referente ao mês de '+ TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ))
            +', foi enviado com sucesso!'+#13#10
            +'E-mail destino: '+edtEmail.Text);

    end
    else avisar('Não foi possível enviar e-mail, pois não há configurações de e-mail cadastradas');

  Except
    on e : Exception do
      begin
        raise Exception.Create(e.Message);
      end;
  end;

 Finally
   FreeAndNil(configuracoes_email );
 end;
end;

procedure TfrmFechaComissaoRepresentante.BuscaPessoa1Exit(Sender: TObject);
begin
  inherited;
  edtEmail.Text := BuscaPessoa1.Email;
  if not cdsPedidosPeriodo.IsEmpty then
    limpa_dados;
end;

procedure TfrmFechaComissaoRepresentante.gridDebCred1Enter(
  Sender: TObject);
begin
  inherited;
  if not cdsDebCred1.IsEmpty then begin
    btnAlterar.Enabled := true;
    btnRemover.Enabled := true;
  end;
end;

procedure TfrmFechaComissaoRepresentante.gridDebCred1Exit(Sender: TObject);
begin
  inherited;
  btnAlterar.Enabled := false;
  btnRemover.Enabled := false;
end;

procedure TfrmFechaComissaoRepresentante.BitBtn1Click(Sender: TObject);
begin
  try
    Aguarda('Enviando e-mail');
 //   lbEnvio.Visible := true;
    imprimeEnviaRelatorio('ENVIAR');
    FimAguarda('Enviado com sucesso');
 //   lbEnvio.Visible := false;

  Except
    on e : Exception do
      begin
        avisar( e.Message );
      end;
  end;
end;

procedure TfrmFechaComissaoRepresentante.btnconfigEmailClick(
  Sender: TObject);
begin
  inherited;
  if not pnlconfigEmail.Visible then begin
    if not (memoTexto.Text = '') then
      pnlconfigEmail.Visible := true;
  end
  else
    pnlconfigEmail.Visible := false;  
end;

procedure TfrmFechaComissaoRepresentante.pnlConfigEmailExit(Sender: TObject);
begin
  inherited;
  pnlConfigEmail.Visible := false;
  if memoTexto.Text = '' then
    memoTexto.Text := 'Segue em anexo os relatórios das comissões da 1ª e 2ª quinzena referente ao mês de '+TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ));
end;

procedure TfrmFechaComissaoRepresentante.remove_deb_cred(cds: TClientDataSet);
var tipo, valor :String;
begin
  tipo  := cds.FieldByName('TIPO').AsString;
  valor := formatFloat('###,##0.000',cds.fieldByName('VALOR').asFloat);

  if confirma('Deseja realmente remover o '+tipo+' no valor de R$ '+valor+#13#10+
              'Referente ao representante: '+BuscaPessoa1.edtRazao.text) then
   begin

     { se nao for maior que zero, ainda nao foi salvo }
     if cds.fieldByName('CODIGO').AsInteger > 0 then begin

        if not cdsRemovidos.Active then  cdsRemovidos.CreateDataSet;

        cdsRemovidos.Append;
        cdsRemovidosCODIGO_LANCAMENTO.AsInteger := cds.fieldByName('CODIGO').AsInteger;
        cdsRemovidos.Post;

     end;

     cds.Delete;
   end;

end;

procedure TfrmFechaComissaoRepresentante.btnRemoverClick(Sender: TObject);
begin
  if cdsDebCred1.IsEmpty then exit;

  remove_deb_cred(cdsDebCred1);
end;

procedure TfrmFechaComissaoRepresentante.Deleta_lancamentos_removidos;
var repositorio :TRepositorio;
begin
  if not cdsRemovidos.Active then  exit;

  if cdsRemovidos.IsEmpty then  exit;

  repositorio := TFabricaRepositorio.GetRepositorio(TLancamento.ClassName);

  cdsRemovidos.First;
  while not cdsRemovidos.Eof do begin
    repositorio.RemoverPorIdentificador( cdsRemovidosCODIGO_LANCAMENTO.AsInteger );
    cdsRemovidos.Next;
  end;
end;

procedure TfrmFechaComissaoRepresentante.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (ActiveControl = memoDescricao) and (key = VK_RETURN) then exit;
  inherited;
end;

procedure TfrmFechaComissaoRepresentante.abre_pedido(
  numero_pedido: String);
begin
  frmPedido := TfrmPedido.Create(self);
  frmPedido.Tag := 1; //alteração de pedido
  frmPedido.Caption := 'Alteração de Pedido de Venda';
  frmPedido.BuscaPedido1.numped := numero_pedido;
  frmPedido.ShowModal;
  frmPedido.Release;
  frmPedido := nil;
end;

procedure TfrmFechaComissaoRepresentante.gridQuinzena1DblClick(
  Sender: TObject);
var total_comissao_atual :Real;
begin
  if cdsPedidosPeriodo.IsEmpty then EXIT;

  total_comissao_atual := cdsPedidosPeriodoTOT_VLRCOMISS.AsVariant;

  abre_pedido( cdsPedidosPeriodoNUMPEDIDO.AsString );

  btnBuscar.Click;

  if total_comissao_atual <> cdsPedidosPeriodoTOT_VLRCOMISS.AsVariant then
    avisar('A % de comissão de um pedido foi alterada. Para atualizar o total da comissão da 1ª, salve-a.');
end;

procedure TfrmFechaComissaoRepresentante.limpa_deb_cred;
begin
  edtValor.Clear;
  cbTipo.ItemIndex           := 0;
  cbParcelaDestino.ItemIndex := 0;
  memoDescricao.Clear;
end;

end.
