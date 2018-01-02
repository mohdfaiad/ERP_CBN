unit uTransferenciaEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Vcl.ExtCtrls, frameBuscaCor, frameBuscaProduto,
  Vcl.Buttons, Grade, System.StrUtils, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ConfiguracoesECommerce;

type
  TfrmTransferenciaEstoque = class(TfrmPadrao)
    BuscaProduto1: TBuscaProduto;
    BuscaCor1: TBuscaCor;
    rgTamanhos1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    BuscaProduto2: TBuscaProduto;
    BuscaCor2: TBuscaCor;
    rgTamanhos2: TRadioGroup;
    Label4: TLabel;
    Shape2: TShape;
    edtEstoqueDestino: TCurrencyEdit;
    edtEstoqueOrigem: TCurrencyEdit;
    Label3: TLabel;
    edtQtdTransferir: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    pnlRodape: TPanel;
    btnSalvar: TBitBtn;
    btnLimpar: TBitBtn;
    edtCodEstoque1: TCurrencyEdit;
    edtCodEstoque2: TCurrencyEdit;
    cbxSetorOrigem: TComboBox;
    Label8: TLabel;
    cbxSetorDestino: TComboBox;
    Label9: TLabel;
    rgpOpcaoTransferencia: TRadioGroup;
    procedure BuscaProduto1edtDescricaoChange(Sender: TObject);
    procedure rgTamanhos1Click(Sender: TObject);
    procedure BuscaProduto2edtDescricaoChange(Sender: TObject);
    procedure rgTamanhos2Click(Sender: TObject);
    procedure edtQtdTransferirChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BuscaCor1Enter(Sender: TObject);
    procedure BuscaCor2Enter(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure BuscaCor1Exit(Sender: TObject);
    procedure BuscaProduto1Exit(Sender: TObject);
    procedure BuscaProduto2Exit(Sender: TObject);
    procedure rgpOpcaoTransferenciaClick(Sender: TObject);
    procedure BuscaCor2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FConfiguracoes :TConfiguracoesECommerce;
    FEstoqueOrigem :Real;
    FEstoqueDestino :Real;

    procedure mostraEstoqueOrigem;
    procedure mostraEstoqueDestino;
    procedure EfetuaTransferencia;
    procedure lancaEntradaSaida(codproduto, codcor, codtamanho, quantidade, setor, codtransferencia :integer; ent_sai :String);
    procedure AlteraEstoque(codigo_produto, codigo_cor, codigo_tamanho, quantidade, setor :integer; sku :String);
    procedure habilitaTamanhos(radGroup :TRadioGroup; grade :TGrade);

    procedure atualizaEstoquePlataforma(sku: String; quantidade :integer);
    function getQuantidadeAtual(sku: String): integer;
    function getJsonProduto(sku: String): String;
  public
    { Public declarations }
  end;

var
  frmTransferenciaEstoque: TfrmTransferenciaEstoque;

implementation

uses repositorio, FabricaRepositorio, EspecificacaoEstoquePorProdutoCorTamanho, Estoque, Funcoes, Tamanho,
     uModulo, REST.types, System.JSon, IdSSLOpenSSL, EntradaSaida, StringUtilitario, HTTPJSON;

{$R *.dfm}

procedure TfrmTransferenciaEstoque.AlteraEstoque(codigo_produto, codigo_cor, codigo_tamanho, quantidade, setor: integer; sku:String);
var Estoque     :TEstoque;
    repositorio :TRepositorio;
    Especificacao :TEspecificacaoEstoquePorProdutoCorTamanho;
begin
  Estoque     := nil;
  repositorio := nil;
 try
 try
   repositorio := TFabricaRepositorio.GetRepositorio(TEstoque.ClassName);
   Especificacao  := TEspecificacaoEstoquePorProdutoCorTamanho.Create(setor,
                                                                      codigo_produto,
                                                                      codigo_cor,
                                                                      codigo_tamanho);

   Estoque     := TEstoque( repositorio.GetPorEspecificacao( Especificacao, intToStr(codigo_produto)) );

   if not assigned(Estoque) then
     Estoque := TEstoque.create(setor,
                                codigo_produto,
                                codigo_cor,
                                codigo_tamanho);

   Estoque.atualiza_estoque( quantidade );
   repositorio.Salvar( Estoque );

  // atualiza plataforma apenas se movimentar estoque do e-commerce
   if setor = 2 then
     atualizaEstoquePlataforma(sku, quantidade);

 except
   on e :Exception do
     raise Exception.Create(e.message);
 end;
 finally
   if assigned(Estoque)     then  FreeAndNil(Estoque);
   if assigned(repositorio) then  FreeAndNil(repositorio);
 end;
end;

function TfrmTransferenciaEstoque.getQuantidadeAtual(sku: String): integer;
var
  Objeto :TJSONObject;
  Item   :TJSONObject;
  Par :TJSONPair;
  Enumerado :TJSONPairEnumerator;
  i :integer;
begin
  Objeto := TJSONObject.ParseJSONValue(getJsonProduto(sku)) as TJSONObject;
  result := StrToIntDef(Objeto.GetValue('estoque').Value,0);
end;

function TfrmTransferenciaEstoque.getJsonProduto(sku: String): String;
var
    Retorno :String;
    vHTTPJSON: THTTPJSON;
begin
try
  vHTTPJSON := THTTPJSON.Create(dm.configuracoesECommerce.token, dm.configuracoesECommerce.url_base);
  Retorno := vHTTPJSON.Get('produto/'+sku);
  result  := Retorno;
finally
  FreeAndNil(vHTTPJSON);
end;
end;

procedure TfrmTransferenciaEstoque.btnLimparClick(Sender: TObject);
begin
  inherited;
  BuscaProduto1.limpa;
  BuscaCor1.limpa;
  rgTamanhos1.ItemIndex := -1;
  BuscaProduto2.limpa;
  BuscaCor2.limpa;
  rgTamanhos2.ItemIndex := -1;
  edtQtdTransferir.Clear;
  edtEstoqueOrigem.Clear;
  edtEstoqueDestino.Clear;
end;

procedure TfrmTransferenciaEstoque.atualizaEstoquePlataforma(sku: String; quantidade :integer);
var
    Retorno, lJSO :String;
    Parametros :TStrings;
    jsonToSend : TStringStream;
    quantidadeAtualizada :Integer;
    vHTTPJSON :THTTPJSON;
begin
   sku := TStringUtilitario.RemoveCaracteresEspeciais(sku);
   quantidadeAtualizada := getQuantidadeAtual(sku);
   quantidadeAtualizada := quantidadeAtualizada + quantidade;
  try
    vHTTPJSON := THTTPJSON.Create(dm.configuracoesECommerce.token, dm.configuracoesECommerce.url_base);
  try
    lJSO := ('{"sku": "'+sku+'", "estoque": '+intToStr(quantidadeAtualizada)+'}');
    jsonToSend := TStringStream.Create(lJSO,TEncoding.UTF8);

    Retorno := vHTTPJSON.POST(lJSO);
  Except
   on e:Exception do
     raise Exception.Create('Erro ao atualizar estoque na plataforma: '+e.Message);
  end;
  Finally
    FreeAndNil(vHTTPJSON);
  end;
end;

procedure TfrmTransferenciaEstoque.btnSalvarClick(Sender: TObject);
begin
  if (rgpOpcaoTransferencia.ItemIndex = 0) and
     (BuscaProduto1.codproduto = BuscaProduto2.codproduto) and
     (BuscaCor1.codCor = BuscaCor2.codCor) and
     (rgTamanhos1.ItemIndex = rgTamanhos2.ItemIndex) then
  begin
    avisar('Atenção! Uma transferência não pode ser efetuada entre uma mesma peça do mesmo setor.');
    rgTamanhos2.ItemIndex := -1;
    exit;
  end;

  if edtEstoqueOrigem.Value = 0 then
  begin
    avisar('Não existe estoque de origem a ser transferido');
    exit;
  end;

  if edtQtdTransferir.Value = 0 then
  begin
    avisar('Nenhuma quantidade foi informada');
    edtQtdTransferir.SetFocus;
    exit;
  end;

  if not assigned(FConfiguracoes) and ((cbxSetorOrigem.ItemIndex = 1)or(cbxSetorDestino.ItemIndex = 1)) then
  begin
    avisar('Antes de movimentar o estoque do e-commerce efetue o cadastro das configurações do mesmo');
    exit;
  end;

  if confirma('Confirma transferência?') then
    EfetuaTransferencia;
end;

procedure TfrmTransferenciaEstoque.BuscaCor1Enter(Sender: TObject);
begin
  BuscaCor1.FiltroProduto := BuscaProduto1.codproduto;
  BuscaCor1.ApareceKits   := IfThen(BuscaProduto1.Kit,'S','N');
end;

procedure TfrmTransferenciaEstoque.BuscaCor1Exit(Sender: TObject);
begin
  inherited;
  BuscaCor1.FrameExit(Sender);

  if (BuscaCor1.edtDescricao.Text <> '') then
  begin
    mostraEstoqueOrigem;
    if (rgpOpcaoTransferencia.ItemIndex <> 0) then
      BuscaCor2.codCor := BuscaCor1.edtReferencia.Text;
  end;
end;

procedure TfrmTransferenciaEstoque.BuscaCor2Enter(Sender: TObject);
begin
  BuscaCor2.FiltroProduto := BuscaProduto2.codproduto;
  BuscaCor2.ApareceKits   := IfThen(BuscaProduto2.Kit,'S','N');
end;

procedure TfrmTransferenciaEstoque.BuscaCor2Exit(Sender: TObject);
begin
  inherited;
  if BuscaCor2.edtDescricao.Text <> '' then
    mostraEstoqueDestino;
end;

procedure TfrmTransferenciaEstoque.BuscaProduto1edtDescricaoChange(
  Sender: TObject);
begin
  if BuscaProduto1.edtDescricao.Text <> '' then
    mostraEstoqueOrigem;
end;

procedure TfrmTransferenciaEstoque.BuscaProduto1Exit(Sender: TObject);
begin
  inherited;
  BuscaProduto1.FrameExit(Sender);
  if assigned(BuscaProduto1.Prod) then
  begin
    habilitaTamanhos(rgTamanhos1, BuscaProduto1.Prod.Grade);
    if rgpOpcaoTransferencia.ItemIndex <> 0 then
      BuscaProduto2.codproduto := BuscaProduto1.edtReferencia.Text;
  end;
end;

procedure TfrmTransferenciaEstoque.BuscaProduto2edtDescricaoChange(
  Sender: TObject);
begin
  if BuscaProduto1.edtDescricao.Text <> '' then
  begin
    mostraEstoqueDestino;
    //keybd_event(VK_TAB, 0, 0, 0);
  end;
end;

procedure TfrmTransferenciaEstoque.BuscaProduto2Exit(Sender: TObject);
begin
  inherited;
  BuscaProduto2.FrameExit(Sender);
  if assigned(BuscaProduto2.Prod) then
    habilitaTamanhos(rgTamanhos2, BuscaProduto2.Prod.Grade);
end;

procedure TfrmTransferenciaEstoque.edtQtdTransferirChange(Sender: TObject);
begin
  if edtQtdTransferir.Value > FEstoqueOrigem then
    edtQtdTransferir.Value := FEstoqueOrigem;

  edtEstoqueOrigem.Value := FEstoqueOrigem - edtQtdTransferir.Value;
  edtEstoqueDestino.Value := FEstoqueDestino + edtQtdTransferir.Value;
end;

procedure TfrmTransferenciaEstoque.EfetuaTransferencia;
var sku1, sku2 :String;
    codigo_tamanho, codigo_transferencia :integer;
begin
  sku1 := BuscaProduto1.Prod.Referencia + rgTamanhos1.Items[rgTamanhos1.ItemIndex] + BuscaCor1.edtReferencia.Text;

  try
  try
    dm.conexao.TxOptions.AutoCommit := false;
    codigo_tamanho := StrToInt(Campo_por_campo('TAMANHOS', 'CODIGO', 'DESCRICAO', rgTamanhos1.Items[rgTamanhos1.itemIndex]));
    {atualiza estoque origem}
    AlteraEstoque(StrToInt(BuscaProduto1.codproduto),
                  StrToInt(BuscaCor1.codCor),
                  codigo_tamanho,
                  (edtQtdTransferir.AsInteger * -1),
                  cbxSetorOrigem.ItemIndex+1,
                  sku1);

    codigo_transferencia := dm.GetValorGenerator('GEN_TRANSFERENCIA',1);
    lancaEntradaSaida(StrToInt(BuscaProduto2.codproduto),
                      StrToInt(BuscaCor2.codCor),
                      codigo_tamanho,
                      edtQtdTransferir.AsInteger,
                      cbxSetorDestino.ItemIndex+1,
                      codigo_transferencia,
                      'S');

    sku2 := BuscaProduto1.Prod.Referencia + rgTamanhos1.Items[rgTamanhos1.ItemIndex] + BuscaCor1.edtReferencia.Text;

    codigo_tamanho := StrToInt(Campo_por_campo('TAMANHOS', 'CODIGO', 'DESCRICAO', rgTamanhos2.Items[rgTamanhos2.itemIndex]));
    {atualiza estoque destino}
    AlteraEstoque(StrToInt(BuscaProduto2.codproduto),
                  StrToInt(BuscaCor2.codCor),
                  codigo_tamanho,
                  edtQtdTransferir.AsInteger,
                  cbxSetorDestino.ItemIndex+1,
                  sku2);

    lancaEntradaSaida(StrToInt(BuscaProduto2.codproduto),
                      StrToInt(BuscaCor2.codCor),
                      codigo_tamanho,
                      edtQtdTransferir.AsInteger,
                      cbxSetorDestino.ItemIndex+1,
                      codigo_transferencia,
                      'E');

    Avisar('Transferência efetuada com sucesso!');
    btnLimpar.Click;
    dm.conexao.Commit;
  except
   on e: Exception do
   begin
     dm.conexao.Rollback;
     avisar(e.message+#13#10+'Operação cancelada.');
   end;
  end;
  finally
    dm.conexao.TxOptions.AutoCommit := true;
  end;
end;

procedure TfrmTransferenciaEstoque.FormCreate(Sender: TObject);
var
    repositorio :TRepositorio;
begin
  try
    repositorio    := TFabricaRepositorio.GetRepositorio(TConfiguracoesECommerce.ClassName);
    FConfiguracoes := TConfiguracoesECommerce(repositorio.Get(1));

    if not assigned(FConfiguracoes) then
    begin
      avisar('Atenção! Não será possível realizar o movimento de estoque envolvendo o setor de e-commerce, '+
             'enquanto o cadastro das configurações de e-commerce não for efetuado');
    end;
  finally
    FreeAndNil(repositorio);
  end;
end;

procedure TfrmTransferenciaEstoque.FormDestroy(Sender: TObject);
begin
  if Assigned(self.FConfiguracoes) then
    FreeAndNil(FConfiguracoes);
  inherited;
end;

procedure TfrmTransferenciaEstoque.habilitaTamanhos(radGroup: TRadioGroup; grade: TGrade);
var i, j :integer;
begin
  for i := 0 to radGroup.Items.Count -1 do
    for j := 0 to grade.Tamanhos.Count - 1 do
    begin
      TCustomRadioGroup(radGroup.Components[i]).Enabled := TTamanho(grade.Tamanhos.Items[j]).Descricao = radGroup.Items[i];
      if TCustomRadioGroup(radGroup.Components[i]).Enabled then
        break;
    end;
end;

procedure TfrmTransferenciaEstoque.lancaEntradaSaida(codproduto, codcor, codtamanho, quantidade, setor, codtransferencia :integer; ent_sai :String);
var EntradaSaida :TEntradaSaida;
    repositorio  :TRepositorio;
begin
 try
   EntradaSaida := TEntradaSaida.Create;
   repositorio := TFabricaRepositorio.GetRepositorio(TEntradaSaida.ClassName);

   EntradaSaida.codigo_produto   := codproduto;
   EntradaSaida.codigo_cor       := codcor;
   EntradaSaida.codigo_tamanho   := codtamanho;
   EntradaSaida.data_lancamento  := Date;
   EntradaSaida.lote             := -1;

   EntradaSaida.quantidade       := quantidade;
   EntradaSaida.tipo             := ent_sai;
   EntradaSaida.setor            := setor;
   EntradaSaida.codigo_transferencia := codtransferencia;

   repositorio.Salvar(EntradaSaida);
 Finally
   FreeAndNil(repositorio);
   FreeAndNil(EntradaSaida);
 end;
end;

procedure TfrmTransferenciaEstoque.mostraEstoqueOrigem;
var Estoque     :TEstoque;
    repositorio :TRepositorio;
    Especificacao :TEspecificacaoEstoquePorProdutoCorTamanho;
    codigo_tamanho :integer;
begin
  if (BuscaProduto1.edtDescricao.Text = '') or (BuscaCor1.edtDescricao.Text = '') or (rgTamanhos1.ItemIndex < 0) then
    exit;

 try
   Estoque        := nil;
   codigo_tamanho := strToInt( Campo_por_campo('TAMANHOS', 'CODIGO', 'DESCRICAO', rgTamanhos1.Items[rgTamanhos1.itemIndex]) );

   repositorio    := TFabricaRepositorio.GetRepositorio(TEstoque.ClassName);
   Especificacao  := TEspecificacaoEstoquePorProdutoCorTamanho.Create(cbxSetorOrigem.ItemIndex+1,
                                                                      BuscaProduto1.CodigoProduto,
                                                                      BuscaCor1.CodigoCor,
                                                                      codigo_tamanho);

   Estoque     := TEstoque( repositorio.GetPorEspecificacao( Especificacao, BuscaProduto1.codproduto) );

   if assigned(Estoque) then begin
     FEstoqueOrigem              := Estoque.quantidade;
     edtEstoqueOrigem.Value      := Estoque.quantidade;
     edtCodEstoque1.AsInteger    := Estoque.codigo;
   end
   else begin
     edtEstoqueOrigem.Value      := 0;
     edtCodEstoque1.AsInteger := 0;
   end;

 finally
   edtQtdTransferir.Clear;
   if assigned(Estoque) then
     FreeAndNil( Estoque );
 end;
end;

procedure TfrmTransferenciaEstoque.rgpOpcaoTransferenciaClick(Sender: TObject);
begin
   if rgpOpcaoTransferencia.ItemIndex = 0 then
   begin
     cbxSetorOrigem.ItemIndex  := 0;
     cbxSetorDestino.ItemIndex := 0;
   end
   else if rgpOpcaoTransferencia.ItemIndex = 1 then
   begin
     cbxSetorOrigem.ItemIndex  := 0;
     cbxSetorDestino.ItemIndex := 1;
   end
   else if rgpOpcaoTransferencia.ItemIndex = 2 then
   begin
     cbxSetorOrigem.ItemIndex  := 1;
     cbxSetorDestino.ItemIndex := 0;
   end;

   BuscaProduto2.Enabled := rgpOpcaoTransferencia.ItemIndex = 0;
   BuscaCor2.Enabled     := rgpOpcaoTransferencia.ItemIndex = 0;
   rgTamanhos2.Enabled   := rgpOpcaoTransferencia.ItemIndex = 0;

   btnLimpar.Click;
end;

procedure TfrmTransferenciaEstoque.mostraEstoqueDestino;
var Estoque     :TEstoque;
    repositorio :TRepositorio;
    Especificacao :TEspecificacaoEstoquePorProdutoCorTamanho;
    codigo_tamanho :integer;
begin
  if (BuscaProduto2.edtDescricao.Text = '') or (BuscaCor2.edtDescricao.Text = '') or (rgTamanhos2.ItemIndex < 0) then
    exit;

 try
   Estoque        := nil;
   codigo_tamanho := strToInt( Campo_por_campo('TAMANHOS', 'CODIGO', 'DESCRICAO', rgTamanhos2.Items[rgTamanhos2.itemIndex]) );

   repositorio    := TFabricaRepositorio.GetRepositorio(TEstoque.ClassName);
   Especificacao  := TEspecificacaoEstoquePorProdutoCorTamanho.Create(cbxSetorDestino.ItemIndex+1,
                                                                      BuscaProduto2.CodigoProduto,
                                                                      BuscaCor2.CodigoCor,
                                                                      codigo_tamanho);

   Estoque     := TEstoque( repositorio.GetPorEspecificacao( Especificacao, BuscaProduto2.codproduto) );

   if assigned(Estoque) then begin
     FEstoqueDestino              := Estoque.quantidade;
     edtEstoqueDestino.Value      := Estoque.quantidade;
     edtCodEstoque2.AsInteger    := Estoque.codigo;
   end
   else begin
     edtEstoqueDestino.Value      := 0;
     edtCodEstoque2.AsInteger := 0;
   end;

 finally
   edtQtdTransferir.Clear;
   edtQtdTransferir.SetFocus;

   if assigned(Estoque) then
     FreeAndNil( Estoque );
 end;
end;

procedure TfrmTransferenciaEstoque.rgTamanhos1Click(Sender: TObject);
begin
  if (rgpOpcaoTransferencia.ItemIndex = 0) and
     (BuscaProduto1.codproduto = BuscaProduto2.codproduto) and
     (BuscaCor1.codCor = BuscaCor2.codCor) and
     (rgTamanhos1.ItemIndex = rgTamanhos2.ItemIndex) then
  begin
    avisar('Atenção! Uma transferência não pode ser efetuada entre uma mesma peça do mesmo setor.');
    rgTamanhos2.ItemIndex := -1;
  end;

  mostraEstoqueOrigem;
  if BuscaProduto2.Enabled then
    BuscaProduto2.edtReferencia.SetFocus;

  if rgpOpcaoTransferencia.ItemIndex <> 0 then
    rgTamanhos2.ItemIndex := rgTamanhos1.ItemIndex;
end;

procedure TfrmTransferenciaEstoque.rgTamanhos2Click(Sender: TObject);
begin
  if (rgpOpcaoTransferencia.ItemIndex = 0) and
     (BuscaProduto1.codproduto = BuscaProduto2.codproduto) and
     (BuscaCor1.codCor = BuscaCor2.codCor) and
     (rgTamanhos1.ItemIndex = rgTamanhos2.ItemIndex) then
  begin
    avisar('Atenção! Uma transferência não pode ser efetuada entre uma mesma peça do mesmo setor.');
    rgTamanhos2.ItemIndex := -1;
  end;
  mostraEstoqueDestino;
end;

end.
