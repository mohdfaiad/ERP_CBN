unit uParcelamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, frameBuscaPedido, Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, DBGridCBN, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Datasnap.DBClient, Vcl.Buttons, Vcl.ExtCtrls, contnrs, Vcl.ComCtrls, frameBuscaFormaPagamento, frameBuscaNotaFiscal;

type
  TfrmParcelamento = class(TfrmPadrao)
    pnlBotoes: TPanel;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    BitBtn1: TBitBtn;
    cds: TClientDataSet;
    cdsCODIGO: TIntegerField;
    cdsNUMERO: TIntegerField;
    cdsVALOR: TFloatField;
    cdsVENCIMENTO: TDateField;
    ds: TDataSource;
    cdsDeletadas: TClientDataSet;
    cdsDeletadasCODIGO: TIntegerField;
    Label1: TLabel;
    GridParcelas: TDBGridCBN;
    GroupBox1: TGroupBox;
    Label18: TLabel;
    lbVencimento: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtTotalParcelas: TCurrencyEdit;
    btnGerar: TBitBtn;
    BuscaFormaPagamento1: TBuscaFormaPagamento;
    dtpVencimento: TDateTimePicker;
    edtNParcelas: TCurrencyEdit;
    edtIntervalo: TCurrencyEdit;
    btnAddParcela: TBitBtn;
    btnRemoveParcela: TBitBtn;
    pnlNovaData: TPanel;
    Label4: TLabel;
    dtpNovaData: TDateTimePicker;
    btnConfirma: TBitBtn;
    btnCancela: TBitBtn;
    Panel1: TPanel;
    Label5: TLabel;
    Shape1: TShape;
    BuscaNotaFiscal: TBuscaNotaFiscal;
    Label6: TLabel;
    edtValorParcela: TCurrencyEdit;
    procedure btnGerarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnRemoveParcelaClick(Sender: TObject);
    procedure btnAddParcelaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BuscaFormaPagamento1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure GridParcelasDblClick(Sender: TObject);
    procedure BuscaNotaFiscalExit(Sender: TObject);
    procedure cdsAfterPost(DataSet: TDataSet);
    procedure cdsAfterDelete(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FDataAtual :TDate;

    procedure gerarParcelas;
    procedure LimpaTela;
    function salvar :Boolean;
    function salvaRemovidas :Boolean;
    procedure carregarParcelas(parcelas :TObjectList);
    procedure armazenaDeletada;
    procedure validaDataSelecionada;
    procedure recalculaValoresParcelas;

    function intervalo :integer;
    function calculaTotalParcelas :Real;
  public
    { Public declarations }
  end;

var
  frmParcelamento: TfrmParcelamento;

implementation

uses Math, Parcela, repositorio, fabricaRepositorio, FormaPagamentoParcelas, PedidoFaturado;

{$R *.dfm}

procedure TfrmParcelamento.armazenaDeletada;
begin
  if not cdsDeletadas.Active then
    cdsDeletadas.CreateDataSet;
  cdsDeletadas.Append;
  cdsDeletadasCODIGO.AsInteger := cdsCODIGO.AsInteger;
  cdsDeletadas.Post;
end;

procedure TfrmParcelamento.btnRemoveParcelaClick(Sender: TObject);
begin
  cds.Last;
  if cdsCODIGO.AsInteger > 0 then
    armazenaDeletada;

  cds.Delete;
  edtNParcelas.AsInteger := edtNParcelas.AsInteger - 1;
  gerarParcelas;
end;

procedure TfrmParcelamento.BitBtn1Click(Sender: TObject);
begin
  LimpaTela;
  BuscaNotaFiscal.edtNrNota.Clear;
end;

procedure TfrmParcelamento.btnAddParcelaClick(Sender: TObject);
begin
  edtNParcelas.AsInteger := edtNParcelas.AsInteger + 1;
  gerarParcelas;
end;

procedure TfrmParcelamento.btnCancelaClick(Sender: TObject);
begin
  pnlNovaData.Visible:= false;
  pnlBotoes.Enabled := true;
  GroupBox1.Enabled := true;
  GridParcelas.Enabled := true;
  btnAddParcela.Enabled := true;
  btnRemoveParcela.Enabled := true;
end;

procedure TfrmParcelamento.btnCancelarClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TfrmParcelamento.btnConfirmaClick(Sender: TObject);
begin
  try
    if (edtValorParcela.Value <= 0) or (edtValorParcela.Value > (edtTotalParcelas.Value - 1)) then
    begin
      avisar('Favor informar um valor válido para a parcela');
      edtValorParcela.SetFocus;
      exit;
    end;
    validaDataSelecionada;
    recalculaValoresParcelas;

    cds.Edit;
    cdsVENCIMENTO.AsDateTime := dtpNovaData.DateTime;
    cdsVALOR.AsFloat         := edtValorParcela.Value;
    cds.Post;
    btnCancela.Click;

  Except
    on e :Exception do
      avisar(e.Message);
  end;
end;

procedure TfrmParcelamento.btnGerarClick(Sender: TObject);
begin
  if not assigned(BuscaFormaPagamento1.FormaPagamento) then
  begin
    avisar('Primeiramente selecione uma forma de pagamento.');
    BuscaFormaPagamento1.edtCodigo.SetFocus;
  end
  else if edtTotalParcelas.Value = 0 then
  begin
    avisar('Impossível gerar parcelas. Total da conta está zerado.');
    BuscaNotaFiscal.edtNrNota.SetFocus;
  end
  else
    gerarParcelas;
end;

procedure TfrmParcelamento.btnSalvarClick(Sender: TObject);
begin
 if salvar then
 begin
   avisar('Parcelas salvas com sucesso!');
   LimpaTela;
   BuscaNotaFiscal.limpa;
 end;
end;

procedure TfrmParcelamento.BuscaFormaPagamento1Exit(Sender: TObject);
begin
  if assigned(BuscaFormaPagamento1.FormaPagamento) then
  begin
    edtIntervalo.AsInteger := intervalo;
    edtNParcelas.AsInteger := BuscaFormaPagamento1.FormaPagamento.Parcelas.Count;
  end;
end;

procedure TfrmParcelamento.BuscaNotaFiscalExit(Sender: TObject);
begin
  inherited;
  if BuscaNotaFiscal.edtNrNota.Text = '' then
    BuscaNotaFiscal.limpa;

  if not assigned(BuscaNotaFiscal.NotaFiscal) then
  begin
    BuscaNotaFiscal.btnBusca.Click;
    BuscaNotaFiscal.edtNrNota.SetFocus;
  end
  else
  begin
    BuscaNotaFiscal.edtNrNota.Enabled := false;
    cds.EmptyDataSet;
    if cdsDeletadas.Active then
      cdsDeletadas.EmptyDataSet;
    edtTotalParcelas.Value := calculaTotalParcelas;
    carregarParcelas(BuscaNotaFiscal.NotaFiscal.Parcelas);
    BuscaFormaPagamento1.codigoFormaPagamento := BuscaNotaFiscal.NotaFiscal.FormaPagamento.Codigo;
    dtpVencimento.Enabled                     := not assigned(BuscaNotaFiscal.NotaFiscal.Parcelas);
    btnGerar.Enabled                          := not assigned(BuscaNotaFiscal.NotaFiscal.Parcelas);
    edtNParcelas.Enabled                      := not assigned(BuscaNotaFiscal.NotaFiscal.Parcelas);
    edtIntervalo.Enabled                      := not assigned(BuscaNotaFiscal.NotaFiscal.Parcelas);
    BuscaFormaPagamento1.visible              := not assigned(BuscaNotaFiscal.NotaFiscal.Parcelas);
   // BuscaFormaPagamento1.edtCodigo.Enabled    := not assigned(BuscaNotaFiscal.NotaFiscal.Parcelas);
  //  BuscaFormaPagamento1.btnBusca.Enabled     := not assigned(BuscaNotaFiscal.NotaFiscal.Parcelas);
   // BuscaFormaPagamento1.edtDescricao.Enabled := not assigned(BuscaNotaFiscal.NotaFiscal.Parcelas);
    btnRemoveParcela.Enabled                  := assigned(BuscaNotaFiscal.NotaFiscal.Parcelas);
    btnAddParcela.Enabled                     := assigned(BuscaNotaFiscal.NotaFiscal.Parcelas);
  // BuscaFormaPagamento1Exit(nil);
  end;
end;

function TfrmParcelamento.calculaTotalParcelas: Real;
var totalPedidos :Real;
    i: integer;
begin
  result := 0;
  if not assigned(BuscaNotaFiscal.NotaFiscal.PedidosFaturados) then
    exit;

  totalPedidos := 0;
  for i := 0 to BuscaNotaFiscal.NotaFiscal.PedidosFaturados.Count - 1 do
    totalPedidos := totalPedidos + TPedidoFaturado(BuscaNotaFiscal.NotaFiscal.PedidosFaturados.Items[i]).Pedido.valor_total;

  result := totalPedidos - BuscaNotaFiscal.NotaFiscal.Totais.TotalNF;
end;

procedure TfrmParcelamento.carregarParcelas(parcelas: TObjectList);
var i :integer;
    dt_ini :TDateTime;
    total :Real;
begin
  if not assigned(parcelas) then
    exit;

  total              := 0;
  edtNParcelas.Value := parcelas.Count;

  for i := 0 to parcelas.Count - 1 do
  begin
    if i = 0 then
      dtpVencimento.DateTime := TParcela(parcelas[i]).dt_vencimento
    else if i = 1 then
      edtIntervalo.AsInteger := trunc(TParcela(parcelas[i]).dt_vencimento - dtpVencimento.DateTime);

    total := total + TParcela(parcelas[i]).valor;

    cds.Append;
    cdsCODIGO.AsInteger      := TParcela(parcelas[i]).codigo;
    cdsNUMERO.AsInteger      := cds.RecordCount + 1;
    cdsVALOR.AsFloat         := TParcela(parcelas[i]).valor;
    cdsVENCIMENTO.AsDateTime := TParcela(parcelas[i]).dt_vencimento;
    cds.Post;
  end;

  edtTotalParcelas.Value := total;
end;

procedure TfrmParcelamento.cdsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  btnRemoveParcela.Enabled := cds.RecordCount > 1;
end;

procedure TfrmParcelamento.cdsAfterPost(DataSet: TDataSet);
begin
  inherited;
  btnRemoveParcela.Enabled := cds.RecordCount > 1;
end;

procedure TfrmParcelamento.cdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  FDataAtual := cdsVENCIMENTO.AsDateTime;
end;

procedure TfrmParcelamento.FormCreate(Sender: TObject);
begin
  inherited;
  cds.CreateDataSet;
end;

procedure TfrmParcelamento.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_escape) and assigned(BuscaNotaFiscal.NotaFiscal) then
    if not confirma('Deseja cancelar alterações e sair?') then
      key := 0;
  inherited;
end;

procedure TfrmParcelamento.FormShow(Sender: TObject);
begin
  BuscaNotaFiscal.edtNrNota.SetFocus;
end;

procedure TfrmParcelamento.gerarParcelas;
var
  i :integer;
  dataIni, dataVenc :TDateTime;
  valor, diferenca, totsomado :Real;
begin
  dataIni   := dtpVencimento.DateTime;
  valor     := RoundTo(edtTotalParcelas.Value / edtNParcelas.AsInteger, -2);
  diferenca := 0;

  if cdsCODIGO.AsInteger = 0 then
    cds.EmptyDataSet;

  cds.first;  
  for i := 1 to edtNParcelas.AsInteger do
  begin
    totsomado := totsomado + valor;

    if i = edtNParcelas.AsInteger then
      diferenca := edtTotalParcelas.Value - totsomado;

    if (cds.recordcount >= i) and (cdsCODIGO.AsInteger > 0) then
      cds.Edit
    else
      cds.Append;

    cdsNUMERO.AsInteger      := i;
    cdsVENCIMENTO.AsDateTime := dataIni;
    cdsVALOR.AsFloat         := valor + diferenca;
    cds.Post;

    dataIni := dataIni + edtIntervalo.AsInteger;
    cds.next;
  end;
end;

procedure TfrmParcelamento.GridParcelasDblClick(Sender: TObject);
begin
  dtpNovaData.Date      := cdsVENCIMENTO.AsDateTime;
  edtValorParcela.Value := cdsVALOR.AsFloat;
  pnlNovaData.Visible   := true;
  pnlBotoes.Enabled     := false;
  GroupBox1.Enabled     := false;
  GridParcelas.Enabled  := false;
  btnAddParcela.Enabled := false;
  btnRemoveParcela.Enabled := false;
  dtpNovaData.SetFocus;
end;

function TfrmParcelamento.intervalo: integer;
var diaIni, i :integer;
begin
  diaIni := 0;
  if assigned(BuscaNotaFiscal.NotaFiscal.Parcelas) then
  begin
    for i := 0 to BuscaNotaFiscal.NotaFiscal.Parcelas.Count -1 do
      if i = 1 then
      begin
        result := trunc(((BuscaNotaFiscal.NotaFiscal.Parcelas[i] as TParcela).dt_vencimento-(BuscaNotaFiscal.NotaFiscal.Parcelas[i-1] as TParcela).dt_vencimento));
        break;
      end;
  end
  else if assigned(BuscaFormaPagamento1.FormaPagamento) then
  begin
    for i := 0 to BuscaFormaPagamento1.FormaPagamento.Parcelas.Count -1 do
      if i = 1 then
      begin
        result := ((BuscaFormaPagamento1.FormaPagamento.Parcelas[i] as TFormaPagamentoParcelas).DiasParcela-
                   (BuscaFormaPagamento1.FormaPagamento.Parcelas[i-1] as TFormaPagamentoParcelas).DiasParcela);
        break;
      end;
  end;
end;

procedure TfrmParcelamento.LimpaTela;
begin
  edtTotalParcelas.Clear;
  BuscaFormaPagamento1.limpa;
  edtNParcelas.Clear;
  edtIntervalo.Clear;
  dtpVencimento.DateTime := Date;
  BuscaFormaPagamento1.Visible := true;
  BuscaNotaFiscal.limpa;

  if not BuscaNotaFiscal.edtNrNota.Enabled then
     BuscaNotaFiscal.edtNrNota.Enabled := true;

  BuscaNotaFiscal.edtNrNota.SetFocus;
  BuscaNotaFiscal.edtNrNota.SelectAll;

  if cds.Active then
    cds.EmptyDataSet;
end;

procedure TfrmParcelamento.recalculaValoresParcelas;
var registroAlterado :integer;
    diferenca, reajuste, totalDistribuido :Real;
begin
  totalDistribuido := 0;
  registroAlterado := cds.RecNo;
  reajuste         := edtTotalParcelas.Value - edtValorParcela.Value;
  reajuste         := roundto((reajuste / (cds.RecordCount - 1)),-2);
  totalDistribuido := reajuste * (cds.RecordCount - 1);
  diferenca        := edtTotalParcelas.Value - (totalDistribuido + edtValorParcela.Value);

  cds.First;
  while not cds.Eof do
  begin
    if cds.RecNo <> registroAlterado then
    begin
      cds.Edit;
      cdsVALOR.AsFloat := reajuste + diferenca;
      cds.Post;
      diferenca := 0;
    end;
    cds.Next;
  end;

  cds.RecNo := registroAlterado;
end;

function TfrmParcelamento.salvar :Boolean;
var Parcela :TParcela;
    repositorio :TRepositorio;
begin
  if not cdsDeletadas.IsEmpty then
    salvaRemovidas;
  
  result := false;
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TParcela.ClassName);

    cds.First;
    while not cds.Eof do
    begin
      Parcela := TParcela(repositorio.Get(cdsCODIGO.AsInteger));

      if not assigned(Parcela) then
        Parcela := TParcela.Create;
        
      Parcela.codigo_nota_fiscal := BuscaNotaFiscal.NotaFiscal.CodigoNotaFiscal;
      Parcela.num_parcela   := cdsNUMERO.AsInteger;
      Parcela.dt_vencimento := cdsVENCIMENTO.AsDateTime;
      Parcela.valor         := cdsVALOR.AsFloat;

      repositorio.Salvar(Parcela);
      cds.Next;
    end;

    result := true;
  finally
    FreeAndNil(Parcela);
    FreeAndNil(repositorio);
  end;
end;

function TfrmParcelamento.salvaRemovidas: Boolean;
var Parcela :TParcela;
    repositorio :TRepositorio;
begin
  try
    result := false;
    repositorio := TFabricaRepositorio.GetRepositorio(TParcela.ClassName);
    cdsDeletadas.First;

    while not cdsDeletadas.Eof do
    begin
      Parcela     := TParcela(repositorio.Get(cdsDeletadasCODIGO.AsInteger));
      repositorio.Remover(Parcela);
      
      cdsDeletadas.Next;
      FreeAndNil(Parcela);
    end;
    
  finally
    FreeAndNil(repositorio);
  end;  
end;

procedure TfrmParcelamento.validaDataSelecionada;
var dataAnterior, dataSeguinte, dataAtual :TDate;
begin
  dataAtual := dtpNovaData.Date;

  if cds.RecNo > 1 then
  begin
    cds.Prior;
    if dataAtual < cdsVENCIMENTO.AsDateTime then
    begin
      cds.Next;
      raise Exception.Create('Data selecionada deve ser maior que a data da parcela anterior');
    end;
    cds.Next;
  end;

  if cds.RecNo < cds.RecordCount then
  begin
    cds.Next;
    if dataAtual > cdsVENCIMENTO.AsDateTime then
    begin
      cds.Prior;
      raise Exception.Create('Data selecionada deve ser menor que a data da parcela seguinte');
    end;
    cds.Prior;
  end;

end;

end.
