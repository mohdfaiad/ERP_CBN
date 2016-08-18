unit uRelatorioTotalizarEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, frameBuscaProduto2,
  RLReport, DB, DBClient,
  frameBuscaTabelaPreco, RLParser, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, RLFilters, RLPDFFilter;

type
    TfrmRelatorioTotalizarEstoque = class(TfrmPadrao)
    Panel1: TPanel;
    btnImprimir: TBitBtn;
    BuscaProduto2: TBuscaProduto2;
    RLTotalizarEstoque: TRLReport;
    dsTotalizarEstoque: TDataSource;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    cdsEstoque: TClientDataSet;
    cdsEstoqueCOR: TStringField;
    cdsEstoqueQTD_RN: TFloatField;
    cdsEstoqueQTD_P: TFloatField;
    cdsEstoqueQTD_M: TFloatField;
    cdsEstoqueQTD_G: TFloatField;
    cdsEstoqueQTD_1: TFloatField;
    cdsEstoqueQTD_2: TFloatField;
    cdsEstoqueQTD_3: TFloatField;
    cdsEstoqueQTD_4: TFloatField;
    cdsEstoqueQTD_6: TFloatField;
    cdsEstoqueQTD_8: TFloatField;
    cdsEstoqueQTD_UNICA: TFloatField;
    cdsEstoqueQTD_TOTAL: TFloatField;
    cdsEstoqueREFERENCIA: TStringField;
    cdsEstoquePRODUTO: TStringField;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLDraw1: TRLDraw;
    RLBand3: TRLBand;
    RLDBText15: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel17: TRLLabel;
    RLDraw2: TRLDraw;
    RLBand5: TRLBand;
    RLDraw3: TRLDraw;
    RLLabel18: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLBand6: TRLBand;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel19: TRLLabel;
    BuscaTabelaPreco1: TBuscaTabelaPreco;
    cdsEstoquePRECOTABELA: TFloatField;
    RLDBResult3: TRLDBResult;
    RLLabel20: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel21: TRLLabel;
    cdsEstoqueVALORESTOQUE: TFloatField;
    RLDraw5: TRLDraw;
    RLExpressionParser1: TRLExpressionParser;
    RLDBResult4: TRLDBResult;
    cdsValorTotal: TClientDataSet;
    cdsValorTotalVALOR: TFloatField;
    dsTotal: TDataSource;
    RLLabel22: TRLLabel;
    RLDBText16: TRLDBText;
    cdsEstoqueREFPRODUTO: TStringField;
    chkEstoqueReservado: TCheckBox;
    RLDBResult16: TRLDBResult;
    RLDBResult17: TRLDBResult;
    RLDBResult18: TRLDBResult;
    RLDBResult19: TRLDBResult;
    RLDBResult20: TRLDBResult;
    RLDBResult21: TRLDBResult;
    RLDBResult22: TRLDBResult;
    RLDBResult23: TRLDBResult;
    RLDBResult24: TRLDBResult;
    RLDBResult25: TRLDBResult;
    RLDBResult26: TRLDBResult;
    RLDBResult27: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLDBResult7: TRLDBResult;
    RLDBResult8: TRLDBResult;
    RLDBResult9: TRLDBResult;
    RLDBResult10: TRLDBResult;
    RLDBResult11: TRLDBResult;
    RLDBResult12: TRLDBResult;
    RLDBResult13: TRLDBResult;
    RLDBResult14: TRLDBResult;
    RLDBResult15: TRLDBResult;
    cdsEstoqueQTD_GG: TIntegerField;
    qry: TFDQuery;
    QryF: TFDQuery;
    qryEstoqueReservado: TFDQuery;
    qryREFPRODUTO: TStringField;
    qryPRODUTO: TStringField;
    qryREFERENCIA: TStringField;
    qryCOR: TStringField;
    qryTAM: TStringField;
    qryQUANTIDADE: TBCDField;
    QryFPRECO: TBCDField;
    qryEstoqueReservadoQTD_RN: TLargeintField;
    qryEstoqueReservadoQTD_P: TLargeintField;
    qryEstoqueReservadoQTD_M: TLargeintField;
    qryEstoqueReservadoQTD_G: TLargeintField;
    qryEstoqueReservadoQTD_1: TLargeintField;
    qryEstoqueReservadoQTD_2: TLargeintField;
    qryEstoqueReservadoQTD_3: TLargeintField;
    qryEstoqueReservadoQTD_4: TLargeintField;
    qryEstoqueReservadoQTD_6: TLargeintField;
    qryEstoqueReservadoQTD_8: TLargeintField;
    qryEstoqueReservadoQTD_UNICA: TLargeintField;
    qryEstoqueReservadoREFPRODUTO: TStringField;
    qryEstoqueReservadoREFCOR: TStringField;
    RLPDFFilter1: TRLPDFFilter;
    chkSomenteLoja: TCheckBox;
    cdsEstoqueQTD_10: TIntegerField;
    cdsEstoqueQTD_12: TIntegerField;
    cdsEstoqueQTD_14: TIntegerField;
    qryEstoqueReservadoQTD_10: TLargeintField;
    qryEstoqueReservadoQTD_12: TLargeintField;
    qryEstoqueReservadoQTD_14: TLargeintField;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBResult28: TRLDBResult;
    RLDBResult29: TRLDBResult;
    RLDBResult30: TRLDBResult;
    RLDBResult31: TRLDBResult;
    RLDBResult32: TRLDBResult;
    RLDBResult33: TRLDBResult;
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure RLDBResult4BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure chkSomenteLojaClick(Sender: TObject);

  private
    Valor: Currency;
    procedure subtrai_estoque_reservado;
    procedure TotalizarEstoque;

  public
    { Public declarations }
  end;

var
  frmRelatorioTotalizarEstoque: TfrmRelatorioTotalizarEstoque;

implementation

uses PermissoesAcesso, RxCurrEdit, StrUtils;

{$R *.dfm}

procedure TfrmRelatorioTotalizarEstoque.chkSomenteLojaClick(Sender: TObject);
begin
  if chkSomenteLoja.Checked then
  begin
    BuscaProduto2.Limpar;
    BuscaProduto2.produtosLoja := true;
  end;
end;

procedure TfrmRelatorioTotalizarEstoque.FormShow(Sender: TObject);
begin
  //inherited;
  Valor:= 0;
  BuscaProduto2.edtCodColecao.SetFocus;
  if TPermissoesAcesso.ExibirComPermissao(49) then
  begin
    BuscaTabelaPreco1.Visible := False;
    Self.Height               := 320;
    chkEstoqueReservado.Top   := 210;
  end
  else
  begin
    BuscaTabelaPreco1.Visible:= True;
    Self.Height:= 371;
    chkEstoqueReservado.Top   := 265;
  end;
end;

procedure TfrmRelatorioTotalizarEstoque.TotalizarEstoque;
var cWhere, Cor, Produto : String;
    i  : Integer;
    quantidade :Real;
begin
  Aguarda('Buscando informações... Aguarde...');
  if not cdsEstoque.Active then
    cdsEstoque.CreateDataSet;

  cdsEstoque.EmptyDataSet;
  if not cdsValorTotal.Active then
    cdsValorTotal.CreateDataSet;

  cdsValorTotal.EmptyDataSet;
  cWhere:= '';
  Produto := '';
  Cor:= '';

  if BuscaProduto2.edtCodColecao.AsInteger > 0 then
    cWhere:= 'WHERE CORES.codigo_colecao = '+BuscaProduto2.edtCodColecao.Text+' ';

  if BuscaProduto2.edtReferencia.Text <> '' then
    cWhere:= cWhere + IfThen(cWhere <> '', 'AND', 'WHERE')+' PRODUTOS.REFERENCIA = '+QuotedStr(BuscaProduto2.edtReferencia.Text)+' ';
  if BuscaProduto2.edtRefCor.Text <> '' then
    cWhere:= cWhere+'AND CORES.REFERENCIA = '+QuotedStr(BuscaProduto2.edtRefCor.Text)+' ';
  if BuscaProduto2.edtCodTamanho.Text <> '' then
    cWhere:= cWhere+'AND ESTOQUE.CODIGO_TAMANHO = '+BuscaProduto2.edtCodTamanho.Text+' ';
  if cWhere <> '' then
    cWhere := cWhere+'AND PRODUTOS.REFERENCIA IS NOT NULL '
  else
    cWhere := 'WHERE PRODUTOS.REFERENCIA IS NOT NULL ';

  if chkSomenteLoja.Checked then
    cWhere := cWhere + 'AND (PRODUTOS.REFERENCIA LIKE ''%L'' or produtos.referencia = ''KGLOJA'')';


  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Add('SELECT PRODUTOS.REFERENCIA AS REFPRODUTO,                                                        '+
              'PRODUTOS.REFERENCIA||'' - ''||PRODUTOS.DESCRICAO || iif(PRODUTOS.ativo = ''S'', '''', '' - Eliminado'') AS PRODUTO, '+
              'CORES.REFERENCIA AS REFERENCIA, iif((cores.desc_producao is null) or (TRIM(cores.desc_producao) = ''''), cores.descricao, cores.desc_producao|| '' '' ||cores.cor) cor, '+
              'TAMANHOS.DESCRICAO AS TAM, ESTOQUE.QUANTIDADE                                                    '+
              'FROM ESTOQUE                                                                                     '+
              'LEFT OUTER JOIN PRODUTOS ON (PRODUTOS.CODIGO = ESTOQUE.CODIGO_PRODUTO)                           '+
              'LEFT OUTER JOIN TAMANHOS ON (TAMANHOS.CODIGO = ESTOQUE.CODIGO_TAMANHO)                           '+
              'LEFT OUTER JOIN CORES ON (CORES.CODIGO = ESTOQUE.CODIGO_COR)                                     '+
              cWhere+ ' and ESTOQUE.QUANTIDADE > 0                                                              '+
              'ORDER BY 1, CORES.REFERENCIA');

  Qry.Open;
  if Qry.IsEmpty then
  begin
    Self.avisar('Não há dados para a impressão. Por favor, verifique.');
    BuscaProduto2.edtReferencia.SetFocus;
    Exit;
  end;

  Qry.First;
  while not Qry.Eof do
  begin

    Application.ProcessMessages;
    if (Produto = Qry.FieldByName('REFPRODUTO').AsString) and (Cor = Qry.FieldByName('COR').AsString) then
      cdsEstoque.Edit
    else
      cdsEstoque.Append;

    cdsEstoqueREFPRODUTO.AsString := Qry.FieldByName('REFPRODUTO').AsString;
    cdsEstoquePRODUTO.AsString    := Qry.FieldByName('PRODUTO').AsString;
    if BuscaTabelaPreco1.edtCodigo.Value <> 0 then
    begin
      QryF.Close;
      QryF.SQL.Clear;
      QryF.SQL.Add('SELECT PRODUTO_TABELA_PRECO.PRECO                                               '+
                   'FROM PRODUTO_TABELA_PRECO                                                       '+
                   'LEFT OUTER JOIN PRODUTOS ON (PRODUTOS.CODIGO = PRODUTO_TABELA_PRECO.CODPRODUTO) '+
                   'WHERE PRODUTO_TABELA_PRECO.CODTABELA = '+CurrToStr(BuscaTabelaPreco1.edtCodigo.Value)+' AND '+
                   'PRODUTOS.REFERENCIA = '+QuotedStr(Qry.FieldByName('REFPRODUTO').AsString));
      QryF.Open;

      if not QryF.IsEmpty then
        cdsEstoquePRECOTABELA.AsFloat:= QryF.Fields[0].AsFloat
      else
        cdsEstoquePRECOTABELA.AsFloat:= 0;
    end;

    cdsEstoqueREFERENCIA.AsString:= Qry.FieldByName('REFERENCIA').AsString;
    cdsEstoqueCOR.AsString:= Qry.FieldByName('COR').AsString;

    cdsEstoque.FieldByName('QTD_'+Qry.FieldByName('TAM').AsString).AsFloat := cdsEstoque.FieldByName('QTD_'+Qry.FieldByName('TAM').AsString).AsFloat +
                                                                              Qry.FieldByName('QUANTIDADE').AsFloat;
    cdsEstoqueQTD_TOTAL.AsFloat                                            := cdsEstoqueQTD_TOTAL.AsFloat + Qry.FieldByName('QUANTIDADE').AsFloat;

   { for i:= 1 to cdsEstoque.Fields.Count - 1 do
    begin

      if cdsEstoque.Fields[i].FieldName = 'QTD_'+Qry.FieldByName('TAM').AsString then
      begin
        Application.ProcessMessages;
        cdsEstoque.Fields[i].AsFloat:= cdsEstoque.Fields[i].AsFloat + Qry.FieldByName('QUANTIDADE').AsFloat;
        cdsEstoqueQTD_TOTAL.AsFloat:= cdsEstoqueQTD_TOTAL.AsFloat + Qry.FieldByName('QUANTIDADE').AsFloat;

        Break;
      end;
    end;  }

    cdsEstoque.Post;

    Cor     := Qry.FieldByName('COR').AsString;
    Produto := Qry.FieldByName('REFPRODUTO').AsString;
    Qry.Next;
  end;

  if BuscaTabelaPreco1.edtCodigo.Value <> 0 then
  begin
    RLGroup1.Height:= 120;
    RLBand4.Height:= 67;
    RLDraw4.Visible:= True;
    RLLabel20.Visible:= True;
    RLLabel21.Visible:= True;
    RLDBResult3.Visible:= True;
    RLDBResult4.Visible:= True;
    RLDraw5.Visible:= True;
    RLLabel22.Visible:= True;
    RLDBText16.Visible:= True;
  end
  else
  begin
    RLGroup1.Height:= 82;
    RLBand4.Height:= 25;
    RLDraw4.Visible:= False;
    RLLabel20.Visible:= False;
    RLLabel21.Visible:= False;
    RLDBResult3.Visible:= False;
    RLDBResult4.Visible:= False;
    RLDraw5.Visible:= False;
    RLLabel22.Visible:= False;
    RLDBText16.Visible:= False;
  end;

  if chkEstoqueReservado.Checked then
    subtrai_estoque_reservado;

  Application.ProcessMessages;
  FimAguarda('Gerando Relatório...');
  RLTotalizarEstoque.PreviewModal;
  Valor:= 0;
end;

procedure TfrmRelatorioTotalizarEstoque.btnImprimirClick(Sender: TObject);
begin
  inherited;
  TotalizarEstoque;
end;

procedure TfrmRelatorioTotalizarEstoque.RLDBResult4BeforePrint(
  Sender: TObject; var Text: String; var PrintIt: Boolean);
begin
  if Valor = 0 then
    cdsValorTotal.Append
  else
    cdsValorTotal.Edit;
  Valor:= Valor + RLDBResult4.Value;
  cdsValorTotalVALOR.AsFloat:= Valor;
  cdsValorTotal.Post;
end;

procedure TfrmRelatorioTotalizarEstoque.subtrai_estoque_reservado;
var condicoes :String;
begin

  if BuscaProduto2.edtReferencia.Text <> '' then
    condicoes := ' and i.cod_produto = '+IntToStr(BuscaProduto2.CodigoProduto);

  if BuscaProduto2.edtRefCor.Text <> '' then
    condicoes := condicoes + ' and cor.codigo = '+IntToStr(BuscaProduto2.CodigoCor);


  qryEstoqueReservado.Close;
  qryEstoqueReservado.SQL.Text := 'select sum(ci.qtd_rn) QTD_RN, sum(ci.qtd_p) QTD_P, sum(ci.qtd_m) QTD_M, sum(ci.qtd_g) QTD_G,    '+
                                  ' sum(ci.qtd_1) QTD_1, sum(ci.qtd_2) QTD_2, sum(ci.qtd_3) QTD_3, sum(ci.qtd_4) QTD_4,            '+
                                  ' sum(ci.qtd_6) QTD_6, sum(ci.qtd_8) QTD_8, sum(ci.qtd_10) QTD_10, sum(ci.qtd_12) QTD_12,        '+
                                  ' sum(ci.qtd_14) QTD_14, sum(ci.qtd_unica) QTD_unica,                                            '+
                                  ' pro.referencia REFPRODUTO , cor.referencia REFCOR                       from ITENS i           '+

                                  ' left join conferencia_itens  ci on ci.codigo_item = i.codigo                                   '+
                                  ' left join conferencia_pedido cp on cp.codigo = ci.codigo_conferencia                           '+
                                  ' left join cores              cor on cor.codigo = i.cod_cor                                     '+
                                  ' left join produtos           pro on pro.codigo = i.cod_produto                                 '+

                                  ' where cp.fim < ''01.01.1900'' ' + condicoes +

                                  ' group by pro.referencia, cor.referencia                                                        '+
                                  ' order by pro.referencia, cor.referencia                                                        ';

  qryEstoqueReservado.Open;

  if qryEstoqueReservado.IsEmpty then
    Exit;

  qryEstoqueReservado.First;
  while not qryEstoqueReservado.Eof do begin

   if cdsEstoque.Locate('REFPRODUTO;REFERENCIA',varArrayOf([qryEstoqueReservadoREFPRODUTO.AsString, qryEstoqueReservadoREFCOR.AsString]),[]) then
    begin
      cdsEstoque.Edit;

      if cdsEstoqueQTD_RN.AsInteger > 0 then begin
        cdsEstoqueQTD_RN.AsInteger    := cdsEstoqueQTD_RN.AsInteger - qryEstoqueReservadoQTD_RN.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_RN.AsInteger;
      end;
      
      if cdsEstoqueQTD_P.AsInteger > 0 then begin
        cdsEstoqueQTD_P.AsInteger := cdsEstoqueQTD_P.AsInteger - qryEstoqueReservadoQTD_P.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_P.AsInteger;
      end;

      if cdsEstoqueQTD_M.AsInteger > 0 then begin
        cdsEstoqueQTD_M.AsInteger := cdsEstoqueQTD_M.AsInteger - qryEstoqueReservadoQTD_M.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_M.AsInteger;
      end;

      if cdsEstoqueQTD_G.AsInteger > 0 then begin
        cdsEstoqueQTD_G.AsInteger := cdsEstoqueQTD_G.AsInteger - qryEstoqueReservadoQTD_G.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_G.AsInteger;
      end;

      if cdsEstoqueQTD_1.AsInteger > 0 then begin
        cdsEstoqueQTD_1.AsInteger := cdsEstoqueQTD_1.AsInteger - qryEstoqueReservadoQTD_1.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_1.AsInteger;
      end;

      if cdsEstoqueQTD_2.AsInteger > 0 then begin
        cdsEstoqueQTD_2.AsInteger := cdsEstoqueQTD_2.AsInteger - qryEstoqueReservadoQTD_2.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_2.AsInteger;
      end;

      if cdsEstoqueQTD_3.AsInteger > 0 then begin
        cdsEstoqueQTD_3.AsInteger := cdsEstoqueQTD_3.AsInteger - qryEstoqueReservadoQTD_3.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_3.AsInteger;
      end;

      if cdsEstoqueQTD_4.AsInteger > 0 then begin
        cdsEstoqueQTD_4.AsInteger := cdsEstoqueQTD_4.AsInteger - qryEstoqueReservadoQTD_4.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_4.AsInteger;
      end;

      if cdsEstoqueQTD_6.AsInteger > 0 then begin
        cdsEstoqueQTD_6.AsInteger := cdsEstoqueQTD_6.AsInteger - qryEstoqueReservadoQTD_6.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_6.AsInteger;
      end;

      if cdsEstoqueQTD_8.AsInteger > 0 then begin
        cdsEstoqueQTD_8.AsInteger := cdsEstoqueQTD_8.AsInteger - qryEstoqueReservadoQTD_8.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_8.AsInteger;
      end;

      if cdsEstoqueQTD_10.AsInteger > 0 then begin
        cdsEstoqueQTD_10.AsInteger := cdsEstoqueQTD_10.AsInteger - qryEstoqueReservadoQTD_10.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_10.AsInteger;
      end;

      if cdsEstoqueQTD_12.AsInteger > 0 then begin
        cdsEstoqueQTD_12.AsInteger := cdsEstoqueQTD_8.AsInteger - qryEstoqueReservadoQTD_12.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_12.AsInteger;
      end;

      if cdsEstoqueQTD_14.AsInteger > 0 then begin
        cdsEstoqueQTD_14.AsInteger := cdsEstoqueQTD_14.AsInteger - qryEstoqueReservadoQTD_14.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_14.AsInteger;
      end;

      if cdsEstoqueQTD_UNICA.AsInteger > 0 then begin
        cdsEstoqueQTD_UNICA.AsInteger := cdsEstoqueQTD_UNICA.AsInteger - qryEstoqueReservadoQTD_UNICA.AsInteger;
        cdsEstoqueQTD_TOTAL.AsInteger := cdsEstoqueQTD_TOTAL.AsInteger - qryEstoqueReservadoQTD_UNICA.AsInteger;
      end;

      cdsEstoque.Post;
    end;

    qryEstoqueReservado.Next;
  end;

end;

procedure TfrmRelatorioTotalizarEstoque.RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLDBResult5.Visible  := RLDBResult5.Value > 0;
  RLDBResult6.Visible  := RLDBResult6.Value > 0;
  RLDBResult7.Visible  := RLDBResult7.Value > 0;
  RLDBResult8.Visible  := RLDBResult8.Value > 0;
  RLDBResult9.Visible  := RLDBResult9.Value > 0;
  RLDBResult10.Visible := RLDBResult10.Value > 0;
  RLDBResult11.Visible := RLDBResult11.Value > 0;
  RLDBResult12.Visible := RLDBResult12.Value > 0;
  RLDBResult13.Visible := RLDBResult13.Value > 0;
  RLDBResult14.Visible := RLDBResult14.Value > 0;
  RLDBResult15.Visible := RLDBResult15.Value > 0;
  RLDBResult31.Visible := RLDBResult31.Value > 0;
  RLDBResult32.Visible := RLDBResult32.Value > 0;
  RLDBResult33.Visible := RLDBResult33.Value > 0;
end;

procedure TfrmRelatorioTotalizarEstoque.RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLDBResult16.Visible := RLDBResult16.Value > 0;
  RLDBResult17.Visible := RLDBResult17.Value > 0;
  RLDBResult18.Visible := RLDBResult18.Value > 0;
  RLDBResult19.Visible := RLDBResult19.Value > 0;
  RLDBResult20.Visible := RLDBResult20.Value > 0;
  RLDBResult21.Visible := RLDBResult21.Value > 0;
  RLDBResult22.Visible := RLDBResult22.Value > 0;
  RLDBResult23.Visible := RLDBResult23.Value > 0;
  RLDBResult24.Visible := RLDBResult24.Value > 0;
  RLDBResult25.Visible := RLDBResult25.Value > 0;
  RLDBResult26.Visible := RLDBResult26.Value > 0;
  RLDBResult28.Visible := RLDBResult28.Value > 0;
  RLDBResult29.Visible := RLDBResult29.Value > 0;
  RLDBResult30.Visible := RLDBResult30.Value > 0;
end;

end.
