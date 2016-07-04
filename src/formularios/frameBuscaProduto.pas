unit frameBuscaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ObjetoGenerico, Produto;

type
  TBuscaProduto = class(TFrame)
    edtReferencia: TEdit;
    btnBusca: TBitBtn;
    edtDescricao: TEdit;
    StaticText2: TStaticText;
    StaticText1: TStaticText;
    edtGrade: TEdit;
    StaticText3: TStaticText;
    procedure btnBuscaClick(Sender: TObject);
    procedure edtGradeEnter(Sender: TObject);
    procedure edtReferenciaExit(Sender: TObject);
    procedure edtReferenciaChange(Sender: TObject);
    procedure edtReferenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FrameExit(Sender: TObject);
  private
    produto     :TObjetoGenerico;
    FProd       :TProduto;
    Fcodproduto :String;
    FCodGrade   :Integer;
    Fpreco      :Real;
    FcodTabela  :String;
    FTipo       :String;
    FKit        :Boolean;

    procedure buscaProduto;
    function selecionaProduto :String;
    procedure setaProduto(enter :Boolean);

    procedure Setcodproduto(const Value: String);
    procedure SetcodTabela(const Value: String);
    function GetCodigoProduto: Integer;

  public
    procedure limpa;

    property codproduto :String  read Fcodproduto write Setcodproduto;
    property CodigoProduto :Integer read GetCodigoProduto;
    property codGrade   :Integer read FCodGrade;
    property preco      :Real    read Fpreco;
    property codTabela  :String read FcodTabela write SetcodTabela;
    property tipo       :String read FTipo;
    property Kit        :Boolean read FKit write FKit;

    property Prod       :TProduto read FProd;
  end;

implementation

uses uPesquisaSimples, repositorio, fabricaRepositorio;

{$R *.dfm}

procedure TBuscaProduto.buscaProduto;
begin
  setaProduto(true);
  if ( Fcodproduto = '0' ) then  selecionaProduto;
end;

procedure TBuscaProduto.Setcodproduto(const Value: String);
begin
  edtReferencia.Text := value;
  setaProduto(false);
end;

procedure TBuscaProduto.btnBuscaClick(Sender: TObject);
var campoRetorno :String;
begin
  selecionaProduto;
end;

procedure TBuscaProduto.limpa;
begin
  edtDescricao.Text  := '';
  edtReferencia.Text := '';
  Fcodproduto        := '0';
  FCodGrade          := 0;
  FPreco             := 0;
  FTipo              := '';
  edtGrade.Text      := '';
  FKit               := false;
  FreeAndNil(FProd);
end;

procedure TBuscaProduto.edtGradeEnter(Sender: TObject);
begin
  keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaProduto.SetcodTabela(const Value: String);
begin
  FcodTabela := Value;
end;

function TBuscaProduto.selecionaProduto: String;
begin
  Result := '';

  frmPesquisaSimples := TFrmPesquisaSimples.Create(Self,'Select referencia, descricao, codigo, ativo from produtos',
                                                       'REFERENCIA', 'Selecione o Produto desejado...',800);

  if frmPesquisaSimples.ShowModal = mrOk then begin
    Result := frmPesquisaSimples.cds_retorno.Fields[0].AsString;
    edtReferencia.Text := Result;
    setaProduto(true);
  end
  else
    edtReferencia.SetFocus;

  frmPesquisaSimples.Release;

end;

procedure TBuscaProduto.setaProduto(enter :Boolean);
var campo      :String;
    referencia :String;
    repositorio :TRepositorio;
begin
  campo := 'REFERENCIA';
  referencia   := trim(edtReferencia.Text);

  if codTabela = '' then   codTabela := '0';
  
//  if codTabela = '' then  raise Exception.Create('Tabela de preço não foi informada');
  
  if produto = nil then
    produto := TObjetoGenerico.Create;

  try
    repositorio := TFabricaRepositorio.GetRepositorio(TProduto.ClassName);

    if produto.verificaExiste('select codigo from produtos where referencia = '''+ referencia +'''') then begin

       produto.SQL := 'Select first 1 p.referencia, p.descricao, p.codigo, g.codigo grade, g.descricao descgrade, pt.preco, p.tipo, p.kit    from produtos p '+
                      'inner join grades g on g.codigo = p.cod_grade                                                                                  '+
                      'left join produto_tabela_preco pt on (pt.codproduto = p.codigo and pt.codtabela = '+ codTabela +')                             '+
                      'where p.' + campo + ' = ''' + referencia + '''';

       if not produto.BuscaVazia then begin
         edtReferencia.Text := produto.getCampo('referencia').AsString;
         edtDescricao.Text  := produto.getCampo('descricao').AsString;
         Fcodproduto        := produto.getCampo('codigo').AsString;
         FCodGrade          := produto.getCampo('grade').AsInteger;
         edtGrade.Text      := produto.getCampo('descGrade').AsString;
         FPreco             := produto.getCampo('PRECO').AsFloat;
         FTipo              := produto.getCampo('TIPO').AsString;
         FKit               := produto.getCampo('KIT').AsString = 'S';

         FProd := TProduto(repositorio.Get(produto.getCampo('codigo').AsInteger));

         if enter then
           keybd_event(VK_TAB, 0, 0, 0);
       end;

    end
    else limpa;

  finally
    FreeAndNil(produto);
    FreeAndNil(repositorio);
  end;
end;

function TBuscaProduto.GetCodigoProduto: Integer;
begin
   result := StrToIntDef(self.Fcodproduto, 0);
end;

procedure TBuscaProduto.edtReferenciaExit(Sender: TObject);
begin
{  if (edtReferencia.Text = '0') or (edtReferencia.Text = '')then
    btnBusca.Click
  else
  if trim(edtReferencia.Text) <> '' then
    buscaProduto;}


end;

procedure TBuscaProduto.edtReferenciaChange(Sender: TObject);
begin
  if TRIM(edtDescricao.Text) <> '' then
    edtDescricao.Clear;
  edtGrade.Clear;
  self.Fcodproduto := '0';
end;

procedure TBuscaProduto.edtReferenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
     buscaProduto;
end;

procedure TBuscaProduto.FrameExit(Sender: TObject);
begin
  if edtReferencia.Text <> '' then
//    buscaProduto
  else
    limpa;
end;

end.
