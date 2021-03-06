unit uPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModulo, stdCtrls, DBCtrls, Mask, RxCurrEdit, PermissoesAcesso, Vcl.Buttons, uFundoContencao;

type
  TfrmPadrao = class(TForm)

    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    
  private
    FFecharComEsc: Boolean;
    FaguardaAtivo :Boolean;

  private
    procedure SetFecharComEsc(const Value: Boolean);
    procedure padraoConfiguraGrid;

  protected
    procedure KeyDownPadrao(Sender: TObject; var Key: Word; Shift: TShiftState);

  public
    function chamaInput(REAL_INTEGER_DATE_STRING_TEXT, titulo :string):String;
    function confirma(mensagem:String) :Boolean;

  public
    procedure AbreForm(frm: TFormClass;
                       permissao :integer;
                       const msg_retorno :String = 'Usu�rio sem permiss�o para acessar esta funcionalidade!';
                       const pede_supervisor :boolean = false);
    procedure AbrirArquivo(const CaminhoCompletoDoArquivo :String);
    procedure avisar(mensagem:String; const tempoEspera :integer = 0; const semAtalho :String = ''; const tipo :Integer = 0);
    procedure Aguarda(mensagem :String);
    procedure FimAguarda(const mensagem :String = '');
    procedure buscaTelaAtalhos;

    function getMsgAguarda :String;

  public
    constructor Create(AOwner :TComponent); override;

  protected
    Fdm :Tdm;

    property FecharComEsc :Boolean read FFecharComEsc write SetFecharComEsc;
end;

var
  frmPadrao: TfrmPadrao;

implementation

uses
  uInputBox,
  uAvisar,
  uAguarde,
  uConfirmacaoUsuario,
  DBGridCBN,
  ConfigCores,
  Masks,
  ShellApi,
  uAtalhoCadastros;

{$R *.dfm}

{ TfrmPadrao }

procedure TfrmPadrao.avisar(mensagem: String; const tempoEspera: integer; const semAtalho :String; const tipo :Integer);
begin
  frmAvisar := TfrmAvisar.Create(self, mensagem, tempoEspera, semAtalho, tipo);
  frmAvisar.ShowModal;
  frmAvisar.Release;
  frmAvisar := nil;
end;

function TfrmPadrao.chamaInput(REAL_INTEGER_DATE_STRING_TEXT, titulo: string):String;
begin
  frmInputBox := TfrmInputBox.Create(Self,REAL_INTEGER_DATE_STRING_TEXT, titulo);
  if frmInputBox.ShowModal = mrOk then
    Result := frmInputBox.Retorno;
  frmInputBox.Release;
  frmInputBox := nil;  
end;

procedure TfrmPadrao.AbreForm(frm: TFormClass; permissao :integer; const msg_retorno :String; const pede_supervisor :boolean);
var lFrm : TForm;
begin
   try

   if not TPermissoesAcesso.VerificaPermissao(permissao, msg_retorno, pede_supervisor) then
     Exit;

      lFrm := frm.Create(nil);
      lFrm.ShowModal;


       if Assigned( lFrm ) then
        begin
           lFrm.Release;
           lFrm := nil;
        end;

   except                                            
    on e : Exception do
      begin
        Avisar('Tela n�o pode ser exibida. |'+e.Message);
      end;
   end;
end;

procedure TfrmPadrao.FormCreate(Sender: TObject);
begin
  Fdm := dm;
  self.FaguardaAtivo := false;
  padraoConfiguraGrid;
end;

procedure TfrmPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ActiveControl is TDBGridCBN) and (ActiveControl as TDBGridCBN).buscando and (Key = VK_ESCAPE) then
  begin
    key := 0;
    (ActiveControl as TDBGridCBN).DataSource.DataSet.Filtered := false;
  end;

  if      (Key = VK_RETURN) then
    begin
       Shift := [];
       //Key   := 0;
       if not ((self.ActiveControl is TButton) or (self.ActiveControl is TBitBtn))then
         keybd_event(VK_TAB, 0, 0, 0);
    end
   else if (Key = VK_ESCAPE) and self.FFecharComEsc then
    begin
       Shift := [];
       Key   := 0;
       self.Close();
    end
   else if(ssCtrl in Shift) and (ssShift in Shift) then
     if key = 67 then
       buscaTelaAtalhos;

end;

function TfrmPadrao.getMsgAguarda: String;
begin
  result := '';
  if assigned(frmAguarde) then
    result := frmAguarde.memoAguarde.Text;
end;

function TfrmPadrao.confirma(mensagem: String): Boolean;
begin
  Result := false;
  
  frmConfirmacaoUsuario := TfrmConfirmacaoUsuario.Create(self);
  frmConfirmacaoUsuario.memMsg.Text := mensagem;

  if frmConfirmacaoUsuario.ShowModal = mrOk then
    result := true;

  frmConfirmacaoUsuario.Release;
  frmConfirmacaoUsuario := nil;
end;

procedure TfrmPadrao.padraoConfiguraGrid;
var i :integer;
begin
  for i := 0 to ComponentCount-1 do begin
    if Components[I] is TDBGridCBN then begin
      TDBGridCBN(Components[i]).ConfCores.Destacado.CorFonte := clwhite;
      TDBGridCBN(Components[i]).ConfCores.Destacado.CorFundo := $00538C60;//$00917E6F;
      TDBGridCBN(Components[i]).ConfCores.Selecao.CorFonte   := clBlack;
      TDBGridCBN(Components[i]).ConfCores.Selecao.CorFundo   := $0098E0B7;
      TDBGridCBN(Components[i]).ConfCores.Normal.CorFonte    := clBlack;
      TDBGridCBN(Components[i]).ConfCores.Normal.CorFundo    := $00E1E1E1;
      TDBGridCBN(Components[i]).ConfCores.Zebrada.CorFonte   := clBlack;
      TDBGridCBN(Components[i]).ConfCores.Zebrada.CorFundo   := clWhite;
    end;
  end;
end;

procedure TfrmPadrao.KeyDownPadrao(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   self.FormKeyDown(Sender, Key, Shift);
end;

procedure TfrmPadrao.AbrirArquivo(const CaminhoCompletoDoArquivo:String);
begin
    ShellExecute(handle, 'open', PChar(CaminhoCompletoDoArquivo), '','',SW_SHOWNORMAL);
end;

procedure TfrmPadrao.SetFecharComEsc(const Value: Boolean);
begin
  FFecharComEsc := Value;
end;

constructor TfrmPadrao.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);

   self.FFecharComEsc := true;
end;

procedure TfrmPadrao.Aguarda(mensagem: String);
begin
  if frmAguarde = nil then begin
    frmFundoContencao := TfrmFundoContencao.Create(nil);
    frmFundoContencao.Show;
    frmAguarde := TfrmAguarde.Create(nil, mensagem);
    frmAguarde.Show;
  end
  else
    frmAguarde.memoAguarde.Text := mensagem;

  self.FaguardaAtivo := true;
end;

procedure TfrmPadrao.FimAguarda(const mensagem :String);
begin
  if self.FaguardaAtivo then begin
    frmAguarde.memoAguarde.Text := mensagem;

    if mensagem <> '' then
      sleep(3000);

    self.FaguardaAtivo := false;
    frmAguarde.Release;
    frmAguarde := nil;
    frmFundoContencao.Release;
    frmFundoContencao := nil;
  end;

end;

procedure TfrmPadrao.buscaTelaAtalhos;
var I :integer;
begin

  for I := 0 to Screen.FormCount -1 do begin

    if Screen.Forms[I] is TFrmAtalhoCadastros then begin

       if (Screen.Forms[I] as TFrmAtalhoCadastros).Visible then
         (Screen.Forms[I] as TFrmAtalhoCadastros).Visible := false
       else
         (Screen.Forms[I] as TFrmAtalhoCadastros).Visible := true;

    end;

  end;

end;

end.
