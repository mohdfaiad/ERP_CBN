unit uRelatorioReferencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, frameBuscaPedido, ExtCtrls,
  frameBuscaReferencia, Grids, DBGrids, DBGridCBN, Provider, DB, DBClient, RLReport,
  RLXLSFilter, RLFilters, RLPDFFilter, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmRelatorioReferencias = class(TfrmPadrao)
    Panel1: TPanel;
    gpbReferencia: TGroupBox;
    BuscaReferencia1: TBuscaReferencia;
    gpbPedido: TGroupBox;
    BuscaPedido1: TBuscaPedido;
    Splitter1: TSplitter;
    dsRel: TDataSource;
    cdsRel: TClientDataSet;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    GridUsuarios: TDBGridCBN;
    cdsRelREFERENCIA: TStringField;
    cdsRelPRODUTO: TStringField;
    cdsRelCOR: TStringField;
    cdsRelGRADE: TStringField;
    cdsRelTAMANHO: TStringField;
    cdsRelCOD_BARRA: TStringField;
    cdsRelCOD_GRUPO: TIntegerField;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    cdsRelGRUPO: TStringField;
    RLLabel8: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    GroupBox1: TGroupBox;
    btnImprimir: TSpeedButton;
    RLXLSFilter1: TRLXLSFilter;
    RLDraw2: TRLDraw;
    SaveDialog1: TSaveDialog;
    btnSalvaPDF: TBitBtn;
    cdsRelCODIGO: TStringField;
    Label1: TLabel;
    RLPDFFilter1: TRLPDFFilter;
    btnAdicionar: TBitBtn;
    rgTipoInsercao: TRadioGroup;
    qry: TFDQuery;
    cdsREFERENCIA: TStringField;
    cdsCOD_PRODUTO: TIntegerField;
    cdsPRODUTO: TStringField;
    cdsCOD_COR: TIntegerField;
    cdsCOR: TStringField;
    cdsCOD_GRADE: TIntegerField;
    cdsGRADE: TStringField;
    cdsQTD_RN: TIntegerField;
    cdsQTD_P: TIntegerField;
    cdsCOD_GRUPO: TIntegerField;
    cdsGRUPO: TStringField;
    cdsQTD_M: TIntegerField;
    cdsQTD_G: TIntegerField;
    cdsQTD_1: TIntegerField;
    cdsQTD_2: TIntegerField;
    cdsQTD_3: TIntegerField;
    cdsQTD_4: TIntegerField;
    cdsQTD_6: TIntegerField;
    cdsQTD_8: TIntegerField;
    cdsQTD_UNICA: TBCDField;
    procedure rgTipoInsercaoClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSalvaPDFClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridUsuariosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure adicionar_do_pedido;
    procedure adicionar_individualmente;
    procedure adiciona(tamanho:String);

    function seleciona_cod_barras (tamanho :String):String;
  public
    { Public declarations }
  end;

var
  frmRelatorioReferencias: TfrmRelatorioReferencias;

implementation

uses funcoes;

{$R *.dfm}

procedure TfrmRelatorioReferencias.rgTipoInsercaoClick(Sender: TObject);
begin
  inherited;
  gpbPedido.Visible     := (rgTipoInsercao.ItemIndex = 0);
  gpbReferencia.Visible := (rgTipoInsercao.ItemIndex = 1);

  if gpbPedido.Visible then      BuscaPedido1.edtNumPedido.SetFocus;
  if gpbReferencia.Visible then  BuscaReferencia1.edtCodigo.SetFocus;
end;

procedure TfrmRelatorioReferencias.btnAdicionarClick(Sender: TObject);
begin
  try

    if rgTipoInsercao.ItemIndex = 0 then
      adicionar_do_pedido
    else
      adicionar_individualmente;

    cdsRel.IndexFieldNames := 'COD_GRUPO';

  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;    
end;

procedure TfrmRelatorioReferencias.adicionar_do_pedido;
begin
  cdsRel.EmptyDataSet;

  cds.Close;
  qry.ParamByName('cod_pedido').AsInteger := BuscaPedido1.codigo;
  cds.Open;

  cds.First;
  while not cds.Eof do begin

    if cdsQTD_RN.AsInteger > 0    then   adiciona( 'RN'    );
    if cdsQTD_P.AsInteger > 0     then   adiciona( 'P'     );
    if cdsQTD_M.AsInteger > 0     then   adiciona( 'M'     );
    if cdsQTD_G.AsInteger > 0     then   adiciona( 'G'     );
    if cdsQTD_1.AsInteger > 0     then   adiciona( '1'     );
    if cdsQTD_2.AsInteger > 0     then   adiciona( '2'     );
    if cdsQTD_3.AsInteger > 0     then   adiciona( '3'     );
    if cdsQTD_4.AsInteger > 0     then   adiciona( '4'     );
    if cdsQTD_6.AsInteger > 0     then   adiciona( '6'     );
    if cdsQTD_8.AsInteger > 0     then   adiciona( '8'     );
    if cdsQTD_UNICA.AsInteger > 0 then   adiciona( 'UNICA' );

    cds.Next;
  end;

  BuscaPedido1.limpa;
  BuscaPedido1.edtNumPedido.Clear;
end;

procedure TfrmRelatorioReferencias.adicionar_individualmente;
begin
  try
    BuscaReferencia1.cds_selecionados.first;

    while not BuscaReferencia1.cds_selecionados.Eof do begin

      if not (cdsRel.Locate('CODIGO', BuscaReferencia1.cds_selecionados.Fields[0].AsString, []) )
         and (BuscaReferencia1.edtCodigo.AsInteger > 0) then begin

        BuscaReferencia1.codReferencia := BuscaReferencia1.cds_selecionados.Fields[0].AsString;

        cdsRel.Append;
        cdsRelCODIGO.asString     := BuscaReferencia1.edtCodigo.text;
        cdsRelREFERENCIA.AsString := BuscaReferencia1.edtReferencia.Text;
        cdsRelPRODUTO.AsString    := BuscaReferencia1.produto;
        cdsRelCOR.AsString        := BuscaReferencia1.edtCor.Text;
        cdsRelGRADE.AsString      := BuscaReferencia1.edtGrade.Text;
        cdsRelTAMANHO.AsString    := BuscaReferencia1.edtTamanho.Text;
        cdsRelCOD_BARRA.AsString  := BuscaReferencia1.numeracao;
        cdsRelCOD_GRUPO.AsInteger := BuscaReferencia1.codGrupo;
        cdsRelGRUPO.AsString      := BuscaReferencia1.grupo;
        cdsRel.Post;

      end;

      BuscaReferencia1.cds_selecionados.next;
    end;

    BuscaReferencia1.limpa;
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmRelatorioReferencias.adiciona(tamanho: String);
var codigo_de_barras :String;
begin
  codigo_de_barras := seleciona_cod_barras(tamanho);

  if codigo_de_barras = '' then exit;

  cdsRel.Append;
  cdsRelREFERENCIA.AsString := cdsREFERENCIA.AsString;
  cdsRelPRODUTO.AsString    := cdsPRODUTO.AsString;
  cdsRelCOR.AsString        := cdsCOR.AsString;
  cdsRelGRADE.AsString      := cdsGRADE.AsString;
  cdsRelTAMANHO.AsString    := tamanho;
  cdsRelCOD_BARRA.AsString  := codigo_de_barras;
  cdsRelCOD_GRUPO.AsInteger := cdsCOD_GRUPO.AsInteger;
  cdsRelGRUPO.AsString      := cdsGRUPO.AsString;
  cdsRel.Post;
end;

function TfrmRelatorioReferencias.seleciona_cod_barras(tamanho: String): String;
var codigo_tamanho :String;
begin
  result         := '';
  codigo_tamanho := Campo_por_campo('TAMANHOS', 'CODIGO', 'DESCRICAO', tamanho);
  result         := buscaCodigoBarras(cdscod_produto.AsInteger, cdscod_cor.AsInteger, strToIntDef(codigo_tamanho, 0), cdsCOD_GRADE.AsInteger);
end;

procedure TfrmRelatorioReferencias.FormCreate(Sender: TObject);
begin
  inherited;
  cdsrel.CreateDataSet;
end;

procedure TfrmRelatorioReferencias.btnImprimirClick(Sender: TObject);
begin
  if not cdsRel.IsEmpty then
    RLReport1.PreviewModal;

end;

procedure TfrmRelatorioReferencias.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( (ssCtrl in Shift) AND (Key = ord('P')) ) then  btnImprimir.Click;
end;

procedure TfrmRelatorioReferencias.btnSalvaPDFClick(Sender: TObject);
begin
  if cdsRel.IsEmpty then exit;

  SaveDialog1.Execute;

  if SaveDialog1.FileName <> '' then begin

    RLReport1.SaveToFile( SaveDialog1.FileName );
    RLReport1.Prepare;

  end;
end;

procedure TfrmRelatorioReferencias.FormShow(Sender: TObject);
begin
  BuscaPedido1.edtNumPedido.SetFocus;
end;

procedure TfrmRelatorioReferencias.GridUsuariosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_delete then
    cdsRel.Delete;
end;

end.

