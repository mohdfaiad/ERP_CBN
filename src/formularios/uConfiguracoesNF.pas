unit uConfiguracoesNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ACBrNfe,
  Dialogs, uPadrao, RxToolEdit, RxCurrEdit, StdCtrls, Buttons, Mask, Repositorio, ConfiguracoesNF,
  ComCtrls;

type
  TfrmConfiguracoesNF = class(TfrmPadrao)
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    pgcGeral: TPageControl;
    tabPrincipal: TTabSheet;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    lblSequenciaNotaFiscal: TLabel;
    cbAmb: TComboBox;
    BitBtn1: TBitBtn;
    edtSequenciaNotaFiscal: TCurrencyEdit;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCredSN: TCurrencyEdit;
    edtIcms: TCurrencyEdit;
    edtPis: TCurrencyEdit;
    edtCofins: TCurrencyEdit;
    tabConfiguracoesEmail: TTabSheet;
    lblSMTPHost: TLabel;
    edtSMTPPort: TCurrencyEdit;
    lblSMTPPort: TLabel;
    lblSMTPUser: TLabel;
    lblSMTPPassword: TLabel;
    chkUsaSSL: TCheckBox;
    lblAssunto: TLabel;
    gbMensagem: TGroupBox;
    memoMensagem: TMemo;
    lblSenhaCertificado: TLabel;
    edtCertificado: TEdit;
    edtSenhaDoCertificado: TEdit;
    edtSMTPHost: TEdit;
    edtSMTPUser: TEdit;
    edtSMTPPassword: TEdit;
    edtAssunto: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    rep        :TRepositorio;

    procedure salvar;
    procedure mostra;
  public
    constructor Create(AOwner :TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmConfiguracoesNF: TfrmConfiguracoesNF;

implementation

uses ACBrNFeConfiguracoes, fabricaRepositorio, StrUtils, Math,
  ExcecaoParametroInvalido, ACBrDFeConfiguracoes, ACBrDFe, ACBrDFeSSL;

{$R *.dfm}

procedure TfrmConfiguracoesNF.BitBtn1Click(Sender: TObject);
var ACBrNfe1 :TACBrNFe;
begin
  ACBrNFe1 := TACBrNFe.Create(Self);
  edtCertificado.Text := ACBrNFe1.SSL.SelecionarCertificado;
end;

procedure TfrmConfiguracoesNF.btnSalvarClick(Sender: TObject);
begin
  salvar;
  inherited Avisar('Operação realizada com sucesso!');
  self.Close;
end;

procedure TfrmConfiguracoesNF.salvar;
begin
//var
//  ConfigNF :TConfiguracoesNF;
//begin
//  ConfigNF := nil;
// try
//   try
//      ConfigNF := TConfiguracoesNF.Create;
//
//      ConfigNF.Codigo := 1;
//
//      ConfigNF.aliq_cred_sn        := edtCredSN.Value;
//      ConfigNF.aliq_icms           := edtIcms.Value;
//      ConfigNF.aliq_pis            := edtPis.Value;
//      ConfigNF.aliq_cofins         := edtCofins.Value;
//      ConfigNF.num_certificado     := edtCertificado.Text;
//      ConfigNF.ambiente_nfe        := Copy(cbAmb.Text,1,1);
//      ConfigNF.SequenciaNotaFiscal := self.edtSequenciaNotaFiscal.AsInteger;
//      ConfigNF.SenhaCertificado    := self.edtSenhaDoCertificado.Text; 
//
//      try
//        ConfigNF.AdicionarConfiguracoesEmail(self.edtSMTPHost.Text,
//                                             self.edtSMTPPort.Text,
//                                             self.edtSMTPUser.Text,
//                                             self.edtSMTPPassword.Text,
//                                             self.edtAssunto.Text,
//                                             self.memoMensagem.Text,
//                                             self.chkUsaSSL.Checked);
//      except
//        on E: TExcecaoParametroInvalido do begin
//          if Confirma('Não foram incluídos todos os dados para configuração de e-mail para envio de NF-e. As configurações de e-mail não serão gravadas. '+
//                      'Deseja prosseguir mesmo assim?') then begin
//            rep.Salvar(ConfigNF);
//          end
//          else
//             self.pgcGeral.ActivePageIndex := 1;
//        end;
//      end;
//
//      rep.Salvar(ConfigNF);
//
//   Except
//     on e: Exception do begin
//         avisar(e.Message)
//     end;
//   end;
// finally
//   FreeAndNil(ConfigNF);
// end;
end;

procedure TfrmConfiguracoesNF.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfiguracoesNF.FormShow(Sender: TObject);
begin
  inherited;
  mostra;
end;

procedure TfrmConfiguracoesNF.mostra;
//var
//  ConfigNF :TConfiguracoesNF;
begin
// ConfigNF := (rep.Get(1) as TConfiguracoesNF);
//
// try
//  if Assigned(ConfigNF) then begin
//    edtCertificado.Text               := ConfigNF.num_certificado;
//    cbAmb.ItemIndex                   := IfThen(ConfigNF.ambiente_nfe = 'H',1,0);
//    edtCredSN.Value                   := ConfigNF.aliq_cred_sn;
//    edtIcms.Value                     := ConfigNF.aliq_icms;
//    edtPis.Value                      := ConfigNF.aliq_pis;
//    edtCofins.Value                   := ConfigNF.aliq_cofins;
//    self.edtSequenciaNotaFiscal.Value := ConfigNF.SequenciaNotaFiscal;
//    self.edtSenhaDoCertificado.Text   := ConfigNF.SenhaCertificado;
//
//    if Assigned(ConfigNF.ConfiguracoesEmail) then begin
//      self.edtSMTPHost.Text     := ConfigNF.ConfiguracoesEmail.SMTPHost;
//      self.edtSMTPPort.Text     := ConfigNF.ConfiguracoesEmail.SMTPPort;
//      self.edtSMTPUser.Text     := ConfigNF.ConfiguracoesEmail.SMTPUser;
//      self.edtSMTPPassword.Text := ConfigNF.ConfiguracoesEmail.SMTPPassword;
//      self.chkUsaSSL.Checked    := ConfigNF.ConfiguracoesEmail.UsaSSL;
//      self.edtAssunto.Text      := ConfigNF.ConfiguracoesEmail.Assunto;
//      self.memoMensagem.Text    := ConfigNF.ConfiguracoesEmail.Mensagem.Text;
//    end;
//  end;
//
// Finally
//   FreeAndNil(ConfigNF);
// end;
end;

constructor TfrmConfiguracoesNF.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   
   self.rep := TFabricaRepositorio.GetRepositorio(TConfiguracoesNF.ClassName);
end;

destructor TfrmConfiguracoesNF.Destroy;
begin
  FreeAndNil(self.rep);
  
  inherited;
end;

end.
