unit uRelatorioCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, system.StrUtils,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, RLReport,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, math;

type
  TfrmRelatorioCaixa = class(TfrmPadrao)
    Panel1: TPanel;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    gpbPeriodo: TGroupBox;
    Label6: TLabel;
    dtpInicio: TDateTimePicker;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    lbPeriodo: TRLLabel;
    RLBTitulo: TRLBand;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLDraw1: TRLDraw;
    qry: TFDQuery;
    ds: TDataSource;
    qryTOTAL: TBCDField;
    qryDESCONTO: TBCDField;
    qryVP1: TBCDField;
    qryVP2: TBCDField;
    qryVP3: TBCDField;
    qryVP4: TBCDField;
    RLBand2: TRLBand;
    RLDraw2: TRLDraw;
    RLLabel12: TRLLabel;
    RLBand3: TRLBand;
    qryMovimentos: TFDQuery;
    dsMovimentos: TDataSource;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    rlbDinheiro: TRLLabel;
    rlbConvenio: TRLLabel;
    rlbCartaoCredito: TRLLabel;
    rlbCartaoDebito: TRLLabel;
    rlbDesconto: TRLLabel;
    rlbTotal: TRLLabel;
    qryMovimentosTIPO_MOVIMENTO: TStringField;
    qryMovimentosVLR_ENTRADA: TBCDField;
    qryMovimentosVLR_SAIDA: TBCDField;
    qryMovimentosVALOR: TBCDField;
    qryMovimentosDESCRICAO: TStringField;
    qryMovimentosTIPO_MOEDA: TStringField;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    rlbDinheiroE: TRLLabel;
    rlbConvenioE: TRLLabel;
    rlbCartaoCreditoE: TRLLabel;
    rlbCartaoDebitoE: TRLLabel;
    rlbTotalE: TRLLabel;
    rlbDinheiroS: TRLLabel;
    rlbConvenioS: TRLLabel;
    rlbCartaoCreditoS: TRLLabel;
    rlbCartaoDebitoS: TRLLabel;
    rlbTotalS: TRLLabel;
    rlbResultDinheiro: TRLLabel;
    rlbResultConvenio: TRLLabel;
    rlbResultCartCred: TRLLabel;
    rlbResultCartDeb: TRLLabel;
    rlbResultDesconto: TRLLabel;
    rlbResultTotal: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel4: TRLLabel;
    RLDraw4: TRLDraw;
    rlbValorAbertura: TRLLabel;
    rlbTotalGeral: TRLLabel;
    RLDraw5: TRLDraw;
    qryDATA: TDateField;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    procedure imprimir;
  public
    { Public declarations }
  end;

var
  frmRelatorioCaixa: TfrmRelatorioCaixa;

implementation

uses EspecificacaoCaixaPorData, Caixa, fabricaRepositorio, repositorio;

{$R *.dfm}

procedure TfrmRelatorioCaixa.btnImprimirClick(Sender: TObject);
begin
  imprimir;
end;

procedure TfrmRelatorioCaixa.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmRelatorioCaixa.FormShow(Sender: TObject);
begin
  dtpInicio.DateTime := Date;
end;

procedure TfrmRelatorioCaixa.imprimir;
var totDinheiroP, totConvenioP, totCartCredP, totCartDebP, totProdutos, totDesconto,
    totDinheiroE, totConvenioE, totCartCredE, totCartDebE, totEntradas,
    totDinheiroS, totConvenioS, totCartCredS, totCartDebS, totSaidas, valorAbertura :Real;
    especificacao :TEspecificacaoCaixaPorData;
    repositorio :TRepositorio;
    Caixa       :TCaixa;
begin
  lbPeriodo.Caption := 'Relatório do dia '+DateToStr(dtpInicio.Date);
  totDinheiroP := 0; totConvenioP := 0; totCartCredP := 0; totCartDebP := 0; totProdutos := 0; totDesconto := 0;
  totDinheiroE := 0; totConvenioE := 0; totCartCredE := 0; totCartDebE := 0; totEntradas := 0;
  totDinheiroS := 0; totConvenioS := 0; totCartCredS := 0; totCartDebS := 0; totSaidas := 0; valorAbertura := 0;

  qry.Close;
  qry.ParambyName('dti').AsDateTime := StrToDateTime(DateToStr(dtpInicio.Date)+' 00:00:00');
  qry.ParambyName('dtf').AsDateTime := StrToDateTime(DateToStr(dtpInicio.Date)+' 23:59:59');
  qry.Open;

  if not qry.IsEmpty then
  begin
    totDinheiroP := qryVP1.AsFloat;
    totConvenioP := qryVP2.AsFloat;
    totCartCredP := qryVP3.AsFloat;
    totCartDebP  := qryVP4.AsFloat;
    totDesconto  := qryDESCONTO.AsFloat;
    totProdutos  := qryVP1.AsFloat+qryVP2.AsFloat+qryVP3.AsFloat+qryVP4.AsFloat-qryDESCONTO.AsFloat;
  end;

  rlbDinheiro.Caption      := FormatFloat(' ,0.00; -,0.00;', totDinheiroP);
  rlbConvenio.Caption      := FormatFloat(' ,0.00; -,0.00;', totConvenioP);
  rlbCartaoCredito.Caption := FormatFloat(' ,0.00; -,0.00;', totCartCredP);
  rlbCartaoDebito.Caption  := FormatFloat(' ,0.00; -,0.00;', totCartDebP);
  rlbDesconto.Caption      := FormatFloat(' ,0.00; -,0.00;', totDesconto);
  rlbTotal.Caption         := FormatFloat(' ,0.00; -,0.00;', totProdutos);

  qryMovimentos.Close;
  qryMovimentos.ParambyName('dti').AsDateTime := StrToDateTime(DateToStr(dtpInicio.Date)+' 00:00:00');
  qryMovimentos.ParambyName('dtf').AsDateTime := StrToDateTime(DateToStr(dtpInicio.Date)+' 23:59:59');
  qryMovimentos.Open;

  rlband2.Visible := not qryMovimentos.IsEmpty;
  rlband3.Visible := not qryMovimentos.IsEmpty;
  if not qryMovimentos.IsEmpty then
  begin
    qryMovimentos.First;
    while not qryMovimentos.Eof do
    begin
      if qryMovimentosTIPO_MOVIMENTO.AsString = 'ENTRADA' then
        case AnsiIndexStr(UpperCase(qryMovimentosTIPO_MOEDA.AsString), ['DINHEIRO', 'CONVÊNIO','CARTÃO CRÉDITO','CARTÃO DÉBITO']) of
          0 : totDinheiroE := totDinheiroE + qryMovimentosVALOR.AsFloat;
          1 : totConvenioE := totConvenioE + qryMovimentosVALOR.AsFloat;
          2 : totCartCredE := totCartCredE + qryMovimentosVALOR.AsFloat;
          3 : totCartDebE  := totCartDebE  + qryMovimentosVALOR.AsFloat;
        end
      else
        case AnsiIndexStr(UpperCase(qryMovimentosTIPO_MOEDA.AsString), ['DINHEIRO', 'CONVÊNIO','CARTÃO CRÉDITO','CARTÃO DÉBITO']) of
          0 : totDinheiroS := totDinheiroS + qryMovimentosVALOR.AsFloat;
          1 : totConvenioS := totConvenioS + qryMovimentosVALOR.AsFloat;
          2 : totCartCredS := totCartCredS + qryMovimentosVALOR.AsFloat;
          3 : totCartDebS  := totCartDebS  + qryMovimentosVALOR.AsFloat;
        end;

      qryMovimentos.Next;
    end;
    qryMovimentos.First;

    totEntradas := totDinheiroE+totConvenioE+totCartCredE+totCartDebE;
    totSaidas   := totDinheiroS+totConvenioS+totCartCredS+totCartDebS;
  end;

  rlbDinheiroE.Caption      := FormatFloat(' ,0.00; -,0.00;', totDinheiroE);
  rlbConvenioE.Caption      := FormatFloat(' ,0.00; -,0.00;', totConvenioE);
  rlbCartaoCreditoE.Caption := FormatFloat(' ,0.00; -,0.00;', totCartCredE);
  rlbCartaoDebitoE.Caption  := FormatFloat(' ,0.00; -,0.00;', totCartDebE);
  rlbTotalE.Caption         := FormatFloat(' ,0.00; -,0.00;', totEntradas);
  rlbDinheiroS.Caption      := FormatFloat(' ,0.00; -,0.00;', totDinheiroS);
  rlbConvenioS.Caption      := FormatFloat(' ,0.00; -,0.00;', totConvenioS);
  rlbCartaoCreditoS.Caption := FormatFloat(' ,0.00; -,0.00;', totCartCredS);
  rlbCartaoDebitoS.Caption  := FormatFloat(' ,0.00; -,0.00;', totCartDebS);
  rlbTotalS.Caption         := FormatFloat(' ,0.00; -,0.00;', totSaidas);

  rlbResultDinheiro.Caption := FormatFloat(' ,0.00; -,0.00;', totDinheiroP + totDinheiroE - totDinheiroS);
  rlbResultConvenio.Caption := FormatFloat(' ,0.00; -,0.00;', totConvenioP + totConvenioE - totConvenioS);
  rlbResultCartCred.Caption := FormatFloat(' ,0.00; -,0.00;', totCartCredP + totCartCredE - totCartCredS);
  rlbResultCartDeb.Caption  := FormatFloat(' ,0.00; -,0.00;', totCartDebP  + totCartDebE  - totCartDebS);
  rlbResultDesconto.Caption := FormatFloat(' ,0.00; -,0.00;', totDesconto);
  rlbResultTotal.Caption    := FormatFloat(' ,0.00; -,0.00;', totProdutos  + totEntradas - totSaidas);

  try
    repositorio   := TFabricaRepositorio.GetRepositorio(TCaixa.ClassName);
    especificacao := TEspecificacaoCaixaPorData.Create(dtpInicio.Date, 'A');
    Caixa         := TCaixa(repositorio.GetPorEspecificacao(especificacao));

    if assigned(Caixa) then
      valorAbertura := Caixa.valor_abertura;

  finally
    FreeAndNil(repositorio);
    FreeAndNil(especificacao);
    FreeAndNil(Caixa);
  end;

  rlbValorAbertura.Caption  := FormatFloat(' ,0.00; -,0.00;', valorAbertura);
  rlbTotalGeral.Caption     := FormatFloat(' ,0.00; -,0.00;', totProdutos  + totEntradas - totSaidas + valorAbertura);

  RLReport1.PreviewModal;
end;

end.
