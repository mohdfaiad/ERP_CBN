unit frameBuscaEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Empresa;

type
  TBuscaEmpresa = class(TFrame)
    gpbEmpresa: TGroupBox;
    edtRazao: TEdit;
    lblRazao: TStaticText;
    btnBusca: TBitBtn;
    edtCodigo: TEdit;
    lblCodigo: TStaticText;
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscaEnter(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);

  private
    FCriou            :Boolean;
    FEmpresa          :TEmpresa;
    FcodEmpresa       :integer;
    FAposAcharEmpresa :TNotifyEvent;

  private
    procedure SetcodEmpresa      (const Value: integer);
    procedure SetAposAcharEmpresa(const Value: TNotifyEvent);

  private
    procedure Buscar    (const CodigoEmpresa :Integer);
    procedure SetEmpresa(const Value         :TEmpresa);

  public
    constructor Create(AOwner :TComponent); override;
    destructor  Destroy;                    override;

  public
    procedure Clear;

  public
    property Empresa          :TEmpresa     read FEmpresa          write SetEmpresa;
    property codEmpresa       :integer      read FcodEmpresa       write SetcodEmpresa;
    property AposAcharEmpresa :TNotifyEvent read FAposAcharEmpresa write SetAposAcharEmpresa;
  end;

implementation

uses
  Repositorio,
  FabricaRepositorio,
  uCadastroEmpresa,
  uCadastroPadrao;

{$R *.dfm}

{ TBuscaEmpresa }

procedure TBuscaEmpresa.Buscar(const CodigoEmpresa: Integer);
var
  Repositorio :TRepositorio;
  Emp         :TEmpresa;
begin
   Repositorio := nil;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TEmpresa.ClassName);
     Emp         := TEmpresa(Repositorio.Get(CodigoEmpresa));

     if not Assigned(Emp) then begin
       frmCadastroEmpresa := nil;

       try
         frmCadastroEmpresa := TfrmCadastroEmpresa.CreateModoBusca(nil);
         frmCadastroEmpresa.ShowModal;

         if (frmCadastroEmpresa.ModalResult = mrOK) then begin
            Emp          := TEmpresa(Repositorio.Get(frmCadastroEmpresa.cdsCODIGO.AsInteger));

            if Assigned(Emp) then begin
              self.Empresa := Emp;
              self.FCriou  := true;
            end;
         end
         else
          self.Clear; 
       finally
         frmCadastroEmpresa.Release;
         frmCadastroEmpresa := nil;
       end;
     end
     else begin
       self.Empresa := Emp;
       self.FCriou  := true;
     end;
   
   finally
     FreeAndNil(Repositorio);
   end;
end;

constructor TBuscaEmpresa.Create(AOwner: TComponent);
begin
  inherited;

  self.FEmpresa  := nil;
  self.FCriou    := false;
end;

destructor TBuscaEmpresa.Destroy;
begin
  if self.FCriou and Assigned(self.FEmpresa) then
    FreeAndNil(self.FEmpresa);
    
  inherited;
end;

procedure TBuscaEmpresa.SetEmpresa(const Value: TEmpresa);
begin
   try
     if (Value = self.FEmpresa) then
      exit;
   except
     on E: EAccessViolation do
   end;


   if self.FCriou and Assigned(self.FEmpresa) then begin
      FreeAndNil(self.FEmpresa);
      self.FCriou := false;
   end;
    
   FEmpresa := Value;

  if Assigned(self.FEmpresa) then begin
    self.edtCodigo.Text := IntToStr(self.FEmpresa.CodigoEmpresa);
    self.edtRazao.Text  := self.FEmpresa.Razao;
  end;

  if Assigned(self.FAposAcharEmpresa) then
    self.FAposAcharEmpresa(self.FEmpresa);
end;

procedure TBuscaEmpresa.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_RETURN) then keybd_event(VK_TAB, 0,  0, 0);
end;

procedure TBuscaEmpresa.btnBuscaEnter(Sender: TObject);
begin
  if (self.edtCodigo.Text = '0') or (self.edtCodigo.Text = '') then
     self.edtRazao.Clear;
     
   self.Buscar(StrToIntDef(self.edtCodigo.Text, 0));
   keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaEmpresa.btnBuscaClick(Sender: TObject);
begin
    self.Buscar(StrToIntDef(self.edtCodigo.Text, 0));
    keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaEmpresa.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9']) and not (key = #8) then
    Key := #0;
end;

procedure TBuscaEmpresa.Clear;
begin
   if Self.FCriou and Assigned(self.FEmpresa) then
      FreeAndNil(self.FEmpresa);

   self.edtCodigo.Clear;
   self.edtRazao.Clear;
   self.FCriou := false;   
end;

procedure TBuscaEmpresa.SetcodEmpresa(const Value: integer);
begin
  if value > 0 then
    self.Buscar( Value )
  else
    self.Clear;  
end;

procedure TBuscaEmpresa.SetAposAcharEmpresa(const Value: TNotifyEvent);
begin
  FAposAcharEmpresa := Value;
end;

end.
