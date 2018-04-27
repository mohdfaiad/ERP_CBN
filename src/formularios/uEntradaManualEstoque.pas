unit uEntradaManualEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, ExtCtrls, frameBuscaCor, frameBuscaProduto,
  Buttons, Mask, RxToolEdit, RxCurrEdit, CriaBalaoInformacao, frameListaCampo,
  ComCtrls, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ConfiguracoesECommerce;

type
  TfrmEntradaManualEstoque = class(TfrmPadrao)
    edtCodigoBarras: TEdit;
    Label1: TLabel;
    Shape1: TShape;
    Label2: TLabel;
    rgTamanhos: TRadioGroup;
    pnlRodape: TPanel;
    btnSalvar: TBitBtn;
    btnLimpar: TBitBtn;
    pnlQuantidades: TPanel;
    Label3: TLabel;
    Shape2: TShape;
    edtEstoqueAtual: TCurrencyEdit;
    edtQtdEntrada: TCurrencyEdit;
    Label4: TLabel;
    lbEntSai: TLabel;
    edtCodigoEstoque: TCurrencyEdit;
    cbEntradaUnitaria: TCheckBox;
    chkSaida: TCheckBox;
    dtpDataProducao: TDateTimePicker;
    ListaIntervalos: TListaCampo;
    Label5: TLabel;
    edtLote: TCurrencyEdit;
    Label6: TLabel;
    btnNovoLote: TSpeedButton;
    btnDirecionaEntradas: TBitBtn;
    GroupBox1: TGroupBox;
    BuscaProduto1: TBuscaProduto;
    GroupBox2: TGroupBox;
    BuscaCor1: TBuscaCor;
    cbxSetor: TComboBox;
    Label7: TLabel;
    procedure BuscaProduto1Exit(Sender: TObject);
    procedure edtCodigoBarrasChange(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure rgTamanhosClick(Sender: TObject);
    procedure rgTamanhosEnter(Sender: TObject);
    procedure cbEntradaUnitariaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkSaidaClick(Sender: TObject);
    procedure edtQtdEntradaChange(Sender: TObject);
    procedure BuscaCor1Enter(Sender: TObject);
    procedure btnNovoLoteClick(Sender: TObject);
    procedure btnDirecionaEntradasClick(Sender: TObject);
    procedure cbxSetorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    FConfiguracoes :TConfiguracoesECommerce;

  private
    procedure mostra_estoque_atual;
    procedure disponibiliza_tamanhos;
    function busca_por_codigoBarras :Boolean;
    function salvar_estoque :Boolean;
    procedure salva_entradaSaida;

    procedure atualizaEstoquePlataforma(sku :String; quantidade :integer);
    function getQuantidadeAtual(sku :String) :integer;
    function getJsonProduto(sku :String) :String;

    function validaObrigatoriedades :Boolean;

  public
    entrada_saida :Integer;
  end;

var
  frmEntradaManualEstoque: TfrmEntradaManualEstoque;

implementation

uses Estoque, Repositorio, FabricaRepositorio, uModulo, DB, EspecificacaoEstoquePorProdutoCorTamanho, funcoes, StringUtilitario,
  Math, StrUtils, entradaSaida,uDirecionarEntradas, permissoesAcesso, REST.types, System.JSon, IdSSLOpenSSL, HTTPJSON;

{$R *.dfm}

{ TfrmEntradaManualEstoque }

procedure TfrmEntradaManualEstoque.disponibiliza_tamanhos;
begin
  if BuscaProduto1.edtDescricao.Text = '' then
    exit;

  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select gt.codtamanho, t.descricao from grade_tamanhos gt '+
                              'left join tamanhos t on t.codigo = gt.codtamanho         '+
                              'where gt.codgrade = :codgrade                            ';
  fdm.qryGenerica.ParamByName('codgrade').AsInteger := BuscaProduto1.codGrade;
  fdm.qryGenerica.Open;

  if BuscaProduto1.codGrade = rgTamanhos.Tag then Exit;
  
  rgTamanhos.Tag := BuscaProduto1.codGrade;
  rgTamanhos.Items.Clear;
  fdm.qryGenerica.First;
  while not fdm.qryGenerica.Eof do begin
    rgTamanhos.Items.Add( fdm.qryGenerica.fieldByName('descricao').AsString );

    fdm.qryGenerica.Next;
  end;

end;

procedure TfrmEntradaManualEstoque.BuscaProduto1Exit(Sender: TObject);
begin
  disponibiliza_tamanhos;
end;

procedure TfrmEntradaManualEstoque.edtCodigoBarrasChange(Sender: TObject);
begin
  if length(edtCodigoBarras.Text) = 13 then begin
    if not busca_por_codigoBarras then
      avisar('Nenhum produto foi encontrado com o c�digo de barras informado',0,'S',1);

    edtCodigoBarras.Clear;
  end;
end;

function TfrmEntradaManualEstoque.busca_por_codigoBarras :Boolean;
var
    tamanho, codigo_produto, codigo_cor :String;
begin
  Result := false;

  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := ' select pro.referencia REFPRO, cor.referencia REFCOR, tam.descricao tamanho '+
                              ' from codigo_barras cb                                                      '+
                              ' left join produtos pro on pro.codigo = cb.codproduto                       '+
                              ' left join cores    cor on cor.codigo = cb.codcor                           '+
                              ' left join tamanhos tam on tam.codigo = cb.codtamanho                       '+
                              ' where cb.numeracao = :codbar                                               ';

  fdm.qryGenerica.ParamByName('codbar').AsString := TRIM(edtCodigoBarras.Text);
  fdm.qryGenerica.Open;

  if fdm.qryGenerica.IsEmpty then Exit;

  codigo_produto := fdm.qryGenerica.fieldByName('REFPRO').AsString;
  codigo_cor     := fdm.qryGenerica.fieldByName('REFCOR').AsString;
  tamanho        := fdm.qryGenerica.fieldByName('tamanho').AsString;

  BuscaProduto1.codproduto := codigo_produto;
  BuscaCor1.codCor         := codigo_cor;

  disponibiliza_tamanhos;

  rgTamanhos.ItemIndex     := rgTamanhos.Items.IndexOf(tamanho);
  Result := true;

  if edtQtdEntrada.Enabled then begin
    rgTamanhos.SetFocus;
    keybd_event(VK_RETURN,0,0,0);
  end
  else begin
    mostra_estoque_atual;
    btnSalvar.SetFocus;
  end;
end;

procedure TfrmEntradaManualEstoque.mostra_estoque_atual;
var Estoque     :TEstoque;
    repositorio :TRepositorio;
    Especificacao :TEspecificacaoEstoquePorProdutoCorTamanho;
    codigo_tamanho :integer;
begin
 try
   Estoque        := nil;
   codigo_tamanho := strToInt( Campo_por_campo('TAMANHOS', 'CODIGO', 'DESCRICAO', rgTamanhos.Items[rgTamanhos.itemIndex]) );

   repositorio    := TFabricaRepositorio.GetRepositorio(TEstoque.ClassName);
   Especificacao  := TEspecificacaoEstoquePorProdutoCorTamanho.Create(cbxSetor.ItemIndex+1,
                                                                      BuscaProduto1.CodigoProduto,
                                                                      BuscaCor1.CodigoCor,
                                                                      codigo_tamanho);

   Estoque     := TEstoque( repositorio.GetPorEspecificacao( Especificacao, BuscaProduto1.codproduto) );

   if assigned(Estoque) then begin
     edtEstoqueAtual.Value      := Estoque.quantidade;
     edtCodigoEstoque.AsInteger := Estoque.codigo;
   end
   else begin
     edtEstoqueAtual.Value      := 0;
     edtCodigoEstoque.AsInteger := 0;
   end;

 finally
   if assigned(Estoque) then
     FreeAndNil( Estoque );
 end;
end;

procedure TfrmEntradaManualEstoque.atualizaEstoquePlataforma(sku: String; quantidade :integer);
var
    Retorno, lJSO :String;
    Parametros :TStrings;
    jsonToSend : TStringStream;
    vHTTPJSON: THTTPJSON;
    quantidadeAtualizada :Integer;
begin
  sku := TStringUtilitario.RemoveCaracteresEspeciais(sku);
  quantidadeAtualizada := getQuantidadeAtual(sku);
  quantidadeAtualizada := quantidadeAtualizada + quantidade;
  try
    vHTTPJSON := THTTPJSON.CreateEcommerce(dm.configuracoesECommerce.token, dm.configuracoesECommerce.url_base);
  try
    lJSO := ('{"sku": "'+sku+'", "estoque": '+intToStr(quantidadeAtualizada)+'}');
    jsonToSend := TStringStream.Create(lJSO,TEncoding.UTF8);

    Retorno := vHTTPJSON.Post('produtos/',lJSO);
  Except
   on e:Exception do
     raise Exception.Create('Erro ao atualizar estoque na plataforma: '+e.Message);
  end;
  Finally
    FreeAndNil(vHTTPJSON);
  end;
end;

procedure TfrmEntradaManualEstoque.btnDirecionaEntradasClick(Sender: TObject);
begin
  self.AbreForm(TFrmDirecionarEntradas, paDirecionarEntradas);
end;

procedure TfrmEntradaManualEstoque.btnLimparClick(Sender: TObject);
begin
  edtCodigoEstoque.Clear;
  BuscaProduto1.limpa;
  BuscaCor1.limpa;
 // rgTamanhos.Items.Clear;
  rgTamanhos.ItemIndex := -1;
  edtEstoqueAtual.Clear;
  edtCodigoBarras.SetFocus;
end;

procedure TfrmEntradaManualEstoque.FormShow(Sender: TObject);
begin
  btnLimpar.Click;
  if (self.entrada_saida = 1) then  self.Caption := 'Sa�da Manual de Estoque'
                              else  self.Caption := 'Entrada Manual de Estoque'; 
  chkSaida.Checked := (self.entrada_saida = 1);
  chkSaidaClick(nil);

  ListaIntervalos.setValores('select ip.codigo, (substring( CAST(ip.hora_inicio as VARCHAR(15)) from 1 for 5)||'' �s ''|| '+
                             'substring(CAST(ip.hora_fim as VARCHAR(15)) from 1 for 5)) INTERVALO'+
                             ' from intervalos_producao ip', 'INTERVALO', 'Intervalo de produ��o');
  ListaIntervalos.executa;

  dtpDataProducao.DateTime := Date;
  edtLote.AsInteger := StrToIntDef(Maior_Valor_Cadastrado('ENTRADAS_SAIDAS', 'LOTE'), 0);
  if edtlote.AsInteger = 0 then
    edtlote.AsInteger := 1;

  label5.Visible          := (entrada_saida = 0);
  dtpDataProducao.Visible := (entrada_saida = 0);
  ListaIntervalos.Visible := (entrada_saida = 0);
end;

function TfrmEntradaManualEstoque.getJsonProduto(sku: String): String;
var
    Retorno :String;
    vHTTPJSON :THTTPJSON;
begin
 try
 try
   vHTTPJSON := THTTPJSON.CreateEcommerce(dm.configuracoesECommerce.token, dm.configuracoesECommerce.url_base);

   Retorno := vHTTPJSON.Get('produto/'+sku);
   result  := Retorno;
 except
   on e: Exception do
     raise Exception.Create(e.Message);
 end;
 finally
   FreeAndNil(vHTTPJSON);
 end;
end;

function TfrmEntradaManualEstoque.getQuantidadeAtual(sku: String): integer;
var
  Objeto :TJSONObject;
begin
  try
    Objeto := TJSONObject.ParseJSONValue(getJsonProduto(sku)) as TJSONObject;
    result := StrToIntDef(Objeto.GetValue('estoque').Value,0);
  except
  end;
end;

procedure TfrmEntradaManualEstoque.btnNovoLoteClick(Sender: TObject);
begin
  if confirma('Confirma fechamento do lote n� '+edtlote.Text+' e abertura do lote n� '+inttostr(edtlote.AsInteger + 1)) then
  begin
    edtLote.AsInteger   := edtLote.AsInteger + 1;
    btnNovoLote.Enabled := false;
  end;
end;

procedure TfrmEntradaManualEstoque.btnSalvarClick(Sender: TObject);
var ent_sai :String;
begin
  if not validaObrigatoriedades then
    exit;

  ent_sai := IfThen(chkSaida.Checked, 'sa�da', 'entrada');

  if not cbEntradaUnitaria.Checked and
     not confirma('Confirma a '+ent_sai+' na quandidade de: '+FormatFloat('##,###,##0.00',edtQtdEntrada.Value)+' Referente �: '+#13#10+#13#10+
                  'PRODUTO > '+BuscaProduto1.edtReferencia.Text+' - '+
                  BuscaProduto1.edtDescricao.Text+#13#10+
                  'COR > '+BuscaCor1.edtReferencia.Text+' - '+BuscaCor1.edtDescricao.Text+#13#10+
                  ' TAM > '+rgTamanhos.Items[rgTamanhos.itemIndex]+#13#10+
                  'Produzido em '+DateToStr(dtpDataProducao.Date)+' das '+ListaIntervalos.comListaCampo.Items[ListaIntervalos.comListaCampo.itemIndex]+'?') then
    Exit;
 try
 try
  Fdm.conexao.TxOptions.AutoCommit := false;

  if salvar_estoque then begin
    Avisar('Estoque atualizado com sucesso!',1);
    edtEstoqueAtual.Value := edtEstoqueAtual.Value + IfThen(chkSaida.Checked, (edtQtdEntrada.Value * -1), edtQtdEntrada.Value);
    edtCodigoBarras.SetFocus;

    salva_entradaSaida;
    btnNovoLote.Enabled := true;
  end
  else
    Avisar('Erro ao salvar estoque!',1);

  if not cbEntradaUnitaria.Checked then
    edtQtdEntrada.Clear;

  fdm.conexao.Commit;
 except
   on e :Exception do
   begin
     fdm.conexao.Rollback;
     avisar(e.message+#13#10+'Opera��o cancelada.');
   end;
 end;
 finally
   Fdm.conexao.TxOptions.AutoCommit := true;
 end;
end;

function TfrmEntradaManualEstoque.salvar_estoque: Boolean;
var Estoque     :TEstoque;
    repositorio :TRepositorio;
    Especificacao :TEspecificacaoEstoquePorProdutoCorTamanho;
    codigo_produto,
    codigo_cor,
    codigo_tamanho, qtd_movimento :integer;
    sku :String;
begin
  Result      := false;
  Estoque     := nil;
  repositorio := nil;
 try
 try
   codigo_produto := BuscaProduto1.CodigoProduto;
   codigo_cor     := BuscaCor1.CodigoCor;
   codigo_tamanho := strToInt( Campo_por_campo('TAMANHOS', 'CODIGO', 'DESCRICAO', rgTamanhos.Items[rgTamanhos.itemIndex]) );

   repositorio := TFabricaRepositorio.GetRepositorio(TEstoque.ClassName);
   Especificacao  := TEspecificacaoEstoquePorProdutoCorTamanho.Create(cbxSetor.ItemIndex+1,
                                                                      codigo_produto,
                                                                      codigo_cor,
                                                                      codigo_tamanho);

   Estoque     := TEstoque( repositorio.GetPorEspecificacao( Especificacao, BuscaProduto1.codproduto) );

   if not assigned(Estoque) then
     Estoque := TEstoque.Create;

   Estoque.codigo_produto := codigo_produto;
   Estoque.codigo_cor     := codigo_cor;
   Estoque.codigo_tamanho := codigo_tamanho;
   Estoque.setor          := cbxSetor.ItemIndex+1;

   Estoque.quantidade     := Estoque.quantidade + IfThen(chkSaida.Checked, (edtQtdEntrada.Value * -1), edtQtdEntrada.Value);
   repositorio.Salvar( Estoque );

   //atualiza plataforma apenas se for setor e-commerce
   if Estoque.setor = 2 then
   begin
     qtd_movimento := Trunc(IfThen(chkSaida.Checked, (edtQtdEntrada.Value * -1), edtQtdEntrada.Value));
     sku := BuscaProduto1.Prod.Referencia + rgTamanhos.Items[rgTamanhos.ItemIndex] + BuscaCor1.edtReferencia.Text;
     atualizaEstoquePlataforma(sku, qtd_movimento);
   end;
   Result := true;

 except
   on e :Exception do
     raise Exception.Create(e.message);
 end;
 finally
   if assigned(Estoque)     then  FreeAndNil(Estoque);
   if assigned(repositorio) then  FreeAndNil(repositorio);
 end;
end;

procedure TfrmEntradaManualEstoque.rgTamanhosClick(Sender: TObject);
begin
  if (BuscaProduto1.edtDescricao.Text = '') then begin
    avisar('O Produto deve ser informado');
    BuscaProduto1.edtReferencia.SetFocus;
  end
  else if (BuscaCor1.edtDescricao.Text = '') then begin
    avisar('A Cor deve ser informada');
    BuscaCor1.edtReferencia.SetFocus;
  end
  else if (rgTamanhos.ItemIndex < 0) then begin
    avisar('O Tamanho deve ser informado');
    rgTamanhos.SetFocus;
  end
  else
    mostra_estoque_atual;
end;

procedure TfrmEntradaManualEstoque.rgTamanhosEnter(Sender: TObject);
begin
  if rgTamanhos.ItemIndex >= 0 then
    rgTamanhosClick(nil);
end;

procedure TfrmEntradaManualEstoque.cbEntradaUnitariaClick(Sender: TObject);
begin
  if cbEntradaUnitaria.Checked then begin
    edtQtdEntrada.Enabled := false;
    edtQtdEntrada.Value   := 1;
  end
  else begin
    edtQtdEntrada.Enabled := true;
    edtQtdEntrada.Value   := 0;
  end;

  edtCodigoBarras.SetFocus;
end;

procedure TfrmEntradaManualEstoque.cbxSetorChange(Sender: TObject);
begin
  mostra_estoque_atual;
end;

procedure TfrmEntradaManualEstoque.FormCreate(Sender: TObject);
var
    repositorio :TRepositorio;
begin
  inherited;
  try
    repositorio    := TFabricaRepositorio.GetRepositorio(TConfiguracoesECommerce.ClassName);
    FConfiguracoes := TConfiguracoesECommerce(repositorio.Get(1));

    if not assigned(FConfiguracoes) then
    begin
      avisar('Aten��o! N�o ser� poss�vel realizar o movimento de estoque envolvendo o setor de e-commerce, '+
             'enquanto o cadastro das configura��es de e-commerce n�o for efetuado');
    end;
  finally
    FreeAndNil(repositorio);
  end;
end;

procedure TfrmEntradaManualEstoque.FormDestroy(Sender: TObject);
begin
  if Assigned(self.FConfiguracoes) then
    FreeAndNil(FConfiguracoes);
  inherited;
end;

procedure TfrmEntradaManualEstoque.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var tecla :word;
begin
  tecla := Key;
  inherited;
  Key := tecla;
end;

procedure TfrmEntradaManualEstoque.chkSaidaClick(Sender: TObject);
begin
  if chkSaida.Checked then begin
    lbEntSai.Caption          := 'Quantidade a dar sa�da >';
    lbEntSai.Font.Color       := $00076DF8;
    cbEntradaUnitaria.Caption := 'Sa�da unit�ria';
  end
  else begin
    lbEntSai.Caption          := 'Quantidade a dar entrada >';
    lbEntSai.Font.Color       := $0000A400;
    cbEntradaUnitaria.Caption := 'Entrada unit�ria';
  end;
end;

procedure TfrmEntradaManualEstoque.edtQtdEntradaChange(Sender: TObject);
begin
  if chkSaida.Checked then
    if edtQtdEntrada.Value > edtEstoqueAtual.Value then
      edtQtdEntrada.Value := edtEstoqueAtual.Value;
end;

procedure TfrmEntradaManualEstoque.salva_entradaSaida;
var EntradaSaida :TEntradaSaida;
    repositorio  :TRepositorio;
begin
 try
   EntradaSaida := TEntradaSaida.Create;
   repositorio := TFabricaRepositorio.GetRepositorio(TEntradaSaida.ClassName);

   EntradaSaida.codigo_produto   := BuscaProduto1.CodigoProduto;
   EntradaSaida.codigo_cor       := BuscaCor1.CodigoCor;
   EntradaSaida.codigo_tamanho   := strToInt( Campo_por_campo('TAMANHOS', 'CODIGO', 'DESCRICAO', rgTamanhos.Items[rgTamanhos.itemIndex]) );
   EntradaSaida.data_lancamento  := Date;
   EntradaSaida.lote             := edtLote.AsInteger;
   EntradaSaida.setor            := cbxSetor.ItemIndex + 1;

   if (entrada_saida = 0) then begin
     EntradaSaida.data_producao    := dtpDataProducao.Date;
     EntradaSaida.codigo_intervalo := ListaIntervalos.CodCampo;
   end;
      
   EntradaSaida.quantidade       := edtQtdEntrada.Value;
   EntradaSaida.tipo             := IfThen(entrada_saida = 0, 'E', 'S');

   repositorio.Salvar(EntradaSaida);
 Finally
   FreeAndNil(repositorio);
   FreeAndNil(EntradaSaida);
 end;
end;

function TfrmEntradaManualEstoque.validaObrigatoriedades: Boolean;
begin
  result := false;

  if rgTamanhos.ItemIndex < 0 then begin
    avisar('Favor, informar o tamanho');
    rgTamanhos.SetFocus;
  end
  else if not (edtQtdEntrada.Value > 0) then begin
    avisar('A quantidade de entrada n�o foi informada');
    edtQtdEntrada.SetFocus;
  end
  else if (edtQtdEntrada.Value > 1000) then begin
    avisar('Quantidade de entrada inv�lida!');
    edtQtdEntrada.SetFocus;
  end
  else if (ListaIntervalos.Visible) and (ListaIntervalos.CodCampo <= 0) then begin
    avisar('Intervalo de produ��o deve ser informado');
    ListaIntervalos.comListaCampo.SetFocus;
  end
  else if not assigned(FConfiguracoes) and (cbxSetor.ItemIndex = 1) then
  begin
    avisar('Antes de movimentar o estoque do e-commerce efetue o cadastro das configura��es do mesmo');
  end
  else
    result := true;
end;

procedure TfrmEntradaManualEstoque.BuscaCor1Enter(Sender: TObject);
begin
    BuscaCor1.FiltroProduto := BuscaProduto1.codproduto;
end;

end.
