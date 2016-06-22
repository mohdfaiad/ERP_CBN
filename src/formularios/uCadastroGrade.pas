unit uCadastroGrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Grids, DBGrids, DBGridCBN, ComCtrls, Buttons,
  ExtCtrls, Provider, DB, DBClient, Grade, Grade_Tamanhos,Repositorio, RepositorioGrade_Tamanhos;

type
  TfrmCadastroGrade = class(TfrmPadrao)
    pagGrades: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    gridGrades: TDBGridCBN;
    Label1: TLabel;
    edtDescricao: TEdit;
    edtCodigo: TEdit;
    groTamanho: TGroupBox;
    ds: TDataSource;
    cds: TClientDataSet;
    cdsCODIGO: TIntegerField;
    cdsDESCRICAO: TStringField;
    dsp: TDataSetProvider;
    cdsTamanhos: TClientDataSet;
    DataSource1: TDataSource;
    panBotoes: TPanel;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    lblAsterisco: TLabel;
    lblCamposObrigatorios: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    CDStmp :TClientDataSet;
    Grade :TGrade;
    Grade_tamanhos :TGrade_Tamanhos;
    rep :TRepositorio;

    procedure buscaTamanhosCadastrados;
    procedure mostraDados;
    procedure limpaCampos;
    procedure Salvar;
    procedure habilita(SN:Boolean);
    procedure deletaRelacoes;
  public
    { Public declarations }
  end;

var
  frmCadastroGrade: TfrmCadastroGrade;

implementation

uses
  FabricaRepositorio, uCadastroTamanho;
  
{$R *.dfm}

procedure TfrmCadastroGrade.buscaTamanhosCadastrados;
var i, col, lin :integer;
  cB: TCheckBox;
begin
  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select * from tamanhos';
  fdm.qryGenerica.Open;

  if fdm.qryGenerica.IsEmpty then
    exit;

  col := 0;
  lin := 1;

  for i:=1 to fdm.qryGenerica.RecordCount do begin
    inc(col);

    if assigned(groTamanho.FindComponent('cb'+ trim(fdm.qryGenerica.fieldByName('codigo').asString))) then begin
      fdm.qryGenerica.next;
      continue;
    end;

    cB := TCheckBox.Create(groTamanho);
    cB.Parent := groTamanho;
    cB.Caption:= trim(fdm.qryGenerica.fieldByName('descricao').asString);
    cB.Name := 'cb'+ trim(fdm.qryGenerica.fieldByName('codigo').asString);

    if col = 1 then begin
       cB.Top := lin * 25;
       cB.Left := 16;
    end
    else if col = 2 then begin
      cB.Top := lin * 25;
      cB.Left := 136;
    end
    else if col = 3 then begin
      cB.Top := lin * 25;
      cB.Left := 256;

      inc(lin);
      col := 0;
    end;

    fdm.qryGenerica.next;
  end;

end;

procedure TfrmCadastroGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_F1 then
    pagGrades.ActivePageIndex := 0
  else if Key = vk_F2 then
    pagGrades.ActivePageIndex := 1
  else if (btnIncluir.Enabled)and(key = vk_F3) then
    btnIncluir.Click
  else if (btnAlterar.Enabled)and(key = vk_F4) then
    btnAlterar.Click;
end;

procedure TfrmCadastroGrade.FormShow(Sender: TObject);
begin
  inherited;
  buscaTamanhosCadastrados;
  cds.Close;
  dsp.DataSet := FDM.GetConsulta('select * from Grades');
  cds.Open;

  gridGrades.SetFocus;
end;

procedure TfrmCadastroGrade.btnIncluirClick(Sender: TObject);
begin
  inherited;
  if not gridGrades.Focused then
    gridGrades.SetFocus;
    
  self.Tag := 1;
  pagGrades.ActivePageIndex := 0;
  pagGrades.ActivePageIndex := 1;
end;

procedure TfrmCadastroGrade.btnAlterarClick(Sender: TObject);
begin
  inherited;

  self.Tag := 2;
  pagGrades.ActivePageIndex := 0;
  gridGrades.SetFocus;
  pagGrades.ActivePageIndex := 1;
end;

procedure TfrmCadastroGrade.TabSheet2Enter(Sender: TObject);
begin
  inherited;
  if self.Tag in [1,2] then begin
    habilita(true);
    edtDescricao.setFocus;
  end
  else
    habilita(false);

  limpaCampos;
    
  if self.Tag <> 1 then
    mostraDados;

end;

procedure TfrmCadastroGrade.mostraDados;
begin
  edtDescricao.Text := cdsDESCRICAO.AsString;
  edtCodigo.Text    := cdsCODIGO.AsString;

  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select * from grade_tamanhos where codgrade = :codigo';
  fdm.qryGenerica.ParamByName('codigo').AsInteger := cdsCODIGO.AsInteger;
  fdm.qryGenerica.Open;

  if not Fdm.qryGenerica.IsEmpty then
  while not Fdm.qryGenerica.eof do begin
    if (groTamanho.FindComponent('cb' + Fdm.qryGenerica.fieldByName('codtamanho').AsString) <> nil) then begin
      TCheckBox(groTamanho.FindComponent('cb' + Fdm.qryGenerica.fieldByName('codtamanho').AsString)).checked := true;
      TCheckBox(groTamanho.FindComponent('cb' + Fdm.qryGenerica.fieldByName('codtamanho').AsString)).Font.Style := [fsBold];
    end;

    Fdm.qryGenerica.next;
  end;

end;

procedure TfrmCadastroGrade.limpaCampos;
var i:integer;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  for i := 0 to groTamanho.ComponentCount - 1 do begin
    TcheckBox(groTamanho.Components[i]).Checked    := false;
    TcheckBox(groTamanho.Components[i]).Font.Style := [];
  end;
end;

procedure TfrmCadastroGrade.btnCancelarClick(Sender: TObject);
begin
  inherited;
  pagGrades.ActivePageIndex := 0;
  self.TAG := 0;
  limpaCampos;
  habilita(false);
  gridGrades.SetFocus;
  
  FreeAndNil(Grade);
  FreeAndNil(Rep);
  FreeAndNil(Grade_Tamanhos);
end;

procedure TfrmCadastroGrade.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if trim(edtDescricao.Text) = '' then begin
      self.avisar('É necessário informar uma descrição para a Grade!');
      edtDescricao.SetFocus;
      exit;
    end;

  salvar;
end;

procedure TfrmCadastroGrade.Salvar;
var i:integer;
begin
  {  Inicio  Salva  Grade  }
   Rep := TFabricaRepositorio.GetRepositorio(TGrade.ClassName);

   if (Grade = nil )  then  Grade := TGrade.Create;

   if (self.Tag = 2)  then  Grade.Codigo := cdsCODIGO.AsInteger;

   Grade.Descricao := edtDescricao.Text;

   rep.Salvar(Grade);

  {  Inicio  salva  tamanhos contidos nas Grades  }
   rep := TFabricaRepositorio.GetRepositorio(TGrade_Tamanhos.ClassName);

   deletaRelacoes;

   for i := 0 to groTamanho.ComponentCount - 1 do begin
    
      if not TcheckBox(groTamanho.Components[i]).Checked  then  continue;

      if Grade_tamanhos = nil  then  Grade_tamanhos := TGrade_tamanhos.Create;

      Grade_tamanhos.Codigo   := 0;

      if (self.Tag = 2) then  Grade_tamanhos.Codgrade := cdsCODIGO.AsInteger
      else
      if (self.Tag = 1) then begin
        fdm.qryGenerica.Close;
        fdm.qryGenerica.SQL.Text := 'select max(codigo) from Grades';
        fdm.qryGenerica.Open;
        Grade_tamanhos.Codgrade := fdm.qryGenerica.fieldByName('max').AsInteger;
      end;

      Grade_tamanhos.Codtamanho := strToInt(trim(copy(TcheckBox(groTamanho.Components[i]).Name,3,4)));

      rep.Salvar(Grade_tamanhos);
   end;

   btnCancelar.Click;
   avisar('Operação realizada com sucesso!');
   cds.Close;
   cds.Open;
end;

procedure TfrmCadastroGrade.TabSheet1Exit(Sender: TObject);
begin
  inherited;
  TabSheet2Enter(nil);
end;

procedure TfrmCadastroGrade.FormCreate(Sender: TObject);
begin
  inherited;
  pagGrades.ActivePageIndex := 0;
end;

procedure TfrmCadastroGrade.habilita(SN: Boolean);
begin
  if SN then begin
    btnIncluir.Enabled  := false;
    btnAlterar.Enabled  := false;
    btnSalvar.Enabled   := true;
    btnCancelar.Enabled := true;
    pagGrades.Pages[1].Enabled := true;
  end
  else begin
    btnIncluir.Enabled  := true;
    btnAlterar.Enabled  := true;
    btnSalvar.Enabled   := false;
    btnCancelar.Enabled := false;
    pagGrades.Pages[1].Enabled := false;
  end;
end;

procedure TfrmCadastroGrade.deletaRelacoes;
begin
  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'delete from Grade_tamanhos where codgrade = :codigo';
  fdm.qryGenerica.ParamByName('codigo').AsInteger := Grade.Codigo;
  fdm.qryGenerica.ExecSQL;
end;

end.
