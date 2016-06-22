unit frameBuscaDestinatario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Pessoa;

type
  TBuscaDestinatario = class(TFrame)
    gpbDestinatario: TGroupBox;
    lblCodigo: TStaticText;
    lblNomeRazaoSocial: TStaticText;
    edtNomeRazaoSocial: TEdit;
    btnBusca: TBitBtn;
    edtCodigo: TEdit;

    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnBuscaEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    FCriou                 :Boolean;
    FDestinatario          :TPessoa;
    FAposAcharDestinatario :TNotifyEvent;

  private
    procedure Buscar                  (const CodigoPessoa :Integer);
    procedure SetDestinatario         (const Value :TPessoa);
    procedure SetAposAcharDestinatario(const Value: TNotifyEvent);

  public
    constructor Create(AOwner :TComponent); override;
    destructor  Destroy;                    override;

  public
    procedure Clear;

  public
    property Destinatario          :TPessoa read FDestinatario write SetDestinatario;
    property AposAcharDestinatario :TNotifyEvent read FAposAcharDestinatario write SetAposAcharDestinatario;
end;

implementation

uses
  Repositorio,
  FabricaRepositorio,
  EspecificacaoApenasDestinatarios,
  EspecificacaoDestinatarioComCodigoIgualA,
  uPesquisaDestinatario;

{$R *.dfm}

procedure TBuscaDestinatario.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9']) and not (key = #8) then
    Key := #0;
end;

procedure TBuscaDestinatario.btnBuscaClick(Sender: TObject);
begin
   self.Buscar(StrToIntDef(self.edtCodigo.Text, 0));
   keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaDestinatario.btnBuscaEnter(Sender: TObject);
begin
   if (self.edtCodigo.Text = '0') or (self.edtCodigo.Text = '') then
     self.edtNomeRazaoSocial.Clear;
     
   self.Buscar(StrToIntDef(self.edtCodigo.Text, 0));
   keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaDestinatario.edtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_RETURN) then keybd_event(VK_TAB, 0,  0, 0);
end;

procedure TBuscaDestinatario.Buscar(const CodigoPessoa: Integer);
var
  Repositorio                 :TRepositorio;
  P                           :TPessoa;
  ApenasDestinatarios         :TEspecificacaoApenasDestinatarios;
  DestinatarioComCodigoIgualA :TEspecificacaoDestinatarioComCodigoIgualA;
begin
   Repositorio                  := nil;
   ApenasDestinatarios          := TEspecificacaoApenasDestinatarios.Create;
   DestinatarioComCodigoIgualA  := TEspecificacaoDestinatarioComCodigoIgualA.Create(CodigoPessoa);

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
     P           := TPessoa(Repositorio.GetPorEspecificacao(DestinatarioComCodigoIgualA));

     if not Assigned(P) then begin
       frmPesquisaDestinatario := nil;

       try
         frmPesquisaDestinatario := TfrmPesquisaDestinatario.CreateModoBusca(nil, ApenasDestinatarios);
         frmPesquisaDestinatario.ShowModal;

         if (frmPesquisaDestinatario.ModalResult = mrOK) then begin
            P          := TPessoa(Repositorio.Get(frmPesquisaDestinatario.cdsCODIGO.AsInteger));

            if Assigned(P) then begin
              self.Destinatario := P;
              self.FCriou       := true;
            end;
         end
         else
          self.Clear;
       finally
         frmPesquisaDestinatario.Release;
         frmPesquisaDestinatario := nil;
       end;
     end
     else begin
       self.Destinatario := P;
       self.FCriou       := true;
     end;

   finally
     FreeAndNil(Repositorio);
     FreeAndNil(ApenasDestinatarios);
     FreeAndNil(DestinatarioComCodigoIgualA);
   end;
end;

procedure TBuscaDestinatario.Clear;
begin
   if Self.FCriou and Assigned(self.FDestinatario) then
    FreeAndNil(self.FDestinatario);

   self.edtCodigo.Clear;
   self.edtNomeRazaoSocial.Clear;
   self.FCriou := false;
end;

constructor TBuscaDestinatario.Create(AOwner: TComponent);
begin
  inherited;

  self.FDestinatario := nil;
  self.FCriou        := false;
end;

destructor TBuscaDestinatario.Destroy;
begin
  if self.FCriou and Assigned(self.FDestinatario) then
    FreeAndNil(self.FDestinatario);

  inherited;
end;

procedure TBuscaDestinatario.SetDestinatario(const Value: TPessoa);
begin
   try
     if (Value = self.FDestinatario) then
      exit;
   except
     on E: EAccessViolation do
   end;

   if self.FCriou and Assigned(self.FDestinatario) then begin
    FreeAndNil(self.FDestinatario);
    self.FCriou := false;
   end;

   FDestinatario := Value;

  if Assigned(self.FDestinatario) then begin
    self.edtCodigo.Text          := IntToStr(self.FDestinatario.Codigo);
    self.edtNomeRazaoSocial.Text := self.FDestinatario.Razao;

    if Assigned(self.FAposAcharDestinatario) then
      self.FAposAcharDestinatario(self.FDestinatario);
  end;
end;

procedure TBuscaDestinatario.SetAposAcharDestinatario(
  const Value: TNotifyEvent);
begin
  FAposAcharDestinatario := Value;
end;

end.
 