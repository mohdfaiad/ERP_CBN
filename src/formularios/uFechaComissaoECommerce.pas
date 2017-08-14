unit uFechaComissaoECommerce;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, DateUtils, ComObj, FileCtrl,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, RLReport, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RLFilters, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, RxCurrEdit, frameBuscaPessoa, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, RLXLSFilter;

type
  TfrmFechaComissaoECommerce = class(TfrmPadrao)
    Panel1: TPanel;
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
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnSalvarExcel: TBitBtn;
    procedure btnBuscarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDevolucoesChange(Sender: TObject);
    procedure edtIRRFChange(Sender: TObject);
    procedure edtFreteReversaChange(Sender: TObject);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure btnSalvarExcelClick(Sender: TObject);
  private
    procedure buscaPedidos;
    procedure carregaValores;
    procedure limpa_dados;
    procedure atualizaRepasse;
    procedure atualizaComissao;
    procedure gerarPlanilhaExcel(caminho :String);
  public
    { Public declarations }
  end;

var
  frmFechaComissaoECommerce: TfrmFechaComissaoECommerce;

implementation

uses TipoPessoa, Math;

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

procedure TfrmFechaComissaoECommerce.btnSalvarExcelClick(Sender: TObject);
var Dir :String;
begin
  if qry.IsEmpty then
    avisar('Primeiramente efetue a busca acima')
  else if selectdirectory('Select a directory', '', Dir) then
    gerarPlanilhaExcel(dir+'\Fechamento_EC_'+FormatDateTime('mm_yyyy',dtpInicio.Date)+'.xlsx');
end;

procedure TfrmFechaComissaoECommerce.gerarPlanilhaExcel(caminho :String);
var objExcel,Sheet,Chart,s : Variant;
    cTitulo: string;
    i, linha : integer;
    valorTotal :Real;
begin
 try
 try
   cTitulo := 'Relatório de Clientes';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := False;
   objExcel.Caption := cTitulo;

   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;

   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

   Sheet.Range['A1:D1'].Mergecells := True;
   Sheet.Range['E1:F1'].Mergecells := True;
   Sheet.Range['A2:D2'].Mergecells := True;
   Sheet.Range['E2:F2'].Mergecells := True;
   Sheet.Range['A3:F3'].Mergecells := True;
   Sheet.Range['A1:F1'].font.bold  := true;

   Sheet.Range['A1'] := 'Representante';
   Sheet.Range['E1'] := 'Período';
   Sheet.Range['A2'] := BuscaPessoa1.edtRazao.Text;
   Sheet.Range['E2'] := DateToStr(dtpInicio.Date) + ' a ' + DateToStr(dtpFim.Date);
   Sheet.Range['A3'] := 'PEDIDOS ENTREGUES';
   Sheet.Range['A3'].Interior.Color      := $00F3EEE4;
   Sheet.Range['A3'].HorizontalAlignment := 3;

   Sheet.Range['A4'] := 'Data';
   Sheet.Range['A4'].ColumnWidth := 10;
   Sheet.Range['B4'] := 'Nº Pedido';
   Sheet.Range['B4'].ColumnWidth := 10;
   Sheet.Range['C4'] := 'Cliente';
   Sheet.Range['C4'].ColumnWidth := 40;
   Sheet.Range['D4'] := 'Valor';
   Sheet.Range['D4'].ColumnWidth := 15;
   Sheet.Range['E4'] := '% Comissão';
   Sheet.Range['E4'].ColumnWidth := 15;
   Sheet.Range['F4'] := 'Vlr. Comissão';
   Sheet.Range['F4'].ColumnWidth := 15;
   Sheet.Range['A4:F4'].font.bold  := true;

   linha := 4;

   valorTotal := 0;
   qry.First;
   while not qry.Eof do begin
     inc(linha);
     Sheet.Range['A'+intToStr(linha)+':F'+intToStr(linha)].Interior.Color := IfThen((linha mod 2) = 0 ,$00F5F5F5, clWhite);
     Sheet.Cells[linha,1] := qryDT_ENVIO.AsString;
     Sheet.Cells[linha,2] := qryNUMPEDIDO.AsString;
     Sheet.Cells[linha,3] := qryCLIENTE.AsString;
     Sheet.Cells[linha,4].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
     Sheet.Cells[linha,4] := qryVALOR_TOTAL.AsFloat;
     Sheet.Cells[linha,5].NumberFormat := '0,00';
     Sheet.Cells[linha,5] := qryCOMISSAO.AsFloat;
     Sheet.Cells[linha,6].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
     Sheet.Cells[linha,6] := qryVLRCOMISSAO.AsFloat;

     valorTotal := valorTotal + qryVALOR_TOTAL.AsFloat;

     qry.Next;
   end;
   inc(linha);
   Sheet.Range['A'+intToStr(linha)+':C'+intToStr(linha)].Mergecells := True;
   Sheet.Range['A'+intToStr(linha)].HorizontalAlignment := 4;
   Sheet.Range['A'+intToStr(linha)] := 'Total Pedido';
   Sheet.Cells[linha,4].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
   Sheet.Range['D'+intToStr(linha)] := valorTotal;
   Sheet.Range['A'+intToStr(linha)+':D'+intToStr(linha)].font.bold  := true;
   Sheet.Range['A'+intToStr(linha)+':F'+intToStr(linha)].Interior.Color := clWhite;
   inc(linha);
   inc(linha);
   Sheet.Range['A'+intToStr(linha)+':C'+intToStr(linha)].Mergecells := True;
   Sheet.Range['A'+intToStr(linha)] := 'BALANÇO';
   Sheet.Range['A'+intToStr(linha)+':A'+intToStr(linha)].font.bold  := true;
   inc(linha);
   Sheet.Range['A'+intToStr(linha)+':B'+intToStr(linha)].Mergecells := True;
   Sheet.Range['A'+intToStr(linha)] := 'Comissão parceiro';
   Sheet.Cells[linha,3].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
   Sheet.Range['C'+intToStr(linha)] := 0;
   inc(linha);
   Sheet.Range['A'+intToStr(linha)+':B'+intToStr(linha)].Mergecells := True;
   Sheet.Range['A'+intToStr(linha)] := 'Venda bruta';
   Sheet.Cells[linha,3].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
   Sheet.Range['C'+intToStr(linha)] := edtVendaBruta.Value;
   inc(linha);
   Sheet.Range['A'+intToStr(linha)+':B'+intToStr(linha)].Mergecells := True;
   Sheet.Range['A'+intToStr(linha)] := 'Devoluções';
   Sheet.Cells[linha,3].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
   Sheet.Range['C'+intToStr(linha)] := edtDevolucoes.Value;
   inc(linha);
   Sheet.Range['A'+intToStr(linha)+':B'+intToStr(linha)].Mergecells := True;
   Sheet.Range['A'+intToStr(linha)] := 'Venda líquida';
   Sheet.Cells[linha,3].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
   Sheet.Range['C'+intToStr(linha)] := edtVendaLiquida.Value;
   inc(linha);
   Sheet.Range['A'+intToStr(linha)+':B'+intToStr(linha)].Mergecells := True;
   Sheet.Range['A'+intToStr(linha)] := '( - ) Comissão';
   Sheet.Cells[linha,3].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
   Sheet.Range['C'+intToStr(linha)] := edtComissao.Value;
   inc(linha);
   Sheet.Range['A'+intToStr(linha)+':B'+intToStr(linha)].Mergecells := True;
   Sheet.Range['A'+intToStr(linha)] := 'IRRF Sobre comissão';
   Sheet.Cells[linha,3].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
   Sheet.Range['C'+intToStr(linha)] := edtIRRF.Value;
   inc(linha);
   Sheet.Range['A'+intToStr(linha)+':B'+intToStr(linha)].Mergecells := True;
   Sheet.Range['A'+intToStr(linha)] := 'Frete Site';
   Sheet.Cells[linha,3].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
   Sheet.Range['C'+intToStr(linha)] := edtFreteSite.Value;
   inc(linha);
   Sheet.Range['A'+intToStr(linha)+':B'+intToStr(linha)].Mergecells := True;
   Sheet.Range['A'+intToStr(linha)] := '( - ) Frete reversa';
      Sheet.Cells[linha,3].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
   Sheet.Range['C'+intToStr(linha)] := edtFreteReversa.Value;
   inc(linha);
   Sheet.Range['A'+intToStr(linha)+':B'+intToStr(linha)].Mergecells := True;
   Sheet.Range['A'+intToStr(linha)] := 'Repasse';
   Sheet.Range['A'+intToStr(linha)+':C'+intToStr(linha)].font.bold  := true;
   Sheet.Cells[linha,3].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
   Sheet.Range['C'+intToStr(linha)] := edtRepasse.Value;

   Sheet.SaveAs(caminho);

   avisar('Planílha gerada com sucesso!');
 Except
  on e :Exception do
    avisar('Erro ao gerar planílha'+#13#10+e.Message);
 end;
 finally
   PostMessage(FindWindow('XLMAIN', nil), WM_CLOSE,0,0);
   Sheet := Unassigned;
   objExcel.Quit;
 end;
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
