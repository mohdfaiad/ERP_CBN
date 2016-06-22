unit uFortesNotasFiscaisVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, DBClient, ContNrs;

type
  TfrmFortesNotasFiscaisVenda = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    cds: TClientDataSet;
    ds: TDataSource;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    cdsNUMERO_NOTA: TStringField;
    cdsEMISSAO: TDateField;
    cdsCFOP: TStringField;
    cdsCLIENTE: TStringField;
    cdsTOT_BC: TFloatField;
    cdsTOT_ICMS: TFloatField;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    cdsTOT_NF: TFloatField;
    RLLabel3: TRLLabel;
    lbPeriodo: TRLLabel;
    RLLabel10: TRLLabel;
    lbEmpresa: TRLLabel;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLLabel19: TRLLabel;
    RLSystemInfo5: TRLSystemInfo;
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    procedure preenche_cds(ListaNotas :TObjectList; cdsCFOPs :TClientDataSet);

  public
    constructor Create(AOwner: TComponent;
                       ListaNotas :TObjectList;
                       data_i,
                       data_f :TDateTime;
                       Empresa :String;
                       CDSCFOPs :TClientDataSet); overload; virtual;

    procedure imprimir;
  end;

var
  frmFortesNotasFiscaisVenda: TfrmFortesNotasFiscaisVenda;

implementation

uses NotaFiscal, TotaisNotaFiscal;

{$R *.dfm}

{ TForm1 }

constructor TfrmFortesNotasFiscaisVenda.Create(AOwner: TComponent; ListaNotas: TObjectList;
data_i, data_f :TDateTime; Empresa :String; CDSCFOPs :TClientDataSet);
begin
  self.Create(aOwner);
  preenche_cds(ListaNotas, CDSCFOPs);
  lbEmpresa.Caption := Empresa;
  lbPeriodo.Caption := DateToStr(data_i) + ' a ' + DateToStr(data_f);
end;

procedure TfrmFortesNotasFiscaisVenda.imprimir;
begin
  if not cds.IsEmpty then
     RLReport1.PreviewModal;
end;

procedure TfrmFortesNotasFiscaisVenda.preenche_cds(ListaNotas: TObjectList; cdsCFOPs :TClientDataSet);
var i :integer;
    Nota_fiscal :TNotaFiscal;
begin

  cds.CreateDataSet;

  for i := 0 to ListaNotas.Count - 1 do begin

    Nota_fiscal := ( ListaNotas.items[i] as TNotaFiscal);

    if (Nota_fiscal.Entrada_saida = 'E') then    Continue;

    if (CDSCFOPs.Active) and not (cdsCFOPs.IsEmpty) and not CDSCFOPs.Locate('CFOP',Nota_fiscal.Natureza.CFOP, []) then    Continue;

    cds.Append;
    cdsNUMERO_NOTA.AsString := IntToStr(Nota_fiscal.NumeroNotaFiscal);
    cdsEMISSAO.AsDateTime   := Nota_fiscal.DataEmissao;
    cdsCFOP.AsString        := Nota_fiscal.Natureza.CFOP;
    cdsCLIENTE.AsString     := Nota_fiscal.Destinatario.Razao;
    cdsTOT_NF.AsFloat       := Nota_fiscal.Totais.TotalNF;
    cdsTOT_BC.AsFloat       := Nota_fiscal.Totais.BaseCalculoICMS;
    cdsTOT_ICMS.AsFloat     := Nota_fiscal.Totais.ICMS;
    cds.Post;

  end;

end;

procedure TfrmFortesNotasFiscaisVenda.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if rlband3.Color = clwhite then
    rlband3.Color := $00E4E4E4
  else
    rlband3.Color := clwhite;
end;

end.


