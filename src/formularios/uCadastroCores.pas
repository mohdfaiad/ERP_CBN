unit uCadastroCores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Provider, DB, DBClient, StdCtrls, Buttons, Grids,
  DBGrids, DBGridCBN, ComCtrls, ExtCtrls, Cor, Repositorio,
  frameBuscaCor, frameListaCampo, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, JPEG;

type
  TRGBTripleArray = array[0..32767] of TRGBTriple;
  PRGBTripleArray = ^TRGBTripleArray;
  TfrmCadastroCores = class(TfrmPadrao)
    panBotoes: TPanel;
    pgcCores: TPageControl;
    tsDados: TTabSheet;
    edtDescricao: TEdit;
    Label1: TLabel;
    gridCores: TDBGridCBN;
    ds: TDataSource;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    cdsCODIGO: TIntegerField;
    cdsDESCRICAO: TStringField;
    edtCodigo: TEdit;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    Label2: TLabel;
    edtReferencia: TEdit;
    cdsREFERENCIA: TStringField;
    lblCamposObrigatorios: TLabel;
    gpbDescricao2: TGroupBox;
    edtDesc: TEdit;
    Label3: TLabel;
    edtCor: TEdit;
    Label4: TLabel;
    cdsDESC_PRODUCAO: TStringField;
    cdsCOR: TStringField;
    rgTipoCor: TRadioGroup;
    cdsTIPO: TStringField;
    GroupBox1: TGroupBox;
    cbPai: TComboBox;
    cdsCOR_PAI: TStringField;
    tsCoresFilhas: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    lbCor: TLabel;
    gridCoresFilhas: TDBGridCBN;
    BitBtn1: TBitBtn;
    cdsCoresFilhas: TClientDataSet;
    dsCoresFilhas: TDataSource;
    cdsCoresFilhasCODIGO: TIntegerField;
    cdsCoresFilhasCOD_COR_PAI: TIntegerField;
    cdsCoresFilhasCOD_COR_FILHA: TIntegerField;
    cdsCoresFilhasDESC_COR_FILHA: TStringField;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    cdsCODIGO_COLECAO: TIntegerField;
    tsCoresKit: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    gridCoresKit: TDBGridCBN;
    btnAddCorKit: TBitBtn;
    dsCoresKit: TDataSource;
    cdsCoresKit: TClientDataSet;
    cdsCoresKitCODIGO: TIntegerField;
    cdsCoresKitCODIGO_KIT: TIntegerField;
    cdsCoresKitCODIGO_COR: TIntegerField;
    GroupBox3: TGroupBox;
    cmbKit: TComboBox;
    cdsKIT: TStringField;
    cdsCoresKitREF_COR: TStringField;
    cdsCoresKitDESCRICAO: TStringField;
    qry: TFDQuery;
    pnlFoto: TPanel;
    imgCor: TImage;
    Panel2: TPanel;
    btnSelecionarImg: TSpeedButton;
    btnDeletarImg: TSpeedButton;
    imgPadrao: TImage;
    ListaColecoes: TListaCampo;
    BuscaCor1: TBuscaCor;
    BuscaCor2: TBuscaCor;
    Label13: TLabel;
    edtDescricaoCompleta: TEdit;
    cdsDESCRICAO_COMPLETA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtReferenciaEnter(Sender: TObject);
    procedure btnAddCorFilha(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridCoresFilhasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridCoresKitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAddCorKitClick(Sender: TObject);
    procedure cbPaiChange(Sender: TObject);
    procedure cmbKitChange(Sender: TObject);
    procedure edtReferenciaChange(Sender: TObject);
    procedure btnSelecionarImgClick(Sender: TObject);
    procedure btnDeletarImgClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CoresFilhasDeletadas :TStringList;
    CoresKitDeletadas :TStringList;
    FReferencia :String;
    FDesejaAlterarReferencia :Boolean;

    procedure armazena_deletadas;
    procedure deleta_selecionadas( repositorio :TRepositorio; lista :TStringList );
    function  verifica_vinculo(codigo_cor :integer) :Boolean;
    function qtdeCodBarrasDaCor :integer;
    function existeReferencia(var cor:string) :Boolean;

    procedure RedimensionarJPG(caminho :String; largura, altura: Integer);
    procedure habilitar(SN:Boolean);
    procedure mostra_dados;
    procedure salvar;
    procedure salvaImagem;
    procedure carregaImagem;
    procedure verificaDelecao;

  public
    { Public declarations }
  end;

var
  frmCadastroCores: TfrmCadastroCores;

implementation

uses FabricaRepositorio, StrUtils, Math, Contnrs, CorFilha, Funcoes, CoresKit;

{$R *.dfm}

procedure TfrmCadastroCores.FormShow(Sender: TObject);
begin
  inherited;
  cds.Close;
  dsp.DataSet := FDM.GetConsulta('select * from cores');
  cds.Open;

  ListaColecoes.setValores('select * from colecoes', 'descricao', '');
  ListaColecoes.executa;

  cds.AfterScroll := cdsAfterScroll;

  cdsAfterScroll(nil);
  
  gridCores.SetFocus;
end;

procedure TfrmCadastroCores.cdsAfterScroll(DataSet: TDataSet);
begin

  if (self.Tag = 2) and (cdsCODIGO.AsString <> edtCodigo.Text) then
    if confirma('Cancelar altera��o da Cor '+edtCodigo.Text+' - '+ edtDescricao.Text+'?') then
      btnCancelar.Click
    else begin
      cds.Locate('CODIGO', edtCodigo.Text, []);
    end;

  if not cds.IsEmpty then
    mostra_dados;
end;

procedure TfrmCadastroCores.btnIncluirClick(Sender: TObject);
begin
  inherited;
  cds.AfterScroll := nil;
  edtReferencia.OnChange := nil;
  pgcCores.ActivePageIndex := 0;
  edtDescricao.Clear;
  edtDescricaoCompleta.Clear;
  edtReferencia.Clear;
  edtCodigo.Text := '0';
  edtDesc.Clear;
  edtCor.Clear;
  ListaColecoes.comListaCampo.ItemIndex := -1;
  rgTipoCor.ItemIndex   := -1;
  cbpai.ItemIndex       := -1;
  self.Tag              := 1;
  edtReferencia.Enabled := true;
  edtDescricaoCompleta.Enabled := true;
  edtDescricao.Enabled := true;
  gpbDescricao2.Enabled := true;
  ListaColecoes.Enabled := true;
  btnDeletarImg.Enabled := true;
  btnSelecionarImg.Enabled := true;
  edtReferencia.SetFocus;
  edtReferencia.OnChange := edtReferenciaChange;
  cmbKit.ItemIndex := -1;
  cds.AfterScroll := cdsAfterScroll;
end;

procedure TfrmCadastroCores.btnAlterarClick(Sender: TObject);
begin
  inherited;
  cds.AfterScroll := nil;
  self.Tag := 2;
  pgcCores.ActivePageIndex := 0;
  edtReferencia.Enabled := true;
  gpbDescricao2.Enabled := true;
  btnDeletarImg.Enabled := true;
  edtDescricaoCompleta.Enabled  := true;
  edtDescricao.Enabled := true;
  ListaColecoes.Enabled := true;
  btnSelecionarImg.Enabled := true;
  edtReferencia.SetFocus;
  pgcCores.Pages[1].Enabled := true;
  cds.AfterScroll := cdsAfterScroll;
end;

procedure TfrmCadastroCores.btnCancelarClick(Sender: TObject);
begin
  inherited;
  habilitar(false);
  pgcCores.ActivePageIndex := 0;
  edtReferencia.Enabled    := false;
  edtDescricaoCompleta.Enabled := false;
  ListaColecoes.Enabled := false;
  edtDescricao.Enabled := false;
  gpbDescricao2.Enabled    := false;
  FDesejaAlterarReferencia := false;
  btnDeletarImg.Enabled := false;
  btnSelecionarImg.Enabled := false;
  cds.Refresh;
  mostra_dados;
  pgcCores.Pages[1].Enabled := false;

  if assigned(CoresFilhasDeletadas) then
    FreeAndNil(CoresFilhasDeletadas);

  if assigned(CoresKitDeletadas) then
    FreeAndNil(CoresKitDeletadas);

  self.Tag := 0;
  gridCores.SetFocus;
end;

procedure TfrmCadastroCores.btnDeletarImgClick(Sender: TObject);
begin
  imgCor.Picture := nil;
end;

procedure TfrmCadastroCores.btnSalvarClick(Sender: TObject);
var cor :string;
begin
  if (trim(edtDescricao.Text) = '') then begin
    avisar('� necess�rio informar uma descri��o para a cor');
    edtDescricao.SetFocus;
  end
  else if (trim(edtReferencia.Text) = '') then begin
    avisar('� necess�rio informar uma refer�ncia para a cor');
    edtReferencia.SetFocus;
  end
  else if (rgTipoCor.ItemIndex < 0) then begin
    avisar('� necess�rio informar o tipo da cor');
    rgTipoCor.SetFocus;
  end
  else if (cmbKit.ItemIndex = 0)and(cdsCoresKIT.RecordCount < 2) then begin
    avisar('� necess�rio incluir ao menos duas cores no kit');
    pgcCores.ActivePage := tsCoresKit;
  end
  else if existeReferencia(cor) and (self.tag <> 2) then
  begin
    avisar('A refer�ncia '+edtReferencia.Text+' j� est� cadastrada para a cor '+cor);
    edtReferencia.SetFocus;
  end
  else
    salvar;
end;

procedure TfrmCadastroCores.btnSelecionarImgClick(Sender: TObject);
var Dialog :TOpenDialog;
begin
  try
    Dialog := TOpenDialog.Create(nil);
    Dialog.Filter := 'Arquivos de fotos (*.jpg)|*.JPG|Arquivos de fotos (*.jpeg)|*.JPEG';
    Dialog.Title  := 'Selecione a imagem desejada';
    if Dialog.Execute then
      RedimensionarJPG(Dialog.FileName, 110, 110);

  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TfrmCadastroCores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if      (key = VK_F3) and (btnIncluir.Enabled) then  btnIncluir.Click
  else if (key = VK_F4) and (btnAlterar.Enabled) then  btnAlterar.Click;
end;

procedure TfrmCadastroCores.habilitar(SN: Boolean);
begin
    edtDescricao.ReadOnly := not SN;
    edtDesc.ReadOnly      := not SN;
    edtCor.ReadOnly       := not SN;
    rgTipoCor.Enabled     := SN;
    cbPai.Enabled         := SN;
    btnIncluir.Enabled    := not SN;
    btnAlterar.Enabled    := not SN;
    btnCancelar.Enabled   := SN;
    btnSalvar.Enabled     := SN;
    cbpai.Enabled         := SN;
    ListaColecoes.Enabled := SN;
    cmbKit.Enabled        := SN;
end;

procedure TfrmCadastroCores.salvaImagem;
var server, caminhoBD, destino, nomeArq :String;
  jpg: TJPEGImage;
begin
  try
    server    := '\\'+fdm.FDConnection.Params.Values['server']+'\';
    caminhoBD := copy(fdm.FDConnection.Params.Values['Database'], 4, length(fdm.FDConnection.Params.Values['Database']));
    destino   := Copy(caminhoBD, 1, LastDelimiter('\', caminhoBD))+'imgCores\';
    nomeArq   := edtCodigo.Text+'.jpg';
    if not DirectoryExists(server+destino) then
      CreateDirectory(PWideChar(server+destino), nil);

    jpg := TJPEGImage.Create;
    jpg.LoadFromFile(pnlFoto.Caption);
    jpg.SaveToFile(server+destino+nomeArq);
  finally
    FreeAndNil(jpg);
  end;
end;

procedure TfrmCadastroCores.salvar;
var referencia :String;
    Rep        :TRepositorio;
    Cor        :TCor;
    CorFilha   :TCorFilha;
    CoresKit   :TCoresKit;
begin
  Rep := nil;
  Cor := nil;

  Rep  := TFabricaRepositorio.GetRepositorio(TCor.ClassName);
  Cor  := TCor( Rep.Get( StrToInt(edtCodigo.Text) ) );

  if not assigned(Cor) then
    Cor  := TCor.Create;

  Cor.Descricao      := trim(edtDescricao.Text);
  Cor.Referencia     := trim(edtReferencia.Text);
  cor.Desc_producao  := trim(edtDesc.Text);
  cor.Cor            := trim(edtCor.Text);
  Cor.Tipo           := copy(rgTipoCor.Items[rgTipoCor.ItemIndex],1,1);
  Cor.Cor_pai        := IfThen(cdsCoresFilhas.IsEmpty, 'N', copy( cbPai.Items[cbPai.itemIndex], 1, 1) );
  cor.Codigo_colecao := ListaColecoes.CodCampo;
  Cor.kit            := (cdsCoresKit.RecordCount > 0) and (cmbKit.Items[cmbKit.ItemIndex] = 'SIM');
  Cor.descricao_completa := trim(edtDescricaoCompleta.Text);

  rep.Salvar(Cor);
  edtCodigo.Text := IntToStr(Cor.Codigo);

  referencia := Cor.Referencia;

  if not cdsCoresFilhas.IsEmpty then begin
    Rep    := TFabricaRepositorio.GetRepositorio( TCorFilha.ClassName );

    cdsCoresFilhas.IndexFieldNames := 'CODIGO';
    cdsCoresFilhas.First;
    while not cdsCoresFilhas.Eof do begin

      if cdsCoresFilhasCODIGO.AsInteger = 0 then
      begin
        CorFilha := TCorFilha.Create;
        CorFilha.codigo_cor_pai   := Cor.codigo;
        CorFilha.codigo_cor_filha := cdsCoresFilhasCOD_COR_FILHA.AsInteger;

        rep.Salvar(CorFilha);
      end;

      cdsCoresFilhas.Next;
    end;
  end;

  deleta_selecionadas( rep, CoresFilhasDeletadas);


  if not cdsCoresKit.IsEmpty then begin
    Rep    := TFabricaRepositorio.GetRepositorio( TCoresKit.ClassName );

    cdsCoresKit.First;
    while not cdsCoresKit.Eof do begin

      if cdsCoresKitCODIGO.AsInteger = 0 then
      begin
        CoresKit := TCoresKit.Create;
        CoresKit.codigo_kit  := Cor.codigo;
        CoresKit.codigo_cor  := cdsCoresKitCODIGO_COR.AsInteger;

        rep.Salvar(CoresKit);
      end;

      cdsCoresKit.Next;
    end;
  end;

  if imgCor.Picture.Height > 0 then
    salvaImagem
  else
    verificaDelecao;

  deleta_selecionadas( rep, CoresKitDeletadas);

  btnCancelar.Click;

  if referencia <> '' then
    cds.Locate('referencia', referencia, []);
    
  avisar('Opera��o realizada com sucesso!');

  FreeAndNil(rep);
  FreeAndNil(Cor);
end;

procedure TfrmCadastroCores.edtReferenciaChange(Sender: TObject);
var qtde :integer;
begin
  edtReferencia.OnChange := nil;
  if not FDesejaAlterarReferencia then
  begin
    qtde := qtdeCodBarrasDaCor;
    if qtde > 0 then
    begin
      if not confirma('Existem '+intToStr(qtde)+' c�digos de barras criados, que utilizam esta cor.'+#13#10+'Deseja realmente alterar a refer�ncia da cor?') then
        edtReferencia.Text := FReferencia
      else
        FDesejaAlterarReferencia := true;
    end;
  end;
  edtReferencia.OnChange := edtReferenciaChange;
end;

procedure TfrmCadastroCores.edtReferenciaEnter(Sender: TObject);
begin
  inherited;

  if edtCodigo.Text = '0' then
    FDesejaAlterarReferencia := true
  else
    FReferencia := edtReferencia.Text;

  if self.Tag in [1,2] then
    habilitar(true);
end;

function TfrmCadastroCores.existeReferencia(var cor: string): Boolean;
begin
  cor := Campo_por_campo('CORES','DESCRICAO','REFERENCIA',edtReferencia.Text);
  result := cor <> '';
end;

procedure TfrmCadastroCores.mostra_dados;
var Cor :TCor;
    repositorio :TRepositorio;
    i :integer;
begin
  try
    edtReferencia.OnChange := nil;

    edtCodigo.Text      := cdsCODIGO.AsString;
    edtDescricao.Text   := cdsDESCRICAO.AsString;
    edtReferencia.Text  := cdsREFERENCIA.AsString;
    edtDesc.Text        := cdsDESC_PRODUCAO.AsString;
    edtCor.Text         := cdsCOR.AsString;
    rgTipoCor.ItemIndex := rgTipoCor.Items.IndexOf( IfThen(cdsTIPO.asString = 'L','Lisa','Estampada') );
    cbPai.ItemIndex     := IfThen(cdsCOR_PAI.AsString = 'S',0,1);
    lbCor.Caption       := cdsDESCRICAO.AsString;
    ListaColecoes.CodCampo := cdsCODIGO_COLECAO.AsInteger;
    cmbKit.ItemIndex    := cmbKit.Items.IndexOf(IfThen(cdsKIT.AsString='S', 'SIM', 'N�O'));
    edtDescricaoCompleta.Text := cdsDESCRICAO_COMPLETA.AsString;

    cbPaiChange(nil);
    cmbKitChange(nil);

    cdsCoresFilhas.EmptyDataSet;

    repositorio := TFabricaRepositorio.GetRepositorio(TCor.ClassName);
    Cor         := TCor(repositorio.Get(cdsCODIGO.AsInteger));

    if assigned(Cor.CoresFilhas) then begin
      for i := 0 to Cor.CoresFilhas.Count - 1 do begin
        cdsCoresFilhas.Append;
        cdsCoresFilhasCODIGO.AsInteger        := TCorFilha(Cor.CoresFilhas.Items[i]).codigo;
        cdsCoresFilhasCOD_COR_PAI.AsInteger   := TCorFilha(Cor.CoresFilhas.Items[i]).codigo_cor_pai;
        cdsCoresFilhasCOD_COR_FILHA.AsInteger := TCorFilha(Cor.CoresFilhas.Items[i]).codigo_cor_filha;
        cdsCoresFilhasDESC_COR_FILHA.AsString := TCorFilha(Cor.CoresFilhas.Items[i]).CorFilha.Descricao;
        cdsCoresFilhas.Post;
      end;

      cbPai.Enabled := not cdsCoresFilhas.IsEmpty;
    end;

    cdsCoresKit.EmptyDataSet;

    if assigned(Cor.CoresKit) then begin
      for i := 0 to Cor.CoresKit.Count - 1 do begin
        cdsCoresKit.Append;
        cdsCoresKitCODIGO.AsInteger       := TCoresKit(Cor.CoresKit.Items[i]).codigo;
        cdsCoresKitCODIGO_KIT.AsInteger   := TCoresKit(Cor.CoresKit.Items[i]).codigo_kit;
        cdsCoresKitCODIGO_COR.AsInteger   := TCoresKit(Cor.CoresKit.Items[i]).codigo_cor;
        cdsCoresKitREF_COR.AsString       := TCoresKit(Cor.CoresKit.Items[i]).Cor.Referencia;
        cdsCoresKitDESCRICAO.AsString     := IfThen(TCoresKit(Cor.CoresKit.Items[i]).Cor.Desc_producao='',TCoresKit(Cor.CoresKit.Items[i]).Cor.Descricao,TCoresKit(Cor.CoresKit.Items[i]).Cor.Desc_producao);
        cdsCoresKit.Post;
      end;
    end;

    carregaImagem;
  Finally
    edtReferencia.OnChange := edtReferenciaChange;
    FreeAndNil(cor);
    FreeAndNil(repositorio);
  end;
end;

procedure TfrmCadastroCores.btnAddCorFilha(Sender: TObject);
begin
  if verifica_vinculo(BuscaCor1.CodigoCor) then begin
    avisar('J� existe um v�nculo criado para esta cor');
    BuscaCor1.edtReferencia.SetFocus;
  end
  else begin
    cdsCoresFilhas.Append;
    cdsCoresFilhasCODIGO.AsInteger        := 0;
    cdsCoresFilhasCOD_COR_PAI.AsInteger   := StrToInt(edtCodigo.Text);
    cdsCoresFilhasCOD_COR_FILHA.AsInteger := StrToInt(BuscaCor1.codCor);
    cdsCoresFilhasDESC_COR_FILHA.AsString := BuscaCor1.edtDescricao.Text;
    cdsCoresFilhas.Post;

//    cbPai.Enabled := not cdsCoresFilhas.IsEmpty;
  end;

  BuscaCor1.limpa;
  Buscacor1.edtReferencia.SetFocus;
end;

procedure TfrmCadastroCores.FormCreate(Sender: TObject);
begin
  inherited;
  cdsCoresFilhas.CreateDataSet;
  cdsCoresKit.CreateDataSet;
  pgcCores.ActivePageIndex := 0;
end;

procedure TfrmCadastroCores.FormDestroy(Sender: TObject);
begin
  CDS.AfterScroll := NIL;

  inherited;
end;

procedure TfrmCadastroCores.gridCoresFilhasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_DELETE then
    armazena_deletadas;
end;

procedure TfrmCadastroCores.armazena_deletadas;
begin
  if (cdsCoresFilhas.IsEmpty) or not confirma('Deseja realmente deletar o v�culo com o registro:'+#13#10+
                                              cdsCoresFilhasDESC_COR_FILHA.AsString+'?') then exit;

  if cdsCoresFilhasCODIGO.AsInteger > 0 then begin
    if not assigned(CoresFilhasDeletadas) then
      CoresFilhasDeletadas := TStringList.Create;

    CoresFilhasDeletadas.Add( cdsCoresFilhasCODIGO.AsString );
  end;

  cdsCoresFilhas.Delete;

  cbPai.Enabled := not cdsCoresFilhas.IsEmpty;
end;

procedure TfrmCadastroCores.deleta_selecionadas( repositorio :TRepositorio; lista :TStringList );
var i :integer;
begin
  if not assigned( lista ) then exit;

  for i := 0 to lista.Count - 1 do begin
    repositorio.RemoverPorIdentificador( StrToInt( lista[i] ) );
  end;
end;

procedure TfrmCadastroCores.verificaDelecao;
var server, caminhoBD, destino, nomeArq :String;
begin
  server    := '\\'+fdm.FDConnection.Params.Values['server']+'\';
  caminhoBD := copy(fdm.FDConnection.Params.Values['Database'], 4, length(fdm.FDConnection.Params.Values['Database']));
  destino   := Copy(caminhoBD, 1, LastDelimiter('\', caminhoBD))+'imgCores\';
  nomeArq   := edtCodigo.Text+'.jpg';

  if FileExists(server+destino+nomeArq) then
    DeleteFile(server+destino+nomeArq);
end;

function TfrmCadastroCores.verifica_vinculo(codigo_cor: integer) :Boolean;
begin
 result := (Campo_por_campo('CORES_FILHAS','CODIGO','CODIGO_COR_FILHA', IntToStr(codigo_cor)) <> '')
        or (Campo_por_campo('CORES_FILHAS','CODIGO','CODIGO_COR_PAI', IntToStr(codigo_cor)) <> '');
end;

procedure TfrmCadastroCores.gridCoresKitKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (cdsCoresKit.IsEmpty) or not confirma('Deseja realmente remover a cor selecionada do kit atual?') then
    exit;

  if cdsCoresKitCODIGO.AsInteger > 0 then begin
    if not assigned(CoresKitDeletadas) then
      CoresKitDeletadas := TStringList.Create;

    CoresKitDeletadas.Add( cdsCoresKitCODIGO.AsString );
  end;

  cdsCoresKit.Delete;

  cmbKit.Enabled := not cdsCoresKit.IsEmpty;
end;

procedure TfrmCadastroCores.btnAddCorKitClick(Sender: TObject);
begin

    cdsCoresKit.Append;
    cdsCoresKitCODIGO.AsInteger     := 0;
    cdsCoresKitCODIGO_KIT.AsInteger := StrToInt(edtCodigo.Text);
    cdsCoresKitCODIGO_COR.AsInteger := BuscaCor2.edtCodigo.AsInteger;
    cdsCoresKitREF_COR.AsString     := BuscaCor2.edtReferencia.Text;
    cdsCoresKitDESCRICAO.AsString   := BuscaCor2.edtDescricao.Text;
    cdsCoresKit.Post;

    cmbKit.Enabled := not cdsCoresKit.IsEmpty;


  BuscaCor2.limpa;
  BuscaCor2.edtReferencia.SetFocus;
end;

procedure TfrmCadastroCores.carregaImagem;
var server, caminhoBD, destino, nomeArq, arqPadrao :String;
begin
  arqPadrao := 'padrao.jpg';
  server    := '\\'+fdm.FDConnection.Params.Values['server']+'\';
  caminhoBD := copy(fdm.FDConnection.Params.Values['Database'], 4, length(fdm.FDConnection.Params.Values['Database']));
  destino   := Copy(caminhoBD, 1, LastDelimiter('\', caminhoBD))+'imgCores\';
  nomeArq   := edtCodigo.Text+'.jpg';
  if FileExists(server+destino+nomeArq) then
    RedimensionarJPG(server+destino+nomeArq,110,110)
  else
  begin
    if assigned(imgCor) then
      imgCor.Picture := nil;
  end;
end;

procedure TfrmCadastroCores.cbPaiChange(Sender: TObject);
begin
   tsCoresFilhas.TabVisible := (cbPai.ItemIndex = 0);
end;

procedure TfrmCadastroCores.cmbKitChange(Sender: TObject);
begin
   tsCoresKit.TabVisible := (cmbKit.ItemIndex = 0);
end;

function TfrmCadastroCores.qtdeCodBarrasDaCor: integer;
begin
  Fdm.qryGenerica.Close;
  Fdm.qryGenerica.SQL.Text := 'SELECT COUNT(cb.codigo) CONT from codigo_barras cb '+
                              ' Where cb.codcor = :codcor ';
  Fdm.qryGenerica.ParamByName('codcor').AsInteger := strToInt(edtCodigo.text);
  Fdm.qryGenerica.Open;
  result := Fdm.qryGenerica.FieldByName('CONT').AsInteger;
end;

procedure TFrmCadastroCores.RedimensionarJPG(caminho :String; largura, altura: Integer);
var
  bmp: TBitmap;
  jpg: TJPEGImage;
  scale: Double;
  widthL, HeightL, pt1, pt2, pt3, pt4: integer;
  verdd : boolean;
begin
  try
    pnlFoto.Caption := caminho;
    jpg := TJPEGImage.Create;
    verdd := false;
    try
      //Dimens�es
      widthL := largura;
      HeightL := altura;
      jpg.LoadFromFile(caminho);
      if (jpg.Height >= jpg.Width) AND (HeightL <= jpg.Height) then begin
        scale := widthL / jpg.Height;
      end else if (jpg.Height <= jpg.Width) AND (widthL <=  jpg.Width) then begin
        scale := HeightL / jpg.Width;
      end else begin
        verdd := true;
      end;
          bmp := TBitmap.Create;
          try
            {Create thumbnail bitmap, keep pictures aspect ratio}
            bmp.SetSize( widthL,HeightL);
            if not verdd then begin
                pt1 := (widthL - Round(jpg.Width * scale)) div 2;
                pt2 := (HeightL - Round(jpg.Height * scale)) div 2;
                pt3 := Round(jpg.Width * scale) + pt1;
                pt4 := Round(jpg.Height * scale) + pt2;
                bmp.Canvas.StretchDraw(Rect(pt1, pt2, pt3, pt4), jpg);
            end else begin
                pt1 := (widthL - jpg.Width) div 2;
                pt2 := (HeightL - jpg.Height) div 2;
                pt3 := jpg.Width + pt1;
                pt4 := jpg.Height + pt2;
                bmp.Canvas.StretchDraw(Rect(pt1, pt2, pt3, pt4), jpg);
            end;

            {Convert back to JPEG and save to file}
            jpg.Assign(bmp);
            imgCor.Canvas.Draw(0,0,jpg);
          finally
            bmp.free;
          end;
    finally
      jpg.free;
    end;
  except
    on e :Exception do
       avisar('Erro ao redimensionar imagem.'+#13#10+e.Message);
  end;
end;

end.
