unit uAguarde;

interface
                                                  
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ACBrGIF;

type
  TfrmAguarde = class(TForm)
    memoAguarde: TMemo;
    Shape3: TShape;
    Shape1: TShape;
    gifAguarde: TACBrGIF;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; mensagem: String); overload; virtual;
  end;

var
  frmAguarde: TfrmAguarde;

implementation

{$R *.dfm}

{ TfrmAguarde }

constructor TfrmAguarde.Create(AOwner: TComponent; mensagem: String);
begin
  self.Create(aOwner);
  Self.memoAguarde.Text := mensagem;
  self.DoubleBuffered := true;
end;

procedure TfrmAguarde.FormShow(Sender: TObject);
begin
  frmAguarde.gifAguarde.Filename := ExtractFilePath( Application.ExeName )+'\erp img\Aguarda.gif';
  frmAguarde.gifAguarde.Active   := true;
end;

end.
