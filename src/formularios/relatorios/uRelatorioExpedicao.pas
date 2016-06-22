unit uRelatorioExpedicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB,
  pngimage, Provider, DBClient, RLFilters, RLPDFFilter, StringUtilitario,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmRelatorioExpedicao = class(TForm)
    RLReport1: TRLReport;
    DataSource1: TDataSource;
    RLBand1: TRLBand;
    lblTitulo: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    lblaprovado: TRLLabel;
    RLBand2: TRLBand;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    lblCidade: TRLLabel;
    RLLabel9: TRLLabel;
    DataSource2: TDataSource;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLBand5: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
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
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDraw2: TRLDraw;
    RLBand4: TRLBand;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw6: TRLDraw;
    lblCliente: TRLLabel;
    lblRepresentante: TRLLabel;
    lblpedido: TRLLabel;
    lblrecebimento: TRLLabel;
    lblperiodo: TRLLabel;
    RLBand6: TRLBand;
    RLBand7: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLImage1: TRLImage;
    lblDtRepres: TRLLabel;
    RLLabel8: TRLLabel;
    lblDtCad: TRLLabel;
    RLLabel14: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel31: TRLLabel;
    RLLabel13: TRLLabel;
    RLBand8: TRLBand;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLDraw13: TRLDraw;
    RLLabel15: TRLLabel;
    rlbCancelado: TRLLabel;
    RLLabel19: TRLLabel;
    RLSystemInfo5: TRLSystemInfo;
    RLPDFFilter1: TRLPDFFilter;
    RLLabel16: TRLLabel;
    lblCnpj: TRLLabel;
    qryPedido: TFDQuery;
    qryItens: TFDQuery;
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
    qryPedidoCPF_CNPJ: TStringField;
    qryPedidoREPRESENTANTE: TStringField;
    qryPedidoCIDADE: TStringField;
    qryPedidoUF: TStringField;
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
    qryItensPECAS: TBCDField;
    qryItensPRODUTO: TStringField;
    qryItensREFCOR: TStringField;
    qryItensREFPROD: TStringField;
    qryItensCOR: TStringField;
    RLBand9: TRLBand;
    RLLabel4: TRLLabel;
    RLMemo1: TRLMemo;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLMemo1BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    {  imprime expedição ou romaneio   }
    procedure imprime(pedido :String);
  end;

var
  frmRelatorioExpedicao: TfrmRelatorioExpedicao;

implementation

uses StrUtils, uModulo;

{$R *.dfm}

{ TfrmRelatorioExpedicao }

procedure TfrmRelatorioExpedicao.imprime(pedido: String);
begin

  qryPedido.Close;
  qryPedido.SQL.Text := 'select p.*, c.razao cliente, c.cpf_cnpj, r.razao representante, cid.nome cidade, est.sigla UF from pedidos p '+
                        'left join pessoas c on c.codigo = p.cod_cliente                                                  '+
                        'left join pessoas r on r.codigo = p.cod_repres                                                   '+
                        'left join enderecos e on e.codpessoa = c.codigo                                                  '+
                        'left join cidades cid on cid.codibge = e.codcidade                                               '+
                        'left join estados est on est.codigo = cid.codest                                                 '+
                        'where p.numPedido = :codped                                                                      ';
  qryPedido.ParamByName('codped').AsString := pedido;
  qryPedido.Open;

  if qryPedido.IsEmpty then begin
    raise Exception.Create('Não foi encontrado um pedido com o  nº ' + pedido);
    exit;
  end;

  qryItens.Close;
  qryItens.SQL.Text := 'select i.*, (p.qtd_pecas * i.qtd_total) pecas, p.descricao || iif(p.ativo = ''S'', '''', '' - Eliminado'') produto, c.referencia refcor, p.referencia refprod, '+
                       'iif(c.desc_producao <> '''', c.desc_producao || '' '' || c.cor, c.descricao) cor                   from itens i          '+
                       'left join produtos p on p.codigo = i.cod_produto                                                               '+
                       'left join cores c on c.codigo = i.cod_cor                                                                      '+
                       'where i.cod_pedido = :codped                                                                                   '+
                       'order by i.cod_produto, i.cod_cor                                                                              ';

  qryItens.ParamByName('codped').AsInteger := qryPedido.fieldByName('codigo').AsInteger;
  qryItens.Open;
  
  RLReport1.PreviewModal;
end;

procedure TfrmRelatorioExpedicao.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  lblCliente.Caption       := qryPedidoCOD_CLIENTE.AsString +' - '+ qryPedidoCLIENTE.AsString+ '   >>'+trim(qryPedidoCIDADE.AsString)+' - '+qryPedidoUF.AsString+' <<';
  lblCnpj.Caption          := TStringUtilitario.MascaraCpfCnpj( qryPedidoCPF_CNPJ.AsString );
  lblDtRepres.Caption      := qryPedidoDT_REPRESENTANTE.AsString;
  lblDtCad.Caption         := qryPedidoDT_CADASTRO.AsString;
  lblRepresentante.Caption := qryPedidoREPRESENTANTE.AsString;
  lblpedido.Caption        := qryPedidoNUMPEDIDO.AsString;
  lblrecebimento.Caption   := qryPedidoDT_RECEBIMENTO.AsString;
  lblperiodo.Caption       := qryPedidoDT_ENTREGA.AsString + ' a ' +qryPedidoDT_LIMITE_ENTREGA.AsString;
  lblaprovado.Caption      := 'APROV. POR '+qryPedidoAPROVADO_POR.AsString;
  RLMemo1.Lines.Text       := qryPedidoOBSERVACAO.Text;

  rlbCancelado.Visible     := (qryPedidoCANCELADO.AsString = 'S'); 
end;

procedure TfrmRelatorioExpedicao.RLBand5BeforePrint(Sender: TObject;
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

procedure TfrmRelatorioExpedicao.RLMemo1BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  if Text = '' then
  begin
    rllabel4.Visible := false;
    rlband9.Height   := 0;
  end;
  {else
  begin
    rllabel4.Visible := true;
    rlband2.Height   := 87;
  end; }
end;

end.
