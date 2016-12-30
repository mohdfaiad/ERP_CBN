unit uRelatorioVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, frameBuscaPessoa, Buttons, ExtCtrls,
  RLReport, DB, tipoPessoa,
  RLPDFFilter, RLFilters, RLXLSFilter, ImgList, Grids, DBGrids, DBGridCBN,
  Mask, DBCtrls, Provider, DBClient, Repositorio, frameBuscaProduto,
  frameBuscaCor, System.ImageList, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, StringUtilitario, VCL.FileCtrl, Vcl.Menus;
                       
type
  TfrmRelatorioVendas = class(TfrmPadrao)
    DataSource1: TDataSource;
    RLXLSFilter1: TRLXLSFilter;
    RLPDFFilter1: TRLPDFFilter;
    ImageList1: TImageList;
    cds: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    cdsTOT_DESCONTO: TAggregateField;
    cdsTOT_VALOR: TAggregateField;
    pnlTopo: TPanel;
    gpbRepresentante: TGroupBox;
    Label1: TLabel;
    BuscaPessoa1: TBuscaPessoa;
    chkTodos: TCheckBox;
    gbPeriodo: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    rgTipoPedido: TRadioGroup;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    pnlRodape: TPanel;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    Splitter6: TSplitter;
    Splitter7: TSplitter;
    Splitter8: TSplitter;
    GroupBox2: TGroupBox;
    Image1: TImage;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    Image2: TImage;
    Label5: TLabel;
    Image3: TImage;
    Label8: TLabel;
    Image4: TImage;
    Label9: TLabel;
    Panel2: TPanel;
    Shape1: TShape;
    Panel3: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Splitter9: TSplitter;
    rgTipoData: TRadioGroup;
    Image5: TImage;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    btnBuscar: TBitBtn;
    btnImprimir: TSpeedButton;
    Label4: TLabel;
    edtQuantidadePedidos: TEdit;
    chkInternet: TCheckBox;
    cdsTOTAL_PECAS: TAggregateField;
    DBEdit1: TDBEdit;
    Label13: TLabel;
    pnlConfigEmail: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtNome: TEdit;
    edtAssunto: TEdit;
    memoTexto: TMemo;
    edtEmailCopia: TEdit;
    btnEnviarEmail: TBitBtn;
    btnConfigEmail: TSpeedButton;
    Label18: TLabel;
    cdsTOTAL_ITENS: TAggregateField;
    Label19: TLabel;
    DBEdit2: TDBEdit;
    rgLeiaute: TRadioGroup;
    Splitter10: TSplitter;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource2: TDataSource;
    ClientDataSet1TOTAL_PECAS: TAggregateField;
    ClientDataSet1TOTAL_ITENS: TAggregateField;
    Panel1: TPanel;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    lbPeriodo: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLBand6: TRLBand;
    RLDraw4: TRLDraw;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel16: TRLLabel;
    RLDBResult4: TRLDBResult;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    rlbPercEstoque: TRLLabel;
    RLDraw1: TRLDraw;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
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
    RLLabel11: TRLLabel;
    RLLabel17: TRLLabel;
    RLBand3: TRLBand;
    rldbPercEstoque: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLBand4: TRLBand;
    RLDraw2: TRLDraw;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    grpAnalitico: TGroupBox;
    gridPedidos: TDBGridCBN;
    Splitter5: TSplitter;
    BuscaCor1: TBuscaCor;
    BuscaProduto1: TBuscaProduto;
    RLReport2: TRLReport;
    RLBand5: TRLBand;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    lbPeriodo2: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    RLBand7: TRLBand;
    RLDraw3: TRLDraw;
    RLGroup2: TRLGroup;
    RLBand8: TRLBand;
    RLDraw5: TRLDraw;
    RLDBText14: TRLDBText;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLBand9: TRLBand;
    RLDBText16: TRLDBText;
    RLDBText23: TRLDBText;
    RLBand10: TRLBand;
    RLDraw6: TRLDraw;
    RLDBResult10: TRLDBResult;
    RLDBResult11: TRLDBResult;
    RLDBResult12: TRLDBResult;
    RLDBText13: TRLDBText;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDBText15: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLDBText27: TRLDBText;
    RLDBText28: TRLDBText;
    RLDraw12: TRLDraw;
    RLDBText30: TRLDBText;
    RLDraw13: TRLDraw;
    RLDraw14: TRLDraw;
    RLDraw15: TRLDraw;
    RLDraw16: TRLDraw;
    RLDraw17: TRLDraw;
    RLDraw18: TRLDraw;
    RLLabel33: TRLLabel;
    RLDBText29: TRLDBText;
    RLLabel28: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel34: TRLLabel;
    RLDBResult7: TRLDBResult;
    RLDBResult8: TRLDBResult;
    RLDBResult9: TRLDBResult;
    RLLabel22: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLLabel40: TRLLabel;
    RLLabel41: TRLLabel;
    chkFuncionarios: TCheckBox;
    qry: TFDQuery;
    qry2: TFDQuery;
    cdsNUMPEDIDO: TStringField;
    cdsCOD_REPRES: TIntegerField;
    cdsREPRESENTANTE: TStringField;
    cdsCLIENTE: TStringField;
    cdsCODIGO: TIntegerField;
    cdsDT_DESPACHO: TDateField;
    cdsDT_RECEBIMENTO: TDateField;
    cdsDT_CADASTRO: TDateField;
    cdsDT_REPRESENTANTE: TDateField;
    cdsDT_LIMITE_ENTREGA: TDateField;
    cdsTOTAL_DESCONTOS: TBCDField;
    cdsTOTAL_LIQUIDO: TBCDField;
    cdsFATURADO: TStringField;
    cdsSTATUS: TStringField;
    cdsQTD_PECAS: TBCDField;
    cdsQTD_ITENS: TBCDField;
    ClientDataSet1REFPRO: TStringField;
    ClientDataSet1PRODUTO: TStringField;
    ClientDataSet1REFCOR: TStringField;
    ClientDataSet1COR: TStringField;
    ClientDataSet1QTD_RN: TLargeintField;
    ClientDataSet1QTD_P: TLargeintField;
    ClientDataSet1QTD_M: TLargeintField;
    ClientDataSet1QTD_G: TLargeintField;
    ClientDataSet1QTD_1: TLargeintField;
    ClientDataSet1QTD_2: TLargeintField;
    ClientDataSet1QTD_3: TLargeintField;
    ClientDataSet1QTD_4: TLargeintField;
    ClientDataSet1QTD_6: TLargeintField;
    ClientDataSet1QTD_8: TLargeintField;
    ClientDataSet1QTD_UNICA: TBCDField;
    ClientDataSet1QTD_TOTAL: TBCDField;
    ClientDataSet1QTD_PECAS: TBCDField;
    ClientDataSet1VALOR_TOTAL: TBCDField;
    btnArquivoSigep: TBitBtn;
    cdsTAG: TStringField;
    cdsCODCLI: TIntegerField;
    lbInfoSigep: TLabel;
    chkSelecionar: TCheckBox;
    cdsPERC_ESTOQUE: TBCDField;
    ClientDataSet1QTD_10: TLargeintField;
    ClientDataSet1QTD_12: TLargeintField;
    ClientDataSet1QTD_14: TLargeintField;
    RLDraw19: TRLDraw;
    RLDraw20: TRLDraw;
    RLDBText31: TRLDBText;
    RLDBText32: TRLDBText;
    RLDBText33: TRLDBText;
    cdsTOTAL_BRUTO: TFloatField;
    Label20: TLabel;
    DBEdit5: TDBEdit;
    cdsTOT_VALOR_BRUTO: TAggregateField;
    RLLabel42: TRLLabel;
    RLDBText34: TRLDBText;
    RLLabel43: TRLLabel;
    RLDBResult13: TRLDBResult;
    RLDBResult14: TRLDBResult;
    PopupMenu1: TPopupMenu;
    ImprimirDanfe1: TMenuItem;
    cdsCODIGO_NOTA_FISCAL: TIntegerField;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure btnImprimirClick(Sender: TObject);
    procedure dtpFimChange(Sender: TObject);
    procedure dtpInicioChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkTodosClick(Sender: TObject);
    procedure gridPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rgTipoPedidoClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure gridPedidosDblClick(Sender: TObject);
    procedure rgTipoDataClick(Sender: TObject);
    procedure btnConfigEmailClick(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure ClientDataSet1CalcFields(DataSet: TDataSet);
    procedure RLReport2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDBText30BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLBand9BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure btnArquivoSigepClick(Sender: TObject);
    procedure chkSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImprimirDanfe1Click(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
  private
    FTotal :Real;
    repositorio: TRepositorio;
    numero_pedido :String;
    total_descontos :Real;
    total_valor     :Real;

    procedure imprimir;
    function  monta_sql :String;
    procedure abre_pedido(numpedido :String);
    procedure PrepararEmail;
    function EnviarEmail(Endereco: String; Assunto: String = '';
                Texto: String = ''; stlAnexo: TStringList = nil): Boolean;
    procedure MostrarInformacoes;
    procedure configura_sintetico;
    procedure configura_analitico;
    procedure marca_desmarca;
    procedure imprimirDanfe;

  public
    RelatorioSemValores: Boolean;

  end;

var
  frmRelatorioVendas: TfrmRelatorioVendas;

implementation

uses RxCurrEdit, uPedido, PermissoesAcesso, IdIOHandlerStack, FabricaRepositorio,
     StrUtils, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
     IdMessageClient, IdSMTP, IdAttachmentFile, IdExplicitTLSClientServerBase,
     IdSSLOpenSSL, IdIOHandler, IdIOHandlerSocket, ConfiguracoesNFEmail,
     Endereco, Pessoa, GeradorNFe, NotaFiscal;

{$R *.dfm}

procedure TfrmRelatorioVendas.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  lbPeriodo.Caption := DateToStr(dtpInicio.Date) +' a '+ DateToStr(dtpFim.Date);

  case rgTipoData.ItemIndex of
   0 : rllabel37.Caption := 'CADASTRO';
   1 : rllabel37.Caption := 'REPRESENTANTE';
   2 : rllabel37.Caption := 'RECEBIMENTO';
   3 : rllabel37.Caption := 'LIMITE ENTREGA';
   4 : rllabel37.Caption := 'DESPACHO';
  end;

  case rgTipoPedido.ItemIndex of
   0 : rllabel40.Caption := 'FATURADOS';
   1 : rllabel40.Caption := 'NÃO FATURADOS';
   2 : rllabel40.Caption := 'FATURADOS E NÃO FATURADOS';
  end;
end;

procedure TfrmRelatorioVendas.btnImprimirClick(Sender: TObject);
begin
  inherited;

  if not Cds.Active and not ClientDataSet1.Active then exit;

  if not cds.IsEmpty then
    imprimir
  else
    RLReport2.PreviewModal;  

end;

procedure TfrmRelatorioVendas.imprimir;
begin
  MostrarInformacoes;
  RLReport1.PreviewModal;
end;

procedure TfrmRelatorioVendas.imprimirDanfe;
var
  RepositorioNotaFiscal      :TRepositorio;
  GeradorNFe                 :TGeradorNFe;
  NotaFiscal                 :TNotaFiscal;
begin
  try
    RepositorioNotaFiscal := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);
    NotaFiscal            := TNotaFiscal(RepositorioNotaFiscal.Get(cdsCODIGO_NOTA_FISCAL.AsInteger));

    GeradorNFe            := TGeradorNFe.Create(FDM.Logo);
    GeradorNFe.ImprimirComVisualizacao(NotaFiscal);
  finally
    FreeAndNil(GeradorNFe);
    FreeAndNil(NotaFiscal);
    FreeAndNil(RepositorioNotaFiscal);
  end;
end;

procedure TfrmRelatorioVendas.ImprimirDanfe1Click(Sender: TObject);
begin
  imprimirDanfe;
end;

procedure TfrmRelatorioVendas.marca_desmarca;
begin
  cds.Edit;
  cdsTAG.AsString := IfThen(cdsTAG.AsString = 'S', '', 'S');
  cds.Post;
end;

function TfrmRelatorioVendas.monta_sql: String;
var condicao_representante, condicao_data, condicao_faturado, condicao_internet, condicao_funcionario :String;
    tipo_data, condicao_exclui_remessa, condicao_exclui_vendas_propria_empresa :String;
    condicao_exclui_bonificacoes, condicao_percent_estoque, condicao_produto, condicao_cor :String;
    agrupa_itens, campos_analitico :String;
begin

  condicao_exclui_remessa := ' and not (iif((select first 1 nat.descricao from itens_notas_fiscais it                    '+#13#10+
                             '                left join naturezas_operacao nat on nat.codigo = it.codigo_natureza        '+#13#10+
                             '                where it.codigo_nota_fiscal = NF.codigo) is null,                          '+#13#10+
                             '                     '''',                                                                 '+#13#10+
                             '                     (select first 1 nat.descricao from itens_notas_fiscais it             '+#13#10+
                             '                       left join naturezas_operacao nat on nat.codigo = it.codigo_natureza '+#13#10+
                             '                       where it.codigo_nota_fiscal = NF.codigo))                           '+#13#10+
                             '          ) like ''%REMESSA%''                                                             '+#13#10;

  condicao_exclui_vendas_propria_empresa := ' and not (select pessoas.cpf_cnpj from pessoas where pessoas.codigo = P.cod_cliente)                    '+#13#10+
                                            ' in (select pessoas.cpf_cnpj from empresas left join pessoas on pessoas.codigo = empresas.codigo_pessoa)'+#13#10;

  condicao_percent_estoque := 'per.percent_disponivel perc_Estoque, ';

  campos_analitico := ' pro.referencia refpro, pro.descricao produto, cor.referencia refcor, cor.descricao cor, SUM(itens.qtd_rn) qtd_rn, SUM(itens.qtd_p) qtd_p, SUM(itens.qtd_m) qtd_m, SUM(itens.qtd_g) qtd_g, '+
                      ' SUM(itens.qtd_1) qtd_1, SUM(itens.qtd_2) qtd_2, SUM(itens.qtd_3) qtd_3, SUM(itens.qtd_4) qtd_4, SUM(itens.qtd_6) qtd_6, SUM(itens.qtd_8) qtd_8, '+
                      ' SUM(itens.qtd_10) qtd_10, SUM(itens.qtd_12) qtd_12, SUM(itens.qtd_14) qtd_14,                                                                   '+
                      ' SUM(itens.qtd_unica) qtd_unica, SUM(itens.qtd_total) qtd_total, SUM((itens.qtd_total * pro.qtd_pecas)) qtd_pecas, SUM(itens.valor_total) valor_total ';


  condicao_faturado       := ' AND iif((not (PF.codigo is null) or (P.despachado = ''S'')), ''SIM'', ''NÃO'')'+#13#10;

  condicao_exclui_bonificacoes := ' and ( ((not nat.cfop in (''5910'',''6910'',''5916'')) and not(nat.cfop like ''1%'' or nat.cfop like ''2%'')) or (nat.cfop is null)) '+#13#10;

       if rgTipoData.ItemIndex = 0 then  tipo_data := ' P.DT_CADASTRO '
  else if rgTipoData.ItemIndex = 1 then  tipo_data := ' P.DT_REPRESENTANTE '
  else if rgTipoData.ItemIndex = 2 then  tipo_data := ' P.DT_RECEBIMENTO '
  else if rgTipoData.ItemIndex = 3 then  tipo_data := ' P.DT_LIMITE_ENTREGA'
  else if rgTipoData.ItemIndex = 4 then  tipo_data := ' iif( not(PF.codigo is null), '+
                                                      '      CAST( lpad(EXTRACT(DAY FROM nf.data_saida), 2, ''0'') || ''.'' || lpad(EXTRACT(MONTH FROM nf.data_saida), 2, ''0'') || ''.'' || EXTRACT(YEAR FROM nf.data_saida) as Date), '+
                                                      '      P.dt_despacho)         ';

  condicao_data := ' AND ('+ tipo_data + ' BETWEEN :DTI AND :DTF ) '+#13#10;

  if BuscaPessoa1.edtCodigo.AsInteger <= 0 then
    condicao_representante := ''
  else if BuscaPessoa1.edtCodigo.AsInteger > 0 then
    condicao_representante := ' AND P.COD_REPRES = :COD_REPRES '+#13#10;

  if BuscaProduto1.edtReferencia.Text <> '' then
    condicao_produto         := ' and pro.codigo = :COD_PRO ';

  if BuscaCor1.edtReferencia.Text <> '' then
    condicao_cor             := ' and cor.codigo = :COD_COR ';


       if rgTipoPedido.ItemIndex = 0 then   condicao_faturado      := condicao_faturado + ' = ''SIM'''
  else if rgTipoPedido.ItemIndex = 1 then   condicao_faturado      := condicao_faturado + ' = ''NÃO'''
  else if rgTipoPedido.ItemIndex = 2 then   condicao_faturado      := condicao_faturado + ' in (''SIM'',''NÃO'') ';

  if chkInternet.Checked then
    condicao_internet := ''
  else
    condicao_internet := 'AND not C.RAZAO like ''%MINHA ROUPINHA%'' '+#13#10;

  if chkFuncionarios.Checked then
    condicao_funcionario := ''
  else
    condicao_funcionario := ' AND ((cli.funcionario is null) or  not(Cli.FUNCIONARIO = ''S''))  '+#13#10;

  result := 'SELECT ' +
            IfThen(rgLeiaute.ItemIndex = 0,'P.NUMPEDIDO, R.CODIGO COD_REPRES ,SUBSTRING(R.RAZAO from 1 for 40) REPRESENTANTE, C.RAZAO CLIENTE, C.CODIGO CODCLI,             '+#13#10+
            '       iif( not(PF.codigo is null), iif( not(PF.codigo is null),                                                                 '+#13#10+
            '             CAST( lpad(EXTRACT(DAY FROM nf.data_saida), 2, ''0'') || ''.'' || lpad(EXTRACT(MONTH FROM nf.data_saida), 2, ''0'') || ''.'' || EXTRACT(YEAR FROM nf.data_saida) as Date), '+#13#10+
            '             P.dt_despacho) ,P.dt_despacho) DT_Despacho,                                                                         '+#13#10+
            '       P.DT_RECEBIMENTO, P.DT_CADASTRO, P.DT_REPRESENTANTE , P.DT_LIMITE_ENTREGA, (P.DESCONTO_FPGTO + P.DESCONTO + P.DESCONTO_ITENS+ P.desconto_comiss) TOTAL_DESCONTOS, '+#13#10+
            '       (p.valor_total-((p.valor_total*p.desconto_comiss)/100)) total_liquido, ((p.valor_total-((p.valor_total*p.desconto_comiss)/100)) + p.valor_frete) total_bruto, '+
            ' iif((not (PF.codigo is null) or (P.despachado = ''S'')), ''SIM'', ''NÃO'') FATURADO, '+#13#10+
            '       iif(P.DESPACHADO = ''S'', ''DESPACHADO'',                                                                                 '+#13#10+
            '           iif(P.aprovacao = ''A'',''APROVADO'',iif(P.aprovacao = ''E'', ''EM ESTUDO'', ''REPROVADO''))) STATUS,                 '+#13#10+
            ' sum(itens.QTD_TOTAL * pro.qtd_pecas) as qtd_pecas, '+IfThen(self.RelatorioSemValores, condicao_percent_estoque,' cast(''0.10'' as numeric(15,2)) perc_estoque, ')+'sum(itens.QTD_TOTAL) as qtd_itens   '+#13#10+'',
            campos_analitico) + ', PF.codigo, PF.codigo_nota_fiscal '+
            '       from pedidos P                                                                                                            '+#13#10+
            ' LEFT JOIN pedidos_faturados      PF  ON PF.CODIGO_PEDIDO = P.CODIGO                                                             '+#13#10+
            ' LEFT JOIN PESSOAS                C   ON C.CODIGO = P.COD_CLIENTE                                                                '+#13#10+
            ' LEFT JOIN PESSOAS                R   ON R.CODIGO = P.COD_REPRES                                                                 '+#13#10+
            ' LEFT JOIN notas_fiscais          NF  ON NF.codigo = PF.codigo_nota_fiscal                                                       '+#13#10+
            IfThen(self.RelatorioSemValores,' left join percent_estoque_disponivel(p.codigo) per on (1=1) ','')+
            ' left join ITENS on itens.COD_PEDIDO = p.CODIGO '+#13#10+
            ' left join produtos pro on ITENS.COD_PRODUTO = pro.CODIGO '+#13#10+
            IfThen(rgLeiaute.ItemIndex = 0, '', ' left join cores cor  on cor.codigo = itens.cod_cor ') +
            ' left join naturezas_operacao nat on nat.codigo = nf.codigo_natureza '+#13#10+
            ' left join clientes cli on cli.codcli = c.codigo '+#13#10+
            ' WHERE not (p.cancelado = ''S'')                                     '+#13#10;

  result := result + condicao_data;
  result := result + condicao_representante;
  result := result + condicao_faturado;
  result := result + condicao_exclui_remessa;
  result := result + condicao_exclui_vendas_propria_empresa;
  result := result + condicao_internet;
  result := result + condicao_funcionario;
  result := result + condicao_exclui_bonificacoes;
  result := result + condicao_produto;
  result := result + condicao_cor;
  result := result + IfThen(rgLeiaute.ItemIndex = 0, ' GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,19,20'+ IfThen(self.RelatorioSemValores,',17',''), ' group by pro.referencia, pro.descricao, cor.referencia, cor.descricao, pf.codigo, pf.codigo_nota_fiscal ');
  result := result + IfThen(rgLeiaute.ItemIndex = 0, IfThen(self.RelatorioSemValores,' ORDER BY per.percent_disponivel DESC','') ,' order by 1, 3 ');
end;

procedure TfrmRelatorioVendas.dtpFimChange(Sender: TObject);
begin
  if dtpFim.Date < dtpInicio.Date then begin
    avisar('A data final não pode ser menor que a data inicial!');
    dtpFim.Date := dtpInicio.Date +1;
    dtpFim.SetFocus;
  end;
end;

procedure TfrmRelatorioVendas.dtpInicioChange(Sender: TObject);
begin
  if dtpInicio.Date > dtpFim.Date then
    dtpFim.Date := dtpInicio.Date +1;
end;

procedure TfrmRelatorioVendas.FormShow(Sender: TObject);
begin
  BuscaPessoa1.TipoPessoa := tpRepresentante;
  dtpInicio.Date          := strToDateTime( formatDateTime('dd/mm/yyyy 00:00:00', date) );
  dtpFim.Date             := strToDateTime( formatDateTime('dd/mm/yyyy 23:59:59', date) ) + 1;
  Cds.CreateDataSet;
  ClientDataSet1.CreateDataSet;
                                                                 // reorganizar os indices
  if RelatorioSemValores then
  begin
    Self.Caption := 'Relatório de Pedidos';

    Panel3.Visible:= False;
    rgTipoPedido.ItemIndex:= 1;
    GroupBox2.Visible:= False;
    btnEnviarEmail.Visible := false;
    btnConfigEmail.Visible := false;
    btnArquivoSigep.Visible := true;
    lbInfoSigep.Visible := true;
    chkSelecionar.Visible := true;
  end
  else
  begin
    Self.Caption := 'Relatório de Vendas';

    Panel3.Visible:= True;
    rgTipoPedido.ItemIndex:= 0;
    GroupBox2.Visible:= True;
    btnEnviarEmail.Visible := true;
    btnConfigEmail.Visible := true;
    btnArquivoSigep.Visible := false;
    lbInfoSigep.Visible := false;
    chkSelecionar.Visible := false;
  end;
end;

procedure TfrmRelatorioVendas.FormCreate(Sender: TObject);
begin
  inherited;
  pnlConfigEmail.Align := alBottom;
end;

procedure TfrmRelatorioVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ( (ssCtrl in Shift) AND (Key = ord('P')) ) then
    btnImprimir.Click;
end;

procedure TfrmRelatorioVendas.cdsAfterScroll(DataSet: TDataSet);
begin
  if cdsCODIGO_NOTA_FISCAL.AsInteger > 0 then
    gridPedidos.PopupMenu := PopupMenu1
  else
    gridPedidos.PopupMenu := nil;
end;

procedure TfrmRelatorioVendas.chkSelecionarClick(Sender: TObject);
begin
  chkSelecionar.Caption := IfThen(chkSelecionar.Checked, 'Deselecionar todos', 'Selecionar todos');
  cds.First;

  if chkSelecionar.Checked then
  begin
    while not cds.Eof do begin
      marca_desmarca;

      cds.Next;
    end;
  end
  else
    btnBuscar.Click;

end;

procedure TfrmRelatorioVendas.chkTodosClick(Sender: TObject);
begin
  if chkTodos.Checked then begin
    BuscaPessoa1.Enabled := false;
    BuscaPessoa1.limpa;
  end
  else
    BuscaPessoa1.Enabled := true;  
end;

procedure TfrmRelatorioVendas.gridPedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if cdsTAG.AsString = 'S' then
  begin
    TDBGridCBN(Sender).Canvas.FillRect(Rect);

    TDBGridCBN(Sender).Canvas.Brush.Color := $0070914F;
    TDBGridCBN(Sender).Canvas.Font.Color  := clWhite;
    TDBGridCBN(Sender).DefaultDrawDataCell(Rect,Column.Field,State);
  end;

  if Column.Field = cdsFATURADO then begin
    TDBGridCBN(Sender).Canvas.FillRect(Rect);

    if cdsFATURADO.asString = 'SIM' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +12, Rect.Top , 0, true);
  end;

  if Column.Field = cdsSTATUS then begin
    TDBGridCBN(Sender).Canvas.FillRect(Rect);

    TDBGridCBN(Sender).Canvas.Brush.Color := clWhite;
    TDBGridCBN(Sender).Canvas.Font.Color  := clWhite;
    TDBGridCBN(Sender).DefaultDrawDataCell(Rect,Column.Field,State);

    if cdsSTATUS.asString = 'APROVADO' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +20, Rect.Top , 1, true)
    else if cdsSTATUS.asString = 'REPROVADO' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +20, Rect.Top , 2, true)
    else if cdsSTATUS.asString = 'EM ESTUDO' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +20, Rect.Top , 3, true)
    else if cdsSTATUS.asString = 'DESPACHADO' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +20, Rect.Top , 4, true);
  end;

end;

procedure TfrmRelatorioVendas.rgTipoPedidoClick(Sender: TObject);
begin
  if not cds.Active then
    exit;
  if not RelatorioSemValores then
    btnBuscar.Click;
end;

procedure TfrmRelatorioVendas.btnArquivoSigepClick(Sender: TObject);
var arq: TextFile;
    nX: integer;
    fixo, cpfCnpj, nome, email :String;
    aosCuidados, contato, cep, logradouro :String;
    numero, complemento, bairro, cidade :String;
    telefone, celular, fax :String;
    caminho :String;
    Destinatario :TPessoa;
    repositorio  :TRepositorio;
    erro :Boolean;
begin
  cds.Filtered := false;
  cds.Filter   := 'TAG = ''S''';
  cds.Filtered := true;

  if cds.RecordCount = 0 then
  begin
    avisar('Geração de arquivo Sigep cancelada. Nenhum registro foi selecionado.');
    cds.Filtered := false;
    exit;
  end;

  SelectDirectory('Selecione a pasta destino','', caminho);
  if caminho = '' then begin
    avisar('Operação abortada');
    exit;
  end;

 try
   repositorio := nil;

   AssignFile(arq, caminho+'\Destinatario.txt');
   Rewrite(arq);
   Writeln(arq, '1SIGEP DESTINATARIO NACIONAL');

   try
   repositorio := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
   erro        := false;

   cds.First;
   while not cds.Eof do begin

     Destinatario := TPessoa( repositorio.Get(cdsCODCLI.AsInteger) );

     fixo := '2';
     cpfCnpj     := TStringUtilitario.CaracterAEsquerda(' ',TRIM(Destinatario.CPF_CNPJ), 14);
     nome        := TStringUtilitario.CaracterAEsquerda(' ',TRIM(Destinatario.Razao), 50);
     email       := TStringUtilitario.CaracterAEsquerda(' ', '', 50);
     aosCuidados := TStringUtilitario.CaracterAEsquerda(' ', '', 50);
     contato     := TStringUtilitario.CaracterAEsquerda(' ', '', 50);
     cep         := TStringUtilitario.CaracterAEsquerda(' ',TRIM(Destinatario.Endereco.CEP), 8);
     logradouro  := TStringUtilitario.CaracterAEsquerda(' ',TRIM(Destinatario.Endereco.logradouro), 50);
     numero      := TStringUtilitario.CaracterAEsquerda(' ',TRIM(Destinatario.Endereco.numero), 6);
     complemento := TStringUtilitario.CaracterAEsquerda(' ',TRIM(Destinatario.Endereco.complemento), 30);
     bairro      := TStringUtilitario.CaracterAEsquerda(' ',TRIM(Destinatario.Endereco.bairro), 50);
     cidade      := TStringUtilitario.CaracterAEsquerda(' ',TRIM(Destinatario.Endereco.Cidade.nome), 50);
     telefone    := TStringUtilitario.CaracterAEsquerda(' ', '', 18);
     celular     := TStringUtilitario.CaracterAEsquerda(' ', '', 12);
     fax         := TStringUtilitario.CaracterAEsquerda(' ', '', 12);

     Writeln(arq, fixo + cpfCnpj + nome + email + aosCuidados + contato + cep + logradouro +
             numero + complemento + bairro + cidade + telefone + celular + fax);

     cds.Next;

     FreeAndNil(Destinatario);
   end;

   Writeln(arq, '9'+TStringUtilitario.CaracterAEsquerda('0', intToStr(cds.RecordCount), 6));
  except
    on e : Exception do
    begin
      avisar('Erro ao gerar arquivo. '+#13#10+e.Message);
      erro := true;
    end;
  end;

   CloseFile(arq);

   chkSelecionar.OnClick := nil;
   chkSelecionar.Checked := false;
   chkSelecionar.OnClick := chkSelecionarClick;
   if not erro then
     avisar('Arquivo gerado com sucesso!');

 finally
   cds.Filtered := false;
   btnBuscar.Click;
 end;
end;

procedure TfrmRelatorioVendas.btnBuscarClick(Sender: TObject);
begin
  inherited;
  if (BuscaPessoa1.edtCodigo.AsInteger <= 0) and not (chkTodos.Checked) then begin
    avisar('Representante não foi informado!');
    exit;
  end;

  cds.EmptyDataSet;
  ClientDataSet1.EmptyDataSet;


  if rgLeiaute.ItemIndex = 0 then begin
    cds.Close;
    qry.SQL.Text := monta_sql;
    qry.ParamByName('DTI').AsDateTime := dtpInicio.DateTime;
    qry.ParamByName('DTF').AsDateTime := dtpFim.DateTime;
    if BuscaPessoa1.edtCodigo.Value > 0 then
      qry.ParamByName('COD_REPRES').AsInteger := BuscaPessoa1.edtCodigo.AsInteger;

    cds.Open;
    configura_sintetico;
  end
  else begin
    ClientDataSet1.Close;
    qry2.SQL.Text := monta_sql;
    qry2.ParamByName('DTI').AsDateTime := dtpInicio.DateTime;
    qry2.ParamByName('DTF').AsDateTime := dtpFim.DateTime;

    if BuscaPessoa1.edtCodigo.Value > 0 then
      qry2.ParamByName('COD_REPRES').AsInteger := BuscaPessoa1.edtCodigo.AsInteger;

    if BuscaProduto1.edtReferencia.Text <> '' then
      qry2.ParamByName('COD_PRO').AsInteger := BuscaProduto1.CodigoProduto;

    if BuscaCor1.edtReferencia.Text <> '' then
      qry2.ParamByName('COD_COR').AsInteger := BuscaCor1.CodigoCor;

    ClientDataSet1.Open;
    configura_analitico;
  end;

  if (cds.IsEmpty) and (ClientDataSet1.IsEmpty) then begin
      avisar('Não foram encontrados registros com os filtros fornecidos');
      btnConfigEmail.Visible:= False;
      exit;
  end;

  btnConfigEmail.Visible:= True;
  if RelatorioSemValores then
  begin
    memoTexto.Text := 'Segue em anexo o Relatorio de Pedidos Nao Faturados.';
    edtAssunto.Text := 'Relatorio de Pedidos Nao Faturados';
  end
  else
  begin
    memoTexto.Text := 'Segue em anexo o Relatorio de Vendas.';
    edtAssunto.Text:= 'Relatorio de Vendas'
  end;
end;

procedure TfrmRelatorioVendas.gridPedidosDblClick(Sender: TObject);
begin
  if cds.IsEmpty then EXIT;
  if RelatorioSemValores then
  begin
    marca_desmarca;
  end
  else
  begin
    abre_pedido(cdsNUMPEDIDO.AsString);
    btnBuscar.Click;
  end;
end;

procedure TfrmRelatorioVendas.abre_pedido(numpedido: String);
begin
  frmPedido := TfrmPedido.Create(self);
  frmPedido.Tag := 1; //alteração de pedido
  frmPedido.Caption := 'Alteração de Pedido de Venda';
  frmPedido.BuscaPedido1.numped := numpedido;
  frmPedido.ShowModal;
  frmPedido.Release;
  frmPedido := nil;
end;

procedure TfrmRelatorioVendas.rgTipoDataClick(Sender: TObject);
begin
  if not cds.Active then  exit;

  btnBuscar.Click;
end;

procedure TfrmRelatorioVendas.btnConfigEmailClick(Sender: TObject);
begin
  inherited;
  if not pnlConfigEmail.Visible then
    pnlConfigEmail.Visible := True
  else
    pnlConfigEmail.Visible := False;
end;

procedure TfrmRelatorioVendas.Label18Click(Sender: TObject);
begin
  inherited;
  pnlConfigEmail.Visible:= False;
end;

procedure TfrmRelatorioVendas.btnEnviarEmailClick(Sender: TObject);
begin
  inherited;
  try
    if cds.IsEmpty then
      Exit;
    if BuscaPessoa1.edtCodigo.Text = '' then
    begin
      avisar('Por favor, selecione um Representante.');
      Exit;
    end;
    Aguarda('Enviando e-mail...');
    PrepararEmail;
    FimAguarda('Enviado com sucesso');
  except
    on e: Exception do
    begin
      avisar(e.Message);
    end;
  end;
end;

procedure TfrmRelatorioVendas.PrepararEmail;
var Lista: TStringList;
    Tipo: String;
begin
  try
    if RelatorioSemValores then
      Tipo:= 'PedidosNaoFaturados_'
    else
      Tipo:= 'Vendas_';
    MostrarInformacoes;
    Lista := TStringList.Create;
    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'/Relatorios') then
      CreateDir(ExtractFilePath(Application.ExeName)+'/Relatorios');
    RLReport1.SaveToFile(ExtractFilePath(Application.ExeName)+'/Relatorios/'+Tipo+FormatDateTime('dd.mm.yyyy',qry.ParamByName('DTI').AsDateTime)+' a '+FormatDateTime('dd.mm.yyyy',qry.ParamByName('DTF').AsDateTime)+'_.pdf');
    RLReport1.Prepare;
    Lista.Add(ExtractFilePath(Application.ExeName)+'/Relatorios/'+Tipo+FormatDateTime('dd.mm.yyyy',qry.ParamByName('DTI').AsDateTime)+' a '+FormatDateTime('dd.mm.yyyy',qry.ParamByName('DTF').AsDateTime)+'_.pdf');
    if Lista.Count <= 0 then
      Exit;

    if trim(BuscaPessoa1.Email) = '' then
       avisar('Relatório não enviado. Representante não possui e-mail cadastrado.')
    else
       EnviarEmail(BuscaPessoa1.Email, Trim(edtAssunto.Text), Trim(memoTexto.Text), Lista);
    Lista.Free;
    Lista := nil;
  except
    on e : Exception do
    begin
      raise Exception.Create( e.Message );
    end;
  end;
end;

function TfrmRelatorioVendas.EnviarEmail(Endereco, Assunto, Texto: String;
  stlAnexo: TStringList): Boolean;
var IdMessage: TIdMessage;
    IdSMTP: TIdSMTP;
    nX: Integer;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    configuracoes_email: TConfiguracoesNFEmail;
    TipoEmail: string;
begin
  if RelatorioSemValores then
    TipoEmail:= 'Pedidos Nao Faturados'
  else
    TipoEmail:= 'Vendas';
  try
    try
      IdSMTP := TIdSMTP.create(nil);
      IdSSLIOHandlerSocketOpenSSL1 := TIdSSLIOHandlerSocketOpenSSL.Create (IdSMTP);
      IdSMTP.ConnectTimeout := 10000;
      IdSMTP.ReadTimeout    := 10000;
      IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Mode   := sslmClient;
      IdSMTP.IOHandler    := IdSSLIOHandlerSocketOpenSSL1;
      IdSMTP.UseTLS       := utUseExplicitTLS;
      repositorio         := TFabricaRepositorio.GetRepositorio( TConfiguracoesNFEmail.ClassName );
      configuracoes_email := TConfiguracoesNFEmail( repositorio.Get( 1 ) );
      if assigned(configuracoes_email) then
      begin {configuracoes_email - é a classe com as informações do email do cliente}
        IdSMTP.AuthType     := satDefault;
        IdSMTP.Host         := configuracoes_email.SMTPHost;//'smtp.live.com';//'smtp.gmail.com';
        IdSMTP.Port         := strToInt( configuracoes_email.SMTPPort );
        IdSMTP.Username     := configuracoes_email.SMTPUser;
        IdSMTP.Password     := configuracoes_email.SMTPPassword;
        IdMessage := TIdMessage.create(nil);
        IdMessage.Clear;
        IdMessage.MessageParts.Clear;
        IdMessage.Recipients.EMailAddresses:= Endereco;// + ';' +configuracoes_email.SMTPUser;
        IdMessage.From.Address              := edtEmailCopia.Text;//configuracoes_email.SMTPUser;
        IdMessage.From.Name                 := edtNome.Text;
        IdMessage.Priority                  := mpHigh; //MpNormal MpLow
        IdMessage.Subject  := Assunto;
        IdMessage.Body.Add( Texto );
        for nX := 0 to stlAnexo.Count -1 do
          TIdAttachmentFile.Create(idmessage.MessageParts, TFileName( stlAnexo[nX] ));
        Application.ProcessMessages;
        IdSMTP.Connect;
        IdSMTP.Authenticate;
        Application.ProcessMessages;
        IdSMTP.Send(IdMessage);
        avisar('Relatório(s) de '+TipoEmail+' enviado(s) com sucesso!'+#13#10+'E-mail destino: '+BuscaPessoa1.Email);
      end
      else
        avisar('Não foi possível enviar e-mail, pois não há configurações de e-mail cadastradas.');
    except
      on e : Exception do
      begin
        raise Exception.Create(e.Message);
        IdSMTP.Disconnect;
      end;
    end;
  finally
    FreeAndNil(configuracoes_email );
    FreeAndNil(IdMessage );
    FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
    IdSMTP := nil;
  end;
end;

procedure TfrmRelatorioVendas.MostrarInformacoes;
begin
  if RelatorioSemValores then
  begin
    RLLabel8.Visible:= False;
    RLLabel9.Visible:= False;
    RLDBText8.Visible:= False;
    RLDBText9.Visible:= False;
    RLDBText34.Visible:= false;
    RLDBResult1.Visible:= False;
    RLDBResult2.Visible:= False;
    RLDraw2.Visible:= False;
    RLDraw4.Visible:= False;
    RLLabel18.Visible:= False;
    RLLabel19.Visible:= False;
    RLDBResult5.Visible:= False;
    RLDBResult6.Visible:= False;
    rlbPercEstoque.Visible := True;
    rldbPercEstoque.Visible := True;
    RLLabel12.Caption:= 'Relatório de Pedidos Não Faturados';
  end
  else
  begin
    RLLabel8.Visible:= True;
    RLLabel9.Visible:= True;
    RLDBText8.Visible:= True;
    RLDBText9.Visible:= True;
    RLDBText34.Visible:= true;
    RLDBResult1.Visible:= True;
    RLDBResult2.Visible:= True;
    RLDraw2.Visible:= True;
    RLDraw4.Visible:= True;
    RLLabel18.Visible:= True;
    RLLabel19.Visible:= True;
    RLDBResult5.Visible:= True;
    RLDBResult6.Visible:= True;
    rlbPercEstoque.Visible := False;
    rldbPercEstoque.Visible := False;
    RLLabel12.Caption:= 'Relatório '+IfThen(rgLeiaute.ItemIndex = 0,'Sintético', 'Analítico')+' de Vendas Por Período';
  end;
end;

procedure TfrmRelatorioVendas.ClientDataSet1CalcFields(DataSet: TDataSet);
begin
  { if pos(ClientDataSet1NUMPEDIDO.AsString, numero_pedido) > 0  then
     Exit;

   numero_pedido := numero_pedido + ClientDataSet1NUMPEDIDO.AsString + ',';

   total_descontos := total_descontos + ClientDataSet1TOTAL_DESCONTOS.AsFloat;
   total_valor     := total_valor + ClientDataSet1TOTAL_LIQUIDO.AsFloat;}


end;

procedure TfrmRelatorioVendas.configura_analitico;
begin
   total_descontos := 0;
   total_valor     := 0;
   numero_pedido   := '';
   gridPedidos.DataSource := DataSource2;
   DBEdit1.DataSource     := DataSource2;
   DBEdit2.DataSource     := DataSource2;

   gridPedidos.Columns[0].Width   := 60;
   gridPedidos.Columns[1].Width   := 280;
   gridPedidos.Columns[2].Width   := 60;
   gridPedidos.Columns[3].Width   := 250;
   gridPedidos.Columns[4].Width   := 40;
   gridPedidos.Columns[5].Width   := 40;
   gridPedidos.Columns[6].Width   := 40;
   gridPedidos.Columns[7].Width   := 40;
   gridPedidos.Columns[8].Width   := 40;
   gridPedidos.Columns[9].Width   := 40;
   gridPedidos.Columns[10].Width  := 40;
   gridPedidos.Columns[11].Width  := 40;
   gridPedidos.Columns[12].Width  := 40;
   gridPedidos.Columns[13].Width  := 40;
   gridPedidos.Columns[14].Width  := 40;
   gridPedidos.Columns[15].Width  := 40;
   gridPedidos.Columns[16].Width  := 40;
   gridPedidos.Columns[17].Width  := 40;
   gridPedidos.Columns[18].Width  := 50;
   gridPedidos.Columns[19].Width  := 50;

   gridPedidos.Columns[0].Title.Caption := 'Ref.Pro.';
   gridPedidos.Columns[1].Title.Caption := 'Produto';
   gridPedidos.Columns[2].Title.Caption := 'Ref.Cor.';
   gridPedidos.Columns[3].Title.Caption := 'Cor';
   gridPedidos.Columns[4].Title.Caption := 'RN';
   gridPedidos.Columns[5].Title.Caption := 'P';
   gridPedidos.Columns[6].Title.Caption := 'M';
   gridPedidos.Columns[7].Title.Caption := 'G';
   gridPedidos.Columns[8].Title.Caption := '1';
   gridPedidos.Columns[9].Title.Caption := '2';
   gridPedidos.Columns[10].Title.Caption := '3';
   gridPedidos.Columns[11].Title.Caption := '4';
   gridPedidos.Columns[12].Title.Caption := '6';
   gridPedidos.Columns[13].Title.Caption := '8';
   gridPedidos.Columns[14].Title.Caption := '10';
   gridPedidos.Columns[15].Title.Caption := '12';
   gridPedidos.Columns[16].Title.Caption := '14';
   gridPedidos.Columns[17].Title.Caption := 'UNICA';
   gridPedidos.Columns[18].Title.Caption := 'Qtd.Itens';
   gridPedidos.Columns[19].Title.Caption := 'Qtd.Peças';
   gridPedidos.Columns[20].Title.Caption := 'Vlr.Total';

   DBEdit3.Text := FormatFloat('##,###,##0.00',total_valor);
   DBEdit4.Text := FormatFloat('##,###,##0.00',total_descontos);

   label4.Visible       := false;
   Label10.Visible      := false;
   label11.Visible      := false;
   label20.Visible      := false;
   dbedit3.Visible      := false;
   dbedit4.Visible      := false;
   grpAnalitico.Visible := true
end;

procedure TfrmRelatorioVendas.configura_sintetico;
begin
   gridPedidos.DataSource := DataSource1;
   DBEdit1.DataSource     := DataSource1;
   DBEdit2.DataSource     := DataSource1;

   gridPedidos.Columns[1].Width    := 65;
   gridPedidos.Columns[2].Width    := 40;
   gridPedidos.Columns[3].Width    := 290;
   gridPedidos.Columns[4].Width    := 290;
   gridPedidos.Columns[5].Width    := 40;
   gridPedidos.Columns[6].Width    := 74;
   gridPedidos.Columns[7].Width    := 74;
   gridPedidos.Columns[8].Width    := 74;
   gridPedidos.Columns[9].Width    := 74;
   gridPedidos.Columns[10].Width   := 74;
   gridPedidos.Columns[11].Width   := 74;
   gridPedidos.Columns[12].Width   := 74;
   gridPedidos.Columns[13].Width   := 74;
   gridPedidos.Columns[14].Width   := 74;
   gridPedidos.Columns[15].Width   := 60;
   gridPedidos.Columns[16].Width   := 60;
   gridPedidos.Columns[17].Width   := 60;

   gridPedidos.Columns[0].Title.Caption  := 'Faturado';
   gridPedidos.Columns[1].Title.Caption  := 'Nº Pedido';
   gridPedidos.Columns[2].Title.Caption  := 'Código';
   gridPedidos.Columns[3].Title.Caption  := 'Representante';
   gridPedidos.Columns[4].Title.Caption  := 'Cliente';
   gridPedidos.Columns[5].Title.Caption  := 'Código';
   gridPedidos.Columns[6].Title.Caption  := 'Despacho';
   gridPedidos.Columns[7].Title.Caption  := 'Recebimento';
   gridPedidos.Columns[8].Title.Caption  := 'Cadastro';
   gridPedidos.Columns[9].Title.Caption  := 'Representante';
   gridPedidos.Columns[10].Title.Caption := 'Limite Entrega';
   gridPedidos.Columns[11].Title.Caption := 'Tot. Desconto';
   gridPedidos.Columns[12].Title.Caption := 'Tot.Líquido';
   gridPedidos.Columns[13].Title.Caption := 'Tot.Bruto';
   gridPedidos.Columns[14].Title.Caption := 'Status';
   gridPedidos.Columns[14].Title.Caption := 'Status';
   gridPedidos.Columns[15].Title.Caption := 'Qtde.Itens';
   gridPedidos.Columns[16].Title.Caption := 'Qtde.Peças';
   gridPedidos.Columns[17].Title.Caption := '% Estoque';


   gridPedidos.Columns[0].Visible  := not RelatorioSemValores; //FATURADO
   gridPedidos.Columns[6].Visible  := not RelatorioSemValores; //DT_DESPACHO
   gridPedidos.Columns[11].Visible := not RelatorioSemValores; // TOTAL DESCONTOS
   gridPedidos.Columns[12].Visible := not RelatorioSemValores; // TOTAL LIQUIDO
   gridPedidos.Columns[13].Visible := not RelatorioSemValores; // TOTAL BRUTO
   gridPedidos.Columns[17].Visible := RelatorioSemValores;  //% ESTOQUE

   label4.Visible  := true;
   Label10.Visible := true;
   label11.Visible := true;
   label20.Visible := true;
   dbedit3.Visible := true;
   dbedit4.Visible := true;
   grpAnalitico.Visible   := false;

end;
procedure TfrmRelatorioVendas.RLReport2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  lbPeriodo2.Caption := DateToStr(dtpInicio.Date) +' a '+ DateToStr(dtpFim.Date);
  RLLabel20.Caption  := 'Relatório '+IfThen(rgLeiaute.ItemIndex = 0,'Sintético', 'Analítico')+' de Vendas Por Período';

  case rgTipoData.ItemIndex of
   0 : rllabel27.Caption := 'CADASTRO';
   1 : rllabel27.Caption := 'REPRESENTANTE';
   2 : rllabel27.Caption := 'RECEBIMENTO';
   3 : rllabel27.Caption := 'LIMITE ENTREGA';
   4 : rllabel27.Caption := 'DESPACHO';
  end;

  case rgTipoPedido.ItemIndex of
   0 : rllabel39.Caption := 'FATURADOS';
   1 : rllabel39.Caption := 'NÃO FATURADOS';
   2 : rllabel39.Caption := 'FATURADOS E NÃO FATURADOS';
  end;

end;

procedure TfrmRelatorioVendas.RLDBText30BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  RLDBText30.Visible := RLDBText30.Text <> '0';

end;

procedure TfrmRelatorioVendas.RLBand9BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLDBText30.Visible  := true;
  RLDBText15.Visible  := true;
  RLDBText17.Visible  := true;
  RLDBText18.Visible  := true;
  RLDBText19.Visible  := true;
  RLDBText20.Visible  := true;
  RLDBText21.Visible  := true;
  RLDBText22.Visible  := true;
  RLDBText24.Visible  := true;
  RLDBText25.Visible  := true;
  RLDBText26.Visible  := true;
  RLDBText31.Visible  := true;
  RLDBText32.Visible  := true;
  RLDBText33.Visible  := true;

  if ClientDataSet1QTD_RN.AsInteger    <= 0  then  RLDBText30.Visible := false;
  if ClientDataSet1QTD_P.AsInteger     <= 0  then  RLDBText15.Visible := false;
  if ClientDataSet1QTD_M.AsInteger     <= 0  then  RLDBText17.Visible := false;
  if ClientDataSet1QTD_G.AsInteger     <= 0  then  RLDBText18.Visible := false;
  if ClientDataSet1QTD_1.AsInteger     <= 0  then  RLDBText19.Visible := false;
  if ClientDataSet1QTD_2.AsInteger     <= 0  then  RLDBText20.Visible := false;
  if ClientDataSet1QTD_3.AsInteger     <= 0  then  RLDBText21.Visible := false;
  if ClientDataSet1QTD_4.AsInteger     <= 0  then  RLDBText22.Visible := false;
  if ClientDataSet1QTD_6.AsInteger     <= 0  then  RLDBText24.Visible := false;
  if ClientDataSet1QTD_8.AsInteger     <= 0  then  RLDBText25.Visible := false;
  if ClientDataSet1QTD_10.AsInteger    <= 0  then  RLDBText31.Visible := false;
  if ClientDataSet1QTD_12.AsInteger    <= 0  then  RLDBText32.Visible := false;
  if ClientDataSet1QTD_14.AsInteger    <= 0  then  RLDBText33.Visible := false;
  if ClientDataSet1QTD_UNICA.AsInteger <= 0  then  RLDBText26.Visible := false;
end;

end.
