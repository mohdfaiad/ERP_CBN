unit uRelatorioNotasFiscaisVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, Buttons, ExtCtrls, contNrs,
  frameBuscaEmpresa, DB, DBClient, Grids, DBGrids,
  frameBuscaNaturezaOperacao, RLFilters;

type
  TfrmRelatorioNotasFiscaisVenda = class(TfrmPadrao)
    BuscaEmpresa1: TBuscaEmpresa;
    Panel1: TPanel;
    btnImprimir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    BuscaNaturezaOperacao1: TBuscaNaturezaOperacao;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    cdsCfops: TClientDataSet;
    dsCfops: TDataSource;
    cdsCfopsCFOP: TStringField;
    cdsCfopsDESCRICAO: TStringField;
    StaticText1: TStaticText;
    procedure btnImprimirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtpInicioExit(Sender: TObject);
    procedure dtpFimExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioNotasFiscaisVenda: TfrmRelatorioNotasFiscaisVenda;

implementation

uses NotaFiscal, repositorio, FabricaRepositorio, EspecificacaoNotaFiscalPorPeriodoEStatus, Especificacao,
     uFortesNotasFiscaisVenda;

{$R *.dfm}

procedure TfrmRelatorioNotasFiscaisVenda.btnImprimirClick(Sender: TObject);
var repositorio   :TRepositorio;
    especificacao :TEspecificacaoNotaFiscalPorPeriodoEStatus;
    ListaNotas    :TObjectList;
begin
   ListaNotas    := nil;
   repositorio   := nil;
   especificacao := nil;

  try

  if self.BuscaEmpresa1.edtRazao.Text = '' then begin
    avisar('Favor selecionar a empresa');
    self.BuscaEmpresa1.edtCodigo.SetFocus;
    Exit;
  end;

   self.Aguarda('Filtrando notas do sistema');
   repositorio   := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);

   especificacao := TEspecificacaoNotaFiscalPorPeriodoEStatus.Create(self.dtpInicio.Date,
                                                                     self.dtpFim.Date,
                                                                     false, true, false, false,
                                                                     self.BuscaEmpresa1.Empresa.CPF_CNPJ);

   ListaNotas    := repositorio.GetListaPorEspecificacao( especificacao,  QuotedStr(FormatDateTime('dd.mm.yyyy',dtpInicio.Date))+' and '+
                                                                          QuotedStr(FormatDateTime('dd.mm.yyyy',dtpFim.Date)));

   if ListaNotas.Count > 0 then begin

      frmFortesNotasFiscaisVenda := TfrmFortesNotasFiscaisVenda.Create(self,
                                                                       ListaNotas,
                                                                       dtpInicio.Date,
                                                                       dtpFim.Date,
                                                                       BuscaEmpresa1.edtRazao.Text,
                                                                       cdsCfops);
      frmFortesNotasFiscaisVenda.imprimir;

     self.FimAguarda('');
   end
   else begin
     self.FimAguarda('Não foram encontrados registros com esses filtros');
   end;

  finally
    
    FreeAndNil( repositorio );
    FreeAndNil( especificacao );
    ListaNotas := nil;
  end;
end;

procedure TfrmRelatorioNotasFiscaisVenda.SpeedButton1Click(
  Sender: TObject);
begin
  self.Close;
end;

procedure TfrmRelatorioNotasFiscaisVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dtpInicio.DateTime := strToDateTime( formatDateTime('dd/mm/yyyy 00:00:00', date) );
  dtpFim.DateTime    := strToDateTime( formatDateTime('dd/mm/yyyy 23:59:59', date) );
  cdsCfops.CreateDataSet;
end;

procedure TfrmRelatorioNotasFiscaisVenda.dtpInicioExit(Sender: TObject);
begin
  inherited;
  if dtpInicio.Date > dtpFim.Date then
    dtpFim.Date := dtpInicio.Date;
end;

procedure TfrmRelatorioNotasFiscaisVenda.dtpFimExit(Sender: TObject);
begin
  inherited;
  if dtpFim.Date < dtpInicio.Date then
    dtpInicio.Date := dtpFim.Date;
end;

procedure TfrmRelatorioNotasFiscaisVenda.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( (ssCtrl in Shift) AND (Key = ord('P')) ) then  btnImprimir.Click;
end;

procedure TfrmRelatorioNotasFiscaisVenda.BitBtn1Click(Sender: TObject);
begin
  if BuscaNaturezaOperacao1.edtDescricao.Text = '' then  EXIT;
  if cdsCfops.Locate('CFOP', BuscaNaturezaOperacao1.edtCFOP.Text, []) then  EXIT;

  cdsCfops.Append;
  cdsCfopsCFOP.AsString       := BuscaNaturezaOperacao1.edtCFOP.Text;
  cdsCfopsDESCRICAO.AsString  := BuscaNaturezaOperacao1.edtDescricao.Text;
  cdsCfops.Post;

  BuscaNaturezaOperacao1.Clear;
end;

procedure TfrmRelatorioNotasFiscaisVenda.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_DELETE) and not(cdsCfops.IsEmpty) then
    cdsCfops.Delete;
end;

end.
