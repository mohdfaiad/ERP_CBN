unit uRelatorioContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  frameBuscaMateria, DB, RLReport, frameBuscaPessoa, TipoPessoa, Grids, DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RLFilters;

type
  TfrmRelatorioContasPagar = class(TfrmPadrao)
    gpbPeriodo: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    rgpFiltroPeriodo: TRadioGroup;
    gpbMateria: TGroupBox;
    rgpLeiaute: TRadioGroup;
    BuscaMateria1: TBuscaMateria;
    rgpStatus: TRadioGroup;
    Panel1: TPanel;
    btnImprimir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ds: TDataSource;
    gpbFornecedor: TGroupBox;
    BuscaFornecedor: TBuscaPessoa;
    Label1: TLabel;
    chkPeriodoGeral: TCheckBox;
    dsItens: TDataSource;
    RLReport2: TRLReport;
    RLGroup2: TRLGroup;
    RLBand4: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLDBText19: TRLDBText;
    RLBand6: TRLBand;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel20: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    RLDraw1: TRLDraw;
    RLBand2: TRLBand;
    RLLabel21: TRLLabel;
    rlbTotalContas: TRLLabel;
    rgpStatusParcela: TRadioGroup;
    RLGroup3: TRLGroup;
    RLBand5: TRLBand;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText20: TRLDBText;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLDBText2: TRLDBText;
    RLBand1: TRLBand;
    RLLabel11: TRLLabel;
    RLLabel7: TRLLabel;
    rlmParcelas: TRLMemo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel25: TRLLabel;
    rlbTotalPago: TRLLabel;
    RLLabel27: TRLLabel;
    rlbTotalSaldo: TRLLabel;
    qry: TFDQuery;
    qryItens: TFDQuery;
    qryCODIGO: TIntegerField;
    qryCODIGO_NF: TIntegerField;
    qryDT_DOCUMENTO: TDateField;
    qryDT_LANCAMENTO: TDateField;
    qryNUM_DOCUMENTO: TIntegerField;
    qrySTATUS: TStringField;
    qryDESC_STATUS: TStringField;
    qryVALOR: TBCDField;
    qryOBSERVACAO: TStringField;
    qryFORNECEDOR: TStringField;
    qryCODIGO_1: TIntegerField;
    qryCODIGO_CONTA: TIntegerField;
    qryCODIGO_MATERIA: TIntegerField;
    qryQUANTIDADE: TBCDField;
    qryPRECO_CUSTO: TBCDField;
    qryTOTAL: TBCDField;
    qryMATERIA: TStringField;
    qryItensCODIGO: TIntegerField;
    qryItensCODIGO_CONTA: TIntegerField;
    qryItensNUM_PARCELA: TSmallintField;
    qryItensDT_VENCIMENTO: TDateField;
    qryItensDT_PAGAMENTO: TDateField;
    qryItensSTATUS: TStringField;
    qryItensDESC_STATUS: TStringField;
    qryItensVALOR: TBCDField;
    qryItensVALOR_PAGO: TBCDField;
    procedure btnImprimirClick(Sender: TObject);
    procedure chkPeriodoGeralClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RLDBText8BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RLReport2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDBText14BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure rgpStatusClick(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLReport2PageStarting(Sender: TObject);
    procedure RLBand6AfterPrint(Sender: TObject);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLGroup2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FTotalContas :Real;
    FMargem :integer;
    FTotalValorParcela, FTotalValorPagoParcela :Real;

    procedure monta_sql;
    procedure carregaParcelas;
  public
    { Public declarations }
  end;

var
  frmRelatorioContasPagar: TfrmRelatorioContasPagar;

implementation

uses StrUtils, RxCurrEdit, StringUtilitario, Math;

{$R *.dfm}

procedure TfrmRelatorioContasPagar.btnImprimirClick(Sender: TObject);
begin
  monta_sql;

  if qry.IsEmpty then
    avisar('Nenhum registro foi encontrado, utilizando os filtros informados.')
  else
    RLReport2.PreviewModal;
end;

procedure TfrmRelatorioContasPagar.monta_sql;
var TDATA :String;
begin
  qry.Close;
  qry.SQL.Clear;

  qry.SQL.Add('SELECT CP.*, (CP.cod_fornecedor || '' ''|| PF.razao) FORNECEDOR, IC.*, (ic.quantidade* ic.preco_custo) total, MT.descricao MATERIA FROM contas_pagar CP ');
  qry.SQL.Add('INNER JOIN pessoas     PF ON PF.codigo = CP.cod_fornecedor ');
  qry.SQL.Add('INNER JOIN itens_conta IC ON IC.codigo_conta = CP.codigo ');
  qry.SQL.Add('INNER JOIN materias    MT ON MT.codigo = IC.codigo_materia ');
  qry.SQL.Add('INNER JOIN parcelas    PA ON PA.codigo_conta = CP.codigo ');
  qry.SQL.Add('WHERE (1=1) ');

  if not chkPeriodoGeral.Checked then
  begin
    TDATA := IfThen(rgpFiltroPeriodo.ItemIndex = 0, 'CP.DT_LANCAMENTO', IfThen(rgpFiltroPeriodo.ItemIndex = 1, 'CP.DT_DOCUMENTO', 'PA.DT_VENCIMENTO'));

    qry.SQL.Add(' AND '+TDATA+' BETWEEN :Dti and :Dtf ');
    qry.ParamByName('dti').AsDateTime := dtpInicio.DateTime;
    qry.ParamByName('dtf').AsDateTime := dtpFim.DateTime;
  end;

  if BuscaFornecedor.edtCodigo.AsInteger > 0 then
  begin
    qry.SQL.Add(' AND CP.COD_FORNECEDOR = :COD_FORNECEDOR ');
    qry.ParamByName('COD_FORNECEDOR').AsInteger := BuscaFornecedor.edtCodigo.AsInteger;
  end;

  if BuscaMateria1.edtCodigo.AsInteger > 0 then
  begin
    qry.SQL.Add(' AND IC.CODIGO_MATERIA = :COD_MATERIA ');
    qry.ParamByName('COD_MATERIA').AsInteger := BuscaMateria1.edtCodigo.AsInteger;
  end;

  qry.SQL.Add(' AND CP.STATUS '+IfThen(rgpStatus.ItemIndex = 4, '<>', '=')+' :STATUS ');
  qry.ParamByName('STATUS').AsString := IfThen(rgpStatus.ItemIndex = 4, 'C', copy(rgpStatus.Items[rgpStatus.itemIndex],1,1) );

  qry.SQL.Add(' group by CP.codigo, CP.codigo_nf, CP.dt_documento, CP.dt_lancamento, CP.num_documento, CP.status, CP.desc_status, ');
  qry.SQL.Add('     CP.valor, CP.observacao, CP.cod_fornecedor, PF.razao, IC.CODIGO,                                             ');
  qry.SQL.Add('     IC.codigo_conta, ic.codigo_materia, ic.quantidade, ic.preco_custo, MT.descricao                              ');

  qry.SQL.Add(' order by CP.CODIGO, IC.CODIGO ');

  qry.Open;
end;

procedure TfrmRelatorioContasPagar.chkPeriodoGeralClick(Sender: TObject);
begin
  dtpInicio.Enabled        := not (chkPeriodoGeral.checked);
  dtpFim.Enabled           := not (chkPeriodoGeral.checked);
  rgpFiltroPeriodo.Enabled := not (chkPeriodoGeral.checked);
end;

procedure TfrmRelatorioContasPagar.FormShow(Sender: TObject);
begin
  dtpInicio.DateTime      := strToDateTime( DateToStr(Date)+' '+'00:00:00');
  dtpFim.DateTime         := strToDateTime( DateToStr(Date)+' '+'23:59:59');
  BuscaFornecedor.TipoPessoa := tpFornecedor;
end;

procedure TfrmRelatorioContasPagar.RLDBText8BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  if Text <> '' then
    rlband1.Height := 55
  else
    rlband1.Height := 38;
end;

procedure TfrmRelatorioContasPagar.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
{  Fmargem := FMargem + RLBand4.height;
  
  if (rgpLeiaute.ItemIndex = 1) then
    carregaParcelas;

  Fmargem := FMargem + RLBand1.height;

  Fmargem := FMargem + ( (qryItens.RecordCount - 1) * rlmParcelas.Height );

  if FMargem > 1090 then
    RLGroup2.PageBreaking := pbBeforePrint;}
end;

procedure TfrmRelatorioContasPagar.carregaParcelas;
var NParcela, DTVencimento, DTPagamento, Valor, ValorPago, Saldo :String;
    valorParcela, valorPagoParcela :Real;
begin
  rlmParcelas.Lines.Clear;
  qryItens.Close;
  qryItens.SQL.Clear;
  qryItens.SQL.Add(' SELECT PA.* FROM contas_pagar CP ');
  qryItens.SQL.Add(' INNER JOIN pessoas     PF ON PF.codigo = CP.cod_fornecedor ');
  qryItens.SQL.Add(' INNER JOIN itens_conta IC ON IC.codigo_conta = CP.codigo ');
  qryItens.SQL.Add(' INNER JOIN materias    MT ON MT.codigo = IC.codigo_materia ');
  qryItens.SQL.Add(' INNER JOIN parcelas    PA ON PA.codigo_conta = CP.codigo ');
  qryItens.SQL.Add(' WHERE PA.CODIGO_CONTA = :cod_conta ');

  if rgpStatusParcela.ItemIndex < 3 then
  begin
    qryItens.SQL.Add(' AND PA.STATUS = :status ');
    qryItens.ParamByName('STATUS').AsString := copy(rgpStatusParcela.Items[rgpStatusParcela.itemIndex],1,1);;
  end;

  qryItens.SQL.Add(' group by PA.codigo, PA.codigo_conta, PA.num_parcela, PA.dt_vencimento, ');
  qryItens.SQL.Add('        PA.dt_pagamento, PA.status, PA.desc_status, PA.valor, PA.valor_pago ');
  qryItens.SQL.Add(' order by 1 ');

  qryItens.ParamByName('cod_conta').AsInteger := qryCODIGO.AsInteger;
  qryItens.Open;

   valorParcela     :=0;
   valorPagoParcela :=0;

  qryItens.First;
  while not qryItens.Eof do
  begin
    NParcela      := TStringUtilitario.CaracterAEsquerda(' ',qryItensNUM_PARCELA.AsString, 2);
    DTVencimento  := qryItensDT_VENCIMENTO.AsString;
    DTPagamento   := IfThen(qryItensDT_PAGAMENTO.AsDateTime > 0, qryItensDT_PAGAMENTO.AsString, '__/__/____');
    Valor         := TStringUtilitario.CaracterAEsquerda(' ',TStringUtilitario.FormataDinheiro( qryItensVALOR.AsFloat ),13);
    ValorPago     := TStringUtilitario.CaracterAEsquerda(' ',TStringUtilitario.FormataDinheiro( qryItensVALOR_PAGO.AsFloat ),13);
    Saldo         := TStringUtilitario.CaracterAEsquerda(' ',TStringUtilitario.FormataDinheiro( qryItensVALOR.AsFloat-qryItensVALOR_PAGO.AsFloat ),13);

    rlmParcelas.Lines.Add('> '+NParcela+StringofChar(' ', 18)+DTVencimento+
                                        StringofChar(' ', 18)+DTPagamento+
                                        StringofChar(' ', 10)+Valor+
                                        StringofChar(' ', 10)+ValorPago+
                                        StringofChar(' ', 20)+Saldo);

    valorParcela     := valorParcela + qryItensVALOR.AsFloat;
    valorPagoParcela := valorPagoParcela + qryItensVALOR_PAGO.AsFloat;

    qryItens.Next;
  end;

  FTotalValorParcela     := FTotalValorParcela + valorParcela;
  FTotalValorPagoParcela := FTotalValorPagoParcela + valorPagoParcela;
  
  rlmParcelas.Lines.Add(StringofChar('-', 170));
  rlmParcelas.Lines.Add(StringofChar(' ', 85)+TStringUtilitario.CaracterAEsquerda(' ',TStringUtilitario.FormataDinheiro(valorParcela),13)+
                        StringofChar(' ', 10)+TStringUtilitario.CaracterAEsquerda(' ',TStringUtilitario.FormataDinheiro(valorPagoParcela),13)+
                        StringofChar(' ', 20)+TStringUtilitario.CaracterAEsquerda(' ',TStringUtilitario.FormataDinheiro(valorParcela - valorPagoParcela),10));

  rlband1.Visible := not(rlmParcelas.Lines.Text = '');
end;

procedure TfrmRelatorioContasPagar.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (ssCtrl in Shift) AND (Key = ord('P')) then
    btnImprimir.Click;
end;

procedure TfrmRelatorioContasPagar.RLReport2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  rlbTotalContas.Caption      := '0,00';
  FTotalContas                := 0;
  RLband5.Height              := IfThen(rgpLeiaute.ItemIndex = 1, 19,0);
  rlband1.Visible             := (rgpLeiaute.ItemIndex = 1);
  rlDraw1.Brush.Color         := IfThen(rgpLeiaute.ItemIndex = 1, $00D7D7D7, clwhite);
  rlDraw1.Borders.DrawBottom  := not(rgpLeiaute.ItemIndex = 1);
  FTotalValorParcela           := 0;
  FTotalValorPagoParcela       := 0;
end;

procedure TfrmRelatorioContasPagar.RLDBText14BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
var valor :Real;
begin
  valor := StrToFloat(TStringUtilitario.RemoveCaracter(Text, '.'));

  FTotalContas := FTotalContas + valor;
end;

procedure TfrmRelatorioContasPagar.rgpStatusClick(Sender: TObject);
begin
  if rgpStatus.ItemIndex in [0,1,3] then
  begin
    rgpStatusParcela.ItemIndex := 3;
    rgpStatusParcela.Enabled   := false;
  end
  else
    rgpStatusParcela.Enabled   := true;
end;

procedure TfrmRelatorioContasPagar.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  rlbTotalContas.Caption := TStringUtilitario.FormataDinheiro( FTotalContas );
  rlbTotalPago.Caption   := TStringUtilitario.FormataDinheiro( FTotalValorPagoParcela );
  rlbTotalSaldo.Caption  := TStringUtilitario.FormataDinheiro( FTotalValorParcela - FTotalValorPagoParcela );
end;

procedure TfrmRelatorioContasPagar.RLReport2PageStarting(Sender: TObject);
begin
  FMargem := 0;
  RLGroup2.PageBreaking := pbNone;
end;

procedure TfrmRelatorioContasPagar.RLBand6AfterPrint(Sender: TObject);
begin
  Fmargem := RLBand6.Height;
end;

procedure TfrmRelatorioContasPagar.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  Fmargem := FMargem + RLBand5.height; 
end;

procedure TfrmRelatorioContasPagar.RLGroup2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  Fmargem := FMargem + RLBand4.height;
  
  if (rgpLeiaute.ItemIndex = 1) then
    carregaParcelas;

  Fmargem := FMargem + RLBand1.height;

  Fmargem := FMargem + ( (qryItens.RecordCount - 1) * rlmParcelas.Height );

  if FMargem > 1090 then
  //  RLGroup2.PageBreaking := pbBeforePrint;
end;

end.
