unit uBuscaCodigoBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, frameBuscaCor, Funcoes,
  DBClient, frameBuscaProduto, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmBuscaCodigoBarras = class(TfrmPadrao)
    gbProduto: TGroupBox;
    BuscaProduto1: TBuscaProduto;
    gbCor: TGroupBox;
    BuscaCor1: TBuscaCor;
    rgTamanhos: TRadioGroup;
    lblTitulo: TLabel;
    edtCodigoBarras: TEdit;
    lblInfo: TLabel;
    Panel1: TPanel;
    btnSair: TBitBtn;
    pnlQtd: TPanel;
    edtQtdMax: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtQtdRepor: TEdit;
    lbBuscado: TLabel;
    btnconfirma: TSpeedButton;
    btnCopia: TBitBtn;
    btnBuscar: TSpeedButton;
    qry: TFDQuery;
    dsEstoque: TDataSource;
    cdsEstoque: TClientDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    FloatField1: TFloatField;
    Shape2: TShape;
    Shape1: TShape;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    procedure btnBuscarClick(Sender: TObject);
    procedure gbCorEnter(Sender: TObject);
    procedure btnCopiaClick(Sender: TObject);
    procedure edtCodigoBarrasEnter(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtQtdReporKeyPress(Sender: TObject; var Key: Char);
    procedure rgTamanhosClick(Sender: TObject);
    procedure edtQtdReporChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BuscaCor1Exit(Sender: TObject);
    procedure edtCodigoBarrasChange(Sender: TObject);
    procedure BuscaCor1Enter(Sender: TObject);
    procedure BuscaProduto1edtDescricaoChange(Sender: TObject);
    procedure BuscaCor1edtDescricaoChange(Sender: TObject);
  private
    FCDS   :TClientDataSet;
    FTamanho :String;

    procedure disponibiliza_tamanhos;
    procedure item_por_codigo_barras(var codigo_produto, codigo_cor :integer; var tamanho :String; var masculino_feminino :String);
    function buscar_codigoBarras :String;
    function verificaObrigatorios :Boolean;
    procedure buscaTelaBusca;
    procedure buscaSelf;
    procedure buscaCB;
    procedure buscaEstoque;
    procedure subtrai_estoque_reservado;

  public
    constructor CreateParaBusca(AOwner :TComponent;
                                referencia_produto :String;
                                const referencia_cor :String = '';
                                const tamanho :String = '');

    constructor CreateParaSelecao(AOwner :TComponent;
                                  cdsItens :TClientDataSet;
                                  linha :Integer);

  end;

var
  frmBuscaCodigoBarras: TfrmBuscaCodigoBarras;

implementation

uses uModulo, CriaBalaoInformacao, StrUtils;

{$R *.dfm}

{ TfrmPadrao2 }

constructor TfrmBuscaCodigoBarras.CreateParaBusca(AOwner: TComponent;
  referencia_produto: String; const referencia_cor: String; const tamanho :String);
begin
  inherited Create(AOwner);
  self.BuscaProduto1.codproduto  := referencia_produto;
  disponibiliza_tamanhos;

  if referencia_cor <> '' then
    self.BuscaCor1.codCor          := referencia_cor;

  self.FTamanho                  := tamanho;

  BuscaCor1.tamanho    := tamanho;
  BuscaCor1.codProduto := BuscaProduto1.CodigoProduto;
  BuscaCor1.edtDescricao.OnChange := BuscaCor1edtDescricaoChange;
end;

procedure TfrmBuscaCodigoBarras.disponibiliza_tamanhos;
begin
  if BuscaProduto1.edtDescricao.Text = '' then begin
    avisar('Favor selecionar o produto');
    BuscaProduto1.edtReferencia.SetFocus;
    exit;
  end;

  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select gt.codtamanho, t.descricao from grade_tamanhos gt '+
                              'left join tamanhos t on t.codigo = gt.codtamanho         '+
                              'where gt.codgrade = :codgrade';
  fdm.qryGenerica.ParamByName('codgrade').AsInteger := BuscaProduto1.codGrade;
  fdm.qryGenerica.Open;

  rgTamanhos.Items.Clear;
  rgTamanhos.Tag := BuscaProduto1.codGrade;
  fdm.qryGenerica.First;
  while not fdm.qryGenerica.Eof do begin
    rgTamanhos.Items.Add( fdm.qryGenerica.fieldByName('descricao').AsString );

    fdm.qryGenerica.Next;
  end;
end;

procedure TfrmBuscaCodigoBarras.btnBuscarClick(Sender: TObject);
begin  
  if self.Tag = 1 then  buscaTelaBusca
                  else  buscaSelf;
end;

function TfrmBuscaCodigoBarras.buscar_codigoBarras :String;
var codigo_tamanho :integer;
begin
  codigo_tamanho := StrToInt( Campo_por_campo('TAMANHOS','CODIGO','DESCRICAO', rgTamanhos.Items[rgTamanhos.itemIndex]) );
  result := buscaCodigoBarras(BuscaProduto1.CodigoProduto, BuscaCor1.CodigoCor, codigo_tamanho);
end;

procedure TfrmBuscaCodigoBarras.gbCorEnter(Sender: TObject);
begin
  if self.FTamanho <> '' then
    rgTamanhos.ItemIndex := rgTamanhos.Items.IndexOf(self.FTamanho);

  BuscaCor1.edtReferencia.SetFocus;
end;

procedure TfrmBuscaCodigoBarras.btnCopiaClick(Sender: TObject);
begin
  //edtCodigoBarras.SetFocus;
  self.ModalResult := mrOk;
end;

procedure TfrmBuscaCodigoBarras.edtCodigoBarrasEnter(Sender: TObject);
begin
  if rgTamanhos.ItemIndex < 0
   then
     rgTamanhos.Buttons[0].SetFocus
  else if edtCodigoBarras.Text <> ''
   then begin
     edtCodigoBarras.SelectAll;
     edtCodigoBarras.CopyToClipboard;
   end;
end;

procedure TfrmBuscaCodigoBarras.btnConfirmaClick(Sender: TObject);
begin
    if BuscaCor1.edtDescricao.Text = '' then begin
      avisar('Favor selecionar a cor');
      BuscaCor1.edtReferencia.SetFocus;
    end
    else if StrToIntDef(edtQtdRepor.Text ,0) <= 0 then begin
      avisar('Favor informar a quantidade de itens a serem substituídos');
      edtQtdRepor.SetFocus;
    end
    else if edtCodigoBarras.Text = '' then begin
      avisar('Favor informar o código de barras do produto substituto');
      edtCodigoBarras.SetFocus;
    end
    else
      self.ModalResult := MrOk;

end;

procedure TfrmBuscaCodigoBarras.btnSairClick(Sender: TObject);
begin
  self.ModalResult := MrCancel;
end;

procedure TfrmBuscaCodigoBarras.buscaCB;
begin
  if (rgTamanhos.ItemIndex >= 0) and (BuscaCor1.edtDescricao.text <> '') then
    btnBuscar.Click;
end;

constructor TfrmBuscaCodigoBarras.CreateParaSelecao(AOwner: TComponent;
  cdsItens: TClientDataSet; linha: Integer);
var I :integer;
    nomeCampo :String;
    qtd_tamanhos :integer;
begin
  inherited Create(AOwner);

  qtd_tamanhos             := 0;
  self.Tag                 := 1;
  lblTitulo.Caption        := 'Dados do produto a ser substituído';
  lblInfo.Caption          := 'Informe o código de barras do produto substituto:';
  edtCodigoBarras.ReadOnly := false;
  pnlQtd.Visible           := true;
  self.Caption             := 'Busca Produto para Substituição';
  edtQtdRepor.Text         := '0';
  btnConfirma.Visible      := true;
  btnBuscar.Visible        := true;
  btnCopia.Visible         := false;
  label3.Visible           := false;
  shape1.Visible           := false;
  DBGrid2.Visible          := false;

  Self.FCDS                := cdsItens;
  Self.FCDS.RecNo          := linha;

  self.BuscaProduto1.codproduto := self.FCDS.fieldByName('RefPro').AsString;
  self.gbProduto.Enabled        := false;

  self.BuscaCor1.codCor         := self.FCDS.fieldByName('RefCor').AsString;
  self.gbCor.Enabled            := false;

  rgTamanhos.Items.Clear;

  for I := 0 to self.FCDS.Fields.Count - 1 do begin
    nomeCampo := self.FCDS.Fields[I].FieldName;

    if AnsiMatchStr(nomeCampo, ['QTD_RN','QTD_P','QTD_M','QTD_G','QTD_1','QTD_2','QTD_3','QTD_4','QTD_6','QTD_8','QTD_UNICA']) then begin
      if self.FCDS.FieldByName( nomeCampo ).AsInteger > 0 then begin
        rgTamanhos.Items.Add( copy(nomeCampo, pos('_',nomeCampo)+1, 5) );
      end;

      if self.FCDS.FieldByName( nomeCampo+'_O' ).AsInteger > 0 then
        inc(qtd_tamanhos);
    end;

  end;

  rgTamanhos.Tag := qtd_tamanhos;

  BuscaCor1.edtDescricao.OnChange := BuscaCor1edtDescricaoChange;
end;

procedure TfrmBuscaCodigoBarras.edtQtdReporKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TfrmBuscaCodigoBarras.rgTamanhosClick(Sender: TObject);
var tamanho :String;
begin
  if pnlQtd.Visible then begin
    tamanho        := rgTamanhos.Items[rgTamanhos.itemIndex];

       { Se nao teve nenhum item conferido e for o unico tamanho do item (açao para nao zerar a qtde)}
    if (self.FCDS.fieldByName('QTD_'+tamanho).AsInteger = self.FCDS.fieldByName('QTD_'+tamanho+'_O').AsInteger) and
       (rgTamanhos.Tag = 1) then
      edtQtdMax.Text := IntToStr(self.FCDS.fieldByName('QTD_'+tamanho).AsInteger {- 1})
    else
      edtQtdMax.Text := self.FCDS.fieldByName('QTD_'+tamanho).AsString;
  end;

  buscaCB;
end;

procedure TfrmBuscaCodigoBarras.subtrai_estoque_reservado;
var i :integer;
begin

  dm.qryGenerica.Close;
  dm.qryGenerica.SQL.Text := 'select sum(ci.qtd_rn) QTD_RN, sum(ci.qtd_p) QTD_P, sum(ci.qtd_m) QTD_M, sum(ci.qtd_g) QTD_G,    '+
                                  ' sum(ci.qtd_1) QTD_1, sum(ci.qtd_2) QTD_2, sum(ci.qtd_3) QTD_3, sum(ci.qtd_4) QTD_4,            '+
                                  ' sum(ci.qtd_6) QTD_6, sum(ci.qtd_8) QTD_8, sum(ci.qtd_unica) QTD_unica,                         '+
                                  ' pro.referencia REFPRODUTO , cor.referencia REFCOR                       from ITENS i           '+

                                  ' left join conferencia_itens  ci on ci.codigo_item = i.codigo                                   '+
                                  ' left join conferencia_pedido cp on cp.codigo = ci.codigo_conferencia                           '+
                                  ' left join cores              cor on cor.codigo = i.cod_cor                                     '+
                                  ' left join produtos           pro on pro.codigo = i.cod_produto                                 '+

                                  ' where cp.fim < ''01.01.1900'' and i.cod_produto = ' +IntToStr(BuscaProduto1.CodigoProduto) +
                                  '   and cor.codigo = ' +IntToStr(BuscaCor1.CodigoCor) +

                                  ' group by pro.referencia, cor.referencia                                                        '+
                                  ' order by pro.referencia, cor.referencia                                                        ';

  dm.qryGenerica.Open;

  cdsEstoque.Edit;
  for i := 0 to cdsEstoque.Fields.Count - 1 do
    cdsEstoque.Fields[i].AsInteger := cdsEstoque.Fields[i].AsInteger - dm.qryGenerica.Fields[i].AsInteger;

end;

function TfrmBuscaCodigoBarras.verificaObrigatorios: Boolean;
begin
  result := false;

  if BuscaProduto1.edtDescricao.Text = '' then begin
    avisar('Favor selecionar o produto');
    BuscaProduto1.edtReferencia.SetFocus;
  end
  else if BuscaCor1.edtDescricao.Text = '' then begin
    avisar('Favor selecionar a cor');
    BuscaCor1.edtReferencia.SetFocus;
  end
  else if rgTamanhos.ItemIndex < 0 then begin
    avisar('Favor selecionar o tamanho');
    rgTamanhos.SetFocus;
  end
  else
    result := true;
end;

procedure TfrmBuscaCodigoBarras.edtQtdReporChange(Sender: TObject);
begin
  if StrToIntDef(edtQtdRepor.Text,0) > StrToIntDef(edtQtdMax.Text ,0) then
    edtQtdRepor.Text := edtQtdMax.Text;
end;

procedure TfrmBuscaCodigoBarras.FormShow(Sender: TObject);
begin
  if gbProduto.Enabled then
    BuscaProduto1.edtReferencia.SetFocus
  else begin
    if gbCor.Enabled then
      gbCor.SetFocus
    else
      rgTamanhos.SetFocus;
  end;
end;

procedure TfrmBuscaCodigoBarras.BuscaCor1Exit(Sender: TObject);
begin
  if Owner.ClassName = 'TfrmBuscaCodigoBarras' then
    if TFrmBuscaCodigoBarras(Owner).BuscaCor1.edtReferencia.Text = self.BuscaCor1.edtReferencia.Text then begin
      avisar('Para substituição a cor do produto deve ser diferente da atual');
      self.BuscaCor1.limpa;
      self.BuscaCor1.edtReferencia.SetFocus;
    end;
end;

procedure TfrmBuscaCodigoBarras.buscaEstoque;
var i :integer;
begin
  if not cdsEstoque.Active then
    cdsEstoque.CreateDataSet;
  cdsEstoque.EmptyDataSet;
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Add('SELECT TAMANHOS.DESCRICAO AS TAMANHO, ESTOQUE.QUANTIDADE FROM ESTOQUE '+
              'LEFT JOIN PRODUTOS ON PRODUTOS.CODIGO = ESTOQUE.CODIGO_PRODUTO '+
              'LEFT JOIN TAMANHOS ON TAMANHOS.CODIGO = ESTOQUE.CODIGO_TAMANHO '+
              'LEFT JOIN CORES ON CORES.CODIGO = ESTOQUE.CODIGO_COR '+
              'WHERE PRODUTOS.REFERENCIA = '+QuotedStr(BuscaProduto1.edtReferencia.Text)+' AND '+
              'CORES.REFERENCIA='+QuotedStr(BuscaCor1.edtReferencia.Text)+' '+
              'ORDER BY TAMANHOS.CODIGO');
  Qry.Open;
  if Qry.IsEmpty then
    Exit;
  Qry.First;
  while not Qry.Eof do
  begin
    cdsEstoque.Edit;
    for i:= 0 to cdsEstoque.Fields.Count - 1 do
    begin
      if cdsEstoque.Fields[i].FieldName = 'Tam'+Qry.fieldByName('TAMANHO').AsString then
      begin
        cdsEstoque.Fields[i].AsFloat:= cdsEstoque.Fields[i].AsFloat + Qry.fieldByName('QUANTIDADE').AsFloat;
        Break;
      end;
    end;

    cdsEstoque.Post;
    Qry.Next;
  end;

  subtrai_estoque_reservado;
end;

procedure TfrmBuscaCodigoBarras.edtCodigoBarrasChange(Sender: TObject);
var codigo_produto, codigo_cor :integer;
    tamanho, masculino_femininno :String;
begin
  if not pnlQtd.Visible then EXIT;

  if length(TRIM(edtCodigoBarras.Text)) = 13 then begin

    item_por_codigo_barras(codigo_produto, codigo_cor, tamanho, masculino_femininno);
                                                                                              
    if codigo_produto = 0 then begin
      MessageBeep(16);
      Avisar('Código de barras inválido!',0,'S');
      edtCodigoBarras.Clear;
    end
    else if BuscaProduto1.CodigoProduto <> codigo_produto then begin
      MessageBeep(16);
      Avisar('Favor informar um código de barras que se refira ao produto selecionado acima',0, 'S');
      edtCodigoBarras.Clear;
    end
    else if (BuscaProduto1.CodigoProduto = codigo_produto) and
            (BuscaCor1.CodigoCor = codigo_cor)             and
            (rgTamanhos.Items[rgTamanhos.ItemIndex] = tamanho) then begin
      MessageBeep(16);
      Avisar('O código informado pertence ao mesmo produto que está prestes à substituir '+#13#10+
             'Favor informar um válido', 0, 'S');
      edtCodigoBarras.Clear;
    end;

  end;
end;

procedure TfrmBuscaCodigoBarras.item_por_codigo_barras(var codigo_produto,
  codigo_cor: integer; var tamanho: String; var masculino_feminino :String);
begin
  codigo_produto := 0;
  codigo_cor     := 0;

  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := ' select cb.codproduto, cb.codcor, tam.descricao tamanho,           '+
                              ' iif(pc.genero = ''M'',''MASCULINO'',                              '+
                              '      iif(pc.genero = ''F'', ''FEMININO'','''')) GENERO            '+
                              ' from codigo_barras cb                                             '+
                              ' left join tamanhos tam on tam.codigo = cb.codtamanho              '+
                              ' left join produto_cores pc on ( pc.codproduto = cb.codproduto and '+
                              '                                 pc.codcor = cb.codcor)            '+
                              ' where cb.numeracao = :codbar                                      ';

  fdm.qryGenerica.ParamByName('codbar').AsString := TRIM( edtCodigoBarras.Text );
  fdm.qryGenerica.Open;

  if fdm.qryGenerica.IsEmpty then Exit;

  codigo_produto      := fdm.qryGenerica.fieldByName('codproduto').AsInteger;
  codigo_cor          := fdm.qryGenerica.fieldByName('codcor').AsInteger;
  tamanho             := fdm.qryGenerica.fieldByName('tamanho').AsString;
  masculino_feminino  := fdm.qryGenerica.fieldByName('genero').AsString;
end;

procedure TfrmBuscaCodigoBarras.buscaSelf;
begin
  if verificaObrigatorios then
  begin

    edtCodigoBarras.Text := buscar_codigoBarras;
    lbBuscado.Caption    := 'Produto[ '+BuscaProduto1.edtReferencia.Text+
                                 ' ] Cor[ '+BuscaCor1.edtReferencia.Text+
                                 ' ] Tamanho[ '+ rgTamanhos.Items[rgTamanhos.itemIndex]+' ]';

    if edtCodigoBarras.Text = '' then begin
      lbBuscado.Caption := '[]';
      avisar('Código não cadastrado para tais combinações');
    end;

    edtCodigoBarras.SetFocus;

    if DBGrid2.Visible then
      buscaEstoque;
  end;
end;

procedure TfrmBuscaCodigoBarras.buscaTelaBusca;
var frmBuscaCodigoBarras2 :TfrmBuscaCodigoBarras;
begin
  if verificaObrigatorios then
  begin
  frmBuscaCodigoBarras2 := TfrmBuscaCodigoBarras.CreateParaBusca(self, BuscaProduto1.edtReferencia.text, '', rgTamanhos.Items[rgTamanhos.itemIndex]);

  frmBuscaCodigoBarras2.gbProduto.Enabled   := false;
  frmBuscaCodigoBarras2.rgTamanhos.Enabled  := false;

  if frmBuscaCodigoBarras2.ShowModal = mrOk then
    self.edtCodigoBarras.Text := frmBuscaCodigoBarras2.edtCodigoBarras.Text;

  frmBuscaCodigoBarras2.Release;
  frmBuscaCodigoBarras2 := nil;

  edtQtdRepor.SetFocus;
  TCriaBalaoInformacao.ShowBalloonTip(edtQtdRepor.Handle, 'Informe a quantidade que será substituida.', 'Informação', 1);

  end;
end;

procedure TfrmBuscaCodigoBarras.BuscaCor1edtDescricaoChange(Sender: TObject);
begin
  buscaCB;
end;

procedure TfrmBuscaCodigoBarras.BuscaCor1Enter(Sender: TObject);
begin
   BuscaCor1.FiltroProduto := BuscaProduto1.codproduto;
end;

procedure TfrmBuscaCodigoBarras.BuscaProduto1edtDescricaoChange(
  Sender: TObject);
begin
  if BuscaProduto1.codGrade <> rgTamanhos.Tag then
    self.disponibiliza_tamanhos;
end;

end.
