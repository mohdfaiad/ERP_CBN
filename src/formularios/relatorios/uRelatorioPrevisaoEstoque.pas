unit uRelatorioPrevisaoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, RLFilters, DB, RLReport, Buttons, ExtCtrls,
  frameBuscaProduto, StdCtrls, ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmRelatorioPrevisaoEstoque = class(TfrmPadrao)
    Panel1: TPanel;
    btnImprimir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel13: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLDBText5: TRLDBText;
    dsPrevisao: TDataSource;
    RLDBText7: TRLDBText;
    RLDraw3: TRLDraw;
    RLBand5: TRLBand;
    RLDBText6: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLLabel2: TRLLabel;
    GroupBox1: TGroupBox;
    BuscaProduto1: TBuscaProduto;
    rgpOrdem: TRadioGroup;
    GroupBox2: TGroupBox;
    dtpInicio: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    dtpFim: TDateTimePicker;
    chkPeriodoRep: TCheckBox;
    GroupBox3: TGroupBox;
    chkMFS: TCheckBox;
    chkNF: TCheckBox;
    qryPrevisao: TFDQuery;
    qryPrevisaoCODPRO: TIntegerField;
    qryPrevisaoREFPRO: TStringField;
    qryPrevisaoPRODUTO: TStringField;
    qryPrevisaoREFCOR: TStringField;
    qryPrevisaoCOR: TStringField;
    qryPrevisaoDATA_INICIAL: TDateField;
    qryPrevisaoDIAS_RN: TLargeintField;
    qryPrevisaoDIAS_P: TLargeintField;
    qryPrevisaoDIAS_M: TLargeintField;
    qryPrevisaoDIAS_G: TLargeintField;
    qryPrevisaoDIAS_1: TLargeintField;
    qryPrevisaoDIAS_2: TLargeintField;
    qryPrevisaoDIAS_3: TLargeintField;
    qryPrevisaoDIAS_4: TLargeintField;
    qryPrevisaoDIAS_6: TLargeintField;
    qryPrevisaoDIAS_8: TLargeintField;
    qryPrevisaoDIAS_UNICA: TLargeintField;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    qryPrevisaoDIAS_10: TLargeintField;
    qryPrevisaoDIAS_12: TLargeintField;
    qryPrevisaoDIAS_14: TLargeintField;
    procedure btnImprimirClick(Sender: TObject);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure dtpInicioChange(Sender: TObject);
    procedure dtpFimChange(Sender: TObject);
    procedure chkPeriodoRepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RLDBText9BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure imprimir;
    function monta_sql :String;
  public
    { Public declarations }
  end;

var
  frmRelatorioPrevisaoEstoque: TfrmRelatorioPrevisaoEstoque;

implementation

uses StrUtils;

{$R *.dfm}

procedure TfrmRelatorioPrevisaoEstoque.btnImprimirClick(Sender: TObject);
begin
 try
   if not (BuscaProduto1.CodigoProduto > 0) then begin
     avisar('Nenhuma referência foi selecionada');
     exit;
   end;

   self.Aguarda('Aguarde, buscando informações...');
   Application.ProcessMessages;

   imprimir;
 Finally
   FimAguarda('');
 end;
end;

procedure TfrmRelatorioPrevisaoEstoque.imprimir;
begin
  qryPrevisao.Close;
  qryPrevisao.SQL.Text := monta_sql;

  qryPrevisao.ParamByName('cod_pro').AsInteger := BuscaProduto1.CodigoProduto;

  if not chkPeriodoRep.Checked then begin
    qryPrevisao.ParamByName('dti').AsDateTime    := dtpInicio.DateTime;
    qryPrevisao.ParamByName('dtf').AsDateTime    := dtpFim.DateTime;
  end
  else begin
    qryPrevisao.ParamByName('dti').AsDateTime    := StrtoDateTime('01/01/1900 00:00:00');
    qryPrevisao.ParamByName('dtf').AsDateTime    := StrToDateTime(DateToStr(Date)+ ' 23:59:59');
  end;

  qryPrevisao.Open;

  if qryPrevisao.IsEmpty then
    avisar('Não foram encontrados registros com os filtros fornecidos')
  else
    RLReport1.PreviewModal;
end;

function TfrmRelatorioPrevisaoEstoque.monta_sql: String;
var condicao_inclui_cores, condicao_pedido :String;
begin

  condicao_inclui_cores := IfThen(chkMFS.Checked, '', ' and cor.descricao not in (''MASCULINO'', ''FEMININO'', ''SORTIDO'')');

  //inclui nao faturados? sim ou nao
  condicao_pedido := IfThen(chkNF.Checked, '''S''', '''N''');

  Result := 'Select pro.codigo codpro, pro.referencia refpro, pro.descricao produto, cor.referencia refcor, cor.descricao cor, prev.data_inicial, '+
            ' TRUNC(prev.dias_rn) dias_rn, TRUNC(prev.dias_p) dias_p, TRUNC(prev.dias_m) dias_m, TRUNC(prev.dias_g) dias_g,   '+
            ' TRUNC(prev.dias_1) dias_1, TRUNC(prev.dias_2) dias_2, TRUNC(prev.dias_3) dias_3, TRUNC(prev.dias_4) dias_4,     '+
            ' TRUNC(prev.dias_6) dias_6, TRUNC(prev.dias_8) dias_8, TRUNC(prev.dias_10) dias_10, TRUNC(prev.dias_12) dias_12, '+
            ' TRUNC(prev.dias_14) dias_14, TRUNC(prev.dias_unica) dias_unica                                                  '+

            ' from produtos pro                                                                                        '+

            ' left join produto_cores pc on pc.codproduto = pro.codigo                                                 '+
            ' left join cores    cor on cor.codigo = pc.codcor                                                         '+
            ' left join previsao_estoque(cor.codigo, pro.codigo, :dti, :dtf, '+condicao_pedido+') prev on 1=1          '+

            ' where pro.codigo = :cod_pro and                                                                          '+
            '       ((prev.dias_rn+ prev.dias_p+ prev.dias_m+ prev.dias_g+ prev.dias_1+ prev.dias_2+                   '+
            '        prev.dias_3+ prev.dias_4+ prev.dias_6+ prev.dias_8+prev.dias_10+prev.dias_12+prev.dias_14+ prev.dias_unica) > 0)                         '+
            condicao_inclui_cores +
            IfThen(rgpOrdem.itemIndex = 0, ' order by cor.referencia ', ' order by cor.descricao ');
end;

procedure TfrmRelatorioPrevisaoEstoque.RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
var cor_atual :TColor;
begin
  inherited;
  if RLBand5.Color = clWhite then   cor_atual := $00E6E6E6
                             else   cor_atual := clWhite;

   RLBand5.Color := cor_atual;

end;

procedure TfrmRelatorioPrevisaoEstoque.dtpInicioChange(Sender: TObject);
begin
  if dtpInicio.Date > dtpFim.Date then
    dtpFim.Date := dtpInicio.Date +1;
end;

procedure TfrmRelatorioPrevisaoEstoque.dtpFimChange(Sender: TObject);
begin
  if dtpFim.Date < dtpInicio.Date then begin
    avisar('A data final não pode ser menor que a data inicial!');
    dtpFim.Date := dtpInicio.Date +1;
    dtpFim.SetFocus;
  end;
end;

procedure TfrmRelatorioPrevisaoEstoque.chkPeriodoRepClick(Sender: TObject);
begin
  if chkPeriodoRep.Checked then begin
    dtpInicio.Enabled := false;
    dtpFim.Enabled    := false;
  end
  else begin
    dtpInicio.Enabled := true;
    dtpFim.Enabled    := true;
    dtpInicio.SetFocus;
  end;
end;

procedure TfrmRelatorioPrevisaoEstoque.FormShow(Sender: TObject);
begin
  dtpInicio.DateTime      := strToDateTime( DateToStr(Date)+' '+'00:00:00');
  dtpFim.DateTime         := strToDateTime( DateToStr(Date)+' '+'23:59:59');
end;

procedure TfrmRelatorioPrevisaoEstoque.RLDBText9BeforePrint(
  Sender: TObject; var Text: String; var PrintIt: Boolean);
begin
  if Text = '999999' then begin
    Text := 'S.V.';
    TRLDBText(Sender).Font.Style := [fsBold];
  end
  else if Text = '0' then
    Text := ''
  else
    TRLDBText(Sender).Font.Style := [];

end;

procedure TfrmRelatorioPrevisaoEstoque.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( (ssCtrl in Shift) AND (Key = ord('P')) ) then  btnImprimir.Click;
end;

end.
