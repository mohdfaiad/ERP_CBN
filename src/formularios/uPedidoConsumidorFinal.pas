unit uPedidoConsumidorFinal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, DBGridCBN, Math,
  frameBuscaProduto, Datasnap.DBClient, Vcl.Mask, RxToolEdit, RxCurrEdit,
  frameBuscaFormaPagamento, frameBuscaPessoa, Printers, Pedido, RLReport,
  RLParser, System.StrUtils, Vcl.Imaging.pngimage, ConfiguracoesNFCe;

type
  TEstadoTela = (teInserindo, teAlterando);
type
  TfrmPedidoConsumidorFinal = class(TFrmPadrao)
    BuscaProduto1: TBuscaProduto;
    pnlBotoes: TPanel;
    btnVoltar: TBitBtn;
    btnAlteraItem: TBitBtn;
    btnDeletaItem: TBitBtn;
    btnFinalizaPedido: TBitBtn;
    BitBtn5: TBitBtn;
    edtValorItem: TCurrencyEdit;
    edtTotalPedido: TCurrencyEdit;
    edtPrecoKg: TCurrencyEdit;
    edtPecas: TCurrencyEdit;
    edtPeso: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
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
    edtNumPedido: TEdit;
    Label6: TLabel;
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
    Label7: TLabel;
    edtDesconto: TCurrencyEdit;
    gridItens: TDBGrid;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlteraItemClick(Sender: TObject);
    procedure edtPrecoKgChange(Sender: TObject);
    procedure btnDeletaItemClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnFinalizaPedidoClick(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
  private
    FEstadoTela           :TEstadoTela;
    FTotalPedido          :Real;
    Configuracoes         :TConfiguracoesNFCe;

    procedure adicionaItem;
    procedure limpaCampos;
    procedure carregaItem;
    procedure cancelaItem;
    procedure verificaSair;
    procedure finalizaPedido(const cc :Boolean = false);
    procedure imprimePedido(pedido :TPedido);
    procedure limparDados;
    function tabelaPrecoProduto :integer;
    function buscaCorProduto :integer;
    function verificaObrigatorios :Boolean;
    function verificaObrigatoriosItem :Boolean;

    procedure atualizaEstoque(pedido :TPedido);
    procedure geraCupomEletronico(codigoPedido :integer);

  public
    { Public declarations }
  end;

var
  frmPedidoConsumidorFinal: TfrmPedidoConsumidorFinal;

const
  ACIONA_GUILHOTINA = #27 + #109;

implementation

uses Repositorio, FabricaRepositorio, Item, TipoPessoa, Funcoes, Estoque,
  uModulo, EspecificacaoEstoquePorProdutoCorTamanho, ServicoEmissorNFCe, Venda;

{$R *.dfm}

procedure TfrmPedidoConsumidorFinal.adicionaItem;
begin
  if FEstadoTela = teInserindo then
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
  verificaSair;
end;

function TfrmPedidoConsumidorFinal.buscaCorProduto: integer;
begin
   result := StrToIntDef( Campo_por_campo('PRODUTO_CORES', 'CODCOR', 'CODPRODUTO', BuscaProduto1.codproduto),0);
end;

procedure TfrmPedidoConsumidorFinal.btnAlteraItemClick(Sender: TObject);
begin
  if cdsItens.IsEmpty then
    exit;

  FEstadoTela := teAlterando;
  carregaItem;
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
   finalizaPedido(true);
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
end;

procedure TfrmPedidoConsumidorFinal.BitBtn5Click(Sender: TObject);
begin
  if verificaObrigatoriosItem then
    adicionaItem;
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

procedure TfrmPedidoConsumidorFinal.finalizaPedido(const cc :Boolean = false);
var repositorio :TRepositorio;
    pedido      :TPedido;
    item        :TItem;
begin
  if not verificaObrigatorios then
    Exit;

  repositorio := nil;
  pedido      := nil;
  try
  try
     repositorio := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);
     pedido      := TPedido.Create;

     pedido.numpedido     := 'L'+ IntToStr(dm.GetValorGenerator('GEN_PEDIDOS_LOJA_ID', 1));
     pedido.cod_tab_preco := tabelaPrecoProduto;
     pedido.cod_forma_pag := StrToIntDef(BuscaFormaPagamento1.codFormaPagamento ,0);
     pedido.cod_filial    := 3;
     pedido.cod_cliente   := StrToIntDef(BuscaPessoa1.cod_pessoa ,0);
     pedido.cod_repres    := StrToIntDef( Campo_por_campo('PESSOAS','CODIGO','RAZAO','LOJA') ,0);

     if pedido.cod_repres = 0 then
       raise Exception.Create('Representante "LOJA" não encontrado');

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
     while not cdsItens.Eof do begin

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
     end;

     Pedido.salvar;

     atualizaEstoque(Pedido);

     avisar('Pedido salvo com sucesso!');
     imprimePedido(Pedido);

     if cc then
       geraCupomEletronico(Pedido.Codigo);

     limparDados;

  Except
    On E: Exception Do begin
      avisar('Erro ao salvar pedido.'+#13#10+e.Message);
    end;
  end;

  finally
    FreeAndNil(repositorio);
    FreeAndNil(pedido);
  end;
end;

procedure TfrmPedidoConsumidorFinal.FormCreate(Sender: TObject);
begin
  FEstadoTela := teInserindo;
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
    btnFinalizaPedido.Click
  else if key = VK_F10 then
    finalizaPedido(false);

  inherited;

end;

procedure TfrmPedidoConsumidorFinal.FormShow(Sender: TObject);
var codigoCliente :String;
begin
  limpaCampos;
  BuscaProduto1.codproduto := 'QUILO';
  BuscaProduto1.codTabela  := intToStr(tabelaPrecoProduto);
  BuscaProduto1.codproduto := 'QUILO';
  edtPrecoKg.Value         := BuscaProduto1.preco;
  BuscaPessoa1.TipoPessoa  := tpCliente;

  codigoCliente := Campo_por_campo('PESSOAS','CODIGO','RAZAO','CONSUMIDOR');

  BuscaPessoa1.cod_pessoa  := IfThen(codigoCliente = '', '0', codigoCliente);

end;

procedure TfrmPedidoConsumidorFinal.geraCupomEletronico(codigoPedido :integer);
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

 Except
   On E: Exception do
   begin
     dm.GetValorGenerator('gen_nrnota_nfce',-1);
     dm.GetValorGenerator('gen_lote_nfce',-1);
     raise Exception.Create('Ocorreu um erro ao enviar nota fiscal.'+#13#10+e.Message);
   end;
 end;

 finally
   FreeAndNil(repositorio);
   FreeAndNil(Pedido);
  end;
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
  edtNumPedido.Text        := 'L'+ IntToStr(dm.GetValorGenerator('GEN_PEDIDOS_LOJA_ID') + 1);
end;

procedure TfrmPedidoConsumidorFinal.limparDados;
begin
  BuscaFormaPagamento1.limpa;
  cdsItens.EmptyDataSet;
  FTotalPedido := 0;
  edtTotalPedido.Clear;
  edtDesconto.Clear;
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
    avisar('Inclusão cancelada. Não há um preço cadastrado no produto selecionado.');
    BuscaProduto1.edtReferencia.SetFocus;
  end
  else if edtPeso.Value = 0 then
  begin
    avisar('Favor informar o peso.');
    edtPeso.SetFocus;
  end
  else if edtPecas.Value = 0 then
  begin
    avisar('Favor informar a quantidade de peças.');
    edtPecas.SetFocus;
  end
  else if edtPrecoKg.Value = 0 then
  begin
    avisar('Favor informar o preço do kg.');
    edtPrecoKg.SetFocus;
  end
  else
    result := true;


end;

procedure TfrmPedidoConsumidorFinal.verificaSair;
begin
  if not cdsItens.IsEmpty then
  begin
    if confirma('Ao sair da tela irá cancelar o pedido em andamento. Confirma?') then
      self.Close;
  end
  else
    self.Close;
end;

end.
