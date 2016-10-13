unit uCadastroNCM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, DBGridCBN,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, RxToolEdit, RxCurrEdit, System.Contnrs;

type
  TfrmCadastroNCM = class(TfrmCadastroPadrao)
    cdsCODIGO: TIntegerField;
    cdsNCM: TIntegerField;
    cdsDESCRICAO: TStringField;
    edtDescricao: TEdit;
    Label1: TLabel;
    edtNCM: TCurrencyEdit;
    Label2: TLabel;
    cmbUnidadeMedida: TComboBox;
    Label27: TLabel;
    edtCodigo: TEdit;
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
  frmCadastroNCM: TfrmCadastroNCM;

implementation

uses classificacaoFiscal, repositorio, fabricaRepositorio;

{$R *.dfm}

{ TfrmCadastroNCM }

procedure TfrmCadastroNCM.AlterarRegistroNoCDS(Registro: TObject);
var
  NCM :TClassificacaoFiscal;
begin
  inherited;

  NCM := (Registro as TClassificacaoFiscal);

  self.cds.Edit;
  self.cdsCODIGO.AsInteger   := NCM.codigo;
  self.cdsNCM.AsInteger      := NCM.ncm;
  self.cdsDESCRICAO.AsString := NCM.descricao;
  self.cds.Post;
end;

procedure TfrmCadastroNCM.CarregarDados;
var
  NCMs         :TObjectList;
  Repositorio  :TRepositorio;
  nX           :Integer;
begin
  inherited;

  Repositorio := nil;
  NCMs     := nil;

  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TClassificacaoFiscal.ClassName);
    NCMs     := Repositorio.GetAll;

    if Assigned(NCMs) and (NCMs.Count > 0) then begin

       for nX := 0 to (NCMs.Count-1) do
         self.IncluirRegistroNoCDS(NCMs.Items[nX]);

    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(NCMs);
  end;
end;

procedure TfrmCadastroNCM.ExecutarDepoisAlterar;
begin
  inherited;
  edtNCM.SetFocus;
end;

procedure TfrmCadastroNCM.ExecutarDepoisIncluir;
begin
  inherited;
  edtNCM.SetFocus;
end;

function TfrmCadastroNCM.GravarDados: TObject;
var
  NCM       :TClassificacaoFiscal;
  Repositorio  :TRepositorio;
begin
   NCM       := nil;
   Repositorio  := nil;

   try
     Repositorio    := TFabricaRepositorio.GetRepositorio(TClassificacaoFiscal.ClassName);
     NCM         := TClassificacaoFiscal(Repositorio.Get( StrToIntDef(self.edtCodigo.Text,0)));

     if not Assigned(NCM) then
      NCM := TClassificacaoFiscal.Create;

     NCM.descricao   := TRIM( self.edtDescricao.Text );
     NCM.NCM         := edtNCM.AsInteger;
     NCM.und_medida  := cmbUnidadeMedida.Items[cmbUnidadeMedida.ItemIndex];

     Repositorio.Salvar(NCM);

     result := NCM;

   finally
     FreeAndNil(Repositorio);
   end;
end;

procedure TfrmCadastroNCM.IncluirRegistroNoCDS(Registro: TObject);
var
  NCM :TClassificacaoFiscal;
begin
  inherited;

  NCM := (Registro as TClassificacaoFiscal);

  self.cds.Append;
  self.cdsCODIGO.AsInteger      := NCM.codigo;
  self.cdsDESCRICAO.AsString    := NCM.descricao;
  self.cdsNCM.AsInteger         := NCM.ncm;
  self.cds.Post;
end;

procedure TfrmCadastroNCM.LimparDados;
begin
  cmbUnidadeMedida.ItemIndex := 0;
  edtCodigo.Clear;
  edtNCM.Clear;
  edtDescricao.Clear;
end;

procedure TfrmCadastroNCM.MostrarDados;
var
  NCM       :TClassificacaoFiscal;
  Repositorio  :TRepositorio;
begin
  inherited;

  NCM         := nil;
  Repositorio    := nil;

  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TClassificacaoFiscal.ClassName);
    NCM      := TClassificacaoFiscal(Repositorio.Get(self.cdsCODIGO.AsInteger));

    if not Assigned(NCM) then exit;

    self.edtCodigo.Text    := intToStr(NCM.codigo);
    self.edtDescricao.Text := NCM.descricao;
    self.edtNCM.AsInteger  := NCM.ncm;
    self.cmbUnidadeMedida.ItemIndex   := cmbUnidadeMedida.Items.IndexOf(UPPERCASE(NCM.und_medida));

  finally
    FreeAndNil(Repositorio);
    FreeAndNil(NCM);
  end;
end;

function TfrmCadastroNCM.VerificaDados: Boolean;
begin
  result := false;

  if length(edtNCM.Text) < 7 then
  begin
    avisar('NCM inválido.');
    edtNCM.SetFocus;
  end
  else if cmbUnidadeMedida.ItemIndex <= 0 then
  begin
    avisar('Unidade de medida deve ser informada.');
    cmbUnidadeMedida.SetFocus;
  end
  else if TRIM(edtDescricao.Text) = '' then
  begin
    avisar('O descrição deve ser informada.');
    edtDescricao.SetFocus;
  end
  else
    result := true;
end;

end.
