unit frameBuscaRepresentante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, RXToolEdit, RXCurrEdit, Representante;

type
  TbuscaRepresentante = class(TFrame)
    StaticText1: TStaticText;
    edtCodigo: TCurrencyEdit;
    StaticText2: TStaticText;
    btnBuscar: TBitBtn;
    edtRazao: TEdit;
    procedure btnBuscarClick(Sender: TObject);
    procedure edtRazaoEnter(Sender: TObject);
    procedure edtRazaoExit(Sender: TObject);
    procedure btnBuscarEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FCriou    :Boolean;
    FRepresentante: TRepresentante;
    FCodigo: integer;
    FCodigoCliente :integer;

    procedure BuscaRepresentante(codigo :Integer);
    procedure SetCodigoRepresentante(const Value: integer);
    procedure setRepresentante(const Value: TRepresentante);

  public
    constructor Create(AOwner :TComponent); override;
    destructor  Destroy;                    override;

  public
    procedure limpa;

    property Representante :TRepresentante read FRepresentante write setRepresentante;
    property codigo        :integer        read FCodigo        write SetCodigoRepresentante;
  end;

implementation

uses repositorio, fabricarepositorio, uPadrao, uCadastroRepresentante;

{$R *.dfm}

{ TBuscaRepresentante }

procedure TbuscaRepresentante.btnBuscarClick(Sender: TObject);
begin
 //   self.BuscaRepresentante(0);
 //   keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TbuscaRepresentante.btnBuscarEnter(Sender: TObject);
begin
  if (self.edtCodigo.Text = '0') or (self.edtCodigo.Text = '') then
     self.edtRazao.Clear;

  self.BuscaRepresentante(0);
  keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TbuscaRepresentante.BuscaRepresentante(codigo: Integer);
var repositorio :TRepositorio;
begin
 Repositorio := nil;

 try
   repositorio     := TFabricaRepositorio.GetRepositorio(TRepresentante.ClassName);
   Representante   := TRepresentante(repositorio.get(codigo));

   if not Assigned(FRepresentante) then begin
     frmCadastroRepresentante := nil;

     try
       frmCadastroRepresentante := TfrmCadastroRepresentante.CreateBusca(nil);

       if (frmCadastroRepresentante.ShowModal = mrOK) then begin
          Representante := TRepresentante(repositorio.Get(frmCadastroRepresentante.cdsCODIGO.AsInteger));

          if Assigned(FRepresentante) then
            self.FCriou  := true;
       end
       else
        self.limpa;
     finally
       frmCadastroRepresentante.Release;
       frmCadastroRepresentante := nil;
     end;
   end
   else
     self.FCriou  := true;

 finally
   FreeAndNil(Repositorio);
 end;
end;

constructor TbuscaRepresentante.Create(AOwner: TComponent);
begin
  inherited;
  self.FRepresentante  := nil;
  self.FCriou          := false;
end;

destructor TbuscaRepresentante.Destroy;
begin
  if self.FCriou and Assigned(self.FRepresentante) then
    FreeAndNil(self.FRepresentante);
  inherited;
end;

procedure TbuscaRepresentante.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_RETURN) then keybd_event(VK_TAB, 0,  0, 0);
end;

procedure TbuscaRepresentante.edtRazaoEnter(Sender: TObject);
begin
  keybd_event(VK_TAB,0,0,0);
end;

procedure TbuscaRepresentante.edtRazaoExit(Sender: TObject);
begin
  self.BuscaRepresentante(edtCodigo.AsInteger);
end;

procedure TbuscaRepresentante.limpa;
begin
   if Self.FCriou and Assigned(self.FRepresentante) then
      FreeAndNil(self.FRepresentante);

   self.edtCodigo.Clear;
   self.edtRazao.Clear;
   self.FCriou := false;
end;

procedure TbuscaRepresentante.SetCodigoRepresentante(const Value: integer);
begin
  if value > 0 then
    self.BuscaRepresentante( Value )
  else
    self.limpa;
end;

procedure TbuscaRepresentante.setRepresentante(const Value: TRepresentante);
begin
   try
     if (Value = self.FRepresentante) then
      exit;
   except
     on E: EAccessViolation do
   end;


   if self.FCriou and Assigned(self.FRepresentante) then begin
      FreeAndNil(self.FRepresentante);
      self.FCriou := false;
   end;

   FRepresentante := Value;

  if Assigned(self.FRepresentante) then begin
    self.edtCodigo.AsInteger := self.FRepresentante.Codigo;
    self.edtRazao.Text       := self.FRepresentante.Razao;
    self.FCodigo             := self.FRepresentante.Codigo;
  end;
end;

end.
