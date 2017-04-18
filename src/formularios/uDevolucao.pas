unit uDevolucao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.StrUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, frameBuscaPedido, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider, Datasnap.DBClient,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, DBGridCBN, Item, Vcl.ComCtrls,
  Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TfrmDevolucao = class(TfrmPadrao)
    pgcDevolucoes: TPageControl;
    TabSheet1: TTabSheet;
    Devolucao: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnMarcar: TSpeedButton;
    btnDesmarcar: TSpeedButton;
    btnVoltarTodo: TSpeedButton;
    btnDevolverTodo: TSpeedButton;
    DBGridCBN1: TDBGridCBN;
    edtMotivo: TEdit;
    GroupBox1: TGroupBox;
    BuscaPedido1: TBuscaPedido;
    Panel1: TPanel;
    DBGridCBN2: TDBGridCBN;
    cdsDevolvidos: TClientDataSet;
    cdsDevolvidosCODIGO: TIntegerField;
    cdsDevolvidosQTD_RN: TFloatField;
    cdsDevolvidosQTD_P: TFloatField;
    cdsDevolvidosQTD_M: TFloatField;
    cdsDevolvidosQTD_G: TFloatField;
    cdsDevolvidosQTD_1: TFloatField;
    cdsDevolvidosQTD_2: TFloatField;
    cdsDevolvidosQTD_3: TFloatField;
    cdsDevolvidosQTD_4: TFloatField;
    cdsDevolvidosQTD_6: TFloatField;
    cdsDevolvidosQTD_8: TFloatField;
    cdsDevolvidosQTD_10: TFloatField;
    cdsDevolvidosQTD_12: TFloatField;
    cdsDevolvidosQTD_14: TFloatField;
    cdsDevolvidosQTD_UNICA: TFloatField;
    cdsDevolvidosCOR: TStringField;
    cdsDevolvidosPRODUTO: TStringField;
    cdsDevolvidosDEVOLVIDO: TStringField;
    ds: TDataSource;
    cdsNormais: TClientDataSet;
    cdsNormaisCODIGO: TIntegerField;
    cdsNormaisQTD_RN: TFloatField;
    cdsNormaisQTD_P: TFloatField;
    cdsNormaisQTD_M: TFloatField;
    cdsNormaisQTD_G: TFloatField;
    cdsNormaisQTD_1: TFloatField;
    cdsNormaisQTD_2: TFloatField;
    cdsNormaisQTD_3: TFloatField;
    cdsNormaisQTD_4: TFloatField;
    cdsNormaisQTD_6: TFloatField;
    cdsNormaisQTD_8: TFloatField;
    cdsNormaisQTD_10: TFloatField;
    cdsNormaisQTD_12: TFloatField;
    cdsNormaisQTD_14: TFloatField;
    cdsNormaisQTD_UNICA: TFloatField;
    cdsNormaisCOR: TStringField;
    cdsNormaisPRODUTO: TStringField;
    cdsNormaisDEVOLVIDO: TStringField;
    dsDevolvidos: TDataSource;
    DBGridCBN3: TDBGridCBN;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    gpbPeriodo: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    chkPeriodoGeral: TCheckBox;
    dsDevolucoes: TDataSource;
    btnBuscar: TBitBtn;
    qryDevolucoes: TFDQuery;
    qryDevolucoesCODIGO: TIntegerField;
    qryDevolucoesCODIGO_PEDIDO: TIntegerField;
    qryDevolucoesDATA: TDateField;
    qryDevolucoesMOTIVO: TStringField;
    qryDevolucoesPARCIAL_TOTAL: TStringField;
    qryDevolucoesNUMPEDIDO: TStringField;
    btnCriar: TBitBtn;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    edtDesconto: TCurrencyEdit;
    Label17: TLabel;
    Label8: TLabel;
    edtTotBruto: TCurrencyEdit;
    Label9: TLabel;
    edtDescontoFP: TCurrencyEdit;
    Label10: TLabel;
    edtTotLiquido: TCurrencyEdit;
    procedure BuscaPedido1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridCBN1Enter(Sender: TObject);
    procedure DBGridCBN1Exit(Sender: TObject);
    procedure DBGridCBN2Enter(Sender: TObject);
    procedure DBGridCBN2Exit(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure btnDesmarcarClick(Sender: TObject);
    procedure btnDevolverTodoClick(Sender: TObject);
    procedure btnVoltarTodoClick(Sender: TObject);
    procedure cdsNormaisAfterDelete(DataSet: TDataSet);
    procedure cdsDevolvidosAfterDelete(DataSet: TDataSet);
    procedure btnBuscarClick(Sender: TObject);
    procedure pgcDevolucoesChange(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
    procedure DevolucaoEnter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    procedure montaSql;

    procedure limpaTela;
    procedure carregaPedido;
    procedure insereItem(Item: TItem; cds: TClientDataSet);
    procedure transfereItem(cdsOrigem, cdsDestino :TClientDataSet);
    procedure SalvaDevolucao;
    procedure atualizaItens;
    procedure carregaDevolucao;
  public
    { Public declarations }
  end;

var
  frmDevolucao: TfrmDevolucao;

implementation

uses repositorio, fabricaRepositorio, Pedido, Devolucao, EspecificacaoDevolucaoPedido;

{$R *.dfm}

procedure TfrmDevolucao.atualizaItens;
var repositorio :TRepositorio;
    Item        :TItem;
begin
  try
    Item := nil;
    repositorio := nil;

    repositorio := TFabricaRepositorio.GetRepositorio(TItem.ClassName);

    cdsNormais.First;
    while not cdsNormais.Eof do
    begin
      Item           := TItem(repositorio.Get(cdsNormaisCODIGO.AsInteger));
      Item.devolvido := '';
      repositorio.Salvar(Item);
      cdsNormais.Next;
    end;

    cdsDevolvidos.First;
    while not cdsDevolvidos.Eof do
    begin
      Item           := TItem(repositorio.Get(cdsDevolvidosCODIGO.AsInteger));
      Item.devolvido := 'S';
      repositorio.Salvar(Item);
      cdsDevolvidos.Next;
    end;

  finally
    FreeAndNil(Item);
    FreeAndNil(repositorio);
  end;
end;

procedure TfrmDevolucao.btnBuscarClick(Sender: TObject);
begin
  qryDevolucoes.Close;
  montaSql;
  qryDevolucoes.Open;
end;

procedure TfrmDevolucao.btnCriarClick(Sender: TObject);
begin
  pgcDevolucoes.Pages[0].TabVisible := false;
  limpaTela;
end;

procedure TfrmDevolucao.btnCancelarClick(Sender: TObject);
begin
  pgcDevolucoes.Pages[0].TabVisible := true;
  limpaTela;
end;

procedure TfrmDevolucao.btnDesmarcarClick(Sender: TObject);
begin
  transfereItem(cdsDevolvidos, cdsNormais);
end;

procedure TfrmDevolucao.btnDevolverTodoClick(Sender: TObject);
begin
  cdsNormais.First;
  while not cdsNormais.Eof do
    transfereItem(cdsNormais, cdsDevolvidos);
end;

procedure TfrmDevolucao.btnMarcarClick(Sender: TObject);
begin
  transfereItem(cdsNormais, cdsDevolvidos);
end;

procedure TfrmDevolucao.btnSalvarClick(Sender: TObject);
begin
  if cdsDevolvidos.IsEmpty then
  begin
    DBGridCBN1.SetFocus;
    avisar('Ao menos um item deve ser marcado como devolvido');
  end
  else if trim(edtMotivo.Text) = '' then
  begin
    edtMotivo.SetFocus;
    avisar('O motivo da devolução deve ser informado');
  end
  else
    SalvaDevolucao;
end;

procedure TfrmDevolucao.btnVoltarTodoClick(Sender: TObject);
begin
  cdsDevolvidos.First;
  while not cdsDevolvidos.Eof do
    transfereItem(cdsDevolvidos, cdsNormais);
end;

procedure TfrmDevolucao.BuscaPedido1Exit(Sender: TObject);
begin
  buscaPedido1.OnExit := nil;
  if assigned(BuscaPedido1.Ped) then
  begin
    cdsNormais.EmptyDataSet;
    cdsDevolvidos.EmptyDataSet;
    carregaPedido;
  end
  else
  begin
    BuscaPedido1.btnBuscar.Click;
    BuscaPedido1Exit(nil);
  end;
  buscaPedido1.OnExit := buscapedido1.OnExit;
end;

procedure TfrmDevolucao.carregaDevolucao;
begin
  pgcDevolucoes.Pages[0].TabVisible := false;
  BuscaPedido1.numped := qryDevolucoesNUMPEDIDO.AsString;
  BuscaPedido1Exit(nil);
end;

procedure TfrmDevolucao.carregaPedido;
var i :integer;
    repositorio :TRepositorio;
    devolucao   :TDevolucao;
    especificacao :TEspecificacaoDevolucaoPedido;
begin
  try
    BuscaPedido1.Enabled := false;
    repositorio   := nil;
    devolucao     := nil;
    especificacao := nil;

    repositorio   := TFabricaRepositorio.GetRepositorio(TDevolucao.ClassName);
    especificacao := TEspecificacaoDevolucaoPedido.Create(BuscaPedido1.Ped.Codigo);
    devolucao     := TDevolucao(repositorio.GetPorEspecificacao(especificacao));

    edtTotBruto.Value   := Buscapedido1.Ped.valor_total_bruto;
    edtDesconto.Value   := Buscapedido1.Ped.desconto;
    edtDescontoFP.Value := Buscapedido1.Ped.desconto_fpgto;
    edtTotLiquido.Value := Buscapedido1.Ped.valor_total;

    for i := 0 to BuscaPedido1.Ped.Itens.Count - 1 do
    begin
      if TItem(BuscaPedido1.Ped.Itens[i]).devolvido = 'S' then
        insereItem((BuscaPedido1.Ped.Itens[i] as TItem), cdsDevolvidos)
      else
        insereItem((BuscaPedido1.Ped.Itens[i] as TItem), cdsNormais);
    end;

    if assigned(devolucao) then
      edtMotivo.Text := devolucao.motivo;

  finally
    FreeAndNil(repositorio);
    FreeAndNil(devolucao);
    FreeAndNil(especificacao);
  end;
end;

procedure TfrmDevolucao.cdsDevolvidosAfterDelete(DataSet: TDataSet);
begin
  DBGridCBN2Enter(nil);
end;

procedure TfrmDevolucao.cdsNormaisAfterDelete(DataSet: TDataSet);
begin
  DBGridCBN1Enter(nil);
end;

procedure TfrmDevolucao.DBGridCBN1Enter(Sender: TObject);
begin
  btnMarcar.Enabled       := not cdsNormais.IsEmpty;
  btnDevolverTodo.Enabled := not cdsNormais.IsEmpty;
end;

procedure TfrmDevolucao.DBGridCBN1Exit(Sender: TObject);
begin
  btnMarcar.Enabled       := false;
  btnDevolverTodo.Enabled := false;
end;

procedure TfrmDevolucao.DBGridCBN2Enter(Sender: TObject);
begin
  btnDesmarcar.Enabled  := not cdsDevolvidos.IsEmpty;
  btnVoltarTodo.Enabled := not cdsDevolvidos.IsEmpty;
end;

procedure TfrmDevolucao.DBGridCBN2Exit(Sender: TObject);
begin
  btnDesmarcar.Enabled  := false;
  btnVoltarTodo.Enabled := false;
end;

procedure TfrmDevolucao.DevolucaoEnter(Sender: TObject);
begin
  if buscapedido1.Enabled then
    BuscaPedido1.edtNumPedido.SetFocus;
end;

procedure TfrmDevolucao.FormShow(Sender: TObject);
begin
  cdsNormais.CreateDataSet;
  cdsDevolvidos.CreateDataSet;
  dtpInicio.Date := date;
  dtpFim.Date    := date;
  pgcDevolucoes.ActivePageIndex := 0;
  btnBuscar.Click;
end;

procedure TfrmDevolucao.insereItem(Item: TItem; cds: TClientDataSet);
begin
  cds.Append;
  cds.FieldByName('CODIGO').AsInteger  := Item.codigo;
  cds.FieldByName('PRODUTO').AsString  := Item.Produto.Descricao;
  cds.FieldByName('COR').AsString      := Item.Cor.Descricao;
  cds.FieldByName('QTD_RN').AsFloat    := Item.qtd_RN;
  cds.FieldByName('QTD_P').AsFloat     := Item.qtd_P;
  cds.FieldByName('QTD_M').AsFloat     := Item.qtd_M;
  cds.FieldByName('QTD_G').AsFloat     := Item.qtd_G;
  cds.FieldByName('QTD_1').AsFloat     := Item.qtd_1;
  cds.FieldByName('QTD_2').AsFloat     := Item.qtd_2;
  cds.FieldByName('QTD_3').AsFloat     := Item.qtd_3;
  cds.FieldByName('QTD_4').AsFloat     := Item.qtd_4;
  cds.FieldByName('QTD_6').AsFloat     := Item.qtd_6;
  cds.FieldByName('QTD_8').AsFloat     := Item.qtd_8;
  cds.FieldByName('QTD_10').AsFloat    := Item.qtd_10;
  cds.FieldByName('QTD_12').AsFloat    := Item.qtd_12;
  cds.FieldByName('QTD_UNICA').AsFloat := Item.qtd_unica;
  cds.Post;
end;

procedure TfrmDevolucao.limpaTela;
begin
  buscapedido1.limpa;
  buscapedido1.edtNumPedido.Clear;
  BuscaPedido1.Enabled := true;
  cdsNormais.EmptyDataSet;
  cdsDevolvidos.EmptyDataSet;

  if pgcDevolucoes.Pages[0].TabVisible then
    pgcDevolucoes.ActivePageIndex     := 0
  else
    BuscaPedido1.edtNumPedido.SetFocus;
end;

procedure TfrmDevolucao.montaSql;
begin
  qryDevolucoes.SQL.Text := 'select d.*, p.numpedido from devolucoes d        '+
                            'left join pedidos p on p.codigo = d.codigo_pedido';
end;

procedure TfrmDevolucao.pgcDevolucoesChange(Sender: TObject);
begin
  if (pgcDevolucoes.ActivePageIndex = 1) then
  begin
    if not qryDevolucoes.IsEmpty then
      carregaDevolucao;
  end;
end;

procedure TfrmDevolucao.SalvaDevolucao;
var repositorio :TRepositorio;
    devolucao   :TDevolucao;
    especificacao :TEspecificacaoDevolucaoPedido;
begin
  try
  try
    fdm.FDConnection.TxOptions.AutoCommit := false;
    repositorio   := nil;
    devolucao     := nil;
    especificacao := nil;

    repositorio   := TFabricaRepositorio.GetRepositorio(TDevolucao.ClassName);
    especificacao := TEspecificacaoDevolucaoPedido.Create(BuscaPedido1.Ped.Codigo);
    devolucao     := TDevolucao(repositorio.GetPorEspecificacao(especificacao));

    if not assigned(devolucao) then
      devolucao := TDevolucao.Create;

    devolucao.codigo_pedido := BuscaPedido1.Ped.Codigo;
    devolucao.data          := Date;
    devolucao.motivo        := edtMotivo.Text;
    devolucao.parcial_total := IfThen(cdsNormais.IsEmpty, 'T', 'P');

    repositorio.Salvar(devolucao);

    //altera estado dos itens
    atualizaItens;

    fdm.FDConnection.Commit;
    btnCancelar.Click;
    btnBuscar.Click;
  Except
    on e :Exception do
    begin
      fdm.FDConnection.Rollback;
      avisar('Erro ao salvar devolução.'+#13#10+e.message);
    end;
  end;
  finally
    fdm.FDConnection.TxOptions.AutoCommit := false;
    FreeAndNil(repositorio);
    FreeAndNil(devolucao);
    FreeAndNil(especificacao);
  end;
end;

procedure TfrmDevolucao.transfereItem(cdsOrigem, cdsDestino: TClientDataSet);
begin
  cdsDestino.Append;
  cdsDestino.FieldByName('CODIGO').AsInteger  := cdsOrigem.FieldByName('CODIGO').AsInteger;
  cdsDestino.FieldByName('PRODUTO').AsString  := cdsOrigem.FieldByName('PRODUTO').AsString;
  cdsDestino.FieldByName('COR').AsString      := cdsOrigem.FieldByName('COR').AsString;
  cdsDestino.FieldByName('QTD_RN').AsFloat    := cdsOrigem.FieldByName('QTD_RN').AsFloat;
  cdsDestino.FieldByName('QTD_P').AsFloat     := cdsOrigem.FieldByName('QTD_P').AsFloat;
  cdsDestino.FieldByName('QTD_M').AsFloat     := cdsOrigem.FieldByName('QTD_M').AsFloat;
  cdsDestino.FieldByName('QTD_G').AsFloat     := cdsOrigem.FieldByName('QTD_G').AsFloat;
  cdsDestino.FieldByName('QTD_1').AsFloat     := cdsOrigem.FieldByName('QTD_1').AsFloat;
  cdsDestino.FieldByName('QTD_2').AsFloat     := cdsOrigem.FieldByName('QTD_2').AsFloat;
  cdsDestino.FieldByName('QTD_3').AsFloat     := cdsOrigem.FieldByName('QTD_3').AsFloat;
  cdsDestino.FieldByName('QTD_4').AsFloat     := cdsOrigem.FieldByName('QTD_4').AsFloat;
  cdsDestino.FieldByName('QTD_6').AsFloat     := cdsOrigem.FieldByName('QTD_6').AsFloat;
  cdsDestino.FieldByName('QTD_8').AsFloat     := cdsOrigem.FieldByName('QTD_8').AsFloat;
  cdsDestino.FieldByName('QTD_10').AsFloat    := cdsOrigem.FieldByName('QTD_10').AsFloat;
  cdsDestino.FieldByName('QTD_12').AsFloat    := cdsOrigem.FieldByName('QTD_12').AsFloat;
  cdsDestino.FieldByName('QTD_UNICA').AsFloat := cdsOrigem.FieldByName('QTD_UNICA').AsFloat;
  cdsDestino.Post;
  cdsOrigem.Delete;
end;

end.
