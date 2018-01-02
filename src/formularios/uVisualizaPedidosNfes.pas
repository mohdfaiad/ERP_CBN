unit uVisualizaPedidosNfes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, Vcl.StdCtrls,
  frameBuscaPessoa, Vcl.Grids, Vcl.DBGrids, DBGridCBN, Vcl.ExtCtrls,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, contNrs, Datasnap.DBClient, System.StrUtils, Vcl.Mask,
  RxToolEdit, RxCurrEdit;

type
  TfrmVisualizaPedidosNfes = class(TfrmPadrao)
    qryPedidos: TFDQuery;
    dsPedidos: TDataSource;
    dsNotas: TDataSource;
    qryPedidosNUMPEDIDO: TStringField;
    qryPedidosDT_CADASTRO: TDateField;
    qryPedidosDT_REPRESENTANTE: TDateField;
    qryPedidosDT_RECEBIMENTO: TDateField;
    qryPedidosDT_ENTREGA: TDateField;
    qryPedidosDT_LIMITE_ENTREGA: TDateField;
    qryPedidosDT_APROVACAO: TDateField;
    qryPedidosDESCONTO: TBCDField;
    qryPedidosDESCONTO_FPGTO: TBCDField;
    qryPedidosACRESCIMO: TBCDField;
    qryPedidosVALOR_TOTAL: TBCDField;
    qryNotas: TFDQuery;
    qryNotasNUMERO_NOTA_FISCAL: TIntegerField;
    qryNotasDATA_EMISSAO: TSQLTimeStampField;
    qryNotasVALOR: TFMTBCDField;
    qryNotasSTATUS: TStringField;
    qryNotasEMITENTE: TStringField;
    qryNotasDESTINATARIO: TStringField;
    Label3: TLabel;
    DBGridCBN2: TDBGridCBN;
    gbFiltroStatus: TGroupBox;
    chkFiltroAguardandoEnvio: TCheckBox;
    chkFiltroRejeitada: TCheckBox;
    chkFiltroAutorizada: TCheckBox;
    chkFiltroCancelada: TCheckBox;
    edtQtdNotas: TCurrencyEdit;
    Label5: TLabel;
    Label2: TLabel;
    DBGridCBN1: TDBGridCBN;
    edtQtdPedidos: TCurrencyEdit;
    Label4: TLabel;
    gpbCliente: TGroupBox;
    BuscaPessoa1: TBuscaPessoa;
    rgPedido: TRadioGroup;
    gbFiltroPeriodo: TGroupBox;
    lblFiltroDataFinal: TLabel;
    lblFiltroDataInicial: TLabel;
    Label1: TLabel;
    dtpFiltroDataFinal: TDateTimePicker;
    dtpFiltroDataInicial: TDateTimePicker;
    rgTipoData: TRadioGroup;
    chkPeriodoGeral: TCheckBox;
    btnFiltrar: TBitBtn;
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    Splitter1: TSplitter;
    btnImprimir: TBitBtn;
    qryNotasCODIGO: TIntegerField;
    Label6: TLabel;
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkPeriodoGeralClick(Sender: TObject);
    procedure chkFiltroAguardandoEnvioClick(Sender: TObject);
    procedure Splitter1CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure btnImprimirClick(Sender: TObject);
    procedure DBGridCBN1DblClick(Sender: TObject);
  private
    procedure Buscar;
    procedure BuscarPedidos;
    procedure BuscarNotas;

    procedure montaSqlPedido;
    procedure montaSqlNotas;

    procedure imprimirNFe;
    procedure abrePedido(numPedido :String);
  public
    { Public declarations }
  end;

var
  frmVisualizaPedidosNfes: TfrmVisualizaPedidosNfes;

implementation

uses EspecificacaoNotaFiscalPorPeriodoEStatus, Repositorio, FabricaRepositorio, NotaFiscal, TipoPessoa, GeradorNFe, uPedido;

{$R *.dfm}

procedure TfrmVisualizaPedidosNfes.abrePedido(numPedido: String);
begin
  frmPedido := TfrmPedido.Create(self);
  frmPedido.Tag := 1; //alteração de pedido
  frmPedido.Caption := 'Alteração de Pedido de Venda';
  frmPedido.BuscaPedido1.numped := numpedido;
  frmPedido.ShowModal;
  frmPedido.Release;
  frmPedido := nil;
end;

procedure TfrmVisualizaPedidosNfes.btnFiltrarClick(Sender: TObject);
begin
  Buscar;
end;

procedure TfrmVisualizaPedidosNfes.btnImprimirClick(Sender: TObject);
begin
  if not qryNotas.Active or not qryNotas.IsEmpty then
     imprimirNFe;
end;

procedure TfrmVisualizaPedidosNfes.Buscar;
begin
  if BuscaPessoa1.edtCodigo.AsInteger <= 0 then
  begin
    avisar('O cliente não foi informado!');
    BuscaPessoa1.edtCodigo.SetFocus;
    exit;
  end;

  BuscarPedidos;
  BuscarNotas;
end;

procedure TfrmVisualizaPedidosNfes.BuscarNotas;
begin
  qryNotas.Close;
  montaSqlNotas;
  qryNotas.Open;
  edtQtdNotas.AsInteger := qryNotas.RecordCount;
end;

procedure TfrmVisualizaPedidosNfes.BuscarPedidos;
begin
  qryPedidos.Close;
  montaSqlPedido;
  qryPedidos.Open;
  edtQtdPedidos.AsInteger := qryPedidos.RecordCount;
end;

procedure TfrmVisualizaPedidosNfes.FormShow(Sender: TObject);
begin
  BuscaPessoa1.TipoPessoa   := tpCliente;
  dtpFiltroDataInicial.Date := strToDateTime( DateToStr(Date)+' '+'00:00:00');
  dtpFiltroDataFinal.Date   := strToDateTime( DateToStr(Date)+' '+'23:59:59');
end;

procedure TfrmVisualizaPedidosNfes.imprimirNFe;
var
  RepositorioNotaFiscal      :TRepositorio;
  GeradorNFe                 :TGeradorNFe;
  NotaFiscal                 :TNotaFiscal;
begin
   RepositorioNotaFiscal  := nil;
   GeradorNFe             := nil;
   NotaFiscal             := nil;
  try
     RepositorioNotaFiscal  := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);
     NotaFiscal             := TNotaFiscal(RepositorioNotaFiscal.Get(qryNotasCODIGO.AsInteger));

     GeradorNFe := TGeradorNFe.Create(FDM.Logo);
     GeradorNFe.ImprimirComVisualizacao(NotaFiscal);
  finally
     FreeAndNil(RepositorioNotaFiscal);
     FreeAndNil(NotaFiscal);
     FreeAndNil(GeradorNFe);
  end;
end;

procedure TfrmVisualizaPedidosNfes.montaSqlNotas;
var condicao_periodo, condicao_status :String;
begin

  condicao_periodo := IfThen(chkPeriodoGeral.Checked,'', ' and nf.data_emissao between :dti and :dtf ');
  condicao_status  := IfThen(chkFiltroAguardandoEnvio.Checked, ' nfr.status is null', '')+
                      IfThen(chkFiltroAutorizada.Checked, IfThen(chkFiltroAguardandoEnvio.Checked,' or', '')+' nfr.status = ''100'' ', '')+
                      IfThen(chkFiltroCancelada.Checked, IfThen(chkFiltroAguardandoEnvio.Checked or chkFiltroAutorizada.Checked,' or', '')+' nfr.status = ''135'' ', '')+
                      IfThen(chkFiltroCancelada.Checked, IfThen(chkFiltroAguardandoEnvio.Checked or chkFiltroAutorizada.Checked or chkFiltroCancelada.Checked,' or', '')+' nfr.status not in (''100'',''135'') ', '');

  qryNotas.SQL.Text := 'select nf.codigo, nf.numero_nota_fiscal, nf.data_emissao, emit.razao emitente, dest.razao destinatario,                    '+
                       '(sum(inf.valor_unitario * inf.quantidade) - tnf.desconto + tnf.frete + tnf.seguro + tnf.outras_despesas) valor, '+
                       'CASE                                                                                                           '+
                       '  WHEN nfr.status = ''100'' THEN ''Autorizada''                                                                '+
                       '  WHEN nfr.status = ''135'' THEN ''Cancelada''                                                                 '+
                       '  WHEN nfr.status is null THEN ''Aguardando Envio''                                                            '+
                       '  ELSE ''Rejeitada''                                                                                           '+
                       '  END Status                                                                                                   '+

                       'from notas_fiscais nf                                                                                          '+

                       'left join NOTAS_FISCAIS_NFE_RETORNO nfr on nfr.codigo_nota_fiscal = nf.codigo                                  '+
                       'inner join totais_notas_fiscais tnf on tnf.codigo_nota_fiscal = nf.codigo                                      '+
                       'left join itens_notas_fiscais inf on inf.codigo_nota_fiscal = nf.codigo                                        '+
                       'inner join pessoas emit on emit.codigo = nf.codigo_emitente                                                    '+
                       'inner join pessoas dest on dest.codigo = nf.codigo_destinatario                                                '+
                       'where nf.codigo_destinatario = :cod_dest and nf.entrada_saida = ''S'' '+ condicao_periodo +
                       IfThen(condicao_status = '','',' and (')+condicao_status+IfThen(condicao_status = '','',') ') +

                       'group by nf.codigo, nf.numero_nota_fiscal, nf.data_emissao, emit.razao, dest.razao, nfr.status, tnf.desconto, tnf.frete,      '+
                       '         tnf.seguro, tnf.outras_despesas                                                                       ';

  qryNotas.ParamByName('cod_dest').AsInteger := BuscaPessoa1.edtCodigo.AsInteger;

  if not chkPeriodoGeral.Checked then
  begin
    qryNotas.ParamByName('dti').AsDateTime := dtpFiltroDataInicial.DateTime;
    qryNotas.ParamByName('dtf').AsDateTime := dtpFiltroDataFinal.DateTime;
  end;
end;

procedure TfrmVisualizaPedidosNfes.montaSqlPedido;
var condicao_periodo, condicao_cliente, tipo_data, condicao_tipo :String;
begin
       if rgTipoData.ItemIndex = 0 then  tipo_data := ' P.DT_CADASTRO '
  else if rgTipoData.ItemIndex = 1 then  tipo_data := ' P.DT_REPRESENTANTE '
  else if rgTipoData.ItemIndex = 2 then  tipo_data := ' P.DT_RECEBIMENTO '
  else if rgTipoData.ItemIndex = 3 then  tipo_data := ' P.DT_LIMITE_ENTREGA'
  else if rgTipoData.ItemIndex = 4 then  tipo_data := ' iif( not(PF.codigo is null), '+
                                                      '      CAST( lpad(EXTRACT(DAY FROM nf.data_saida), 2, ''0'') || ''.'' || lpad(EXTRACT(MONTH FROM nf.data_saida), 2, ''0'') || ''.'' || EXTRACT(YEAR FROM nf.data_saida) as Date), '+
                                                      '      P.dt_despacho)         ';

  condicao_periodo := IfThen(chkPeriodoGeral.Checked,'', ' AND ('+ tipo_data + ' BETWEEN :DTI AND :DTF ) ');
  condicao_cliente := ' AND P.COD_CLIENTE = '+intToStr(BuscaPessoa1.edtCodigo.AsInteger);
  condicao_tipo    := IfThen(rgPedido.ItemIndex = 2, '',
                      IfThen(rgPedido.ItemIndex = 0, ' and (not (pf.codigo is null) or (p.despachado = ''S'')) ',
                                                     ' and ( (pf.codigo is null) and ((p.despachado is null) or (p.despachado <> ''S'')) ) '));

  qryPedidos.SQL.Text :=  'select numpedido, dt_cadastro, dt_representante, dt_recebimento, dt_entrega, dt_limite_entrega, '+
                          ' dt_aprovacao, desconto, desconto_fpgto, acrescimo, valor_total                                 '+
                          ' from pedidos p                                                                                 '+
                          ' left join pedidos_faturados pf on pf.codigo_pedido = p.codigo                                  '+
                          ' where not p.cancelado = ''S'' '+ condicao_periodo + condicao_cliente + condicao_tipo;

  if not chkPeriodoGeral.Checked then
  begin
    qryPedidos.ParamByName('DTI').AsDateTime := dtpFiltroDataInicial.DateTime;
    qryPedidos.ParamByName('DTF').AsDateTime := dtpFiltroDataFinal.DateTime;
  end;
end;

procedure TfrmVisualizaPedidosNfes.Splitter1CanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
  Accept := (NewSize < 500) and (NewSize > 250);
end;

procedure TfrmVisualizaPedidosNfes.chkFiltroAguardandoEnvioClick(Sender: TObject);
begin
  if BuscaPessoa1.edtCodigo.AsInteger > 0 then
    btnFiltrar.Click;
end;

procedure TfrmVisualizaPedidosNfes.chkPeriodoGeralClick(Sender: TObject);
begin

  dtpFiltroDataInicial.Enabled := not chkPeriodoGeral.checked;
  dtpFiltroDataFinal.Enabled   := not chkPeriodoGeral.checked;
end;

procedure TfrmVisualizaPedidosNfes.DBGridCBN1DblClick(Sender: TObject);
begin
  abrePedido(qryPedidosNUMPEDIDO.AsString);
end;

end.
