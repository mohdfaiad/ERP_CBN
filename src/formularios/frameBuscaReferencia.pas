unit frameBuscaReferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask, RxToolEdit, RxCurrEdit, ObjetoGenerico, DBClient;

type
  TBuscaReferencia = class(TFrame)
    StaticText1: TStaticText;
    btnBusca: TBitBtn;
    edtReferencia: TEdit;
    edtCodigo: TCurrencyEdit;
    edtGrade: TEdit;
    edtCor: TEdit;
    edtTamanho: TEdit;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    procedure btnBuscaClick(Sender: TObject);
    procedure edtReferenciaEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
  private
    codigoBarras :TObjetoGenerico;
    Fnumeracao   :String;
    Fproduto     :String;
    FcodReferencia: String;
    FCodGrupo    :Integer;
    FGrupo       :String;
    FCds_selecionados :TClientDataSet;

    procedure buscaReferencia;
    procedure setaReferencia;
    function selecionaReferencia :String;

    procedure SetcodReferencia(const Value: String);
  public

    procedure limpa;

    property codReferencia    :String         read FcodReferencia write SetcodReferencia;
    property numeracao        :String         read Fnumeracao;
    property produto          :String         read FProduto;
    property codGrupo         :Integer        read FCodGrupo;
    property grupo            :String         read FGrupo;
    property cds_selecionados :TClientDataSet read FCds_selecionados;
  end;

implementation

uses uPesquisaSimples, frameBuscaProduto;

{$R *.dfm}

{ TFrame1 }

procedure TBuscaReferencia.buscaReferencia;
begin
  setaReferencia;

  if ( FcodReferencia = '0' ) then  selecionaReferencia;
end;

procedure TBuscaReferencia.setaReferencia;
var campo    :String;
    codigo   :String;
begin
  campo := 'CODIGO';
  codigo   := trim(edtCodigo.Text);

  if codigoBarras = nil then
    codigoBarras := TObjetoGenerico.Create;

  try

    if codigoBarras.verificaExiste('select codigo from codigo_barras where codigo = '''+ codigo +'''') then begin

       codigoBarras.SQL := 'Select cb.codigo, cb.numeracao "Numeracao",            '+
                           '      p.referencia "Referencia",                       '+
                           '      p.cod_grupo,                                     '+
                           '      gr.descricao grupo,                              '+
                           '      substring(p.descricao from 1 for 40) "Produto",  '+
                           '      substring(g.descricao from 1 for 8) "Grade",     '+
                           '      substring(t.descricao from 1 for 8) "Tamanho",   '+
                           '      substring(c.descricao from 1 for 35) "Cor"       '+
                           ' from codigo_barras cb                                 '+
                           ' left join produtos p on p.codigo = cb.codproduto      '+
                           ' left join grades   g on g.codigo = cb.codgrade        '+
                           ' left join tamanhos t on t.codigo = cb.codtamanho      '+
                           ' left join cores    c on c.codigo = cb.codcor          '+
                           ' left join grupo   gr on gr.codigo = p.cod_grupo       '+
                           ' where cb.codigo = '+ codigo;

       if not codigoBarras.BuscaVazia then begin
         edtReferencia.Text := codigoBarras.getCampo('Referencia').AsString;
         edtGrade.Text      := codigoBarras.getCampo('Grade').AsString;
         edtCor.Text        := codigoBarras.getCampo('Cor').AsString;
         edtTamanho.Text    := codigoBarras.getCampo('Tamanho').AsString;
         Fnumeracao         := codigoBarras.getCampo('Numeracao').AsString;
         FProduto           := codigoBarras.getCampo('Produto').AsString;
         FcodGrupo          := codigoBarras.getCampo('cod_grupo').AsInteger;
         FGrupo             := codigoBarras.getCampo('grupo').asstring;

         keybd_event(VK_TAB, 0, 0, 0);
       end;

    end
    else limpa;

  finally
    FreeAndNil(codigoBarras);
  end;
end;

procedure TBuscaReferencia.SetcodReferencia(const Value: String);
begin
  edtCodigo.Text := value;
  setaReferencia;
end;

procedure TBuscaReferencia.btnBuscaClick(Sender: TObject);
begin
  selecionaReferencia;
end;

procedure TBuscaReferencia.edtReferenciaEnter(Sender: TObject);
begin
  keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaReferencia.limpa;
begin
  edtCodigo.Clear;
  edtReferencia.Clear;
  edtGrade.Clear;
  edtCor.Clear;
  edtTamanho.Clear;
  Fnumeracao   := '';
  FcodReferencia := '';
  FCodGrupo := 0;
  FGrupo   := '';
  Fproduto     := '';
  FCds_selecionados.EmptyDataSet;
end;

procedure TBuscaReferencia.edtCodigoExit(Sender: TObject);
begin
  if edtCodigo.AsInteger > 0 then
    buscaReferencia;
end;

function TBuscaReferencia.selecionaReferencia: String;
begin

  Fcds_selecionados := TClientDataSet.Create(self);

  frmPesquisaSimples := TFrmPesquisaSimples.Create(Self,'Select cb.codigo, cb.numeracao "Numeração",            '+
                                                        '      p.referencia "Referência",                       '+
                                                        '      substring(p.descricao from 1 for 40) "Produto",  '+
                                                        '      substring(c.descricao from 1 for 35) "Cor",      '+
                                                        '      substring(g.descricao from 1 for 8) "Grade",     '+
                                                        '      substring(t.descricao from 1 for 8) "Tamanho"    '+

                                                        ' from codigo_barras cb                                 '+
                                                        ' left join produtos p on p.codigo = cb.codproduto      '+
                                                        ' left join grades   g on g.codigo = cb.codgrade        '+
                                                        ' left join tamanhos t on t.codigo = cb.codtamanho      '+
                                                        ' left join cores    c on c.codigo = cb.codcor',
                                                        'CODIGO', 'Selecione o Produto desejado...', 940);
  
  if frmPesquisaSimples.ShowModal = mrOk then begin;
    edtCodigo.Text := frmPesquisaSimples.cds_retorno.Fields[0].AsString;
    FCds_selecionados.CloneCursor( frmPesquisaSimples.cds_retorno, false);
    setaReferencia;
  end;

  frmPesquisaSimples.Release;
end;

end.
