unit uTransferenciaEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Vcl.ExtCtrls, frameBuscaCor, frameBuscaProduto,
  Vcl.Buttons, Grade, System.StrUtils;

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
    procedure BuscaProduto1edtDescricaoChange(Sender: TObject);
    procedure BuscaCor1edtDescricaoChange(Sender: TObject);
    procedure rgTamanhos1Click(Sender: TObject);
    procedure BuscaProduto2edtDescricaoChange(Sender: TObject);
    procedure BuscaCor2edtDescricaoChange(Sender: TObject);
    procedure rgTamanhos2Click(Sender: TObject);
    procedure edtQtdTransferirChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BuscaCor1Enter(Sender: TObject);
    procedure BuscaCor2Enter(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure BuscaCor1Exit(Sender: TObject);
    procedure BuscaProduto1Exit(Sender: TObject);
    procedure BuscaProduto2Exit(Sender: TObject);
  private
    FEstoqueOrigem :Real;
    FEstoqueDestino :Real;

    procedure mostraEstoqueOrigem;
    procedure mostraEstoqueDestino;
    procedure EfetuaTransferencia;
    procedure AlteraEstoque(codigo_produto, codigo_cor, codigo_tamanho, quantidade :integer);
    procedure habilitaTamanhos(radGroup :TRadioGroup; grade :TGrade);
  public
    { Public declarations }
  end;

var
  frmTransferenciaEstoque: TfrmTransferenciaEstoque;

implementation

uses repositorio, FabricaRepositorio, EspecificacaoEstoquePorProdutoCorTamanho, Estoque, Funcoes, Tamanho;

{$R *.dfm}

procedure TfrmTransferenciaEstoque.AlteraEstoque(codigo_produto, codigo_cor, codigo_tamanho, quantidade: integer);
var Estoque     :TEstoque;
    repositorio :TRepositorio;
    Especificacao :TEspecificacaoEstoquePorProdutoCorTamanho;
begin
  Estoque     := nil;
  repositorio := nil;

 try
   repositorio := TFabricaRepositorio.GetRepositorio(TEstoque.ClassName);
   Especificacao  := TEspecificacaoEstoquePorProdutoCorTamanho.Create(codigo_produto,
                                                                      codigo_cor,
                                                                      codigo_tamanho);

   Estoque     := TEstoque( repositorio.GetPorEspecificacao( Especificacao, intToStr(codigo_produto)) );

   if not assigned(Estoque) then
     Estoque := TEstoque.create(codigo_produto,
                                codigo_cor,
                                codigo_tamanho);

   Estoque.atualiza_estoque( quantidade );

   repositorio.Salvar( Estoque );

 finally
   if assigned(Estoque)     then  FreeAndNil(Estoque);
   if assigned(repositorio) then  FreeAndNil(repositorio);
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

procedure TfrmTransferenciaEstoque.btnSalvarClick(Sender: TObject);
begin
  if edtQtdTransferir.Value = 0 then
  begin
    avisar('Nenhuma quantidade foi informada');
    edtQtdTransferir.SetFocus;
    exit;
  end;

  if confirma('Confirma transferência?') then
    EfetuaTransferencia;
end;

procedure TfrmTransferenciaEstoque.BuscaCor1edtDescricaoChange(Sender: TObject);
begin
  if BuscaCor1.edtDescricao.Text <> '' then
  begin
    mostraEstoqueOrigem;
   // keybd_event(VK_TAB, 0, 0, 0);
  end;
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

end;

procedure TfrmTransferenciaEstoque.BuscaCor2edtDescricaoChange(Sender: TObject);
begin
  if BuscaCor1.edtDescricao.Text <> '' then
  begin
    mostraEstoqueDestino;
  //  keybd_event(VK_TAB, 0, 0, 0);
  end;
end;

procedure TfrmTransferenciaEstoque.BuscaCor2Enter(Sender: TObject);
begin
  BuscaCor2.FiltroProduto := BuscaProduto2.codproduto;
  BuscaCor2.ApareceKits   := IfThen(BuscaProduto2.Kit,'S','N');
end;

procedure TfrmTransferenciaEstoque.BuscaProduto1edtDescricaoChange(
  Sender: TObject);
begin
  if BuscaProduto1.edtDescricao.Text <> '' then
  begin
    mostraEstoqueOrigem;
  //  keybd_event(VK_TAB, 0, 0, 0);
  end;
end;

procedure TfrmTransferenciaEstoque.BuscaProduto1Exit(Sender: TObject);
begin
  inherited;
  BuscaProduto1.FrameExit(Sender);
  habilitaTamanhos(rgTamanhos1, BuscaProduto1.Prod.Grade);
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
begin
  {atualiza estoque origem}
  AlteraEstoque(StrToInt(BuscaProduto1.codproduto),
                StrToInt(BuscaCor1.codCor),
                StrToInt( Campo_por_campo('TAMANHOS', 'CODIGO', 'DESCRICAO', rgTamanhos1.Items[rgTamanhos1.itemIndex]) ),
                (edtQtdTransferir.AsInteger * -1));

  {atualiza estoque destino}
  AlteraEstoque(StrToInt(BuscaProduto2.codproduto),
                StrToInt(BuscaCor2.codCor),
                StrToInt( Campo_por_campo('TAMANHOS', 'CODIGO', 'DESCRICAO', rgTamanhos2.Items[rgTamanhos2.itemIndex]) ),
                edtQtdTransferir.AsInteger);

  Avisar('Transferência efetuada com sucesso!');
  btnLimpar.Click;
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
   Especificacao  := TEspecificacaoEstoquePorProdutoCorTamanho.Create(BuscaProduto1.CodigoProduto,
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
   Especificacao  := TEspecificacaoEstoquePorProdutoCorTamanho.Create(BuscaProduto2.CodigoProduto,
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
  mostraEstoqueOrigem;
  BuscaProduto2.edtReferencia.SetFocus;
end;

procedure TfrmTransferenciaEstoque.rgTamanhos2Click(Sender: TObject);
begin
  mostraEstoqueDestino;
end;

end.
