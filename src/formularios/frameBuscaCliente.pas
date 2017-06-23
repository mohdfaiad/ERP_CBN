unit frameBuscaCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask, RXToolEdit, RXCurrEdit, Cliente;

type
  TBuscaCliente = class(TFrame)
    StaticText1: TStaticText;
    edtCodigo: TCurrencyEdit;
    StaticText2: TStaticText;
    btnBuscar: TBitBtn;
    edtRazao: TEdit;
    procedure edtRazaoEnter(Sender: TObject);
    procedure edtRazaoExit(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnBuscarEnter(Sender: TObject);
  private
    FCriou    :Boolean;
    FCliente  :TCliente;
    FCodigo   :integer;
    FCodigoCliente :integer;

    procedure buscaCliente(codigo :Integer);
    procedure setCliente(const Value: TCliente);
    procedure SetCodigoCliente(const Value: integer);

  public
    constructor Create(AOwner :TComponent); override;
    destructor  Destroy;                    override;

  public
    procedure limpa;

    property Cliente   :TCliente read FCliente       write setCliente;
    property codigo    :integer  read FCodigoCliente write SetCodigoCliente;
  end;

implementation

uses repositorio, fabricarepositorio, uPadrao, uCadastroCliente;

{$R *.dfm}

{ TBuscaCliente }

procedure TBuscaCliente.btnBuscarClick(Sender: TObject);
begin
   // self.buscaCliente(0);
   // keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaCliente.btnBuscarEnter(Sender: TObject);
begin
  if (self.edtCodigo.Text = '0') or (self.edtCodigo.Text = '') then
     self.edtRazao.Clear;

  self.buscaCliente(0);
  keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaCliente.buscaCliente(codigo: Integer);
var repositorio :TRepositorio;
begin
 Repositorio := nil;

 try
   repositorio := TFabricaRepositorio.GetRepositorio(TCliente.ClassName);
   Cliente     := TCliente(repositorio.get(codigo));

   if not Assigned(FCliente) then begin
     frmCadastroCliente := nil;

     try
       frmCadastroCliente := TfrmCadastroCliente.CreateBusca(nil);

       if (frmCadastroCliente.ShowModal = mrOK) then
          Cliente := TCliente(repositorio.Get(frmCadastroCliente.cdsCODIGO.AsInteger))
       else
        self.limpa;
     finally
       frmCadastroCliente.Release;
       frmCadastroCliente := nil;
     end;
   end
   else
     self.FCriou  := true;

   if Assigned(FCliente) then
   begin
     if FCliente.Bloqueado = 'B' then
     begin
       frmPadrao.avisar('Este cliente está bloqueado.'+#13#10+'Motivo: '+FCliente.motivoBloqueio);
       limpa;
       edtCodigo.SetFocus;
       exit;
     end
     else if FCliente.Bloqueado = 'P' then
       frmPadrao.avisar('Este cliente possui pendência.'+#13#10+'Pendência: '+FCliente.motivoBloqueio);

     self.FCriou  := true;
   end;

 finally
   FreeAndNil(Repositorio);
 end;
end;

constructor TBuscaCliente.Create(AOwner: TComponent);
begin
  inherited;
  self.FCliente  := nil;
  self.FCriou    := false;
end;

destructor TBuscaCliente.Destroy;
begin
  if self.FCriou and Assigned(self.FCliente) then
    FreeAndNil(self.FCliente);
  inherited;
end;

procedure TBuscaCliente.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_RETURN) then keybd_event(VK_TAB, 0,  0, 0);
end;

procedure TBuscaCliente.edtRazaoEnter(Sender: TObject);
begin
  keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaCliente.edtRazaoExit(Sender: TObject);
begin
  self.buscaCliente(edtCodigo.AsInteger);
end;

procedure TBuscaCliente.limpa;
begin
   if Self.FCriou and Assigned(self.FCliente) then
      FreeAndNil(self.FCliente);

   self.edtCodigo.Clear;
   self.edtRazao.Clear;
   self.FCriou := false;
end;

procedure TBuscaCliente.setCliente(const Value: TCliente);
begin
   try
     if (Value = self.FCliente) then
      exit;
   except
     on E: EAccessViolation do
   end;


   if self.FCriou and Assigned(self.FCliente) then begin
      FreeAndNil(self.FCliente);
      self.FCriou := false;
   end;

   FCliente := Value;

  if Assigned(self.FCliente) then begin
    self.edtCodigo.AsInteger := self.FCliente.Codigo;
    self.edtRazao.Text  := self.FCliente.Razao;
    self.FCodigoCliente      := self.FCliente.Codigo
  end;
end;

procedure TBuscaCliente.SetCodigoCliente(const Value: integer);
begin
  if value > 0 then
    self.buscaCliente( Value )
  else
    self.limpa;
end;

end.
