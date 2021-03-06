unit frameFone;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

type
  TFone = class(TFrame)
    edtFone: TMaskEdit;
    Label12: TLabel;
    procedure edtFoneChange(Sender: TObject);
    procedure edtFoneExit(Sender: TObject);
  private
    FFone :String;
    function validaData :Boolean;
    procedure SetFone(const Value: String);

  public
    procedure limpa;

    property Fone :String read FFone write SetFone;
  end;

implementation

uses uPadrao, StringUtilitario;

{$R *.dfm}

procedure TFone.edtFoneChange(Sender: TObject);
var vFone :String;
begin
  vFone := StringReplace(trim(edtFone.Text), ' ','', [rfReplaceAll]);
  if vFone = '()-' then
    exit;

  self.edtFone.OnChange := nil;
  if length(trim(copy(vFone, 5, 10))) > 9 then
  begin
    edtFone.EditMask := '\(99\)99999\-9999;0; ';
    edtFone.Text := TStringUtilitario.ApenasNumeros(vFone);
    edtFone.EditMask := '\(99\)99999\-9999;1; ';
  end
  else
  begin
    edtFone.EditMask := '\(99\)9999\-99999;0; ';
    edtFone.Text := TStringUtilitario.ApenasNumeros(vFone);
    edtFone.EditMask := '\(99\)9999\-99999;1; ';
  end;

  self.edtFone.OnChange := edtFoneChange;
end;

procedure TFone.edtFoneExit(Sender: TObject);
begin
  if not validaData then
    abort;
end;

procedure TFone.limpa;
begin
  self.edtFone.Clear;
  self.edtFone.EditMask := '\(99\)99999\-9999;1; ';
end;

procedure TFone.SetFone(const Value: String);
begin
  FFone := Value;

  if length(trim(FFone)) = 13 then
    edtFone.EditMask := '\(99\)9999\-99999;1; '
  else
    edtFone.EditMask := '\(99\)99999\-9999;1; ';

  self.edtFone.Text := FFone;
end;

function TFone.validaData: Boolean;
begin
  result := true;

  if StringReplace(trim(self.edtFone.Text),' ','', [rfReplaceAll]) <> '()-' then
  begin
    result := false;

    if Length(StringReplace(copy(self.edtFone.Text,1,4),' ','',[rfReplaceAll])) < 4 then
    begin
      frmPadrao.avisar('O c�digo de �rea deve ser informado');
      edtFone.SelStart  := 2;
      edtFone.SelLength := 2;
    end
    else if length(StringReplace(trim(copy(edtFone.Text,5,10)),' ','',[rfReplaceAll])) < 9 then
    begin
      frmPadrao.avisar('Fone informado, inv�lido');
    end
    else
      result := true;
  end;
end;

end.
