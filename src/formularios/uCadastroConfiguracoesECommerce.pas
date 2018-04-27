unit uCadastroConfiguracoesECommerce;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, Data.DB, frameBuscaTabelaPreco, Vcl.StdCtrls, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  DBGridCBN, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, contnrs, frameBuscaPessoa, frameBuscaEmpresa, Vcl.Samples.Spin, frameBuscaFormaPagamento;

type
  TfrmCadastroConfiguracoesECommerce = class(TfrmCadastroPadrao)
    GroupBox1: TGroupBox;
    BuscaTabelaPreco: TBuscaTabelaPreco;
    cdsCODIGO: TIntegerField;
    cdsTOKEN: TStringField;
    edtCodigo: TEdit;
    BuscaEmpresa: TBuscaEmpresa;
    BuscaRepresentante: TBuscaPessoa;
    BuscaFormaPagamento: TBuscaFormaPagamento;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtToken: TEdit;
    edtUrlBase: TEdit;
    GroupBox3: TGroupBox;
    spnIntervalo: TSpinEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
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
  private
    function buscaProdutos :String;
  end;

var
  frmCadastroConfiguracoesECommerce: TfrmCadastroConfiguracoesECommerce;

implementation

uses ConfiguracoesECommerce, repositorio, fabricaRepositorio, TipoPessoa, REST.types, System.JSon, IdBaseComponent,
     IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdSSLOpenSSL, HTTPJSON;

{$R *.dfm}

{ TfrmCadastroConfiguracoesECommerce }

procedure TfrmCadastroConfiguracoesECommerce.AlterarRegistroNoCDS(Registro: TObject);
var
  Config :TConfiguracoesECommerce;
begin
  inherited;
  Config := (Registro as TConfiguracoesECommerce);

  self.cds.Edit;
  self.cdsCODIGO.AsInteger := Config.codigo;
  self.cdsTOKEN.AsString   := Config.token;
  self.cds.Post;
end;

procedure TfrmCadastroConfiguracoesECommerce.BitBtn1Click(Sender: TObject);
var
  resultado :String;
begin
 try
  resultado := buscaProdutos;
  if pos('count', resultado) > 0 then
    avisar('Comunicação realizada com sucesso!')
  else
    raise Exception.Create(resultado);
 Except
   on e: Exception do
     avisar('Falha na comunicação: '+e.Message);
 end;
end;

function TfrmCadastroConfiguracoesECommerce.buscaProdutos: String;
var
  vHTTPJSON :THTTPJSON;
begin
  try
    vHTTPJSON := THTTPJSON.CreateEcommerce(trim(edtToken.Text), trim(edtUrlBase.Text));
    result    := vHTTPJSON.Get('produtos/?page=1');
  finally
    FreeAndNil(vHTTPJSON);
  end;
end;

procedure TfrmCadastroConfiguracoesECommerce.CarregarDados;
var
  Configs     :TObjectList;
  Repositorio :TRepositorio;
  nX          :Integer;
begin
  inherited;

  Repositorio := nil;
  Configs    := nil;

  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TConfiguracoesECommerce.ClassName);
    Configs     := Repositorio.GetAll;

    if Assigned(Configs) and (Configs.Count > 0) then begin

       for nX := 0 to (Configs.Count-1) do
         self.IncluirRegistroNoCDS(Configs.Items[nX]);

    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Configs);
  end;
end;

procedure TfrmCadastroConfiguracoesECommerce.ExecutarDepoisAlterar;
begin
  inherited;
  edtToken.SetFocus;
end;

procedure TfrmCadastroConfiguracoesECommerce.ExecutarDepoisIncluir;
begin
  inherited;
  edtToken.SetFocus;
end;

procedure TfrmCadastroConfiguracoesECommerce.FormCreate(Sender: TObject);
begin
  BuscaRepresentante.TipoPessoa := tpRepresentante;
end;

function TfrmCadastroConfiguracoesECommerce.GravarDados: TObject;
var
  Config      :TConfiguracoesECommerce;
  Repositorio :TRepositorio;
begin
   Config      := nil;
   Repositorio := nil;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TConfiguracoesECommerce.ClassName);
     Config      := TConfiguracoesECommerce(Repositorio.Get(StrToIntDef(self.edtCodigo.Text, 0)));

     if not Assigned(Config) then
      Config := TConfiguracoesECommerce.Create;

     Config.token             := self.edtToken.Text;
     Config.url_base          := self.edtUrlBase.Text;
     Config.cod_tabela_preco  := BuscaTabelaPreco.edtCodigo.AsInteger;
     Config.codigo_empresa    := StrToIntDef(BuscaEmpresa.edtCodigo.Text,0);
     Config.codigo_representante  := BuscaRepresentante.edtCodigo.AsInteger;
     Config.codigo_forma_pagto  := BuscaFormaPagamento.edtCodigo.AsInteger;
     Config.intervalo_verificacao := spnIntervalo.Value;

     Repositorio.Salvar(Config);

     result := Config;

     //libera para recarregar ao chamar
     fdm.configuracoesECommerce.Free;
     fdm.configuracoesECommerce := nil;

   finally
     FreeAndNil(Repositorio);
   end;
end;

procedure TfrmCadastroConfiguracoesECommerce.IncluirRegistroNoCDS(Registro: TObject);
var
  Config :TConfiguracoesECommerce;
begin
  inherited;

  Config := (Registro as TConfiguracoesECommerce);

  self.cds.Append;
  self.cdsCODIGO.AsInteger := Config.codigo;
  self.cdsTOKEN.AsString   := Config.token;
  self.cds.Post;
end;

procedure TfrmCadastroConfiguracoesECommerce.LimparDados;
begin
  edtCodigo.Clear;
  edtToken.Clear;
  edtUrlBase.Clear;
  BuscaTabelaPreco.limpa;
  BuscaEmpresa.Clear;
  BuscaEmpresa.Clear;
  BuscaFormaPagamento.limpa;
  spnIntervalo.Clear;
end;

procedure TfrmCadastroConfiguracoesECommerce.MostrarDados;
var
  Config                :TConfiguracoesECommerce;
  Repositorio           :TRepositorio;
begin
  inherited;
  Config      := nil;
  Repositorio := nil;

  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TConfiguracoesECommerce.ClassName);
    Config      := TConfiguracoesECommerce(Repositorio.Get(self.cdsCODIGO.AsInteger));

    if not Assigned(Config) then exit;

    self.edtCodigo.Text  := IntToStr(Config.codigo);
    self.edtToken.Text   := Config.token;
    self.edtUrlBase.Text := Config.url_base;
    self.BuscaTabelaPreco.codTabela := intToStr(Config.cod_tabela_preco);
    self.BuscaEmpresa.codEmpresa := Config.codigo_empresa;
    self.BuscaRepresentante.cod_pessoa := IntToStr(Config.codigo_representante);
    self.BuscaFormaPagamento.codigoFormaPagamento := Config.codigo_forma_pagto;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Config);
  end;
end;

function TfrmCadastroConfiguracoesECommerce.VerificaDados: Boolean;
begin
  result := verificar(trim(edtToken.Text) = '', 'Favor informar o token de autenticação', edtToken) and
            verificar(trim(edtUrlBase.Text) = '', 'Favor informar a URL base da API', edtUrlBase) and
            verificar(trim(BuscaTabelaPreco.edtDescricao.Text) = '', 'Favor informar a tabela de preço padrão para importação', BuscaTabelaPreco.edtCodigo) and
            verificar(trim(BuscaEmpresa.edtRazao.Text) = '', 'Favor informar a empresa padrão para importação', BuscaEmpresa.edtCodigo) and
            verificar(trim(BuscaRepresentante.edtRazao.Text) = '', 'Favor informar o representante padrão para importação', BuscaRepresentante.edtCodigo) and
            verificar(trim(BuscaFormaPagamento.edtDescricao.Text) = '', 'Favor informar a forma de pagamento padrão para importação', BuscaFormaPagamento.edtCodigo);
end;

end.
