unit uCadastroTabelaPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Provider, DB, DBClient, StdCtrls, Buttons, Grids,
  DBGrids, DBGridCBN, ComCtrls, ExtCtrls, TabelaPreco, Repositorio;

type
  TfrmCadastroTabelaPreco = class(TfrmPadrao)
    panBotoes: TPanel;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    edtDescricao: TEdit;
    Label1: TLabel;
    gridTabPreco: TDBGridCBN;
    ds: TDataSource;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    cdsCODIGO: TIntegerField;
    cdsDESCRICAO: TStringField;
    edtCodigo: TEdit;
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
    TabelaPreco :TTabelaPreco;
    rep     :TRepositorio;

    procedure habilita(SN:Boolean);
    procedure salvar;

  public
    { Public declarations }
  end;

var
  frmCadastroTabelaPreco: TfrmCadastroTabelaPreco;

implementation

uses FabricaRepositorio;

{$R *.dfm}

procedure TfrmCadastroTabelaPreco.FormShow(Sender: TObject);
begin
  inherited;
  cds.Close;
  dsp.DataSet := FDM.GetConsulta('select * from tabelas_preco');
  cds.Open;

  gridTabPreco.SetFocus;
end;

procedure TfrmCadastroTabelaPreco.cdsAfterScroll(DataSet: TDataSet);
begin

  if (self.Tag = 2) and (cdsCODIGO.AsString <> edtCodigo.Text) then
    if confirma('Cancelar alteração da Tabela '+edtCodigo.Text+' - '+ edtDescricao.Text+'?') then
      btnCancelar.Click
    else begin
      cds.Locate('CODIGO', edtCodigo.Text, []);
      edtDescricao.SetFocus;
    end;

  edtCodigo.Text    := cdsCODIGO.AsString;
  edtDescricao.Text := cdsDESCRICAO.AsString;
end;

procedure TfrmCadastroTabelaPreco.btnIncluirClick(Sender: TObject);
begin
  inherited;
  edtDescricao.Clear;
  self.Tag := 1;
  edtDescricao.Enabled := true;  
  edtDescricao.SetFocus;
end;

procedure TfrmCadastroTabelaPreco.btnAlterarClick(Sender: TObject);
begin
  inherited;
  self.Tag := 2;
  edtDescricao.Enabled := true;
  edtDescricao.SetFocus;
end;

procedure TfrmCadastroTabelaPreco.edtDescricaoEnter(Sender: TObject);
begin
  inherited;
  if self.Tag in [1,2] then
    habilita(true);
end;

procedure TfrmCadastroTabelaPreco.btnCancelarClick(Sender: TObject);
begin
  inherited;
  habilita(false);
  edtDescricao.Enabled := false;
  edtCodigo.Text       := cdsCODIGO.AsString;
  edtDescricao.Text    := cdsDESCRICAO.AsString;
  gridTabPreco.SetFocus;
  self.Tag := 0;
end;

procedure TfrmCadastroTabelaPreco.btnSalvarClick(Sender: TObject);
begin
  if trim(edtDescricao.Text) = '' then begin
    self.avisar('É necessário informar uma descrição para a tabela de preço!');
    edtDescricao.SetFocus;
    exit;
  end
  else
    salvar;
end;

procedure TfrmCadastroTabelaPreco.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if      (key = VK_F3) and (btnIncluir.Enabled) then  btnIncluir.Click
  else if (key = VK_F4) and (btnAlterar.Enabled) then  btnAlterar.Click;
end;

procedure TfrmCadastroTabelaPreco.habilita(SN: Boolean);
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

procedure TfrmCadastroTabelaPreco.salvar;
begin
  if Rep = nil then begin
    Rep     := TFabricaRepositorio.GetRepositorio(TTabelaPreco.ClassName);
    TabelaPreco := TTabelaPreco.Create;
  end;

  if self.Tag = 2 then
    TabelaPreco.Codigo := cdsCODIGO.AsInteger;

  TabelaPreco.Descricao := trim(edtDescricao.Text);

  rep.Salvar(TabelaPreco);

  cds.Close;
  cds.Open;

  btnCancelar.Click;

  avisar('Operação realizada com sucesso!');

  FreeAndNil(rep);
  FreeAndNil(TabelaPreco);
end;

end.
