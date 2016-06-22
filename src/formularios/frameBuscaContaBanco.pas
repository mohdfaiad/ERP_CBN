unit frameBuscaContaBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ContaBanco, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TBuscaContaBanco = class(TFrame)
    StaticText1: TStaticText;
    edtCodigo: TCurrencyEdit;
    btnBusca: TBitBtn;
    edtBanco: TEdit;
    StaticText2: TStaticText;
    edtNumAgencia: TEdit;
    StaticText3: TStaticText;
    edtNumConta: TEdit;
    StaticText4: TStaticText;
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnBuscaEnter(Sender: TObject);
    procedure edtBancoEnter(Sender: TObject);
    procedure edtNumAgenciaEnter(Sender: TObject);
    procedure edtNumContaEnter(Sender: TObject);
  private
    FConta          :TContaBanco;
    FcodConta       :integer;

  private
    procedure SetcodConta      (const Value: integer);

  private
    procedure Buscar    (const CodigoConta :Integer);
    procedure SetConta  (const Value :TContaBanco);

  public
    procedure Clear;

  public
    property Conta       :TContaBanco  read FConta       write SetConta;
    property codConta    :integer      read FcodConta       write SetcodConta;
  end;

implementation

uses Repositorio, FabricaRepositorio, uCadastroContasBanco;

{$R *.dfm}

{ TFrame1 }

procedure TBuscaContaBanco.btnBuscaClick(Sender: TObject);
begin
    self.Buscar(self.edtCodigo.AsInteger);
    keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaContaBanco.btnBuscaEnter(Sender: TObject);
begin
  if (self.edtCodigo.Text = '0') or (self.edtCodigo.Text = '') then
     self.Clear;

   self.Buscar(self.edtCodigo.AsInteger);
   keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaContaBanco.Buscar(const CodigoConta: Integer);
var
  Repositorio :TRepositorio;
  ContaBanco  :TContaBanco;
begin
   Repositorio := nil;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TContaBanco.ClassName);
     ContaBanco  := TContaBanco(Repositorio.Get(CodigoConta));

     if not Assigned(ContaBanco) then begin
       frmCadastroContasBanco := nil;

       try
         frmCadastroContasBanco := TfrmCadastroContasBanco.CreateModoBusca(nil);
         frmCadastroContasBanco.ShowModal;

         if (frmCadastroContasBanco.ModalResult = mrOK) then begin
            ContaBanco          := TContaBanco(Repositorio.Get(frmCadastroContasBanco.cdsCODIGO.AsInteger));

            if Assigned(ContaBanco) then
              self.Conta := ContaBanco;
         end
         else
          self.Clear;
       finally
         frmCadastroContasBanco.Release;
         frmCadastroContasBanco := nil;
       end;
     end
     else
       self.Conta := ContaBanco;

   finally
     FreeAndNil(Repositorio);
   end;
end;

procedure TBuscaContaBanco.Clear;
begin
  self.FConta  := nil;
  edtCodigo.Clear;
  edtBanco.Clear;
  edtNumAgencia.Clear;
  edtNumConta.Clear;
end;

procedure TBuscaContaBanco.edtBancoEnter(Sender: TObject);
begin
  if edtBanco.Text <> '' then
    keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaContaBanco.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_RETURN) then keybd_event(VK_TAB, 0,  0, 0);
end;

procedure TBuscaContaBanco.edtNumAgenciaEnter(Sender: TObject);
begin
    if edtBanco.Text <> '' then
      keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaContaBanco.edtNumContaEnter(Sender: TObject);
begin
  if edtBanco.Text <> '' then
    keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaContaBanco.SetcodConta(const Value: integer);
begin
  if value > 0 then
    self.Buscar( Value )
  else
    self.Clear;
end;

procedure TBuscaContaBanco.SetConta(const Value: TContaBanco);
begin
   try
     if (Value = self.FConta) then
      exit;
   except
     on E: EAccessViolation do
   end;


   if Assigned(self.FConta) then
      FreeAndNil(self.FConta);

   FConta := Value;

  if Assigned(self.FConta) then begin
    self.edtCodigo.Text       := IntToStr(self.FConta.codigo);
    self.edtBanco.Text        := self.FConta.banco;
    self.edtNumAgencia.Text   := self.FConta.agencia;
    self.edtNumConta.Text     := self.FConta.numero_conta;
  end;

end;

end.
