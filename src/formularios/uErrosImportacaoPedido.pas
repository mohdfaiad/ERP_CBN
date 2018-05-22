unit uErrosImportacaoPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, contnrs,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, DBGridCBN,
  Datasnap.DBClient, System.ImageList, Vcl.ImgList;

type
  TTipoVerificacao = (tpVerificado, tpExportado);
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
    cdsPEDIDO: TStringField;
    cdsNUM_PEDIDO: TStringField;
    cdsSELECIONADO: TStringField;
    cdsMARCADO: TStringField;
    lbErros: TLabel;
    Label1: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridCBN1DblClick(Sender: TObject);
    procedure DBGridCBN1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure preencheCds(ListaLogErros :TObjectList);

    procedure marcaPedidoComoExportado;
    procedure marcaComoVerificadoExportado(tipo :TTipoVerificacao);
  public
    { Public declarations }
  end;

var
  frmErrosImportacaoPedido: TfrmErrosImportacaoPedido;

implementation

uses repositorio, fabricaRepositorio, LogErroImportPedido, System.StrUtils, HTTPJSON, StringUtilitario;

{$R *.dfm}

procedure TfrmErrosImportacaoPedido.btnMarcarClick(Sender: TObject);
var
    index :integer;
begin
  TRY
    index := cds.RecNo;
    cds.Filter   := 'SELECIONADO = ''S'' ';
    cds.Filtered := TRUE;

    if cds.isEmpty then
    begin
      avisar('Atenção! Nenhum registro foi selecionado.');
      exit;
    end;

    cds.First;
    while not cds.Eof do
    begin
      cds.Edit;
      cdsMARCADO.AsString := 'S';
      cds.Post;
      if cdsPEDIDO.AsString.Equals('SHOPPUB') and not(cdsNUM_PEDIDO.AsString.IsEmpty) then
        marcaPedidoComoExportado
      else
        marcaComoVerificadoExportado( tpVerificado );
      cds.Next;
    end;

    cds.Filter   := 'MARCADO = ''S'' ';
    cds.Filtered := TRUE;

    while not cds.IsEmpty do
    begin
      cds.Delete;
      cds.First;
    end;

  FINALLY
    cds.Filtered := false;
    lbErros.Caption := intToStr(cds.RecordCount) + ' erros pendentes de verificação';
    if index > cds.RecordCount then
      index := cds.RecordCount;
    cds.RecNo    := index;
  END;
end;

procedure TfrmErrosImportacaoPedido.btnSairClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmErrosImportacaoPedido.DBGridCBN1DblClick(Sender: TObject);
begin
  inherited;
  cds.Edit;
  cdsSELECIONADO.AsString := IfThen(cdsSELECIONADO.AsString = 'S','N','S');
  cds.Post;
end;

procedure TfrmErrosImportacaoPedido.DBGridCBN1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if TDBGridCBN(Sender).DataSource.DataSet.FieldByName('SELECIONADO').AsString.Equals('S') then
  begin
    TDBGridCBN(Sender).Canvas.Font.Color  := $00D56A00;
    TDBGridCBN(Sender).Canvas.Brush.Color := $00FAEEDA;
  end;

  TDBGridCBN(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmErrosImportacaoPedido.FormCreate(Sender: TObject);
begin
  inherited;
  cds.CreateDataSet;
end;

procedure TfrmErrosImportacaoPedido.FormShow(Sender: TObject);
var repositorio :TRepositorio;
    ListaLogErros :TObjectList;
begin
  try
    repositorio   := TFabricaRepositorio.GetRepositorio(TLogErroImportPedido.ClassName);
    ListaLogErros := repositorio.GetAll(' WHERE (VERIFICADO = ''N'') and ((EXPORTADO IS NULL)OR(EXPORTADO <> ''S'')) ');

    if assigned(ListaLogErros) then
      preencheCds(ListaLogErros);
    cds.Last;
    lbErros.Caption := intToStr(cds.RecordCount) + ' erros pendentes de verificação';

  finally
    FreeAndNil(repositorio);
    FreeAndNil(ListaLogErros);
  end;
end;

procedure TfrmErrosImportacaoPedido.marcaComoVerificadoExportado(tipo :TTipoVerificacao);
var repositorio :TRepositorio;
    logErro     :TLogErroImportPedido;
begin
  repositorio := nil;
  logErro     := nil;
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TLogErroImportPedido.ClassName);
    logErro     := TLogErroImportPedido(repositorio.Get(cdsCODIGO.AsInteger));

    case tipo of
      tpVerificado: logErro.verificado := true;
      tpExportado: logErro.exportado := true;
    end;

    repositorio.Salvar(logErro);

    cds.Edit;
    cdsMARCADO.AsString := 'S';
    cds.Post;
  finally
    FreeAndNil(repositorio);
    FreeAndNil(logErro);
  end;
end;

procedure TfrmErrosImportacaoPedido.marcaPedidoComoExportado;
var vHTTPJSON :THTTPJSON;
    lJSO, retorno :String;
begin
  try
  try
    vHTTPJSON := nil;
    vHTTPJSON := THTTPJSON.CreateEcommerce(fdm.configuracoesECommerce.token, fdm.configuracoesECommerce.url_base);

    lJSO := '{"erp_exportado": true}';

    retorno := vHTTPJSON.Put('pedido/'+TStringUtilitario.ApenasNumeros(cdsNUM_PEDIDO.AsString), lJSO);

    if pos('success', retorno) > 0 then
    begin
      avisar('Operação realizada com sucesso!');
      marcaComoVerificadoExportado(tpExportado);
    end
    else
      raise Exception.Create(retorno);

  Except
    on e:Exception do
      avisar('Erro ao marcar pedido como exportado. '+#13#10+e.Message);
  end;
  finally
    FreeAndNil(vHTTPJSON);
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
    cdsPEDIDO.AsString     := Erro.importador;
    cdsNUM_PEDIDO.AsString := Erro.num_pedido;
    cds.Post;
  end;

  cds.IndexFieldNames := 'NUM_PEDIDO';
end;

end.
