unit uCadastroTamanho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Provider, DB, DBClient, StdCtrls, Buttons, Grids,
  DBGrids, DBGridCBN, ComCtrls, ExtCtrls, Tamanho, Repositorio;

type
  TfrmCadastroTamanho = class(TfrmPadrao)
    panBotoes: TPanel;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    edtDescricao: TEdit;
    gridTabPreco: TDBGridCBN;
    edtCodigo: TEdit;
    ds: TDataSource;
    cds: TClientDataSet;
    cdsCODIGO: TIntegerField;
    cdsDESCRICAO: TStringField;
    dsp: TDataSetProvider;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtDescricaoEnter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Tamanho     :TTamanho;
    rep     :TRepositorio;

    procedure habilita(SN:Boolean);
    procedure salvar;

  public
    { Public declarations }
  end;

var
  frmCadastroTamanho: TfrmCadastroTamanho;

implementation

uses FabricaRepositorio;

{$R *.dfm}

procedure TfrmCadastroTamanho.FormShow(Sender: TObject);
begin
  inherited;
  cds.Close;
  dsp.DataSet := FDM.GetConsulta('select * from Tamanhos');
  cds.Open;

  gridTabPreco.SetFocus;
end;

procedure TfrmCadastroTamanho.cdsAfterScroll(DataSet: TDataSet);
begin

  if (self.Tag = 2) and (cdsCODIGO.AsString <> edtCodigo.Text) then
    if confirma('Cancelar alteração do Tamanho '+edtCodigo.Text+' - '+ edtDescricao.Text+'?') then
      btnCancelar.Click
    else begin
      cds.Locate('CODIGO', edtCodigo.Text, []);
      edtDescricao.SetFocus;
    end;

  edtCodigo.Text    := cdsCODIGO.AsString;
  edtDescricao.Text := cdsDESCRICAO.AsString;
end;

procedure TfrmCadastroTamanho.btnIncluirClick(Sender: TObject);
begin
  inherited;
  edtDescricao.text := '';
  self.Tag := 1;
  edtDescricao.Enabled := true;
  edtDescricao.SetFocus;
end;

procedure TfrmCadastroTamanho.btnAlterarClick(Sender: TObject);
begin
  self.Tag := 2;
  edtDescricao.Enabled := true;  
  edtDescricao.SetFocus;
end;

procedure TfrmCadastroTamanho.edtDescricaoEnter(Sender: TObject);
begin
  if self.Tag in [1,2] then begin
    habilita(true);
  end;
end;

procedure TfrmCadastroTamanho.btnCancelarClick(Sender: TObject);
begin
  inherited;
  habilita(false);
  gridTabPreco.SetFocus;
  self.Tag             := 0;
  edtDescricao.Enabled := false;
  edtCodigo.Text       := cdsCODIGO.AsString;
  edtDescricao.Text    := cdsDESCRICAO.AsString;

  FreeAndNil(rep);
  FreeAndNil(Tamanho);
end;

procedure TfrmCadastroTamanho.btnSalvarClick(Sender: TObject);
begin
  if trim(edtDescricao.Text) = '' then begin
    self.avisar('É necessário informar uma descrição para o tamanho!');
    edtDescricao.SetFocus;
    exit;
  end
  else
    salvar;
end;

procedure TfrmCadastroTamanho.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if      (key = VK_F3) and (panBotoes.Enabled) then  btnIncluir.Click
  else if (key = VK_F4) and (panBotoes.Enabled) then  btnAlterar.Click;
end;

procedure TfrmCadastroTamanho.habilita(SN: Boolean);
begin
  if SN then begin
    btnIncluir.Enabled    := false;
    btnAlterar.Enabled    := false;
    btnCancelar.Enabled   := true;
    btnSalvar.Enabled     := true;
  end
  else begin
    btnIncluir.Enabled    := true;
    btnAlterar.Enabled    := true;
    btnCancelar.Enabled   := false;
    btnSalvar.Enabled     := false;
  end;
end;

procedure TfrmCadastroTamanho.salvar;
begin
  if Rep = nil then begin
    Rep     := TFabricaRepositorio.GetRepositorio(TTamanho.ClassName);
    Tamanho := TTamanho.Create;
  end;

  if self.Tag = 2 then
    Tamanho.Codigo := cdsCODIGO.AsInteger;

  Tamanho.Descricao := trim(edtDescricao.Text);

  rep.Salvar(Tamanho);

  cds.Close;
  cds.Open;

  btnCancelar.Click;

  avisar('Operação realizada com sucesso!');
end;

end.
