unit uImportadorOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids, System.StrUtils,
  Vcl.DBGrids, DBGridCBN, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, uPadrao, System.Win.ComObj;

type
  TfrmImportadorOrdemServico = class(TFrmPadrao)
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnSair: TSpeedButton;
    gpbCaminhoLogo: TGroupBox;
    btnSeleciona: TSpeedButton;
    edtCaminho: TEdit;
    DBGridCBN1: TDBGridCBN;
    cdsOS: TClientDataSet;
    dsOS: TDataSource;
    cdsOSCODIGO: TIntegerField;
    cdsOSCODIGO_PRODUTO: TIntegerField;
    cdsOSCODIGO_COR: TIntegerField;
    cdsOSCODIGO_TAMANHO: TIntegerField;
    cdsOSPRODUTO: TStringField;
    cdsOSCOR: TStringField;
    cdsOSTAMANHO: TStringField;
    cdsOSQUANTIDADE: TIntegerField;
    cdsOSNUMERO: TStringField;
    mmoLog: TMemo;
    Label1: TLabel;
    lbOSInc: TLabel;
    label3: TLabel;
    lbOSAlt: TLabel;
    label2: TLabel;
    lbOcorrencias: TLabel;
    Label5: TLabel;
    procedure btnSelecionaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    procedure importarOrdensServico(caminho :String);
    procedure salvarOrdensServico;
    procedure clearDados;
  public
    { Public declarations }
  end;

var
  frmImportadorOrdemServico: TfrmImportadorOrdemServico;

implementation

uses repositorio, fabricaRepositorio, Produto, Cor, OrdemServico, funcoes;

{$R *.dfm}

procedure TfrmImportadorOrdemServico.btnSairClick(Sender: TObject);
begin
  if not cdsOS.IsEmpty then
    if not confirma('Importação em andamento. Deseja sair sem salva-la?') then
      exit;

  self.Close;
end;

procedure TfrmImportadorOrdemServico.btnSalvarClick(Sender: TObject);
begin
  if not cdsOS.IsEmpty then
    if confirma('Salvar Ordens de serviço importadas?') then
      salvarOrdensServico;
end;

procedure TfrmImportadorOrdemServico.btnSelecionaClick(Sender: TObject);
var Dialog :TOpenDialog;
begin
  try
    Dialog            := TOpenDialog.Create(nil);
    Dialog.Title      := 'Selecione o arquivo com as ordens de serviço';
    Dialog.DefaultExt := 'xls';
    Dialog.Filter     := 'Planílha Excel | *.xlsx;*.xls;*.xlsm';

    if Dialog.Execute then
      edtCaminho.Text := Dialog.FileName;

    if edtCaminho.Text <> '' then
      importarOrdensServico(edtCaminho.Text);

  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TfrmImportadorOrdemServico.clearDados;
begin
  lbOSInc.Caption := '0';
  lbOSAlt.Caption := '0';
  lbOcorrencias.Caption := '0';
  edtCaminho.Clear;
  cdsOS.EmptyDataSet;
  mmoLog.Clear;
end;

procedure TfrmImportadorOrdemServico.FormCreate(Sender: TObject);
begin
  cdsOS.CreateDataSet;
end;

procedure TfrmImportadorOrdemServico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( (ssCtrl in Shift) AND (Key = ord('S')) ) then
    btnSalvar.Click;
  if key = VK_ESCAPE then
    btnSair.Click;
end;

procedure TfrmImportadorOrdemServico.importarOrdensServico(caminho: String);
var Excel, Sheet: OleVariant;
   i, quantidade, oInc, oAlt, oOcor :integer;
   codProduto, codCor, codTamanho :integer;
   repProduto :TRepositorio;
   repCor     :TRepositorio;
   produto :TProduto;
   cor :TCor;
   tamanho, ordemServico, msg :String;
begin
  Aguarda('Importando ordens de serviço, aguarde...');

  try
    repProduto   := nil;
    repCor       := nil;
    try
      Excel := CreateOleObject('Excel.Application');
      Excel.WorkBooks.Open(caminho);
      Excel.Visible := false;

    except
      on e : Exception do
        begin
          avisar('Ocorreu um erro ao abrir o arquivo.'+#13#10+ e.Message);
        end;
    end;

    try
      i := 2;
      repProduto := TFabricaRepositorio.GetRepositorio(TProduto.ClassName);
      repCor     := TFabricaRepositorio.GetRepositorio(TCor.ClassName);

      clearDados;
      oInc := 0;
      oAlt := 0;
      oOcor := 0;
      cdsOS.DisableControls;
      while Excel.WorkBooks[1].Sheets[1].Cells[i,1].value > 0 do
      begin
        Application.ProcessMessages;

        ordemServico := TRIM( Excel.WorkBooks[1].Sheets[1].Cells[i,1] );
        tamanho      := TRIM( Excel.WorkBooks[1].Sheets[1].Cells[i,4] );
        tamanho      := IfThen(tamanho = 'U','UNICA', tamanho);
        quantidade   := StrToIntDef(TRIM( Excel.WorkBooks[1].Sheets[1].Cells[i,5] ) ,0);

        codProduto := strToIntDef(Campo_por_campo('PRODUTOS','CODIGO','REFERENCIA',TRIM( Excel.WorkBooks[1].Sheets[1].Cells[i,2] )) ,0);
        codCor     := strToIntDef(Campo_por_campo('CORES','CODIGO','REFERENCIA',TRIM( Excel.WorkBooks[1].Sheets[1].Cells[i,3] )) ,0);
        codTamanho := strToIntDef(Campo_por_campo('TAMANHOS','CODIGO','DESCRICAO',TRIM( Excel.WorkBooks[1].Sheets[1].Cells[i,4] )) ,0);

        if (codProduto > 0) and (codCor > 0) and (codTamanho > 0) then
        begin
          if buscaCodigoBarras(codProduto, codCor, codTamanho) = '' then
            mmoLog.Lines.Add('OS Nº "'+ordemServico+'" não possui código de barras correspondente');

          produto    := TProduto(repProduto.Get(codProduto));
          cor        := TCor(repCor.Get(codCor));

          cdsOS.Append;
          cdsOSCODIGO.AsInteger           := strToIntDef(Campo_por_campo('ORDEM_SERVICO','CODIGO','NUMERO',ordemServico),0);
          cdsOSCODIGO_PRODUTO.AsInteger   := codProduto;
          cdsOSCODIGO_COR.AsInteger       := codCor;
          cdsOSCODIGO_TAMANHO.AsInteger   := codTamanho;
          cdsOSPRODUTO.AsString           := produto.Descricao;
          cdsOSCOR.AsString               := cor.Descricao;
          cdsOSTAMANHO.AsString           := tamanho;
          cdsOSQUANTIDADE.AsInteger       := quantidade;
          cdsOSNUMERO.AsString            := ordemServico;

          if cdsOSCODIGO.AsInteger > 0 then
            inc(oAlt)
          else
            inc(oInc);

          cdsOS.Post;

          FreeAndNil(produto);
          FreeAndNil(cor);
        end
        else
        begin
          msg := IfThen(codProduto = 0, 'Produto não encontrado ', IfThen(codCor = 0, 'Cor não encontrada ', 'Tamanho não encontrado'));
          mmoLog.Lines.Add(msg+'para ordem de serviço Nº "'+ordemServico+'"');
          inc(oOcor);
        end;

        inc(i);

        lbOSInc.Caption := intToStr(oInc);
        lbOSAlt.Caption := intToStr(oAlt);
        lbOcorrencias.Caption := intToStr(oOcor);
      end;
      cdsOS.EnableControls;

      lbOSInc.Caption := intToStr(oInc);
      lbOSAlt.Caption := intToStr(oAlt);
      lbOcorrencias.Caption := intToStr(oOcor);

    except
      on e : Exception do
        begin
          avisar('Ocorreu um erro ao importar os clientes.'+#13#10+ e.Message);
        end;
    end;

  finally
    FreeAndNil(repProduto);
    FreeAndNil(repCor);
    FimAguarda;
    Excel := Unassigned;
    PostMessage(FindWindow('XLMAIN', nil), WM_CLOSE,0,0);
    Sheet := Unassigned;
    Excel.Quit;
  end;
end;

procedure TfrmImportadorOrdemServico.salvarOrdensServico;
var
   repOS :TRepositorio;
   OS    :TOrdemServico;
begin
  Aguarda('Salvando ordens de serviço, aguarde...');
  OS           := nil;
  repOS        := nil;
  try
    repOs      := TFabricaRepositorio.GetRepositorio(TOrdemServico.ClassName);

    cdsOS.DisableControls;
    cdsOS.First;
    while not cdsOs.Eof do
    begin
      OS                := TOrdemServico(repOS.Get(cdsOSCODIGO.AsInteger));

      if not assigned(OS) then
        OS := TOrdemServico.Create;

      if not OS.impresso then
      begin
        OS.numero         := cdsOSNUMERO.AsInteger;
        OS.codigo_produto := cdsOSCODIGO_PRODUTO.AsInteger;
        OS.codigo_cor     := cdsOSCODIGO_COR.AsInteger;
        OS.codigo_tamanho := cdsOSCODIGO_TAMANHO.AsInteger;
        OS.quantidade     := cdsOSQUANTIDADE.AsInteger;
        repOS.Salvar(OS);
      end;

      FreeAndNil(OS);

      cdsOS.Next;
    end;
    cdsOS.EnableControls;

    clearDados;
    avisar('Ordens de serviço salvas com sucesso!');

  finally
    FimAguarda;
    FreeAndNil(OS);
    FreeAndNil(repOS);
  end;
end;

end.
