unit uCadastroProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Mask, RxToolEdit, RxCurrEdit, DB, Provider,
  DBClient, Grids, DBGrids,
  DBGridCBN, ComCtrls, Buttons, ExtCtrls, frameListaCampo, frameBuscaNcm, Produto,
  ProdutoCores, ProdutoTabelaPreco, Repositorio, frameBuscaCor, frameBuscaTabelaPreco, CodigoBarras,
  ImgList, pngimage, RLReport, frameBuscaProduto, System.ImageList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frameBuscaNCMIbpt;

type
  TfrmCadastroProduto = class(TfrmPadrao)
    panBotoes: TPanel;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    pagProdutos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    gridProdutos: TDBGridCBN;
    ds: TDataSource;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    edtCodigo: TCurrencyEdit;
    edtPrecoCusto: TCurrencyEdit;
    edtPrecoAtacado: TCurrencyEdit;
    edtPrecoMedio: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtDescricao: TEdit;
    edtLinha: TEdit;
    comAtivo: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtEstoqueFis: TCurrencyEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtEstoqueMin: TCurrencyEdit;
    Label9: TLabel;
    edtPesoLiq: TCurrencyEdit;
    Label10: TLabel;
    edtPesoBru: TCurrencyEdit;
    ListaGrade: TListaCampo;
    ListaGrupo: TListaCampo;
    ListaColecao: TListaCampo;
    ListaTipo: TListaCampo;
    BuscaNcm1: TBuscaNcm;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    BuscaCor1: TBuscaCor;
    Label11: TLabel;
    cdsCor: TClientDataSet;
    dsCor: TDataSource;
    dspCor: TDataSetProvider;
    btnIncCor: TBitBtn;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    GroupBox2: TGroupBox;
    btnIncTabela: TBitBtn;
    BuscaTabelaPreco1: TBuscaTabelaPreco;
    dspTabela: TDataSetProvider;
    cdsTabela: TClientDataSet;
    dsTabela: TDataSource;
    GridTabelaPreco: TDBGrid;
    edtPecas: TCurrencyEdit;
    Label15: TLabel;
    dsCodBar: TDataSource;
    cdsCodBar: TClientDataSet;
    dspCodBar: TDataSetProvider;
    cdsCodPossiveis: TClientDataSet;
    dsCodPossiveis: TDataSource;
    pagCodBar: TPageControl;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    DBGridCBN1: TDBGridCBN;
    labQtdRegistros: TLabel;
    dspCodPossiveis: TDataSetProvider;
    cdsCodPossiveisSTATUS: TStringField;
    labTotRef: TLabel;
    labRefDisponiveis: TLabel;
    labRefComCodigo: TLabel;
    ImageList1: TImageList;
    Shape2: TShape;
    gridReferencias: TDBGridCBN;
    edtSemCodigo: TEdit;
    edtComCodigo: TEdit;
    edtTotRef: TEdit;
    radFiltro: TRadioGroup;
    edtReferencia: TEdit;
    lbreferencia: TLabel;
    GroupBox3: TGroupBox;
    Image2: TImage;
    Image1: TImage;
    Label17: TLabel;
    Label16: TLabel;
    Shape1: TShape;
    lbRegistros: TLabel;
    btnGeraCodBar: TSpeedButton;
    Image3: TImage;
    Label18: TLabel;
    Label13: TLabel;
    Image4: TImage;
    lblAsterisco: TLabel;
    lblCamposObrigatorios: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label12: TLabel;
    edtPrecoVenda: TCurrencyEdit;
    BitBtn1: TBitBtn;
    rgTipoProduto: TRadioGroup;
    Label25: TLabel;
    cbGenero: TComboBox;
    gridCores: TDBGridCBN;
    GroupBox4: TGroupBox;
    Image5: TImage;
    Image6: TImage;
    Label24: TLabel;
    Label26: TLabel;
    cbUnidadeMedida: TComboBox;
    Label27: TLabel;
    Label28: TLabel;
    TabSheet6: TTabSheet;
    cdsEstoque: TClientDataSet;
    dsEstoque: TDataSource;
    DBGrid1: TDBGrid;
    cdsEstoqueCOR: TStringField;
    cdsEstoqueQTD_RN: TFloatField;
    cdsEstoqueQTD_P: TFloatField;
    cdsEstoqueQTD_M: TFloatField;
    cdsEstoqueQTD_G: TFloatField;
    cdsEstoqueQTD_1: TFloatField;
    cdsEstoqueQTD_2: TFloatField;
    cdsEstoqueQTD_3: TFloatField;
    cdsEstoqueQTD_4: TFloatField;
    cdsEstoqueQTD_6: TFloatField;
    cdsEstoqueQTD_8: TFloatField;
    cdsEstoqueQTD_UNICA: TFloatField;
    cdsEstoqueQTD_TOTAL: TFloatField;
    cdsEstoqueREFERENCIA: TStringField;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel13: TRLLabel;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDraw1: TRLDraw;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLBand2: TRLBand;
    RLDraw2: TRLDraw;
    RLDBText6: TRLDBText;
    RLLabel14: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLLabel15: TRLLabel;
    btnImprimir: TSpeedButton;
    cdsEstoquePRODUTO: TStringField;
    RLDBText5: TRLDBText;
    RLLabel16: TRLLabel;
    Shape3: TShape;
    lblEstoqueTotal: TLabel;
    edtEstoqueTotal: TEdit;
    cdsCodPossiveisTAG: TStringField;
    comKit: TComboBox;
    Label14: TLabel;
    BuscaProduto1: TBuscaProduto;
    gridKits: TDBGrid;
    CDSKits: TClientDataSet;
    dsKits: TDataSource;
    btnAddKit: TBitBtn;
    DSPKits: TDataSetProvider;
    edtCodigoKit: TCurrencyEdit;
    qry: TFDQuery;
    cdsCODIGO: TIntegerField;
    cdsDESCRICAO: TStringField;
    cdsCOD_NCM: TIntegerField;
    cdsCOD_TIPO: TIntegerField;
    cdsCOD_GRUPO: TIntegerField;
    cdsCOD_COLECAO: TIntegerField;
    cdsCOD_GRADE: TIntegerField;
    cdsLINHA_ANO: TStringField;
    cdsATIVO: TStringField;
    cdsPRECO_CUSTO: TBCDField;
    cdsPRECO_VENDA: TBCDField;
    cdsPRECO_ATACADO: TBCDField;
    cdsPRECO_MEDIO: TBCDField;
    cdsESTOQUE_FIS: TBCDField;
    cdsESTOQUE_MIN: TBCDField;
    cdsPESO_LIQ: TBCDField;
    cdsPESO_BRU: TBCDField;
    cdsQTD_PECAS: TIntegerField;
    cdsREFERENCIA: TStringField;
    cdsTIPO: TStringField;
    cdsUNIDADE_MEDIDA: TStringField;
    cdsKIT: TStringField;
    cdsTabelaSTATUS: TStringField;
    cdsCodPossiveisCODIGO: TIntegerField;
    cdsCodPossiveisCODCOR: TIntegerField;
    cdsCodPossiveisCOR: TStringField;
    cdsCodPossiveisCODGRADE: TIntegerField;
    cdsCodPossiveisGRADE: TStringField;
    cdsCodPossiveisCODTAMANHO: TIntegerField;
    cdsCodPossiveisTAM: TStringField;
    cdsCodPossiveisREFERENCIA: TStringField;
    cdsCodBarCODIGO: TIntegerField;
    cdsCodBarTIPO: TIntegerField;
    cdsCodBarNUMERACAO: TStringField;
    cdsCodBarCODPRODUTO: TIntegerField;
    cdsCodBarCODCOR: TIntegerField;
    cdsCodBarCODGRADE: TIntegerField;
    cdsCodBarCODTAMANHO: TIntegerField;
    cdsCodBarREFCOR: TStringField;
    cdsCodBarDESCCOR: TStringField;
    cdsCodBarDESCGRADE: TStringField;
    cdsCodBarDESCTAMANHO: TStringField;
    cdsCorSTATUS: TStringField;
    FDQuery1: TFDQuery;
    cdsTabelaCODIGO: TIntegerField;
    cdsTabelaPRECO: TBCDField;
    cdsTabelaPRECO_LIQ: TBCDField;
    cdsTabelaPRECO_ATACADO: TBCDField;
    cdsTabelaCODTABELA: TIntegerField;
    cdsTabelaDESCRICAO: TStringField;
    cdsCorCODIGO: TIntegerField;
    cdsCorCODCOR: TIntegerField;
    cdsCorDESCRICAO: TStringField;
    cdsCorREFERENCIA: TStringField;
    cdsCorGENERO: TStringField;
    cdsCODIGO_IBPT: TIntegerField;
    cdsEstoqueQTD_10: TIntegerField;
    cdsEstoqueQTD_12: TIntegerField;
    cdsEstoqueQTD_14: TIntegerField;
    BuscaCor2: TBuscaCor;
    CDSKitsREFPRO: TStringField;
    CDSKitsPRODUTO: TStringField;
    CDSKitsCODIGO: TIntegerField;
    CDSKitsCODIGO_KIT: TIntegerField;
    CDSKitsCODIGO_PRODUTO: TIntegerField;
    CDSKitsCODIGO_COR: TIntegerField;
    CDSKitsCOR: TStringField;
    CDSKitsREFCOR: TStringField;
    CDSKitsREMOVE: TStringField;
    FDQuery2: TFDQuery;
    CDSKitsINSERINDO: TStringField;
    edtDescricaoTipoCor: TEdit;
    Label29: TLabel;
    cdsDESC_TIPO_COR: TStringField;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncCorClick(Sender: TObject);
    procedure gridCoresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIncTabelaClick(Sender: TObject);
    procedure TabSheet4Exit(Sender: TObject);
    procedure cdsTabelaPRECO_ATACADOChange(Sender: TField);
    procedure cdsTabelaPRECO_LIQChange(Sender: TField);
    procedure cdsTabelaPRECOChange(Sender: TField);
    procedure GridTabelaPrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSheet5Enter(Sender: TObject);
    procedure gridReferenciasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnGeraCodBarClick(Sender: TObject);
    procedure edtLinhaEnter(Sender: TObject);
    procedure BuscaCor1btnBuscaClick(Sender: TObject);
    procedure gridProdutosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure radFiltroClick(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BuscaCor1Enter(Sender: TObject);
    procedure gridCoresDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pagProdutosChange(Sender: TObject);
    procedure rgTipoProdutoClick(Sender: TObject);
    procedure TabSheet6Enter(Sender: TObject);
    procedure BuscaCor1Exit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure gridReferenciasDblClick(Sender: TObject);
    procedure btnAddKitClick(Sender: TObject);
    procedure gridKitsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure comKitChange(Sender: TObject);
    procedure gridReferenciasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridReferenciasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Produto :TProduto;
    ProdutoCores :TProdutoCores;
    ProdutoTabelaPreco :TProdutoTabelaPreco;
    rep :TRepositorio;
    posicaoGrid :integer;
    FPressionado :Boolean;

    procedure habilita(SN:Boolean);
    procedure limpaCampos;
    procedure mostraDados;
    procedure salvar;
    procedure salvaCor;
    procedure salvaTabela;
    procedure salvaKit;
    function verificaObrigatorios :Boolean;
    procedure deletaVinculo(tabela,campo,valor :String);
    procedure verificaAlterouInseriuTabela;
    procedure verificaCodigosCriados;
    procedure salvaCodigoBarras;
    procedure alterar_genero_ProdutoCor;
    procedure removeKit;
    procedure selecionaDeseleciona;
    procedure deselecionaTodos;
    
  public
    { Public declarations }
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

const SQL_CODIGO_BARRAS = 'select p.codigo, pc.codcor, c.descricao cor, gt.codgrade, g.descricao grade, '+
                          'gt.codtamanho, t.descricao tam, c.referencia            from PRODUTOS P      '+
                          'inner join produto_cores pc on pc.codproduto = p.codigo                      '+
                          'inner join grade_tamanhos gt on gt.codgrade = p.cod_grade                    '+
                          'inner join cores c on c.codigo = pc.codcor                                   '+
                          'inner join grades g on g.codigo = gt.codgrade                                '+
                          'inner join tamanhos t on t.codigo = gt.codtamanho                            '+
                          'where p.codigo = :codpro                                                     ';

implementation

uses Math, FabricaRepositorio, StrUtils, uModulo, ProdutosKit;

{$R *.dfm}

procedure TfrmCadastroProduto.btnIncluirClick(Sender: TObject);
begin
  inherited;

  posicaoGrid := cds.RecNo;
  self.Tag := 1;
  limpaCampos;
  pagProdutos.ActivePageIndex := 0;
  gridProdutos.SetFocus;
  pagProdutos.ActivePageIndex := 1;
end;

procedure TfrmCadastroProduto.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not (cds.Active) or (cds.IsEmpty) then
    exit;

  posicaoGrid := cds.RecNo;
  self.Tag := 2;
  pagProdutos.ActivePageIndex := 0;
  gridProdutos.SetFocus;
  pagProdutos.ActivePageIndex := 1;
  pagProdutosChange(nil);
end;

procedure TfrmCadastroProduto.TabSheet1Exit(Sender: TObject);
begin
  if self.Tag <> 1 then begin
    cdsCor.Close;
    TFDQuery(dspCor.DataSet).ParamByName('codpro').AsInteger := cdsCODIGO.AsInteger;
    cdsCor.Open;
  end;

  if self.Tag <> 1 then begin
    cdsTabela.Close;
    TFDQuery(dspTabela.DataSet).ParamByName('codpro').AsInteger := cdsCODIGO.AsInteger;
    cdsTabela.Open;
  end;

//  TabSheet2Enter(nil);
  if not self.Tag = 1 then begin
    if (cdsCOD_TIPO.AsInteger    > 0) then  ListaTIpo.CodCampo    := cdsCOD_TIPO.AsInteger;
    if (cdsCOD_GRUPO.AsInteger   > 0) then  ListaGrupo.CodCampo   := cdsCOD_GRUPO.AsInteger;
    if (cdsCOD_COLECAO.AsInteger > 0) then  ListaColecao.CodCampo := cdsCOD_COLECAO.AsInteger;
    if (cdsCOD_GRADE.AsInteger   > 0) then  ListaGrade.CodCampo   := cdsCOD_GRADE.AsInteger;
  end;

  if not pagProdutos.Pages[1].Enabled then
    habilita(true);

  if (self.Tag <> 1) and not (cds.IsEmpty) then
      mostraDados;

  if not (self.Tag in [1,2]) then
    habilita(false)
  else begin
    habilita(true);
    
    if pagProdutos.ActivePageIndex = 1 then
      edtReferencia.SetFocus;
  end;

end;

procedure TfrmCadastroProduto.TabSheet2Enter(Sender: TObject);
begin
  inherited;


  {if Rep = nil then begin
    Rep     := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
    Cliente := TPessoa.Create;
  end;}
end;

procedure TfrmCadastroProduto.habilita(SN: Boolean);
begin

  btnIncluir.Enabled           := not SN;
  btnAlterar.Enabled           := not SN;
  btnCancelar.Enabled          := SN;
  btnSalvar.Enabled            := SN;
  pagProdutos.Pages[1].Enabled := SN;
  pagProdutos.Pages[2].Enabled := SN;
  pagProdutos.Pages[3].Enabled := SN;
  gridProdutos.Enabled         := not SN;

  if not SN then pagProdutos.ActivePageIndex := 0;

end;

procedure TfrmCadastroProduto.limpaCampos;
begin
  edtDescricao.Clear;
  edtLinha.clear;
  BuscaNcm1.edtDescricao.Clear;
  edtReferencia.Clear;
  comAtivo.ItemIndex                   := 0;
  BuscaNcm1.edtCodigo.Value            := 0;
  edtPrecoVenda.Value                  := 0;
  edtPrecoCusto.Value                  := 0;
  edtPrecoAtacado.Value                := 0;
  edtPrecoMedio.Value                  := 0;
  edtEstoqueFis.Value                  := 0;
  edtEstoqueMin.Value                  := 0;
  edtPesoLiq.Value                     := 0;
  edtPesoBru.Value                     := 0;
  edtPecas.AsInteger                   := 1;
  ListaTipo.comListaCampo.ItemIndex    := -1;
  ListaGrupo.comListaCampo.ItemIndex   := -1;
  ListaColecao.comListaCampo.ItemIndex := -1;
  ListaGrade.comListaCampo.ItemIndex   := -1;  
  cbGenero.ItemIndex                   := -1;
  rgTipoProduto.ItemIndex              := -1;
  cbUnidadeMedida.ItemIndex            := -1;
  comKit.Itemindex                     := 1;
  comKitChange(nil);
  comKit.Enabled                       := true;

  if cdsCodBar.Active       then  cdsCodBar.EmptyDataSet;
  if cdsCodPossiveis.Active then  cdsCodPossiveis.EmptyDataSet;
  if cdsTabela.Active       then  cdsTabela.EmptyDataSet;
  if cdsCor.Active          then  cdsCor.EmptyDataSet;
  if CDSKits.Active         then  CDSKits.EmptyDataSet;
  if cdsEstoque.Active      then  cdsEstoque.EmptyDataSet;

  BuscaProduto1.limpa;
  BuscaCor2.limpa;
end;

procedure TfrmCadastroProduto.mostraDados;
begin                      
  edtReferencia.Text        := cdsREFERENCIA.AsString;
  edtDescricao.text         := cdsDESCRICAO.AsString;
  edtLinha.text             := cdsLINHA_ANO.AsString;
  comAtivo.ItemIndex        := IfThen((cdsATIVO.AsString = 'N'),1,0);
  ListaTipo.CodCampo        := cdsCOD_TIPO.AsInteger;
  ListaGrupo.CodCampo       := cdsCOD_GRUPO.AsInteger;
  ListaColecao.CodCampo     := cdsCOD_COLECAO.AsInteger;
  ListaGrade.CodCampo       := cdsCOD_GRADE.AsInteger;

  if cdsCOD_NCM.AsInteger > 0 then
    BuscaNcm1.CodNcm      := cdsCOD_NCM.AsString;

  edtPrecoVenda.Value       := cdsPRECO_VENDA.AsFloat;
  edtPrecoCusto.Value       := cdsPRECO_CUSTO.AsFloat;
  edtPrecoAtacado.Value     := cdsPRECO_ATACADO.AsFloat;
  edtPrecoMedio.Value       := cdsPRECO_MEDIO.AsFloat;
  edtEstoqueFis.Value       := cdsESTOQUE_FIS.AsFloat;
  edtEstoqueMin.Value       := cdsESTOQUE_MIN.AsFloat;
  edtPesoLiq.Value          := cdsPESO_LIQ.AsFloat;
  edtPesoBru.Value          := cdsPESO_BRU.AsFloat;
  edtPecas.AsInteger        := cdsQTD_PECAS.AsInteger;
  rgTipoProduto.OnClick     := nil;
  rgTipoProduto.ItemIndex   := rgTipoProduto.Items.IndexOf( IfThen(cdsTIPO.asString = 'L','Lisa','Estampada') );
  rgTipoProduto.OnClick     := rgTipoProdutoClick;
  cbUnidadeMedida.ItemIndex := cbUnidadeMedida.Items.IndexOf( cdsUNIDADE_MEDIDA.AsString );
  comKit.ItemIndex          := IfThen((cdsKIT.AsString = 'S'),0,1);
  comKitChange(nil);
  edtDescricaoTipoCor.Text  := cdsDESC_TIPO_COR.AsString;

  if CDSKits.active then
    CDSKits.EmptyDataSet;

  if cdsKIT.AsString = 'S' then
  begin
    CDSKits.Close;
    TFDQuery(DSPKits.DataSet).ParamByName('cod_kit').AsInteger := cdsCODIGO.AsInteger;
    CDSKits.Open;
  end;

  comKit.Enabled := CDSKits.isEmpty;

end;

procedure TfrmCadastroProduto.FormShow(Sender: TObject);
begin
  inherited;
  BuscaCor2.ApareceKits := 'N';
//  CDSKits.CreateDataSet;


  pagProdutos.ActivePageIndex := 0;

  cds.Close;
  dsp.DataSet := FDM.GetConsulta('select * from produtos');
  cds.Open;

  cdsCor.Close;
  dspCor.DataSet := FDM.GetConsulta('select pc.codigo, c.codigo codcor ,c.descricao, c.referencia, pc.genero   '+
                                    ' from cores c                                                             '+
                                    ' left join produto_cores pc on c.codigo = pc.codcor                       '+
                                    ' where pc.codproduto = :codpro                                            ');

  cdsTabela.Close;
  dspTabela.DataSet := FDM.GetConsulta('select pt.codigo, pt.preco, pt.preco_liq, pt.preco_atacado, tp.codigo codtabela, '+
                                       'tp.descricao      from  tabelas_preco tp                                         '+
                                       'left join produto_tabela_preco pt on tp.codigo = pt.codtabela                    '+
                                       'where pt.codproduto = :codpro                                                    ');

  {  seleciona os codigos de barra já criados para o produto  }
  cdsCodBar.Close;

  dspCodBar.DataSet := FDM.GetConsulta('select cb.*, c.referencia refcor, c.descricao descCor, g.descricao descGrade, t.descricao descTamanho from codigo_barras cb '+
                                       ' inner join produtos p on p.codigo = cb.codproduto                                                                          '+
                                       ' inner join cores c on c.codigo = cb.codcor                                                                                 '+
                                       ' inner join grades g on g.codigo = cb.codgrade                                                                              '+
                                       ' inner join tamanhos t on t.codigo = cb.codtamanho                                                                          '+
                                       ' where cb.codproduto = :codpro                                                                                              ');

  {  Seleciona as possiveis combinações de referencia pro produto com base na grade e nas cores associadas a ele  }
  cdsCodPossiveis.Close;
  dspCodPossiveis.DataSet := FDM.GetConsulta(SQL_CODIGO_BARRAS);

  CDSKits.Close;
  DSPKits.DataSet := FDM.GetConsulta('SELECT pro.referencia refpro, pro.descricao produto, pk.*,  '+
                                     ' cor.descricao cor, cor.referencia refcor                   '+
                                     ' FROM PRODUTOS_KIT pk                                       '+
                                     ' left join produtos pro on pro.codigo = pk.codigo_produto   '+
                                     ' left join cores cor on cor.codigo = pk.codigo_cor          '+
                                     ' where codigo_kit = :cod_kit                                ');

  ListaTipo.setValores('select * from tipo_produto', 'descricao','Tipo');
  ListaTipo.executa;

  ListaGrupo.setValores('select * from grupo', 'descricao','Grupo');
  ListaGrupo.executa;

  ListaColecao.setValores('select * from colecao', 'descricao','Coleção');
  ListaColecao.executa;

  ListaGrade.setValores('select * from grades', 'descricao','Tamanho');
  ListaGrade.executa;

  gridProdutos.SetFocus;
end;

procedure TfrmCadastroProduto.btnCancelarClick(Sender: TObject);
begin
  inherited;
  self.habilita(false);
  self.Tag := 0;
  limpaCampos;

  gridProdutos.SetFocus;
  FreeAndNil(Produto);
  FreeAndNil(Rep);
end;

procedure TfrmCadastroProduto.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if verificaObrigatorios then
    salvar;
end;

procedure TfrmCadastroProduto.salvar;
begin

  Rep     := TFabricaRepositorio.GetRepositorio(TProduto.ClassName);

  if Produto = nil then   Produto := TProduto.Create;

  if self.Tag = 2 then
    Produto.Codigo := cdsCODIGO.AsInteger;

  Produto.Referencia    := edtReferencia.Text;  
  Produto.Descricao     := trim(edtDescricao.Text);
  Produto.Cod_Ncm       := BuscaNcm1.edtCodigo.AsInteger;
  Produto.Cod_tipo      := ListaTipo.CodCampo;
  Produto.Cod_Grupo     := ListaGrupo.CodCampo;
  Produto.Cod_Colecao   := ListaColecao.CodCampo;
  Produto.Cod_Grade     := ListaGrade.CodCampo;
  Produto.Linha_ano     := edtLinha.Text;
  Produto.PrecoVenda    := edtPrecoVenda.Value;
  Produto.PrecoCusto    := edtPrecoCusto.Value;
  Produto.PrecoAtacado  := edtPrecoAtacado.Value;
  Produto.PrecoMedio    := edtPrecoMedio.Value;
  Produto.EstoqueFis    := edtEstoqueFis.AsInteger;
  Produto.EstoqueMin    := edtEstoqueMin.AsInteger;
  Produto.PesoLiq       := edtPesoLiq.Value;
  pRODUTO.PesoBru       := edtPesoBru.Value;
  Produto.Qtd_Pecas     := edtPecas.AsInteger;
  Produto.Ativo         := (comAtivo.ItemIndex = 0);
  Produto.Tipo          := copy(rgTipoProduto.Items[rgTipoProduto.ItemIndex],1,1);
  Produto.UnidadeMedida := cbUnidadeMedida.Items[cbUnidadeMedida.ItemIndex];
  Produto.Kit           := (comKit.ItemIndex = 0);
  Produto.descricaoTipoCor := edtDescricaoTipoCor.Text;

  rep.Salvar(Produto);

  if Produto.Kit then
    salvaKit;

  salvaCor;
  salvaTabela;

  cds.Close;
  cds.Open;

  btnCancelar.Click;

  avisar('Operação realizada com sucesso!');
  cds.RecNo := posicaoGrid;
end;

function TfrmCadastroProduto.verificaObrigatorios: Boolean;
begin
  Result := false;

  if (edtDescricao.Text = '') then begin
    avisar('Favor informar uma descrição para o produto');
    edtDescricao.SetFocus;
  end
{  else if edtPrecoVenda.Value <= 0 then begin
    avisar('Favor informar um preço de venda para o produto');
    edtPrecoVenda.SetFocus;
    Result := false;
  end  }
  else if edtReferencia.text = '' then begin
    avisar('Favor informar uma referência para o produto');
    edtReferencia.SetFocus;
  end
  else if ListaGrade.CodCampo < 1 then begin
    avisar('Favor informar o tamanho do produto');
    ListaGrade.SetFocus;
  end
  else if ListaGrupo.CodCampo < 1 then begin
    avisar('Favor informar o grupo que o produto pertence');
    ListaGrupo.SetFocus;
  end
  else if BuscaNcm1.edtDescricao.Text = '' then begin
    avisar('Favor informar a NCM referente ao produto');
    BuscaNcm1.edtCodigo.SetFocus;
  end
  else if rgTipoProduto.ItemIndex < 0 then begin
    avisar('Favor informar o tipo do produto');
    rgTipoProduto.SetFocus;
  end
  else if (comKit.ItemIndex = 0) and (not (CDSKits.active) or (CDSKits.RecordCount < 2)) then begin
    avisar('Um Kit deve conter no mínimo dois produtos');
    pagProdutos.ActivePageIndex := 1;
    BuscaProduto1.edtReferencia.SetFocus;
  end
  else if (cbUnidadeMedida.ItemIndex < 0) then begin
    avisar('A unidade de medida do produto deve ser informada');
    cbUnidadeMedida.SetFocus;
  end
  else
    Result := true;
end;

procedure TfrmCadastroProduto.btnIncCorClick(Sender: TObject);
begin
  inherited;
  if BuscaCor1.edtDescricao.Text <> '' then begin

    if (cbGenero.ItemIndex < 0) and (rgTipoProduto.ItemIndex = 1) and (cbGenero.Enabled) then begin
      avisar('Favor informar o gênero desta cor, para este produto');
      cbGenero.SetFocus;
      exit;
    end;

    if not (cdsCor.Active) then
      cdsCor.CreateDataSet;

    if (cdsCor.Locate('CODCOR',BuscaCor1.edtCodigo.AsInteger,[])) then begin
      cdsCor.Edit;
    end
    else
    begin
      cdsCor.Append;
      cdsCorCodigo.AsInteger    := (cdsCor.RecordCount + 1) * -1;
    end;

    cdsCorDESCRICAO.AsString  := trim(BuscaCor1.edtDescricao.Text);
    cdsCorREFERENCIA.AsString := BuscaCor1.edtReferencia.Text;
    cdsCorCODCOR.AsInteger    := BuscaCor1.edtCodigo.AsInteger;
    cdsCorSTATUS.AsString     := 'I';
    cdsCorGENERO.AsString     := copy(cbGenero.Items[cbGenero.itemIndex],1,1);
    cdsCor.Post;

    if not BuscaCor1.Enabled then  BuscaCor1.Enabled := true;

    BuscaCor1.limpa;
    cbGenero.ItemIndex := -1;

  end;
end;

procedure TfrmCadastroProduto.gridCoresKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = Vk_Delete) and (cdsCor.Active) and not (cdsCor.IsEmpty) then begin
    if confirma('Deseja remover vinculo do produto com a cor '''+cdsCorCodigo.AsString+' - '+cdsCorDescricao.AsString+'?''') then begin
      deletaVinculo('produto_cores','codigo',cdsCorCODIGO.asString);
      cdsCor.Delete;
    end;
  end
  else if key = VK_F8 then
    alterar_genero_ProdutoCor;
end;

procedure TfrmCadastroProduto.salvaCor;
begin
  if not (cdsCor.Active) or (cdsCor.IsEmpty) then Exit;
  
  Rep     := TFabricaRepositorio.GetRepositorio(TProdutoCores.ClassName);

  if (ProdutoCores = nil) then   ProdutoCores := TProdutoCores.Create;

  cdsCor.First;
  while not cdsCor.Eof do begin

    if cdsCorSTATUS.AsString = 'I' then begin

      ProdutoCores.Codigo     := IfThen(cdsCorCODIGO.AsInteger < 0, 0, cdsCorCODIGO.AsInteger );

      if self.Tag = 1 then
        ProdutoCores.CodProduto := fdm.GetValorGenerator('GEN_PRODUTOS_ID')
      else
        ProdutoCores.CodProduto := cdsCODIGO.AsInteger;

      ProdutoCores.CodCor     := cdsCorCODCOR.AsInteger;
      ProdutoCores.genero     := copy(cdsCorGENERO.AsString,1,1);

      Rep.Salvar(ProdutoCores);

    end;

    cdsCor.Next;
  end;

end;

procedure TfrmCadastroProduto.deletaVinculo(tabela,campo,valor :String);
begin
  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'delete from '+tabela+' where '+campo+' = '+valor;
  fdm.qryGenerica.ExecSQL;
end;

procedure TfrmCadastroProduto.deselecionaTodos;
var vMarcacao :integer;
begin
  vMarcacao := cdsCodPossiveis.RecNo;
  cdsCodPossiveis.DisableControls;
  cdsCodPossiveis.First;
  while not cdsCodPossiveis.Eof do
  begin
    cdsCodPossiveis.Edit;
    cdsCodPossiveisTAG.AsString := '';
    cdsCodPossiveis.Post;

    cdsCodPossiveis.Next;
  end;
  cdsCodPossiveis.RecNo := vMarcacao;
  cdsCodPossiveis.EnableControls;
end;

procedure TfrmCadastroProduto.btnIncTabelaClick(Sender: TObject);
begin
  inherited;
  if BuscaTabelaPreco1.edtDescricao.Text <> '' then begin

    if (cdsTabela.Active) and (cdsTabela.Locate('CODTABELA',BuscaTabelaPreco1.edtCodigo.AsInteger,[])) then begin
      avisar('Tabela selecionada já está vinculada a esse produto!');
      BuscaTabelaPreco1.limpa;
      BuscaTabelaPreco1.edtCodigo.SetFocus;
      exit;
    end;

    if not cdsTabela.Active then
      cdsTabela.CreateDataSet;

    cdsTabela.Append;
    cdsTabelaCODIGO.AsInteger         := (cdsTabela.RecordCount + 1) * -1;
    cdsTabelaCODTABELA.AsInteger      := BuscaTabelaPreco1.edtCodigo.AsInteger;
    cdsTabelaDESCRICAO.AsString       := BuscaTabelaPreco1.edtDescricao.Text;
    cdsTabelaPRECO.AsCurrency         := 0;
    cdsTabelaPRECO_LIQ.AsCurrency     := 0;
    cdsTabelaPRECO_ATACADO.AsCurrency := 0;
    cdsTabelaSTATUS.AsString          := 'I';
    cdsTabela.Post;

    BuscaTabelaPreco1.limpa;

  end;
end;

procedure TfrmCadastroProduto.salvaTabela;
begin
  if not (cdsTabela.Active) or (cdsTabela.IsEmpty) then Exit;

  Rep     := TFabricaRepositorio.GetRepositorio(TProdutoTabelaPreco.ClassName);
  if (ProdutoTabelaPreco = nil) then   ProdutoTabelaPreco := TProdutoTabelaPreco.Create;
  
  cdsTabela.First;

  while not cdsTabela.Eof do begin

    if (cdsTabelaSTATUS.AsString = 'I') or (cdsTabelaSTATUS.AsString = 'A') then begin

       if cdsTabelaSTATUS.AsString = 'I' then
           ProdutoTabelaPreco.Codigo  := 0
       else
         ProdutoTabelaPreco.Codigo  := IfThen(cdsTabelaCODIGO.AsInteger < 0, 0,cdsTabelaCODIGO.AsInteger);

       if self.Tag = 1 then
         ProdutoTabelaPreco.CodProduto  := fdm.GetValorGenerator('GEN_PRODUTOS_ID')
       else
         ProdutoTabelaPreco.CodProduto    := cdsCODIGO.AsInteger;

       ProdutoTabelaPreco.CodTabela     := cdsTabelaCODTABELA.AsInteger;
       ProdutoTabelaPreco.Preco         := cdsTabelaPRECO.AsCurrency;
       ProdutoTabelaPreco.Preco_Liq     := cdsTabelaPRECO_LIQ.AsCurrency;
       ProdutoTabelaPreco.Preco_Atacado := cdsTabelaPRECO_ATACADO.AsCurrency;

       Rep.Salvar(ProdutoTabelaPreco);

    end;

    cdsTabela.Next;
  end;
end;

procedure TfrmCadastroProduto.selecionaDeseleciona;
begin
  cdsCodPossiveis.Edit;
  cdsCodPossiveisTAG.AsString := IfThen(cdsCodPossiveisTAG.AsString = '', 'x','');
  cdsCodPossiveis.Post;
end;

procedure TfrmCadastroProduto.TabSheet4Exit(Sender: TObject);
begin
  verificaAlterouInseriuTabela;
end;

procedure TfrmCadastroProduto.cdsTabelaPRECO_ATACADOChange(Sender: TField);
begin
  if not (cdsTabelaSTATUS.AsString = 'I') then
    cdsTabelaSTATUS.AsString := 'A';
end;

procedure TfrmCadastroProduto.cdsTabelaPRECO_LIQChange(Sender: TField);
begin
  if not (cdsTabelaSTATUS.AsString = 'I') then
    cdsTabelaSTATUS.AsString := 'A';
end;

procedure TfrmCadastroProduto.cdsTabelaPRECOChange(Sender: TField);
begin
  if not (cdsTabelaSTATUS.AsString = 'I') then
    cdsTabelaSTATUS.AsString := 'A';
end;

procedure TfrmCadastroProduto.verificaAlterouInseriuTabela;
begin

end;

procedure TfrmCadastroProduto.GridTabelaPrecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = Vk_Delete) and (cdsCor.Active) and not (cdsCor.IsEmpty) then
    if confirma('Deseja remover vinculo do produto com a tabela '''+cdsTabelaCODIGO.AsString+' - '+cdsTabelaDESCRICAO.AsString+'?''') then begin
      deletaVinculo('produto_tabela_preco','codigo',cdsTabelaCODIGO.asString);
      cdsTabela.Delete;
    end;
end;

procedure TfrmCadastroProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  verificaAlterouInseriuTabela;
end;

procedure TfrmCadastroProduto.TabSheet5Enter(Sender: TObject);
begin
  inherited;
  if self.Tag <> 1 then begin
    TabSheet5.Enabled := true;

    cdsCodPossiveis.Filtered := false;

    cdsCodBar.Close;
    TFDQuery(dspCodBar.DataSet).ParamByName('codpro').AsInteger := cdsCODIGO.AsInteger;
    cdsCodBar.Open;

    lbRegistros.Caption := intToStr(cdsCodBar.RecordCount) + ' Registro(s) encontrado(s)';

    labQtdRegistros.Caption := 'Quantidade de registros: '+intToStr(cdsCodBar.RecordCount);

    cdsCodPossiveis.Close;
    TFDQuery(dspCodPossiveis.DataSet).SQL.Text := SQL_CODIGO_BARRAS;

    {se <> de ACESSORIO, bloqueia cod barra para masculino e feminino}
    if ListaTipo.comListaCampo.Items[ ListaTipo.comListaCampo.ItemIndex ] <> 'ACESSORIO' then
      TFDQuery(dspCodPossiveis.DataSet).SQL.Add(' and c.descricao not in(''MASCULINO'',''FEMININO'') ');

    TFDQuery(dspCodPossiveis.DataSet).ParamByName('codpro').AsInteger := cdsCODIGO.AsInteger;
    cdsCodPossiveis.Open;

    edtTotRef.Text := intToStr(cdsCodPossiveis.RecordCount);

    verificaCodigosCriados;
  end
  else
    TabSheet5.Enabled := false;
end;

procedure TfrmCadastroProduto.verificaCodigosCriados;
var criados, combinacoesPossiveis :integer;
begin
  if not (cdsCodPossiveis.Active) or not (cdsCodBar.Active) then
    exit;

  cdsCodBar.First;
  criados := 0;
  combinacoesPossiveis := cdsCodPossiveis.RecordCount;

  cdsCodBar.DisableControls;
  while not cdsCodBar.Eof do begin

    if cdsCodPossiveis.Locate('CODCOR;CODTAMANHO', VarArrayOf([cdsCodBarCODCOR.AsInteger, cdsCodBarCODTAMANHO.AsInteger]), []) then begin
      cdsCodPossiveis.Edit;
      cdsCodPossiveisSTATUS.AsString := 'C';
      cdsCodPossiveis.Post;
      inc(criados);
    end;

    cdsCodBar.Next;
  end;
  cdsCodBar.EnableControls;

  cdsCodBar.First;
  cdsCodPossiveis.First;

  edtComCodigo.Text := intToStr(criados);
  edtSemCodigo.Text := intToStr(combinacoesPossiveis - criados);

  radFiltroClick(nil);
end;

procedure TfrmCadastroProduto.gridReferenciasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  if cdsCodPossiveisTAG.AsString = 'x' then
    gridReferencias.Canvas.Brush.Color:= $00F5DBBA
  else
    gridReferencias.Canvas.Brush.Color:= clBtnFace;

  gridReferencias.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if Column.Field = cdsCodPossiveisSTATUS then begin
    TDBGridCBN(Sender).Canvas.FillRect(Rect);

    if cdsCodPossiveisSTATUS.asString = 'C' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +28, Rect.Top , 0, true)
    else
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +28, Rect.Top , 1, true);
  end;

end;

procedure TfrmCadastroProduto.gridReferenciasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //16 shift - 38 cima - 40 baixo
  if((ssShift in Shift) and (key in [38,40])) then
  begin
     if not FPressionado then
     begin
       deselecionaTodos;
       FPressionado := true;
     end;

     selecionaDeseleciona;
  end;
end;

procedure TfrmCadastroProduto.gridReferenciasKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 16) then begin
    FPressionado := false;
    selecionaDeseleciona;
  end;
end;

procedure TfrmCadastroProduto.btnGeraCodBarClick(Sender: TObject);
var linha :integer;
begin
  linha := cdsCodPossiveis.RecNo;

  try
  cdsCodPossiveis.Filtered := false;
  cdsCodPossiveis.Filter   := 'TAG = ''x'' ';
  cdsCodPossiveis.Filtered := true;

  if cdsCodPossiveis.IsEmpty then begin
    avisar('Nenhuma referência foi selecionada.');
    Exit;
  end;

  if (cdsCodPossiveisSTATUS.AsString = 'C') or not (confirma('Deseja realmente gerar um código de barras para o produto selecionado?')) then
    exit;

  salvaCodigoBarras;

  finally
    cdsCodPossiveis.Filtered := false;
    cdsCodPossiveis.RecNo    := linha;
  end;
end;

procedure TfrmCadastroProduto.salvaCodigoBarras;
var CodigoBarras :TCodigoBarras;
begin
  CodigoBarras := nil;
  Rep          := TFabricaRepositorio.GetRepositorio(TCodigoBarras.ClassName);


  while not cdsCodPossiveis.Eof do begin
    CodigoBarras            := TCodigoBarras.Create;
    try
      CodigoBarras.Tipo       := 1;
      CodigoBarras.Numeracao  := CodigoBarras.SequenciaCodBar;

      if CodigoBarras.Numeracao = '' then begin
        avisar('Todos os códigos de barra disponíveis já foram utilizados.');
        exit;
      end;

      CodigoBarras.CodProduto := cdsCODIGO.AsInteger;
      CodigoBarras.CodCor     := cdsCodPossiveisCODCOR.AsInteger;
      CodigoBarras.CodGrade   := cdsCodPossiveisCODGRADE.AsInteger;
      CodigoBarras.CodTamanho := cdsCodPossiveisCODTAMANHO.AsInteger;

      Rep.Salvar(CodigoBarras);

    finally
      FreeAndNil(CodigoBarras);
    end;

    cdsCodPossiveis.Next;
  end;

  avisar('Código de barras gerado com sucesso!');
  TabSheet5Enter(nil);

end;

procedure TfrmCadastroProduto.edtLinhaEnter(Sender: TObject);
begin
  inherited;
  if edtLinha.Text = '' then
    edtLinha.Text := FormatDateTime('yyyy',date);
end;

procedure TfrmCadastroProduto.BuscaCor1btnBuscaClick(Sender: TObject);
begin
  inherited;
  BuscaCor1.btnBuscaClick(Sender);

end;

procedure TfrmCadastroProduto.gridProdutosDrawColumnCell(Sender:TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsATIVO then begin
    TDBGridCBN(Sender).Canvas.FillRect(Rect);

    if cdsATIVO.asString = 'N' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +12, Rect.Top , 2, true)
    else
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +12, Rect.Top , 3, true);
  end;

end;

procedure TfrmCadastroProduto.radFiltroClick(Sender: TObject);
begin
  if (radFiltro.ItemIndex = 0) and (cdsCodPossiveis.Filtered) then begin
    cdsCodPossiveis.Filtered := false;
    verificaCodigosCriados;
  end
  else if radFiltro.ItemIndex = 1 then begin
    cdsCodPossiveis.Filtered := false;
    cdsCodPossiveis.Filter := 'STATUS is null';
    cdsCodPossiveis.Filtered := true;
  end
  else if radFiltro.ItemIndex = 2 then begin
    cdsCodPossiveis.Filtered := false;
    cdsCodPossiveis.Filter := 'STATUS = ''C''';
    cdsCodPossiveis.Filtered := true;
  end;

  if pagCodBar.ActivePageIndex = 1 then
    gridReferencias.SetFocus;
end;

procedure TfrmCadastroProduto.cdsAfterScroll(DataSet: TDataSet);
begin
  self.Caption := 'Cadastro de Produtos              '+ cdsREFERENCIA.AsString + ' - ' + cdsDESCRICAO.AsString;
end;

procedure TfrmCadastroProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F1 then
    pagProdutos.ActivePageIndex := 0
  else if key = VK_F2 then
    pagProdutos.ActivePageIndex := 1
  else if (key = VK_F3)and(btnIncluir.Enabled) then
    btnIncluir.Click
  else if (key = VK_F4)and(btnAlterar.Enabled) then
    btnAlterar.Click;
end;

procedure TfrmCadastroProduto.BitBtn1Click(Sender: TObject);
begin
  if not confirma('Deseja remover o codigo de barras da referencia a seguir?'+#13#10+#13#10+
                  '[ Produto ] ' + TRIM( cdsDESCRICAO.AsString )+#13#10+
                  '[ Cor ] ' + TRIM( cdsCodBarDESCCOR.AsString + '  [ Tamanho ] '+cdsCodBarDESCTAMANHO.AsString))
  then EXIT;

  Rep     := TFabricaRepositorio.GetRepositorio(TCodigoBarras.ClassName);

  Rep.RemoverPorIdentificador(cdsCodBarCODIGO.AsInteger);

  TabSheet5Enter(nil);
end;

procedure TfrmCadastroProduto.BuscaCor1Enter(Sender: TObject);
begin
  BuscaCor1.FiltroTipo   := copy(rgTipoProduto.Items[rgTipoProduto.ItemIndex],1,1);
  if (BuscaCor1.FiltroTipo = 'E') and (ListaTipo.comListaCampo.Text = 'ACESSORIO') then
    BuscaCor1.FiltroTipo := '';

  cbGenero.Enabled := (rgTipoProduto.ItemIndex = 1);  

end;

procedure TfrmCadastroProduto.alterar_genero_ProdutoCor;
begin
  if rgTipoProduto.ItemIndex = 0 then begin
    avisar('Proutos com cores lisas não vinculam gênero');
    exit;
  end;

  if not (cdsCor.Active) or (cdsCor.IsEmpty) then Exit;
                                                            
  BuscaCor1.Enabled  := false;
  BuscaCor1.codCor   := cdsCorREFERENCIA.AsString;
  cbGenero.ItemIndex := cbGenero.Items.IndexOf( IfThen(cdsCorGENERO.AsString = 'F','FEMININO','MASCULINO'));
  cbGenero.SetFocus;
end;

procedure TfrmCadastroProduto.gridCoresDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.Field = cdsCorGENERO then begin
    TDBGridCBN(Sender).Canvas.FillRect(Rect);

    if cdsCorGENERO.asString = 'F' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +12, Rect.Top , 4, true)
    else if cdsCorGENERO.AsString = 'M' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +12, Rect.Top , 5, true);
  end;
end;

procedure TfrmCadastroProduto.pagProdutosChange(Sender: TObject);
begin
  inherited;
  btnImprimir.Visible:= False;
  if self.pagProdutos.ActivePageIndex = 1
   then
     TabSheet2Enter(nil)
  else if self.pagProdutos.ActivePageIndex = 4
   then
     TabSheet5Enter(nil)
  else if self.pagProdutos.ActivePageIndex = 5
   then
   begin
     TabSheet6Enter(nil);
     btnImprimir.Visible:= True;
   end;
end;

procedure TfrmCadastroProduto.rgTipoProdutoClick(Sender: TObject);
begin
  if (cdsCor.Active) and not (cdsCor.IsEmpty) then begin
    avisar('O tipo do produto não pode ser alterado, pois já existe ao menos uma cor associada ao mesmo.');

    rgTipoProduto.OnClick := nil;

    if rgTipoProduto.ItemIndex = 0 then
      rgTipoProduto.ItemIndex := 1
    else
      rgTipoProduto.ItemIndex := 0;

    rgTipoProduto.OnClick := rgTipoProdutoClick;  
  end;

  edtDescricaoTipoCor.SetFocus;
  inherited;
end;

procedure TfrmCadastroProduto.TabSheet6Enter(Sender: TObject);
var i : integer;
    EstoqueTotal: Currency;
    cor : String;
begin
  inherited;
  if not cdsEstoque.Active then cdsEstoque.CreateDataSet;

  cdsEstoque.EmptyDataSet;

  cor := '';
  edtEstoqueTotal.Text:= '0';
  EstoqueTotal:= 0;

  dm.qryGenerica.Close;
  dm.qryGenerica.SQL.Text := 'SELECT PRODUTOS.REFERENCIA||'' - ''||PRODUTOS.DESCRICAO AS PRODUTO,'+
                             'cor.referencia ,cor.descricao COR, tam.descricao TAMANHO, es.quantidade FROM ESTOQUE es '+
                             'left JOIN produtos on PRODUTOS.CODIGO = es.CODIGO_PRODUTO '+
                             'left join tamanhos tam on tam.codigo = es.codigo_tamanho                       '+
                             'left join cores    cor on cor.codigo = es.codigo_cor                           '+
                             'WHERE CODIGO_PRODUTO = :CODPRO                                                 '+
                             'order by codigo_cor                                                            ';
  dm.qryGenerica.ParamByName('codpro').AsInteger := cdsCODIGO.AsInteger;
  dm.qryGenerica.Open;

  if dm.qryGenerica.IsEmpty then EXIT;

  dm.qryGenerica.First;
  while not dm.qryGenerica.Eof do begin

    if (cor <> dm.qryGenerica.fieldByName('COR').AsString) then
      cdsEstoque.Append
    else
      cdsEstoque.Edit;

    cdsEstoquePRODUTO.AsString    := dm.qryGenerica.fieldByName('PRODUTO').AsString;
    cdsEstoqueCOR.AsString        := dm.qryGenerica.fieldByName('COR').AsString;
    cdsEstoqueREFERENCIA.AsString := dm.qryGenerica.fieldByName('referencia').AsString;

    for i := 1 to cdsEstoque.Fields.Count - 1 do begin

      if cdsEstoque.Fields[i].FieldName = 'QTD_'+dm.qryGenerica.fieldByName('TAMANHO').AsString then begin
        cdsEstoque.Fields[i].AsFloat := cdsEstoque.Fields[i].AsFloat + dm.qryGenerica.fieldByName('QUANTIDADE').AsFloat;
        cdsEstoqueQTD_TOTAL.AsFloat  := cdsEstoqueQTD_TOTAL.AsFloat + dm.qryGenerica.fieldByName('QUANTIDADE').AsFloat;
        Break;
      end;

    end;

    cdsEstoque.Post;
    EstoqueTotal:= EstoqueTotal + dm.qryGenerica.fieldByName('QUANTIDADE').AsFloat;
    cor := dm.qryGenerica.fieldByName('COR').AsString;
    dm.qryGenerica.Next;
  end;
  edtEstoqueTotal.Text:= CurrToStr(EstoqueTotal);
end;

procedure TfrmCadastroProduto.BuscaCor1Exit(Sender: TObject);
begin
  if BuscaCor1.tipo = 'L' then begin
    cbGenero.ItemIndex := -1;
    cbGenero.Enabled   := false;
  end
  else begin
    cbGenero.Enabled   := true;
    cbGenero.SetFocus;
  end;
end;

procedure TfrmCadastroProduto.btnImprimirClick(Sender: TObject);
begin
  inherited;
  cdsEstoque.DisableControls;
  RLReport1.PreviewModal;
  cdsEstoque.EnableControls;
end;

procedure TfrmCadastroProduto.gridReferenciasDblClick(Sender: TObject);
begin
  if not (cdsCodPossiveis.Active) or (cdsCodPossiveis.IsEmpty) or (cdsCodPossiveisSTATUS.AsString = 'C') then
    Exit;

  selecionaDeseleciona;
end;

procedure TfrmCadastroProduto.btnAddKitClick(Sender: TObject);
begin
  if BuscaProduto1.edtReferencia.Text = '' then
  begin
    avisar('O produdo não foi informado');
    BuscaProduto1.edtReferencia.SetFocus;
    exit;
  end
  else if BuscaCor2.edtReferencia.Text = '' then
  begin
    avisar('A cor não foi informada');
    BuscaCor2.edtReferencia.SetFocus;
    exit;
  end;

  if not CDSKits.active then
    CDSKits.CreateDataSet;

  if (CDSKits.isEmpty) or not CDSKits.Locate('CODIGO_PRODUTO;CODIGO_COR', varArrayOf([BuscaProduto1.CodigoProduto, BuscaCor2.codCor]), []) then
  begin
    CDSKits.Append;
    CDSKitsCODIGO.AsInteger         := (CDSKits.RecordCount + 1)*-1;
    CDSKitsCODIGO_PRODUTO.AsInteger := BuscaProduto1.CodigoProduto;
    CDSKitsREFPRO.AsString          := BuscaProduto1.edtReferencia.Text;
    CDSKitsPRODUTO.AsString         := BuscaProduto1.edtDescricao.Text;
    CDSKitsCODIGO_COR.AsInteger     := BuscaCor2.CodigoCor;
    CDSKitsREFCOR.AsString          := BuscaCor2.edtReferencia.Text;
    CDSKitsCOR.AsString             := BuscaCor2.edtDescricao.Text;
    CDSKits.Post;
  end;

  BuscaProduto1.limpa;
  BuscaCor2.limpa;
  BuscaProduto1.edtReferencia.SetFocus;

  comKit.Enabled := CDSKits.isEmpty;
end;

procedure TfrmCadastroProduto.salvaKit;
var repositorio :TRepositorio;
    Kits        :TProdutosKit;
begin
  repositorio := nil;
  Kits        := nil;
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TProdutosKit.ClassName);

    CDSKits.Filtered := false;
    CDSKits.First;
    while not cdsKits.Eof do begin

      if (CDSKitsCODIGO.AsInteger > 0) then begin
        if (CDSKitsREMOVE.AsString = 'S') then begin
          Kits := TProdutosKit(repositorio.Get(CDSKitsCODIGO.AsInteger));
          repositorio.Remover(Kits);
        end
        else begin
          CDSKits.Next;
          continue;
        end;
      end
      else begin
        Kits := TProdutosKit.Create;

        if self.Tag = 1 then
          Kits.codigo_kit     := fdm.GetValorGenerator('GEN_PRODUTOS_ID')
        else
          Kits.codigo_kit     := cdsCODIGO.AsInteger;

        Kits.codigo_produto := CDSKitsCODIGO_PRODUTO.AsInteger;
        Kits.codigo_cor     := CDSKitsCODIGO_COR.AsInteger;

        repositorio.Salvar(Kits);
      end;

      CDSKits.Next;
    end;

   CDSKits.Filter   := 'not (REMOVE = ''S'') ';
   CDSKits.Filtered := true;

  finally
    FreeAndNil(repositorio);
    FreeAndNil(Kits);
  end;
end;

procedure TfrmCadastroProduto.gridKitsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not(cdsKits.isEmpty) and (key = VK_DELETE) then
    removeKit;
end;

procedure TfrmCadastroProduto.removeKit;
begin
  if not confirma('Confirma remoção?') then
    exit;

  if CDSKitsCODIGO.AsInteger = 0 then
    CDSKits.Delete
  else begin
    CDSKits.Edit;
    CDSKitsREMOVE.AsString := 'S';
    CDSKits.Post;

    CDSKits.Filtered := false;
    CDSKits.Filter   := 'not (REMOVE = ''S'') ';
    CDSKits.Filtered := true;
  end;

  comKit.Enabled := CDSKits.isEmpty;
end;

procedure TfrmCadastroProduto.comKitChange(Sender: TObject);
begin
  BuscaProduto1.visible := comKit.ItemIndex = 0;
  BuscaCor2.Visible     := comKit.ItemIndex = 0;
  btnAddKit.visible     := comKit.ItemIndex = 0;
  gridKits.visible      := comKit.ItemIndex = 0;
end;

end.

