unit frameBuscaCor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask, RxToolEdit, RxCurrEdit, ObjetoGenerico,
  ExtCtrls, System.StrUtils, Cor;

type
  TBuscaCor = class(TFrame)
    edtCodigo: TCurrencyEdit;
    StaticText1: TStaticText;
    btnBusca: TBitBtn;
    StaticText2: TStaticText;
    edtDescricao: TEdit;
    edtReferencia: TEdit;
    procedure btnBuscaClick(Sender: TObject);
    procedure edtDescricaoEnter(Sender: TObject);
    procedure edtReferenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FrameExit(Sender: TObject);
    procedure edtReferenciaExit(Sender: TObject);
    procedure edtReferenciaChange(Sender: TObject);
  private
    cor         :TObjetoGenerico;
    FcodCor     :String;
    FCodProduto :integer;
    FFiltroTipo :String;
    FFiltroProduto: String;
    Ftipo: String;
    FTamanho: String;
    FApareceKits: String;
    FObjCor      :TCor;

    procedure buscaCor(codigo:String);
    procedure SetcodCor(const Value: String);
    function GetCodigoCor: Integer;
    procedure SetCodProduto(const Value: integer);
    procedure SetFiltroTipo(const Value: String);
    procedure SetFiltroProduto(const Value: String);
    procedure Settipo(const Value: String);

  public
    procedure limpa;

    property ObjCor     :TCor read FObjCor;
    property codCor     :String read FcodCor write SetcodCor;
    property CodigoCor  :Integer read GetCodigoCor;
    property codProduto :integer read FCodProduto write SetCodProduto;
    property tipo       :String read Ftipo write Settipo;

    property tamanho          :String write FTamanho;
    property FiltroTipo       :String read FFiltroTipo write SetFiltroTipo;
    property FiltroProduto    :String read FFiltroProduto write SetFiltroProduto;
    property ApareceKits      :String read FApareceKits write FApareceKits;

  end;

implementation

uses uPesquisaSimples, funcoes, repositorio, fabricarepositorio;

{$R *.dfm}

procedure TBuscaCor.btnBuscaClick(Sender: TObject);
var campoRetorno :String;
    condicao, joinEstoque, campoEstoque :String;
    codigoTamanho :Integer;
begin
  campoRetorno := 'REFERENCIA';
  condicao     := '';
  joinEstoque  := '';
  campoEstoque := '';

       if (self.FFiltroTipo <> '')    then  condicao := ' where c.tipo = '''+self.FFiltroTipo+''' '
  else if (self.FFiltroProduto <> '') then  condicao := ' where pc.codproduto = '''+self.FFiltroProduto+''' ';

  if (FCodProduto > 0) and (FTamanho <> '') then
  begin
    codigoTamanho := StrToIntDef(Campo_por_campo('TAMANHOS','CODIGO','DESCRICAO',FTamanho) ,0);
    campoEstoque  := ', e.quantidade ';
    joinEstoque   := ' left join estoque e on ((e.codigo_produto = '+intToStr(FCodProduto)+') and (e.codigo_tamanho = '+IntToStr(codigoTamanho)+') and (e.codigo_cor = c.codigo) ) '
  end;


  if FApareceKits = 'S' then
    condicao := condicao + IfThen(condicao <> '',' and ', ' where ')+' c.kit = ''S'' '
  else if FApareceKits = 'N' then
    condicao := condicao + IfThen(condicao <> '',' and ', ' where ')+' ((c.kit = ''N'') or (c.kit is null)) ';


  frmPesquisaSimples := TFrmPesquisaSimples.Create(Self,'Select c.referencia, c.descricao '+campoEstoque+', c.codigo from cores c '+
                                                        ' left join produto_cores pc  on pc.codcor = c.codigo    '+
                                                        joinEstoque +
                                                         condicao +
                                                        ' group by c.referencia, c.descricao, c.codigo '+campoEstoque,
                                                         campoRetorno, 'Selecione a Cor desejada...', 800);

  if frmPesquisaSimples.ShowModal = mrOk then
    buscaCor(frmPesquisaSimples.cds_retorno.Fields[0].AsString);

  frmPesquisaSimples.Release;

  edtDescricao.SetFocus;
end;

procedure TBuscaCor.buscaCor(codigo: String);
var campoRetorno :String;
    condicao     :String;
    repositorio  :TRepositorio;
begin
  campoRetorno := 'REFERENCIA'; //campo que deseja que retorne
  condicao     := '';

       if (self.FFiltroTipo <> '')    then  condicao := ' and c.tipo = '''+self.FFiltroTipo+''' '
  else if (self.FFiltroProduto <> '') then  condicao := ' and pc.codproduto = '''+self.FFiltroProduto+''' ';

  if FApareceKits = 'S' then
    condicao := condicao + ' and c.kit = ''S'' '
  else if FApareceKits = 'N' then
    condicao := condicao + ' and ((c.kit = ''N'') or (c.kit is null))  ';

  try
    edtReferencia.OnChange := nil;
    if cor = nil then
      cor := TObjetoGenerico.Create;

    cor.SQL := ' Select first 1 c.referencia, c.descricao, c.codigo, c.tipo from cores c '+
               ' left join produto_cores pc  on pc.codcor = c.codigo                     '+
               ' where '+campoRetorno+'='''+ codigo + ''''+condicao+// and cb.codproduto = '+IntToStr(self.FCodProduto);
               ' group by c.referencia, c.descricao, c.codigo, c.tipo';

    if not cor.BuscaVazia then begin
      edtCodigo.Text     := cor.getCampo('codigo').AsString;
      self.FcodCor       := edtCodigo.Text;

      edtReferencia.Text := cor.getCampo('referencia').AsString;
      edtDescricao.Text  := cor.getCampo('descricao').AsString;
      self.Ftipo         := cor.getCampo('tipo').AsString;

      repositorio := TFabricaRepositorio.GetRepositorio(TCor.ClassName);
      FObjCor     := TCor(repositorio.get(cor.getCampo('codigo').AsInteger));

    end
    else begin
      limpa;
      btnBusca.Click;
    end;

  finally
    edtReferencia.OnChange := edtReferenciaChange;
    FreeAndNil(cor);
  end;
end;

procedure TBuscaCor.edtDescricaoEnter(Sender: TObject);
begin
  keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaCor.SetcodCor(const Value: String);
begin
  buscaCor(value);
end;

procedure TBuscaCor.limpa;
begin
  edtCodigo.Text     := '';
  edtDescricao.Text  := '';
  if not (Screen.ActiveControl = edtReferencia) then
    edtReferencia.Text := '';
  self.Ftipo         := '';
  if assigned(FObjCor) then
    FreeAndNil(FObjCor);
end;

function TBuscaCor.GetCodigoCor: Integer;
begin
   result := StrToIntDef(self.FcodCor, 0);
end;

procedure TBuscaCor.SetCodProduto(const Value: integer);
begin
  FCodProduto := Value;
end;

procedure TBuscaCor.SetFiltroTipo(const Value: String);
begin
  FFiltroTipo    := Value;
  FFiltroProduto := '';
end;

procedure TBuscaCor.SetFiltroProduto(const Value: String);
begin
  FFiltroProduto := Value;
  FFiltroTipo    := '';
end;

procedure TBuscaCor.Settipo(const Value: String);
begin
  Ftipo := Value;
end;

procedure TBuscaCor.edtReferenciaChange(Sender: TObject);
begin
  if assigned(FObjCor) then
    limpa;
end;

procedure TBuscaCor.edtReferenciaExit(Sender: TObject);
begin
  if (trim(edtReferencia.Text) <> '') and not assigned(FObjCor) then
    buscaCor(edtReferencia.Text);
end;

procedure TBuscaCor.edtReferenciaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) and (edtReferencia.Text = '') then
    buscaCor(edtReferencia.Text);
end;

procedure TBuscaCor.FrameExit(Sender: TObject);
begin
  if edtReferencia.Text <> '' then
    buscaCor(edtReferencia.Text)
  else
    limpa;
end;

end.
