unit uCadastroGrupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, Data.DB, Vcl.StdCtrls, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, DBGridCBN,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, contNrs;

type
  TfrmCadastroGrupo = class(TfrmCadastroPadrao)
    cdsCODIGO: TIntegerField;
    cdsGRUPO: TStringField;
    edtCodigo: TEdit;
    Label1: TLabel;
    edtDescricao: TEdit;
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
  frmCadastroGrupo: TfrmCadastroGrupo;

implementation

uses Grupo, Repositorio, FabricaRepositorio;

{$R *.dfm}

{ TfrmCadastroPadrao1 }

procedure TfrmCadastroGrupo.AlterarRegistroNoCDS(Registro: TObject);
var
  Grupo :TGrupo;
begin
  inherited;

  Grupo := (Registro as TGrupo);

  self.cds.Edit;
  self.cdsCODIGO.AsInteger := Grupo.codigo;
  self.cdsGRUPO.AsString   := Grupo.descricao;
  self.cds.Post;
end;

procedure TfrmCadastroGrupo.CarregarDados;
var
  Grupos       :TObjectList;
  Repositorio  :TRepositorio;
  nX           :Integer;
begin
  inherited;

  Repositorio := nil;
  Grupos    := nil;

  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TGrupo.ClassName);
    Grupos  := Repositorio.GetAll;

    if Assigned(Grupos) and (Grupos.Count > 0) then begin

       for nX := 0 to (Grupos.Count-1) do
         self.IncluirRegistroNoCDS(Grupos.Items[nX]);

    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Grupos);
  end;
end;

procedure TfrmCadastroGrupo.ExecutarDepoisAlterar;
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadastroGrupo.ExecutarDepoisIncluir;
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TfrmCadastroGrupo.GravarDados: TObject;
var
  Grupo        :TGrupo;
  Repositorio  :TRepositorio;
begin
   Grupo        := nil;
   Repositorio  := nil;

   try
     Repositorio   := TFabricaRepositorio.GetRepositorio(TGrupo.ClassName);
     Grupo         := TGrupo(Repositorio.Get( StrToIntDef(self.edtCodigo.Text,0)));

     if not Assigned(Grupo) then
      Grupo := TGrupo.Create;

     Grupo.descricao   := TRIM( self.edtDescricao.Text );

     Repositorio.Salvar(Grupo);

     result := Grupo;

   finally
     FreeAndNil(Repositorio);
   end;
end;

procedure TfrmCadastroGrupo.IncluirRegistroNoCDS(Registro: TObject);
var
  Grupo :TGrupo;
begin
  inherited;

  Grupo := (Registro as TGrupo);

  self.cds.Append;
  self.cdsCODIGO.AsInteger := Grupo.codigo;
  self.cdsGRUPO.AsString   := Grupo.descricao;
  self.cds.Post;
end;

procedure TfrmCadastroGrupo.LimparDados;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
end;

procedure TfrmCadastroGrupo.MostrarDados;
var
  Grupo                   :TGrupo;
  RepositorioContador     :TRepositorio;
begin
  inherited;
  Grupo                              := nil;
  RepositorioContador                   := nil;

  try
    RepositorioContador  := TFabricaRepositorio.GetRepositorio(TGrupo.ClassName);
    Grupo                := TGrupo(RepositorioContador.Get(self.cdsCODIGO.AsInteger));

    if not Assigned(Grupo) then exit;

    self.edtCodigo.Text      := intToStr(Grupo.codigo);
    self.edtDescricao.Text   := Grupo.descricao;

  finally

    FreeAndNil(RepositorioContador);
    FreeAndNil(Grupo);
  end;
end;

function TfrmCadastroGrupo.VerificaDados: Boolean;
begin
  result := false;

  if trim(edtDescricao.Text) = '' then begin
    avisar('A descrição não foi informada');
    edtDescricao.SetFocus;
  end
  else
    result := true;
end;

end.
