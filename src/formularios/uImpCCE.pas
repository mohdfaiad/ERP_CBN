unit uImpCCE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uPadrao,
  Dialogs, RLReport, DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tfrm_impCCE = class(TfrmPadrao)
    DataSource1: TDataSource;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel1: TRLLabel;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBText12: TRLDBText;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLLabel18: TRLLabel;
    RLDBMemo1: TRLDBMemo;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLDBText18: TRLDBText;
    RLLabel22: TRLLabel;
    RLDBText19: TRLDBText;
    RLLabel23: TRLLabel;
    RLDBText20: TRLDBText;
    RLLabel25: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLLabel33: TRLLabel;
    RLDBText27: TRLDBText;
    data: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLLabel8: TRLLabel;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    RLLabel6: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    qryCCE: TFDQuery;
    qryCCECODIGO: TIntegerField;
    qryCCECOD_LOTE: TIntegerField;
    qryCCECODIGO_NOTA: TIntegerField;
    qryCCEDT_CORRECAO: TDateField;
    qryCCECORRECAO: TStringField;
    qryCCESTACORR: TStringField;
    qryCCEMOTCORR: TStringField;
    qryCCESTALOT: TStringField;
    qryCCEMOTLOT: TStringField;
    qryCCEID: TStringField;
    qryCCENRNOTA: TIntegerField;
    qryCCEEMITENTE: TStringField;
    qryCCERUAEMI: TStringField;
    qryCCENREMI: TStringField;
    qryCCEBAIRROEMI: TStringField;
    qryCCECIDADEEMI: TStringField;
    qryCCEUFEMI: TStringField;
    qryCCECEPEMI: TStringField;
    qryCCECNPJEMI: TStringField;
    qryCCEIEEMI: TStringField;
    qryCCEDESTINATARIO: TStringField;
    qryCCERUADES: TStringField;
    qryCCENRDES: TStringField;
    qryCCECIDADEDES: TStringField;
    qryCCEBAIRRODES: TStringField;
    qryCCECEPDES: TStringField;
    qryCCEUFDES: TStringField;
    qryCCECNPJDES: TStringField;
    qryCCEIEDES: TStringField;
    qryCCEDATA_EMISSAO: TSQLTimeStampField;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FCodCorr :integer;
  public
    { Public declarations }
    property CodCorr :integer read FCodCorr write FCodCorr;

    procedure ExecutaReport;
  end;

var
  frm_impCCE: Tfrm_impCCE;

implementation

uses funcoes;

{$R *.dfm}

{ Tfrm_impCCE }

procedure Tfrm_impCCE.ExecutaReport;
begin
 try
  qryCCE.Close;
  qryCCE.ParamByName('cod').AsInteger := CodCorr;
  qryCCE.Open;

  if qryCCE.IsEmpty then
    begin
      avisar('Nenhum registro encontrado.');
      exit;
    end;

  RLReport1.PreviewModal;

  qryCCE.Free;
  qryCCE := nil;
 except
   avisar('Erro ao gerar relatório!');
   qryCCE.Free;
   qryCCE := nil;
 end;
end;

procedure Tfrm_impCCE.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  data.Caption := DataExt(date); 
end;

end.
