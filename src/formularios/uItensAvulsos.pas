unit uItensAvulsos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, DBGridCBN, Buttons, Grids, DBGrids, Mask,
  RxToolEdit, RxCurrEdit, frameBuscaCor, frameBuscaProduto, NotaFiscal, DB,
  DBClient, Contnrs, Grade, ItemAvulso, Tamanho, frameBuscaTabelaPreco;

type
  TfrmItensAvulsos = class(TfrmPadrao)
    gbDadosItem: TGroupBox;
    lblPreco: TStaticText;
    BuscaProduto: TBuscaProduto;
    BuscaCor: TBuscaCor;
    edtPreco: TCurrencyEdit;
    lblPercentualDesconto: TStaticText;
    edtPercDesconto: TCurrencyEdit;
    edtDesconto: TCurrencyEdit;
    lblValorDesconto: TStaticText;
    lblValorItem: TStaticText;
    edtValorItens: TCurrencyEdit;
    gbItensAdicionados: TGroupBox;
    gridItens: TDBGridCBN;
    gbQuantidades: TGroupBox;
    gridQuantidades: TDBGrid;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    cdsItensCODIGO: TIntegerField;
    cdsItensProduto: TStringField;
    cdsItensCodPro: TIntegerField;
    cdsItensCor: TStringField;
    cdsItensCodCor: TIntegerField;
    cdsItensRefCor: TStringField;
    cdsItensValorUnit: TFloatField;
    cdsItensValorTotalItem: TFloatField;
    cdsItensDesconto: TFloatField;
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
    cdsItensTamUnica: TIntegerField;
    cdsItensTOTAL: TIntegerField;
    cds: TClientDataSet;
    ds: TDataSource;
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
    cdsTamUNICA: TIntegerField;
    cdsTOTAL: TIntegerField;
    BuscaTabelaPreco: TBuscaTabelaPreco;
    btnAdicionar: TBitBtn;
    btnConfirmar: TSpeedButton;
    procedure gridQuantidadesColExit(Sender: TObject);
    procedure gridQuantidadesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gridQuantidadesEnter(Sender: TObject);
    procedure gridQuantidadesKeyPress(Sender: TObject; var Key: Char);
    procedure BuscaProdutoExit(Sender: TObject);
    procedure edtPercDescontoChange(Sender: TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure BuscaCorExit(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure BuscaProdutoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    FNotaFiscal           :TNotaFiscal;
    FItemAvulsoTemporario :TItemAvulso;

  private
    procedure AdicionarItensAvulsosNoGrid(ItensAvulsos :TObjectList);
    procedure AtualizarValores           (QuantidadeTotal :Real; ValorDesconto :Real; ValorTotal :Real);
    procedure IniciarGridTamanhos        ();
    procedure LiberarTamanhos            (Grade :TGrade);
    procedure LimparTela                 ();
    procedure SomarQuantidadeAoTotal     (Tamanho :TTamanho; Quantidade :Integer);

  public
    constructor Create(NotaFiscal :TNotaFiscal);
end;

var
  frmItensAvulsos: TfrmItensAvulsos;

implementation

uses
  ExcecaoParametroInvalido,
  Cor,
  QuantidadeItemAvulso,
  FabricaRepositorio,
  Repositorio,
  Produto,
  Especificacao,
  EspecificacaoTamanhoPorDescricao,
  StringUtilitario,
  EspecificacaoClientePorCodigoPessoa,
  Cliente;

{$R *.dfm}

{ TfrmItensAvulsos }

procedure TfrmItensAvulsos.AdicionarItensAvulsosNoGrid(
  ItensAvulsos: TObjectList);
var
  nX, nY     :Integer;
  ItemAvulso :TItemAvulso;
begin
   if self.cdsItens.Active then
    self.cdsItens.Close();
    
   self.cdsItens.CreateDataSet;

   for nX := 0 to (ItensAvulsos.Count-1) do begin
     ItemAvulso := (ItensAvulsos[nX] as TItemAvulso);

     self.cdsItens.Append;
     self.cdsItensProduto.AsString := ItemAvulso.Produto.Descricao;
     self.cdsItensRefCor.AsString  := ItemAvulso.Produto.Referencia;
     self.cdsItensCor.AsString     := ItemAvulso.Cor.Descricao;

     for nY := 0 to (ItemAvulso.Quantidades.Count-1) do
       self.cdsItens.FieldByName('TAM'+TQuantidadeItemAvulso(ItemAvulso.Quantidades[nY]).Tamanho.Descricao).AsInteger := TQuantidadeItemAvulso(ItemAvulso.Quantidades[nY]).Quantidade;

     self.cdsItensTOTAL.AsFloat           := ItemAvulso.QuantidadeTotal;
     self.cdsItensDesconto.AsFloat        := ItemAvulso.ValorDesconto;
     self.cdsItensValorUnit.AsFloat       := ItemAvulso.Preco;
     self.cdsItensValorTotalItem.AsFloat  := ItemAvulso.ValorTotal;

     self.cdsItens.Post;
   end;
end;

constructor TfrmItensAvulsos.Create(NotaFiscal: TNotaFiscal);
var
  EspecificacaoClientePorCodigoPessoa :TEspecificacao;
  RepositorioCliente                  :TRepositorio;
  Cliente                             :TCliente;
begin
   if not Assigned(NotaFiscal) then
    raise TExcecaoParametroInvalido.Create('TfrmItensAvulsos', 'Create(NotaFiscal: TNotaFiscal);', 'NotaFiscal');

   inherited Create(nil);

   inherited FecharComEsc     := false;
   self.FNotaFiscal           := NotaFiscal;
   self.FItemAvulsoTemporario := nil;

   EspecificacaoClientePorCodigoPessoa := TEspecificacaoClientePorCodigoPessoa.Create(self.FNotaFiscal.Destinatario.Codigo);
   RepositorioCliente                  := TFabricaRepositorio.GetRepositorio(TCliente.ClassName);

   try
     Cliente := (RepositorioCliente.GetPorEspecificacao(EspecificacaoClientePorCodigoPessoa) as TCliente);

     if Assigned(Cliente) then begin
       self.BuscaTabelaPreco.codTabela           := IntToStr(Cliente.TabelaPreco.Codigo);
       self.BuscaTabelaPreco.edtCodigo.AsInteger := Cliente.TabelaPreco.Codigo;
       self.BuscaTabelaPreco.edtDescricao.Text   := Cliente.TabelaPreco.Descricao;
     end;
   finally
     FreeAndNil(EspecificacaoClientePorCodigoPessoa);
     FreeAndNil(RepositorioCliente);
     FreeAndNil(Cliente);
   end;

   // Se a nota fiscal já ter itens avulsos então eles são adicionados no grid
   if Assigned(self.FNotaFiscal.ItensAvulsos) then
     self.AdicionarItensAvulsosNoGrid(self.FNotaFiscal.ItensAvulsos);
end;

procedure TfrmItensAvulsos.gridQuantidadesColExit(Sender: TObject);
var
  Tamanho          :TTamanho;
  Repositorio      :TRepositorio;
  Especificacao    :TEspecificacao;
  DescricaoTamanho :String;
begin
  if cdsTotal.ReadOnly then  cdsTotal.ReadOnly := false;

  if (gridQuantidades.SelectedField.Name = 'cdsTOTAL') then begin
     edtPercDesconto.SetFocus;
     exit;
  end;

  if (Pos('TOTAL', gridQuantidades.SelectedField.Name) <= 0) then begin
    Tamanho       := nil;
    Repositorio   := nil;
    Especificacao := nil;

    DescricaoTamanho := TStringUtilitario.RemoveCaracter(gridQuantidades.SelectedField.Name, 'cdsTam');

    try
      Especificacao := TEspecificacaoTamanhoPorDescricao.Create(DescricaoTamanho);
      Repositorio   := TFabricaRepositorio.GetRepositorio(TTamanho.ClassName);
      Tamanho       := (Repositorio.GetPorEspecificacao(Especificacao) as TTamanho);

      self.SomarQuantidadeAoTotal(Tamanho,  self.cds.FieldByName(TStringUtilitario.RemoveCaracter(gridQuantidades.SelectedField.Name, 'cds')).AsInteger);
      self.AtualizarValores(self.FItemAvulsoTemporario.QuantidadeTotal,
                            self.FItemAvulsoTemporario.ValorDesconto,
                            self.FItemAvulsoTemporario.ValorTotal);

    finally
      FreeAndNil(Tamanho);
      FreeAndNil(Repositorio);
      FreeAndNil(Especificacao);
    end;
  end;
end;

procedure TfrmItensAvulsos.gridQuantidadesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (gridQuantidades.SelectedField.Name = 'cdsTOTAL') then   gridQuantidades.SelectedField.Readonly := true
  else                                                        cdsTotal.Readonly := false;

  if not (Column.Title.Caption = 'TOTAL') then begin

    if not cds.FieldByName('Tam'+Column.Title.Caption).ReadOnly then
      begin
        gridQuantidades.Canvas.Font.Color  := clBlue;
        gridQuantidades.Canvas.Brush.Color := clwhite;
        gridQuantidades.Canvas.Font.Style  := [fsBold];
        Column.Title.Font.Style    := [fsBold];
      end
    else
      begin
        gridQuantidades.Canvas.Font.Color  := clBlack;
        gridQuantidades.Canvas.Brush.Color := clSilver;
      end;
  end;

  gridQuantidades.Canvas.FillRect(Rect);
  gridQuantidades.DefaultDrawDataCell  (Rect, gridQuantidades.columns[datacol].field, State);
  gridQuantidades.DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

procedure TfrmItensAvulsos.gridQuantidadesEnter(Sender: TObject);
begin
  self.gridQuantidades.OnColExit := nil;
  gridQuantidades.SelectedIndex := 0;

  while cds.Fields[gridQuantidades.SelectedIndex].ReadOnly do begin

    gridQuantidades.SelectedIndex := gridQuantidades.SelectedIndex + 1;
  end;

  self.gridQuantidades.OnColExit := gridQuantidadesColExit;
end;

procedure TfrmItensAvulsos.gridQuantidadesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9']) and not (key in [#8,#37,#39,#13,#9]) then
    key := #0;
end;

procedure TfrmItensAvulsos.IniciarGridTamanhos;
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
  cdsTamRN.AsInteger := 0; cdsTamP.AsInteger := 0; cdsTamM.AsInteger     := 0; cdsTamG.AsInteger  := 0;
  cdsTam1.AsInteger  := 0; cdsTam2.AsInteger := 0; cdsTam3.AsInteger     := 0; cdsTam4.AsInteger  := 0;
  cdsTam6.AsInteger  := 0; cdsTam8.AsInteger := 0; cdsTamUNICA.AsInteger := 0; cdsTOTAL.AsInteger := 0;
  cds.Post;

  cds.AfterScroll := Proc;
end;

procedure TfrmItensAvulsos.LiberarTamanhos(Grade :TGrade);
var
  Tamanho :TTamanho;
  nX      :Integer;
begin
   { Bloqueio todos os campos do CDS de quantidades }
   for nX := 0 to (self.cds.Fields.Count-1) do
     self.cds.Fields[nX].ReadOnly := true;

   { Depois libero apenas os que constam na grade do produto selecionado }
   for nX := 0 to (Grade.Tamanhos.Count-1) do begin
     Tamanho := (Grade.Tamanhos[nX] as TTamanho);

     if Assigned(self.cds.FindField('tam'+Tamanho.Descricao)) then begin
       self.cds.FindField('tam'+Tamanho.Descricao).ReadOnly := false;
     end;
   end;
end;

procedure TfrmItensAvulsos.BuscaProdutoExit(Sender: TObject);
var
  Produto     :TProduto;
  Repositorio :TRepositorio;
begin
   self.IniciarGridTamanhos;

   if Assigned(self.FItemAvulsoTemporario) then
    FreeAndNil(self.FItemAvulsoTemporario);

   self.FItemAvulsoTemporario := TItemAvulso.Create;

   Produto     := nil;
   Repositorio := nil;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TProduto.ClassName);
     Produto     := (Repositorio.Get(self.BuscaProduto.CodigoProduto) as TProduto);

     if Assigned(Produto) and Assigned(Produto.Grade) then
       self.LiberarTamanhos(Produto.Grade);

     self.FItemAvulsoTemporario.Produto := Produto;
     self.FItemAvulsoTemporario.Preco   := self.BuscaProduto.preco;

     self.edtPreco.Value                := self.FItemAvulsoTemporario.Preco; 

   finally
     FreeAndNil(Repositorio);
     FreeAndNil(Produto);
   end;
end;

procedure TfrmItensAvulsos.SomarQuantidadeAoTotal(Tamanho: TTamanho; Quantidade :Integer);
begin
   self.FItemAvulsoTemporario.AdicionarQuantidade(Tamanho, Quantidade);
end;

procedure TfrmItensAvulsos.AtualizarValores(QuantidadeTotal :Real; ValorDesconto :Real; ValorTotal :Real);
begin
   self.cdsTOTAL.ReadOnly := false;

   self.cds.Edit;
   self.cdsTOTAL.AsFloat := QuantidadeTotal;
   self.cds.Post;

   self.cdsTOTAL.ReadOnly := true;

   self.edtDesconto.Value   := ValorDesconto;
   self.edtValorItens.Value := ValorTotal;
end;

procedure TfrmItensAvulsos.edtPercDescontoChange(Sender: TObject);
begin
  inherited;

  self.FItemAvulsoTemporario.PercentualDesconto := TCurrencyEdit(Sender).Value;

  self.AtualizarValores(self.FItemAvulsoTemporario.QuantidadeTotal,
                        self.FItemAvulsoTemporario.ValorDesconto,
                        self.FItemAvulsoTemporario.ValorTotal);
end;

procedure TfrmItensAvulsos.btnAdicionarItemClick(Sender: TObject);
var
  ItemAvulso          :TItemAvulso;

  RepositorioTamanho  :TRepositorio;
  RepositorioProduto  :TRepositorio;
  RepositorioCor      :TRepositorio;

  Tamanho             :TTamanho;
  Produto             :TProduto;
  Cor                 :TCor;

  nX                  :Integer;
begin
   if not Assigned(self.FItemAvulsoTemporario) then begin
     inherited Avisar('Selecione o produto!');
     exit;
   end;

   if not Assigned(self.FItemAvulsoTemporario.Cor) then begin
     inherited Avisar('Selecione a cor!');
     exit;
   end;

   if not Assigned(self.FItemAvulsoTemporario.Quantidades) then begin
     inherited Avisar('Nenhuma quantidade adicionada!');
     exit;
   end;

   ItemAvulso                    := TItemAvulso.Create;
   ItemAvulso.Preco              := self.FItemAvulsoTemporario.Preco;
   ItemAvulso.PercentualDesconto := self.FItemAvulsoTemporario.PercentualDesconto;

   { Adicionando as quantidades }
   for nX := 0 to (self.FItemAvulsoTemporario.Quantidades.Count-1) do begin
     RepositorioTamanho := nil;

     try
       RepositorioTamanho := TFabricaRepositorio.GetRepositorio(TTamanho.ClassName);
       Tamanho            := (RepositorioTamanho.Get(TQuantidadeItemAvulso(self.FItemAvulsoTemporario.Quantidades[nX]).Tamanho.Codigo) as TTamanho);
       ItemAvulso.AdicionarQuantidade(Tamanho, TQuantidadeItemAvulso(self.FItemAvulsoTemporario.Quantidades[nX]).Quantidade);
     finally
       FreeAndNil(RepositorioTamanho);
       FreeAndNil(Tamanho);
     end;
   end;

   { Adicionar o produto }
   RepositorioProduto := nil;

   try
     RepositorioProduto := TFabricaRepositorio.GetRepositorio(TProduto.ClassName);
     Produto            := (RepositorioProduto.Get(self.FItemAvulsoTemporario.Produto.Codigo) as TProduto);
     ItemAvulso.Produto := Produto;

   finally
     FreeAndNil(RepositorioProduto);
     FreeAndNil(Produto);
   end;

   { Adicionar a referência }
   RepositorioCor := nil;

   try
      RepositorioCor := TFabricaRepositorio.GetRepositorio(TCor.ClassName);
      Cor            := (RepositorioCor.Get(self.FItemAvulsoTemporario.Cor.Codigo) as TCor);
      ItemAvulso.Cor := Cor;
   finally
     FreeAndNil(RepositorioCor);
     FreeAndNil(Cor);
   end;

   { Adicionar na Nota Fiscal }
   try
     self.FNotaFiscal.AdicionarItemAvulso(ItemAvulso);

     { Adiciona no grid de baixo }
     self.AdicionarItensAvulsosNoGrid(self.FNotaFiscal.ItensAvulsos);

     self.LimparTela();
     FreeAndNil(self.FItemAvulsoTemporario);
     self.BuscaProduto.edtReferencia.SetFocus;
   except
     on E: Exception do
      inherited Avisar(E.Message);
   end;
end;

procedure TfrmItensAvulsos.BuscaCorExit(Sender: TObject);
var
  Cor         :TCor;
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FItemAvulsoTemporario) then begin
     inherited Avisar('Selecione o produto!');
     exit;
   end;

   Cor         := nil;
   Repositorio := nil;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TCor.ClassName);
     Cor         := (Repositorio.Get(self.BuscaCor.CodigoCor) as TCor);

     if Assigned(Cor) then
       self.FItemAvulsoTemporario.Cor := Cor;

   finally
     FreeAndNil(Repositorio);
     FreeAndNil(Cor);
   end;
end;

procedure TfrmItensAvulsos.btnConfirmarClick(Sender: TObject);
begin
   self.Close();
end;

procedure TfrmItensAvulsos.BuscaProdutoEnter(Sender: TObject);
begin
   if (self.BuscaTabelaPreco.codTabela = '') then begin
     inherited Avisar('Nenhuma tabela informada! Verifique.');
     self.BuscaTabelaPreco.edtCodigo.SetFocus;
   end;

   self.BuscaProduto.codTabela := self.BuscaTabelaPreco.codTabela;
end;

procedure TfrmItensAvulsos.FormShow(Sender: TObject);
begin
   if (self.BuscaTabelaPreco.codTabela <> '') then
      self.BuscaProduto.edtReferencia.SetFocus
   else
      self.BuscaTabelaPreco.edtCodigo.SetFocus;
end;

procedure TfrmItensAvulsos.LimparTela;
begin
   self.BuscaProduto.limpa;
   self.BuscaCor.limpa;
   self.IniciarGridTamanhos;
   self.edtPreco.Clear;
   self.edtPercDesconto.Clear;
   self.edtDesconto.Clear;
   self.edtValorItens.Clear;
end;

procedure TfrmItensAvulsos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if (Key = VK_F6) then
    self.btnConfirmar.OnClick(self.btnConfirmar);
end;

end.
