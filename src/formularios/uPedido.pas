unit uPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, frameBuscaPedido, ComCtrls,
  frameBuscaTabelaPreco, frameBuscaFormaPagamento, frameBuscaEmpresa,
  frameBuscaPessoa, StdCtrls, TipoPessoa, frameBuscaCor, contNrs, DB,
  DBClient, DBGridCBN, Buttons, Grids, DBGrids, frameBuscaProduto,
  ExtCtrls, Mask, RxToolEdit, RxCurrEdit, Menus, Pedido, Item, Repositorio, pngimage,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frameBuscaCliente, frameBuscaRepresentante;

type
  TfrmPedido = class(TfrmPadrao)
    pagPedido: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    gbDadosItem: TGroupBox;
    BuscaProduto1: TBuscaProduto;
    BuscaCor1: TBuscaCor;
    gbObsItem: TGroupBox;
    edtObservacoes: TEdit;
    DBGrid1: TDBGrid;
    ds: TDataSource;
    cds: TClientDataSet;
    edtPreco: TCurrencyEdit;
    StaticText2: TStaticText;
    cdsTamRN: TIntegerField;
    cdsTamP: TIntegerField;
    cdsTamM: TIntegerField;
    cdsTamG: TIntegerField;
    cdsTam1: TIntegerField;
    cdsTam2: TIntegerField;
    cdsTam3: TIntegerField;
    cdsTam4: TIntegerField;
    cdsTam6: TIntegerField;
    cdsTam8: TIntegerField;
    gridItens: TDBGridCBN;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    cdsItensProduto: TStringField;
    cdsItensCor: TStringField;
    cdsItensValorUnit: TFloatField;
    cdsItensValorTotalItem: TFloatField;
    cdsItensCodPro: TIntegerField;
    cdsItensCodCor: TIntegerField;
    cdsItensTamRN: TIntegerField;
    cdsItensTamP: TIntegerField;
    cdsItensTamM: TIntegerField;
    cdsItensTamG: TIntegerField;
    cdsItensTam1: TIntegerField;
    cdsItensTam2: TIntegerField;
    cdsItensTam3: TIntegerField;
    cdsItensTam4: TIntegerField;
    cdsItensTam6: TIntegerField;                                                                               
    cdsItensTam8: TIntegerField;
    cdsItensDesconto: TFloatField;
    cdsItensObsItem: TStringField;
    panTopo: TPanel;
    BuscaPedido1: TBuscaPedido;
    panRodape: TPanel;
    labRefDisponiveis: TLabel;
    labRefComCodigo: TLabel;
    labTotRef: TLabel;
    Shape2: TShape;
    edtTotPedido: TCurrencyEdit;
    edtTotItens: TCurrencyEdit;
    cdsItensCODIGO: TIntegerField;
    StaticText5: TStaticText;
    btnCancelar: TSpeedButton;
    cdsItemDel: TClientDataSet;
    cdsItemDelCOD_ITEM: TIntegerField;
    btnSalvar: TSpeedButton;
    btnImprimir: TSpeedButton;
    Label10: TLabel;
    edtDescFPgto: TCurrencyEdit;
    edtDescontoItens: TCurrencyEdit;
    btnImprimirPedido: TSpeedButton;
    Label12: TLabel;
    edtTotPedidoBruto: TCurrencyEdit;
    btnInfCli: TSpeedButton;
    cdsItensRefCor: TStringField;
    GroupBox2: TGroupBox;
    edtDesconto: TCurrencyEdit;
    edtValorItens: TCurrencyEdit;
    edtPercDesconto: TCurrencyEdit;
    btnConfirma: TSpeedButton;
    Image1: TImage;
    Label14: TLabel;
    Label15: TLabel;
    edtAcrescimoPedido: TCurrencyEdit;
    edtDescontoPedido: TCurrencyEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    lbFaturado: TLabel;
    Image2: TImage;
    imgFaturado: TImage;
    cdsTamUNICA: TFloatField;
    cdsTOTAL: TFloatField;
    cdsItensTamUNICA: TFloatField;
    cdsItensTOTAL: TFloatField;
    pnlNAlteravelCabecalho: TPanel;
    BuscaEmpresa: TBuscaEmpresa;
    gbFormaPgto: TGroupBox;
    BuscaFormaPagamento1: TBuscaFormaPagamento;
    gbTabPreco: TGroupBox;
    BuscaTabelaPreco1: TBuscaTabelaPreco;
    gbTransportadora: TGroupBox;
    BuscaTransportadora: TBuscaPessoa;
    gbObs: TGroupBox;
    memObs: TMemo;
    gbTipoFrete: TGroupBox;
    cbTipoFrete: TComboBox;
    gbAprovacao: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Shape1: TShape;
    imgAprovado: TImage;
    imgReprovado: TImage;
    imgEstudo: TImage;
    cbAprovacao: TComboBox;
    edtAprovado: TEdit;
    edtDtAprovacao: TEdit;
    gbDatas: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    dtpCadastro: TDateTimePicker;
    dtpRepresentante: TDateTimePicker;
    dtpRecebido: TDateTimePicker;
    gbDespachado: TGroupBox;
    Label13: TLabel;
    rbSim: TRadioButton;
    rbNao: TRadioButton;
    edtDataDespacho: TMaskEdit;
    rgStatus: TRadioGroup;
    gpbComissao: TGroupBox;
    Label11: TLabel;
    Label19: TLabel;
    edtPercComissao: TCurrencyEdit;
    edtDescComiss: TCurrencyEdit;
    edtEstoque: TEdit;
    DBGrid2: TDBGrid;
    cdsEstoque: TClientDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    FloatField1: TFloatField;
    StaticText1: TStaticText;
    dsEstoque: TDataSource;
    btnImprimeVerso: TSpeedButton;
    qry: TFDQuery;
    btnGerarCotacao: TSpeedButton;
    gbPeriodo: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dtpInicio: TDateTimePicker;
    dtpLimite: TDateTimePicker;
    cdsEstoqueTam10: TIntegerField;
    cdsEstoqueTam12: TIntegerField;
    cdsEstoqueTam14: TIntegerField;
    cdsTam10: TIntegerField;
    cdsTam12: TIntegerField;
    cdsTam14: TIntegerField;
    cdsItensTam10: TIntegerField;
    cdsItensTam12: TIntegerField;
    cdsItensTam14: TIntegerField;
    edtValorFrete: TCurrencyEdit;
    Label20: TLabel;
    cdsItensDESMEMBRADO: TStringField;
    BuscaCliente: TBuscaCliente;
    buscaRepresentante: TbuscaRepresentante;
    procedure FormCreate(Sender: TObject);
    procedure cbAprovacaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscaCor1Exit(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);
    procedure edtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPercDescontoChange(Sender: TObject);
    procedure edtPercDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure memObsKeyPress(Sender: TObject; var Key: Char);
    procedure BuscaPedido1Exit(Sender: TObject);
    procedure BuscaPedido1btnBuscarEnter(Sender: TObject);
    procedure BuscaPedido1btnBuscarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure pagPedidoChange(Sender: TObject);
    procedure BuscaClienteExit(Sender: TObject);
    procedure gridItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscaProduto1btnBuscaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure BuscaProduto1Exit(Sender: TObject);
    procedure btnImprimirPedidoClick(Sender: TObject);
    procedure btnInfCliClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1Enter(Sender: TObject);
    procedure BuscaProduto1edtReferenciaKeyPress(Sender: TObject;
      var Key: Char);
    procedure BuscaProduto1edtDescricaoEnter(Sender: TObject);
    procedure rbNaoClick(Sender: TObject);
    procedure rbSimClick(Sender: TObject);
    procedure edtDescontoPedidoChange(Sender: TObject);
    procedure edtAcrescimoPedidoChange(Sender: TObject);
    procedure edtAcrescimoPedidoExit(Sender: TObject);
    procedure edtAcrescimoPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescontoPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPrecoEnter(Sender: TObject);
    procedure BuscaFormaPagamento1Exit(Sender: TObject);
    procedure edtDescontoPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure BuscaCor1Enter(Sender: TObject);
    procedure edtDescComissExit(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure rgStatusClick(Sender: TObject);
    procedure rbNaoExit(Sender: TObject);
    procedure rbSimExit(Sender: TObject);
    procedure BuscaProduto1edtReferenciaChange(Sender: TObject);
    procedure BuscaCor1edtReferenciaChange(Sender: TObject);
    procedure btnImprimeVersoClick(Sender: TObject);
    procedure btnGerarCotacaoClick(Sender: TObject);
    procedure buscaRepresentante1edtRazaoChange(Sender: TObject);
    procedure buscaRepresentanteExit(Sender: TObject);

  private
    Pedido :TPedido;
    Aprovado, aproveitandoPedido :Boolean;
    dataAprovacao :TDateTime;
    Item   :TItem;
    repPedido, repItem :TRepositorio;
    FPedidoTricae :Boolean;
    FSalvando :Boolean;

    procedure habilitaTamanhos;
    procedure BloqueiaLiberaCampos;
    procedure bloqueia_alteracao(boleana :Boolean);
    procedure iniciaGridTamanhos;
    procedure somaQtdCores;
    procedure adicionaItem;
    procedure limpaItem;
    procedure limpaCampos;
    procedure alterarItem;
    procedure deletarItem;
    procedure cancelar;
    procedure mostraPedido;
    procedure armazenaItemDeletado;
    procedure DeletaItensArmazenados;
    procedure calculaTotais;

    function  verificaObrigatoriosItem :Boolean;
    function  verificaObrigatoriosPedido :Boolean;
    function  salvar: boolean;
    function  TabelaProdutoSelecionada : boolean;
    procedure Atualiza_estoque(pedido :TPedido);
//    procedure Salva_estoque(cod_produto, cod_cor, cod_tamanho :integer; quantidade :Real);
    procedure Busca_tamanhos(var cds :TClientDataSet);
    procedure subtrai_estoque_reservado;
    procedure SetPedidoTricae(const Value: Boolean);

  public
    property PedidoTricae :Boolean read FPedidoTricae write SetPedidoTricae;
  end;

var
  frmPedido: TfrmPedido;

implementation

uses Math, FabricaRepositorio, StrUtils, uRelatorioExpedicao, PermissoesAcesso, funcoes, uRelatorioPedidoVenda,
     uCadastroCliente, uInformacoesPessoa, Tamanho, Estoque, EspecificacaoEstoquePorProdutoCorTamanho, ConferenciaItem,
     EspecificacaoItemConferidoPorCodigoItem, uModulo, uGeraCotacao, CaixaPedido;

{$R *.dfm}

procedure TfrmPedido.FormCreate(Sender: TObject);
begin
  inherited;
  BuscaTransportadora.TipoPessoa := tpTransportadora;
  FPedidoTricae := false;
end;

procedure TfrmPedido.cbAprovacaoChange(Sender: TObject);         
begin
  if cbAprovacao.ItemIndex = 1 then begin
    edtAprovado.Enabled := true;

    if edtDtAprovacao.Text = '' then
      edtDtAprovacao.Text := DateToStr(Date);
  end
  else begin
    edtAprovado.Enabled := false;
    edtDtAprovacao.Clear;
  end;

  calculaTotais;

  imgEstudo.Visible    := (cbAprovacao.ItemIndex = 0);
  imgAprovado.Visible  := (cbAprovacao.ItemIndex = 1);
  imgReprovado.Visible := (cbAprovacao.ItemIndex = 2);
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin

  iniciaGridTamanhos;
  Aprovado                  := false;
  pagPedido.ActivePageIndex := 0;
  dtpInicio.DateTime        := date;
  dtpLimite.DateTime        := date;
  dtpCadastro.DateTime      := date;

  if not TPermissoesAcesso.VerificaPermissao(paAlteraStatusAprovacaoPedido, '', false, false) then
    gbAprovacao.Enabled := false;

  { SELF.TAG = 0 - Tela de Inclusão.  SELF.TAG = 1 - Tela de Alteração }  
  if self.Tag = 0 then begin
    BuscaPedido1.btnBuscar.Visible := false;
    BuscaPedido1.buscaParaInclusao := true;
    BuscaEmpresa.codEmpresa        := 1;
  end
  else begin
    BuscaPedido1.btnBuscar.Visible := true;
    pagPedido.Enabled              := false;
    btnImprimir.Visible            := true;
    btnImprimirPedido.Visible      := true;
    btnGerarCotacao.Visible        := true;
    btnImprimeVerso.Visible        := true;
  end;

  if self.Tag = 0 then
    BuscaPedido1.permiteCancelado := true;
    
  BuscaPedido1.edtNumPedido.SetFocus;
  dtpCadastro.DateTime      := date;
  dtpRecebido.DateTime      := date;
  dtpRepresentante.DateTime := date;
  aproveitandoPedido        := false;
end;

procedure TfrmPedido.cdsAfterScroll(DataSet: TDataSet);
begin
  if cds.State in [dsInsert] then
    cds.Cancel;
end;

procedure TfrmPedido.habilitaTamanhos;
begin
  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select gt.codtamanho, t.descricao from grade_tamanhos gt '+
                              'left join tamanhos t on t.codigo = gt.codtamanho         '+
                              'where gt.codgrade = :codgrade                            ';
  fdm.qryGenerica.ParamByName('codgrade').AsInteger := BuscaProduto1.codGrade;
  fdm.qryGenerica.Open;


  BloqueiaLiberaCampos;

end;

procedure TfrmPedido.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (DBGrid1.SelectedField.Name = 'cdsTOTAL') then   DBGrid1.SelectedField.Readonly := true
                                               else   cdsTotal.Readonly := false;

  if not (Column.Title.Caption = 'TOTAL') then begin

    if cds.FieldByName('Tam'+Column.Title.Caption).Tag = 1  then
      begin
        DBGrid1.Canvas.Font.Color  := clBlue;
        DBGrid1.Canvas.Brush.Color := clwhite;
        DBGrid1.Canvas.Font.Style  := [fsBold];
        Column.Title.Font.Style    := [fsBold];
      end
    else
      begin
        DBGrid1.Canvas.Font.Color  := clBlack;
        DBGrid1.Canvas.Brush.Color := clSilver;
      end;
  end;

  DBGrid1.Canvas.FillRect(Rect);
  Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,state);

end;

procedure TfrmPedido.BloqueiaLiberaCampos;
var i:integer;
begin

  for i :=0 to cds.FieldCount - 1 do begin

    if (fdm.qryGenerica.Locate('descricao', copy(cds.Fields[i].Name,7,5), [])) or (cds.Fields[i].Name = 'cdsTOTAL') then begin
      cds.Fields[i].ReadOnly := false;
      cds.Fields[i].Tag      := 1;
    end
    else begin
      cds.Fields[i].ReadOnly := true;
      cds.Fields[i].Tag      := 0;
    end;
  end;
end;

procedure TfrmPedido.iniciaGridTamanhos;
var
  Proc: TDataSetNotifyEvent;
  i :integer;
begin
  Proc := cds.AfterScroll;
  cds.AfterScroll := nil;

  if not cds.Active then
    cds.CreateDataSet
  else
    cds.EmptyDataSet;

  for i :=0 to cds.FieldCount - 1 do  cds.Fields[i].ReadOnly := false;

  cds.Append;
  cdsTamRN.AsInteger := 0; cdsTamP.AsInteger   := 0; cdsTamM.AsInteger     := 0; cdsTamG.AsInteger  := 0;
  cdsTam1.AsInteger  := 0; cdsTam2.AsInteger   := 0; cdsTam3.AsInteger     := 0; cdsTam4.AsInteger  := 0;
  cdsTam6.AsInteger  := 0; cdsTam8.AsInteger   := 0; cdsTam10.AsInteger    := 0; cdsTam12.AsInteger := 0;
  cdsTam14.AsInteger := 0; cdsTamUNICA.AsFloat := 0; cdsTOTAL.AsFLoat      := 0;
  cds.Post;

  cds.AfterScroll := Proc;
end;

procedure TfrmPedido.somaQtdCores;
var i:integer;
begin
  cds.Edit;
  cdsTOTAL.AsFloat := 0;
                               //-2 para nao somar o proprio TOTAL
  for i:=0 to cds.FieldCount - 2 do begin
    cdsTOTAL.AsFloat := cdsTOTAL.AsFloat + cds.Fields[i].AsFloat;
  end;

  cds.Post;

  edtValorItens.Value :=  (cdsTOTAL.AsFloat * edtPreco.value) - edtDesconto.Value;

  edtPercDescontoChange(nil);
end;

procedure TfrmPedido.btnGerarCotacaoClick(Sender: TObject);
begin
  frmGeraCotacao := TfrmGeraCotacao.Create(nil);

  frmGeraCotacao.BuscaEmpresa1.codEmpresa := StrToInt(BuscaEmpresa.edtCodigo.Text);
  frmGeraCotacao.BuscaCliente.codigo      := BuscaCliente.Cliente.Codigo;
  frmGeraCotacao.edtValor.Value           := edtTotPedido.Value;
  frmGeraCotacao.numPedido                := self.BuscaPedido1.edtNumPedido.Text;

  frmGeraCotacao.ShowModal;
  frmGeraCotacao.Release;
  frmGeraCotacao := nil;
end;

procedure TfrmPedido.DBGrid1ColExit(Sender: TObject);
begin
  if cdsTotal.ReadOnly then  cdsTotal.ReadOnly := false;

  if (DBGrid1.SelectedField.Name = 'cdsTOTAL') and (cdsTOTAL.AsFloat > 0) then   edtPercDesconto.SetFocus;

  somaQtdCores;
end;

procedure TfrmPedido.DBGrid1Exit(Sender: TObject);
begin
  somaQtdCores;
end;

procedure TfrmPedido.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9']) and not (key in [#8,#37,#39,#13,#9,',','.']) then
    key := #0;
end;

procedure TfrmPedido.btnConfirmaClick(Sender: TObject);
begin

  cdsTOTAL.ReadOnly := false;
  somaQtdCores;

  if verificaObrigatoriosItem then begin

    adicionaItem;  {}  limpaItem;  {}  habilitaTamanhos;

    BuscaProduto1.edtReferencia.SetFocus;

    if ( TabSheet2.Tag = 1 ) then  begin
      pagPedido.ActivePageIndex := 2;
      gridItens.SetFocus;
    end;
  end;
end;

procedure TfrmPedido.adicionaItem;
var codItemAlterado :integer;
begin
  codItemAlterado := 0;

  if not cdsItens.Active then
    cdsItens.CreateDataSet;

  if TabSheet2.Tag = 1 then begin //alterando item
    codItemAlterado       := cdsItensCODIGO.AsInteger;
    cdsItens.Delete;
    TabSheet2.Tag         := 0;
    BuscaProduto1.Enabled := true;
    TabSheet3.Enabled     := true;
  end;

  cdsItens.Append;
  cdsItensCODIGO.AsInteger       := codItemAlterado; 
  cdsItensProduto.AsString       := TRIM(BuscaProduto1.edtReferencia.Text);
  cdsItensCodPro.AsInteger       := strToInt(BuscaProduto1.codproduto);
  cdsItensCor.AsString           := TRIM(BuscaCor1.edtDescricao.Text);
  cdsItensCodCor.AsInteger       := BuscaCor1.edtCodigo.AsInteger;
  cdsItensRefCor.AsString        := TRIM(BuscaCor1.edtReferencia.Text);
  cdsItensTamRN.AsInteger        := cdsTamRN.AsInteger;
  cdsItensTamP.AsInteger         := cdsTamP.AsInteger;
  cdsItensTamM.AsInteger         := cdsTamM.AsInteger;
  cdsItensTamG.AsInteger         := cdsTamG.AsInteger;
  cdsItensTam1.AsInteger         := cdsTam1.AsInteger;
  cdsItensTam2.AsInteger         := cdsTam2.AsInteger;
  cdsItensTam3.AsInteger         := cdsTam3.AsInteger;
  cdsItensTam4.AsInteger         := cdsTam4.AsInteger;
  cdsItensTam6.AsInteger         := cdsTam6.AsInteger;
  cdsItensTam8.AsInteger         := cdsTam8.AsInteger;
  cdsItensTam10.AsInteger        := cdsTam10.AsInteger;
  cdsItensTam12.AsInteger        := cdsTam12.AsInteger;
  cdsItensTam14.AsInteger        := cdsTam14.AsInteger;
  cdsItensTamUNICA.AsFloat       := cdsTamUNICA.AsFloat;
  cdsItensTOTAL.AsFloat          := cdsTOTAL.AsFloat;
  cdsItensDesconto.AsFloat       := edtDesconto.Value;
  cdsItensValorUnit.AsFloat      := edtPreco.Value;
  cdsItensValorTotalItem.AsFloat := edtValorItens.Value;
  cdsItensObsItem.AsString       := TRIM(copy(edtObservacoes.Text,1,200));
  cdsItens.Post;

  calculaTotais;

  if btnSalvar.Enabled = false then
    btnSalvar.Enabled := true;
end;

function TfrmPedido.verificaObrigatoriosItem: Boolean;
begin
  Result := true;

  if Trim(BuscaCliente.edtRazao.Text) = '' then begin
    avisar('Favor selecione um cliente para prosseguir com o pedido');
    BuscaCliente.edtCodigo.SetFocus;
    Result := false;
  end
  else if Trim(BuscaProduto1.edtDescricao.Text) = '' then begin
    avisar('Favor selecionar um produto para prosseguir com o pedido');
    BuscaProduto1.edtReferencia.SetFocus;
    Result := false;
  end
  else if Trim(BuscaCor1.edtDescricao.Text) = '' then begin
    avisar('Favor selecionar uma cor para o produto');
    BuscaCor1.edtReferencia.SetFocus;
    Result := false;
  end
  else if cdsTOTAL.AsFloat <= 0 then begin
    avisar('A quantidade de peças não foi informada!');
    DBGrid1.SetFocus;
    Result := false;
  end
  else if edtPreco.Value <= 0 then begin
    avisar('O produto não pode ser inserido. Preço zerado. '+#13#10+
           'Não há um preço cadastrado para a tabela de preço selecionada.');
    edtPreco.SetFocus;
    Result := false;
  end;
end;

procedure TfrmPedido.limpaItem;
begin
  if TabSheet2.Tag = 1 then
    BuscaProduto1.limpa;
    
  BuscaCor1.limpa;
  edtObservacoes.Clear;
  edtPercDesconto.Clear;
  edtDesconto.Clear;
  edtValorItens.Clear;
  iniciaGridTamanhos;
end;

procedure TfrmPedido.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var tecla :Word;
begin
  tecla := Key;
  if (ActiveControl = edtDescComiss) and ((tecla = VK_Return) or (tecla = VK_TAB)) then
    if pnlNAlteravelCabecalho.Enabled then
      memObs.SetFocus;

  if (ActiveControl = memObs) and (tecla = VK_Return) then  tecla := 0;

  if (ActiveControl = edtValorItens) and (tecla = VK_Return) then
    btnConfirma.Click;

  if (tecla = VK_Escape) and not (confirma('Deseja realmente sair da tela de pedidos?')) then exit;

  inherited;
  if      tecla = vk_F1 then   pagPedido.ActivePageIndex := 0
  else if tecla = vk_F2 then   pagPedido.ActivePageIndex := 1
  else if tecla = vk_F3 then   pagPedido.ActivePageIndex := 2
  else if ( btnImprimir.Enabled ) and ( (ssCtrl in Shift) AND (tecla = ord('P')) ) then   btnImprimir.Click;

  key := tecla;  
end;

procedure TfrmPedido.BuscaCor1Exit(Sender: TObject);
var i: Integer;
begin
        //n estiver alterando
  if not (TabSheet2.Tag = 1) and (cdsItens.Active) and
     (cdsItens.Locate('CODPRO;CODCOR', VarArrayOf([StrToIntDef(BuscaProduto1.codproduto,0), BuscaCor1.edtCodigo.AsInteger]), [])) then
  begin
    avisar('Cor já inserida para esse produto');
    BuscaCor1.limpa;
    BuscaCor1.edtReferencia.SetFocus;
  end;
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Add('SELECT COALESCE(SUM(QUANTIDADE),0) AS QTD FROM ESTOQUE '+
              'LEFT OUTER JOIN PRODUTOS ON (PRODUTOS.CODIGO = ESTOQUE.CODIGO_PRODUTO) '+
              'LEFT OUTER JOIN CORES ON CORES.CODIGO = ESTOQUE.CODIGO_COR '+
              'WHERE PRODUTOS.REFERENCIA = '+QuotedStr(BuscaProduto1.edtReferencia.Text)+' AND '+
              'CORES.REFERENCIA='+QuotedStr(BuscaCor1.edtReferencia.Text));
  Qry.Open;
  if not Qry.IsEmpty then
    edtEstoque.Text:= Qry.Fields[0].AsString
  else
    edtEstoque.Text:= '0';

  if not cdsEstoque.Active then
    cdsEstoque.CreateDataSet;
  cdsEstoque.EmptyDataSet;
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Add('SELECT TAMANHOS.DESCRICAO AS TAMANHO, ESTOQUE.QUANTIDADE FROM ESTOQUE '+
              'LEFT JOIN PRODUTOS ON PRODUTOS.CODIGO = ESTOQUE.CODIGO_PRODUTO '+
              'LEFT JOIN TAMANHOS ON TAMANHOS.CODIGO = ESTOQUE.CODIGO_TAMANHO '+
              'LEFT JOIN CORES ON CORES.CODIGO = ESTOQUE.CODIGO_COR '+
              'WHERE PRODUTOS.REFERENCIA = '+QuotedStr(BuscaProduto1.edtReferencia.Text)+' AND '+
              'CORES.REFERENCIA='+QuotedStr(BuscaCor1.edtReferencia.Text)+' '+
              'ORDER BY TAMANHOS.CODIGO');
  Qry.Open;
  if Qry.IsEmpty then
    Exit;
  Qry.First;
  while not Qry.Eof do
  begin
    cdsEstoque.Edit;
    for i:= 0 to cdsEstoque.Fields.Count - 1 do
    begin
      if cdsEstoque.Fields[i].FieldName = 'Tam'+Qry.fieldByName('TAMANHO').AsString then
      begin
        cdsEstoque.Fields[i].AsFloat:= cdsEstoque.Fields[i].AsFloat + Qry.fieldByName('QUANTIDADE').AsFloat;
        Break;
      end;
    end;

    cdsEstoque.Post;
    Qry.Next;
  end;

  subtrai_estoque_reservado;
end;

procedure TfrmPedido.alterarItem;
begin
    iniciaGridTamanhos;

  if TabelaProdutoSelecionada then begin
    BuscaProduto1.codproduto := cdsItensProduto.AsString;
    BuscaCor1.codCor         := cdsItensRefCor.AsString;
    edtObservacoes.Text      := cdsItensObsItem.AsString;
    edtDesconto.Value        := cdsItensDesconto.AsFloat;
    edtPercDesconto.Value    := TRUNC((cdsItensDesconto.AsFloat * 100) / cdsItensValorTotalItem.AsFloat);
    edtValorItens.Value      := cdsItensValorTotalItem.AsFloat;
        
    BuscaProduto1Exit(nil);
    BuscaProduto1.Enabled := false;

    cds.Edit;

    if cdsItensTamRN.AsInteger     > 0 then  cdsTamRN.AsInteger       := cdsItensTamRN.AsInteger;
    if cdsItensTamP.AsInteger      > 0 then  cdsTamP.AsInteger        := cdsItensTamP.AsInteger;
    if cdsItensTamM.AsInteger      > 0 then  cdsTamM.AsInteger        := cdsItensTamM.AsInteger;
    if cdsItensTamG.AsInteger      > 0 then  cdsTamG.AsInteger        := cdsItensTamG.AsInteger;
    if cdsItensTam1.AsInteger      > 0 then  cdsTam1.AsInteger        := cdsItensTam1.AsInteger;
    if cdsItensTam2.AsInteger      > 0 then  cdsTam2.AsInteger        := cdsItensTam2.AsInteger;
    if cdsItensTam3.AsInteger      > 0 then  cdsTam3.AsInteger        := cdsItensTam3.AsInteger;
    if cdsItensTam4.AsInteger      > 0 then  cdsTam4.AsInteger        := cdsItensTam4.AsInteger;
    if cdsItensTam6.AsInteger      > 0 then  cdsTam6.AsInteger        := cdsItensTam6.AsInteger;
    if cdsItensTam8.AsInteger      > 0 then  cdsTam8.AsInteger        := cdsItensTam8.AsInteger;
    if cdsItensTam10.AsInteger     > 0 then  cdsTam10.AsInteger       := cdsItensTam10.AsInteger;
    if cdsItensTam12.AsInteger     > 0 then  cdsTam12.AsInteger       := cdsItensTam12.AsInteger;
    if cdsItensTam14.AsInteger     > 0 then  cdsTam14.AsInteger       := cdsItensTam14.AsInteger;
    if cdsItensTamUNICA.AsFloat    > 0 then  cdsTamUNICA.AsFloat      := cdsItensTamUNICA.AsFloat;
    if cdsItensTOTAL.AsFloat       > 0 then  cdsTOTAL.AsFloat         := cdsItensTOTAL.AsFloat;

    cds.Post;

    pagPedido.ActivePageIndex := 1;
  end;

  TabSheet2.Tag := 1; //alterando
  TabSheet3.Enabled := false;
  if BuscaCor1.Enabled then
    BuscaCor1.edtReferencia.SetFocus
  else
    edtPreco.SetFocus;
end;

procedure TfrmPedido.deletarItem;
begin
  if self.Tag = 1 then
    armazenaItemDeletado;

  cdsItens.Delete;
  calculaTotais;
    
  if cdsItens.IsEmpty then
    btnSalvar.Enabled := false;
end;

procedure TfrmPedido.edtPrecoExit(Sender: TObject);
begin
  inherited;
  somaQtdCores;
  if not FSalvando and BuscaCor1.Enabled then
    BuscaCor1.edtReferencia.SetFocus;
end;

procedure TfrmPedido.edtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9']) and not (key in [#8,#37,#39,',']) then
    key := #0;
end;

procedure TfrmPedido.edtPercDescontoChange(Sender: TObject);
begin
  if not (ActiveControl = edtPercDesconto) then exit;

  if edtPercDesconto.Value > 0 then begin
    edtDesconto.Value :=  (edtPercDesconto.Value * (cdsTOTAL.AsFloat * edtPreco.value)) / 100 ;
    edtDesconto.Value := arredonda(edtDesconto.Value);
  end
  else
    edtDesconto.Value := 0;

  edtValorItens.Value := (cdsTOTAL.AsFloat * edtPreco.value) - edtDesconto.Value;
end;

procedure TfrmPedido.edtPercDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9']) and not (key in [#8,#37,#39]) then
    key := #0;
end;

procedure TfrmPedido.btnSalvarClick(Sender: TObject);
begin
 try
   FSalvando := true;
 try
   if verificaObrigatoriosPedido then
   begin
     self.Fdm.conexao.TxOptions.AutoCommit      := false;
     self.Fdm.FDConnection.TxOptions.AutoCommit := false;

     salvar;

     self.Fdm.conexao.Commit;
     self.Fdm.FDConnection.Commit;
   end;

 Except
  on e : Exception do
     begin
       self.Fdm.conexao.Rollback;
       self.Fdm.FDConnection.Rollback;
       Avisar('Erro ao salvar pedido: '+e.Message);
     end;
 end;

 Finally
   FSalvando := false;
   self.Fdm.conexao.TxOptions.AutoCommit      := true;
   self.Fdm.FDConnection.TxOptions.AutoCommit := true;
 end;
end;

procedure TfrmPedido.cancelar;
begin

  BuscaPedido1.Enabled := true;

  if TabSheet2.Tag = 1 then begin
    btnSalvar.Enabled         := true;
    TabSheet3.Enabled         := true;
    pagPedido.ActivePageIndex := 2;    
    TabSheet2.Tag             := 0;
  end
  else begin
    limpaCampos;
    BuscaPedido1.edtNumPedido.Clear;
    btnSalvar.Enabled := false;
    pagPedido.ActivePageIndex := 0;
    aproveitandoPedido := false;
    sleep(100);
    BuscaPedido1.edtNumPedido.SetFocus;
    bloqueia_alteracao(true);
    
    {  Tela de alteração do pedido  }
    if  self.Tag = 1  then  begin
      pagPedido.Enabled         := false;
      btnImprimir.Enabled       := false;
      btnImprimirPedido.Enabled := false;
      btnGerarCotacao.Enabled   := false;
      btnImprimeVerso.Enabled   := false;
    end;

  end;
end;

function TfrmPedido.salvar: boolean;
begin
  Result := false;
 try
   try

     if Pedido = nil then   Pedido := TPedido.create;

     if self.Tag = 1 then
       Pedido.Codigo := BuscaPedido1.codigo;

     Pedido.numpedido         := BuscaPedido1.edtNumPedido.Text;
     Pedido.cod_tab_preco     := BuscaTabelaPreco1.edtCodigo.AsInteger;
     Pedido.cod_forma_pag     := BuscaFormaPagamento1.edtCodigo.AsInteger;
     Pedido.cod_filial        := StrToIntDef(BuscaEmpresa.edtCodigo.Text,0);
     Pedido.cod_cliente       := BuscaCliente.edtCodigo.AsInteger;
     Pedido.cod_transp        := BuscaTransportadora.edtCodigo.AsInteger;
     Pedido.cod_repres        := buscaRepresentante.codigo;
     Pedido.dt_cadastro       := dtpCadastro.DateTime;
     Pedido.dt_representante  := dtpRepresentante.DateTime;
     Pedido.dt_recebimento    := dtpRecebido.DateTime;
     Pedido.dt_entrega        := dtpInicio.DateTime;
     Pedido.dt_limite_entrega := dtpLimite.DateTime;
     Pedido.desconto          := edtDescontoPedido.Value;
     Pedido.desconto_fpgto    := edtDescFPgto.Value;
     Pedido.acrescimo         := edtAcrescimoPedido.Value;
     Pedido.comissao          := edtPercComissao.Value;
     Pedido.desconto_comiss   := edtDescComiss.Value;
     Pedido.valor_total       := edtTotPedido.Value;
     Pedido.aprovacao         := copy(cbAprovacao.Text,1,1);
     Pedido.aprovado_por      := IfThen(cbAprovacao.ItemIndex = 1, edtAprovado.Text,'');
     Pedido.despachado        := IfThen(rbSim.Checked, 'S', '');
     Pedido.dt_despacho       := StrToDateDef(edtDataDespacho.Text, strToDate('01/01/1900'));
     Pedido.desconto_itens    := edtDescontoItens.Value;  //itens
     Pedido.valor_frete       := edtValorFrete.Value;

     {se pedido já tem conferencia associada e esta sendo cancelado, retorna o estoque conferido}
     if assigned(BuscaPedido1.Ped) and assigned(BuscaPedido1.Ped.Conferencia) and (Pedido.cancelado <> 'S') and (rgStatus.ItemIndex = 1) then
       Atualiza_estoque(BuscaPedido1.Ped);

     Pedido.cancelado         := IfThen(rgStatus.ItemIndex = 1, 'S', '');

     if edtDtAprovacao.Text <> '' then
       Pedido.dt_aprovacao      := StrToDate(edtDtAprovacao.Text);

     {if not(aprovado) and (Pedido.aprovacao = 'A') then
       Pedido.dt_aprovacao      := date;}


     Pedido.observacao        := memObs.Text;
     Pedido.tipo_frete        := cbTipoFrete.ItemIndex;


 { - - - - - - - - - - - INSERÇÃO DOS ITENS DO PEDIDO - - - - - - - - - - - }

       cdsItens.First;
       while not cdsItens.Eof do begin

         Pedido.Item := TItem.Create;

         if self.Tag = 1 then
           Pedido.Item.codigo := cdsItensCODIGO.AsInteger;

         Pedido.Item.cod_pedido        := BuscaPedido1.codigo;
         Pedido.Item.cod_produto       := cdsItensCodPro.AsInteger;
         Pedido.Item.cod_cor           := cdsItensCodCor.AsInteger;
         Pedido.Item.preco             := cdsItensValorUnit.AsFloat;
         Pedido.Item.desconto          := cdsItensDesconto.AsFloat;
         Pedido.Item.valor_total       := cdsItensValorTotalItem.AsFloat;
         Pedido.Item.qtd_RN            := cdsItensTamRN.AsInteger;
         Pedido.Item.qtd_P             := cdsItensTamP.AsInteger;
         Pedido.Item.qtd_M             := cdsItensTamM.AsInteger;
         Pedido.Item.qtd_G             := cdsItensTamG.AsInteger;
         Pedido.Item.qtd_1             := cdsItensTam1.AsInteger;
         Pedido.Item.qtd_2             := cdsItensTam2.AsInteger;
         Pedido.Item.qtd_3             := cdsItensTam3.AsInteger;
         Pedido.Item.qtd_4             := cdsItensTam4.AsInteger;
         Pedido.Item.qtd_6             := cdsItensTam6.AsInteger;
         Pedido.Item.qtd_8             := cdsItensTam8.AsInteger;
         Pedido.Item.qtd_10            := cdsItensTam10.AsInteger;
         Pedido.Item.qtd_12            := cdsItensTam12.AsInteger;
         Pedido.Item.qtd_14            := cdsItensTam14.AsInteger;
         Pedido.Item.qtd_UNICA         := cdsItensTamUnica.AsFloat;
         Pedido.Item.qtd_total         := cdsItensTOTAL.AsFloat;
         Pedido.Item.observacao        := cdsItensObsItem.AsString;

         Pedido.AdicionarItem(Pedido.Item);

         cdsItens.Next;
       end;

       if Pedido.salvar then begin
         DeletaItensArmazenados;
         result := true;
       end;

     btnCancelar.Click;

     avisar('Pedido salvo com sucesso!');

   except                                            
     on e : Exception do
       begin
         raise Exception.create('Erro ao salvar pedido: '+e.Message);
       end;
   end;

 finally
   FreeAndNil(pedido);
 end;

end;

procedure TfrmPedido.SetPedidoTricae(const Value: Boolean);
begin
  FPedidoTricae := Value;

 // edtPercComissao.Value := IfThen(FPedidoTricae,30,0);
  edtValorFrete.Enabled := FPedidoTricae or (pos('CRISTIANO COELHO', buscaRepresentante.edtRazao.Text) > 0);
  edtPreco.ReadOnly     := not FPedidoTricae;
end;

procedure TfrmPedido.mostraPedido;
var i :integer;
begin
  try
          Aguarda('Carregando itens do pedido...');
    edtDescontoPedido.Value                := 0;
    edtAcrescimoPedido.Value               := 0;

    BuscaCliente.codigo                    := BuscaPedido1.Ped.cod_cliente;
    buscaRepresentante.codigo              := BuscaPedido1.Ped.cod_repres;
    BuscaEmpresa.codEmpresa                := BuscaPedido1.Ped.cod_filial;

    BuscaFormaPagamento1.codigoFormaPagamento := BuscaPedido1.Ped.cod_forma_pag;
    BuscaTabelaPreco1.codTabela            := intToStr(BuscaPedido1.Ped.cod_tab_preco);
    BuscaTransportadora.cod_pessoa         := intToStr(BuscaPedido1.Ped.cod_transp);
    cbTipoFrete.ItemIndex                  := BuscaPedido1.Ped.tipo_frete;
    cbAprovacao.ItemIndex                  := IfThen(BuscaPedido1.Ped.aprovacao = 'E',0,IfThen(BuscaPedido1.Ped.aprovacao = 'A',1,2)) ;
    edtAprovado.Text                       := BuscaPedido1.Ped.aprovado_por;

    if BuscaPedido1.Ped.dt_aprovacao > StrToDate('01/01/2000') then
      edtDtAprovacao.Text                    := DateToStr(BuscaPedido1.Ped.dt_aprovacao);

    cbAprovacaoChange(nil);

    memObs.Text                            := BuscaPedido1.Ped.observacao;
    dtpCadastro.DateTime                   := BuscaPedido1.Ped.dt_cadastro;
    dtpRepresentante.DateTime              := BuscaPedido1.Ped.dt_representante;
    edtPercComissao.Value                  := BuscaPedido1.Ped.comissao;
    edtDescComiss.Value                    := BuscaPedido1.Ped.desconto_comiss;
    dtpRecebido.DateTime                   := BuscaPedido1.Ped.dt_recebimento;
    dtpInicio.DateTime                     := BuscaPedido1.Ped.dt_entrega;
    dtpLimite.DateTime                     := BuscaPedido1.Ped.dt_limite_entrega;
    rbSim.Checked                          := (BuscaPedido1.Ped.despachado = 'S');
    rbNao.Checked                          := (BuscaPedido1.Ped.despachado <> 'S');
    edtDataDespacho.Text                   :=  IfThen(BuscaPedido1.Ped.dt_despacho > strToDate('01/01/1900'), DateToStr(BuscaPedido1.Ped.dt_despacho), '');
    edtDescontoItens.Value                 := BuscaPedido1.Ped.desconto_itens;
    edtTotPedido.Value                     := BuscaPedido1.Ped.valor_total;
    edtDescontoPedido.Value                := BuscaPedido1.Ped.desconto;
    edtAcrescimoPedido.Value               := BuscaPedido1.Ped.acrescimo;
    edtValorFrete.Value                    := BuscaPedido1.Ped.valor_frete;
    rgStatus.ItemIndex                     := IfThen(BuscaPedido1.Ped.cancelado = 'S', 1, 0);

    if cdsItens.Active then
      cdsitens.EmptyDataSet;

    for i:= 0 to BuscaPedido1.Itens.Count - 1 do begin
      Application.ProcessMessages;
      if not cdsItens.Active then
        cdsItens.CreateDataSet;

      cdsItens.Append;
      cdsItensCODIGO.AsInteger       := TItem(BuscaPedido1.Ped.Itens[i]).codigo;
      cdsItensProduto.AsString       := TItem(BuscaPedido1.Ped.Itens[i]).Produto.Referencia;
      cdsItensCor.AsString           := TItem(BuscaPedido1.Ped.Itens[i]).Cor.Descricao;
      cdsItensRefCor.AsString        := TItem(BuscaPedido1.Ped.Itens[i]).Cor.Referencia;
      cdsItensCodPro.AsInteger       := TItem(BuscaPedido1.Ped.Itens[i]).cod_produto;
      cdsItensCodCor.AsInteger       := TItem(BuscaPedido1.Ped.Itens[i]).cod_cor;
      cdsItensValorUnit.AsFloat      := TItem(BuscaPedido1.Ped.Itens[i]).preco;
      cdsItensDesconto.AsFloat       := TItem(BuscaPedido1.Ped.Itens[i]).desconto;
      cdsItensValorTotalItem.AsFloat := TItem(BuscaPedido1.Ped.Itens[i]).valor_total;
      cdsItensTamRN.AsInteger        := TItem(BuscaPedido1.Ped.Itens[i]).qtd_RN;
      cdsItensTamP.AsInteger         := TItem(BuscaPedido1.Ped.Itens[i]).qtd_P;
      cdsItensTamM.AsInteger         := TItem(BuscaPedido1.Ped.Itens[i]).qtd_M;
      cdsItensTamG.AsInteger         := TItem(BuscaPedido1.Ped.Itens[i]).qtd_G;
      cdsItensTam1.AsInteger         := TItem(BuscaPedido1.Ped.Itens[i]).qtd_1;
      cdsItensTam2.AsInteger         := TItem(BuscaPedido1.Ped.Itens[i]).qtd_2;
      cdsItensTam3.AsInteger         := TItem(BuscaPedido1.Ped.Itens[i]).qtd_3;
      cdsItensTam4.AsInteger         := TItem(BuscaPedido1.Ped.Itens[i]).qtd_4;
      cdsItensTam6.AsInteger         := TItem(BuscaPedido1.Ped.Itens[i]).qtd_6;
      cdsItensTam8.AsInteger         := TItem(BuscaPedido1.Ped.Itens[i]).qtd_8;
      cdsItensTam10.AsInteger        := TItem(BuscaPedido1.Ped.Itens[i]).qtd_10;
      cdsItensTam12.AsInteger        := TItem(BuscaPedido1.Ped.Itens[i]).qtd_12;
      cdsItensTam14.AsInteger        := TItem(BuscaPedido1.Ped.Itens[i]).qtd_14;
      cdsItensTamUNICA.AsFloat       := TItem(BuscaPedido1.Ped.Itens[i]).qtd_UNICA;
      cdsItensTOTAL.AsFloat          := TItem(BuscaPedido1.Ped.Itens[i]).qtd_total;
      cdsItensObsItem.AsString       := TItem(BuscaPedido1.Ped.Itens[i]).observacao;
      cdsItensDESMEMBRADO.AsString   := IfThen(TItem(BuscaPedido1.Ped.Itens[i]).codigoProdutoKit > 0, 'S', 'N');
      cdsItens.Post;
    end;

    calculaTotais;
    btnImprimir.Enabled       := true;
    btnImprimirPedido.Enabled := true;
    btnGerarCotacao.Enabled   := true;
    btnImprimeVerso.Enabled   := true;
    btnInfCli.Visible         := true;

    if not (BuscaPedido1.pedido_faturado) and (pnlNAlteravelCabecalho.Enabled) then
        BuscaEmpresa.btnBusca.SetFocus
  finally
    FimAguarda();
  end;
end;

function TfrmPedido.verificaObrigatoriosPedido: Boolean;
begin
  Result := false;

  try
    if ( BuscaPedido1.edtNumPedido.Text = '' ) then begin
      pagPedido.activePageIndex := 0;
      BuscaPedido1.edtNumPedido.SetFocus;
      avisar('O número do pedido não foi informado!');
    end
    else if not (BuscaEmpresa.edtCodigo.Text <> '0') then begin
      pagPedido.activePageIndex := 0;
      BuscaEmpresa.edtCodigo.SetFocus;
      avisar('Favor selecionar filial para prosseguir com o pedido');
    end
    else if not (BuscaFormaPagamento1.edtCodigo.Value > 0) then begin
      pagPedido.activePageIndex := 0;
      BuscaFormaPagamento1.edtCodigo.SetFocus;
      avisar('Favor selecionar forma de pagamento para prosseguir com o pedido');
    end
    else if not (BuscaTabelaPreco1.edtCodigo.Value > 0) then begin
      pagPedido.activePageIndex := 0;
      BuscaTabelaPreco1.edtCodigo.SetFocus;
      avisar('Favor selecionar tabela de preço para prosseguir com o pedido');
    end
    else if not (BuscaTransportadora.edtCodigo.Value > 0) then begin
      pagPedido.activePageIndex := 0;
      BuscaTransportadora.edtCodigo.SetFocus;
      avisar('Favor selecionar transportadora para prosseguir com o pedido');
    end
    else if not (BuscaCliente.edtCodigo.Value > 0) then begin
      pagPedido.ActivePageIndex := 0;
      BuscaCliente.edtCodigo.SetFocus;
      avisar('Favor selecionar cliente para prosseguir com o pedido');
    end
    else if not assigned(buscaRepresentante.Representante) then begin
      avisar('Favor selecionar representante para prosseguir com o pedido');
      pagPedido.ActivePageIndex := 0;
      buscaRepresentante.edtCodigo.SetFocus;
    end
  {  else if edtPercComissao.Value <= 0 then begin
      avisar('Favor informar a percentagem de comissão do representante');
      edtPercComissao.SetFocus;
      Result := false;
    end     }
    else if ( cbAprovacao.ItemIndex = 1 ) and ( trim(edtAprovado.Text) = '' ) then begin
      pagPedido.activePageIndex := 0;
      edtAprovado.Enabled := true;
      edtAprovado.SetFocus;
      avisar('Favor informar quem aprovou o pedido');
    end
    else if not ( cdsItens.Active ) or ( cdsItens.IsEmpty ) then
      avisar('Nenhum item foi adicionado ao pedido. Operação Cancelada.')
    else
      result := true;

  except
    on E: EInvalidOperation do begin
       self.pagPedido.ActivePageIndex := 0;
       result := self.verificaObrigatoriosPedido();
    end;
  end;
end;

procedure TfrmPedido.memObsKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TfrmPedido.BuscaPedido1Exit(Sender: TObject);
begin
  try
    BuscaCliente.OnExit := nil;
    if BuscaPedido1.codigo > 0 then begin //se encontrou
       pagPedido.ActivePageIndex := 0;

       if self.Tag = 1 then begin //alterando
          if assigned(BuscaPedido1.Ped.Conferencia) or (BuscaPedido1.pedido_faturado) then begin
            avisar('Esse pedido já '+IfThen(assigned(BuscaPedido1.Ped.Conferencia),'possui uma conferência associada', 'foi faturado')+#13#10+
                   'Portanto, não é possível altera-lo.');
            bloqueia_alteracao( false);
          end
          else  bloqueia_alteracao( true );

          pagPedido.Enabled := true;
          btnSalvar.Enabled := true;
          if Buscapedido1.pedido_faturado then
          begin
            imgFaturado.Visible   := true;
            lbfaturado.Visible    := true;
          end
          else begin
            imgFaturado.Visible   := false;
            lbfaturado.Visible    := false;
          end;
          BuscaPedido1.Enabled := false;

          mostraPedido;
       end
       else if self.Tag = 0 then begin //incluindo
         if confirma('Já existe um pedido com esse número! Deseja aproveitar dados do mesmo?') then begin
           aproveitandoPedido := true;
           mostraPedido;
           BuscaPedido1.limpa;
           BuscaPedido1.edtNumPedido.Clear;
           BuscaCliente.limpa;
           buscaRepresentante.limpa;
         end
         else begin
           BuscaPedido1.limpa;
           BuscaPedido1.edtNumPedido.SetFocus;
         end;
       end
    end
    else
    begin
       if self.Tag = 1 then begin

         if BuscaPedido1.edtNumPedido.Text = '' then begin
           BuscaPedido1.btnBuscar.Click;
           BuscaPedido1Exit(nil);
         end
         else begin
           avisar('Pedido não encontrado!');
           BuscaPedido1.edtNumPedido.Clear;
           BuscaPedido1.edtNumPedido.SetFocus;
           limpaCampos;
         end;
       end
       else if self.Tag = 0 then begin
         if not aproveitandoPedido then  limpaCampos;
         BuscaCliente.btnBuscar.Click;
       end;
    end;

  finally
    BuscaCliente.OnExit := BuscaClienteExit;
  end;
end;

procedure TfrmPedido.BuscaPedido1btnBuscarEnter(Sender: TObject);
begin
  inherited;

  keybd_event(VK_TAB, 0, 0, 0);

end;

procedure TfrmPedido.BuscaPedido1btnBuscarClick(Sender: TObject);
begin
  inherited;
  BuscaPedido1.btnBuscarClick(Sender);
  if BuscaPedido1.edtNumPedido.Text <> '' then
    keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TfrmPedido.limpaCampos;
begin
  BuscaPedido1.limpa;
  BuscaCliente.limpa;
  BuscaEmpresa.codEmpresa    := 0;
  BuscaFormaPagamento1.limpa;
  BuscaTabelaPreco1.limpa;
  BuscaTransportadora.limpa;
  dtpInicio.DateTime         := Date;
  dtpLimite.DateTime         := Date;
  dtpCadastro.DateTime       := Date;
  dtpRecebido.DateTime       := Date;
  cbAprovacao.ItemIndex      := 0;
  edtAprovado.Clear;
  edtPercComissao.Clear;
  edtDescComiss.Clear;
  edtDtAprovacao.Clear;
  edtPreco.Clear;
  buscaRepresentante.limpa;
  edtDataDespacho.Clear;
  edtTotPedido.Clear;
  edtTotItens.Clear;
  edtDescFPgto.Clear;
  edtDescontoItens.Clear;
  edtTotPedidoBruto.Clear;
  edtDesconto.Clear;
  edtAcrescimoPedido.Clear;
  edtValorFrete.Clear;
  edtDescontoPedido.Clear;
  edtObservacoes.Clear;
  rbNao.Checked              := true;
  cbTipoFrete.ItemIndex      := 0;
  memObs.Clear;
  BuscaProduto1.limpa;
  if cdsItens.active then cdsItens.EmptyDataSet;
  limpaItem;

  cbAprovacaoChange(nil);
  imgFaturado.Visible := false;
  lbFaturado.Visible  := false;
  rgStatus.ItemIndex := 0;

end;

procedure TfrmPedido.btnCancelarClick(Sender: TObject);
begin
  self.cancelar;
end;

procedure TfrmPedido.pagPedidoChange(Sender: TObject);
begin
  inherited;
  if pagPedido.ActivePageIndex = 1 then begin
    if not (BuscaProduto1.codproduto = '') and not (BuscaProduto1.codproduto = '0') then
      BuscaCor1.edtReferencia.SetFocus;
  end;
end;

procedure TfrmPedido.BuscaClienteExit(Sender: TObject);
begin
  if (pagPedido.Enabled) and ((BuscaEmpresa.edtCodigo.Text = '0') or (BuscaEmpresa.edtCodigo.Text = '')) then
    if (pagPedido.ActivePageIndex = 0) then
      BuscaEmpresa.edtCodigo.SetFocus
    else
      BuscaPedido1.edtNumPedido.SetFocus;

  btnInfCli.Visible     := false;

  if assigned(BuscaCliente.Cliente) then begin
    if (self.TAG = 0) then
    begin
      BuscaTabelaPreco1.codTabela               := intToStr(BuscaCliente.Cliente.CodTabelaPreco);
      BuscaFormaPagamento1.codigoFormaPagamento := BuscaCliente.Cliente.CodFormasPgto;
    end;

   { if not assigned(buscaRepresentante.Representante) then
    begin
      avisar('Atenção! Nenhum representante foi selecionado, assim, o pedido não poderá ser concluído.');
      buscaRepresentante.edtCodigo.SetFocus;
    end; }

    btnInfCli.Visible     := true;
  end;

  {se estiver na tela de alteração do pedido e o rep. salvo no pedido for diferente do atualmente vinculado ao cliente...}
  if assigned(BuscaPedido1.Ped) and assigned(BuscaCliente.Cliente) and (BuscaPedido1.Ped.cod_repres <> BuscaCliente.Cliente.Representante.Codigo) then
    buscaRepresentante.codigo := BuscaPedido1.Ped.cod_repres
  else if assigned(BuscaCliente.Cliente) and assigned(BuscaCliente.Cliente.Representante) then
    buscaRepresentante.codigo := BuscaCliente.Cliente.Representante.Codigo;

  if assigned(buscaRepresentante.Representante) and assigned(buscaRepresentante.Representante.DadosRepresentante) and (buscaRepresentante.Representante.DadosRepresentante.percentagem_comissao > 0) then
    edtPercComissao.Value := BuscaRepresentante.Representante.DadosRepresentante.percentagem_comissao;
end;

procedure TfrmPedido.gridItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( key = VK_Delete ) then
  begin
    if (cdsItensDESMEMBRADO.AsString = 'S') then
      avisar('Este item faz parte de um kit que foi desmembrado, portanto não pode ser deletado.')
    else if (confirma('Deseja realmente remover item selecionado?')) then
      deletarItem
  end
  else if (Key = VK_F8) then
  begin
    if (cdsItensDESMEMBRADO.AsString = 'S') then
      avisar('Este item faz parte de um kit que foi desmembrado, portanto não pode ser alterado.')
    else
      alterarItem;
  end;
end;

procedure TfrmPedido.armazenaItemDeletado;
begin
  if not cdsItemDel.Active then
    cdsItemDel.CreateDataSet;

  cdsItemDel.Append;
  cdsItemDelCOD_ITEM.AsInteger := cdsItensCODIGO.AsInteger;
  cdsItemDel.Post;
end;

procedure TfrmPedido.DeletaItensArmazenados;
begin
  if not (cdsItemDel.Active) or (cdsItemDel.IsEmpty) then
    exit;

  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'delete from itens where cod_pedido = :cod_ped and codigo = :cod';

  cdsItemDel.First;
  while not cdsItemDel.Eof do begin
    fdm.qryGenerica.ParamByName('cod_ped').AsInteger := BuscaPedido1.codigo;
    fdm.qryGenerica.ParamByName('cod').AsInteger := cdsItemDelCOD_ITEM.AsInteger;
    fdm.qryGenerica.ExecSQL;

    cdsItemDel.Next;
  end;

end;

procedure TfrmPedido.BuscaProduto1btnBuscaClick(Sender: TObject);
begin
  if not TabelaProdutoSelecionada then  exit;

  BuscaProduto1.btnBuscaClick(Sender);
end;

procedure TfrmPedido.btnImprimirClick(Sender: TObject);
begin
 frmRelatorioExpedicao := TfrmRelatorioExpedicao.Create(self);

 try
   //frmRelatorioExpedicao.imprime(BuscaPedido1.edtNumPedido.Text,'R'); //imprime Romaneio

   frmRelatorioExpedicao.imprime(BuscaPedido1.edtNumPedido.Text); //imprime expedição
 except
   on e : Exception do
     begin
       Avisar(e.Message);
     end;
 end;

 frmRelatorioExpedicao.Release;
end;

function TfrmPedido.TabelaProdutoSelecionada: boolean;
begin
  Result := false;

  if (BuscaTabelaPreco1.codTabela = '0') or (BuscaTabelaPreco1.codTabela = '') then begin
    avisar('Antes de selecionar o produto é necessário informar a tabela de preço!');
    pagPedido.ActivePageIndex := 0;
    BuscaTabelaPreco1.edtCodigo.SetFocus;
    exit;
  end;

  BuscaProduto1.codTabela := BuscaTabelaPreco1.codTabela;
  Result := true;
end;

procedure TfrmPedido.BuscaProduto1Exit(Sender: TObject);
begin
  if (BuscaProduto1.edtGrade.Text <> '') then begin
    edtPreco.Value := BuscaProduto1.preco;
    iniciaGridTamanhos;
    habilitaTamanhos;
    DBGrid1.ReadOnly := false;
  end;
  if (BuscaProduto1.edtReferencia.Text <> '') then
    BuscaCor1.Enabled:= True;
  if BuscaCor1.Enabled then
  begin
    if (pagPedido.ActivePageIndex = 1) then
      if (FPedidoTricae) then
        edtPreco.SetFocus
      else if buscacor1.enabled then
        BuscaCor1.edtReferencia.SetFocus;
  end
  else
    DBGrid1.ReadOnly := false;
end;

procedure TfrmPedido.buscaRepresentante1edtRazaoChange(Sender: TObject);
begin
  if buscaRepresentante.edtRazao.Text <> '' then
    PedidoTricae := (pos('TRICAE', buscaRepresentante.edtRazao.Text) > 0);
end;

procedure TfrmPedido.buscaRepresentanteExit(Sender: TObject);
begin
  inherited;
  if assigned(buscaRepresentante.Representante) and assigned(buscaRepresentante.Representante.DadosRepresentante) and (buscaRepresentante.Representante.DadosRepresentante.percentagem_comissao > 0) then
    edtPercComissao.Value := BuscaRepresentante.Representante.DadosRepresentante.percentagem_comissao;
end;

procedure TfrmPedido.calculaTotais;
var valorFrete :Real;
begin
  valorFrete := 0;
  if not cdsItens.active then   cdsItens.CreateDataSet;
  edtTotPedido.Value      := 0;
  edtTotItens.Value       := 0;
  edtTotPedidoBruto.Value := 0;
  edtDescontoItens.Value  := 0;

  cdsItens.DisableControls;
  cdsItens.First;
  while not cdsItens.Eof do begin

    edtDescontoItens.Value := edtDescontoItens.Value + cdsItensDesconto.AsFloat;
    edtTotPedido.Value     := edtTotPedido.Value + cdsItensValorTotalItem.AsFloat;

    cdsItens.Next;
  end;

  if cbTipoFrete.ItemIndex = 0 then
    valorFrete := edtValorFrete.Value;

  edtTotItens.Value       := cdsItens.RecordCount;
  edtTotPedidoBruto.Value := edtDescontoItens.Value + edtTotPedido.Value + valorFrete;
 // edtTotPedidoBruto.Value := arredonda( edtTotPedidoBruto.Value );

  if ( edtTotPedido.Value > 0 ) then  begin
    edtDescFPgto.Value := arredonda( (edtTotPedidoBruto.Value * BuscaFormaPagamento1.FormaPagamento.Desconto) / 100 );
    edtTotPedido.Value := edtTotPedido.Value - edtDescFPgto.Value;
    edtTotPedido.Value := edtTotPedido.Value - edtDescontoPedido.Value;
    edtTotPedido.Value := edtTotPedido.Value + edtAcrescimoPedido.Value;
    edtTotPedido.Value := edtTotPedido.Value + valorFrete;
  //  edtTotPedido.Value := arredonda( edtTotPedido.Value );
  end;

  cdsItens.EnableControls;
end;

procedure TfrmPedido.btnImprimirPedidoClick(Sender: TObject);
begin
  frmRelatorioPedidoVenda := TfrmRelatorioPedidoVenda.Create(self);

 try
   frmRelatorioPedidoVenda.imprime(BuscaPedido1.edtNumPedido.Text); //imprime pedido de venda

 except
   on e : Exception do
     begin
       Avisar(e.Message);
     end;
 end;

 frmRelatorioPedidoVenda.Release;
end;

procedure TfrmPedido.btnInfCliClick(Sender: TObject);
begin
  frmInformacoesPessoa := TfrmInformacoesPessoa.create(self, BuscaCliente.edtCodigo.AsInteger);
  frmInformacoesPessoa.ShowModal;
  frmInformacoesPessoa.Release;
end;

procedure TfrmPedido.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F12) then  btnConfirma.Click;
end;

procedure TfrmPedido.DBGrid1Enter(Sender: TObject);
begin
  DBGrid1.SelectedIndex := 0;

  while DBGrid1.Columns.Items[DBGrid1.SelectedIndex].ReadOnly do begin

    DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1;

  end;
end;

procedure TfrmPedido.BuscaProduto1edtReferenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not TabelaProdutoSelecionada then  exit;
end;

procedure TfrmPedido.BuscaProduto1edtDescricaoEnter(Sender: TObject);
begin
  if BuscaProduto1.edtReferencia.Text <> '' then
    BuscaCor1.edtCodigo.SetFocus;
end;

procedure TfrmPedido.rbNaoClick(Sender: TObject);
begin
{  if rbNao.Checked then begin
    rbSim.Checked        := false;
    edtDataDespacho.Text := '';
  end; }
end;

procedure TfrmPedido.rbSimClick(Sender: TObject);
begin
  {if rbSim.Checked then begin
    rbNao.Checked        := false;
    edtDataDespacho.Text := DateToStr(Date);
  end;}
end;

procedure TfrmPedido.edtDescontoPedidoChange(Sender: TObject);
begin

  if (edtTotPedidoBruto.Value > 0) and (edtDescontoPedido.Value > (edtTotPedidoBruto.Value - edtDescontoItens.Value - edtDescFPgto.Value)) then
    edtDescontoPedido.Value := (edtTotPedidoBruto.Value - edtDescontoItens.Value - edtDescFPgto.Value);

  edtTotPedido.Value := (edtTotPedidoBruto.Value - edtDescontoItens.Value - edtDescFPgto.Value) - edtDescontoPedido.Value;
end;

procedure TfrmPedido.edtAcrescimoPedidoChange(Sender: TObject);
begin
  if edtTotPedidoBruto.Value > 0 then
    edtTotPedido.Value := (edtTotPedidoBruto.Value - edtDescontoItens.Value - edtDescFPgto.Value) + edtAcrescimoPedido.Value;
end;

procedure TfrmPedido.edtAcrescimoPedidoExit(Sender: TObject);
begin
  edtDescontoPedido.SetFocus;
end;

procedure TfrmPedido.edtAcrescimoPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtDescontoPedido.Value > 0 then edtDescontoPedido.Clear;
end;

procedure TfrmPedido.edtDescontoPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if edtAcrescimoPedido.Value > 0 then edtAcrescimoPedido.Clear;
end;

procedure TfrmPedido.bloqueia_alteracao(boleana :Boolean);
begin
  pnlNAlteravelCabecalho.Enabled := boleana;
  TabSheet2.Enabled              := boleana;
  gridItens.Enabled              := boleana;
  BuscaCliente.Enabled           := boleana;
  imgFaturado.Visible            := not boleana;
  lbfaturado.Visible             := not boleana;

  if assigned(BuscaPedido1.Ped) then begin
    gbDespachado.Enabled := BuscaPedido1.Ped.cancelado <> 'S';
    gpbComissao.Enabled  := BuscaPedido1.Ped.cancelado <> 'S';
  end;
end;

procedure TfrmPedido.edtPrecoEnter(Sender: TObject);
begin
  if not FPedidoTricae then
    keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TfrmPedido.BuscaFormaPagamento1Exit(Sender: TObject);
begin
  calculaTotais;
  if (BuscaFormaPagamento1.edtDescricao.Text <> '') and assigned(buscaRepresentante.Representante) and assigned(buscaRepresentante.Representante.DadosRepresentante)
  and (buscaRepresentante.Representante.DadosRepresentante.percentagem_comissao <= 0) then
    edtPercComissao.Value := BuscaFormaPagamento1.FormaPagamento.Perc_Comissao;
end;

procedure TfrmPedido.edtDescontoPedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in['0'..'9',#8,',']) then
    key := #0;
end;

procedure TfrmPedido.BuscaCor1Enter(Sender: TObject);
begin
  BuscaCor1.FiltroProduto := BuscaProduto1.codproduto;
  BuscaCor1.ApareceKits   := IfThen(BuscaProduto1.Kit,'S','N');
end;

procedure TfrmPedido.edtDescComissExit(Sender: TObject);
begin
  calculaTotais;
  if pagPedido.ActivePageIndex = 0 then
    memObs.SetFocus;
end;

procedure TfrmPedido.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (ActiveControl = edtDescComiss) and (Msg.CharCode = VK_TAB) then begin
    if pnlNAlteravelCabecalho.Enabled then
      memObs.setFocus;
  end
  else if (ActiveControl = edtAprovado) and (Msg.CharCode = VK_TAB) then
    gbPeriodo.SetFocus
  else if (ActiveControl = dtpLimite) and (Msg.CharCode = VK_TAB) then
    gbTipoFrete.SetFocus;

end;

procedure TfrmPedido.Atualiza_estoque(pedido :TPedido);
var i, adiciona_subtrai :integer;
    cdsTamanhos         :TClientDataSet;
    item_conferido      :TConferenciaItem;
    Especificacao       :TEspecificacaoItemConferidoPorCodigoItem;
    repositorio         :TRepositorio;
    vCaixaPedido        :TCaixaPedido;
begin
 try
   dm.qryGenerica.Close;
   dm.qryGenerica.SQL.Text := 'execute procedure baixa_pedido_estoque('+intToStr(BuscaPedido1.Ped.Codigo)+', :multiplicador)';
   // multiplicador determina se os itens conferidos dão baixa no estoque (-1), ou se retornam pro estoque (+1)
   dm.qryGenerica.ParamByName('multiplicador').AsInteger := +1;
   dm.qryGenerica.ExecSQL;

   if assigned(BuscaPedido1.Ped.Conferencia.Caixas) then
   begin
     for i := 0 to BuscaPedido1.Ped.Conferencia.Caixas.Count-1 do
       if TCaixaPedido(BuscaPedido1.Ped.Conferencia.Caixas.Items[i]).baixou_estoque = 'S' then
         TCaixaPedido(BuscaPedido1.Ped.Conferencia.Caixas.Items[i]).retornaEstoque;
   end;

 Except
   on e : Exception do
     begin
       raise Exception.create('[atualiza estoque] '+e.Message);
     end;
 end;
end;

procedure TfrmPedido.Busca_tamanhos(var cds: TClientDataSet);
var lista :TObjectList;
    repositorio :TRepositorio;
    i :integer;
begin
  repositorio := nil;

  lista := TObjectList.Create(true);

  cds := TClientDataSet.Create(Self);
  cds.Close;
  cds.FieldDefs.Clear;
  cds.FieldDefs.add('CODIGO',ftInteger);
  cds.FieldDefs.add('TAMANHO',ftString,10);
  cds.CreateDataSet;

 try
  repositorio := TFabricaRepositorio.GetRepositorio(TTamanho.ClassName);
  lista       := repositorio.GetAll;

  for i := 0 to lista.Count - 1 do begin
    cds.Append;
    cds.fieldByName('CODIGO').AsInteger := (lista.Items[i] as TTamanho).Codigo;
    cds.fieldByName('TAMANHO').AsString := (lista.Items[i] as TTamanho).Descricao;
    cds.Post;
  end;

 finally
   FreeAndNil(repositorio);
   lista.Free;
 end;
end;

procedure TfrmPedido.rgStatusClick(Sender: TObject);
begin
  if rgStatus.ItemIndex = 1 then
    if not confirma('Uma vez cancelado, o pedido não voltará mais ao status de "normal". Confirma operação?') then
      rgStatus.ItemIndex := 0;
end;
      {
procedure TfrmPedido.Salva_estoque(cod_produto, cod_cor,
  cod_tamanho: integer; quantidade: Real);
var
    Estoque :TEstoque;
    repositorio :TRepositorio;
    Especificacao :TEspecificacaoEstoquePorProdutoCorTamanho;
begin
  repositorio    := nil;
  Estoque        := nil;

  try
    repositorio    := TFabricaRepositorio.GetRepositorio(TEstoque.ClassName);
    Especificacao  := TEspecificacaoEstoquePorProdutoCorTamanho.Create(cod_produto,
                                                                       cod_cor,
                                                                       cod_tamanho);

    Estoque     := TEstoque( repositorio.GetPorEspecificacao( Especificacao, intToStr(cod_produto)) );

    if not assigned(Estoque) then
      Estoque := TEstoque.Create;

    Estoque.codigo_produto := cod_produto;
    Estoque.codigo_cor     := cod_cor;
    Estoque.codigo_tamanho := cod_tamanho;
    Estoque.quantidade     := Estoque.quantidade + quantidade;

    repositorio.Salvar(Estoque);

  finally
    if Assigned(repositorio) then FreeAndNil(repositorio);
    if Assigned(Estoque)     then FreeAndNil(Estoque);
  end;

end; }

procedure TfrmPedido.rbNaoExit(Sender: TObject);
begin
  if pagPedido.ActivePageIndex = 0 then
    edtPercComissao.SetFocus;
end;

procedure TfrmPedido.rbSimExit(Sender: TObject);
begin
  if pagPedido.ActivePageIndex = 0 then
    edtDataDespacho.SetFocus;
end;

procedure TfrmPedido.BuscaProduto1edtReferenciaChange(Sender: TObject);
begin
  inherited;
  BuscaProduto1.edtReferenciaChange(Sender);
  BuscaCor1.limpa;
  BuscaCor1.Enabled:= False;
end;

procedure TfrmPedido.BuscaCor1edtReferenciaChange(Sender: TObject);
begin
  inherited;
  BuscaCor1.edtDescricao.Text:= '';
  edtEstoque.Text:= '0';
  if not cdsEstoque.Active then
    cdsEstoque.CreateDataSet;
  cdsEstoque.EmptyDataSet;
end;

procedure TfrmPedido.subtrai_estoque_reservado;
var i :integer;
begin

  dm.qryGenerica.Close;
  dm.qryGenerica.SQL.Text := 'select sum(ci.qtd_rn) QTD_RN, sum(ci.qtd_p) QTD_P, sum(ci.qtd_m) QTD_M, sum(ci.qtd_g) QTD_G,    '+
                                  ' sum(ci.qtd_1) QTD_1, sum(ci.qtd_2) QTD_2, sum(ci.qtd_3) QTD_3, sum(ci.qtd_4) QTD_4,       '+
                                  ' sum(ci.qtd_6) QTD_6, sum(ci.qtd_8) QTD_8, sum(ci.qtd_10) QTD_8, sum(ci.qtd_8) QTD_12,     '+
                                  ' sum(ci.qtd_14) QTD_14, sum(ci.qtd_unica) QTD_unica,                                       '+
                                  ' pro.referencia REFPRODUTO , cor.referencia REFCOR                       from ITENS i      '+

                                  ' left join conferencia_itens  ci on ci.codigo_item = i.codigo                              '+
                                  ' left join conferencia_pedido cp on cp.codigo = ci.codigo_conferencia                      '+
                                  ' left join cores              cor on cor.codigo = i.cod_cor                                '+
                                  ' left join produtos           pro on pro.codigo = i.cod_produto                            '+

                                  ' where cp.fim < ''01.01.1900'' and i.cod_produto = ' +IntToStr(BuscaProduto1.CodigoProduto) +
                                  '   and cor.codigo = ' +IntToStr(BuscaCor1.CodigoCor) +

                                  ' group by pro.referencia, cor.referencia                                                   '+
                                  ' order by pro.referencia, cor.referencia                                                   ';

  dm.qryGenerica.Open;

  cdsEstoque.Edit;
  for i := 0 to cdsEstoque.Fields.Count - 1 do
    cdsEstoque.Fields[i].AsInteger := cdsEstoque.Fields[i].AsInteger - dm.qryGenerica.Fields[i].AsInteger;

  //cds.Post;
end;

procedure TfrmPedido.btnImprimeVersoClick(Sender: TObject);
begin
  frmRelatorioPedidoVenda := TfrmRelatorioPedidoVenda.Create(self);

 try
   frmRelatorioPedidoVenda.imprimeVerso(BuscaPedido1.Ped); //imprime pedido de venda

 except
   on e : Exception do
     begin
       Avisar(e.Message);
     end;
 end;

 frmRelatorioPedidoVenda.Release;
end;

end.



