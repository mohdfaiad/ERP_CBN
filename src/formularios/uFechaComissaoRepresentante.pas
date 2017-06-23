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
    TabSheet2: TTabSheet;
    dspQuinzena1: TDataSetProvider;
    cdsQuinzena1: TClientDataSet;
    dsQuinzena1: TDataSource;
    gridQuinzena1: TDBGridCBN;
    cdsQuinzena2: TClientDataSet;
    dsQuinzena2: TDataSource;
    btnBuscar: TBitBtn;
    gridQuinzena2: TDBGridCBN;
    cdsQuinzena1TOT_PEDIDO: TAggregateField;
    cdsQuinzena1TOT_VLRCOMISS: TAggregateField;
    cdsQuinzena2TOT_PEDIDO: TAggregateField;
    cdsQuinzena2TOT_VLRCOMISS: TAggregateField;
    dspQuinzena2: TDataSetProvider;
    cdsComissoes1: TClientDataSet;
    dsComissoes1: TDataSource;
    cdsComissoes1PERC_COMISSAO: TFloatField;
    cdsComissoes1TOTAL_PERCENTAGEM: TFloatField;
    dsComissoes2: TDataSource;
    cdsComissoes2: TClientDataSet;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    edtAno: TEdit;
    UpDown1: TUpDown;
    cdsComissoes1TOTAL_PEDIDO: TFloatField;
    cdsComissoes2TOTAL_PEDIDO: TFloatField;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    dtpDataPrevista: TDateTimePicker;
    gpbDebCred: TGroupBox;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    dtpDataPrevista2: TDateTimePicker;
    gridDebCred1: TDBGridCBN;
    Label12: TLabel;
    cdsDebCred2: TClientDataSet;
    dsDebCred2: TDataSource;
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
    gpbdebcred2: TGroupBox;
    Label13: TLabel;
    gridDebCred2: TDBGridCBN;
    btnIncluir2: TBitBtn;
    btnCancelar2: TBitBtn;
    pnlDados2: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    memoDescricao2: TMemo;
    cbTipo2: TComboBox;
    edtValor2: TCurrencyEdit;
    btnOK2: TBitBtn;
    cdsDebCred1: TClientDataSet;
    dsDebCred1: TDataSource;
    cdsDebCred2VALOR: TFloatField;
    cdsDebCred2TIPO: TStringField;
    cdsDebCred2DESCRICAO: TStringField;
    cdsDebCred2CODIGO: TFloatField;
    cdsDebCred1VALOR: TFloatField;
    cdsDebCred1TIPO: TStringField;
    cdsDebCred1DESCRICAO: TStringField;
    cdsDebCred1CODIGO: TFloatField;
    GroupBox7: TGroupBox;
    edtComissaoSaldo1: TCurrencyEdit;
    edtDebitoSaldo1: TCurrencyEdit;
    edtCreditoSaldo1: TCurrencyEdit;
    edtSaldoTotal1: TCurrencyEdit;
    GroupBox8: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edtComissaoSaldo2: TCurrencyEdit;
    edtDebitoSaldo2: TCurrencyEdit;
    edtCreditoSaldo2: TCurrencyEdit;
    edtSaldoTotal2: TCurrencyEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Panel1: TPanel;
    btnSalvar: TBitBtn;
    btnImprimir: TBitBtn;
    edtCodigo: TCurrencyEdit;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel1: TRLLabel;
    RLLabel3: TRLLabel;
    rlQuinzenaMes: TRLLabel;
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
    RLBand12: TRLBand;
    RLDBResult3: TRLDBResult;
    RLLabel20: TRLLabel;
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
    RLReport2: TRLReport;
    RLBand15: TRLBand;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    rlQuinzenaMes2: TRLLabel;
    rlRepresentante2: TRLLabel;
    RLLabel33: TRLLabel;
    RLSubDetail3: TRLSubDetail;
    RLBand16: TRLBand;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    RLBand17: TRLBand;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLBand18: TRLBand;
    RLDBResult4: TRLDBResult;
    RLLabel37: TRLLabel;
    RLBand19: TRLBand;
    RLLabel38: TRLLabel;
    RLGroup2: TRLGroup;
    RLBand20: TRLBand;
    RLDBResult5: TRLDBResult;
    RLLabel39: TRLLabel;
    RLBand21: TRLBand;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLBand22: TRLBand;
    RLLabel40: TRLLabel;
    RLLabel41: TRLLabel;
    RLLabel42: TRLLabel;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabel45: TRLLabel;
    RLBand23: TRLBand;
    RLLabel46: TRLLabel;
    RLSubDetail4: TRLSubDetail;
    RLBand24: TRLBand;
    RLLabel47: TRLLabel;
    RLLabel48: TRLLabel;
    RLLabel49: TRLLabel;
    RLBand25: TRLBand;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLBand26: TRLBand;
    RLDBResult6: TRLDBResult;
    RLLabel50: TRLLabel;
    RLBand27: TRLBand;
    RLLabel51: TRLLabel;
    RLBand28: TRLBand;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLLabel52: TRLLabel;
    RLLabel53: TRLLabel;
    RLLabel54: TRLLabel;
    RLLabel55: TRLLabel;
    RLLabel56: TRLLabel;
    lbTotComissao2: TRLLabel;
    lbTotDebito2: TRLLabel;
    lbTotCredito2: TRLLabel;
    lbTotPagar2: TRLLabel;
    edtEmail: TEdit;
    Label6: TLabel;
    Label27: TLabel;
    BitBtn1: TBitBtn;
    lbEnvio: TLabel;
    btnconfigEmail: TSpeedButton;
    cdsQuinzena2DT_ENVIO: TDateField;
    cdsQuinzena2DIA_PEDIDO: TSmallintField;
    cdsQuinzena2CLIENTE: TStringField;
    cdsQuinzena2FPGTO: TStringField;
    RLLabel31: TRLLabel;
    rlDtPrevista2: TRLLabel;
    RLLabel32: TRLLabel;
    rlDtPrevista: TRLLabel;
    RLDBMemo1: TRLDBMemo;
    RLDBMemo2: TRLDBMemo;
    cdsRemovidos: TClientDataSet;
    cdsRemovidosCODIGO_LANCAMENTO: TIntegerField;
    btnAlterar2: TSpeedButton;
    btnRemover2: TSpeedButton;
    btnRemover: TSpeedButton;
    btnAlterar: TSpeedButton;
    cdsQuinzena2NUMPEDIDO: TStringField;
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
    PageControl3: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    Label8: TLabel;
    DBGridCBN3: TDBGridCBN;
    edtTotPedidos2: TCurrencyEdit;
    edtTotComissoes2: TCurrencyEdit;
    edtCodComissao2: TCurrencyEdit;
    GroupBox6: TGroupBox;
    obsQuinzena2: TMemo;
    RLBand29: TRLBand;
    RLLabel57: TRLLabel;
    rlObservacoes2: TRLMemo;
    RLBand30: TRLBand;
    RLLabel58: TRLLabel;
    rlObservacoes1: TRLMemo;
    Label32: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    Label33: TLabel;
    qryQuinzena2: TFDQuery;
    qryQuinzena1: TFDQuery;
    cdsQuinzena1DT_ENVIO: TDateField;
    cdsQuinzena1DIA_PEDIDO: TSmallintField;
    cdsQuinzena1CLIENTE: TStringField;
    cdsQuinzena1FPGTO: TStringField;
    cdsQuinzena1NUMPEDIDO: TStringField;
    cdsQuinzena1COMISSAO: TBCDField;
    cdsQuinzena1VALOR_TOTAL: TBCDField;
    cdsQuinzena1VLRCOMISSAO: TBCDField;
    cdsQuinzena2COMISSAO: TBCDField;
    cdsQuinzena2VALOR_TOTAL: TBCDField;
    cdsQuinzena2VLRCOMISSAO: TBCDField;
    ACBrMail1: TACBrMail;
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtSaldoTotal1Change(Sender: TObject);
    procedure memoDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnIncluir2Click(Sender: TObject);
    procedure btnAlterar2Click(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure btnOK2Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure BuscaPessoa1Exit(Sender: TObject);
    procedure gridDebCred2Enter(Sender: TObject);
    procedure gridDebCred1Enter(Sender: TObject);
    procedure gridDebCred1Exit(Sender: TObject);
    procedure gridDebCred2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnconfigEmailClick(Sender: TObject);
    procedure pnlConfigEmailExit(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnRemover2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridQuinzena2DblClick(Sender: TObject);
    procedure gridQuinzena1DblClick(Sender: TObject);

  private
    repositorio            :TRepositorio;
    comissao_representante :TComissaoRepresentante;

  private
    procedure seleciona_comissoes;
    procedure carrega_comissao;
    procedure carrega_lancamento( lancamento :TLancamento; tipo :STring);
    procedure carrega_primeira_quinzena(lancamento :TLancamento);
    procedure carrega_segunda_quinzena(lancamento :TLancamento);
    procedure carrega_debito_credito(lancamento :TLancamento; tipo :String; cds :TClientDataSet);
    procedure preenche_data_prevista;
    procedure limpa_dados;
    procedure limpa_deb_cred;

    procedure atualiza_saldo1;
    procedure atualiza_saldo2;
    procedure separa_porcentegens(cdsQuinzena, cdsPercentagens :TClientDataSet; editC, editP: TCurrencyEdit);
    function  verifica_condicoes :Boolean;
    procedure remove_deb_cred(cds :TClientDataSet);
    procedure Deleta_lancamentos_removidos;

    procedure salvar;

    function salva_primeira_quinzena :Boolean;
    function salva_segunda_quinzena :Boolean;
    function salva_debitos_creditos_Q1: Boolean;
    function salva_debitos_creditos_Q2:Boolean;

    procedure imprime_quinzenas( acao :String);
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
     ConfiguracoesNFEmail, uPedido, dateTimeUtilitario;

{$R *.dfm}

procedure TfrmFechaComissaoRepresentante.FormShow(Sender: TObject);
begin
  BuscaPessoa1.TipoPessoa := tpRepresentante;
  cdsComissoes1.CreateDataSet;
  cdsComissoes2.CreateDataSet;
  cdsDebCred1.CreateDataSet;
  cdsDebCred2.CreateDataSet;
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
 { else if cbMes.ItemIndex <= 0 then begin
    cbMes.SetFocus;
    avisar('Favor selecionar o mês da comissão');
  end }
  else
    seleciona_comissoes;
end;

procedure TfrmFechaComissaoRepresentante.seleciona_comissoes;
begin
  limpa_dados;

  cdsQuinzena1.Close;
  qryQuinzena1.ParamByName('dt_ini').AsDateTime  := dtpInicio.DateTime;
  qryQuinzena1.ParamByName('dt_fim').AsDateTime  := StrToDateTime( formatDateTime('15/mm/yyyy hh:mm:ss',dtpFim.DateTime) );
  qryQuinzena1.ParamByName('codrep').AsInteger   := BuscaPessoa1.edtCodigo.AsInteger;
  cdsQuinzena1.Open;

  cdsQuinzena2.Close;
  qryQuinzena2.ParamByName('dt_ini').AsDateTime  := StrToDateTime( formatDateTime('16/mm/yyyy 00:00:00',dtpFim.DateTime) );
  qryQuinzena2.ParamByName('dt_fim').AsDateTime  := dtpFim.DateTime;
  qryQuinzena2.ParamByName('codrep').AsInteger   := BuscaPessoa1.edtCodigo.AsInteger;
  cdsQuinzena2.Open;

  preenche_data_prevista;

  if(cdsQuinzena1.IsEmpty) then
    avisar('Não foi encontrado nenhum registro, referente a 1ª quinzena, com os filtros informados')
  else
    separa_porcentegens(cdsQuinzena1, cdsComissoes1, edtTotComissoes1, edtTotPedidos1);

  edtComissaoSaldo1.Value := edtTotComissoes1.Value;

  if(cdsQuinzena2.IsEmpty) then
    avisar('Não foi encontrado nenhum registro, referente a 2ª quinzena, com os filtros informados')
  else
    separa_porcentegens(cdsQuinzena2, cdsComissoes2, edtTotComissoes2, edtTotPedidos2);

  edtComissaoSaldo2.Value := edtTotComissoes2.Value;

  carrega_comissao;

  atualiza_saldo1;
  atualiza_saldo2;

  memoTexto.Text := 'Segue em anexo os relatórios das comissões da 1ª e 2ª quinzena referente ao mês de '+TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ));
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

  if cdsQuinzena1.IsEmpty then exit;

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
  else if length(memoDescricao.Text) < 5 then begin
    avisar('Favor informar uma descrição');
    memoDescricao.SetFocus;
  end
  else begin
    if btnIncluir.Tag = 1 then begin
      cdsDebCred1.Append;
      cdsDebCred1CODIGO.AsFloat := 0;
    end
    else
      cdsDebCred1.Edit;

    cdsDebCred1VALOR.AsFloat      := edtValor.Value;
    cdsDebCred1TIPO.AsString      := cbTipo.Text;
    cdsDebCred1DESCRICAO.AsString := memoDescricao.Text;

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
begin
  edtDebitoSaldo1.Clear;
  edtCreditoSaldo1.Clear;

  cdsDebCred1.First;

  while not cdsDebCred1.Eof do begin
    if cdsDebCred1TIPO.AsString = 'Débito' then
      edtDebitoSaldo1.Value := edtDebitoSaldo1.Value + cdsDebCred1VALOR.AsFloat
    else
      edtCreditoSaldo1.Value := edtCreditoSaldo1.Value + cdsDebCred1VALOR.AsFloat;

    cdsDebCred1.Next;
  end;

  edtSaldoTotal1.Value := edtComissaoSaldo1.Value - edtDebitoSaldo1.Value + edtCreditoSaldo1.Value;
end;

procedure TfrmFechaComissaoRepresentante.memoDescricaoKeyPress(
  Sender: TObject; var Key: Char);
begin
 // if (ssCtrl in Shift) AND (Key = #13) then


  Key := UpperCase(key)[1];
end;

procedure TfrmFechaComissaoRepresentante.atualiza_saldo2;
begin
  edtDebitoSaldo2.Clear;
  edtCreditoSaldo2.Clear;

  cdsDebCred2.First;

  while not cdsDebCred2.Eof do begin
    if cdsDebCred2TIPO.AsString = 'Débito' then
      edtDebitoSaldo2.Value := edtDebitoSaldo2.Value + cdsDebCred2VALOR.AsFloat
    else
      edtCreditoSaldo2.Value := edtCreditoSaldo2.Value + cdsDebCred2VALOR.AsFloat;

    cdsDebCred2.Next;
  end;

  edtSaldoTotal2.Value := edtComissaoSaldo2.Value - edtDebitoSaldo2.Value + edtCreditoSaldo2.Value;
end;

procedure TfrmFechaComissaoRepresentante.btnIncluir2Click(Sender: TObject);
begin

  if cdsQuinzena2.IsEmpty then exit;

  btnIncluir2.Tag         := 1;
  pnlDados2.Enabled       := true;
  btnAlterar2.Enabled     := false;
  btnRemover2.Enabled     := false;
  btnIncluir2.Enabled     := false;
  gridDebCred2.Enabled    := false;
  btnCancelar2.Enabled    := true;
  edtValor2.SetFocus;
end;

procedure TfrmFechaComissaoRepresentante.btnAlterar2Click(Sender: TObject);
begin
  inherited;
  if cdsDebCred2.IsEmpty then exit;

  cdsDebCred2.AfterScroll := nil;
  pnlDados2.Enabled       := true;
  btnAlterar2.Tag         := 1;
  btnIncluir2.Enabled     := false;
  gridDebCred2.Enabled    := false;
  btnCancelar2.Enabled    := true;
  edtValor2.Value       := cdsDebCred2VALOR.AsFloat;
  cbTipo2.ItemIndex     := cbTipo2.Items.IndexOf( cdsDebCred2TIPO.AsString );
  memoDescricao2.Text   := cdsDebCred2DESCRICAO.AsString;
  edtValor2.SetFocus;
end;

procedure TfrmFechaComissaoRepresentante.btnCancelar2Click(
  Sender: TObject);
begin
  gridDebCred2.Enabled := true;
  gridDebCred2.SetFocus;
  pnlDados2.Enabled    := false;
  btnIncluir2.Tag      := 0;
  btnAlterar2.Tag      := 0;
  btnAlterar2.Enabled  := true;
  btnRemover2.Enabled  := true;
  btnIncluir2.Enabled  := true;
  btnCancelar2.Enabled := false;
  limpa_deb_cred;
//  cdsDebCred2.AfterScroll := cdsDebCred1AfterScroll;
end;

procedure TfrmFechaComissaoRepresentante.btnOK2Click(Sender: TObject);
begin
  if edtValor2.Value <= 0 then begin
    avisar('Favor informar o valor');
    edtValor2.SetFocus;
  end
  else if cbTipo2.ItemIndex < 1 then begin
    avisar('Favor informar o tipo');
    cbTipo2.SetFocus;
  end
  else if length(memoDescricao2.Text) < 5 then begin
    avisar('Favor informar uma descrição');
    memoDescricao2.SetFocus;
  end
  else begin
    if btnIncluir2.Tag = 1 then begin
      cdsDebCred2.Append;
      cdsDebCred2CODIGO.AsFloat := 0;
    end
    else
      cdsDebCred2.Edit;

    cdsDebCred2VALOR.AsFloat      := edtValor2.Value;
    cdsDebCred2TIPO.AsString      := cbTipo2.Text;
    cdsDebCred2DESCRICAO.AsString := memoDescricao2.Text;

    cdsDebCred2.Post;

    btnCancelar2.Click;

    atualiza_saldo2;
  end;
end;

procedure TfrmFechaComissaoRepresentante.btnSalvarClick(Sender: TObject);
begin
  if not (verifica_condicoes) or not confirma('Ao salvar as informações, referente a esta comissão, não poderão mais serem alteradas. Confirma?') then  Exit;

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
end;

procedure TfrmFechaComissaoRepresentante.salvar;
var repositorio :TRepositorio;
begin
  try
    comissao_representante := nil;

    { Salva comissão do representante }

    repositorio             := TFabricaRepositorio.GetRepositorio(TComissaoRepresentante.ClassName);
    comissao_representante  := TComissaoRepresentante( repositorio.Get( edtCodigo.AsInteger ) );

    if not Assigned(comissao_representante) then
        comissao_representante := TComissaoRepresentante.Create;

    comissao_representante.codigo_representante := BuscaPessoa1.edtCodigo.AsInteger;
    comissao_representante.ano                  := strToInt( formatDateTime('yyyy', dtpFim.DateTime) );
    comissao_representante.mes                  := strToInt( formatDateTime('mm', dtpFim.DateTime) );

    repositorio.Salvar(comissao_representante);

    Deleta_lancamentos_removidos;

    { Salva lançamentos referentes a essa comissão }

    if not cdsQuinzena1.IsEmpty then    salva_primeira_quinzena;

    if not cdsQuinzena2.IsEmpty then    salva_segunda_quinzena;

  except
    on e : Exception do
      begin
        raise exception.Create( e.Message );
      end;
  end;
end;

function TfrmFechaComissaoRepresentante.salva_primeira_quinzena: Boolean;
var repositorio :TRepositorio;
    Lancamento :TLancamento;
    comissao_has_lancamentos :TComissaoHasLancamentos;
begin
  try
    repositorio := nil;
    Lancamento  := nil;
    comissao_has_lancamentos   := nil;

    try
      repositorio                := TFabricaRepositorio.GetRepositorio(TLancamento.ClassName);
      Lancamento                 := TLancamento.Create;

      Lancamento.codigo          := edtCodComissao1.AsInteger;
      Lancamento.valor_total     := edtComissaoSaldo1.Value;
      Lancamento.data_vencimento := dtpDataPrevista.DateTime;
      Lancamento.data_cadastro   := Date;
      Lancamento.descricao       := 'PAGAMENTO COMISSAO PARA REPRESENTANTE '+BuscaPessoa1.edtRazao.Text+
                                    ' REFERENTE A 1ª QUINZENA DE '+TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ))
                                   +' DE '+ formatDateTime('yyyy', dtpFim.DateTime);
      Lancamento.tipo            := TTipoLancamentoUtilitario.DeStringParaEnumerado('P'); //um lançamento a pagar (comissao rep.)
      Lancamento.observacao      := obsQuinzena1.Text;

      repositorio.Salvar( Lancamento );


      { Se o código for maior que ZERO, a relação ja existe, pois estará alterando }
      if edtCodComissao1.AsInteger = 0 then begin

          { Salva relação entre as tabelas COMISSAO_REPRESENTANTE e LANCAMENTOS, especificando o tipo como Quinzena 'Q' }

         repositorio                := TFabricaRepositorio.GetRepositorio( TComissaoHasLancamentos.ClassName );
         comissao_has_lancamentos   := TComissaoHasLancamentos.Create;

         comissao_has_lancamentos.codigo_comissao_representante := strToInt( maior_valor_cadastrado('COMISSAO_REPRESENTANTE', 'CODIGO') );
         comissao_has_lancamentos.codigo_lancamento             := strToInt( maior_valor_cadastrado('LANCAMENTOS', 'CODIGO') );;
         comissao_has_lancamentos.tipo                          := 'Q';

         repositorio.Salvar( comissao_has_lancamentos );

      end;

      salva_debitos_creditos_Q1;

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

function TfrmFechaComissaoRepresentante.salva_segunda_quinzena: Boolean;
var repositorio :TRepositorio;
    Lancamento :TLancamento;
    comissao_has_lancamentos :TComissaoHasLancamentos;
begin
  try
    repositorio := nil;
    Lancamento  := nil;
    comissao_has_lancamentos := nil;

    try
      repositorio             := TFabricaRepositorio.GetRepositorio(TLancamento.ClassName);
      Lancamento              := TLancamento.Create;

      Lancamento.codigo          := edtCodComissao2.AsInteger;
      Lancamento.valor_total     := edtComissaoSaldo2.Value;
      Lancamento.data_vencimento := dtpDataPrevista2.DateTime;
      Lancamento.data_cadastro   := Date;
      Lancamento.descricao       := 'PAGAMENTO COMISSAO PARA REPRESENTANTE '+BuscaPessoa1.edtRazao.Text+
                                    ' REFERENTE A 2ª QUINZENA DE '+ TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ))
                                   +' DE '+ formatDateTime('yyyy', dtpFim.DateTime);
      Lancamento.tipo            := TTipoLancamentoUtilitario.DeStringParaEnumerado('P');  //um lançamento a pagar (comissao rep.)
      Lancamento.observacao      := obsQuinzena2.Text;

      repositorio.Salvar( Lancamento );


      { Se o código for maior que ZERO, a relação ja existe, pois estará alterando }
      if edtCodComissao2.AsInteger = 0 then begin

         { Salva relação entre as tabelas COMISSAO_REPRESENTANTE e LANCAMENTOS, especificando o tipo como Quinzena 'Q' }

         repositorio                := TFabricaRepositorio.GetRepositorio( TComissaoHasLancamentos.ClassName );
         comissao_has_lancamentos   := TComissaoHasLancamentos.Create;

         comissao_has_lancamentos.codigo_comissao_representante := strToInt( maior_valor_cadastrado('COMISSAO_REPRESENTANTE', 'CODIGO') );
         comissao_has_lancamentos.codigo_lancamento             := strToInt( maior_valor_cadastrado('LANCAMENTOS', 'CODIGO') );;
         comissao_has_lancamentos.tipo                          := 'Q';

         repositorio.Salvar( comissao_has_lancamentos );

      end;

      salva_debitos_creditos_Q2;

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

function TfrmFechaComissaoRepresentante.salva_debitos_creditos_Q1: Boolean;
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

        if not Assigned(Lancamento) then Lancamento := TLancamento.Create;

        Lancamento.valor_total     := cdsDebCred1VALOR.AsFloat;
        Lancamento.data_vencimento := dtpDataPrevista.DateTime;
        Lancamento.data_cadastro   := Date;
        Lancamento.descricao       := cdsDebCred1DESCRICAO.AsString;
        Lancamento.tipo            := TTipoLancamentoUtilitario.DeStringParaEnumerado( IfThen(cdsDebCred1TIPO.AsString = 'Débito','R','P'));
                                                                                    // se for débito do representante é a receber para a empresa
        repositorio.Salvar( Lancamento );


        if cdsDebCred1CODIGO.AsInteger = 0 then begin

           { Salva relação entre as tabelas COMISSAO_REPRESENTANTE e LANCAMENTOS, especificando o tipo como Débito ou Crédito 'D' ou 'C' }

           repositorio                := TFabricaRepositorio.GetRepositorio( TComissaoHasLancamentos.ClassName );
           comissao_has_lancamentos   := TComissaoHasLancamentos.Create;

           if cdsDebCred1CODIGO.AsInteger > 0 then
             comissao_has_lancamentos.codigo_lancamento             := cdsDebCred1CODIGO.AsInteger
           else
             comissao_has_lancamentos.codigo_lancamento             := strToInt( maior_valor_cadastrado('LANCAMENTOS', 'CODIGO') );

           if comissao_representante.codigo > 0 then
             comissao_has_lancamentos.codigo_comissao_representante := comissao_representante.codigo
           else
             comissao_has_lancamentos.codigo_comissao_representante := strToInt( maior_valor_cadastrado('COMISSAO_REPRESENTANTE', 'CODIGO') );

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

function TfrmFechaComissaoRepresentante.salva_debitos_creditos_Q2: Boolean;
var repositorio :TRepositorio;
    Lancamento :TLancamento;
    comissao_has_lancamentos :TComissaoHasLancamentos;
begin
  try
    repositorio := nil;
    Lancamento  := nil;
    comissao_has_lancamentos := nil;

    try
      cdsDebCred2.First;
      while not cdsDebCred2.Eof do begin
        repositorio             := TFabricaRepositorio.GetRepositorio(TLancamento.ClassName);
        Lancamento              := TLancamento( repositorio.Get( cdsDebCred2CODIGO.AsInteger ) );

        if not Assigned(Lancamento) then Lancamento := TLancamento.Create;        

        Lancamento.valor_total     := cdsDebCred2VALOR.AsFloat;
        Lancamento.data_vencimento := dtpDataPrevista2.DateTime;
        Lancamento.data_cadastro   := Date;
        Lancamento.descricao       := cdsDebCred2DESCRICAO.AsString;
        Lancamento.tipo            := TTipoLancamentoUtilitario.DeStringParaEnumerado( ifThen(cdsDebCred2TIPO.AsString = 'Débito','R','P'));
                                                                                    // se for débito do representante é a receber para a empresa
        repositorio.Salvar( Lancamento );


        if cdsDebCred2CODIGO.AsInteger = 0 then begin //se o codigo for maior que zero, a relação ja foi salva

           { Salva relação entre as tabelas COMISSAO_REPRESENTANTE e LANCAMENTOS, especificando o tipo como Débito ou Crédito 'D' ou 'C' }

           repositorio                := TFabricaRepositorio.GetRepositorio( TComissaoHasLancamentos.ClassName );
           comissao_has_lancamentos   := TComissaoHasLancamentos.Create;

           if cdsDebCred2CODIGO.AsInteger > 0 then
             comissao_has_lancamentos.codigo_lancamento             := cdsDebCred2CODIGO.AsInteger
           else
             comissao_has_lancamentos.codigo_lancamento             := strToInt( maior_valor_cadastrado('LANCAMENTOS', 'CODIGO') );

           if comissao_representante.codigo > 0 then
             comissao_has_lancamentos.codigo_comissao_representante := comissao_representante.codigo
           else
             comissao_has_lancamentos.codigo_comissao_representante := strToInt( maior_valor_cadastrado('COMISSAO_REPRESENTANTE', 'CODIGO') );

           comissao_has_lancamentos.tipo                          := copy(cdsDebCred2TIPO.AsString, 1, 1);

           repositorio.Salvar( comissao_has_lancamentos );

        end;

        cdsDebCred2.Next;
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
var  Especificacao :TEspecificacao;
     lista_lancamentos_comissao :TObjectList;
     comissao_lancamentos :TComissaoHasLancamentos;
     lancamento          :TLancamento;
     i :Integer;
begin
  repositorio                := nil;
  Especificacao              := nil;
  lista_lancamentos_comissao := nil;
  comissao_lancamentos       := nil;
  lancamento                 := nil;

  try
 
    Especificacao              := TEspecificacaoComissaoRepresentantePorAnoMes.Create( BuscaPessoa1.edtCodigo.AsInteger,
                                                                                       strToInt( formatDateTime('yyyy', dtpFim.DateTime) ),
                                                                                       StrToInt(formatDateTime('mm',dtpFim.DateTime)) );
    repositorio                 := TFabricaRepositorio.GetRepositorio( TComissaoRepresentante.ClassName );
    comissao_representante      := TComissaoRepresentante(repositorio.GetPorEspecificacao(Especificacao));

    if not assigned(comissao_representante) then exit;

    edtCodigo.AsInteger := comissao_representante.codigo;

    Especificacao              := TEspecificacaoCodigosLancamentoPorCodigoComissao.Create( comissao_representante.codigo );
    repositorio                := TFabricaRepositorio.GetRepositorio( TComissaoHasLancamentos.ClassName );
    lista_lancamentos_comissao := repositorio.GetListaPorEspecificacao( Especificacao );

    if assigned(lista_lancamentos_comissao) then
      for i := 0 to lista_lancamentos_comissao.Count - 1 do begin
        comissao_lancamentos := ( lista_lancamentos_comissao.Items[i] as TComissaoHasLancamentos);

        repositorio  := TFabricaRepositorio.GetRepositorio( TLancamento.ClassName );
        lancamento  := TLancamento( repositorio.Get( comissao_lancamentos.codigo_lancamento ) );

        carrega_lancamento( lancamento, comissao_lancamentos.tipo );
      end;

  finally
    freeAndNil(repositorio                );
    freeAndNil(Especificacao              );
    freeAndNil(lista_lancamentos_comissao );
    comissao_lancamentos := nil;
    freeAndNil(lancamento                 );
  end;
end;

procedure TfrmFechaComissaoRepresentante.carrega_lancamento(lancamento: TLancamento; tipo: String);
var  dia :integer;
begin
  dia := strToInt( FormatDateTime('dd', lancamento.data_vencimento) );

  if tipo = 'Q' then begin

    if dia > 20 then // margem de segurança para ser maior que 15, pois data prevista nao pode exceder essa margem
      carrega_segunda_quinzena(lancamento)
    else if dia < 20 then
      carrega_primeira_quinzena(lancamento);

  end
  else begin

    if dia > 20 then
      carrega_debito_credito(lancamento, tipo, cdsDebCred2)
    else
      carrega_debito_credito(lancamento, tipo, cdsDebCred1);

  end;
end;

procedure TfrmFechaComissaoRepresentante.carrega_debito_credito(
  lancamento: TLancamento; tipo: String; cds :TClientDataSet);
begin
  cds.Append;
  cds.fieldByName('CODIGO').AsInteger   := lancamento.codigo;
  cds.fieldByName('VALOR').AsFloat      := lancamento.valor_total;
  cds.fieldByName('TIPO').AsString      := IfThen( tipo = 'D', 'Débito', 'Crédito');
  cds.fieldByName('DESCRICAO').AsString := lancamento.descricao;
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

procedure TfrmFechaComissaoRepresentante.carrega_segunda_quinzena(
  lancamento: TLancamento);
begin
  dtpDataPrevista2.DateTime := lancamento.data_vencimento;
  edtTotComissoes2.Value    := lancamento.valor_total;
  edtCodComissao2.AsInteger := lancamento.codigo;
  obsQuinzena2.Text         := lancamento.observacao;
end;

function TfrmFechaComissaoRepresentante.verifica_condicoes: Boolean;
begin
  Result := false;

  if (edtTotComissoes1.Value <= 0) and (edtTotComissoes2.Value <= 0) then
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
  if cdsQuinzena1.Active then  cdsQuinzena1.EmptyDataSet;
  if cdsQuinzena2.Active then  cdsQuinzena2.EmptyDataSet;
  cdsComissoes1.EmptyDataSet;
  cdsComissoes2.EmptyDataSet;
  cdsDebCred1.EmptyDataSet;
  cdsDebCred2.EmptyDataSet;
  edtTotPedidos1.Clear;
  edtTotPedidos2.Clear;
  edtTotComissoes1.Clear;
  edtTotComissoes2.Clear;
  edtCodigo.clear;
  limpa_deb_cred;
end;

procedure TfrmFechaComissaoRepresentante.preenche_data_prevista;
var data :TDateTime;
begin
  data := strToDate('01/'+formatDateTime('mm',dtpFim.DateTime)+'/'+formatDateTime('yyyy',dtpFim.DateTime));
  data := data + 31; //para ir para o proximo mes

  dtpDataPrevista.Date := strToDateTime( '15/'+formatDateTime('mm/yyyy 00:00:00', data) );
  dtpDataPrevista2.DateTime := strToDateTime( intToStr(DaysInMonth(data) )+ '/' + formatDateTime('mm/yyyy 00:00:00', data) );

       if DayOfWeek(dtpDataPrevista.Date) = 7 then  dtpDataPrevista.Date := dtpDataPrevista.Date + 2  //se for sabado
  else if DayOfWeek(dtpDataPrevista.Date) = 1 then  dtpDataPrevista.Date := dtpDataPrevista.Date + 1; //se for domingo

       if DayOfWeek(dtpDataPrevista2.Date) = 7 then  dtpDataPrevista2.Date := dtpDataPrevista2.Date - 1  //se for sabado
  else if DayOfWeek(dtpDataPrevista2.Date) = 1 then  dtpDataPrevista2.Date := dtpDataPrevista2.Date - 2; //se for domingo
end;

procedure TfrmFechaComissaoRepresentante.btnImprimirClick(Sender: TObject);
begin
  imprime_quinzenas('IMPRIMIR');
end;

procedure TfrmFechaComissaoRepresentante.imprime_quinzenas( acao :String);
var lista: TStringList;
begin
 try
    lista := TStringList.Create;

    // imprime 1ª quinzena

    if UPPERCASE(acao) = 'ENVIAR' then
      if not DirectoryExists(ExtractFilePath(Application.ExeName)+'/comissoes') then
        CreateDir(ExtractFilePath(Application.ExeName)+'/comissoes');

    if not cdsQuinzena1.IsEmpty then begin
      rlRepresentante.Caption := BuscaPessoa1.edtCodigo.Text + ' - ' + BuscaPessoa1.edtRazao.Text;
      rlQuinzenaMes.Caption   := '1ª Quinzena do mês de '+ TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ));
      rlDtPrevista.Caption    := DateToStr(dtpDataPrevista.Date);
      lbTotComissao.Caption   := formatfloat('##,###,##0.00', edtComissaoSaldo1.Value);
      lbTotDebito.Caption     := formatfloat('##,###,##0.00', edtDebitoSaldo1.Value);
      lbTotCredito.Caption    := formatfloat('##,###,##0.00', edtCreditoSaldo1.Value);
      lbTotPagar.Caption      := formatfloat('##,###,##0.00', edtSaldoTotal1.Value);

      if cdsDebCred1.IsEmpty then  RLSubDetail2.Visible := false
                             else  RLSubDetail2.Visible := true;

      rlObservacoes1.Lines.Text := obsQuinzena1.Text;

      if UPPERCASE(acao) = 'IMPRIMIR' then
        RLReport1.PreviewModal;

      if UPPERCASE(acao) = 'ENVIAR' then begin
        RLReport1.SaveToFile( ExtractFilePath(Application.ExeName)+'/comissoes/'+BuscaPessoa1.edtRazao.Text+'_'+
                             TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ))+
                             formatDateTime('yyyy', dtpFim.DateTime) +'_Quinzena1.pdf' );
        RLReport1.Prepare;
        lista.Add( ExtractFilePath(Application.ExeName)+'/comissoes/'+BuscaPessoa1.edtRazao.Text+'_'+
                   TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ))+
                   formatDateTime('yyyy', dtpFim.DateTime) +'_Quinzena1.pdf' );
      end;

    end;

    // imprime 2ª quinzena

    if not cdsQuinzena2.IsEmpty then begin
      rlRepresentante2.Caption := BuscaPessoa1.edtCodigo.Text + ' - ' + BuscaPessoa1.edtRazao.Text;
      rlQuinzenaMes2.Caption   := '2ª Quinzena do mês de '+ TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ));
      rlDtPrevista2.Caption    := DateToStr(dtpDataPrevista2.Date);
      lbTotComissao2.Caption   := formatfloat('##,###,##0.00', edtComissaoSaldo2.Value);
      lbTotDebito2.Caption     := formatfloat('##,###,##0.00', edtDebitoSaldo2.Value);
      lbTotCredito2.Caption    := formatfloat('##,###,##0.00', edtCreditoSaldo2.Value);
      lbTotPagar2.Caption      := formatfloat('##,###,##0.00', edtSaldoTotal2.Value);

      if cdsDebCred2.IsEmpty then  RLSubDetail4.Visible := false
                             else  RLSubDetail4.Visible := true;

      rlObservacoes2.Lines.Text := obsQuinzena2.Text;

      if UPPERCASE(acao) = 'IMPRIMIR' then
        RLReport2.PreviewModal;

      if UPPERCASE(acao) = 'ENVIAR' then begin
        RLReport2.SaveToFile( ExtractFilePath(Application.ExeName)+'/comissoes/'+BuscaPessoa1.edtRazao.Text+'_'+
                              TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ))+
                              formatDateTime('yyyy', dtpFim.DateTime) +'_Quinzena2.pdf' );
        RLReport2.Prepare;
        lista.Add( ExtractFilePath(Application.ExeName)+'/comissoes/'+BuscaPessoa1.edtRazao.Text+'_'+
                             TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ))+
                             formatDateTime('yyyy', dtpFim.DateTime) +'_Quinzena2.pdf' );
      end;
    end;

    if UPPERCASE(acao) = 'ENVIAR' then begin

      if lista.Count <= 0 then  Exit;

      if trim(BuscaPessoa1.Email) = '' then
         avisar('Relatório(s) de comissão não enviado(s). Representante não possui E-mail cadastrado.')
      else
         EnviarEmail(BuscaPessoa1.Email,
                     trim( edtAssunto.Text ),
                     trim( memoTexto.Text ),
                     lista);

      lista.Free;
      lista := nil;
    end;

    RLReport1.Clear;
    RLReport2.Clear;

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
  nX        :integer;
  configuracoes_email          :TConfiguracoesNFEmail;
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

      avisar('Os relatórios de comissão referente a 1ª e 2ª quinzena do mês de '+ TDateTimeUtilitario.mes_extenso( strToInt( formatDateTime('mm', dtpFim.DateTime) ))
            +', foram enviados com sucesso!'+#13#10
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
  if not cdsQuinzena1.IsEmpty then
    limpa_dados;
end;

procedure TfrmFechaComissaoRepresentante.gridDebCred2Enter(
  Sender: TObject);
begin
  inherited;
  if not cdsDebCred2.IsEmpty then begin
    btnAlterar2.Enabled := true;
    btnRemover2.Enabled := true;
  end;
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

procedure TfrmFechaComissaoRepresentante.gridDebCred2Exit(Sender: TObject);
begin
  inherited;
  btnAlterar2.Enabled := false;
  btnRemover2.Enabled := false;  
end;

procedure TfrmFechaComissaoRepresentante.BitBtn1Click(Sender: TObject);
begin
  try
    Aguarda('Enviando e-mail');
 //   lbEnvio.Visible := true;
    imprime_quinzenas('ENVIAR');
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

procedure TfrmFechaComissaoRepresentante.btnRemover2Click(Sender: TObject);
begin
  if cdsDebCred2.IsEmpty then exit;

  remove_deb_cred(cdsDebCred2);
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
  if ((ActiveControl = memoDescricao2) or (ActiveControl = memoDescricao)) and (key = VK_RETURN) then exit;
  inherited;
end;

procedure TfrmFechaComissaoRepresentante.gridQuinzena2DblClick(
  Sender: TObject);
var total_comissao_atual :Real;
begin
  if cdsQuinzena2.IsEmpty then EXIT;

  total_comissao_atual := cdsQuinzena2TOT_VLRCOMISS.AsVariant;

  abre_pedido( cdsQuinzena2NUMPEDIDO.AsString );

  btnBuscar.Click;

  if total_comissao_atual <> cdsQuinzena2TOT_VLRCOMISS.AsVariant then
    avisar('A % de comissão de um pedido foi alterada. Para atualizar o total da comissão da 2ª, salve-a.');

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
  if cdsQuinzena1.IsEmpty then EXIT;

  total_comissao_atual := cdsQuinzena1TOT_VLRCOMISS.AsVariant;

  abre_pedido( cdsQuinzena1NUMPEDIDO.AsString );

  btnBuscar.Click;

  if total_comissao_atual <> cdsQuinzena1TOT_VLRCOMISS.AsVariant then
    avisar('A % de comissão de um pedido foi alterada. Para atualizar o total da comissão da 1ª, salve-a.');
end;

procedure TfrmFechaComissaoRepresentante.limpa_deb_cred;
begin
  edtValor.Clear;
  edtValor2.Clear;
  cbTipo.ItemIndex  := 0;
  cbTipo2.ItemIndex := 0;
  memoDescricao.Clear;
  memoDescricao2.Clear;
end;

end.
