unit frameBuscaNaturezaOperacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, NaturezaOperacao, Especificacao;

type
  TBuscaNaturezaOperacao = class(TFrame)
    gbNaturezaOperacao: TGroupBox;
    lblCFOP: TStaticText;
    lblRazao: TStaticText;
    edtCFOP: TEdit;
    btnBusca: TBitBtn;
    edtDescricao: TEdit;
    procedure edtCFOPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscaEnter(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure edtCFOPKeyPress(Sender: TObject; var Key: Char);

  private
    FCriou              :Boolean;
    FNaturezaOperacao   :TNaturezaOperacao;
    FAbreTelaPesquisa   :Boolean;
    FEspecificacao: TEspecificacao;

  private
    procedure Buscar             (const CFOP :String);
    procedure SetNaturezaOperacao(const Value: TNaturezaOperacao);
    procedure SetAbreTelaPesquisa(const Value: Boolean);
    procedure SetEspecificacao(const Value: TEspecificacao);

  public
    constructor Create(AOwner :TComponent); override;
    destructor  Destroy;                    override;

  public
    procedure Clear;

  public
    property NaturezaOperacao :TNaturezaOperacao read FNaturezaOperacao write SetNaturezaOperacao;
    property AbreTelaPesquisa :Boolean           read FAbreTelaPesquisa write SetAbreTelaPesquisa;
    property Especificacao    :TEspecificacao    read FEspecificacao write SetEspecificacao;
  end;

implementation

uses
  Repositorio,
  FabricaRepositorio,
  EspecificacaoNaturezaComCFOPIgualA,
  uCadastroNaturezaOperacao;

{$R *.dfm}

{ TBuscaNaturezaOperacao }

procedure TBuscaNaturezaOperacao.Buscar(const CFOP: String);
var
  Repositorio   :TRepositorio;
  Natureza      :TNaturezaOperacao;
  Especificacao :TEspecificacao;
begin
   Repositorio   := nil;
   Especificacao := nil;

   try
     Especificacao := TEspecificacaoNaturezaComCFOPIgualA.Create(CFOP);
     Repositorio   := TFabricaRepositorio.GetRepositorio(TNaturezaOperacao.ClassName);
     Natureza      := TNaturezaOperacao(Repositorio.GetPorEspecificacao(Especificacao));

     { Se tiver setado especificação pra esse frame então o objeto DEVE atender a especificação }
     if Assigned(Natureza)                               and
        Assigned(self.FEspecificacao)                    and
       (not self.FEspecificacao.SatisfeitoPor(Natureza)) then
      FreeAndNil(Natureza);

     if not Assigned(Natureza) and self.AbreTelaPesquisa then begin
       frmCadastroNaturezaOperacao := nil;

       try
         frmCadastroNaturezaOperacao := TfrmCadastroNaturezaOperacao.CreateModoBusca(nil, self.FEspecificacao);
         frmCadastroNaturezaOperacao.ShowModal;

         if (frmCadastroNaturezaOperacao.ModalResult = mrOK) then begin
            FreeAndNil(Especificacao);
            Especificacao := TEspecificacaoNaturezaComCFOPIgualA.Create(frmCadastroNaturezaOperacao.cdsCFOP.AsString);

            Natureza := TNaturezaOperacao(Repositorio.GetPorEspecificacao(Especificacao));

            if Assigned(Natureza) then begin
              self.NaturezaOperacao := Natureza;
              self.FCriou           := true;
            end;
         end
         else
          self.Clear;
       finally
         frmCadastroNaturezaOperacao.Release;
         frmCadastroNaturezaOperacao := nil;
       end;
     end
     else begin
       self.NaturezaOperacao := Natureza;
       self.FCriou           := (Natureza <> nil);
     end;
   finally
     FreeAndNil(Repositorio);
     FreeAndNil(Especificacao);
   end;
end;

procedure TBuscaNaturezaOperacao.Clear;
begin
   if Self.FCriou and Assigned(self.FNaturezaOperacao) then
      FreeAndNil(self.FNaturezaOperacao);

   self.edtCFOP.Clear;
   self.edtDescricao.Clear;
   self.FCriou := false;
end;

constructor TBuscaNaturezaOperacao.Create(AOwner: TComponent);
begin
  inherited;

  self.FNaturezaOperacao := nil;
  self.FCriou            := false;
  self.FAbreTelaPesquisa := True;
  self.FEspecificacao    := nil; 
end;

destructor TBuscaNaturezaOperacao.Destroy;
begin
  if self.FCriou and Assigned(self.FNaturezaOperacao) then
    FreeAndNil(self.FNaturezaOperacao);

  FreeAndNil(self.FEspecificacao);

  inherited;
end;

procedure TBuscaNaturezaOperacao.SetNaturezaOperacao(
  const Value: TNaturezaOperacao);
begin
   try
     if (Value = self.FNaturezaOperacao) then
      exit;
   except
     on E: EAccessViolation do
   end;

   if self.FCriou and Assigned(self.FNaturezaOperacao) then begin
      FreeAndNil(self.FNaturezaOperacao);
      self.FCriou := false;
   end;

   FNaturezaOperacao := Value;

  if Assigned(self.FNaturezaOperacao) then begin
    self.edtCFOP.Text      := self.FNaturezaOperacao.CFOP;
    self.edtDescricao.Text := self.FNaturezaOperacao.Descricao;
  end
  else
    self.Clear;
end;

procedure TBuscaNaturezaOperacao.edtCFOPKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_RETURN) then keybd_event(VK_TAB, 0,  0, 0);
end;

procedure TBuscaNaturezaOperacao.btnBuscaEnter(Sender: TObject);
begin
   if ((self.edtCFOP.Text = '') or (Length(self.edtCFOP.Text) <> 4)) then
     self.edtCFOP.Clear;

   self.Buscar(self.edtCFOP.Text);
   keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaNaturezaOperacao.btnBuscaClick(Sender: TObject);
begin
   self.Buscar(self.edtCFOP.Text);
   keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaNaturezaOperacao.edtCFOPKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9']) and not (key = #8) then
    Key := #0;
end;

procedure TBuscaNaturezaOperacao.SetAbreTelaPesquisa(const Value: Boolean);
begin
  FAbreTelaPesquisa := Value;
end;

procedure TBuscaNaturezaOperacao.SetEspecificacao(
  const Value: TEspecificacao);
begin
  if Assigned(self.FEspecificacao) and Assigned(Value) then
    FreeAndNil(self.FEspecificacao);
    
  FEspecificacao := Value;
end;

end.
