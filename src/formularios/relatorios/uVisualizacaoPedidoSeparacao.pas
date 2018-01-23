unit uVisualizacaoPedidoSeparacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Pedido, DB, DBClient, RLReport, pngimage, RLFilters;

type
  TfrmVisualizacaoPedidoSeparacao = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel13: TRLLabel;
    lblTitulo: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    lblaprovado: TRLLabel;
    lblperiodo: TRLLabel;
    RLImage1: TRLImage;
    lblDtRepres: TRLLabel;
    RLLabel8: TRLLabel;
    lblDtCad: TRLLabel;
    RLLabel14: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel31: TRLLabel;
    RLLabel19: TRLLabel;
    RLSystemInfo5: TRLSystemInfo;
    RLBand2: TRLBand;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    lblCidade: TRLLabel;
    RLLabel9: TRLLabel;
    lblCliente: TRLLabel;
    lblRepresentante: TRLLabel;
    lblpedido: TRLLabel;
    lblrecebimento: TRLLabel;
    RLBand4: TRLBand;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLLabel10: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
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
    RLDBText17: TRLDBText;
    RLDraw2: TRLDraw;
    RLDBText3: TRLDBText;
    cdsItens: TClientDataSet;
    cdsItensCODIGO: TIntegerField;
    cdsItensProduto: TStringField;
    cdsItensCodPro: TIntegerField;
    cdsItensCor: TStringField;
    cdsItensCodCor: TIntegerField;
    cdsItensRefPro: TStringField;
    cdsItensQTD_RN: TIntegerField;
    cdsItensQTD_P: TIntegerField;
    cdsItensQTD_M: TIntegerField;
    cdsItensQTD_G: TIntegerField;
    cdsItensQTD_1: TIntegerField;
    cdsItensQTD_2: TIntegerField;
    cdsItensQTD_3: TIntegerField;
    cdsItensQTD_4: TIntegerField;
    cdsItensQTD_6: TIntegerField;
    cdsItensQTD_8: TIntegerField;
    cdsItensQTD_RN_O: TIntegerField;
    cdsItensQTD_P_O: TIntegerField;
    cdsItensQTD_M_O: TIntegerField;
    cdsItensQTD_G_O: TIntegerField;
    cdsItensQTD_1_O: TIntegerField;
    cdsItensQTD_2_O: TIntegerField;
    cdsItensQTD_3_O: TIntegerField;
    cdsItensQTD_4_O: TIntegerField;
    cdsItensQTD_6_O: TIntegerField;
    cdsItensQTD_8_O: TIntegerField;
    cdsItensCONFERIDO: TStringField;
    cdsItensRefCor: TStringField;
    cdsItensNUM_CAIXA: TIntegerField;
    cdsItensC_I: TStringField;
    dsItens: TDataSource;
    rlbCancelado: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText14: TRLDBText;
    lbindica: TRLLabel;
    cdsItensQTD_UNICA: TIntegerField;
    cdsItensQTD_UNICA_O: TBCDField;
    RLDraw13: TRLDraw;
    RLDraw14: TRLDraw;
    cdsItensQTD_10: TIntegerField;
    cdsItensQTD_12: TIntegerField;
    cdsItensQTD_14: TIntegerField;
    cdsItensQTD_10_O: TIntegerField;
    cdsItensQTD_12_O: TIntegerField;
    cdsItensQTD_14_O: TIntegerField;
    RLDBText15: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDraw15: TRLDraw;
    procedure RLDBText14BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDBText3BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    procedure imprime(cds :TClientDataSet; Pedido :TPedido);
    procedure preencheCabecalho(Pedido :TPedido);
  end;

var
  frmVisualizacaoPedidoSeparacao: TfrmVisualizacaoPedidoSeparacao;

implementation

uses Pessoa, Endereco, Cidade;

{$R *.dfm}

{ TfrmVisualizacaoPedidoSeparacao }

procedure TfrmVisualizacaoPedidoSeparacao.imprime(cds: TClientDataSet; Pedido: TPedido);
begin
  self.cdsItens.CloneCursor(cds,true);
  cdsItens.IndexFieldNames := 'REFPRO;REFCOR';
  
  preencheCabecalho(Pedido);

  RLReport1.PreviewModal;
end;

procedure TfrmVisualizacaoPedidoSeparacao.preencheCabecalho(Pedido :TPedido);
begin
  lblDtRepres.Caption      := DateToStr(Pedido.dt_representante);
  lblDtCad.Caption         := DateToStr(Pedido.dt_cadastro);
  lblperiodo.Caption       := DateToStr(Pedido.dt_entrega)+' a '+DateToStr(Pedido.dt_limite_entrega);
  lblaprovado.Caption      := 'APROVAÇÃO: '+Pedido.aprovado_por;

  lblpedido.Caption        := Pedido.numpedido;
  lblCliente.Caption       := Pedido.Cliente.Razao;
  lblCidade.Caption        := Pedido.Cliente.Endereco.Cidade.nome;
  lblRepresentante.Caption := Pedido.Representante.Razao;
  lblrecebimento.Caption   := DateToStr(Pedido.dt_recebimento);
end;

procedure TfrmVisualizacaoPedidoSeparacao.RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if RLDraw15.Brush.Color = clwhite then
    RLDraw15.Brush.Color := $00F5F5F5
  else
    RLDraw15.Brush.Color := clWhite;
end;

procedure TfrmVisualizacaoPedidoSeparacao.RLDBText14BeforePrint(
  Sender: TObject; var Text: String; var PrintIt: Boolean);
begin
  if Text = 'S' then begin
    rldbtext14.Font.Style := [fsBold];
    rldbtext14.Font.Size  := 12;
    lbindica.Visible      := true;
  end
  else begin
    rldbtext14.Font.Style := [];
    rldbtext14.Font.Size  := 9;
    lbindica.Visible      := false;
  end;
end;

procedure TfrmVisualizacaoPedidoSeparacao.RLDBText3BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  if Text = '0' then
    TRLDBText(Sender).Height := 0
  else
    TRLDBText(Sender).Height := 16;
end;

end.
