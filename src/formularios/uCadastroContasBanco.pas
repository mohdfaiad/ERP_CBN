unit uCadastroContasBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, RxToolEdit, RxCurrEdit, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  DBGridCBN, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, contnrs;

type
  TfrmCadastroContasBanco = class(TfrmCadastroPadrao)
    edtCodigo: TCurrencyEdit;
    edtBanco: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtTitular: TEdit;
    Label3: TLabel;
    edtNumAgencia: TEdit;
    edtNumConta: TEdit;
    Label4: TLabel;
    cdsBANCO: TStringField;
    cdsTITULAR: TStringField;
    cdsCODIGO: TIntegerField;
  private
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
  public
    { Public declarations }
  end;

var
  frmCadastroContasBanco: TfrmCadastroContasBanco;

implementation

uses ContaBanco, Repositorio, FabricaRepositorio;

{$R *.dfm}

{ TfrmCadastroPadrao1 }

procedure TfrmCadastroContasBanco.AlterarRegistroNoCDS(Registro: TObject);
var
  Conta :TContaBanco;
begin
  inherited;

  Conta := (Registro as TContaBanco);

  self.cds.Edit;
  self.cdsCODIGO.AsInteger   := Conta.codigo;
  self.cdsBANCO.AsString     := Conta.banco;
  self.cdsTITULAR.AsString   := Conta.titular;
  self.cds.Post;
end;

procedure TfrmCadastroContasBanco.CarregarDados;
var
  Contas      :TObjectList;
  Repositorio :TRepositorio;
  nX          :Integer;
begin
  inherited;

  Repositorio := nil;
  Contas    := nil;

  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TContaBanco.ClassName);
    Contas      := Repositorio.GetAll;

    if Assigned(Contas) and (Contas.Count > 0) then begin

       for nX := 0 to (Contas.Count-1) do
         self.IncluirRegistroNoCDS(Contas.Items[nX]);

    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Contas);
  end;
end;

procedure TfrmCadastroContasBanco.ExecutarDepoisAlterar;
begin
  inherited;
  edtBanco.SetFocus;
end;

procedure TfrmCadastroContasBanco.ExecutarDepoisIncluir;
begin
  inherited;
  edtBanco.SetFocus;
end;

function TfrmCadastroContasBanco.GravarDados: TObject;
var
  Conta     :TContaBanco;

  RepositorioConta  :TRepositorio;
begin
   Conta             := nil;
   RepositorioConta  := nil;

   try
     RepositorioConta  := TFabricaRepositorio.GetRepositorio(TContaBanco.ClassName);
     Conta             := TContaBanco(RepositorioConta.Get(self.edtCodigo.AsInteger));

     if not Assigned(Conta) then
      Conta := TContaBanco.Create;

     Conta.banco           := self.edtBanco.Text;
     Conta.titular         := self.edtTitular.Text;
     Conta.agencia         := self.edtNumAgencia.Text;
     Conta.numero_conta    := self.edtNumConta.Text;

     RepositorioConta.Salvar(Conta);

     result := Conta;

   finally
     FreeAndNil(RepositorioConta);
   end;
end;

procedure TfrmCadastroContasBanco.IncluirRegistroNoCDS(Registro: TObject);
var
  Conta :TContaBanco;
begin
  inherited;

  Conta := (Registro as TContaBanco);

  self.cds.Append;
  self.cdsCODIGO.AsInteger   := Conta.codigo;
  self.cdsBANCO.AsString     := Conta.banco;
  self.cdsTITULAR.AsString   := Conta.titular;
  self.cds.Post;
end;

procedure TfrmCadastroContasBanco.LimparDados;
begin
  edtCodigo.Clear;
  edtBanco.Clear;
  edtTitular.Clear;
  edtNumAgencia.Clear;
  edtNumConta.Clear;
end;

procedure TfrmCadastroContasBanco.MostrarDados;
var
  Conta                :TContaBanco;
  RepositorioConta     :TRepositorio;
begin
  inherited;

  Conta                              := nil;
  RepositorioConta                   := nil;

  try
    RepositorioConta  := TFabricaRepositorio.GetRepositorio(TContaBanco.ClassName);

    Conta             := TContaBanco(RepositorioConta.Get(self.cdsCODIGO.AsInteger));

    if not Assigned(Conta) then exit;

    self.edtCodigo.AsInteger    := Conta.codigo;
    self.edtBanco.Text          := Conta.banco;
    self.edtTitular.Text        := Conta.titular;
    self.edtNumAgencia.Text     := Conta.agencia;
    self.edtNumConta.Text       := Conta.numero_conta;

  finally
    FreeAndNil(RepositorioConta);
    FreeAndNil(Conta);
  end;
end;

function TfrmCadastroContasBanco.VerificaDados: Boolean;
begin
  result := false;

  if edtBanco.Text = '' then
  begin
    avisar('Favor informar a agência bancária');
    edtBanco.SetFocus;
  end
  else if edtTitular.Text = '' then
  begin
    avisar('Favor informar o titular da conta');
    edtTitular.SetFocus;
  end
  else if edtNumAgencia.Text = '' then
  begin
    avisar('Favor informar o nº da agência da conta');
    edtNumAgencia.SetFocus;
  end
  else if edtNumConta.Text = '' then
  begin
    avisar('Favor informar o Nº da conta');
    edtNumConta.SetFocus;
  end
  else
    result := true;
end;

end.
