unit uErrosImportacaoPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, contnrs,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, DBGridCBN,
  Datasnap.DBClient, System.ImageList, Vcl.ImgList;

type
  TfrmErrosImportacaoPedido = class(TfrmPadrao)
    DBGridCBN1: TDBGridCBN;
    Panel1: TPanel;
    btnMarcar: TBitBtn;
    btnSair: TBitBtn;
    cds: TClientDataSet;
    ds: TDataSource;
    cdsERRO: TStringField;
    cdsCODIGO: TIntegerField;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
  private
    procedure preencheCds(ListaLogErros :TObjectList);
  public
    { Public declarations }
  end;

var
  frmErrosImportacaoPedido: TfrmErrosImportacaoPedido;

implementation

uses repositorio, fabricaRepositorio, LogErroImportPedido, System.StrUtils;

{$R *.dfm}

procedure TfrmErrosImportacaoPedido.btnMarcarClick(Sender: TObject);
var repositorio :TRepositorio;
    LogErro     :TLogErroImportPedido;
begin
  if cds.IsEmpty then
    exit;
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TLogErroImportPedido.ClassName);
    LogErro     := TLogErroImportPedido(repositorio.Get(cdsCODIGO.AsInteger));

    LogErro.verificado := true;
    repositorio.Salvar(LogErro);
    cds.Delete;
  finally
    FreeAndNil(LogErro);
    FreeAndNil(repositorio);
  end;
end;

procedure TfrmErrosImportacaoPedido.btnSairClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmErrosImportacaoPedido.FormShow(Sender: TObject);
var repositorio :TRepositorio;
    ListaLogErros :TObjectList;
begin
  cds.CreateDataSet;
  try
    repositorio   := TFabricaRepositorio.GetRepositorio(TLogErroImportPedido.ClassName);
    ListaLogErros := repositorio.GetAll(' WHERE VERIFICADO = ''N'' ');

    if assigned(ListaLogErros) then
      preencheCds(ListaLogErros);

  finally
    FreeAndNil(repositorio);
    FreeAndNil(ListaLogErros);
  end;
end;

procedure TfrmErrosImportacaoPedido.preencheCds(ListaLogErros: TObjectList);
var
    Erro :TLogErroImportPedido;
    i :integer;
begin
  if not cds.isEmpty then
    cds.EmptyDataSet;
  for i := 0 to ListaLogErros.Count-1 do
  begin
    Erro := (ListaLogErros.Items[i] as TLogErroImportPedido);
    cds.Append;
    cdsCODIGO.AsInteger    := Erro.codigo;
    cdsERRO.AsString       := Erro.erro;
    cds.Post;
  end;
end;

end.
