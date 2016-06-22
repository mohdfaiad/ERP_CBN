unit uBuscarRomaneio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, frameBuscaPedido;

type
  TfrmBuscarRomaneio = class(TfrmPadrao)
    BuscaPedido1: TBuscaPedido;
    btnImprimir: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarRomaneio: TfrmBuscarRomaneio;

implementation

uses uRelatorioRomaneio;

{$R *.dfm}

procedure TfrmBuscarRomaneio.FormShow(Sender: TObject);
begin
  inherited;
  //
  BuscaPedido1.rgTipoBusca.ItemIndex:= 0;
  BuscaPedido1.BuscaParaConferencia:= False;
end;

procedure TfrmBuscarRomaneio.btnImprimirClick(Sender: TObject);
begin
  inherited;
  frmRelatorioRomaneio := TfrmRelatorioRomaneio.Create(self);
  try
    frmRelatorioRomaneio.imprime(BuscaPedido1.edtNumPedido.Text);
  except
    on e: Exception do
      Avisar(e.Message);
  end;
  frmRelatorioRomaneio.Release;
end;

procedure TfrmBuscarRomaneio.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //inherited;
  if Key = #13 then
  begin
    Key:= #0;
    if BuscaPedido1.edtNumPedido.Focused then
      BuscaPedido1.btnBuscarClick(Self);
  end;
end;

end.
