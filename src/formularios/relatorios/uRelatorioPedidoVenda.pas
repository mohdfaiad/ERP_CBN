unit uRelatorioPedidoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, pngimage, RLParser, RLFilters, RLPDFFilter, Pedido, uPadrao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmRelatorioPedidoVenda = class(TfrmPadrao)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    lblTitulo: TRLLabel;
    RLLabel2: TRLLabel;
    lblaprovado: TRLLabel;
    RLBand2: TRLBand;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    lblCidade: TRLLabel;
    lblCliente: TRLLabel;
    lblRepres: TRLLabel;
    lblpedido: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLDBText16: TRLDBText;
    RLBand5: TRLBand;
    RLDraw6: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw1: TRLDraw;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText17: TRLDBText;
    RLDraw2: TRLDraw;
    RLDBText3: TRLDBText;
    RLBand4: TRLBand;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLBand6: TRLBand;
    RLLabel4: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    lblTransp: TRLLabel;
    lblFilial: TRLLabel;
    DataSource2: TDataSource;
    DataSource1: TDataSource;
    RLLabel22: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLDBText1: TRLDBText;
    RLBand7: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLDBResult7: TRLDBResult;
    RLDBResult8: TRLDBResult;
    RLDBResult10: TRLDBResult;
    RLDBResult11: TRLDBResult;
    RLDBResult12: TRLDBResult;
    RLDBText18: TRLDBText;
    RLDBResult13: TRLDBResult;
    RLLabel28: TRLLabel;
    RLBand8: TRLBand;
    RLLabel29: TRLLabel;
    RLDBResult14: TRLDBResult;
    RLLabel30: TRLLabel;
    lblEndereco: TRLLabel;
    lblCpfCnpj: TRLLabel;
    lblIE: TRLLabel;
    lblCep: TRLLabel;
    lblFone: TRLLabel;
    lblFPag: TRLLabel;
    lblDtEmis: TRLLabel;
    RLDraw7: TRLDraw;
    RLLabel20: TRLLabel;
    RLImage1: TRLImage;
    RLDBResult9: TRLDBResult;
    RLExpressionParser1: TRLExpressionParser;
    RLMemo1: TRLMemo;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel21: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel31: TRLLabel;
    rlbCancelado: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLLabel32: TRLLabel;
    RLDBText19: TRLDBText;
    RLDBResult16: TRLDBResult;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLLabel33: TRLLabel;
    RLDBText24: TRLDBText;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLDraw8: TRLDraw;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLDBResult15: TRLDBResult;
    RLDraw9: TRLDraw;
    RLReport2: TRLReport;
    RLBand9: TRLBand;
    RLLabel39: TRLLabel;
    RLLabel40: TRLLabel;
    RLLabel41: TRLLabel;
    RLLabel42: TRLLabel;
    RLLabel43: TRLLabel;
    rlbFoi: TRLLabel;
    rlbtotalbruto: TRLLabel;
    rlbTotalLiquido: TRLLabel;
    rlbTotalPecas: TRLLabel;
    rlbTotalReferencias: TRLLabel;
    qryPedido: TFDQuery;
    qryPedidoCODIGO: TIntegerField;
    qryPedidoNUMPEDIDO: TStringField;
    qryPedidoCOD_TAB_PRECO: TIntegerField;
    qryPedidoCOD_FORMA_PAG: TIntegerField;
    qryPedidoCOD_FILIAL: TIntegerField;
    qryPedidoCOD_FILIAL_DIGI: TIntegerField;
    qryPedidoCOD_CLIENTE: TIntegerField;
    qryPedidoCOD_TRANSP: TIntegerField;
    qryPedidoCOD_REPRES: TIntegerField;
    qryPedidoDT_CADASTRO: TDateField;
    qryPedidoDT_REPRESENTANTE: TDateField;
    qryPedidoDT_RECEBIMENTO: TDateField;
    qryPedidoDESCONTO: TBCDField;
    qryPedidoACRESCIMO: TBCDField;
    qryPedidoCOMISSAO: TBCDField;
    qryPedidoVALOR_TOTAL: TBCDField;
    qryPedidoAPROVACAO: TStringField;
    qryPedidoAPROVADO_POR: TStringField;
    qryPedidoOBSERVACAO: TStringField;
    qryPedidoTIPO_FRETE: TIntegerField;
    qryPedidoDT_ENTREGA: TDateField;
    qryPedidoDT_LIMITE_ENTREGA: TDateField;
    qryPedidoDT_APROVACAO: TDateField;
    qryPedidoDESCONTO_FPGTO: TBCDField;
    qryPedidoDESPACHADO: TStringField;
    qryPedidoDT_DESPACHO: TDateField;
    qryPedidoDESCONTO_ITENS: TBCDField;
    qryPedidoCOD_PEDIDO_MATRIZ: TIntegerField;
    qryPedidoDESCONTO_COMISS: TBCDField;
    qryPedidoCANCELADO: TStringField;
    qryPedidoCLIENTE: TStringField;
    qryPedidoFONE1: TStringField;
    qryPedidoCPF_CNPJ: TStringField;
    qryPedidoRG_IE: TStringField;
    qryPedidoREPRESENTANTE: TStringField;
    qryPedidoCIDADE: TStringField;
    qryPedidoUF: TStringField;
    qryPedidoFPGTO: TStringField;
    qryPedidoLOGRADOURO: TStringField;
    qryPedidoNUMERO: TStringField;
    qryPedidoBAIRRO: TStringField;
    qryPedidoCEP: TStringField;
    qryPedidoEMPRESA: TStringField;
    qryPedidoTRANSPORTADORA: TStringField;
    qryItens: TFDQuery;
    qryItensCODIGO: TIntegerField;
    qryItensCOD_PEDIDO: TIntegerField;
    qryItensCOD_PRODUTO: TIntegerField;
    qryItensCOD_COR: TIntegerField;
    qryItensPRECO: TBCDField;
    qryItensDESCONTO: TBCDField;
    qryItensVALOR_TOTAL: TBCDField;
    qryItensQTD_RN: TIntegerField;
    qryItensQTD_P: TIntegerField;
    qryItensQTD_M: TIntegerField;
    qryItensQTD_G: TIntegerField;
    qryItensQTD_1: TIntegerField;
    qryItensQTD_2: TIntegerField;
    qryItensQTD_3: TIntegerField;
    qryItensQTD_4: TIntegerField;
    qryItensQTD_6: TIntegerField;
    qryItensQTD_8: TIntegerField;
    qryItensQTD_UNICA: TBCDField;
    qryItensQTD_TOTAL: TBCDField;
    qryItensOBSERVACAO: TStringField;
    qryItensREFCOR: TStringField;
    qryItensREFPRO: TStringField;
    qryItensPRODUTO: TStringField;
    qryItensGRUPO: TStringField;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    function formataCPF(cpf:String):String;
    function formataCNPJ(cnpj:String):String;
  public
    {  imprime pedido de venda   }
    procedure imprime(pedido :String);
    procedure imprimeVerso(Pedido :TPedido);
  end;

var
  frmRelatorioPedidoVenda: TfrmRelatorioPedidoVenda;

implementation

uses uModulo, Item, Produto;

{$R *.dfm}

function TfrmRelatorioPedidoVenda.formataCNPJ(cnpj: String): String;
begin
  Result := Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'\'+Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);
end;

function TfrmRelatorioPedidoVenda.formataCPF(cpf: String): String;
begin
  Result := Copy(CPF,1,3)+'.'+Copy(CPF,4,3)+'.'+Copy(CPF,7,3)+'-'+Copy(CPF,10,2);
end;

procedure TfrmRelatorioPedidoVenda.imprime(pedido: String);
begin
  qryPedido.Connection :=  dm.conexao;

  qryPedido.Close;
  qryPedido.ParamByName('codped').AsString := pedido;
  qryPedido.Open;

  if qryPedido.IsEmpty then begin
    raise Exception.Create('Não foi encontrado um pedido com o  nº '+pedido);
    exit;
  end;

  qryItens.Connection := dm.conexao;

  qryItens.Close;
  qryItens.ParamByName('codped').AsInteger := qryPedido.fieldByName('codigo').asInteger;
  qryItens.Open;

  RLReport1.PreviewModal;
end;

procedure TfrmRelatorioPedidoVenda.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  lblpedido.Caption     := qryPedidoNUMPEDIDO.AsString;
  lblFPag.Caption       := qryPedidoCOD_FORMA_PAG.AsString + ' - ' + qryPedidoFPGTO.AsString;
  lblDtEmis.Caption     := qryPedidoDT_CADASTRO.AsString;
  lblCliente.Caption    := qryPedidoCOD_CLIENTE.AsString + '  ' + qryPedidoCLIENTE.AsString;
  lblEndereco.Caption   := qryPedidoLOGRADOURO.AsString + '  Nº '+qryPedidoNUMERO.AsString;
  lblCidade.Caption     := qryPedidoCIDADE.AsString;
  lblCep.Caption        := qryPedidoCEP.AsString;
  lblFone.Caption       := qryPedidoFONE1.AsString;

  if length(qryPedidoCPF_CNPJ.AsString) < 14 then
    lblCpfCnpj.Caption    := formataCPF( qryPedidoCPF_CNPJ.AsString)
  else
    lblCpfCnpj.Caption    := formataCNPJ(qryPedidoCPF_CNPJ.AsString);

  lblIE.Caption         := qryPedidoRG_IE.AsString;
  lblFilial.Caption     := qryPedidoEMPRESA.AsString;
  lblTransp.Caption     := qryPedidoTRANSPORTADORA.AsString;
  lblRepres.Caption     := qryPedidoREPRESENTANTE.AsString;
  RLMemo1.Lines.Text    := qryPedidoOBSERVACAO.Text;

  rlbCancelado.Visible  := (qryPedidoCANCELADO.AsString = 'S');
end;

procedure TfrmRelatorioPedidoVenda.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLDBText3.Visible  := true;
  RLDBText4.Visible  := true;
  RLDBText5.Visible  := true;
  RLDBText6.Visible  := true;
  RLDBText7.Visible  := true;
  RLDBText8.Visible  := true;
  RLDBText9.Visible  := true;
  RLDBText10.Visible := true;
  RLDBText11.Visible := true;
  RLDBText12.Visible := true;
  RLDBText13.Visible := true;

  if qryItensQTD_RN.AsInteger    <= 0  then  RLDBText3.Visible := false;
  if qryItensQTD_P.AsInteger     <= 0  then  RLDBText4.Visible := false;
  if qryItensQTD_M.AsInteger     <= 0  then  RLDBText5.Visible := false;
  if qryItensQTD_G.AsInteger     <= 0  then  RLDBText6.Visible := false;
  if qryItensQTD_1.AsInteger     <= 0  then  RLDBText7.Visible := false;
  if qryItensQTD_2.AsInteger     <= 0  then  RLDBText8.Visible := false;
  if qryItensQTD_3.AsInteger     <= 0  then  RLDBText9.Visible := false;
  if qryItensQTD_4.AsInteger     <= 0  then  RLDBText10.Visible := false;
  if qryItensQTD_6.AsInteger     <= 0  then  RLDBText11.Visible := false;
  if qryItensQTD_8.AsInteger     <= 0  then  RLDBText12.Visible := false;
  if qryItensQTD_UNICA.AsInteger <= 0  then  RLDBText13.Visible := false;
end;

procedure TfrmRelatorioPedidoVenda.imprimeVerso(Pedido: TPedido);
var
  data :String;
  tot_liquido, tot_bruto :Real;
  i, tot_referencias, tot_pecas :integer;

begin
  tot_liquido     := 0;
  tot_bruto       := 0;
  tot_referencias := 0;
  tot_pecas       := 0;
  data            := '';

  for i := 0 to Pedido.Itens.Count - 1 do
  begin
    tot_pecas := tot_pecas + TItem(Pedido.Itens[i]).Produto.Qtd_Pecas;
  end;

  tot_referencias := Pedido.Itens.Count;
  tot_liquido     := Pedido.valor_total;
  tot_bruto       := Pedido.valor_total_bruto;

  try
    data            := chamaInput('DATE','Digite a data');
  Except
    avisar('Data inválida. Operação cancelada.');
    exit;
  end;

  rlbFoi.Caption              := data;
  rlbtotalbruto.Caption       := formatFloat('R$ ,0.00;R$ -,0.00', tot_bruto);
  rlbTotalLiquido.Caption     := formatFloat('R$ ,0.00;R$ -,0.00', tot_bruto);
  rlbTotalReferencias.Caption := IntToStr(tot_referencias);
  rlbTotalPecas.Caption       := IntToStr(tot_pecas);

  RLReport2.PreviewModal;
end;

end.
