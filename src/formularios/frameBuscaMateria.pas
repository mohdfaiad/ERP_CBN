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
    procedure edtCodigoChange(Sender: TObject);
  private
    FMateria          :TMateria;
    FcodMateria       :integer;
    FFiltroDescricao   :String;
    FTituloBusca      :String;
    FApenasControlaEstoque: Boolean;

  private
    procedure SetcodMateria      (const Value: integer);

  private
    procedure Buscar    (const CodigoMateria :Integer);
    procedure SetMateria(const Value         :TMateria);

  public
    procedure Clear;
    procedure Desabilitar;
    procedure Habilitar;

  public
    property Materia          :TMateria     read FMateria          write SetMateria;
    property codMateria       :integer      read FcodMateria       write SetcodMateria;

  public
    property FiltroDescricao       :String   read FFiltroDescricao       write FFiltroDescricao;
    property TituloBusca           :String   read FTituloBusca           write FTituloBusca;
    property ApenasControlaEstoque :Boolean  read FApenasControlaEstoque write FApenasControlaEstoque;
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
  vMateria     :TMateria;
begin
   Repositorio := nil;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TMateria.ClassName);
     vMateria     := TMateria(Repositorio.Get(CodigoMateria));

     if not Assigned(vMateria) or (FApenasControlaEstoque and not(vMateria.controla_estoque)) then
     begin
       frmCadastroMateria := nil;
       try
         frmCadastroMateria := TfrmCadastroMateria.CreateModoBusca(nil);
         if FFiltroDescricao <> '' then
         begin
           frmCadastroMateria.filtroDescricao := self.FFiltroDescricao;//' DESCRICAO LIKE ''CAIXA%'' ';
           frmCadastroMateria.gridConsulta.BuscaHabilitada := false;
         end;
         if FTituloBusca <> '' then
           frmCadastroMateria.Caption         := FTituloBusca;

         frmCadastroMateria.ApenasControlaEstoque := FApenasControlaEstoque;
         frmCadastroMateria.ShowModal;

         if (frmCadastroMateria.ModalResult = mrOK) then begin
            vMateria          := TMateria(Repositorio.Get(frmCadastroMateria.cdsCODIGO.AsInteger));

            if Assigned(vMateria) then
              self.Materia := vMateria;
         end
         else
          self.Clear; 
       finally
         frmCadastroMateria.Release;
         frmCadastroMateria := nil;
       end;
     end
     else
       self.Materia := vMateria;
   
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

procedure TBuscaMateria.Desabilitar;
begin
  edtCodigo.Enabled     := false;
  edtDescricao.Enabled  := false;
  btnBusca.Enabled      := false;
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
    self.edtCodigo.OnChange := nil;
    self.edtCodigo.Text     := IntToStr(self.FMateria.codigo);
    self.edtDescricao.Text  := self.FMateria.descricao;
    self.edtCodigo.OnChange := self.edtCodigoChange;
  end;

end;

procedure TBuscaMateria.edtCodigoChange(Sender: TObject);
begin
  edtDescricao.Clear;
  if assigned(self.FMateria) then
    FreeAndNil(FMateria);
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
//  if edtDescricao.Text <> '' then
    keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaMateria.Habilitar;
begin
  edtCodigo.Enabled     := true;
  edtDescricao.Enabled  := true;
  btnBusca.Enabled      := true;
end;

end.
