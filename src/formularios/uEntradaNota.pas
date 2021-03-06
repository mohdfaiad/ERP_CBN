unit uEntradaNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ACBrNFe, ACBrNFeNotasFiscais, Repositorio,
  FabricaRepositorio, NotaFiscal, NaturezaOperacao, TipoSerie, Pessoa, ItemNotaFiscal,
  TotaisNotaFiscal, Empresa, TipoRegimeTributario, ExtCtrls, DB, DBClient, pcnNFe,
  Grids, DBGrids, DBGridCBN, ImgList, Menus, ACBrBase, ACBrDFe, System.ImageList, contnrs, FireDAC.Comp.Client;

type

   TMinhaJanelaHint = class(THintWindow)
   public
       procedure doActivateHint(Sender: TObject);
end;

type

   TCellGrid = class(Grids.TCustomGrid);

type
  TfrmEntradaNota = class(TfrmPadrao)
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtCaminhoXml: TEdit;
    BitBtn1: TBitBtn;
    btnImportarNota: TBitBtn;
    SpeedButton1: TSpeedButton;
    GroupBox2: TGroupBox;
    fornecedor_no: TImage;
    fornecedor_yes: TImage;
    Nota_no: TImage;
    Nota_yes: TImage;
    Label3: TLabel;
    Shape1: TShape;
    cdsMaterias: TClientDataSet;
    dsMaterias: TDataSource;
    ACBrNFe: TACBrNFe;
    ImageList1: TImageList;
    lbFornecedor: TLabel;
    lbNota: TLabel;
    lbInfoFornecedor: TLabel;
    lbInfoNota: TLabel;
    btnInfoFornecedor: TSpeedButton;
    btnInfoNota: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    PopupCorrecoes: TPopupMenu;
    Associarumamatria1: TMenuItem;
    Cadastrarmatria1: TMenuItem;
    AssociarumCFOP1: TMenuItem;
    CadastrarCFOPcorrespondente1: TMenuItem;
    btnLimpa: TSpeedButton;
    Label4: TLabel;
    edtCST: TEdit;
    btnAtuliza: TBitBtn;
    cdsMateriasCODMAT_FORNECEDOR: TStringField;
    cdsMateriasCODMAT_ERP: TIntegerField;
    cdsMateriasDESCRICAO: TStringField;
    cdsMateriasCFOP: TIntegerField;
    cdsMateriasVALIDADO: TStringField;
    GridMaterias: TDBGrid;
    ppmalteraCFOP: TPopupMenu;
    AlterarCFOP1: TMenuItem;
    Label5: TLabel;
    cdsMateriasUNID_NOTA: TStringField;
    cdsMateriasUNID_ENTRADA: TStringField;
    cdsMateriasCOD_UNID_ENT_SAI: TIntegerField;
    CadastrarUnidadeCorrespondente1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnImportarNotaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInfoFornecedorClick(Sender: TObject);
    procedure btnInfoNotaClick(Sender: TObject);
    procedure cdsMateriasAfterScroll(DataSet: TDataSet);
    procedure Associarumamatria1Click(Sender: TObject);
    procedure Cadastrarmatria1Click(Sender: TObject);
    procedure btnLimpaClick(Sender: TObject);
    procedure AssociarumCFOP1Click(Sender: TObject);
    procedure CadastrarCFOPcorrespondente1Click(Sender: TObject);
    procedure btnAtulizaClick(Sender: TObject);
    procedure GridMateriasCellClick(Column: TColumn);
    procedure GridMateriasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridMateriasMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtCSTKeyPress(Sender: TObject; var Key: Char);
    procedure GridMateriasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AlterarCFOP1Click(Sender: TObject);
    procedure CadastrarUnidadeCorrespondente1Click(Sender: TObject);

  private
    FCodigoFornecedor :integer;
  private
    function MateriaCadastrada(produtoNfe :TProd) :Integer;
    function fornecedorCadastrado: Boolean;
    function  Nota_ja_importada(numero_nota, cod_emitente, serie: integer) :Boolean;
    function  associar_produto(produtoNfe :TProd)    :Boolean;
    function  cadastrar_produto(produtoNfe :TProd)   :Boolean;
    function  associar_cfop(codigo_natureza :integer) :Boolean;
    function  cadastrar_cfop(codigo_natureza :integer) :Boolean;
    procedure cadastrar_unidade_na_materia;

    procedure salvaAssociacaoProduto(codigo_materia :integer; codigo_produto_fornecedor :String);
    procedure salvaAssociacaoCFOP(codigo_cfop, codigo_cfop_correspondente :Integer);

    procedure carrega_nota;
    procedure altera_cfop;
    function gerarContasAPagar :Boolean;
    procedure setaUnidadeEntrada(unidadeNota :String);

    procedure mouseToCell(X, Y: integer; var ACol, ARow: longint);
  private
    Validacoes :integer;

  public
    MeuHint: TMinhaJanelaHint;

  end;

var
  frmEntradaNota: TfrmEntradaNota;

const
  validacao_CFOP    = 'N�o existe um CFOP correspondente cadastrado para o CFOP = ';
  validacao_materia = 'N�o existe uma mat�ria correspondente vinculada � mat�ria = ';

implementation

uses importadorNotaXML, uCadastroFornecedor, PermissoesAcesso, Funcoes,
  Math, uModulo, StrUtils, uCadastroMateria, MateriaFornecedor, CFOPCorrespondente,
  uCadastroNaturezaOperacao, uContasPagar, uCadastroPadrao, EspecificacaoUnidadesEntSaiPorCodigoProduto, Materia, UnidadeEntSai;

{$R *.dfm}

procedure TfrmEntradaNota.BitBtn1Click(Sender: TObject);
var
  Dialog :TOpenDialog;
begin
    Dialog            := TOpenDialog.Create(nil);
    Dialog.Title      := 'Selecione a Nota';
    Dialog.DefaultExt := 'xml';
    Dialog.Filter     := 'XML Nota de Entrada | *.xml';

    if Dialog.Execute then begin
      btnLimpa.Click;
      edtCaminhoXml.Text := Dialog.FileName;
      carrega_nota;
      btnImportarNota.SetFocus;
    end;
end;

procedure TfrmEntradaNota.btnImportarNotaClick(Sender: TObject);
var importador :TImportadorNotaXML;
begin
  if trim(edtCaminhoXml.Text) = '' then begin
    avisar('Nenhuma arquivo ''.xml'' foi selecionado!');
    exit;
  end
  else if Validacoes > 0 then begin
    avisar('ATENC�O! Ainda existem itens n�o validados.');
    exit;
  end;

  try
  try
    Fdm.conexao.TxOptions.AutoCommit      := false;

    importador := TImportadorNotaXML.Create(edtCaminhoXml.Text,
                                            edtCST.Text,
                                            StrToInt(trim(copy(lbFornecedor.Caption, 1,
                                            pos('-',lbFornecedor.Caption)-1)) ),
                                            cdsMaterias);
    importador.XMLparaNFe;

    if confirma('Deseja gerar contas a pagar?' +#13#10+ 'fornecedor: '+lbFornecedor.Caption) then
      if not gerarContasAPagar then
        raise Exception.Create('Falha ao criar contas a pagar. Opera��o abortada.');

    Avisar('Nota Fiscal importada com sucesso!');
    btnLimpa.Click;

    Fdm.conexao.Commit;
  except
    on e : Exception do
      begin
        Fdm.conexao.Rollback;
        Avisar(e.Message);
      end;
  end;

  finally
    Fdm.conexao.TxOptions.AutoCommit      := true;
    FreeAndNil(importador);
  end;

end;

procedure TfrmEntradaNota.carrega_nota;
var nX :integer;
 texto :String;
 codigo_natureza :String;
begin
  self.AcbrNfe.NotasFiscais.Clear;
  self.AcbrNfe.NotasFiscais.LoadFromFile(self.edtCaminhoXml.Text);

  if not fornecedorCadastrado then begin
    lbInfoFornecedor.Caption := 'Fornecedor '+AcbrNfe.NotasFiscais.Items[0].NFe.Emit.xNome+' [ CNPJ: '+AcbrNfe.NotasFiscais.Items[0].NFe.Emit.CNPJCPF+
                                ' | IE: ' + AcbrNfe.NotasFiscais.Items[0].NFe.Emit.IE + #13#10+' n�o consta no cadastro. Favor cadastrar.';
    fornecedor_yes.Visible  := false;
    inc(Validacoes);
    exit;
  end
  else begin
    lbInfoFornecedor.Caption := 'Fornecedor v�lido.';
    fornecedor_yes.Visible  := true;
  end;

  if fornecedor_yes.Visible and Nota_ja_importada( AcbrNfe.NotasFiscais.Items[0].NFe.Ide.nNF,
                                                   FCodigoFornecedor,
                                                   AcbrNfe.NotasFiscais.Items[0].NFe.Ide.serie) then begin
    lbInfoNota.Caption := 'Nota Fiscal de N� '+ intToStr(AcbrNfe.NotasFiscais.Items[0].NFe.Ide.nNF)+', referente ao fornecedor:'+#13#10+#13#10+
                          '( '+lbFornecedor.Caption+')  j� foi importada!';
    Nota_yes.Visible  := false;
    inc(Validacoes);
  end
  else if fornecedor_yes.Visible then begin
    lbInfoNota.Caption := 'Importa��o liberada.';
    Nota_yes.Visible  := true;
  end;

  for nX := 0 to (AcbrNfe.NotasFiscais.Items[0] as ACBrNFeNotasFiscais.NotaFiscal).NFe.Det.Count - 1 do begin

    cdsMaterias.Append;

    texto := AcbrNfe.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.cProd;
    cdsMateriasCODMAT_FORNECEDOR.AsString := texto;
    cdsMateriasDESCRICAO.AsString         := AcbrNfe.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.xProd;
    cdsMateriasCODMAT_ERP.asInteger       := self.MateriaCadastrada( (AcbrNfe.NotasFiscais.Items[0] as ACBrNFeNotasFiscais.NotaFiscal).NFe.Det.Items[nX].Prod );

    codigo_natureza := buscaCFOPCorrespondente( AcbrNfe.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.CFOP );

    cdsMateriasCFOP.AsInteger             := StrToIntDef( IfThen(codigo_natureza = '', '', CFOP_por_codigo_natureza(StrToInt(codigo_natureza))) ,0);

    cdsMateriasUNID_NOTA.AsString         := FloatToStr(AcbrNfe.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.qCom) +' '+ AcbrNfe.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.uCom;

    if cdsMateriasCODMAT_ERP.asInteger > 0 then
      setaUnidadeEntrada(AcbrNfe.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.uCom);

    cdsMateriasVALIDADO.asString          := IfThen((cdsMateriasCODMAT_ERP.AsInteger > 0)and(cdsMateriasCFOP.AsInteger > 0)and(cdsMateriasUNID_ENTRADA.AsString <> ''), 'S', 'N');

    if cdsMateriasCODMAT_ERP.AsInteger = 0 then
      inc(Validacoes);

    if cdsMateriasCFOP.AsInteger = 0 then
      inc(Validacoes);

    if cdsMateriasUNID_ENTRADA.AsString = '' then
      inc(Validacoes);

    cdsMaterias.Post;
  end;

  cdsMaterias.First;
end;

procedure TfrmEntradaNota.SpeedButton1Click(Sender: TObject);
begin
  try
     self.AbreForm(TfrmCadastroFornecedor, paCadastroRepresentante);
  except
    on e : Exception do
      begin
        Avisar(e.Message);
      end;                                                               
  end;
end;

procedure TfrmEntradaNota.FormCreate(Sender: TObject);
begin
  inherited;
  cdsMaterias.CreateDataSet;
  Validacoes := 0;
  MeuHint := TMinhaJanelaHint.Create(Self);
end;

function TfrmEntradaNota.MateriaCadastrada(produtoNfe: TProd): Integer;
begin
  dm.qryGenerica.Close;
  dm.qryGenerica.SQL.Text := 'SELECT CODIGO_MATERIA FROM MATERIA_FORNECEDOR                      '+
                             ' WHERE CODIGO_FORNECEDOR = :CF AND CODIGO_MATERIA_FORNECEDOR = :CMF';

  dm.qryGenerica.ParamByName('CF').AsInteger   := StrToInt(trim(copy(lbFornecedor.Caption, 1 ,pos('-',lbFornecedor.Caption)-1)) );
  dm.qryGenerica.ParamByName('CMF').AsString   := produtoNfe.cProd;
  dm.qryGenerica.Open;

  Result := IfThen( dm.qryGenerica.IsEmpty, 0, dm.qryGenerica.fieldByName('codigo_materia').AsInteger);
end;

function TfrmEntradaNota.fornecedorCadastrado: Boolean;
begin
  dm.qryGenerica.Close;
  dm.qryGenerica.SQL.Text := 'SELECT CODIGO, RAZAO FROM PESSOAS WHERE CPF_CNPJ = :CPF_CNPJ AND TIPO = ''F'' ';
  dm.qryGenerica.ParamByName('CPF_CNPJ').AsString := AcbrNfe.NotasFiscais.Items[0].NFe.Emit.CNPJCPF;
  dm.qryGenerica.Open;

  if not dm.qryGenerica.IsEmpty then
  begin
    lbFornecedor.Caption := dm.qryGenerica.fieldByName('CODIGO').AsString + ' - ' + dm.qryGenerica.fieldByName('RAZAO').AsString;
    FCodigoFornecedor    := dm.qryGenerica.fieldByName('CODIGO').AsInteger;
  end
  else
    lbFornecedor.Caption := AcbrNfe.NotasFiscais.Items[0].NFe.Emit.xNome;

  result := not (dm.qryGenerica.IsEmpty);
end;

procedure TfrmEntradaNota.btnInfoFornecedorClick(Sender: TObject);
begin
  avisar(lbInfoFornecedor.Caption);
end;

procedure TfrmEntradaNota.btnInfoNotaClick(Sender: TObject);
begin
  avisar(lbInfoNota.Caption);
end;

function TfrmEntradaNota.Nota_ja_importada(numero_nota, cod_emitente, serie: integer): Boolean;
var qry :TFDQuery;
begin
  try
    Result := true;
    qry := dm.GetConsulta('SELECT CODIGO FROM NOTAS_FISCAIS WHERE NUMERO_NOTA_FISCAL = :NNOTA AND CODIGO_EMITENTE = :CODEMIT AND SERIE = :SERIE');
    qry.ParamByName('NNOTA').AsInteger   := numero_nota;
    qry.ParamByName('CODEMIT').AsInteger := cod_emitente;
    qry.ParamByName('SERIE').AsInteger   := serie;
    qry.Open;

    Result := not qry.IsEmpty;
  finally
    FreeAndNil(qry);
  end;
end;

function TfrmEntradaNota.associar_produto(produtoNfe: TProd): Boolean;
begin
  try
    result := true;
    frmCadastroMateria := TfrmCadastroMateria.CreateModoBusca(nil);
    frmCadastroMateria.ShowModal;

    if (frmCadastroMateria.ModalResult = mrOK) then begin
      salvaAssociacaoProduto(frmCadastroMateria.cdsCODIGO.AsInteger, produtoNfe.cProd);

      cdsMaterias.Edit;
      cdsMateriasCODMAT_ERP.AsInteger := frmCadastroMateria.cdsCODIGO.AsInteger;
      cdsMateriasVALIDADO.AsString    := IfThen(cdsMateriasCFOP.AsInteger > 0, 'S', 'N');
      cdsMaterias.Post;

      btnAtuliza.Click;
    end
    else
      result := false;

  except
    result := false;
  end;
end;

function TfrmEntradaNota.cadastrar_produto(produtoNfe: TProd): Boolean;
var codigo_produto :integer;
begin
  frmCadastroMateria := TFrmCadastroMateria.Create(nil);
  frmCadastroMateria.produtoNfe := produtoNfe;
  frmCadastroMateria.ShowModal;

  if frmCadastroMateria.ModalResult = MrOk then begin
    Result         := true;
    codigo_produto := strToInt( Maior_Valor_Cadastrado('MATERIAS','CODIGO'));

    salvaAssociacaoProduto( codigo_produto ,produtoNfe.cProd);

    cdsMaterias.Edit;
    cdsMateriasCODMAT_ERP.AsInteger := codigo_produto;
    cdsMateriasVALIDADO.AsString    := IfThen(cdsMateriasCFOP.AsInteger > 0, 'S', 'N');
    cdsMaterias.Post;

    btnAtuliza.Click;    
  end
  else
    result := false;

  frmCadastroMateria.Release;
end;

procedure TfrmEntradaNota.cadastrar_unidade_na_materia;
begin
  frmCadastroMateria := TFrmCadastroMateria.Create(nil,cdsMateriasCODMAT_ERP.AsInteger, AcbrNfe.NotasFiscais.Items[0].NFe.Det.Items[ cdsMaterias.recno -1 ].Prod.uCom);
  frmCadastroMateria.ShowModal;

  if frmCadastroMateria.ModalResult = MrOk then
    btnAtuliza.Click;

  frmCadastroMateria.Release;
end;

procedure TfrmEntradaNota.salvaAssociacaoProduto(codigo_materia: integer; codigo_produto_fornecedor: String);
var
    MateriaFornecedor  :TMateriaFornecedor;
    repositorio        :TRepositorio;
begin
  try
  try
    repositorio       := TFabricaRepositorio.GetRepositorio(TMateriaFornecedor.ClassName);
    MateriaFornecedor := TMateriaFornecedor.Create;


    MateriaFornecedor.codigo_materia            := codigo_materia;
    MateriaFornecedor.codigo_fornecedor         := StrToInt( trim(copy(lbFornecedor.Caption, 1 ,pos('-',lbFornecedor.Caption)-1)) );
    MateriaFornecedor.codigo_materia_fornecedor := codigo_produto_fornecedor;

    repositorio.Salvar(MateriaFornecedor);

  Except
    raise Exception.Create('Erro ao salvar associa��o');
  end;
  Finally
    FreeAndNil(MateriaFornecedor);
    FreeAndNil(repositorio);
  end;
end;

procedure TfrmEntradaNota.setaUnidadeEntrada(unidadeNota: String);
var repositorio :TRepositorio;
    materia :TMateria;
    i :integer;
    qtdEntrada :Real;
begin
  repositorio   := nil;
  materia       := nil;
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TMateria.ClassName);
    materia     := TMateria(repositorio.Get(cdsMateriasCODMAT_ERP.AsInteger));

    qtdEntrada  := StrToFloat(copy(cdsMateriasUNID_NOTA.AsString,1,pos(' ',cdsMateriasUNID_NOTA.AsString)-1));
    if not materia.controla_estoque then
    begin
       cdsMateriasUNID_ENTRADA.AsString := floatToStr(qtdEntrada)+' '+unidadeNota;
    end
    else
    begin
      for i := 0 to materia.UnidadesEntSai.Count-1 do
      begin
        if (UpperCase(TUnidadeEntSai(materia.UnidadesEntSai.Items[i]).unidade_movimento) = UpperCase(unidadeNota)) and
           (TUnidadeEntSai(materia.UnidadesEntSai.Items[i]).tipo = 'E') then
        begin
          cdsMateriasUNID_ENTRADA.AsString := floatToStr(qtdEntrada * TUnidadeEntSai(materia.UnidadesEntSai.Items[i]).quantidade)+' '+ TUnidadeEntSai(materia.UnidadesEntSai.Items[i]).unidade_sistema;
          cdsMateriasCOD_UNID_ENT_SAI.AsInteger := TUnidadeEntSai(materia.UnidadesEntSai.Items[i]).codigo;
        end;
      end;
    end;

  finally
    FreeAndNil(repositorio);
    FreeAndNil(materia);
  end;
end;

procedure TfrmEntradaNota.cdsMateriasAfterScroll(DataSet: TDataSet);
begin
  Associarumamatria1.Visible              := (cdsMateriasCODMAT_ERP.AsInteger = 0);
  Cadastrarmatria1.Visible                := (cdsMateriasCODMAT_ERP.AsInteger = 0);
  AssociarumCFOP1.Visible                 := (cdsMateriasCFOP.AsInteger = 0);
  CadastrarCFOPcorrespondente1.Visible    := (cdsMateriasCFOP.AsInteger = 0);
  CadastrarUnidadeCorrespondente1.Visible := (cdsMateriasUNID_ENTRADA.AsString = '');
end;

procedure TfrmEntradaNota.Associarumamatria1Click(Sender: TObject);
begin
 if self.associar_produto( AcbrNfe.NotasFiscais.Items[0].NFe.Det.Items[ cdsMaterias.recno -1 ].Prod ) then
//   dec(Validacoes);
end;

procedure TfrmEntradaNota.Cadastrarmatria1Click(Sender: TObject);
begin
 if self.cadastrar_produto( AcbrNfe.NotasFiscais.Items[0].NFe.Det.Items[ cdsMaterias.recno -1 ].Prod ) then
  // dec(Validacoes);
end;

procedure TfrmEntradaNota.CadastrarUnidadeCorrespondente1Click(Sender: TObject);
begin
  cadastrar_unidade_na_materia;
end;

procedure TfrmEntradaNota.btnLimpaClick(Sender: TObject);
begin
  edtCaminhoXml.Clear;
  lbFornecedor.Caption     := '<Fornecedor>';
  lbNota.Caption           := '<Nota>';
  fornecedor_yes.Visible   := true;
  Nota_yes.Visible         := true;
  lbInfoFornecedor.Caption := '...';
  lbInfoNota.Caption       := '...';
  cdsMaterias.EmptyDataSet;
  Validacoes               := 0;
end;

function TfrmEntradaNota.associar_cfop(codigo_natureza: integer): Boolean;
begin
  try
    result                      := true;
    frmCadastroNaturezaOperacao := TfrmCadastroNaturezaOperacao.CreateModoBusca(nil);
    frmCadastroNaturezaOperacao.filtra_cfop_entrada := true;
    frmCadastroNaturezaOperacao.ShowModal;

    if (frmCadastroNaturezaOperacao.ModalResult = mrOK) then begin
      salvaAssociacaoCFOP(codigo_natureza, frmCadastroNaturezaOperacao.cdsCODIGO.AsInteger);

      cdsMaterias.Edit;
      cdsMateriasCFOP.AsInteger       := frmCadastroNaturezaOperacao.cdsCFOP.AsInteger;
      cdsMateriasVALIDADO.AsString    := IfThen(cdsMateriasCODMAT_ERP.AsInteger > 0, 'S', 'N');
      cdsMaterias.Post;

      btnAtuliza.Click;      
    end
    else
      result := false

  except
    result := false;
  end;
end;

function TfrmEntradaNota.cadastrar_cfop(codigo_natureza: integer): Boolean;
begin
  frmCadastroNaturezaOperacao := TfrmCadastroNaturezaOperacao.Create(nil);
  frmCadastroNaturezaOperacao.cadastro_correspondente := true;
  frmCadastroNaturezaOperacao.ShowModal;

  if frmCadastroNaturezaOperacao.ModalResult = MrOk then begin
    Result := true;
    salvaAssociacaoCFOP( codigo_natureza , strToInt( Maior_Valor_Cadastrado('NATUREZAS_OPERACAO','CODIGO')));

    cdsMaterias.Edit;
    cdsMateriasCFOP.AsString     := AcbrNfe.NotasFiscais.Items[0].NFe.Det.Items[ cdsMaterias.RecNo-1 ].Prod.CFOP;
    cdsMateriasVALIDADO.AsString := IfThen(cdsMateriasCODMAT_ERP.AsInteger > 0, 'S', 'N');
    cdsMaterias.Post;

    btnAtuliza.Click;
  end
  else
    result := false;

  frmCadastroNaturezaOperacao.Release;
end;

procedure TfrmEntradaNota.AssociarumCFOP1Click(Sender: TObject);
var codigo_natureza :integer;
begin
  codigo_natureza := StrToIntDef(campo_por_campo('NATUREZAS_OPERACAO','CODIGO','CFOP',
                                                 AcbrNfe.NotasFiscais.Items[0].NFe.Det.Items[ cdsMaterias.RecNo-1 ].Prod.CFOP) ,0);

  if self.associar_cfop(codigo_natureza) then

end;

procedure TfrmEntradaNota.CadastrarCFOPcorrespondente1Click(Sender: TObject);
var codigo_natureza :integer;
begin
 codigo_natureza := StrToIntDef( campo_por_campo('NATUREZAS_OPERACAO','CODIGO','CFOP',
                                                 AcbrNfe.NotasFiscais.Items[0].NFe.Det.Items[ cdsMaterias.RecNo-1 ].Prod.CFOP) ,0);
                                    
  if self.cadastrar_cfop(codigo_natureza) then

end;

procedure TfrmEntradaNota.salvaAssociacaoCFOP(codigo_cfop, codigo_cfop_correspondente: Integer);
var
    CFOPCorrespondente  :TCFOPCorrespondente;
    repositorio         :TRepositorio;
begin
  try
  try
    repositorio        := TFabricaRepositorio.GetRepositorio(TCFOPCorrespondente.ClassName);
    CFOPCorrespondente := TCFOPCorrespondente.Create;


    CFOPCorrespondente.cod_CFOP_Saida       := codigo_cfop;
    CFOPCorrespondente.cod_CFOP_Entrada     := codigo_cfop_correspondente;

    repositorio.Salvar(CFOPCorrespondente);

  Except
    raise Exception.Create('Erro ao salvar associa��o');
  end;
  Finally
    FreeAndNil(CFOPCorrespondente);
    FreeAndNil(repositorio);
  end;
end;

procedure TfrmEntradaNota.btnAtulizaClick(Sender: TObject);
var caminho :String;
begin
  FCodigoFornecedor := 0;
  if edtCaminhoXml.Text <> '' then begin
    caminho := edtCaminhoXml.Text;
    btnLimpa.Click;
    edtCaminhoXml.Text := caminho;
    carrega_nota;
    btnImportarNota.SetFocus;
  end;
end;

procedure TfrmEntradaNota.GridMateriasCellClick(Column: TColumn);
begin
  if (cdsMateriasCODMAT_ERP.AsInteger = 0) or (cdsMateriasCFOP.AsInteger = 0) or (cdsMateriasUNID_ENTRADA.AsString = '')then
    PopupCorrecoes.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmEntradaNota.GridMateriasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  if gdSelected in State then
    GridMaterias.Canvas.Brush.Color := $00D79844;

  if not odd(cdsMaterias.RecNo) then
    if not (gdSelected in State) then
      begin
        GridMaterias.Canvas.Brush.Color := clMoneyGreen;
        GridMaterias.Canvas.FillRect(Rect);
//        GridMaterias.DefaultDrawDataCell(rect,Column.Field,state);
      end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

  if Column.Field = cdsMateriasVALIDADO then begin
    TDBGridCBN(Sender).Canvas.Brush.Color := clWhite;
    TDBGridCBN(Sender).Canvas.FillRect(Rect);

    if cdsMateriasVALIDADO.asString = 'S' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +12, Rect.Top , 0, true)
    else
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +12, Rect.Top , 1, true);
  end;

end;

procedure TfrmEntradaNota.mouseToCell(X, Y: integer; var ACol, ARow: Integer);
var
   Coord: TGridCoord;
begin
  Coord := GridMaterias.MouseCoord(X,Y);
  ACol := Coord.X;
  ARow := Coord.Y;
end;

{ TMinhaJanelaHint }

procedure TMinhaJanelaHint.doActivateHint(Sender: TObject);
var
   r : TRect;
   wdth_hint, hght_hint : integer;
begin
   if (Sender is TDbGrid) then
   begin
      // Calculo as dimens�es necess�rias � janela de Hint sendo o limite igual � 1/3 da tela
      r := CalcHintRect((Screen.Width div 3), (Sender as TDbGrid).Hint, nil);
      wdth_hint := r.Right - r.Left;
      hght_hint := r.Bottom - r.Top;
 
      // Reposiciono a janela do Hint para pr�ximo da posi��o do mouse mantendo o tamanho
      // calculado pela rotina anterior
      r.Left := r.Left + mouse.CursorPos.X + 16;
      r.Top := r.Top + mouse.CursorPos.Y + 16;
      r.Right := r.Left + wdth_hint;
      r.Bottom := r.Top + hght_hint;
      // Executo o procedimento para exibi��o do Hint na tela

      ActivateHint(r,(Sender as TDbGrid).Hint);
   end;

end;

procedure TfrmEntradaNota.GridMateriasMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
   MColumn, MRow: Longint;
   MsgHint :String;
begin
   if cdsMaterias.IsEmpty then
     exit;
     
   MsgHint := '';
   // A partir da posi��o do mouse obtemos a coordenada da c�lula do grid
   MouseToCell(X,Y,MColumn,MRow);
   // Se for uma c�lula v�lida ...
   if (MRow > 0) and (MColumn >3) and (Mcolumn <= GridMaterias.Columns.Count) then
   begin
      // Fazemos a coluna do Grid ser a coluna apontada pelo mouse, para isso usamos a classe amiga
      // definida no come�o da unit
      TCellGrid(GridMaterias).Col := MColumn;
 
      // Movemos o DataSet para a linha apontada pelo mouse deslocando em rela��o � sua posi��o
      // anterior
      GridMaterias.DataSource.DataSet.MoveBy(MRow - TCellGrid(GridMaterias).Row);
 
      // Se o dado apontado n�o for do tipo String nem Variant n�o apresentamos o Hint
      if cdsMaterias.FieldByName('VALIDADO').AsString = 'S' then begin
         GridMaterias.Hint := '';
         MeuHint.ReleaseHandle;
         Exit;
      end;
      // Passamos o conte�do do campo para o Hint do Grid e chamamos a fun��o para exibi-lo

      if TClientDataSet(GridMaterias.DataSource.DataSet).FieldByName('CFOP').AsInteger = 0 then
        MsgHint := validacao_CFOP + AcbrNfe.NotasFiscais.Items[0].NFe.Det.Items[ cdsMaterias.RecNo-1 ].Prod.CFOP+#13#10;

      if TClientDataSet(GridMaterias.DataSource.DataSet).FieldByName('CODMAT_ERP').AsInteger = 0 then
        MsgHint := MsgHint + IfThen(MsgHint = '','',#13#10)+validacao_materia +#13#10+
                            TClientDataSet(GridMaterias.DataSource.DataSet).FieldByName('DESCRICAO').AsString;

      GridMaterias.Hint := MsgHint;

      MeuHint.doActivateHint(GridMaterias);
   end
  else
   begin
      // Se n�o for c�lula v�lida limpo o Hint
      GridMaterias.Hint := '';
      MeuHint.ReleaseHandle;
    end;

end;

procedure TfrmEntradaNota.edtCSTKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TfrmEntradaNota.GridMateriasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_F2 then
    altera_cfop;
end;

procedure TfrmEntradaNota.AlterarCFOP1Click(Sender: TObject);
begin
  inherited;
  altera_cfop;
end;

procedure TfrmEntradaNota.altera_cfop;
var CFOP :String;
begin
  frmCadastroNaturezaOperacao := TfrmCadastroNaturezaOperacao.CreateModoBusca(nil);

  try
    if (frmCadastroNaturezaOperacao.ShowModal = mrOK) then
      CFOP  := frmCadastroNaturezaOperacao.cdsCFOP.AsString
    else
      exit;

    cdsMaterias.Edit;
    cdsMateriasCFOP.AsString := CFOP;
    cdsMaterias.Post;

  finally
    frmCadastroNaturezaOperacao.Release;
    frmCadastroNaturezaOperacao := nil;
  end;
end;

function TfrmEntradaNota.gerarContasAPagar :Boolean;
var codigoNF :Integer;
begin
  result   := false;
  codigoNF := StrToInt( Maior_Valor_Cadastrado('NOTAS_FISCAIS', 'CODIGO'));

  frmContasPagar := TfrmContasPagar.Create(self);
  frmContasPagar.CodigoNotaFiscal := codigoNF;

  if frmContasPagar.ShowModal = mrOk then
    result := true;

  frmContasPagar.Release;
  frmContasPagar := nil;
end;

end.
