unit uImpressaoEtiquetaCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, RLReport, StdCtrls, ExtCtrls, DBClient, DB,
  Buttons, RxToolEdit, RxCurrEdit, Mask, Provider, pngimage, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmImpressaoEtiquetaCaixa = class(TfrmPadrao)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    rgLayout: TRadioGroup;
    Panel1: TPanel;
    btnImprimir: TSpeedButton;
    ds: TDataSource;
    cds: TClientDataSet;
    RLDBText1: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    rlbNF: TRLLabel;
    rlbBarra: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    rldbNumNota: TRLDBText;
    rlbValorNota: TRLLabel;
    rldbVolumes: TRLDBText;
    cdsNUMERO_NOTA_FISCAL: TIntegerField;
    cdsRAZAO: TStringField;
    cdsLOGRADOURO: TStringField;
    cdsNUMERO: TStringField;
    cdsBAIRRO: TStringField;
    cdsCEP: TStringField;
    cdsCIDADE: TStringField;
    cdsQUANTIDADE_VOLUMES: TFloatField;
    Label1: TLabel;
    rgDados: TGroupBox;
    edtCliente: TEdit;
    edtCep: TMaskEdit;
    edtLogradouro: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtNrNf: TCurrencyEdit;
    edtVlrNf: TCurrencyEdit;
    edtQtd: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbLimpar: TCheckBox;
    edtNumero: TEdit;
    cdsNUMERO_CX: TIntegerField;
    rldbNCaixa: TRLDBText;
    cdsVolumes: TClientDataSet;
    dspVolumes: TDataSetProvider;
    cdsVolumesNUMPEDIDO: TStringField;
    cdsVolumesCOUNT: TIntegerField;
    RLLabel3: TRLLabel;
    RLDBText7: TRLDBText;
    cdsNUM_PEDIDO: TStringField;
    imgPAC: TRLImage;
    RLLabel4: TRLLabel;
    RLDBText8: TRLDBText;
    cdsCOMPLEMENTO: TStringField;
    edtComplemento: TEdit;
    Label11: TLabel;
    qry: TFDQuery;
    qryVolumes: TFDQuery;
    qryCODIGO: TIntegerField;
    qryNUMERO_NOTA_FISCAL: TIntegerField;
    qryRAZAO: TStringField;
    qryLOGRADOURO: TStringField;
    qryNUMERO: TStringField;
    qryBAIRRO: TStringField;
    qryCEP: TStringField;
    qryCOMPLEMENTO: TStringField;
    qryCIDADE: TStringField;
    qryQUANTIDADE_VOLUMES: TBCDField;
    procedure btnImprimirClick(Sender: TObject);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Fnr_nota: Double;
    FCodigoEmitente :Integer;
    Fvlr_nota: String;
    Fdigitar: Boolean;
    procedure Setdigitar(const Value: Boolean);

  private
    procedure Setnr_nota   (const Value: Double);
    procedure Setvlr_nota  (const Value: String);
    procedure SetAutomatico(const Value: Boolean);

  private
    procedure FecharTela(Sender :TObject);
    procedure imprime;
    procedure ConfiguraLayout;
    procedure preencheDoBD;
    procedure preencheDigitado;
    procedure limparCampos;

    function verificaObrigatorios :Boolean;

    { Private declarations }
  public
    property Automatico :Boolean write SetAutomatico;
    property nr_nota  :double read Fnr_nota write Setnr_nota;
    property codigoEmitente :Integer read FCodigoEmitente write FCodigoEmitente;
    property vlr_nota :String read Fvlr_nota write Setvlr_nota;
    property digitar :Boolean read Fdigitar write Setdigitar;

  public
    procedure Imprimir;
end;

var
  frmImpressaoEtiquetaCaixa: TfrmImpressaoEtiquetaCaixa;

implementation

{$R *.dfm}

{ TfrmImpressaoEtiquetaCaixa }

procedure TfrmImpressaoEtiquetaCaixa.Setnr_nota(const Value: double);
begin
  Fnr_nota := Value;
end;

procedure TfrmImpressaoEtiquetaCaixa.btnImprimirClick(Sender: TObject);
begin
  if rgLayout.ItemIndex < 0 then begin
    avisar('Selecione o Layout para impressão');
    rgLayout.SetFocus;
    exit;
  end;

  ConfiguraLayout;

  Imprime;
end;

procedure TfrmImpressaoEtiquetaCaixa.Setvlr_nota(const Value: String);
begin
  Fvlr_nota := Value;
end;

procedure TfrmImpressaoEtiquetaCaixa.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rlbValorNota.Caption := self.Fvlr_nota;
end;

procedure TfrmImpressaoEtiquetaCaixa.imprime;
begin
  if not (FDigitar) then  preencheDoBD
                    else  preencheDigitado;

  RLReport1.PreviewModal;
  cds.EmptyDataSet;
end;

procedure TfrmImpressaoEtiquetaCaixa.ConfiguraLayout;
begin

   imgPAC.Visible       := (rgLayout.ItemIndex <> 0);

   rlbNF.Visible        := (rgLayout.ItemIndex <> 2);
   rldbNumNota.Visible  := (rgLayout.ItemIndex <> 2);
   rlbValorNota.Visible := (rgLayout.ItemIndex <> 2);
   rldbNCaixa.Visible   := (rgLayout.ItemIndex <> 2);
   rlbBarra.Visible     := (rgLayout.ItemIndex <> 2);
   rldbVolumes.Visible  := (rgLayout.ItemIndex <> 2);

end;

procedure TfrmImpressaoEtiquetaCaixa.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( (ssCtrl in Shift) AND (Key = ord('P')) ) then  btnImprimir.Click;
end;

procedure TfrmImpressaoEtiquetaCaixa.SetAutomatico(const Value: Boolean);
begin
   if Value then
    self.btnImprimir.OnClick := self.FecharTela;
end;

procedure TfrmImpressaoEtiquetaCaixa.FecharTela(Sender: TObject);
begin
   self.Close();
end;

procedure TfrmImpressaoEtiquetaCaixa.Imprimir;
begin
   self.ConfiguraLayout;
   self.imprime;
end;

procedure TfrmImpressaoEtiquetaCaixa.preencheDigitado;
var i :integer;
begin

 if not cds.Active then  cds.CreateDataSet;
 if not verificaObrigatorios then  exit;

  for i := 1 to edtQtd.AsInteger do begin
    cds.Append;
    cdsNUMERO_NOTA_FISCAL.AsFloat   := edtNrNf.Value;
    cdsRAZAO.AsString               := edtCliente.Text;
    cdsLOGRADOURO.AsString          := edtLogradouro.Text;
    cdsNUMERO.AsString              := edtNumero.Text;
    cdsBAIRRO.AsString              := edtBairro.Text;
    cdsCEP.AsString                 := edtCep.Text;
    cdsCIDADE.AsString              := edtCidade.Text;
    cdsQUANTIDADE_VOLUMES.AsInteger := edtQtd.AsInteger;
    cdsCOMPLEMENTO.AsString         := edtComplemento.Text;
    cds.Post;
  end;

  rlbNF.Visible        := (edtNrNf.AsInteger > 0);
  rldbNumNota.Visible  := (edtNrNf.AsInteger > 0);
  rlbValorNota.Visible := (edtVlrNf.Value > 0);
  self.Fvlr_nota       := 'R$ '+ FormatFloat('0.00', edtVlrNf.Value);

  if cbLimpar.Checked then  limparCampos;
end;

procedure TfrmImpressaoEtiquetaCaixa.preencheDoBD;
var i, num_caixa, total_volumes_conferidos: integer;
begin

  num_caixa                := 0;
  total_volumes_conferidos := 0;
  
  qry.Close;
  qry.ParamByName('nr_nota').AsFloat := Fnr_nota;
  qry.ParamByName('cod_emit').AsInteger := FCodigoEmitente;
  qry.Open;

  cdsVolumes.Close;
  qryVolumes.ParamByName('cod_nota').AsInteger := qry.FieldByName('codigo').AsInteger;
  cdsVolumes.Open;

  if not cds.active then   cds.CreateDataSet;

  for i := 1 to qryQUANTIDADE_VOLUMES.AsInteger do begin
    inc(num_caixa);

    cds.Append;
    
    if not(cdsVolumes.IsEmpty) then begin
       total_volumes_conferidos        := total_volumes_conferidos + cdsVolumesCOUNT.AsInteger;
       cdsQUANTIDADE_VOLUMES.AsInteger := cdsVolumesCOUNT.AsInteger;
    end
    else
       cdsQUANTIDADE_VOLUMES.AsInteger := qryQUANTIDADE_VOLUMES.AsInteger - total_volumes_conferidos;

    cdsNUMERO_NOTA_FISCAL.AsString  := qryNUMERO_NOTA_FISCAL.AsString;
    cdsRAZAO.AsString               := qryRAZAO.AsString;
    cdsLOGRADOURO.AsString          := qryLOGRADOURO.AsString;
    cdsNUMERO.AsString              := qryNUMERO.AsString;
    cdsBAIRRO.AsString              := qryBAIRRO.AsString;
    cdsCEP.AsString                 := qryCEP.AsString;
    cdsCIDADE.AsString              := qryCIDADE.AsString;
    cdsNUMERO_CX.AsInteger          := num_caixa;
    cdsNUM_PEDIDO.AsString          := cdsVolumesNUMPEDIDO.AsString;
    cdsCOMPLEMENTO.AsString         := qryCOMPLEMENTO.AsString;

    { Se já tiver montado todas as etiquetas de determinado pedido, recomeça a contagem }
    if not(cdsVolumes.IsEmpty) and (cdsVolumesCOUNT.AsInteger = num_caixa) then begin
      cdsVolumes.Delete;
      num_caixa := 0;
    end;
    cds.Post;
  end;
end;

function TfrmImpressaoEtiquetaCaixa.verificaObrigatorios: Boolean;
begin
  result := true;

  if (edtCliente.Visible)         and (trim(edtCliente.Text) = '')    then begin
    edtCliente.SetFocus;
    avisar('Informe o Cliente');
    result := false;
  end
  else if (edtLogradouro.Visible) and (trim(edtLogradouro.Text) = '') then begin
    edtLogradouro.SetFocus;
    avisar('Informe o Logradouro');
    result := false;
  end
  else if (edtNumero.Visible)     and (TRIM(edtNumero.Text) = ''    )   then begin
    edtNumero.SetFocus;
    avisar('Informe o Número');
    result := false;
  end
  else if (edtBairro.Visible)     and (trim(edtBairro.Text) = '')     then begin
    edtBairro.SetFocus;
    avisar('Informe o Bairro');
    result := false;
  end
  else if (edtCep.Visible)        and (trim(edtCep.Text) = '-')       then begin
    edtCep.SetFocus;
    avisar('Informe o CEP');
    result := false;
  end
  else if (edtCidade.Visible)     and (trim(edtCidade.Text) = '')     then begin
    edtCidade.SetFocus;
    avisar('Informe a Cidade');
    result := false;
  end;

end;

procedure TfrmImpressaoEtiquetaCaixa.FormShow(Sender: TObject);
begin
  inherited;

  if not FDigitar then
    rgLayout.Visible := true
  else begin
    self.Height        := 345;
    rgDados.Visible    := true;
    rgLayout.ItemIndex := 1;
    cbLimpar.Visible   := true;
  end;
end;

procedure TfrmImpressaoEtiquetaCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  Fdigitar := false;
end;

procedure TfrmImpressaoEtiquetaCaixa.Setdigitar(const Value: Boolean);
begin
  Fdigitar := Value;
end;

procedure TfrmImpressaoEtiquetaCaixa.limparCampos;
begin
  edtCliente.Clear;
  edtLogradouro.Clear;
  edtNumero.Clear;
  edtBairro.Clear;
  edtCep.Clear;
  edtCidade.Clear;
  edtNrNf.Clear;
  edtVlrNf.Clear;
  edtQtd.Clear;
  edtComplemento.Clear;
  edtCliente.SetFocus;
end;

end.
