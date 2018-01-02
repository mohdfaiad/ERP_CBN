unit uSincronizaProdutoEcommerce;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, frameBuscaCor, frameBuscaProduto, Vcl.Mask, RxToolEdit,
  RxCurrEdit, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Tamanho, Produto, Cor, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Vcl.DBCtrls, Vcl.ComCtrls, ConfiguracoesECommerce, DBGridCBN;

type
  TfrmSincronizaProdutoEcommerce = class(TfrmPadrao)
    pnlRodape: TPanel;
    btnSair: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cds: TClientDataSet;
    cdsSKU_PAI: TStringField;
    cdsREFPRO: TStringField;
    cdsPRODUTO: TStringField;
    cdsREFCOR: TStringField;
    cdsCOR: TStringField;
    cdsTAM: TStringField;
    cdsESTOQUE: TFloatField;
    cdsSKU: TStringField;
    cdsCOD_PLATAFORMA: TStringField;
    cdsSELECIONADO: TStringField;
    ds: TDataSource;
    GroupBox2: TGroupBox;
    BuscaCor1: TBuscaCor;
    GroupBox1: TGroupBox;
    BuscaProduto1: TBuscaProduto;
    gridVariacoes: TDBGrid;
    btnAdd: TBitBtn;
    chbSelecionarTodas: TCheckBox;
    DBCheckBox1: TDBCheckBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnSincronizar: TBitBtn;
    SpeedButton1: TSpeedButton;
    cdsProdutosPai: TClientDataSet;
    cdsProdutosPaiSKU: TStringField;
    cdsProdutosPaiID: TIntegerField;
    cdsID_PAI: TStringField;
    Label1: TLabel;
    lbQtdProdutosPai: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    cdsPRECO: TFloatField;
    Timer1: TTimer;
    btnBuscaProdutosPai: TSpeedButton;
    tmrTravaTela: TTimer;
    Label2: TLabel;
    DataSource1: TDataSource;
    gridSKUSPai: TDBGridCBN;
    Panel2: TPanel;
    btnCancelarSelecao: TBitBtn;
    BitBtn3: TBitBtn;
    btnSelecionaSKUpai: TBitBtn;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    lbQtdeReferencias: TLabel;
    aguardar: TTimer;
    procedure btnSairClick(Sender: TObject);
    procedure btnSincronizarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure gridVariacoesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gridVariacoesKeyPress(Sender: TObject; var Key: Char);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure chbSelecionarTodasClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnBuscaProdutosPaiClick(Sender: TObject);
    procedure tmrTravaTelaTimer(Sender: TObject);
    procedure gridVariacoesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure btnSelecionaSKUpaiClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnCancelarSelecaoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure aguardarTimer(Sender: TObject);
  private
    FListaTamanhos :TObjectList<TPanel>;
    FConfiguracoes :TConfiguracoesECommerce;
    FListaProdutos :TStringList;

  private
    FSegundos :SmallInt;

    function buscaProdutosPai(page :integer) :String;
    function produtoNaoCadastrado(pSku:String) :Boolean;
    function getJsonToSend :String;

    procedure AguardarUmMinuto;
    procedure encontraSkuPai(skuVariacao :String; var pIdPai :String; var pSkuPai :String);

    procedure PopulaCdsProdutosPai;
    function cadastraProdutoPai(pSKU :String) :String;
    procedure AtualizaTamanhos;
    procedure adicionaTamanhosALista;
    procedure adicionaReferenciaAoCds(estoque :Real; tamanho :String);
    procedure sincronizaProdutos;
    procedure addParaSincronizacao(pRefPro, pRefCor :String; pTamanho :String; estoque, preco :Real; idPai :String);
    procedure selecionaDeselecionaProdutoPosicionado(acao :smallint);

    function obrigatorios :boolean;
//    function criaPanel(tamanho :TTamanho; estoque :Real) :TPanel;
  public
    { Public declarations }
  end;

var
  frmSincronizaProdutoEcommerce: TfrmSincronizaProdutoEcommerce;

CONST NAO_ENCONTRADO = 'não encontrado';
      MAIS_DE_UM_ENCONTRADO = 'mais de um encontrado';

implementation

uses CodigoBarras, Repositorio, FabricaRepositorio, EspecificacaoEstoquePorProdutoCorTamanho, Estoque, Math, System.StrUtils, StringUtilitario,
     REST.types, System.JSon, IdSSLOpenSSL, HTTPJSON, uModulo;

{$R *.dfm}

procedure TfrmSincronizaProdutoEcommerce.addParaSincronizacao(pRefPro, pRefCor, pTamanho: String; estoque, preco: Real; idPai: String);
var
    vEstoque, vPreco :String;
    vNomeProduto, json :String;
    vSKU, vCodigoPlat :String;
begin
  vSKU        := TStringUtilitario.RemoveCaracteresEspeciais(pRefPro + pTamanho + pRefCor);

  vCodigoPlat := pRefPro +' '+ pTamanho +' ' + pRefCor;

  vNomeProduto := BuscaProduto1.Prod.Descricao;
  estoque      := IfThen(estoque < 0, 0, estoque);
  vEstoque     := StringReplace(floatToStr(estoque),',','.',[rfReplaceAll, rfIgnoreCase]);
  vPreco       := '0';

  json := '{"sku": "'+vSKU+'", "codigo": "'+vCodigoPlat+'", "nome": "'+vNomeProduto+'", "estoque": '+vEstoque+
            ', "parent": '+idPai+', "preco_de": '+vPreco+', "preco_por": '+vPreco+'}';

  FListaProdutos.Add( json );
end;

procedure TfrmSincronizaProdutoEcommerce.adicionaReferenciaAoCds(estoque: Real; tamanho :String);
var refPro, refCor, idPai, skuPai :String;
begin
  refPro := BuscaProduto1.Prod.Referencia;
  refCor := BuscaCor1.edtReferencia.Text;
  if not cds.Locate('REFPRO;REFCOR;TAM', varArrayOf([BuscaProduto1.Prod.Referencia, BuscaCor1.edtReferencia.Text, tamanho]), []) then
  begin
    encontraSkuPai(TStringUtilitario.RemoveCaracteresEspeciais(refPro + refcor), idPai, skuPai);

    cds.Append;
    cdsSKU_PAI.AsString   := skuPai;
    cdsID_PAI.AsString    := idPai;
    cdsREFPRO.AsString    := refPro;
    cdsPRODUTO.AsString   := BuscaProduto1.Prod.Descricao;
    cdsREFCOR.AsString    := refCor;
    cdsCOR.AsString       := BuscaCor1.edtDescricao.Text;
    cdsTAM.AsString       := tamanho;
    cdsESTOQUE.AsFloat    := estoque;
    cdsSKU.AsString       := TStringUtilitario.RemoveCaracteresEspeciais(refPro+ tamanho + refcor);
    cdsCOD_PLATAFORMA.AsString := refPro +' '+ tamanho +' '+ refcor;
    cdsSELECIONADO.AsString := 'N';
    cdsPRECO.AsFloat      := BuscaProduto1.preco;
    cds.Post;
  end;
end;

procedure TfrmSincronizaProdutoEcommerce.adicionaTamanhosALista;
var repCodBar, repEstoque :TRepositorio;
    codigoProduto, codigoCor, codigoGrade, codigoTamanho :Integer;
    tamanho :TTamanho;
    especificacao :TEspecificacaoEstoquePorProdutoCorTamanho;
    setor :integer;
    Estoque :TEstoque;
    QtdEstoque :Real;
    teste :variant;
begin
  try
    //2 = e-commerce
    setor      := 2;
    QtdEstoque := 0;
    for tamanho in BuscaProduto1.Prod.Grade.Tamanhos do
    begin
      codigoProduto := BuscaProduto1.Prod.Codigo;
      codigoCor     := BuscaCor1.CodigoCor;
      codigoGrade   := BuscaProduto1.Prod.Grade.Codigo;
      codigoTamanho := tamanho.Codigo;

      repCodBar := TFabricaRepositorio.GetRepositorio(TCodigoBarras.ClassName);
      {libera o tamanho para sincronização apenas se existir um código de barras correspondente(prod/cor/tamanho/grade)}
      if repCodBar.GetExiste(['CODPRODUTO','CODCOR','CODGRADE','CODTAMANHO'],
                             [codigoProduto, codigoCor, codigoGrade, codigoTamanho]) then
      begin
        repEstoque    := TFabricaRepositorio.GetRepositorio(TEstoque.ClassName);
        especificacao := TEspecificacaoEstoquePorProdutoCorTamanho.Create(setor, codigoProduto, codigoCor, codigoTamanho);
        Estoque       := TEstoque(repEstoque.GetPorEspecificacao(especificacao, intToStr(codigoProduto)));

        if Assigned(Estoque) then
          QtdEstoque := Estoque.quantidade
        else
          QtdEstoque := 0;

        adicionaReferenciaAoCds(QtdEstoque, tamanho.Descricao);
      end;
    end;

    if cds.IsEmpty then
      avisar('Nenhuma das combinações de tamanho do produto/cor selecionado tem código de barras cadastrado');

  finally
    if Assigned(repEstoque) then
      FreeAndNil(repEstoque);
    if Assigned(repCodBar) then
      FreeAndNil(repCodBar);
    if Assigned(especificacao) then
      FreeAndNil(especificacao);
    if Assigned(Estoque) then
      FreeAndNil(Estoque);
  end;
end;

procedure TfrmSincronizaProdutoEcommerce.AguardarUmMinuto;
begin
  Aguarda('Número máximo de solicitações ao servidor foi atingida. Por favor aguarde alguns instantes...');
end;

procedure TfrmSincronizaProdutoEcommerce.aguardarTimer(Sender: TObject);
begin
  inc(FSegundos);
  if FSegundos >= 60 then
  begin
    FSegundos := 0;
    aguardar.Enabled := false;
    FimAguarda();
  end;
end;

procedure TfrmSincronizaProdutoEcommerce.sincronizaProdutos;
var
    Retorno, lJSO :String;
    Parametros :TStrings;
    vHTTPJSON: THTTPJSON;
    vEstoque, vPreco :String;
    vNomeProduto :String;
    vSKU, vCodigoPlat :String;
    IdSSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  try
   vHTTPJSON := nil;
   vHTTPJSON := THTTPJSON.Create(fdm.configuracoesECommerce.token, fdm.configuracoesECommerce.url_base);
  try
    Retorno := vHTTPJSON.Post(getJsonToSend);

    if pos('"success":true', Retorno) = 0 then
      raise Exception.Create('Falha na sincronização');
  Except
    on e:Exception do
    begin
      avisar(e.Message);
      if pos('UNKNOWN STATUS', e.Message) > 0 then
        AguardarUmMinuto;
    end;
  end;
  finally
    FreeAndNil(vHTTPJSON);
  end;
end;

procedure TfrmSincronizaProdutoEcommerce.AtualizaTamanhos;
var panel :TPanel;
    tamanho :String;
    estoque :Real;
begin
  if Assigned(FListaTamanhos) then
  begin
    FListaTamanhos.Free;
    FListaTamanhos := nil;
  end;

  if (BuscaProduto1.edtDescricao.Text = '') or (BuscaCor1.edtDescricao.Text = '') then
    exit;

  FListaTamanhos := TObjectList<TPanel>.Create();
  adicionaTamanhosALista;
end;

procedure TfrmSincronizaProdutoEcommerce.BitBtn1Click(Sender: TObject);
begin
  if not cds.IsEmpty then
    if confirma('Deseja realmente limpar todas as referências?') then
    begin
      cds.EmptyDataSet;
      chbSelecionarTodas.Tag := 1;
    //  chbSelecionarTodasClick(chbSelecionarTodas);
      chbSelecionarTodas.Checked := false;
    end;

  lbQtdeReferencias.Caption := IntToStr(cds.RecordCount)+' Referências adicionadas';
end;

procedure TfrmSincronizaProdutoEcommerce.BitBtn3Click(Sender: TObject);
begin
  cds.Edit;
  cdsSKU_PAI.AsString := cdsProdutosPaiSKU.AsString;
  cdsID_PAI.AsString  := cdsProdutosPaiID.AsString;
  cds.Post;
  btnCancelarSelecao.Click;
end;

procedure TfrmSincronizaProdutoEcommerce.btnSincronizarClick(Sender: TObject);
var sku :String;
    panel :TPanel;
    x, i :integer;
begin
  if not assigned(FListaProdutos) then
    FListaProdutos := TStringList.Create
  else
    FListaProdutos.Clear;

  try
    cds.Filtered := false;
    cds.Filter   := 'SELECIONADO = ''S''';
    cds.Filtered := true;
    if not cds.IsEmpty then
    begin
      cds.First;
      while not cds.Eof do
      begin
         if produtoNaoCadastrado(TStringUtilitario.RemoveCaracteresEspeciais(cdsREFPRO.AsString + cdsTAM.AsString + cdsREFCOR.AsString)) then
           addParaSincronizacao(cdsREFPRO.AsString, cdsREFCOR.AsString, cdsTAM.AsString, cdsESTOQUE.AsFloat, cdsPRECO.AsFloat,cdsID_PAI.AsString);
         cds.Next;
      end;

      if FListaProdutos.Count > 0 then
        sincronizaProdutos;
    end
    else
      avisar('Nenhum produto foi selecionado');
  finally
    cds.Filtered := false;
  end;
end;

function TfrmSincronizaProdutoEcommerce.buscaProdutosPai(page :integer) :String;
var
    vHTTPJSON: THTTPJSON;
begin
  try
    vHTTPJSON := THTTPJSON.Create(dm.configuracoesECommerce.token, dm.configuracoesECommerce.url_base);

    result := vHTTPJSON.Get('produtos/?page='+intToStr(page));
  finally
    FreeAndNil(vHTTPJSON);
  end;
end;

procedure TfrmSincronizaProdutoEcommerce.Button1Click(Sender: TObject);
begin
  cdsProdutosPai.Filtered := false;
  cdsProdutosPai.Filter   := edit1.Text;
  cdsProdutosPai.Filtered := true;
end;

procedure TfrmSincronizaProdutoEcommerce.Button2Click(Sender: TObject);
begin
  inherited;
  cdsProdutosPai.Filtered := false;
end;

procedure TfrmSincronizaProdutoEcommerce.btnAddClick(Sender: TObject);
begin
  if obrigatorios then
  begin
    adicionaTamanhosALista;
    BuscaCor1.limpa;
    BuscaCor1.edtReferencia.SetFocus;
  end;

  lbQtdeReferencias.Caption := IntToStr(cds.RecordCount)+' Referências adicionadas';
end;

procedure TfrmSincronizaProdutoEcommerce.btnSairClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmSincronizaProdutoEcommerce.btnSelecionaSKUpaiClick(Sender: TObject);
var sku, filtro :String;
begin
  sku    := TStringUtilitario.RemoveCaracteresEspeciais(cdsREFPRO.AsString + cdsREFCOR.AsString);

  filtro := '(SKU like PARAM1) or (SKU like PARAM2) or (SKU like PARAM3)';
  filtro := StringReplace(filtro, 'PARAM1', QuotedStr('%'+sku), [rfReplaceAll]);
  filtro := StringReplace(filtro, 'PARAM2', QuotedStr('%'+sku+'%'), [rfReplaceAll]);
  filtro := StringReplace(filtro, 'PARAM3', QuotedStr(sku+'%'), [rfReplaceAll]);

  TabSheet1.TabVisible := true;
  TabSheet2.TabVisible := false;
  gridSKUSPai.SetFocus;
  cdsProdutosPai.Filtered := false;
  cdsProdutosPai.Filter   := filtro;
  cdsProdutosPai.Filtered := true;
end;

function TfrmSincronizaProdutoEcommerce.cadastraProdutoPai(pSKU: String): String;
begin
 ///
end;

procedure TfrmSincronizaProdutoEcommerce.cdsAfterScroll(DataSet: TDataSet);
begin
  btnSelecionaSKUpai.Enabled := cdsSKU_PAI.AsString = MAIS_DE_UM_ENCONTRADO;
end;

procedure TfrmSincronizaProdutoEcommerce.chbSelecionarTodasClick(Sender: TObject);
var pos :integer;
begin
  pos := cds.RecNo;
  cds.First;
  while not cds.Eof do
  begin
    if cdsSKU_PAI.AsString <> '' then
      selecionaDeselecionaProdutoPosicionado(chbSelecionarTodas.Tag);
    cds.Next;
  end;
  cds.RecNo := pos;

  chbSelecionarTodas.Caption := IfThen(chbSelecionarTodas.Checked, 'Deselecionar todas', 'Selecionar Todas');
  chbSelecionarTodas.Tag     := IfThen(chbSelecionarTodas.Tag = 0, 1, 0);
end;

procedure TfrmSincronizaProdutoEcommerce.DBCheckBox1Click(Sender: TObject);
begin
   if DBCheckBox1.Checked then
      DBCheckBox1.Caption := DBCheckBox1.ValueChecked
   else
      DBCheckBox1.Caption := DBCheckBox1.ValueUnChecked;
end;

procedure TfrmSincronizaProdutoEcommerce.gridVariacoesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
       (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
 var
   DrawState: Integer;
   DrawRect: TRect;
begin
     if (Column.Field.FieldName = DBCheckBox1.DataField) then
     begin
       DrawRect:=Rect;
       InflateRect(DrawRect,-1,-1);
       DrawState := ISChecked[Column.Field.AsString = 'S'];
       gridVariacoes.Canvas.FillRect(Rect);
       DrawFrameControl(gridVariacoes.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
     end;

     if (Column.Field.FieldName = cdsSKU_PAI.FieldName) then
     begin
       TDBGrid(Sender).Canvas.Brush.Color := IfThen(Uppercase(cdsSKU_PAI.AsString) = Uppercase(NAO_ENCONTRADO) , clMaroon, clGreen);
       TDBGrid(Sender).Canvas.Font.Color  := clWhite;
       TDBGrid(Sender).Canvas.FillRect( rect );
       TDBGrid(Sender).DefaultDrawColumnCell( Rect, DataCol, Column, state);
     end;
end;

procedure TfrmSincronizaProdutoEcommerce.gridVariacoesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_delete) and not cds.IsEmpty then
  begin
    cds.Delete;
    lbQtdeReferencias.Caption := IntToStr(cds.RecordCount)+' Referências adicionadas';
  end;
end;

procedure TfrmSincronizaProdutoEcommerce.gridVariacoesKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = Chr(9)) then
     Exit;
   if (key = ' ') and not cds.IsEmpty then
   begin
     if cdsSKU_PAI.AsString = '' then
       avisar('Uma referência sem SKU pai não pode ser sincronizada')
     else
       selecionaDeselecionaProdutoPosicionado(IfThen(cdsSELECIONADO.AsString = 'S', 1, 0));
   end;
end;

procedure TfrmSincronizaProdutoEcommerce.encontraSkuPai(skuVariacao :String; var pIdPai :String; var pSkuPai :String);
var qtdEncontrado :smallInt;
begin
  try
    qtdEncontrado := 0;
    pSkuPai := NAO_ENCONTRADO;
    //exatamanente a sku pai
    cdsProdutosPai.Filtered := false;
    cdsProdutosPai.Filter   := 'SKU like '''+skuVariacao+'''';
    cdsProdutosPai.Filtered := true;
    if not cdsProdutosPai.IsEmpty then
    begin
      pSkuPai := cdsProdutosPaiSKU.AsString;
      pIdPai  := cdsProdutosPaiID.AsString;
      qtdEncontrado := qtdEncontrado + cdsProdutosPai.RecordCount;
    end;
    //no começo da string sku pai
    cdsProdutosPai.Filtered := false;
    cdsProdutosPai.Filter   := 'SKU like '''+skuVariacao+' %''';
    cdsProdutosPai.Filtered := true;
    if not cdsProdutosPai.IsEmpty then
    begin
      pSkuPai := cdsProdutosPaiSKU.AsString;
      pIdPai  := cdsProdutosPaiID.AsString;
      qtdEncontrado := qtdEncontrado + cdsProdutosPai.RecordCount;
    end;
    //no meio da string sku pai
    cdsProdutosPai.Filtered := false;
    cdsProdutosPai.Filter   := 'SKU like ''% '+skuVariacao+' %''';
    cdsProdutosPai.Filtered := true;
    if not cdsProdutosPai.IsEmpty then
    begin
      pSkuPai := cdsProdutosPaiSKU.AsString;
      pIdPai  := cdsProdutosPaiID.AsString;
      qtdEncontrado := qtdEncontrado + cdsProdutosPai.RecordCount;
    end;
    //no fim da string sku pai
    cdsProdutosPai.Filtered := false;
    cdsProdutosPai.Filter   := 'SKU like ''% '+skuVariacao+'''';
    cdsProdutosPai.Filtered := true;
    if not cdsProdutosPai.IsEmpty then
    begin
      pSkuPai := cdsProdutosPaiSKU.AsString;
      pIdPai  := cdsProdutosPaiID.AsString;
      qtdEncontrado := qtdEncontrado + cdsProdutosPai.RecordCount;
    end;

    if qtdEncontrado > 1 then
    begin
      pSkuPai := MAIS_DE_UM_ENCONTRADO;
      pIdPai  := '';
    end;

  finally
    cdsProdutosPai.Filtered := false;
  end;
end;

procedure TfrmSincronizaProdutoEcommerce.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;
  cdsProdutosPai.CreateDataSet;
  FSegundos := 0;
end;

procedure TfrmSincronizaProdutoEcommerce.FormDestroy(Sender: TObject);
begin
  if Assigned(self.FConfiguracoes) then
    FreeAndNil(FConfiguracoes);
  if not assigned(FListaProdutos) then
    FreeAndNil(FListaProdutos);
  inherited;
end;

procedure TfrmSincronizaProdutoEcommerce.FormShow(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := true;
end;

function TfrmSincronizaProdutoEcommerce.getJsonToSend: String;
var i :integer;
    textoJson :String;
begin
  for i:= 0 to FListaProdutos.Count-1 do
    textoJson := textoJson +','+ FListaProdutos.Strings[i];

  textoJson := copy(textoJson, 2, length(textoJson));
  textoJson := '[' + textoJson + ']';

  result := textoJson;//TStringStream.Create(textoJson ,TEncoding.UTF8);
end;

function TfrmSincronizaProdutoEcommerce.obrigatorios: boolean;
begin
  result := false;
  if BuscaProduto1.edtDescricao.Text = '' then
  begin
    avisar('Um produto precisa ser informado para efatuar a sincronização.',3);
    BuscaProduto1.edtReferencia.SetFocus;
  end
  else if BuscaCor1.edtDescricao.Text = '' then
  begin
    avisar('Uma cor precisa ser informada para efatuar a sincronização.',3);
    BuscaCor1.edtReferencia.SetFocus;
  end
  else
    result := true;
end;

procedure TfrmSincronizaProdutoEcommerce.PopulaCdsProdutosPai;
var
  Produtos :TJSONArray;
  Objeto :TJSONObject;
  ProdutoJSON :TJSONObject;
  i, x, codigoProduto, codigoCor :integer;
  refPro, refCor, tamanho, sku, nextPage, erro :String;
  id_ultimo_produto, page, totalProdutos :integer;
begin
  try
    page     := 1;
    Objeto   := TJSONObject.ParseJSONValue( buscaProdutosPai(page) ) as TJSONObject;
    cdsProdutosPai.EmptyDataSet;

    while nextPage <> 'null' do
    begin
      Application.ProcessMessages;
      inc(page);
      nextPage := Objeto.GetValue('next').Value;
      Produtos := Objeto.GetValue('results') as TJSONArray;

      for i := 0 to Produtos.Count-1 do
      begin
        ProdutoJSON := (Produtos.Items[i] as TJSONObject);

        if ProdutoJSON.GetValue('is_wrapper').Value = 'true' then
        begin;
          cdsProdutosPai.Append;
          cdsProdutosPaiID.AsInteger  := strToIntDef(ProdutoJSON.GetValue('id').Value,0);
          cdsProdutosPaiSKU.AsString  := ProdutoJSON.GetValue('sku').Value;
          cdsProdutosPai.Post;
        end;
      end;

      if nextPage <> 'null' then
         Objeto   := TJSONObject.ParseJSONValue( buscaProdutosPai(page) ) as TJSONObject;
    end;

  except
    on e :Exception do
    begin
      erro := e.Message;
      if pos('429',erro) > 0 then
        erro := 'Retorno 429 - Limite de requisições por minuto atingida. Por favor aguarde alguns instantes.';
      raise Exception.Create('Falha ao buscar relação de produtos pai.'+#13#10+erro);
    end;
  end;
end;

function TfrmSincronizaProdutoEcommerce.produtoNaoCadastrado(pSku: String): Boolean;
var
    vHTTPJSON: THTTPJSON;
    retorno :String;
    ProdutoJSON :TJSONObject;
begin
  try
  try
    vHTTPJSON := THTTPJSON.Create(fdm.configuracoesECommerce.token, fdm.configuracoesECommerce.url_base);
    retorno := vHTTPJSON.Get('produto/'+pSku);

    result := Pos('Não encontrado',retorno) > 0;

    ProdutoJSON := TJSONObject.ParseJSONValue(retorno) as TJSONObject;
    result := ProdutoJSON.GetValue('parent').Value <> cdsID_PAI.AsString;
  except
      result := true;
  end;
  finally
    if retorno <> '' then
      freeAndNil(ProdutoJSON);
    FreeAndNil(vHTTPJSON);
  end;
end;

procedure TfrmSincronizaProdutoEcommerce.selecionaDeselecionaProdutoPosicionado(acao :smallint);
begin
  cds.Edit;
  cdsSELECIONADO.AsString := IfThen(acao = 0, 'S', 'N');
  cds.Post;
end;

procedure TfrmSincronizaProdutoEcommerce.SpeedButton1Click(Sender: TObject);
begin
  avisar(' - É aconselhável que se faça a sincronização de no máximo 30 referências por vez.'+#13#10+
         ' - Os tamanhos da referência/cor apenas será listado se existir um código de barras correspondente cadastrado.'+#13#10+
         ' - O produto só poderá ser sincronizado se for encontrado o SKU de um produto pai correspondente cadastrado.'+#13#10);
end;

procedure TfrmSincronizaProdutoEcommerce.btnBuscaProdutosPaiClick(Sender: TObject);
var erro :String;
begin
  if assigned(FConfiguracoes) then
  begin
    try
    try
      Aguarda('Aguarde. Buscando produtos pai cadastrados na plataforma...');
      PopulaCdsProdutosPai;
    except
      on e :Exception do
      begin
        erro := e.message;
        avisar(erro);
        if pos('429', erro) > 0 then
          tmrTravaTela.Enabled := true;
      end;
    end;
    finally
      FimAguarda('');
      lbQtdProdutosPai.Caption := intToStr(cdsProdutosPai.RecordCount);
    end;
  end;
end;

procedure TfrmSincronizaProdutoEcommerce.btnCancelarSelecaoClick(Sender: TObject);
begin
  cdsProdutosPai.Filtered := false;
  TabSheet2.TabVisible := true;
  TabSheet1.TabVisible := false;
  gridVariacoes.SetFocus;
end;

procedure TfrmSincronizaProdutoEcommerce.Timer1Timer(Sender: TObject);
var
    repositorio :TRepositorio;
begin
  Timer1.Enabled := false;
  try
    repositorio    := TFabricaRepositorio.GetRepositorio(TConfiguracoesECommerce.ClassName);
    FConfiguracoes := TConfiguracoesECommerce(repositorio.Get(1));

    if not assigned(FConfiguracoes) then
      avisar('Para utilizar o recurso de sincronização, as configurações do E-Commerce devem ser cadastradas')
    else
      BuscaProduto1.codTabela := intToStr(FConfiguracoes.cod_tabela_preco);
  finally
    FreeAndNil(repositorio);
  end;

  if assigned(FConfiguracoes) then
  begin
    try
    try
      Aguarda('Aguarde. Buscando produtos pai cadastrados na plataforma...');
      PopulaCdsProdutosPai;
    except
      on e :Exception do
      begin
        avisar(e.Message);
        self.Close;
      end;
    end;
    finally
      FimAguarda('');
      lbQtdProdutosPai.Caption := intToStr(cdsProdutosPai.RecordCount);
    end;
  end
  else
    self.Close;

  BuscaProduto1.edtReferencia.SetFocus;
end;

procedure TfrmSincronizaProdutoEcommerce.tmrTravaTelaTimer(Sender: TObject);
var segundosRestantes :smallInt;
begin
  tmrTravaTela.Tag := tmrTravaTela.Tag + 1;
  segundosRestantes := 60 - tmrTravaTela.Tag;
  Aguarda('Por favor, aguarde alguns instantes '+IntToStr(segundosRestantes));

  if segundosRestantes = 0 then
  begin
    FimAguarda('');
    tmrTravaTela.Enabled := false;
    tmrTravaTela.Tag := 0;
  end;
end;

end.
