program prjServicoVerificadorPedidos;

uses
  Vcl.Forms,
  uPrincipal in '..\..\..\ServicoVerificadorPedidos\uPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
