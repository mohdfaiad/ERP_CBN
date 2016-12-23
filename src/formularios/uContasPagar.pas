unit uContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, DB, DBClient, StdCtrls, Grids, DBGrids,
  DBGridCBN, ComCtrls, Buttons, ExtCtrls, frameBuscaNotaFiscal, funcoes,
  frameBuscaPessoa, Mask, RxToolEdit, RxCurrEdit, frameBuscaMateria, contNrs,
  frameBuscaEmpresa, CriaBalaoInformacao, Vcl.DBCtrls, frameBuscaContaBanco;

type
  TStatusItens = (stIncluindo, stAlterando, stCancelando, stSalvando);

type
  TfrmContasPagar = class(TfrmCadastroPadrao)
    TabSheet1: TTabSheet;
    pnlParcelas: TPanel;
    GroupBox1: TGroupBox;
    edtCodigo: TEdit;
    BuscaNotaFiscal1: TBuscaNotaFiscal;
    edtNumDocumento: TCurrencyEdit;
    dtpDataDocumento: TDateTimePicker;
    Label2: TLabel;
    BuscaFornecedor: TBuscaPessoa;
    edtValor: TCurrencyEdit;
    edtObservacao: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cdsItensConta: TClientDataSet;
    dsItensConta: TDataSource;
    cdsItensContaCODIGO: TIntegerField;
    cdsItensContaCODIGO_MATERIA: TIntegerField;
    cdsItensContaMATERIA: TStringField;
    cdsItensContaQUANTIDADE: TFloatField;
    cdsItensContaCUSTO: TFloatField;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    DBGridCBN1: TDBGridCBN;
    edtCodigoItem: TEdit;
    edtQuantidade: TCurrencyEdit;
    edtPrecoCusto: TCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnCancela: TBitBtn;
    btnSalva: TBitBtn;
    cdsParcelas: TClientDataSet;
    dsParcelas: TDataSource;
    cdsCODIGO: TIntegerField;
    cdsDT_DOCUMENTO: TDateField;
    cdsDESC_STATUS: TStringField;
    cdsVALOR: TFloatField;
    cdsNUM_DOCUMENTO: TIntegerField;
    Label8: TLabel;
    edtParcela: TCurrencyEdit;
    lbParcelas: TLabel;
    edtTotalConta: TCurrencyEdit;
    Label10: TLabel;
    rgEntrada: TRadioGroup;
    edtVencimento: TMaskEdit;
    lbVencimento: TLabel;
    btnGerarParcelas: TBitBtn;
    cdsParcelasCODIGO: TIntegerField;
    cdsParcelasNUM_PARCELA: TIntegerField;
    cdsParcelasVENCIMENTO: TDateField;
    cdsParcelasSTATUS: TStringField;
    cdsParcelasVALOR: TFloatField;
    btnReceber: TBitBtn;
    edtValorPago: TCurrencyEdit;
    Label12: TLabel;
    edtPago: TCurrencyEdit;
    cbxStatus: TComboBox;
    cdsParcelasVALOR_PAGO: TFloatField;
    Label13: TLabel;
    edtDataLancamento: TEdit;
    BuscaMateria1: TBuscaMateria;
    DBGridCBN2: TDBGridCBN;
    edtValorPendente: TCurrencyEdit;
    edtNParcela: TCurrencyEdit;
    Label14: TLabel;
    Label15: TLabel;
    lbPagar: TLabel;
    btnExtornar: TBitBtn;
    cdsParcelasPAGAMENTO: TStringField;
    edtIntervalo: TCurrencyEdit;
    lbIntervalo: TLabel;
    cdsFORNECEDOR: TStringField;
    cdsVALOR_PENDENTE: TFloatField;
    gpbPeriodo: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    Shape1: TShape;
    chkPeriodoGeral: TCheckBox;
    gpbStatus: TGroupBox;
    cbxStatusFilter: TComboBox;
    btnFiltrar: TBitBtn;
    btnCancelaConta: TSpeedButton;
    gpbFiltroFornecedor: TGroupBox;
    BuscaFornecedor2: TBuscaPessoa;
    SpeedButton1: TSpeedButton;
    GroupBox5: TGroupBox;
    edtNDoc: TCurrencyEdit;
    cdsQTDPARCELAS: TIntegerField;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    cdsTOTVALOR: TAggregateField;
    cdsTOTPENDENTE: TAggregateField;
    Label16: TLabel;
    Label17: TLabel;
    cdsCOD_CONTA_BANCO: TSmallintField;
    GroupBox3: TGroupBox;
    chkDebitoAut: TCheckBox;
    Shape2: TShape;
    BuscaContaBanco1: TBuscaContaBanco;
    GroupBox4: TGroupBox;
    Shape3: TShape;
    Label18: TLabel;
    Label19: TLabel;
    GroupBox6: TGroupBox;
    chkDebAutomatico: TCheckBox;
    cdsTITULAR_CONTA: TStringField;
    cdsNUMERO_CONTA: TStringField;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnSalvaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGerarParcelasClick(Sender: TObject);
    procedure rgEntradaClick(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure edtPagoChange(Sender: TObject);
    procedure edtValorPagoChange(Sender: TObject);
    procedure DBGridCBN2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsParcelasAfterScroll(DataSet: TDataSet);
    procedure btnExtornarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelaContaClick(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure gridConsultaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure chkPeriodoGeralClick(Sender: TObject);
    procedure dtpInicioExit(Sender: TObject);
    procedure dtpFimExit(Sender: TObject);
    procedure gridConsultaEnter(Sender: TObject);
    procedure gridConsultaExit(Sender: TObject);
    procedure DBGridCBN2Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtIntervaloChange(Sender: TObject);
    procedure edtNDocEnter(Sender: TObject);
    procedure edtNDocExit(Sender: TObject);
    procedure BuscaNotaFiscal1Exit(Sender: TObject);
    procedure DBGridCBN2DblClick(Sender: TObject);
    procedure chkDebitoAutClick(Sender: TObject);
    procedure chkDebAutomaticoClick(Sender: TObject);
  private
    { Altera um registro existente no CDS de consulta }
    procedure AlterarRegistroNoCDS(Registro :TObject); override;

    { Carrega todos os registros pra aba de Consulta }
    procedure CarregarDados;                           override;

    procedure ExecutarDepoisAlterar;                   override;
    procedure ExecutarDepoisIncluir;                   override;
    procedure ExecutarDepoisSalvar;                    override;
    procedure ExecutarDepoisConsultar;                 override;

    { Inclui um registro no CDS }
    procedure IncluirRegistroNoCDS(Registro :TObject); override;

    { Limpa as informações da aba Dados }
    procedure LimparDados;                             override;

    { Mostra um registro detalhado na aba de Dados   }
    procedure MostrarDados;                            override;

  private
    { Persiste os dados no banco de dados }
    function GravarDados   :TObject;                   override;

    { Verifica os dados antes de persistir }
    function VerificaDados :Boolean;                   override;

  private
    FCodigoNotaFiscal :integer;

    procedure HabilDesabilAcoesItem(status :TStatusItens);
    procedure HabilDesabilTela;
    procedure gerarParcelas;
    procedure efetuaPagamento;
    procedure extornaRecebimento;
    procedure calculaTotalConta;
    procedure cancelaConta;
    procedure alterarVencimento;

    function totaisDiferentes :boolean;
    function CarregaPelaNota(codigo :integer; const trocaAba :Boolean = true) :Boolean;

  public
    property CodigoNotaFiscal :integer read FCodigoNotaFiscal write FCodigoNotaFiscal;
  end;

var
  frmContasPagar: TfrmContasPagar;

implementation

uses ContasPagar, FabricaRepositorio, repositorio, TipoPessoa, ItemConta, Parcela, EspecificacaoContaPorPeriodoTipo,
  uPadrao, StrUtils, Math, NotaFiscal, TotaisNotaFiscal, ItemNFMateria, Pessoa;

{$R *.dfm}

{ TfrmContasPagar }

procedure TfrmContasPagar.btnNovoClick(Sender: TObject);
begin
  HabilDesabilAcoesItem(stIncluindo);

end;

procedure TfrmContasPagar.btnEditarClick(Sender: TObject);
begin
  if cdsItensConta.IsEmpty then
    Exit;

  habilDesabilAcoesItem(stAlterando);
  btnEditar.Tag := 1;

  edtCodigoItem.Text       := intToStr( cdsItensContaCODIGO.AsInteger );
  BuscaMateria1.codMateria := cdsItensContaCODIGO_MATERIA.AsInteger;
  edtPrecoCusto.Value      := cdsItensContaCUSTO.AsFloat;
  edtQuantidade.Value      := cdsItensContaQUANTIDADE.asFloat;

end;

procedure TfrmContasPagar.HabilDesabilAcoesItem(status: TStatusItens);
begin
   BuscaMateria1.Enabled := status in [stAlterando, stIncluindo];
   edtPrecoCusto.Enabled := status in [stAlterando, stIncluindo];
   edtQuantidade.Enabled := status in [stAlterando, stIncluindo];

   btnNovo.Enabled    := status in [stCancelando, stSalvando];
   btnEditar.Enabled  := status in [stCancelando, stSalvando];
   btnCancela.Enabled := status in [stIncluindo, stAlterando];
   btnSalva.Enabled   := status in [stIncluindo, stAlterando];

   if status in [stIncluindo, stAlterando] then
     BuscaMateria1.edtCodigo.SetFocus;
end;

procedure TfrmContasPagar.alterarVencimento;
var data :TDateTime;
    limite_min, limite_max :Boolean;
begin
 try

   data := StrToDateDef(chamaInput('DATE', 'Digite o novo vencimento'), 0);
   if data = 0 then
     raise Exception.Create('Data não informada. Operação abortada.');

   limite_min := true;
   limite_max := true;

   if cdsParcelas.RecNo > 1 then
   begin
     cdsParcelas.Prior;
     limite_min := data > cdsParcelasVENCIMENTO.AsDateTime;
     cdsParcelas.Next;
   end;

   if cdsParcelas.RecNo < cdsParcelas.RecordCount then
   begin
     cdsParcelas.Next;
     limite_max := data < cdsParcelasVENCIMENTO.AsDateTime;
     cdsParcelas.Prior;
   end;

   if not limite_min then
     avisar('Vencimento informado inválido, pois deve ser maior que o vencimento da parcela anterior.')
   else if not limite_max then
     avisar('Vencimento informado inválido, pois deve ser menor que o vencimento da parcela seguinte.')
   else
   begin
     cdsParcelas.Edit;
     cdsParcelasVENCIMENTO.AsDateTime := data;
     cdsParcelas.Post;
   end;

 except
   on e :Exception do
     avisar(e.Message);
 end;

end;

procedure TfrmContasPagar.btnCancelaClick(Sender: TObject);
begin
  HabilDesabilAcoesItem(stCancelando);

  edtCodigoItem.Clear;
  BuscaMateria1.Clear;
  edtPrecoCusto.Clear;
  edtQuantidade.Clear;

  btnEditar.Tag := 0;
end;

procedure TfrmContasPagar.btnSalvaClick(Sender: TObject);
begin
  if edtPrecoCusto.Value <= 0 then
  begin
    avisar('O preço de custo deve ser informado');
    edtPrecoCusto.SetFocus;
  end
  else if edtQuantidade.Value <= 0 then
  begin
    avisar('A quantidade deve ser informada');
    edtQuantidade.SetFocus;
  end
  else
  begin
    HabilDesabilAcoesItem(stSalvando);

    if (btnEditar.Tag = 1) then
    begin
      cdsItensConta.Edit;
      btnEditar.Tag := 0;
    end
    else
      cdsItensConta.Append;

    cdsItensContaCODIGO.AsInteger         := StrToIntDef(edtCodigoItem.Text,0);  
    cdsItensContaCODIGO_MATERIA.AsInteger := BuscaMateria1.edtCodigo.AsInteger;
    cdsItensContaMATERIA.AsString         := BuscaMateria1.edtDescricao.Text;
    cdsItensContaQUANTIDADE.AsFloat       := edtQuantidade.Value;
    cdsItensContaCUSTO.AsFloat            := edtPrecoCusto.Value;
    cdsItensConta.Post;

    calculaTotalConta;

    btnCancela.Click;

    if pnlDados.Enabled then
      btnNovo.SetFocus;
  end;  
end;

procedure TfrmContasPagar.AlterarRegistroNoCDS(Registro: TObject);
var
  Conta :TContasPagar;
begin
  inherited;

  Conta := (Registro as TContasPagar);

  self.cds.Edit;
  self.cdsCODIGO.AsInteger          := Conta.codigo;
  self.cdsDT_DOCUMENTO.AsDateTime   := Conta.dt_documento;
  self.cdsNUM_DOCUMENTO.AsInteger   := Conta.num_documento;
  self.cdsDESC_STATUS.AsString      := Conta.desc_status;
  self.cdsQTDPARCELAS.AsInteger     := Conta.Parcelas.Count;
  self.cdsVALOR.AsFloat             := Conta.valor;
  self.cdsCOD_CONTA_BANCO.AsInteger := Conta.codContaBanco;
  self.cds.Post;
end;

procedure TfrmContasPagar.CarregarDados;
var
  Contas      :TObjectList;
  Repositorio :TRepositorio;
  nX          :Integer;
  Especificacao :TEspecificacaoContaPorPeriodoTipo;
  status      :String;
  dti, dtf    :TDateTime;
begin
  inherited;
  cds.EmptyDataSet;

  Repositorio        := nil;
  Contas             := nil;
  Especificacao      := nil;

  try
    status := IfThen(cbxStatusFilter.ItemIndex > 0, cbxStatusFilter.Items[cbxStatusFilter.itemIndex], '');

    if dtpFim.Enabled then
    begin
      dti    := dtpInicio.DateTime;
      dtf    := dtpFim.DateTime;
    end
    else
    begin
      dti    := 0;
      dtf    := 0;
    end;

    Repositorio   := TFabricaRepositorio.GetRepositorio(TContasPagar.ClassName);
    Especificacao := TEspecificacaoContaPorPeriodoTipo.Create(dti, dtf, status, BuscaFornecedor2.edtCodigo.AsInteger, edtNDoc.AsInteger);
    Contas        := Repositorio.GetListaPorEspecificacao(Especificacao);

    if Assigned(Contas) and (Contas.Count > 0) then begin

       for nX := 0 to (Contas.Count-1) do
         self.IncluirRegistroNoCDS(Contas.Items[nX]);

    end;

  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Contas);
  end;
end;

procedure TfrmContasPagar.ExecutarDepoisAlterar;
begin
  inherited;
  edtNumDocumento.SetFocus;
  HabilDesabilTela;
end;

procedure TfrmContasPagar.ExecutarDepoisIncluir;
begin
  inherited;
  edtNumDocumento.SetFocus;
  edtDataLancamento.Text   := DateToStr(Date);
  HabilDesabilTela;
end;

function TfrmContasPagar.GravarDados: TObject;
var
  Conta       :TContasPagar;
  ItemConta   :TItemConta;
  Parcela     :TParcela;
  Repositorio :TRepositorio;
begin
   Conta        := nil;
   ItemConta    := nil;
   Parcela      := nil;
   Repositorio  := nil;


   try
     Repositorio  := TFabricaRepositorio.GetRepositorio(TContasPagar.ClassName);
     Conta        := TContasPagar(Repositorio.Get(StrToIntDef(self.edtCodigo.Text, 0)));

     if not Assigned(Conta) then
      Conta := TContasPagar.Create;

     if BuscaNotaFiscal1.codNotaFiscal > 0 then
       Conta.codigo_nf := BuscaNotaFiscal1.codNotaFiscal;

     Conta.dt_documento             := self.dtpDataDocumento.DateTime;
     Conta.dt_lancamento            := strToDateTime(self.edtDataLancamento.Text);
     Conta.num_documento            := self.edtNumDocumento.AsInteger;
     Conta.cod_fornecedor           := StrToInt(BuscaFornecedor.edtCodigo.Text);
     Conta.status                   := copy(self.cbxStatus.Items[ cbxStatus.itemIndex ], 1, 1);
     Conta.desc_status              := self.cbxStatus.Items[ cbxStatus.itemIndex ];
     Conta.valor                    := self.edtTotalConta.Value;
     Conta.observacao               := self.edtObservacao.Text;
     Conta.codContaBanco            := BuscaContaBanco1.edtCodigo.AsInteger;

     Repositorio.Salvar(Conta);

     if (EstadoTela = tetIncluir) or (EstadoTela = tetAlterar) then
     begin
       Repositorio := TFabricaRepositorio.GetRepositorio(TItemConta.ClassName);
       cdsItensConta.First;
       while not cdsItensConta.Eof do
       begin
          ItemConta := TItemConta.Create;
          ItemConta.codigo         := cdsItensContaCODIGO.AsInteger;
          ItemConta.codigo_conta   := Conta.codigo;
          ItemConta.codigo_materia := cdsItensContaCODIGO_MATERIA.AsInteger;
          ItemConta.quantidade     := cdsItensContaQUANTIDADE.AsFloat;
          ItemConta.preco_custo    := cdsItensContaCUSTO.AsFloat;

          Repositorio.Salvar(ItemConta);

          cdsItensConta.Next;
       end;
     end;

     Repositorio := TFabricaRepositorio.GetRepositorio(TParcela.ClassName);
     cdsParcelas.First;
     while not cdsParcelas.Eof do
     begin
        Parcela := TParcela(Repositorio.Get(cdsParcelasCODIGO.AsInteger));

        if not assigned(Parcela) then
          Parcela := TParcela.Create;

        Parcela.codigo_conta  := Conta.codigo;
        Parcela.num_parcela   := cdsParcelasNUM_PARCELA.AsInteger;
        Parcela.dt_vencimento := cdsParcelasVENCIMENTO.AsDateTime;
        if cdsParcelasPAGAMENTO.AsString <> '' then
          Parcela.dt_pagamento  := cdsParcelasPAGAMENTO.AsDateTime;
        Parcela.status        := copy(cdsParcelasSTATUS.AsString, 1, 1);
        Parcela.desc_status   := cdsParcelasSTATUS.AsString;
        Parcela.valor         := cdsParcelasVALOR.AsFloat;
        Parcela.valor_pago    := cdsParcelasVALOR_PAGO.AsFloat;

        Repositorio.Salvar(Parcela);

        cdsParcelas.Next;
     end;
     result := Conta;

   finally
     FreeAndNil(Repositorio);
   end;

end;

procedure TfrmContasPagar.IncluirRegistroNoCDS(Registro: TObject);
var
  Conta :TContasPagar;
  Fornecedor :TPessoa;
  repositorio :TRepositorio;
  i :integer;
  totalPago :Real;
begin
  inherited;
 try
  Conta       := (Registro as TContasPagar);
  repositorio := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
  Fornecedor  := TPessoa(repositorio.Get(Conta.cod_fornecedor));
  totalPago   := 0;

  for i := 0 to Conta.Parcelas.Count - 1 do
    totalPago := totalPago + TParcela(Conta.Parcelas.Items[i]).valor_pago;

  self.cds.Append;
  self.cdsCODIGO.AsInteger          := Conta.codigo;
  self.cdsDT_DOCUMENTO.AsDateTime   := Conta.dt_documento;
  self.cdsNUM_DOCUMENTO.AsInteger   := Conta.num_documento;
  self.cdsDESC_STATUS.AsString      := Conta.desc_status;
  self.cdsQTDPARCELAS.AsInteger     := Conta.Parcelas.Count;
  self.cdsVALOR.AsFloat             := Conta.valor;
  self.cdsFORNECEDOR.AsString       := Fornecedor.Razao;
  self.cdsVALOR_PENDENTE.AsFloat    := Conta.valor - totalPago;
  self.cdsCOD_CONTA_BANCO.AsInteger := Conta.codContaBanco;

  if assigned(Conta.ContaBanco) then
  begin
    self.cdsTITULAR_CONTA.AsString    := Conta.ContaBanco.titular;
    self.cdsNUMERO_CONTA.AsString     := Conta.ContaBanco.numero_conta;
  end;
  self.cds.Post;

 Finally
   FreeAndNil(repositorio);
   FreeAndNil(Fornecedor);
 end;
end;

procedure TfrmContasPagar.LimparDados;
begin
  edtCodigo.Clear;
  BuscaNotaFiscal1.limpa;
  edtNumDocumento.Clear;
  dtpDataDocumento.DateTime := Date;
  cbxStatus.ItemIndex := 0;
  edtValor.Clear;
  edtPago.Clear;
  edtNParcela.Clear;
  edtValorPendente.Clear;
  BuscaFornecedor.limpa;
  edtObservacao.Clear;
  btnCancela.Click;
  cdsItensConta.EmptyDataSet;
  cdsParcelas.EmptyDataSet;
  edtParcela.Clear;
  edtIntervalo.Clear;
  rgEntrada.ItemIndex := 1;
  edtVencimento.Clear;
  BuscaNotaFiscal1.Enabled := true;
  BuscaNotaFiscal1.btnBusca.Visible := true;
end;

procedure TfrmContasPagar.MostrarDados;
var
  Conta                                :TContasPagar;
  RepositorioConta                     :TRepositorio;
  i :integer;
begin
  inherited;

  Conta                                := nil;
  RepositorioConta                     := nil;

  try
    RepositorioConta    := TFabricaRepositorio.GetRepositorio(TContasPagar.ClassName);
    Conta               := TContasPagar(RepositorioConta.Get(self.cdsCODIGO.AsInteger));

    if not Assigned(Conta) then exit;

    BuscaNotaFiscal1.edtNrNota.Text     := Campo_por_campo('NOTAS_FISCAIS','NUMERO_NOTA_FISCAL','CODIGO', self.cdsCODIGO.AsString);
    edtCodigo.Text                      := IntToStr(Conta.codigo);
    edtNumDocumento.Text                := intToStr(Conta.num_documento);
    dtpDataDocumento.DateTime           := Conta.dt_documento;
    edtDataLancamento.Text              := DateToStr(Conta.dt_lancamento);
    cbxStatus.ItemIndex                 := cbxStatus.Items.IndexOf( Conta.desc_status );
    edtValor.Value                      := Conta.valor;
    BuscaFornecedor.cod_pessoa          := IntToStr(Conta.cod_fornecedor);
    edtObservacao.Text                  := Conta.observacao;
    chkDebitoAut.Checked                := (Conta.codContaBanco > 0);
    chkDebitoAutClick(nil);

    if cdsDESC_STATUS.AsString <> 'ABERTA' then
      chkDebitoAut.Enabled := false;

    BuscaContaBanco1.codConta           := Conta.codContaBanco;
    edtTotalConta.Value                 := Conta.valor;

    for i := 0 to conta.ItensConta.Count -1 do
    begin
      edtCodigoItem.Text       := IntToStr(TItemConta(conta.ItensConta[i]).codigo);
      BuscaMateria1.codMateria := TItemConta(conta.ItensConta[i]).codigo_materia;
      edtPrecoCusto.Value      := BuscaMateria1.Materia.preco_custo;
      edtQuantidade.Value      := TItemConta(conta.ItensConta[i]).quantidade;
      edtPrecoCusto.Value      := TItemConta(conta.ItensConta[i]).preco_custo;
      btnSalva.Click;
    end;

    if assigned(conta.Parcelas) then
      for i := 0 to Conta.Parcelas.Count - 1 do
      begin
        cdsParcelas.Append;
        cdsParcelasCODIGO.AsInteger      := TParcela(Conta.Parcelas.items[i]).codigo;
        cdsParcelasNUM_PARCELA.AsInteger := TParcela(Conta.Parcelas.items[i]).num_parcela;
        cdsParcelasVENCIMENTO.AsDateTime := TParcela(Conta.Parcelas.items[i]).dt_vencimento;
        cdsParcelasPAGAMENTO.AsString    := DateToStr( TParcela(Conta.Parcelas.items[i]).dt_pagamento );
        cdsParcelasSTATUS.AsString       := TParcela(Conta.Parcelas.items[i]).desc_status;
        cdsParcelasVALOR.AsFloat         := TParcela(Conta.Parcelas.items[i]).valor;
        cdsParcelasVALOR_PAGO.AsFloat    := TParcela(Conta.Parcelas.items[i]).valor_pago;
        cdsParcelas.Post;

        edtPago.Value := edtPago.Value + TParcela(Conta.Parcelas.items[i]).valor_pago;
      end;

      edtParcela.AsInteger := Conta.Parcelas.Count;

      BuscaNotaFiscal1.btnBusca.Visible := false;
      BuscaNotaFiscal1.Enabled := false;
  Except
    FreeAndNil(Conta);
    FreeAndNil(RepositorioConta);
  end;
end;

function TfrmContasPagar.VerificaDados: Boolean;
begin
  result := false;

  if edtNumDocumento.AsInteger <= 0 then
  begin
     avisar('Nº do documento deve ser informado');
     pgGeral.ActivePageIndex := 1;     
     edtNumDocumento.SetFocus;
  end
  else if BuscaFornecedor.edtCodigo.AsInteger <= 0 then
  begin
     avisar('Fornecedor deve ser informado');
     pgGeral.ActivePageIndex := 1;
     BuscaFornecedor.edtCodigo.SetFocus;
  end
  else if cdsItensConta.IsEmpty then
  begin
     avisar('Nenhum item foi informado');
     pgGeral.ActivePageIndex := 1;
     btnNovo.SetFocus;
  end
  else if cdsParcelas.IsEmpty then
  begin
     avisar('As parcelas não foram geradas');
     pgGeral.ActivePageIndex := 2;
     edtParcela.SetFocus;
  end
  else if totaisDiferentes then
  begin
     avisar('O total da conta difere do total das parcelas.'+#13#10+'Favor gerar as parcelas novamente.');
     pgGeral.ActivePageIndex := 2;
     edtIntervalo.SetFocus;
  end
  else
    result := true;

end;

procedure TfrmContasPagar.FormShow(Sender: TObject);
begin
  cdsItensConta.CreateDataSet;
  cdsParcelas.CreateDataSet;
  BuscaNotaFiscal1.SemContaAssociada := true;
  BuscaNotaFiscal1.EntradaSaida := 'E';

  if FCodigoNotaFiscal > 0 then
  begin
   
    btnIncluir.Click;
    btnCancelar.Enabled   := false;
    tsConsulta.TabVisible := false;

    if not CarregaPelaNota(FCodigoNotaFiscal) then
      self.ModalResult := mrCancel;

  end;
end;

procedure TfrmContasPagar.FormCreate(Sender: TObject);
begin
  dtpInicio.DateTime := strToDateTime( formatDateTime('dd/mm/yyyy 00:00:00', date) );
  dtpFim.DateTime    := strToDateTime( formatDateTime('dd/mm/yyyy 23:59:59', date) );
  inherited;
  BuscaFornecedor.TipoPessoa := tpFornecedor;
  BuscaFornecedor2.TipoPessoa := tpFornecedor;
end;

procedure TfrmContasPagar.btnGerarParcelasClick(Sender: TObject);
begin
  if edtParcela.AsInteger <= 0 then
  begin
    avisar('O quantidade de parcelas deve ser informada');
    edtParcela.SetFocus;
  end
  else if (edtParcela.AsInteger > 1) and (edtIntervalo.AsInteger <= 0) then
  begin
    avisar('O intervalo entre as parcelas deve ser informado');
    edtIntervalo.SetFocus;
  end
  else if trim(edtVencimento.Text) = '/  /' then
  begin
    avisar('O vencimento deve ser informado');
    edtVencimento.SetFocus;
  end
  else if edtTotalConta.Value = 0 then
  begin
    avisar('Impossível gerar parcelas. Total da conta está zerado.');
    edtParcela.SetFocus;
  end
  else
    gerarParcelas;

end;

procedure TfrmContasPagar.gerarParcelas;
var
  i :integer;
  data :TDateTime;
  valor, diferenca, totsomado :Real;
begin
  data      := StrToDateTime(edtVencimento.Text);
  valor     := RoundTo(edtTotalConta.Value / edtParcela.AsInteger, -2);
  diferenca := 0;

  if cdsParcelasCODIGO.AsInteger = 0 then
    cdsParcelas.EmptyDataSet;

  for i := 1 to edtParcela.AsInteger do
  begin
    totsomado := totsomado + valor;

    if i = edtParcela.AsInteger then
      diferenca := edtTotalConta.Value - totsomado;

    if (cdsParcelas.recordcount > 0) and (cdsParcelasCODIGO.AsInteger > 0) then
    begin
      cdsParcelas.Recno := i;
      cdsParcelas.Edit;
    end
    else
      cdsParcelas.Append;

    cdsParcelasNUM_PARCELA.AsInteger := i;
    cdsParcelasVENCIMENTO.AsDateTime := data;
    cdsParcelasSTATUS.AsString       := 'ABERTA';
    cdsParcelasVALOR.AsFloat         := valor + diferenca;
    cdsParcelas.Post;

    data := data + edtIntervalo.AsInteger;
  end;
end;

procedure TfrmContasPagar.rgEntradaClick(Sender: TObject);
begin
  if rgEntrada.ItemIndex = 0 then
    edtVencimento.Text := DateToStr(Date)
  else
  begin
    if edtIntervalo.AsInteger > 0 then
      edtVencimento.Text := DateToStr(Date + edtIntervalo.AsInteger)
    else
      edtVencimento.Clear;  
  end;

end;

procedure TfrmContasPagar.btnReceberClick(Sender: TObject);
begin
  if edtValorPago.Value <= 0 then
  begin
    avisar('Nenhum valor de pagamento informado');
    edtValorPago.SetFocus;
  end
  else
  begin
    if confirma('Confirma pagamento da parcela Nº '+cdsParcelasNUM_PARCELA.AsString) then
      efetuaPagamento;
  end;
end;

procedure TfrmContasPagar.efetuaPagamento;
var ValorParcela, ValorPago :Real;
begin
  ValorParcela := cdsParcelasVALOR.AsFloat;
  ValorPago    := edtValorPago.Value;

  cdsParcelas.Edit;
  cdsParcelasVALOR_PAGO.AsFloat   := cdsParcelasVALOR_PAGO.AsFloat + ValorPago;
  cdsParcelasSTATUS.AsString      := IfThen(ValorPago < ValorParcela, 'PARCIAL', 'QUITADA');
  cdsParcelasPAGAMENTO.AsString   := DateToStr(Date);
  cdsParcelas.Post;

  edtPago.Value := edtPago.Value + edtValorPago.Value;
  edtValorPago.Clear;

  HabilDesabilTela;

  cdsParcelasAfterScroll(nil);
end;

procedure TfrmContasPagar.edtValorChange(Sender: TObject);
begin
  edtTotalConta.Value := edtValor.Value;
end;

procedure TfrmContasPagar.calculaTotalConta;
begin
  edtTotalConta.Clear;
  cdsItensConta.First;
  while not cdsItensConta.Eof do
  begin
    edtTotalConta.Value := edtTotalConta.Value + roundTo(cdsItensContaQUANTIDADE.AsFloat * cdsItensContaCUSTO.AsFloat, -2);

    cdsItensConta.Next;
  end;
end;

procedure TfrmContasPagar.edtPagoChange(Sender: TObject);
begin
       if edtPago.Value = 0 then
       begin
          cbxStatus.ItemIndex := 0;
          HabilDesabilTela;
       end
  else if edtPago.Value < edtTotalConta.Value then
          cbxStatus.ItemIndex := 1
  else if edtPago.Value = edtTotalConta.Value then
          cbxStatus.ItemIndex := 2;
end;

procedure TfrmContasPagar.edtValorPagoChange(Sender: TObject);
begin
  if edtValorPago.Value > edtValorPendente.Value then
    edtValorPago.Value := edtValorPendente.Value;
end;

procedure TfrmContasPagar.DBGridCBN2DblClick(Sender: TObject);
begin
  if cdsParcelasSTATUS.AsString <> 'Q' then
    alterarVencimento
  else
    avisar('Uma parcela QUITADA, não pode ter o vencimento alterado.');
end;

procedure TfrmContasPagar.DBGridCBN2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with TDBgridCbn(Sender) do
  begin
    if (Column.Field.FieldName = 'STATUS') then
    begin
      Canvas.Font.Style := [fsBold];

      if cdsParcelasSTATUS.AsString = 'ABERTA' then
        Canvas.Font.Color:= clMaroon
      else if cdsParcelasSTATUS.AsString = 'PARCIAL' then
        Canvas.Font.Color:= $00009595
      else if cdsParcelasSTATUS.AsString = 'QUITADA' then
        Canvas.Font.Color:= clGreen
      else if cdsParcelasSTATUS.AsString = 'CANCELADA' then
        Canvas.Font.Color:= clMaroon;

      Canvas.Brush.Color := clWhite;
    end
    else if (Column.Field.FieldName = 'PAGAMENTO') then
    begin

      if cdsParcelasPAGAMENTO.AsString = '30/12/1899' then
      begin
        if (gdSelected in State) then
          Canvas.Font.Color := $0098E0B7
        else
          Canvas.Font.Color := Canvas.brush.color;
      end
      else
        Canvas.Font.Color:= clBlack;
    end;

    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmContasPagar.cdsParcelasAfterScroll(DataSet: TDataSet);
begin
  edtNParcela.AsInteger  := cdsParcelasNUM_PARCELA.AsInteger;
  edtValorPendente.Value := (cdsParcelasVALOR.AsFloat - cdsParcelasVALOR_PAGO.AsFloat);
  btnExtornar.Enabled    := (cdsParcelasVALOR_PAGO.Value > 0);
  btnReceber.Enabled     := (cdsParcelasVALOR_PAGO.Value < cdsParcelasVALOR.Value);
end;

procedure TfrmContasPagar.chkDebAutomaticoClick(Sender: TObject);
begin
  if not chkDebAutomatico.Checked then
    cds.Filtered := false
  else
  begin
    cds.Filtered := false;
    cds.Filter   := 'COD_CONTA_BANCO > 0';
    cds.Filtered := true;
  end;
end;

procedure TfrmContasPagar.chkDebitoAutClick(Sender: TObject);
begin
  chkDebitoAut.Caption := IfThen(chkDebitoAut.Checked, 'Desativar débito automático', 'Ativar débito automático');

  if chkDebitoAut.Checked then
    BuscaContaBanco1.Enabled := true
  else
  begin
    BuscaContaBanco1.Enabled := false;
    BuscaContaBanco1.Clear;
  end;
end;

procedure TfrmContasPagar.btnExtornarClick(Sender: TObject);
begin
  if cdsParcelasVALOR_PAGO.AsFloat > 0 then
    if confirma('Confirma extorno do recebimento referente a parcela Nº '+cdsParcelasNUM_PARCELA.AsString+'?') then
      extornaRecebimento;

end;

procedure TfrmContasPagar.extornaRecebimento;
begin
  edtPago.Value := edtPago.Value - cdsParcelasVALOR_PAGO.AsFloat;

  cdsParcelas.Edit;
  cdsParcelasVALOR_PAGO.AsFloat   := 0;
  cdsParcelasPAGAMENTO.AsDateTime := StrToDateTime('30/12/1899');
  cdsParcelasSTATUS.AsString      := 'ABERTA';
  cdsParcelas.Post;

  cdsParcelasAfterScroll(nil);
end;

procedure TfrmContasPagar.btnCancelarClick(Sender: TObject);
begin
  inherited;
  btnReceber.Visible       := false;
  edtValorPago.Visible     := false;
  btnExtornar.Visible      := false;
  lbPagar.Visible          := false;
  edtParcela.Visible       := false;
  edtIntervalo.Visible     := false;
  rgEntrada.Visible        := false;
  btnGerarParcelas.Visible := false;
  edtVencimento.Visible    := false;
  lbParcelas.Visible       := false;
  lbIntervalo.Visible      := false;
  lbVencimento.Visible     := false;
end;

procedure TfrmContasPagar.btnSalvarClick(Sender: TObject);
begin
  inherited;
  HabilDesabilTela;
end;

procedure TfrmContasPagar.BuscaNotaFiscal1Exit(Sender: TObject);
begin
  if BuscaNotaFiscal1.codNotaFiscal > 0 then
    CarregaPelaNota(BuscaNotaFiscal1.codNotaFiscal);
end;

procedure TfrmContasPagar.HabilDesabilTela;
begin
   btnReceber.Visible       := (EstadoTela = tetAlterar);
   edtValorPago.Visible     := (EstadoTela = tetAlterar);
   btnExtornar.Visible      := (EstadoTela = tetAlterar);
   lbPagar.Visible          := (EstadoTela = tetAlterar);
   edtParcela.Visible       := (EstadoTela = tetIncluir) or (edtPago.Value = 0);
   edtIntervalo.Visible     := (EstadoTela = tetIncluir) or (edtPago.Value = 0);   
   rgEntrada.Visible        := (EstadoTela = tetIncluir) or (edtPago.Value = 0);
   btnGerarParcelas.Visible := (EstadoTela = tetIncluir) or (edtPago.Value = 0);
   edtVencimento.Visible    := (EstadoTela = tetIncluir) or (edtPago.Value = 0);
   lbParcelas.Visible       := (EstadoTela = tetIncluir) or (edtPago.Value = 0);
   lbIntervalo.Visible      := (EstadoTela = tetIncluir) or (edtPago.Value = 0);
   lbVencimento.Visible     := (EstadoTela = tetIncluir) or (edtPago.Value = 0);
   edtParcela.enabled       := (EstadoTela = tetIncluir);
   btnCancelaConta.Enabled  := (EstadoTela = tetConsultar) or (EstadoTela = tetSalvar);

   btnNovo.Enabled   := (EstadoTela = tetIncluir) or (edtPago.Value = 0);
   btnEditar.Enabled := (EstadoTela = tetIncluir) or (edtPago.Value = 0);
end;

function TfrmContasPagar.CarregaPelaNota(codigo :integer; const trocaAba :Boolean) :Boolean;
var
  i :integer;
  repositorio :TRepositorio;
  NotaFiscal  :TNotaFiscal;
begin
 try
 try
   result := false;

   repositorio := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);
   NotaFiscal  := TNotaFiscal( repositorio.Get( codigo ) );

   if not assigned(NotaFiscal) then
     raise Exception.Create('Nota Fiscal não encontrada');

   edtNumDocumento.AsInteger  := NotaFiscal.NumeroNotaFiscal;
   dtpDataDocumento.DateTime  := NotaFiscal.DataEmissao;
   edtDataLancamento.Text     := DateToStr(Date);
   edtValor.Value             := NotaFiscal.Totais.TotalNF;
   BuscaFornecedor.cod_pessoa := IntToStr(NotaFiscal.Emitente.Codigo);

   cdsItensConta.EmptyDataSet;
   for i := 0 to NotaFiscal.Itens.Count - 1 do
   begin
     BuscaMateria1.codMateria := TItemNFMateria(NotaFiscal.Itens[i]).codigo_materia;
     edtPrecoCusto.Value      := TItemNFMateria(NotaFiscal.Itens[i]).valor_unitario;
     edtQuantidade.Value      := TItemNFMateria(NotaFiscal.Itens[i]).quantidade;
     btnSalva.Click;
   end;

   if trocaAba then
     self.pgGeral.ActivePageIndex := 2;

   result := true;

 Except
   on e :Exception do
     raise Exception.Create(e.Message);
 end;
 finally
   FreeAndNil(repositorio);
   FreeAndNil(NotaFiscal);
 end;
end;

procedure TfrmContasPagar.ExecutarDepoisSalvar;
begin
  if FCodigoNotaFiscal > 0 then
    self.ModalResult := mrOk;

  self.CarregarDados;  
  inherited;
end;

procedure TfrmContasPagar.btnCancelaContaClick(Sender: TObject);
begin
  if not cds.IsEmpty then
    if confirma('Confirma cancelamento da conta selecionada?') then
      cancelaConta;
end;

procedure TfrmContasPagar.cancelaConta;
var
  Conta       :TContasPagar;
  Repositorio :TRepositorio;
  motivo_cancelamento :String;
begin
   motivo_cancelamento := chamaInput('TEXT', 'Motivo do cancelamento');

   if length(motivo_cancelamento) < 6 then
   begin
     avisar('O motivo do cancelamento deve ser informado. Operação abortada.');
     exit;
   end;

   Conta        := nil;
   Repositorio  := nil;

   try
     Repositorio  := TFabricaRepositorio.GetRepositorio(TContasPagar.ClassName);
     Conta        := TContasPagar(Repositorio.Get( cdsCODIGO.AsInteger ));

     Conta.status := 'C';
     Conta.desc_status := 'CANCELADA';
     Conta.observacao  := motivo_cancelamento;

     Repositorio.Salvar(Conta);

     AlterarRegistroNoCDS(Conta);

     cdsAfterScroll(nil);

   finally
     FreeAndNil(Repositorio);
     FreeAndNil(Conta);
   end;
end;

procedure TfrmContasPagar.cdsAfterScroll(DataSet: TDataSet);
begin
  btnIncluir.Enabled      := not (cdsDESC_STATUS.AsString = 'CANCELADA');
  btnAlterar.Enabled      := not (cdsDESC_STATUS.AsString = 'CANCELADA');
  btnCancelaConta.Enabled := not (cdsDESC_STATUS.AsString = 'CANCELADA');
end;

procedure TfrmContasPagar.ExecutarDepoisConsultar;
begin
  inherited;
  HabilDesabilTela;
end;

procedure TfrmContasPagar.gridConsultaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
with TDBgridCbn(Sender) do
  begin
    if (Column.Field.FieldName = 'DESC_STATUS') then
    begin
      Canvas.Font.Style := [fsBold];

      if cdsDESC_STATUS.AsString = 'ABERTA' then
        Canvas.Font.Color:= clMaroon
      else if cdsDESC_STATUS.AsString = 'PARCIAL' then
        Canvas.Font.Color:= $00009595
      else if cdsDESC_STATUS.AsString = 'QUITADA' then
        Canvas.Font.Color:= clGreen
      else if cdsDESC_STATUS.AsString = 'CANCELADA' then
        Canvas.Font.Color:= clSilver;

      Canvas.Brush.Color := clWhite;
    end
    else
    begin
      if (cdsCOD_CONTA_BANCO.AsInteger > 0) and (cdsDESC_STATUS.AsString <> 'QUITADA') then
        Canvas.Brush.Color := $0091B5FF;
    end;

    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

function TfrmContasPagar.totaisDiferentes: boolean;
var totalParcelas, totalConta :Real;
begin
  totalParcelas := 0;
  totalConta    := roundTo(edtTotalConta.Value,-2);

  cdsParcelas.First;
  while not cdsParcelas.Eof do
  begin
    totalParcelas := totalParcelas + roundTo(cdsParcelasVALOR.AsFloat,-2);
    cdsParcelas.Next;
  end;

  result := (FloatToStr(totalParcelas) <> FloatToStr(totalConta) );
end;

procedure TfrmContasPagar.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  self.CarregarDados;
  
  if cds.IsEmpty then
    avisar('Nenhuma conta foi encontrada, com as características informadas nos filtros.');
end;

procedure TfrmContasPagar.chkPeriodoGeralClick(Sender: TObject);
begin
  dtpInicio.Enabled := not(chkPeriodoGeral.Checked);
  dtpFim.Enabled    := not(chkPeriodoGeral.Checked);
end;

procedure TfrmContasPagar.dtpInicioExit(Sender: TObject);
begin
  if dtpInicio.DateTime > dtpFim.DateTime then
    dtpInicio.DateTime := dtpFim.DateTime;
end;

procedure TfrmContasPagar.dtpFimExit(Sender: TObject);
begin
  if dtpFim.DateTime < dtpInicio.DateTime then
    dtpFim.DateTime := dtpInicio.DateTime;
end;

procedure TfrmContasPagar.gridConsultaEnter(Sender: TObject);
begin
  inherited;
  btnCancelaConta.Enabled := true;
end;
  
procedure TfrmContasPagar.gridConsultaExit(Sender: TObject);
begin
  inherited;
  btnCancelaConta.Enabled := false;
end;

procedure TfrmContasPagar.DBGridCBN2Enter(Sender: TObject);
begin
  cdsParcelasAfterScroll(nil);
end;

procedure TfrmContasPagar.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  BuscaFornecedor2.limpa;
end;

procedure TfrmContasPagar.edtIntervaloChange(Sender: TObject);
begin
  rgEntradaClick(nil);
end;

procedure TfrmContasPagar.edtNDocEnter(Sender: TObject);
begin
   TCriaBalaoInformacao.ShowBalloonTip(edtNDoc.Handle, 'Atenção! Ao utilizar esse filtro, os demais serão ignorados.', 'Informação', 1);
end;

procedure TfrmContasPagar.edtNDocExit(Sender: TObject);
begin
  inherited;
   TCriaBalaoInformacao.HideBalloonTip(edtNDoc.Handle);
end;

end.
