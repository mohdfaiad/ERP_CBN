unit uParcelamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, frameBuscaPedido, Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, DBGridCBN, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Datasnap.DBClient, Vcl.Buttons, Vcl.ExtCtrls, contnrs;

type
  TfrmParcelamento = class(TfrmPadrao)
    DBGridCBN1: TDBGridCBN;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    BuscaPedido1: TBuscaPedido;
    edtTotalPedido: TCurrencyEdit;
    Label18: TLabel;
    edtParcelas: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtIntervalo: TCurrencyEdit;
    btnGerar: TBitBtn;
    cds: TClientDataSet;
    ds: TDataSource;
    cdsCODIGO: TIntegerField;
    cdsNUMERO: TIntegerField;
    cdsVALOR: TFloatField;
    cdsVENCIMENTO: TDateField;
    edtVencimento: TMaskEdit;
    lbVencimento: TLabel;
    pnlBotoes: TPanel;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    btnAddParcela: TBitBtn;
    btnRemoveParcela: TBitBtn;
    cdsDeletadas: TClientDataSet;
    cdsDeletadasCODIGO: TIntegerField;
    procedure btnGerarClick(Sender: TObject);
    procedure BuscaPedido1Exit(Sender: TObject);
    procedure BuscaPedido1edtNumPedidoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnRemoveParcelaClick(Sender: TObject);
    procedure btnAddParcelaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure gerarParcelas;
    procedure LimpaTela;
    function salvar :Boolean;
    function salvaRemovidas :Boolean;   
    procedure carregarParcelas(parcelas :TObjectList);
    procedure armazenaDeletada;
  public
    { Public declarations }
  end;

var
  frmParcelamento: TfrmParcelamento;

implementation

uses Math, Parcela, repositorio, fabricaRepositorio;

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

  edtParcelas.AsInteger := edtParcelas.AsInteger - 1;
  gerarParcelas;  
end;

procedure TfrmParcelamento.btnAddParcelaClick(Sender: TObject);
begin
  edtParcelas.AsInteger := edtParcelas.AsInteger + 1;
  gerarParcelas;
end;

procedure TfrmParcelamento.btnCancelarClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TfrmParcelamento.btnGerarClick(Sender: TObject);
begin
  if edtParcelas.AsInteger <= 0 then
  begin
    avisar('O quantidade de parcelas deve ser informada');
    edtParcelas.SetFocus;
  end
  else if (edtParcelas.AsInteger > 1) and (edtIntervalo.AsInteger <= 0) then
  begin
    avisar('O intervalo entre as parcelas deve ser informado');
    edtIntervalo.SetFocus;
  end
  else if trim(edtVencimento.Text) = '/  /' then
  begin
    avisar('O vencimento deve ser informado');
    edtVencimento.SetFocus;
  end
  else if edtVencimento.Text = '' then
  begin
    avisar('Impossível gerar parcelas. Total da conta está zerado.');
    edtParcelas.SetFocus;
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
   BuscaPedido1.limpa;
 end;
end;

procedure TfrmParcelamento.BuscaPedido1edtNumPedidoChange(Sender: TObject);
begin
  limpaTela;
end;

procedure TfrmParcelamento.BuscaPedido1Exit(Sender: TObject);
begin
  inherited;
  if BuscaPedido1.edtNumPedido.Text = '' then
    BuscaPedido1.limpa;
  
  if not assigned(BuscaPedido1.Ped) then
  begin
    BuscaPedido1.btnBuscar.Click;
    BuscaPedido1.edtNumPedido.SetFocus;
  end
  else
  begin
    edtTotalPedido.Value := BuscaPedido1.Ped.valor_total;
    carregarParcelas(BuscaPedido1.Ped.Parcelas);
    edtParcelas.Enabled    := not assigned(BuscaPedido1.Ped.Parcelas);
    edtIntervalo.Enabled   := not assigned(BuscaPedido1.Ped.Parcelas);
    edtVencimento.Enabled  := not assigned(BuscaPedido1.Ped.Parcelas);
    btnGerar.Enabled       := not assigned(BuscaPedido1.Ped.Parcelas);
    btnRemoveParcela.Enabled := assigned(BuscaPedido1.Ped.Parcelas);
    btnAddParcela.Enabled    := assigned(BuscaPedido1.Ped.Parcelas);
  end;
end;

procedure TfrmParcelamento.carregarParcelas(parcelas: TObjectList);
var i :integer;
begin
  if not assigned(parcelas) then
    exit;

  edtParcelas.Value := parcelas.Count;


  for i := 0 to parcelas.Count - 1 do
  begin
    if i = 0 then
      edtVencimento.Text := DateToStr(TParcela(parcelas[i]).dt_vencimento)
    else if i = 2 then
      edtIntervalo.Value := TParcela(parcelas[i]).dt_vencimento - cdsVENCIMENTO.AsDateTime;

    cds.Append;
    cdsCODIGO.AsInteger      := TParcela(parcelas[i]).codigo;
    cdsNUMERO.AsInteger      := cds.RecordCount + 1;
    cdsVALOR.AsFloat         := TParcela(parcelas[i]).valor;
    cdsVENCIMENTO.AsDateTime := TParcela(parcelas[i]).dt_vencimento;
    cds.Post;
  end;

end;

procedure TfrmParcelamento.FormCreate(Sender: TObject);
begin
  inherited;
  cds.CreateDataSet;
end;

procedure TfrmParcelamento.FormShow(Sender: TObject);
begin
  BuscaPedido1.edtNumPedido.SetFocus;
end;

procedure TfrmParcelamento.gerarParcelas;
var
  i :integer;
  data :TDateTime;
  valor, diferenca, totsomado :Real;
begin
  data      := StrToDateTime(edtVencimento.Text);
  valor     := RoundTo(edtTotalPedido.Value / edtParcelas.AsInteger, -2);
  diferenca := 0;

  if cdsCODIGO.AsInteger = 0 then
    cds.EmptyDataSet;

  cds.first;  
  for i := 1 to edtParcelas.AsInteger do
  begin
    totsomado := totsomado + valor;

    if i = edtParcelas.AsInteger then
      diferenca := edtTotalPedido.Value - totsomado;

    if (cds.recordcount >= i) and (cdsCODIGO.AsInteger > 0) then
    begin
     // cds.Recno := i;
      cds.Edit;
    end
    else
      cds.Append;

    cdsNUMERO.AsInteger := i;
    cdsVENCIMENTO.AsDateTime := data;
    cdsVALOR.AsFloat         := valor + diferenca;
    cds.Post;

    data := data + edtIntervalo.AsInteger;
    cds.next;
  end;
end;

procedure TfrmParcelamento.LimpaTela;
begin
  edtTotalPedido.Clear;
  edtParcelas.Clear;
  edtIntervalo.Clear;
  edtVencimento.Clear;

  if cds.Active then
    cds.EmptyDataSet;
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
        
      Parcela.codigo_pedido := BuscaPedido1.Ped.Codigo;
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

end.
