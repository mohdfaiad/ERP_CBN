unit frameBuscaProduto2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ObjetoGenerico, Mask, RxToolEdit, RxCurrEdit,
  system.StrUtils;

type
    TBuscaProduto2 = class(TFrame)
    edtReferencia: TEdit;
    lblReferencia: TStaticText;
    btnBuscaProduto: TBitBtn;
    lblProduto: TStaticText;
    edtDescricao: TEdit;
    edtRefCor: TEdit;
    lblCor: TStaticText;
    btnBuscaCor: TBitBtn;
    edtDescricaoCor: TEdit;
    edtCodTamanho: TEdit;
    lblTamanho: TStaticText;
    btnBuscaTamanho: TBitBtn;
    edtDescricaoTamanho: TEdit;
    lbColecao: TStaticText;
    btnBuscaColecao: TBitBtn;
    edtColecao: TEdit;
    edtCodColecao: TCurrencyEdit;
    procedure btnBuscaProdutoClick(Sender: TObject);
    procedure edtReferenciaChange(Sender: TObject);
    procedure edtReferenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscaCorClick(Sender: TObject);
    procedure edtRefCorChange(Sender: TObject);
    procedure edtRefCorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscaTamanhoClick(Sender: TObject);
    procedure edtCodTamanhoChange(Sender: TObject);
    procedure edtCodTamanhoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodColecaoChange(Sender: TObject);
    procedure edtCodColecaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscaColecaoClick(Sender: TObject);

  private
    Produto: TObjetoGenerico;
    Cor: TObjetoGenerico;
    Colecao : TObjetoGenerico;
    Tamanho: TObjetoGenerico;
    FCodigoProduto: Integer;
    FRefProduto: String;
    FDescricaoProduto: String;
    FCodigoCor: Integer;
    FRefCor: String;
    FCodTamanho: Integer;
    FCodigoColecao :integer;
    FProdutosLoja: boolean;

    procedure SetRefProduto(const Value: String);
    procedure BuscaProduto2;
    procedure SetarProduto(Enter: Boolean);
    procedure BuscaCor2;
    procedure SetarCor(Enter: Boolean);
    procedure BuscaTamanho2;
    procedure SetarTamanho(Enter: Boolean);
    procedure LiberarCampos(Enter: Boolean);
    function SelecionaProduto: String;
    function SelecionarCor: String;
    function SelecionarTamanho: String;
    procedure BuscaColecao;
    function SelecionarColecao :String;
    procedure SetarColecao(enter :Boolean);

  public
    property CodigoProduto: Integer read FCodigoProduto;
    property RefProduto: String read FRefProduto write SetRefProduto;
    property DescricaoProduto: String read FDescricaoProduto;
    property CodigoCor: Integer read FCodigoCor;
    property RefCor: String read FRefCor;
    property CodTamanho: Integer read FCodTamanho;
    procedure Limpar;

  public
    property produtosLoja :boolean read FProdutosLoja write FProdutosLoja;
  end;

implementation

uses uPesquisaSimples, DB, Math;

{$R *.dfm}

{ TBuscaProduto2 }

procedure TBuscaProduto2.BuscaProduto2;
begin
  SetarProduto(True);
  if FRefProduto = '' then
    SelecionaProduto;
end;

procedure TBuscaProduto2.LiberarCampos(Enter: Boolean);
begin
  lblCor.Enabled              := Enter;
  lblTamanho.Enabled          := Enter;
  edtRefCor.Enabled           := Enter;
  edtDescricaoCor.Enabled     := Enter;
  edtCodTamanho.Enabled       := Enter;
  edtDescricaoTamanho.Enabled := Enter;
  btnBuscaCor.Enabled         := Enter;
  btnBuscaTamanho.Enabled     := Enter;
  btnBuscaColecao.Enabled     := Enter;
  edtRefCor.Clear;
  edtDescricaoCor.Clear;
  edtCodTamanho.Clear;
  edtDescricaoTamanho.Clear;
end;

procedure TBuscaProduto2.Limpar;
begin
  edtReferencia.Clear;
  edtDescricao.Clear;
  edtRefCor.Clear;
  edtDescricaoCor.Clear;
  edtCodTamanho.Clear;
  edtDescricaoTamanho.Clear;
  FCodigoProduto := 0;
  FCodigoCor     := 0;
end;

function TBuscaProduto2.SelecionaProduto: String;
var condicao_colecao, condicao_loja :String;
begin
  Result:= '';

  if edtCodColecao.AsInteger > 0 then
    condicao_colecao := ' left join produto_cores on produto_cores.codproduto = P.codigo '+
                        ' left join cores on cores.codigo = produto_cores.codcor '+
                        ' WHERE CORES.codigo_colecao = '+edtCodColecao.Text;

  if FProdutosLoja then
    condicao_loja := IfThen(condicao_colecao <> '', ' AND ', ' WHERE ')+' (p.referencia like ''%L'' or p.referencia = ''KGLOJA'') ';

  frmPesquisaSimples:= TFrmPesquisaSimples.Create(Self,'SELECT distinct P.REFERENCIA,P.DESCRICAO,P.CODIGO,P.ATIVO FROM PRODUTOS P'+
                                                       condicao_colecao+ condicao_loja,
                                                  'REFERENCIA','Selecione o Produto desejado...');

  if frmPesquisaSimples.ShowModal = mrOk then
  begin
    Result:= frmPesquisaSimples.cds_retorno.Fields[0].AsString;
    edtReferencia.Text:= Result;
    SetarProduto(True);
  end
  else
    edtReferencia.SetFocus;
    
  frmPesquisaSimples.Release;
end;

procedure TBuscaProduto2.SetarProduto(Enter: Boolean);
var REFERENCIA: String;
begin
  LiberarCampos(False);
  REFERENCIA:= Trim(edtReferencia.Text);
  if Produto = nil then
    Produto:= TObjetoGenerico.Create;
  try
    if Produto.verificaExiste('SELECT CODIGO FROM PRODUTOS WHERE REFERENCIA = '+QuotedStr(REFERENCIA)) then
    begin
      Produto.SQL:= 'SELECT CODIGO ,DESCRICAO,REFERENCIA FROM PRODUTOS WHERE REFERENCIA = '+QuotedStr(REFERENCIA);
      if not Produto.BuscaVazia then
      begin
        FCodigoProduto := Produto.getCampo('CODIGO').AsInteger;
        FRefProduto:= Produto.getCampo('REFERENCIA').AsString;
        edtDescricao.Text:= Produto.getCampo('DESCRICAO').AsString;
        LiberarCampos(True);
        if Enter then
          keybd_event(VK_TAB,0,0,0);
      end;
    end
    else
      Limpar;
  finally
    FreeAndNil(Produto);
  end;
end;

procedure TBuscaProduto2.btnBuscaProdutoClick(Sender: TObject);
begin
  SelecionaProduto;
end;

procedure TBuscaProduto2.edtReferenciaChange(Sender: TObject);
begin
  if Trim(edtDescricao.Text) <> '' then
    edtDescricao.Clear;
  Self.FRefProduto:= '';
  LiberarCampos(False);
end;

procedure TBuscaProduto2.edtReferenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    BuscaProduto2;
end;

function TBuscaProduto2.SelecionarCor: String;
var condicao_colecao :String;
begin
  Result:= '';


  if edtCodColecao.asInteger > 0 then
    condicao_colecao := ' and cores.codigo_colecao = '+intToStr(edtCodColecao.AsInteger);

  frmPesquisaSimples:= TFrmPesquisaSimples.Create(Self,
                                                  'SELECT DISTINCT CORES.REFERENCIA,CORES.DESCRICAO,CORES.CODIGO '+
                                                  'FROM CORES '+
                                                  'LEFT OUTER JOIN ESTOQUE ON (ESTOQUE.CODIGO_COR = CORES.CODIGO) '+
                                                  'LEFT OUTER JOIN PRODUTOS ON (ESTOQUE.CODIGO_PRODUTO = PRODUTOS.CODIGO) '+
                                                  'WHERE PRODUTOS.REFERENCIA = '+QuotedStr(edtReferencia.Text)+
                                                  condicao_colecao+' ORDER BY 1',
                                                  'REFERENCIA','Selecione a Cor desejada...');
  if frmPesquisaSimples.ShowModal = mrOk then
  begin
    Result:= frmPesquisaSimples.cds_retorno.Fields[0].AsString;
    edtRefCor.Text:= Result;
    SetarCor(True);
  end
  else
    edtRefCor.SetFocus;
  frmPesquisaSimples.Release;
end;

procedure TBuscaProduto2.btnBuscaCorClick(Sender: TObject);
begin
  SelecionarCor;
end;

procedure TBuscaProduto2.SetRefProduto(const Value: String);
begin
  FRefProduto := Value;
end;

procedure TBuscaProduto2.SetarCor(Enter: Boolean);
var REFCOR: String;
begin
  if Trim(edtRefCor.Text) = '' then
    Exit;
  REFCOR:= Trim(edtRefCor.Text);
  if Cor = nil then
    Cor:= TObjetoGenerico.Create;
  try
    if Cor.verificaExiste('SELECT CODIGO FROM CORES WHERE REFERENCIA = '+QuotedStr(REFCOR)) then
    begin
      Cor.SQL:= 'SELECT CODIGO, DESCRICAO,REFERENCIA FROM CORES WHERE REFERENCIA = '+QuotedStr(REFCOR);
      if not Cor.BuscaVazia then
      begin
        FCodigoCor           := Cor.getCampo('CODIGO').AsInteger;
        FRefCor              := Cor.getCampo('REFERENCIA').AsString;
        edtDescricaoCor.Text := Cor.getCampo('DESCRICAO').AsString;
        if Enter then
          keybd_event(VK_TAB,0,0,0);
      end;
    end;
  finally
    FreeAndNil(Cor);
  end;
end;

procedure TBuscaProduto2.BuscaCor2;
begin
  SetarCor(True);
  if FRefCor = '' then
    SelecionarCor;
end;

procedure TBuscaProduto2.edtRefCorChange(Sender: TObject);
begin
  if Trim(edtDescricaoCor.Text) <> '' then
  begin
    edtDescricaoCor.Clear;
    edtCodTamanho.Clear;
    edtDescricaoTamanho.Clear;
  end;
  Self.FRefCor:= '';
end;

procedure TBuscaProduto2.edtRefCorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    BuscaCor2;
end;

function TBuscaProduto2.SelecionarTamanho: String;
var cWhere: String;
begin
  Result:= '';
  if edtRefCor.Text <> '' then
    cWhere:= 'AND CORES.REFERENCIA = '+QuotedStr(edtRefCor.Text)+' ';
  frmPesquisaSimples:= TFrmPesquisaSimples.Create(Self,
                                                  'SELECT DISTINCT TAMANHOS.CODIGO,TAMANHOS.DESCRICAO '+
                                                  'FROM TAMANHOS '+
                                                  'LEFT OUTER JOIN ESTOQUE ON (ESTOQUE.CODIGO_TAMANHO = TAMANHOS.CODIGO) '+
                                                  'LEFT OUTER JOIN PRODUTOS ON (ESTOQUE.CODIGO_PRODUTO = PRODUTOS.CODIGO) '+
                                                  'LEFT OUTER JOIN CORES ON (CORES.CODIGO = ESTOQUE.CODIGO_COR) '+
                                                  'WHERE PRODUTOS.REFERENCIA = '+QuotedStr(edtReferencia.Text)+' '+
                                                  cWhere+'ORDER BY 1',
                                                  'CODIGO','Selecione o Tamanho desejado...');
  if frmPesquisaSimples.ShowModal = mrOk then
  begin
    Result:= frmPesquisaSimples.cds_retorno.Fields[0].AsString;
    edtCodTamanho.Text:= Result;
    SetarTamanho(True);
  end
  else
    edtCodTamanho.SetFocus;
  frmPesquisaSimples.Release;
end;

procedure TBuscaProduto2.SetarTamanho(Enter: Boolean);
var CODTAM: String;
begin
  if Trim(edtCodTamanho.Text) = '' then
    Exit;
  CODTAM:= Trim(edtCodTamanho.Text);
  if Tamanho = nil then
    Tamanho:= TObjetoGenerico.Create;
  try
    if Tamanho.verificaExiste('SELECT CODIGO FROM TAMANHOS WHERE CODIGO = '+CODTAM) then
    begin
      Tamanho.SQL:= 'SELECT DESCRICAO,CODIGO FROM TAMANHOS WHERE CODIGO = '+CODTAM;
      if not Tamanho.BuscaVazia then
      begin
        FCodTamanho:= Tamanho.getCampo('CODIGO').AsInteger;
        edtDescricaoTamanho.Text:= Tamanho.getCampo('DESCRICAO').AsString;
        if Enter then
          keybd_event(VK_TAB,0,0,0);
      end;
    end;
  finally
    FreeAndNil(Tamanho);
  end;
end;

procedure TBuscaProduto2.BuscaTamanho2;
begin
  SetarTamanho(True);
  if FCodTamanho = 0 then
    SelecionarTamanho;
end;

procedure TBuscaProduto2.btnBuscaTamanhoClick(Sender: TObject);
begin
  SelecionarTamanho;
end;

procedure TBuscaProduto2.edtCodTamanhoChange(Sender: TObject);
begin
  edtDescricaoTamanho.Clear;
  Self.FCodTamanho:= 0;
end;

procedure TBuscaProduto2.edtCodTamanhoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    BuscaTamanho2;
end;

procedure TBuscaProduto2.edtCodColecaoChange(Sender: TObject);
begin
  self.edtColecao.Clear;
  Self.FCodigoColecao := 0;
end;

procedure TBuscaProduto2.edtCodColecaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    BuscaColecao;
end;

procedure TBuscaProduto2.BuscaColecao;
begin
  SetarColecao(True);
  if FCodigoColecao = 0 then
    SelecionarColecao;

end;

function TBuscaProduto2.SelecionarColecao: String;
begin
  Result:= '';
  frmPesquisaSimples:= TFrmPesquisaSimples.Create(Self,
                                                  'SELECT DISTINCT COLECOES.CODIGO, COLECOES.DESCRICAO '+
                                                  'FROM COLECOES ORDER BY 1',
                                                  'CODIGO','Selecione a coleção desejada...');
  if frmPesquisaSimples.ShowModal = mrOk then
  begin
    Result:= frmPesquisaSimples.cds_retorno.Fields[0].AsString;
    edtCodColecao.Text:= Result;
    SetarColecao(True);
  end
  else
    edtCodColecao.SetFocus;
    
  frmPesquisaSimples.Release;
end;

procedure TBuscaProduto2.SetarColecao(enter: Boolean);
var CodColecao: Integer;
begin
  if edtCodColecao.AsInteger = 0 then
    Exit;

  CodColecao:= edtCodColecao.asInteger;
  
  if Colecao = nil then
    Colecao := TObjetoGenerico.Create;
  try
    if Colecao.verificaExiste('SELECT CODIGO FROM COLECOES WHERE CODIGO = '+IntToStr(CodColecao)) then
    begin
      Colecao.SQL:= 'SELECT CODIGO, DESCRICAO FROM COLECOES WHERE CODIGO = '+IntToStr(CodColecao);

      if not Colecao.BuscaVazia then
      begin
        FCodigoColecao   := Colecao.getCampo('CODIGO').AsInteger;
        edtColecao.Text  := Colecao.getCampo('DESCRICAO').AsString;

        if Enter then
          keybd_event(VK_TAB,0,0,0);
      end;
    end;
  finally
    FreeAndNil(Colecao);
  end;
end;

procedure TBuscaProduto2.btnBuscaColecaoClick(Sender: TObject);
begin
  SelecionarColecao;
end;

end.


