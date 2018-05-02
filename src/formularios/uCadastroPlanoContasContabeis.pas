unit uCadastroPlanoContasContabeis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, DBGridCBN,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Contnrs, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TfrmCadastroPlanoContasContabeis = class(TfrmCadastroPadrao)
    cdsCODIGO: TIntegerField;
    cdsNOME_CTA: TStringField;
    cdsCOD_CTA: TStringField;
    edtCodigo: TCurrencyEdit;
    edtCodigoConta: TEdit;
    cbxNaturezaConta: TComboBox;
    dtpAlteracao: TDateTimePicker;
    edtNomeConta: TEdit;
    cbxTipoConta: TComboBox;
    edtNivelConta: TCurrencyEdit;
    lblRazao: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
  private
    { Altera um registro existente no CDS de consulta }
    procedure AlterarRegistroNoCDS(Registro :TObject); override;

    { Carrega todos os registros pra aba de Consulta }
    procedure CarregarDados;                           override;

    procedure ExecutarDepoisAlterar;                   override;
    procedure ExecutarDepoisIncluir;                   override;

    { Inclui um registro no CDS }
    procedure IncluirRegistroNoCDS(Registro :TObject); override;

    { Limpa as informações da aba Dados }
    procedure LimparDados;                             override;

    { Mostra um registro detalhado na aba de Dados   }
    procedure MostrarDados;                            override;

  private
    { Persiste os dados no banco de dados }
    function GravarDados   :TObject;                   override;

    { Verifica os dados antes de persistir }
    function VerificaDados :Boolean;                   override;
  end;

var
  frmCadastroPlanoContasContabeis: TfrmCadastroPlanoContasContabeis;

implementation

uses PlanoContasContabeis, Repositorio, FabricaRepositorio;

{$R *.dfm}

{ TfrmCadastroPadrao1 }

procedure TfrmCadastroPlanoContasContabeis.AlterarRegistroNoCDS(Registro: TObject);
var
  PlanoContasContabeis :TPlanoContasContabeis;
begin
  inherited;

  PlanoContasContabeis := (Registro as TPlanoContasContabeis);

  self.cds.Edit;
  self.cdsCODIGO.AsInteger  := PlanoContasContabeis.codigo;
  self.cdsCOD_CTA.AsString  := PlanoContasContabeis.cod_cta;
  self.cdsNOME_CTA.AsString := PlanoContasContabeis.nome_cta;
  self.cds.Post;
end;

procedure TfrmCadastroPlanoContasContabeis.CarregarDados;
var
  Contas       :TObjectList;
  Repositorio  :TRepositorio;
  nX           :Integer;
begin
  inherited;

  Repositorio := nil;
  Contas    := nil;

  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TPlanoContasContabeis.ClassName);
    Contas  := Repositorio.GetAll;

    if Assigned(Contas) and (Contas.Count > 0) then begin

       for nX := 0 to (Contas.Count-1) do
         self.IncluirRegistroNoCDS(Contas.Items[nX]);

    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Contas);
  end;
end;

procedure TfrmCadastroPlanoContasContabeis.ExecutarDepoisAlterar;
begin
  inherited;
  dtpAlteracao.SetFocus;
end;

procedure TfrmCadastroPlanoContasContabeis.ExecutarDepoisIncluir;
begin
  inherited;
  dtpAlteracao.SetFocus;
end;

function TfrmCadastroPlanoContasContabeis.GravarDados: TObject;
var
  Conta       :TPlanoContasContabeis;
  Repositorio :TRepositorio;
begin
   Conta        := nil;
   Repositorio  := nil;

   try
     Repositorio  := TFabricaRepositorio.GetRepositorio(TPlanoContasContabeis.ClassName);
     Conta        := TPlanoContasContabeis(Repositorio.Get(self.edtCodigo.AsInteger));

     if not Assigned(Conta) then
      Conta := TPlanoContasContabeis.Create;

     Conta.dt_alt       := dtpAlteracao.Date;
     Conta.cod_nat_cc   := cbxNaturezaConta.Items[cbxNaturezaConta.ItemIndex];
     Conta.ind_cta      := cbxTipoConta.Items[cbxTipoConta.ItemIndex];
     Conta.nivel        := edtNivelConta.AsInteger;
     Conta.cod_cta      := edtCodigoConta.Text;
     Conta.nome_cta     := edtNomeConta.Text;

     Repositorio.Salvar(Conta);

     result := Conta;

   finally
     FreeAndNil(Repositorio);
   end;
end;

procedure TfrmCadastroPlanoContasContabeis.IncluirRegistroNoCDS(Registro: TObject);
var
  Conta :TPlanoContasContabeis;
begin
  inherited;

  Conta := (Registro as TPlanoContasContabeis);

  self.cds.Append;
  self.cdsCODIGO.AsInteger  := Conta.codigo;
  self.cdsCOD_CTA.AsString  := Conta.cod_cta;
  self.cdsNOME_CTA.AsString := Conta.nome_cta;
  self.cds.Post;
end;

procedure TfrmCadastroPlanoContasContabeis.LimparDados;
begin
  edtCodigo.Clear;
  dtpAlteracao.Date          := Date;
  cbxNaturezaConta.ItemIndex := 0;
  cbxTipoConta.ItemIndex     := 0;
  edtNivelConta.Clear;
  edtCodigoConta.Clear;
  edtNomeConta.Clear;
end;

procedure TfrmCadastroPlanoContasContabeis.MostrarDados;
var
  Conta        :TPlanoContasContabeis;
  Repositorio  :TRepositorio;
begin
  inherited;

  Conta       := nil;
  Repositorio := nil;

  try
    Repositorio  := TFabricaRepositorio.GetRepositorio(TPlanoContasContabeis.ClassName);
    Conta        := TPlanoContasContabeis(Repositorio.Get(self.cdsCODIGO.AsInteger));

    if not Assigned(Conta) then exit;

    self.edtCodigo.AsInteger          := Conta.codigo;
    self.dtpAlteracao.Date            := Conta.dt_alt;
    self.cbxNaturezaConta.ItemIndex   := cbxNaturezaConta.Items.IndexOf(Conta.cod_nat_cc);
    self.cbxTipoConta.ItemIndex       := cbxTipoConta.Items.IndexOf(Conta.ind_cta);
    self.edtNivelConta.AsInteger      := Conta.nivel;
    self.edtCodigoConta.Text          := Conta.cod_cta;
    self.edtNomeConta.Text            := Conta.nome_cta;

  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Conta);
  end;
end;

function TfrmCadastroPlanoContasContabeis.VerificaDados: Boolean;
begin
  result :=  verificar( cbxNaturezaConta.ItemIndex <= 0, 'Favor informar a natureza da conta', cbxNaturezaConta ) or
             verificar( cbxTipoConta.ItemIndex <= 0    , 'Favor informar o tipo da conta', cbxTipoConta ) or
             verificar( edtNivelConta.AsInteger <= 0   , 'Favor informar o nível da conta', edtNivelConta ) or
             verificar( trim(edtCodigoConta.Text) = '' , 'Favor informar o código da conta', edtCodigoConta ) or
             verificar( trim(edtNomeConta.Text) = ''   , 'Favor informar o nome da conta', edtNomeConta );
end;

end.
