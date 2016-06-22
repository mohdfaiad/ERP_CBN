unit uCadastroContador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, DB, DBClient, StdCtrls, Grids, DBGrids,
  DBGridCBN, ComCtrls, Buttons, ExtCtrls, Contnrs, frameBuscaCidade, Mask,
  RxToolEdit, RxCurrEdit;

type
  TfrmCadastroContador = class(TfrmCadastroPadrao)
    cdsCODIGO: TIntegerField;
    cdsNOME: TStringField;
    edtCodigo: TCurrencyEdit;
    gpbIdentificacao: TGroupBox;
    lblRazao: TLabel;
    edtNome: TEdit;
    lblCPF_CNPJ: TLabel;
    edtCpf: TMaskEdit;
    edtCRC: TMaskEdit;
    lblRG_IE: TLabel;
    edtcnpj: TMaskEdit;
    Label1: TLabel;
    gpbEndereco: TGroupBox;
    edtRua: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtNumero: TMaskEdit;
    Label4: TLabel;
    edtBairro: TEdit;
    BuscaCidade1: TBuscaCidade;
    Label5: TLabel;
    edtCep: TMaskEdit;
    gpbContato: TGroupBox;
    edtEmail: TEdit;
    edtFone: TMaskEdit;
    lblFone1: TLabel;
    lblEmail: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    CheckBox1: TCheckBox;
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
  frmCadastroContador: TfrmCadastroContador;

implementation

uses Contador, Repositorio, FabricaRepositorio;

{$R *.dfm}

{ TfrmCadastroContador }

procedure TfrmCadastroContador.AlterarRegistroNoCDS(Registro: TObject);
var
  Contador :TContador;
begin
  inherited;

  Contador := (Registro as TContador);

  self.cds.Edit;
  self.cdsCODIGO.AsInteger := Contador.codigo;
  self.cdsNome.AsString    := Contador.nome;
  self.cds.Post;
end;

procedure TfrmCadastroContador.CarregarDados;
var
  Contadores   :TObjectList;
  Repositorio  :TRepositorio;
  nX           :Integer;
begin
  inherited;

  Repositorio := nil;
  Contadores    := nil;

  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TContador.ClassName);
    Contadores  := Repositorio.GetAll;

    if Assigned(Contadores) and (Contadores.Count > 0) then begin

       for nX := 0 to (Contadores.Count-1) do
         self.IncluirRegistroNoCDS(Contadores.Items[nX]);

    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Contadores);
  end;
end;

procedure TfrmCadastroContador.ExecutarDepoisAlterar;
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadastroContador.ExecutarDepoisIncluir;
begin
  inherited;
  edtNome.SetFocus;
end;

function TfrmCadastroContador.GravarDados: TObject;
var
  Contador     :TContador;
  RepositorioContador  :TRepositorio;
begin
   Contador             := nil;
   RepositorioContador  := nil;

   try
     RepositorioContador  := TFabricaRepositorio.GetRepositorio(TContador.ClassName);
     Contador             := TContador(RepositorioContador.Get(self.edtCodigo.AsInteger));

     if not Assigned(Contador) then
      Contador := TContador.Create;

     Contador.nome           := TRIM( self.edtNome.Text );
     Contador.cpf            := TRIM( self.edtCpf.Text );
     Contador.cnpj           := TRIM( self.edtcnpj.Text );
     Contador.crc            := TRIM( self.edtCRC.Text );
     Contador.cep            := TRIM( self.edtCep.Text );
     Contador.rua            := TRIM( self.edtRua.Text );
     Contador.numero         := TRIM( self.edtNumero.Text );
     Contador.bairro         := TRIM( self.edtBairro.Text );
     Contador.codigo_cidade  := self.BuscaCidade1.edtCodCid.AsInteger;
     Contador.fone           := TRIM(edtFone.Text);
     Contador.email          := TRIM(edtEmail.Text);

     RepositorioContador.Salvar(Contador);

     result := Contador;

   finally
     FreeAndNil(RepositorioContador);
   end;
end;

procedure TfrmCadastroContador.IncluirRegistroNoCDS(Registro: TObject);
var
  Contador :TContador;
begin
  inherited;

  Contador := (Registro as TContador);

  self.cds.Append;
  self.cdsCODIGO.AsInteger := Contador.codigo;
  self.cdsNOME.AsString    := Contador.nome;
  self.cds.Post;
end;

procedure TfrmCadastroContador.LimparDados;
begin
  inherited;

  edtNome.Clear;
  edtCpf.Clear;
  edtcnpj.Clear;
  edtCRC.Clear;
  edtRua.Clear;
  edtNumero.Clear;
  edtBairro.Clear;
  BuscaCidade1.limpa;
  edtCep.Clear;
  edtFone.Clear;
  edtEmail.Clear;

end;

procedure TfrmCadastroContador.MostrarDados;
var
  Contador                              :TContador;
  RepositorioContador                   :TRepositorio;
begin
  inherited;

  Contador                              := nil;
  RepositorioContador                   := nil;

  try
    RepositorioContador  := TFabricaRepositorio.GetRepositorio(TContador.ClassName);
    Contador             := TContador(RepositorioContador.Get(self.cdsCODIGO.AsInteger));

    if not Assigned(Contador) then exit;

    self.edtCodigo.AsInteger            := Contador.codigo;
    self.edtNome.Text                   := Contador.nome;
    self.edtCpf.Text                    := Contador.cpf;
    self.edtcnpj.Text                   := Contador.cnpj;
    self.edtCRC.Text                    := Contador.crc;
    self.edtRua.Text                    := Contador.rua;
    self.edtNumero.Text                 := Contador.numero;
    self.edtBairro.Text                 := Contador.bairro;
    self.BuscaCidade1.CodigoMunicipio   := Contador.codigo_cidade;
    self.edtCep.Text                    := Contador.cep;
    self.edtFone.Text                   := Contador.fone;
    self.edtEmail.Text                  := Contador.email;

  finally

    FreeAndNil(RepositorioContador);
    FreeAndNil(Contador);
  end;
end;

function TfrmCadastroContador.VerificaDados: Boolean;
begin
    result := false;

  if trim(edtNome.Text) = '' then begin
    avisar('Favor informar o Nome / Razão social do contador');
    edtNome.SetFocus;
  end
  else if ( trim(edtCpf.Text) = '' ) and ( trim(edtcnpj.Text) = '' ) then begin
    avisar('Favor informar o CPF ou CNPJ do contador');
    edtCpf.SetFocus;
  end
  else if trim(edtCRC.Text) = '' then begin
    avisar('Favor informar o CRC do contador');
    edtCRC.SetFocus;
  end
  else if TRIM(BuscaCidade1.edtCidade.Text) = '' then begin
    avisar('Favor informar a cidade');
    BuscaCidade1.edtCodCid.SetFocus;
  end
  else
    result := true;
end;

end.
