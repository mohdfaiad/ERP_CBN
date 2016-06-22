unit frameBuscaMateria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask, RxToolEdit, RxCurrEdit, Materia, uCadastroMateria;

type
  TBuscaMateria = class(TFrame)
    StaticText1: TStaticText;
    edtCodigo: TCurrencyEdit;
    btnBusca: TBitBtn;
    edtDescricao: TEdit;
    StaticText2: TStaticText;
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnBuscaEnter(Sender: TObject);
    procedure edtDescricaoEnter(Sender: TObject);
  private
    FMateria          :TMateria;
    FcodMateria       :integer;

  private
    procedure SetcodMateria      (const Value: integer);

  private
    procedure Buscar    (const CodigoMateria :Integer);
    procedure SetMateria(const Value         :TMateria);

  public
    procedure Clear;

  public
    property Materia          :TMateria     read FMateria          write SetMateria;
    property codMateria       :integer      read FcodMateria       write SetcodMateria;
  end;

implementation

uses
  Repositorio,
  FabricaRepositorio;

{$R *.dfm}

{ TBuscaMateria }

procedure TBuscaMateria.Buscar(const CodigoMateria: Integer);
var
  Repositorio :TRepositorio;
  Materia     :TMateria;
begin
   Repositorio := nil;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TMateria.ClassName);
     Materia     := TMateria(Repositorio.Get(CodigoMateria));

     if not Assigned(Materia) then begin
       frmCadastroMateria := nil;

       try
         frmCadastroMateria := TfrmCadastroMateria.CreateModoBusca(nil);
         frmCadastroMateria.ShowModal;

         if (frmCadastroMateria.ModalResult = mrOK) then begin
            Materia          := TMateria(Repositorio.Get(frmCadastroMateria.cdsCODIGO.AsInteger));

            if Assigned(Materia) then
              self.Materia := Materia;
         end
         else
          self.Clear; 
       finally
         frmCadastroMateria.Release;
         frmCadastroMateria := nil;
       end;
     end
     else
       self.Materia := Materia;
   
   finally
     FreeAndNil(Repositorio);
   end;
end;

procedure TBuscaMateria.Clear;
begin
  self.FMateria  := nil;
  edtCodigo.Clear;
  edtDescricao.Clear;
end;

procedure TBuscaMateria.SetcodMateria(const Value: integer);
begin
  if value > 0 then
    self.Buscar( Value )
  else
    self.Clear;
end;

procedure TBuscaMateria.SetMateria(const Value: TMateria);
begin
   try
     if (Value = self.FMateria) then
      exit;
   except
     on E: EAccessViolation do
   end;


   if Assigned(self.FMateria) then
      FreeAndNil(self.FMateria);
    
   FMateria := Value;

  if Assigned(self.FMateria) then begin
    self.edtCodigo.Text     := IntToStr(self.FMateria.codigo);
    self.edtDescricao.Text  := self.FMateria.descricao;
  end;

end;

procedure TBuscaMateria.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_RETURN) then keybd_event(VK_TAB, 0,  0, 0);
end;

procedure TBuscaMateria.btnBuscaClick(Sender: TObject);
begin
    self.Buscar(StrToIntDef(self.edtCodigo.Text, 0));
    keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaMateria.btnBuscaEnter(Sender: TObject);
begin
  if (self.edtCodigo.Text = '0') or (self.edtCodigo.Text = '') then
     self.edtDescricao.Clear;
     
   self.Buscar(StrToIntDef(self.edtCodigo.Text, 0));
   keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaMateria.edtDescricaoEnter(Sender: TObject);
begin
  if edtDescricao.Text <> '' then
    keybd_event(VK_TAB, 0, 0, 0);
end;

end.
