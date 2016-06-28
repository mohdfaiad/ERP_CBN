unit uPedidoConsumidorFinal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, DBGridCBN, Math,
  frameBuscaProduto, Datasnap.DBClient, Vcl.Mask, RxToolEdit, RxCurrEdit,
  frameBuscaFormaPagamento, frameBuscaPessoa, Printers, Pedido, RLReport,
  RLParser, System.StrUtils, Vcl.Imaging.pngimage, ConfiguracoesNFCe,
  frameBuscaPedido;

type
  TEstadoItem = (teInserindo, teAlterando);

type
  TfrmPedidoConsumidorFinal = class(TfrmPadrao)
    BuscaProduto1: TBuscaProduto;
    pnlBotoes: TPanel;
    btnVoltar: TBitBtn;
    btnAlteraItem: TBitBtn;
    btnDeletaItem: TBitBtn;
    btnFinalizaPedido: TBitBtn;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    cdsItensCOD_PRODUTO: TIntegerField;
    cdsItensPRODUTO: TStringField;
    cdsItensPECAS: TIntegerField;
    cdsItensPESO: TFloatField;
    cdsItensVALOR_ITEM: TFloatField;
    Shape1: TShape;
    cdsItensREFPRO: TStringField;
    pnlTopo: TPanel;
    BuscaPessoa1: TBuscaPessoa;
    BuscaFormaPagamento1: TBuscaFormaPagamento;
    Shape2: TShape;
    cdsItensPRECO_KG: TFloatField;
    Shape3: TShape;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    rlPedido: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel3: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLDraw2: TRLDraw;
    RLExpressionParser1: TRLExpressionParser;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    gridItens: TDBGrid;
    Image1: TImage;
    edtCodigoPedido: TCurrencyEdit;
    BuscaPedido1: TBuscaPedido;
    cdsItensCODIGO_ITEM: TIntegerField;
    btnNovo: TBitBtn;
    btnCancelar: TBitBtn;
    pnlValores: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    btnAddItem: TBitBtn;
    edtValorItem: TCurrencyEdit;
    edtTotalPedido: TCurrencyEdit;
    edtPrecoKg: TCurrencyEdit;
    edtPecas: TCurrencyEdit;
    edtPeso: TCurrencyEdit;
    edtDesconto: TCurrencyEdit;
    procedure btnAddItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlteraItemClick(Sender: TObject);
    procedure edtPrecoKgChange(Sender: TObject);
    procedure btnDeletaItemClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnFinalizaPedidoClick(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure BuscaPedido1edtNumPedidoChange(Sender: TObject);
    procedure BuscaPedido1btnBuscarClick(Sender: TObject);
    procedure BuscaPedido1Exit(Sender: TObject);
    procedure BuscaPedido1edtNumPedidoEnter(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FEstadoItem           :TEstadoItem;

    FTotalPedido          :Real;
    Configuracoes         :TConfiguracoesNFCe;
    cupomPendente         :Boolean;

    procedure adicionaItem;
    procedure limpaCampos;
    procedure carregaItem;
    procedure cancelaItem;
    procedure verificaSair;
    procedure finalizaPedido;
    procedure imprimePedido(pedido :TPedido);
    procedure limparDados;
    function tabelaPrecoProduto :integer;
    function buscaCorProduto :integer;
    function verificaObrigatorios :Boolean;
    function verificaObrigatoriosItem :Boolean;
    function efetuaRecebimento :Boolean;

    procedure atualizaEstoque(pedido :TPedido);
    procedure habilitaDesabilita(habilita_desabilita :String);
    function geraCupomEletronico(codigoPedido :integer) :Boolean;
    procedure carregaPedido(Pedido :TPedido);
    procedure calculaTotal;

  public
    { Public declarations }
  end;

var
  frmPedidoConsumidorFinal: TfrmPedidoConsumidorFinal;

const
  ACIONA_GUILHOTINA = #27 + #109;

implementation

uses Repositorio, FabricaRepositorio, Item, TipoPessoa, Funcoes, Estoque,
  uModulo, EspecificacaoEstoquePorProdutoCorTamanho, ServicoEmissorNFCe, Venda,
  uRecebimentoPedido;

{$R *.dfm}

procedure TfrmPedidoConsumidorFinal.adicionaItem;
begin
  if FEstadoItem = teInserindo then
  begin
    cdsItens.Append;
  end
  else
  begin
    edtTotalPedido.Value := edtTotalPedido.Value - cdsItensVALOR_ITEM.AsFloat;
    cdsItens.Edit;
 //   BuscaProduto1.Enabled    := true;
    gridItens.Enabled        := true;
  end;

  cdsItensCOD_PRODUTO.AsInteger    := BuscaProduto1.CodigoProduto;
  cdsItensREFPRO.AsString          := BuscaProduto1.edtReferencia.Text;
  cdsItensPRODUTO.AsString         := BuscaProduto1.edtDescricao.Text;
  cdsItensPRECO_KG.AsFloat         := edtPrecoKg.Value;
  cdsItensPECAS.AsInteger          := edtPecas.AsInteger;
  cdsItensPESO.AsFloat             := edtPeso.Value;
  cdsItensVALOR_ITEM.AsFloat       := edtValorItem.Value;
  cdsItens.Post;

  edtTotalPedido.Value             := edtTotalPedido.Value + edtValorItem.Value;
  FTotalPedido                     := edtTotalPedido.Value + edtDesconto.Value;

  limpaCampos;
  //BuscaProduto1.edtReferencia.SetFocus;
  edtPeso.SetFocus;
end;

procedure TfrmPedidoConsumidorFinal.btnVoltarClick(Sender: TObject);
begin
  if cupomPendente then
    limparDados
  else
    verificaSair;
end;

function TfrmPedidoConsumidorFinal.buscaCorProduto: integer;
begin
   result := StrToIntDef( Campo_por_campo('PRODUTO_CORES', 'CODCOR', 'CODPRODUTO', BuscaProduto1.codproduto),0);
end;

procedure TfrmPedidoConsumidorFinal.BuscaPedido1btnBuscarClick(Sender: TObject);
begin
  inherited;
  BuscaPedido1.btnBuscarClick(Sender);
end;

procedure TfrmPedidoConsumidorFinal.BuscaPedido1edtNumPedidoChange(
  Sender: TObject);
begin
{  if pos('L',BuscaPedido1.edtNumPedido.Text) <= 0 then
  begin
    BuscaPedido1.edtNumPedido.Text := 'L'+BuscaPedido1.edtNumPedido.Text;
    BuscaPedido1.edtNumPedido.SelStart := Length( BuscaPedido1.edtNumPedido.Text );
  end;    }
end;

procedure TfrmPedidoConsumidorFinal.BuscaPedido1edtNumPedidoEnter(
  Sender: TObject);
begin
//  BuscaPedido1.edtNumPedido.SelStart := length(BuscaPedido1.edtNumPedido.Text);
end;

procedure TfrmPedidoConsumidorFinal.BuscaPedido1Exit(Sender: TObject);
begin
  inherited;
  if assigned(BuscaPedido1.Ped) then
    carregaPedido(BuscaPedido1.Ped);
end;

procedure TfrmPedidoConsumidorFinal.btnAlteraItemClick(Sender: TObject);
begin
  if cdsItens.IsEmpty then
    exit;

  FEstadoItem := teAlterando;
  carregaItem;
end;

procedure TfrmPedidoConsumidorFinal.btnNovoClick(Sender: TObject);
begin
  BuscaPedido1.edtNumPedido.Text := 'L'+ IntToStr(dm.GetValorGenerator('GEN_PEDIDOS_LOJA_ID') + 1);
  habilitaDesabilita('H');
  edtPeso.SetFocus;
  BuscaPedido1.Enabled := false;
  btnNovo.Enabled      := false;
  pnlValores.Enabled   := true;
end;

procedure TfrmPedidoConsumidorFinal.btnDeletaItemClick(Sender: TObject);
begin
  if cdsItens.IsEmpty then
    exit;

  if confirma('Deseja realmente cancelar o produto selecionado?'+#13#10+'[ '+cdsItensPRODUTO.AsString+' ]') then
    cancelaItem;
end;

procedure TfrmPedidoConsumidorFinal.btnFinalizaPedidoClick(Sender: TObject);
begin
  if BuscaPedido1.edtNumPedido.Text <> '' then
    finalizaPedido;
end;

procedure TfrmPedidoConsumidorFinal.atualizaEstoque(pedido :TPedido);
var Estoque     :TEstoque;
    repositorio :TRepositorio;
    Especificacao :TEspecificacaoEstoquePorProdutoCorTamanho;
    codigo_tamanho, i :integer;
begin
  Estoque     := nil;
  repositorio := nil;
 try
 try
   Estoque        := nil;

   repositorio    := TFabricaRepositorio.GetRepositorio(TEstoque.ClassName);

   for i := 0 to Pedido.Itens.Count - 1 do
   begin
     codigo_tamanho := 11;//strToInt( Campo_por_campo('TAMANHOS', 'CODIGO', 'DESCRICAO',  );


     Especificacao  := TEspecificacaoEstoquePorProdutoCorTamanho.Create(TItem(Pedido.Itens[i]).cod_produto,
                                                                        TItem(Pedido.Itens[i]).cod_cor,
                                                                        codigo_tamanho);

     Estoque     := TEstoque( repositorio.GetPorEspecificacao( Especificacao, BuscaProduto1.codproduto) );

     if not assigned(Estoque) then
       Continue;

     Estoque.atualiza_estoque( TItem(Pedido.Itens[i]).qtd_total *-1 );

     repositorio.Salvar( Estoque );
   end;

 finally
   if assigned(Estoque)     then  FreeAndNil(Estoque);
   if assigned(repositorio) then  FreeAndNil(repositorio);
 end;
 
 Except
   on E : Exception do
     raise Exception.Create(e.Message);
 end;
end;

procedure TfrmPedidoConsumidorFinal.btnCancelarClick(Sender: TObject);
begin
  limparDados;
  BuscaPedido1.limpa;
  BuscaPedido1.edtNumPedido.Clear;
  habilitaDesabilita('D');
end;

procedure TfrmPedidoConsumidorFinal.btnAddItemClick(Sender: TObject);
begin
  if verificaObrigatoriosItem then
    adicionaItem;
end;

procedure TfrmPedidoConsumidorFinal.calculaTotal;
begin
  cdsItens.First;
  while not cdsItens.Eof do
  begin
    edtTotalPedido.Value := edtTotalPedido.Value + cdsItensVALOR_ITEM.AsFloat;
    cdsItens.Next;
  end;

  edtTotalPedido.Value := edtTotalPedido.Value - edtDesconto.Value;
end;

procedure TfrmPedidoConsumidorFinal.cancelaItem;
begin
  edtTotalPedido.Value := edtTotalPedido.Value - cdsItensVALOR_ITEM.AsFloat;
  FTotalPedido         := edtTotalPedido.Value + edtDesconto.Value;
  cdsItens.Delete;
end;

procedure TfrmPedidoConsumidorFinal.carregaItem;
begin
//  BuscaProduto1.codproduto := cdsItensREFPRO.AsString;
  edtPeso.Value            := cdsItensPESO.AsFloat;
  edtPecas.AsInteger       := cdsItensPECAS.AsInteger;
  edtPrecoKg.Value         := cdsItensPRECO_KG.AsFloat;
  edtValorItem.Value       := cdsItensVALOR_ITEM.AsFloat;
 // BuscaProduto1.Enabled    := false;
  gridItens.Enabled        := false;
  edtPeso.SetFocus;
end;

procedure TfrmPedidoConsumidorFinal.carregaPedido(Pedido: TPedido);
var i :integer;
begin
  limparDados;

  for i := 0 to Pedido.Itens.Count - 1 do
  begin
    cdsItens.Append;
    cdsItensCOD_PRODUTO.AsInteger := (Pedido.Itens[i] as TItem).cod_produto;
    cdsItensPRECO_KG.AsFloat      := (Pedido.Itens[i] as TItem).preco;
    cdsItensVALOR_ITEM.AsFloat    := (Pedido.Itens[i] as TItem).valor_total;
    cdsItensPECAS.AsFloat         := (Pedido.Itens[i] as TItem).qtd_UNICA;
    cdsItensPECAS.AsFloat         := (Pedido.Itens[i] as TItem).qtd_total;
    cdsItensPESO.AsFloat          := (Pedido.Itens[i] as TItem).peso;
    cdsItensCODIGO_ITEM.AsInteger := (Pedido.Itens[i] as TItem).codigo;
    cdsItens.Post;
  end;

  edtDesconto.Value := Pedido.desconto;

  calculaTotal;

  habilitaDesabilita('D');
  btnFinalizaPedido.SetFocus;
  edtCodigoPedido.AsInteger := Pedido.Codigo;
  cupomPendente := true;

  btnFinalizaPedido.Caption := '[ F6 ] Enviar Cupom';
end;

procedure TfrmPedidoConsumidorFinal.edtDescontoChange(Sender: TObject);
begin
  inherited;
  edtTotalPedido.Value := FTotalPedido - edtDesconto.Value;
end;

procedure TfrmPedidoConsumidorFinal.edtPrecoKgChange(Sender: TObject);
begin
  if (edtPrecoKg.Value > 0) and (edtPeso.Value > 0) then
    edtValorItem.Value := RoundTo( edtPrecoKg.Value * edtPeso.Value ,-2);
end;

function TfrmPedidoConsumidorFinal.efetuaRecebimento: Boolean;
begin
  frmRecebimentoPedido := TfrmRecebimentoPedido.Create(nil);
  frmRecebimentoPedido.edtTotalPedido.Value := edtTotalPedido.Value;
  result := (frmRecebimentoPedido.ShowModal = mrOk);
end;

procedure TfrmPedidoConsumidorFinal.finalizaPedido;
var repositorio :TRepositorio;
    pedido      :TPedido;
    item        :TItem; 
begin
  if not verificaObrigatorios then
    Exit;

  repositorio := nil;
  pedido      := nil;
  try

    if not (edtCodigoPedido.AsInteger > 0) then
      if not efetuaRecebimento then
      begin
        avisar('O recebimento n�o foi efetuado. Finaliza��o abortada.');
        Exit;
      end;
  try
     repositorio := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);
     pedido      := TPedido( repositorio.Get(edtCodigoPedido.AsInteger));

     if not assigned(pedido) then
     begin
       pedido            := TPedido.Create;
       pedido.numpedido  := 'L'+ IntToStr(dm.GetValorGenerator('GEN_PEDIDOS_LOJA_ID', 1));
     end;

     pedido.cod_tab_preco := tabelaPrecoProduto;
     pedido.cod_forma_pag := StrToIntDef(BuscaFormaPagamento1.codFormaPagamento ,0);
     pedido.cod_filial    := 3;
     pedido.cod_cliente   := StrToIntDef(BuscaPessoa1.cod_pessoa ,0);
     pedido.cod_repres    := StrToIntDef( Campo_por_campo('PESSOAS','CODIGO','RAZAO','LOJA') ,0);

     if pedido.cod_repres = 0 then
       raise Exception.Create('Representante "LOJA" n�o encontrado');

     pedido.dt_cadastro   := Date;
     pedido.dt_representante  := Date;
     pedido.dt_recebimento    := Date;
     pedido.dt_entrega        := Date;
     pedido.dt_limite_entrega := Date;
     pedido.desconto          := edtDesconto.Value;
     pedido.valor_total       := edtTotalPedido.Value;
     pedido.despachado        := 'S';
     pedido.aprovacao         := 'A';
     pedido.aprovado_por      := 'PEDIDO CONSUMIDOR FINAL';

     cdsItens.First;
     repositorio := TFabricaRepositorio.GetRepositorio(TItem.ClassName);
     while not cdsItens.Eof do begin
       Pedido.Item := TItem(repositorio.Get(cdsItensCODIGO_ITEM.AsInteger ));

       if not assigned(Pedido.Item) then
         Pedido.Item := TItem.Create;

       //Pedido.Item.cod_pedido        := pedido.codigo;
       Pedido.Item.cod_produto       := cdsItensCOD_PRODUTO.AsInteger;
       Pedido.Item.cod_cor           := buscaCorProduto;
       Pedido.Item.preco             := cdsItensPRECO_KG.AsFloat;
       Pedido.Item.valor_total       := cdsItensVALOR_ITEM.AsFloat;
       Pedido.Item.qtd_UNICA         := cdsItensPECAS.AsFloat;
       Pedido.Item.qtd_total         := cdsItensPECAS.AsFloat;
       Pedido.Item.peso              := cdsItensPESO.AsFloat;

       Pedido.AdicionarItem(Pedido.Item);

       cdsItens.Next;
       Pedido.Item.Free;
       Pedido.Item := nil;
     end;

     Pedido.salvar;

     if not (edtCodigoPedido.AsInteger > 0) then
     begin
       atualizaEstoque(Pedido);
       avisar('Pedido salvo com sucesso!');
     end;

     edtCodigoPedido.AsInteger := Pedido.Codigo;

     if assigned(frmRecebimentoPedido) then
       frmRecebimentoPedido.salvaRecebimentoPedido(Pedido.Codigo);

     try
       if (cupomPendente) or (assigned(frmRecebimentoPedido) and (frmRecebimentoPedido.cc)) then
       begin
         cupomPendente := true;
         cupomPendente :=  not geraCupomEletronico(Pedido.Codigo);
       end;

     Except
       On E: Exception Do begin
         avisar('Erro ao enviar cupom.'+#13#10+e.Message);
       end;
     end;

     imprimePedido(Pedido);
     btnCancelar.Click;

  Except
    On E: Exception Do begin
      avisar('Erro ao finalizar pedido.'+#13#10+e.Message);
    end;
  end;

  finally
    FreeAndNil(repositorio);
    FreeAndNil(pedido);

    if cupomPendente then
    begin
      habilitaDesabilita('D');
      btnFinalizaPedido.Caption := '[ F6 ] Enviar Cupom';
    end;

    if assigned(frmRecebimentoPedido) then
    begin
      frmRecebimentoPedido.Release;
      frmRecebimentoPedido := nil;
    end;
  end;
end;

procedure TfrmPedidoConsumidorFinal.FormCreate(Sender: TObject);
begin
  FEstadoItem := teInserindo;
  cdsItens.CreateDataSet;
  Configuracoes       := TConfiguracoesNFCe.Create;
end;

procedure TfrmPedidoConsumidorFinal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
  begin
    verificaSair;
    key := 0;
  end
  else if key = VK_F4 then
    btnAlteraItem.Click
  else if key = VK_F6 then
    btnFinalizaPedido.Click;

  inherited;

end;

procedure TfrmPedidoConsumidorFinal.FormShow(Sender: TObject);
var codigoCliente, codFPagamento :String;
begin
  BuscaProduto1.codproduto := 'QUILO';
  BuscaProduto1.codTabela  := intToStr(tabelaPrecoProduto);
  BuscaProduto1.codproduto := 'QUILO';
  edtPrecoKg.Value         := BuscaProduto1.preco;
  BuscaPessoa1.TipoPessoa  := tpCliente;
  BuscaPedido1.pedidosLoja := true;

  codigoCliente := Campo_por_campo('PESSOAS','CODIGO','RAZAO','CONSUMIDOR');

  BuscaPessoa1.cod_pessoa  := IfThen(codigoCliente = '', '0', codigoCliente);

  codFPagamento := Campo_por_campo('FORMAS_PGTO','CODIGO','DESCRICAO','LOJA');

  BuscaFormaPagamento1.codFormaPagamento := IfThen(codFPagamento = '', '0', codFPagamento);
  habilitaDesabilita('D');
end;

function TfrmPedidoConsumidorFinal.geraCupomEletronico(codigoPedido :integer) :boolean;
var i                  :Integer;
    repositorio :TRepositorio;
    Venda              :TVenda;
    NFCe               :TServicoEmissorNFCe;
    Pedido             :TPedido;
begin
   repositorio    := nil;
   Venda          := nil;
   NFCe           := nil;
   Pedido := nil;
   result := false;

 try
 try
  // if assigned(frmFinalizaPedido) then
   //  Parametros.NFCe.DANFE.ImprimirItens := frmFinalizaPedido.chkImprimeItens.Checked;

   Venda               := TVenda.Create;
   NFCe                := TServicoEmissorNFCe.Create(Configuracoes);

   repositorio   := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);
   Pedido        := TPedido(repositorio.Get(codigoPedido));

   Venda.Data          := Pedido.dt_cadastro;
   Venda.Codigo_pedido := Pedido.codigo;
   Venda.NumeroNFe     := dm.GetValorGenerator('gen_nrnota_nfce',1);//StrToInt(Maior_Valor_Cadastrado('NFCE_RETORNO', 'CODIGO'))+1; // criar tab. de retorno da nf p/ poder pegar tb o cod. da nf
   Venda.Desconto      := Pedido.desconto;
   Venda.Cpf_cliente   := Pedido.Cliente.CPF_CNPJ;
   Venda.nome_cliente  := Pedido.Cliente.Razao;

   for i := 0 to Pedido.Itens.Count - 1 do begin

     Venda.AdicionarItem( (Pedido.Itens[i] as TItem).Produto.Codigo,
                          ((Pedido.Itens[i] as TItem).preco),
                          (Pedido.Itens[i] as TItem).qtd_total );
   end;

   NFCe.Emitir(Venda, dm.GetValorGenerator('gen_lote_nfce',1));

   result := true;

 Except
   On E: Exception do
     raise Exception.Create('Ocorreu um erro ao enviar nota fiscal.'+#13#10+e.Message);
 end;

 finally
   FreeAndNil(repositorio);
   FreeAndNil(Pedido);
  end;
end;

procedure TfrmPedidoConsumidorFinal.habilitaDesabilita(habilita_desabilita: String);
begin
  pnlValores.Enabled    := (habilita_desabilita = 'H');
  btnAlteraItem.Enabled := (habilita_desabilita = 'H');
  btnDeletaItem.Enabled := (habilita_desabilita = 'H');

  btnnovo.Enabled       := (habilita_desabilita = 'D') and not cupomPendente and not assigned(BuscaPedido1.Ped);
  BuscaPedido1.Enabled  := (habilita_desabilita = 'D') and not cupomPendente and not assigned(BuscaPedido1.Ped);
end;

procedure TfrmPedidoConsumidorFinal.imprimePedido(pedido :TPedido);
var Arq   :TextFile;
    i :integer;
    qtd, peso, valor :String;
    qtdTot, pesoTot, valorTot :Real;
begin
  rlPedido.Caption  := pedido.numpedido;

  RLReport1.PreviewModal;
end;

procedure TfrmPedidoConsumidorFinal.limpaCampos;
begin
//  BuscaProduto1.limpa;
  edtPeso.Clear;
  edtPecas.Clear;
 // edtPrecoKg.Clear;
  edtValorItem.Clear;
end;

procedure TfrmPedidoConsumidorFinal.limparDados;
begin
  cdsItens.EmptyDataSet;
  FTotalPedido := 0;
  edtTotalPedido.Clear;
  edtDesconto.Clear;
  edtCodigoPedido.Clear;
  cupomPendente := false;
  habilitaDesabilita('H');
  btnFinalizaPedido.Caption := '[ F6 ] Finalizar Pedido';
end;

function TfrmPedidoConsumidorFinal.tabelaPrecoProduto: integer;
begin
  result := StrToIntDef( Campo_por_campo('PRODUTO_TABELA_PRECO', 'CODTABELA', 'CODPRODUTO', BuscaProduto1.codproduto),0);
end;

function TfrmPedidoConsumidorFinal.verificaObrigatorios: Boolean;
begin
  result := false;

  if BuscaPessoa1.edtRazao.Text = '' then
  begin
    avisar('Favor informar o cliente.');
    BuscaPessoa1.edtCodigo.SetFocus;
  end
  else if BuscaFormaPagamento1.edtDescricao.Text = '' then
  begin
    avisar('Favor informar a forma de pagamento.');
    BuscaFormaPagamento1.edtCodigo.SetFocus;
  end
  else if cdsItens.IsEmpty then
  begin
    avisar('Ao menos 1 item deve ser adicionado ao pedido.');
    BuscaProduto1.edtReferencia.SetFocus;
  end
  else
    result := true;

end;

function TfrmPedidoConsumidorFinal.verificaObrigatoriosItem: Boolean;
begin
  result := false;

  if BuscaProduto1.edtDescricao.Text = '' then
  begin
    avisar('Favor selecionar o produto desejado.');
    BuscaProduto1.edtReferencia.SetFocus;
  end
  else if tabelaPrecoProduto = 0 then
  begin
    avisar('Inclus�o cancelada. N�o h� um pre�o cadastrado no produto selecionado.');
    BuscaProduto1.edtReferencia.SetFocus;
  end
  else if edtPeso.Value = 0 then
  begin
    avisar('Favor informar o peso.');
    edtPeso.SetFocus;
  end
  else if edtPecas.Value = 0 then
  begin
    avisar('Favor informar a quantidade de pe�as.');
    edtPecas.SetFocus;
  end
  else if edtPrecoKg.Value = 0 then
  begin
    avisar('Favor informar o pre�o do kg.');
    edtPrecoKg.SetFocus;
  end
  else
    result := true;


end;

procedure TfrmPedidoConsumidorFinal.verificaSair;
begin
  if not cdsItens.IsEmpty then
  begin
    if confirma('Ao sair da tela ir� cancelar o pedido em andamento. Confirma?') then
      self.Close;
  end
  else
    self.Close;
end;

end.
