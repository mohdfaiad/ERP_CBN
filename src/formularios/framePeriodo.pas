unit framePeriodo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TPeriodo = class(TFrame)
    grpPeriodo: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    medInicial: TMaskEdit;
    medFinal: TMaskEdit;
    Image1: TImage;
    procedure medInicialExit(Sender: TObject);
  private
    function GetDataFinal: TDateTime;
    function GetDataInicial: TDateTime;
    procedure SetDataFinal(const Value: TDateTime);
    procedure SetDataInicial(const Value: TDateTime);
    { Private declarations }
  public
    property dataInicial :TDateTime read GetDataInicial write SetDataInicial;
    property dataFinal   :TDateTime read GetDataFinal   write SetDataFinal;
  end;

implementation

uses StringUtilitario;

{$R *.dfm}

function TPeriodo.GetDataFinal: TDateTime;
begin
  result := StrToDateTime(medFinal.Text);
end;

function TPeriodo.GetDataInicial: TDateTime;
begin
  result := StrToDateTime(medInicial.Text);
end;

procedure TPeriodo.medInicialExit(Sender: TObject);
begin
  if length(TStringUtilitario.RemoveCaracter(TMaskEdit(Sender).Text,' ')) = 4 then
    TMaskEdit(Sender).Text := copy(TMaskEdit(Sender).Text,1,2) + FormatDateTime('/mm/yyyy',date)
  else if length(trim(TMaskEdit(Sender).Text)) = 6 then
    TMaskEdit(Sender).Text := TMaskEdit(Sender).Text + FormatDateTime('yyyy',date);
end;

procedure TPeriodo.SetDataFinal(const Value: TDateTime);
begin
  medFinal.Text := DateToStr(Value);
end;

procedure TPeriodo.SetDataInicial(const Value: TDateTime);
begin
  medInicial.Text := DateToStr(Value);
end;

end.
