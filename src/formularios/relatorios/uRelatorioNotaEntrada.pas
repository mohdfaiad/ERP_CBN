unit uRelatorioNotaEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, TipoPessoa, ExtCtrls, ComCtrls,
  StdCtrls, DB, DBClient, Provider, Buttons, RLReport, NotaFiscal, frameBuscaEmpresa,
  RLFilters;

type
  TfrmRelatorioNotaEntrada = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    Panel1: TPanel;
    cdsNotas: TClientDataSet;
    dsNotas: TDataSource;
    btnImprimir: TSpeedButton;
    cdsNotasNUM_NOTA: TIntegerField;
    cdsNotasEMITENTE: TStringField;
    cdsNotasDESTINATARIO: TStringField;
    cdsNotasEMISSAO: TDateField;
    cdsNotasVALOR_TOTAL: TFloatField;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    lbPeriodo: TRLLabel;
    lbEmpresa: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel12: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel13: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    BuscaEmpresa1: TBuscaEmpresa;
    RLDraw1: TRLDraw;
    RLLabel14: TRLLabel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure   rotina_impressao;
    procedure   busca_notas_fiscais;
    function  valor_bruto_nota(codigo_nota :integer) :Real;
  public
    { Public declarations }
  end;

var
  frmRelatorioNotaEntrada: TfrmRelatorioNotaEntrada;

implementation

uses  FabricaRepositorio, EspecificacaoNotaFiscalPorPeriodoTipoEmpresa, Repositorio, ContNRs,
      TotaisNotaFiscal, ItemNfMateria, uModulo;

{$R *.dfm}

procedure TfrmRelatorioNotaEntrada.FormCreate(Sender: TObject);
var repositorio :TRepositorio;
    especificacao : TEspecificacaoNotaFiscalPorPeriodoTipoEmpresa;
    Lista :TObjectList;
begin
  inherited;
  dtpInicio.DateTime := strToDateTime( formatDateTime('dd/mm/yyyy 00:00:00', date) );
  dtpFim.DateTime    := strToDateTime( formatDateTime('dd/mm/yyyy 23:59:59', date) );
end;

procedure TfrmRelatorioNotaEntrada.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ( (ssCtrl in Shift) AND (Key = ord('P')) ) then  btnImprimir.Click;
end;

procedure TfrmRelatorioNotaEntrada.btnImprimirClick(Sender: TObject);
begin
 try
  if BuscaEmpresa1.edtRazao.Text = '' then begin
    avisar('Favor selecionar a empresa');
    BuscaEmpresa1.edtCodigo.SetFocus;
    exit;
  end;

  Aguarda('Aguarde, buscando informações...');
  Application.ProcessMessages;
  rotina_impressao;

 Finally
   FimAguarda('');
 end;
end;

procedure TfrmRelatorioNotaEntrada.rotina_impressao;
begin
  try
    busca_notas_fiscais;
    RLReport1.PreviewModal;

  Except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;
  end;
end;

procedure TfrmRelatorioNotaEntrada.busca_notas_fiscais;
var repositorio :TRepositorio;
    especificacao : TEspecificacaoNotaFiscalPorPeriodoTipoEmpresa;
    Lista :TObjectList;
    nX :integer;
begin
  try
  try
    Lista := nil;

    repositorio    := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);
    especificacao  := TEspecificacaoNotaFiscalPorPeriodoTipoEmpresa.create(dtpInicio.Date, dtpFim.Date, 'E', BuscaEmpresa1.Empresa.Codigo);
    Lista          := repositorio.GetListaPorEspecificacao(especificacao);

    if not cdsNotas.Active  then    cdsNotas.CreateDataSet;

    cdsNotas.EmptyDataSet;
    
    if not (Lista = nil) and (Lista.Count > 0) then begin

      for nX := 0 to Lista.Count - 1 do begin
        cdsNotas.Append;
        cdsNotasNUM_NOTA.AsInteger    := TNotaFiscal(  Lista.Items[nX] ).NumeroNotaFiscal;
        cdsNotasEMITENTE.AsString     := TNotaFiscal(  Lista.Items[nX] ).Emitente.Razao;
        cdsNotasDESTINATARIO.AsString := TNotaFiscal(  Lista.Items[nX] ).Destinatario.Razao;
        cdsNotasEMISSAO.AsDateTime    := TNotaFiscal(  Lista.Items[nX] ).DataEmissao;
        cdsNotasVALOR_TOTAL.AsFloat   := valor_bruto_nota( TNotaFiscal( Lista.Items[nX]).CodigoNotaFiscal );
        cdsNotas.Post;
      end;

    end
    else
      raise Exception.Create('Não foi encontrado nenhum registro com os filtros fornecidos');

  Except
    on e : Exception do
      begin
        raise Exception.Create(e.Message);
      end;
  end;
  
  Finally
    FreeAndNil(repositorio);
    FreeAndNil(Lista);
    FreeAndNil(especificacao);
  end;
end;

procedure TfrmRelatorioNotaEntrada.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  lbPeriodo.Caption := DateToStr(dtpInicio.Date)+' a '+DateToStr(dtpFim.Date);
  lbEmpresa.Caption := BuscaEmpresa1.edtRazao.Text;
end;

function TfrmRelatorioNotaEntrada.valor_bruto_nota(codigo_nota :integer): Real;
begin
  result := 0;

  dm.qryGenerica.Close;
  dm.qryGenerica.SQL.Text := 'select sum(im.valor_bruto + im.valor_frete + im.valor_seguro + im.valor_outras_despesas - im.valor_desconto + '+
                             '           iif(im.base_ipi > 0, im.per_ipi * im.base_ipi / 100, 0) '+
                             '          ) valor_total from itens_nf_materia im                   '+
                             ' where im.codigo_nota_fiscal = :codigo                             ';
  dm.qryGenerica.ParamByName('codigo').AsInteger := codigo_nota;
  dm.qryGenerica.Open;

  result := dm.qryGenerica.fieldByName('valor_total').AsFloat;
end;

procedure TfrmRelatorioNotaEntrada.SpeedButton1Click(Sender: TObject);
begin
  self.Close;
end;

end.
