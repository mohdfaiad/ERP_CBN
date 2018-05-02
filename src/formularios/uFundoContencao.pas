unit uFundoContencao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmFundoContencao = class(TForm)
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFundoContencao: TfrmFundoContencao;

implementation

uses uAguarde;

{$R *.dfm}

procedure TfrmFundoContencao.FormClick(Sender: TObject);
begin
  if assigned(frmAguarde) then
    frmAguarde.Show;
end;

end.
