unit uFechaComissaoECommerce;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, DateUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, RLReport, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RLFilters, RLPDFFilter, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, RxCurrEdit, frameBuscaPessoa, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmFechaComissaoECommerce = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Label32: TLabel;
    Label33: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    BuscaPessoa1: TBuscaPessoa;
    btnBuscar: TBitBtn;
    edtVendaBruta: TCurrencyEdit;
    Label17: TLabel;
    Label1: TLabel;
    edtDevolucoes: TCurrencyEdit;
    Label2: TLabel;
    edtVendaLiquida: TCurrencyEdit;
    Label3: TLabel;
    edtComissao: TCurrencyEdit;
    Label4: TLabel;
    edtIRRF: TCurrencyEdit;
    Label5: TLabel;
    edtFreteSite: TCurrencyEdit;
    Label6: TLabel;
    edtFreteReversa: TCurrencyEdit;
    Label7: TLabel;
    edtRepasse: TCurrencyEdit;
    BitBtn2: TBitBtn;
    RLPDFFilter1: TRLPDFFilter;
    qry: TFDQuery;
    ds: TDataSource;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel1: TRLLabel;
    RLLabel3: TRLLabel;
    rlPeriodo: TRLLabel;
    rlRepresentante: TRLLabel;
    RLLabel27: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel10: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand2: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLBand9: TRLBand;
    RLLabel16: TRLLabel;
    qryDATA_SAIDA: TSQLTimeStampField;
    qryCOD_REPRES: TIntegerField;
    qryCANCELADO: TStringField;
    qryDT_ENVIO: TDateField;
    qryDIA_PEDIDO: TSmallintField;
    qryCLIENTE: TStringField;
    qryFPGTO: TStringField;
    qryNUMPEDIDO: TStringField;
    qryCOMISSAO: TBCDField;
    qryVALOR_TOTAL: TBCDField;
    qryVLRCOMISSAO: TBCDField;
    RLBand5: TRLBand;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    rlbComissaoParceiro: TRLLabel;
    rlbVendaBruta: TRLLabel;
    rlbDevolucoes: TRLLabel;
    rlbVendaLiquida: TRLLabel;
    rlbComissao: TRLLabel;
    rlbIRRF: TRLLabel;
    rlbFreteSite: TRLLabel;
    rlbFreteReversa: TRLLabel;
    rlbRepasse: TRLLabel;
    Label8: TLabel;
    edtComissaoParceiro: TCurrencyEdit;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    qryFRETE: TBCDField;
    procedure btnBuscarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDevolucoesChange(Sender: TObject);
    procedure edtIRRFChange(Sender: TObject);
    procedure edtFreteReversaChange(Sender: TObject);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    procedure buscaPedidos;
    procedure carregaValores;
    procedure limpa_dados;
    procedure atualizaRepasse;
    procedure atualizaComissao;
  public
    { Public declarations }
  end;

var
  frmFechaComissaoECommerce: TfrmFechaComissaoECommerce;

implementation

uses TipoPessoa;

{$R *.dfm}

procedure TfrmFechaComissaoECommerce.atualizaComissao;
begin
  edtComissao.Value := ((edtVendaLiquida.Value + edtFreteSite.Value) * edtComissaoParceiro.Value)/100;
end;

procedure TfrmFechaComissaoECommerce.atualizaRepasse;
begin
  edtRepasse.Value := edtVendaLiquida.Value - edtComissao.Value + edtIRRF.Value + edtFreteSite.Value - edtFreteReversa.Value;
end;

procedure TfrmFechaComissaoECommerce.BitBtn1Click(Sender: TObject);
begin
  if qry.IsEmpty then
    avisar('Nenhum registro foi encontrado utilizando os filtros informados')
  else
    RLReport1.PreviewModal;
end;

procedure TfrmFechaComissaoECommerce.btnBuscarClick(Sender: TObject);
begin
  if BuscaPessoa1.edtCodigo.AsInteger <= 0 then begin
    BuscaPessoa1.edtCodigo.SetFocus;
    avisar('Favor selecionar o representante');
  end
  else
    buscaPedidos;
end;

procedure TfrmFechaComissaoECommerce.buscaPedidos;
begin
  limpa_dados;

  qry.Close;
  qry.ParamByName('dt_ini').AsDateTime  := dtpInicio.DateTime;
  qry.ParamByName('dt_fim').AsDateTime  := dtpFim.DateTime;
  qry.ParamByName('codrep').AsInteger   := BuscaPessoa1.edtCodigo.AsInteger;
  qry.Open;

  if not qry.IsEmpty then
    carregaValores;
end;

procedure TfrmFechaComissaoECommerce.carregaValores;
begin
  qry.First;
  while not qry.Eof do
  begin
    edtVendaBruta.Value   := edtVendaBruta.Value + (qryVALOR_TOTAL.AsFloat - qryFRETE.AsFloat);
    edtVendaLiquida.Value := edtVendaBruta.Value;
    //edtComissao.Value     := edtComissao.Value + qryVLRCOMISSAO.AsFloat;
    edtFreteSite.Value    := edtFreteSite.Value + qryFRETE.AsFloat;
    qry.Next;
  end;
  edtComissaoParceiro.Value := qryCOMISSAO.AsFloat;
  atualizaComissao;
  atualizaRepasse;
end;

procedure TfrmFechaComissaoECommerce.edtDevolucoesChange(Sender: TObject);
begin
  edtVendaLiquida.Value := edtVendaBruta.Value - edtDevolucoes.Value;
  if edtVendaLiquida.Value < 0 then
    edtVendaLiquida.Clear;

  atualizaComissao;
  atualizaRepasse;
end;

procedure TfrmFechaComissaoECommerce.edtFreteReversaChange(Sender: TObject);
begin
  inherited;
  atualizaRepasse;
end;

procedure TfrmFechaComissaoECommerce.edtIRRFChange(Sender: TObject);
begin
  atualizaRepasse;
end;

procedure TfrmFechaComissaoECommerce.FormShow(Sender: TObject);
begin
  BuscaPessoa1.TipoPessoa := tpRepresentante;
  dtpInicio.DateTime      := StrToDateTime(FormatDateTime('dd/mm/yyyy 00:00:00',StartOfTheMonth(Date)));
  dtpFim.DateTime         := StrToDateTime(FormatDateTime('dd/mm/yyyy 23:59:59',Date));
end;

procedure TfrmFechaComissaoECommerce.limpa_dados;
begin
  edtVendaBruta.Clear;
  edtDevolucoes.Clear;
  edtVendaLiquida.Clear;
  edtComissao.Clear;
  edtIRRF.Clear;
  edtFreteSite.Clear;
  edtFreteReversa.Clear;
  edtRepasse.Clear;
  edtDevolucoes.SetFocus;
end;

procedure TfrmFechaComissaoECommerce.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  rlRepresentante.Caption   := BuscaPessoa1.edtCodigo.Text + ' - ' + BuscaPessoa1.edtRazao.Text;
  rlPeriodo.Caption         := DateToStr(dtpInicio.Date)+ ' a ' +DateToStr(dtpFim.Date);

  rlbVendaBruta.Caption     := FormatFloat(' ,0.00; -,0.00', edtVendaBruta.Value);
  rlbVendaBruta.Caption     := FormatFloat(' ,0.00; -,0.00', edtVendaBruta.Value);
  rlbDevolucoes.Caption     := FormatFloat(' ,0.00; -,0.00', edtDevolucoes.Value);
  rlbVendaLiquida.Caption   := FormatFloat(' ,0.00; -,0.00', edtVendaLiquida.Value);
  rlbComissao.Caption       := FormatFloat(' ,0.00; -,0.00', edtComissao.Value);
  rlbIRRF.Caption           := FormatFloat(' ,0.00; -,0.00', edtIRRF.Value);
  rlbFreteSite.Caption      := FormatFloat(' ,0.00; -,0.00', edtFreteSite.Value);
  rlbFreteReversa.Caption   := FormatFloat(' ,0.00; -,0.00', edtFreteReversa.Value);
  rlbRepasse.Caption        := FormatFloat(' ,0.00; -,0.00', edtRepasse.Value);
end;

end.
