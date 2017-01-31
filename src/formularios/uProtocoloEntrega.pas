unit uProtocoloEntrega;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, contNrs,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, RLReport, Data.DB, Datasnap.DBClient, Vcl.Imaging.pngimage, RLFilters, RLPDFFilter;

type
  TfrmProtocoloEntrega = class(TfrmPadrao)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    lblTitulo: TRLLabel;
    RLImage1: TRLImage;
    RLLabel19: TRLLabel;
    RLSystemInfo5: TRLSystemInfo;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLDBText16: TRLDBText;
    RLBand5: TRLBand;
    RLDBText2: TRLDBText;
    RLLabel9: TRLLabel;
    cds: TClientDataSet;
    ds: TDataSource;
    cdsCODIGO_TRANSP: TIntegerField;
    cdsTRANSPORTADORA: TStringField;
    cdsNR_NOTA: TIntegerField;
    cdsVOLUME: TIntegerField;
    cdsDESTINATARIO: TStringField;
    RLLabel1: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw6: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw10: TRLDraw;
    RLPDFFilter1: TRLPDFFilter;
  private
    { Private declarations }
  public
    procedure geraProtocolo(ListaNotas :TObjectList);
  end;

var
  frmProtocoloEntrega: TfrmProtocoloEntrega;

implementation

uses NotaFiscal;

{$R *.dfm}

{ TfrmProtocoloEntrega }

procedure TfrmProtocoloEntrega.geraProtocolo(ListaNotas: TObjectList);
var i :integer;
    Nota :TNotaFiscal;
begin
  cds.CreateDataSet;

  for i := 0 to ListaNotas.Count -1 do
  begin
    Nota := (ListaNotas.Items[i] as TNotaFiscal);

    if (pos('POSTSERVICE',Nota.Transportadora.Razao) = 0) and
       (pos('MESMO',Nota.Transportadora.Razao) = 0) then
    begin
      cds.Append;
      cdsCODIGO_TRANSP.AsInteger := Nota.Transportadora.Codigo;
      cdsTRANSPORTADORA.AsString := Nota.Transportadora.Razao;
      cdsNR_NOTA.AsInteger       := Nota.NumeroNotaFiscal;
      cdsVOLUME.AsInteger        := Nota.Volumes.QuantidadeVolumes;
      cdsDESTINATARIO.AsString   := Nota.Destinatario.Razao;
      cds.Post;
    end;
  end;

  cds.IndexFieldNames := 'CODIGO_TRANSP';

  RLReport1.PreviewModal;
end;

end.


































































