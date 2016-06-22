unit uBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DBGridCBN,
  DB, DBClient, Menus, ExtCtrls;

type
  TfrmBackup = class(TfrmPadrao)
    pg: TPageControl;
    pageBackup: TTabSheet;
    pageConfiguracao: TTabSheet;
    gbDiretoriosBackup: TGroupBox;
    gridDiretoriosBackup: TDBGridCBN;
    cdsDiretoriosBackup: TClientDataSet;
    dsDiretoriosBackup: TDataSource;
    cdsDiretoriosBackupCAMINHO: TStringField;
    pmOpcoesGrid: TPopupMenu;
    mnuAdicionar: TMenuItem;
    mnuRemover: TMenuItem;
    cdsDiretoriosBackupCODIGO: TIntegerField;
    pnlLegenda: TPanel;
    gbLog: TGroupBox;
    memoLog: TMemo;
    btnIniciarBackup: TBitBtn;

    procedure btnCancelarClick(Sender: TObject);
    procedure mnuAdicionarClick(Sender: TObject);
    procedure mnuRemoverClick(Sender: TObject);
    procedure gridDiretoriosBackupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIniciarBackupClick(Sender: TObject);

  private
    procedure ExbideDadosPaginaConfiguracao;

    procedure AdicionaDiretorioNoGrid(DiretorioBackup :TObject);
    procedure AtualizaLog(StatusParcial :String);
    procedure PreencheGridDiretoriosBackup;

    procedure AdicionarDiretorio;
    procedure RemoverDiretorio;

  public
    constructor Create(AOwner :TComponent); override; 
    destructor  Destroy;                    override;
  end;

var
  frmBackup: TfrmBackup;

implementation

uses
  DiretorioBackup,
  Repositorio,
  FabricaRepositorio,
  FileCtrl, ServicoBackup;

{$R *.dfm}

procedure TfrmBackup.btnCancelarClick(Sender: TObject);
begin
   self.Close();
end;

constructor TfrmBackup.Create(AOwner: TComponent);
begin
  inherited;

  self.pg.ActivePage := self.pageBackup;
  self.cdsDiretoriosBackup.CreateDataSet;
  self.ExbideDadosPaginaConfiguracao;
end;

procedure TfrmBackup.ExbideDadosPaginaConfiguracao;
begin
   self.gbDiretoriosBackup.Caption := (self.gbDiretoriosBackup.Caption + Fdm.UsuarioLogado.Nome);
   self.PreencheGridDiretoriosBackup;
end;

procedure TfrmBackup.PreencheGridDiretoriosBackup;
var
  nX :Integer;
begin
   if not Assigned(FDM.UsuarioLogado.DiretoriosBackup) then exit;

   self.cdsDiretoriosBackup.EmptyDataSet;

   for nX := 0 to (FDM.UsuarioLogado.DiretoriosBackup.Count-1) do
    self.AdicionaDiretorioNoGrid(FDM.UsuarioLogado.DiretoriosBackup.Items[nX]);
end;

destructor TfrmBackup.Destroy;
begin
  self.cdsDiretoriosBackup.Close;
  
  inherited;
end;

procedure TfrmBackup.AdicionaDiretorioNoGrid(DiretorioBackup: TObject);
var
  Diretorio :TDiretorioBackup;
begin
   Diretorio := (DiretorioBackup as TDiretorioBackup);

   self.cdsDiretoriosBackup.Append;
   self.cdsDiretoriosBackupCODIGO.AsInteger := Diretorio.Codigo;
   self.cdsDiretoriosBackupCAMINHO.AsString := Diretorio.Caminho;
   self.cdsDiretoriosBackup.Post;
end;

procedure TfrmBackup.mnuAdicionarClick(Sender: TObject);
begin
   self.AdicionarDiretorio;
end;

procedure TfrmBackup.RemoverDiretorio;
var
  DiretorioBackup :TObject;
  Repositorio     :TRepositorio;
begin
   try
     if self.cdsDiretoriosBackup.IsEmpty or (not inherited Confirma('Deseja remover esse diretório de backup?')) then
      exit;

     Repositorio := nil;

     try
       Repositorio     := TFabricaRepositorio.GetRepositorio(TDiretorioBackup.ClassName);
       DiretorioBackup := FDM.UsuarioLogado.ProcuraDiretorioPeloCaminho(Trim(self.cdsDiretoriosBackupCAMINHO.AsString));
       Repositorio.Remover(DiretorioBackup);
       FDM.UsuarioLogado.RemoveDiretorioDeBackup(DiretorioBackup);
     finally
       FreeAndNil(Repositorio);
     end;

     self.cdsDiretoriosBackup.Delete;
     self.PreencheGridDiretoriosBackup;
   except
     on E: Exception do begin
        inherited Avisar(E.Message);
        FDM.LogErros.AdicionaErro('uBackup', E.ClassName, E.Message);
     end;
   end;
end;

procedure TfrmBackup.mnuRemoverClick(Sender: TObject);
begin
  inherited;

  self.RemoverDiretorio;
end;

procedure TfrmBackup.AdicionarDiretorio;
var
  Caminho         :String;
  DiretorioBackup :TDiretorioBackup;
  Repositorio     :TRepositorio;
begin
   if not SelectDirectory('Selecione um diretório que será usado para armazenar os backups', 'D:\', Caminho) then
     exit;

   try
     DiretorioBackup           := TDiretorioBackup.Create;
     DiretorioBackup.Caminho   := Caminho;
     FDM.UsuarioLogado.AdicionaDiretorioDeBackup(DiretorioBackup);

     Repositorio := nil;

     try
       Repositorio := TFabricaRepositorio.GetRepositorio(DiretorioBackup.ClassName);
       Repositorio.Salvar(DiretorioBackup);
     finally
       FreeAndNil(Repositorio);
     end;

     self.AdicionaDiretorioNoGrid(DiretorioBackup);
   except
     on E: Exception do begin
        inherited Avisar(E.Message);
        FDM.LogErros.AdicionaErro('uBackup', E.ClassName, E.Message);
     end;
   end;
end;

procedure TfrmBackup.gridDiretoriosBackupKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if      (Key = VK_DELETE) then self.RemoverDiretorio
  else if (Key = VK_INSERT) then self.AdicionarDiretorio;
end;

procedure TfrmBackup.btnIniciarBackupClick(Sender: TObject);
var
  ServicoBackup :TServicoBackup;
begin
   ServicoBackup := nil;

   if not inherited Confirma('Deseja prosseguir com o backup?') then exit;

   self.btnIniciarBackup.Enabled := false;
   self.memoLog.Lines.Clear;

   try
     try
       ServicoBackup := TServicoBackup.Create(FDM.ArquivoConfiguracao, FDM.UsuarioLogado);
       ServicoBackup.RealizarOperacao(self.AtualizaLog);

       inherited Avisar('Backup efetuado com sucesso!');
     finally
       FreeAndNil(ServicoBackup);
       self.btnIniciarBackup.Enabled := true;
     end;
   except
     on E: Exception do begin
        inherited Avisar(E.Message);
        FDM.LogErros.AdicionaErro('uBackup', E.ClassName, E.Message);
     end;
   end;
end;

procedure TfrmBackup.AtualizaLog(StatusParcial: String);
begin
   self.memoLog.Lines.Add(StatusParcial);
end;

end.
