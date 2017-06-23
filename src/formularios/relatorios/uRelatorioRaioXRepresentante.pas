unit uRelatorioRaioXRepresentante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, DBGridCBN, DB, DBClient, Provider,
  TipoPessoa, ExtCtrls, Buttons, ComCtrls, StdCtrls, frameBuscaPessoa, Mask,
  DBCtrls, RxToolEdit, RxCurrEdit, DateUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, System.StrUtils,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLFilters, RLPreviewForm, RLReport, frameBuscaRepresentante;

type
  TfrmRelatorioRaioXRepresentante = class(TfrmPadrao)
    DataSetProvider1: TDataSetProvider;
    cdsPedidos: TClientDataSet;
    DataSource1: TDataSource;
    gridPedidos: TDBGridCBN;
    Panel1: TPanel;
    Label6: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    Label7: TLabel;
    Shape1: TShape;
    Splitter5: TSplitter;
    Panel2: TPanel;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    btnBuscar: TBitBtn;
    cdsPedidosTOT_VALOR: TAggregateField;
    cdsPedidosTOT_DESCONTO: TAggregateField;
    cdsPedidosTOT_PECAS: TAggregateField;
    cdsPedidosTOT_COMISSAO: TAggregateField;
    cdsPedidosMEDIA_VALOR: TAggregateField;
    cdsPedidosMEDIA_PERC_DESC: TAggregateField;
    cdsPedidosMEDIA_VLR_DESC: TAggregateField;
    cdsPedidosMEDIA_PRAZO: TAggregateField;
    cdsPedidosMEDIA_PECAS: TAggregateField;
    dspMediasEmpresa: TDataSetProvider;
    cdsMediasEmpresa: TClientDataSet;
    dsMediasEmpresa: TDataSource;
    chkPeriodoRep: TCheckBox;
    cdsMediasEmpresaMEDIA_VALOR: TAggregateField;
    cdsMediasEmpresaMEDIA_PRAZO: TAggregateField;
    cdsMediasEmpresaMEDIA_PECAS: TAggregateField;
    gpbMediasEmpresa: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit14: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit12: TDBEdit;
    chkPeriodoEmp: TCheckBox;
    Label23: TLabel;
    chkFiltroRepres: TCheckBox;
    Shape4: TShape;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label16: TLabel;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Shape2: TShape;
    Label5: TLabel;
    edtQtdPedidos: TEdit;
    cdsComissao: TClientDataSet;
    dsComissao: TDataSource;
    cdsComissaoDATA: TDateField;
    cdsComissaoValor_pagar: TFloatField;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    cdsCompras: TClientDataSet;
    dsCompras: TDataSource;
    cdsComprasQTDE_COMPRAS: TStringField;
    cdsComprasQTDE_CLIENTES: TIntegerField;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    Label8: TLabel;
    edtTotClientes: TCurrencyEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    cdsMediasEmpresaMEDIA_PERC_DESC: TAggregateField;
    cdsMediasEmpresaMEDIA_VLR_DESC: TAggregateField;
    btnConfigEmail: TSpeedButton;
    cdsPedidosPREV_PGTO: TStringField;
    cdsPedidosQTD_COMPRAS: TIntegerField;
    qry: TFDQuery;
    qryMediasEmpresa: TFDQuery;
    cdsMediasEmpresaTOTAL_DESCONTO: TBCDField;
    cdsMediasEmpresaTOTAL_LIQUIDO: TBCDField;
    cdsMediasEmpresaPRAZO: TFloatField;
    cdsMediasEmpresaTD: TIntegerField;
    cdsPedidosDT_REPRESENTANTE: TDateField;
    cdsPedidosDT_RECEBIMENTO: TDateField;
    cdsPedidosDT_CADASTRO: TDateField;
    cdsPedidosDT_FATURAMENTO: TDateField;
    cdsPedidosCLIENTE: TStringField;
    cdsPedidosFPGTO: TStringField;
    cdsPedidosPRAZO: TFloatField;
    cdsPedidosCOMISSAO: TBCDField;
    cdsPedidosTOTAL_LIQUIDO: TBCDField;
    cdsPedidosNUMPEDIDO: TStringField;
    cdsPedidosTOTAL_DESCONTO: TBCDField;
    cdsMediasEmpresaPERC_DESCONTO_PEDIDO: TBCDField;
    cdsPedidosPERC_DESCONTO_PEDIDO: TBCDField;
    cdsPedidosVLRCOMISSAO: TBCDField;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    rlbRepresentante: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    btnImprimir: TBitBtn;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    rlbPercDescRep: TRLLabel;
    rlbVlrDescRep: TRLLabel;
    rlbValorRep: TRLLabel;
    rlbPecasRep: TRLLabel;
    rlbPrazoRep: TRLLabel;
    pnlconfigEmail: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtNome: TEdit;
    edtAssunto: TEdit;
    memoTexto: TMemo;
    edtEmailCopia: TEdit;
    btnEnviarEmail: TBitBtn;
    edtEmail: TEdit;
    Label9: TLabel;
    buscaRepresentante1: TbuscaRepresentante;
    cdsPedidosPECAS: TIntegerField;
    cdsMediasEmpresaPECAS: TIntegerField;
    RLDraw4: TRLDraw;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLDraw5: TRLDraw;
    rlbPeriodo: TRLLabel;
    RLLabel30: TRLLabel;
    rlbPercDescEmp: TRLLabel;
    rlbDescEmp: TRLLabel;
    rlbValorEmp: TRLLabel;
    rlbPecasEmp: TRLLabel;
    rlbPrazoEmp: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel31: TRLLabel;
    Timer1: TTimer;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel32: TRLLabel;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure dtpInicioChange(Sender: TObject);
    procedure dtpFimChange(Sender: TObject);
    procedure gridPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkPeriodoRepClick(Sender: TObject);
    procedure cdsPedidosCalcFields(DataSet: TDataSet);
    procedure chkPeriodoEmpClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure buscaRepresentante1Exit(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure btnConfigEmailClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

    function monta_sql_representante :String;
    function monta_sql_medias_empresa :String;

    procedure carrega_medias_empresa;
    procedure comissoes_por_quinzena(Data: TDateTime; Valor_comissao :Real);
    procedure compra_por_cliente;
    procedure vezes_compradas;
    procedure enviarEmail;
  public
    { Public declarations }
  end;

var
  frmRelatorioRaioXRepresentante: TfrmRelatorioRaioXRepresentante;

implementation

uses DateTimeUtilitario, Math, EnviaEmail, StringUtilitario;

{$R *.dfm}

procedure TfrmRelatorioRaioXRepresentante.FormShow(Sender: TObject);
begin
  inherited;
  dtpInicio.DateTime      := strToDateTime( DateToStr(Date)+' '+'00:00:00');
  dtpFim.DateTime         := strToDateTime( DateToStr(Date)+' '+'23:59:59');
  timer1.Enabled := true;
end;

function TfrmRelatorioRaioXRepresentante.monta_sql_representante: String;
var condicao_periodo, condicao_periodo_sem_nota :String;
begin

  if not chkPeriodoRep.Checked then begin
    condicao_periodo          := ' and (nf.data_saida >= :dti) and (nf.data_saida <= :dtf) ';
    condicao_periodo_sem_nota := ' and p.dt_despacho >= :dti and p.dt_despacho <= :dtf ';
  end
  else
    condicao_periodo := '';

  Result := ' select p.dt_representante, p.dt_recebimento, p.dt_cadastro, c.razao cliente, fp.descricao FPGTO, p.numpedido,  CAST(p.valor_total-((p.valor_total * p.desconto_comiss)/100) as numeric(15,2)) total_liquido,  '+#13+
            ' CAST(((p.desconto + p.desconto_fpgto + p.desconto_itens) * 100) / ((p.valor_total-((p.valor_total*p.desconto_comiss)/100)) + p.desconto + p.desconto_fpgto + p.desconto_itens) as numeric(15,2)) PERC_DESCONTO_PEDIDO, '+#13+
            ' CAST( iif(nfr.status = ''100'',                                                                                        '+#13+
            '       lpad(EXTRACT(DAY FROM nf.data_saida), 2, ''0'') || ''.'' || lpad(EXTRACT(MONTH FROM nf.data_saida), 2, ''0'') || ''.'' || EXTRACT(YEAR FROM nf.data_saida),                            '+#13+
            '       lpad(EXTRACT(DAY FROM nf.data_saida), 2, ''0'') || ''.'' || lpad(EXTRACT(MONTH FROM nf.data_saida), 2, ''0'') || ''.'' || EXTRACT(YEAR FROM nf.data_saida) ) as Date ) dt_faturamento, '+#13+
            ' iif((cast(sum(fpp.dias_parcela) as float)/fp.numero_parcelas) is null, 0, (cast(sum(fpp.dias_parcela) as float)/fp.numero_parcelas)) PRAZO, (p.desconto_fpgto + p.desconto_itens + p.desconto) TOTAL_DESCONTO, '+#13+
            '       cast(coalesce(( select sum(pro.qtd_pecas) from itens it                                                                   '+#13+
            '        LEFT JOIN produtos pro on it.cod_produto = pro.codigo                                                           '+#13+
            '        where it.cod_pedido = p.codigo),0) as integer) pecas, p.comissao, cast((p.valor_total-((p.valor_total*p.desconto_comiss)/100)) * p.comissao / 100 as numeric(15,2)) vlrComissao     '+#13+
            ' from pedidos P                                                                                                         '+#13+
            '       LEFT JOIN pedidos_faturados         PF  ON PF.CODIGO_PEDIDO = P.CODIGO                                           '+#13+
            '       LEFT JOIN NOTAS_FISCAIS             NF  ON NF.codigo = PF.codigo_nota_fiscal                                     '+#13+
            '       LEFT JOIN notas_fiscais_nfe_retorno nfr ON nfr.codigo_nota_fiscal = nf.codigo                                    '+#13+
            '       INNER JOIN pessoas                   c   on p.cod_cliente = c.codigo                                             '+#13+
            '       LEFT JOIN formas_pgto               FP  on fp.codigo = p.cod_forma_pag                                           '+#13+
            '       LEFT JOIN formas_pgto_parcelas      FPP on fpp.codformas_pgto = fp.codigo                                        '+#13+
            ' where ((nfr.status = ''100'' '+ condicao_periodo +' and p.cod_repres = :codRep)                                        '+#13+
            '    or (p.despachado = ''S'' '+ condicao_periodo_sem_nota +' and p.cod_repres = :codRep))                               '+#13+
            '    and not (p.cancelado = ''S'')                                                                                       '+#13+
            ' group by p.dt_representante, p.dt_recebimento, p.dt_cadastro, c.razao, fp.descricao, fp.numero_parcelas,               '+#13+
            '         p.valor_total, p.numpedido, p.codigo, nf.data_emissao, nf.data_saida, nfr.status, p.desconto_fpgto, p.comissao,'+#13+
            '         nfr.codigo_nota_fiscal , p.desconto, p.desconto_itens, p.desconto_comiss                                                          '+#13+
            ' ORDER BY c.razao                                                                                                       ';

end;

procedure TfrmRelatorioRaioXRepresentante.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  rlbRepresentante.Caption := buscaRepresentante1.Representante.Razao;
  rlbPeriodo.Caption       := IfThen(chkPeriodoRep.Checked, '< GERAL >', DateToStr(dtpInicio.Date) + ' a ' + DateToStr(dtpFim.Date));
  rlbPercDescRep.Caption   := formatfloat('##,###,##0.00',cdsPedidosMEDIA_PERC_DESC.Value);
  rlbVlrDescRep.Caption    := formatfloat('##,###,##0.00',cdsPedidosMEDIA_VLR_DESC.Value);
  rlbValorRep.Caption      := formatfloat('##,###,##0.00',cdsPedidosMEDIA_VALOR.Value);
  rlbPecasRep.Caption      := formatfloat('##,###,##0.00',cdsPedidosMEDIA_PECAS.Value);
  rlbPrazoRep.Caption      := formatfloat('##,###,##0.00',cdsPedidosMEDIA_PRAZO.Value);

  rlbPercDescEmp.Caption   := formatfloat('##,###,##0.00',cdsMediasEmpresaMEDIA_PERC_DESC.Value);
  rlbDescEmp.Caption       := formatfloat('##,###,##0.00',cdsMediasEmpresaMEDIA_VLR_DESC.Value);
  rlbValorEmp.Caption      := formatfloat('##,###,##0.00',cdsMediasEmpresaMEDIA_VALOR.Value);
  rlbPecasEmp.Caption      := formatfloat('##,###,##0.00',cdsMediasEmpresaMEDIA_PECAS.Value);
  rlbPrazoEmp.Caption      := formatfloat('##,###,##0.00',cdsMediasEmpresaMEDIA_PRAZO.Value);
end;

procedure TfrmRelatorioRaioXRepresentante.Timer1Timer(Sender: TObject);
begin
  timer1.Enabled := false;
  carrega_medias_empresa;
end;

procedure TfrmRelatorioRaioXRepresentante.btnBuscarClick(Sender: TObject);
begin
  if not assigned(buscaRepresentante1.Representante) then begin
    avisar('Representante não foi informado!');
    exit;
  end;

  cdsPedidos.Close;
  qry.SQL.Text := monta_sql_representante;

  if not chkPeriodoRep.Checked then begin
    qry.ParamByName('dti').AsDateTime := dtpInicio.DateTime;
    qry.ParamByName('dtf').AsDateTime := dtpFim.DateTime;
  end;

  if cdsComissao.active then cdsComissao.EmptyDataSet;

  qry.ParamByName('codRep').AsInteger := buscaRepresentante1.Representante.Codigo;
  cdsPedidos.Open;

  btnImprimir.Enabled    := not cdsPedidos.IsEmpty;
  btnEnviarEmail.Enabled := not cdsPedidos.IsEmpty;
  btnConfigEmail.Enabled := not cdsPedidos.IsEmpty;

  if cdsPedidos.IsEmpty then begin
    avisar('Não foram encontrados registros com os filtros fornecidos');
    exit;
  end;

  compra_por_cliente;

  edtQtdPedidos.Text := IntToStr(cdsPedidos.RecordCount);
end;

procedure TfrmRelatorioRaioXRepresentante.dtpInicioChange(Sender: TObject);
begin
  if dtpInicio.Date > dtpFim.Date then
    dtpFim.Date := dtpInicio.Date +1;
end;

procedure TfrmRelatorioRaioXRepresentante.enviarEmail;
begin

end;

procedure TfrmRelatorioRaioXRepresentante.dtpFimChange(Sender: TObject);
begin
  if dtpFim.Date < dtpInicio.Date then begin
    avisar('A data final não pode ser menor que a data inicial!');
    dtpFim.Date := dtpInicio.Date +1;
    dtpFim.SetFocus;
  end;
end;

procedure TfrmRelatorioRaioXRepresentante.gridPedidosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsPedidosTOTAL_DESCONTO then
    begin
      gridPedidos.Canvas.Brush.Color := $00EFD0CF;
      gridPedidos.Canvas.FillRect( rect );
      gridPedidos.DefaultDrawColumnCell( Rect, DataCol, Column, state);
    end
  else if Column.Field = cdsPedidosPERC_DESCONTO_PEDIDO then
    begin
      gridPedidos.Canvas.Brush.Color := $00EFD0CF;
      gridPedidos.Canvas.FillRect( rect );
      gridPedidos.DefaultDrawColumnCell( Rect, DataCol, Column, state);
    end
  else if Column.Field = cdsPedidosTOTAL_LIQUIDO then
    begin
      gridPedidos.Canvas.Brush.Color := $00C7EBD1;
      gridPedidos.Canvas.FillRect( rect );
      gridPedidos.DefaultDrawColumnCell( Rect, DataCol, Column, state);
    end
  else if Column.Field = cdsPedidosPECAS then
    begin
      gridPedidos.Canvas.Brush.Color := $00A7CDCF;
      gridPedidos.Canvas.FillRect( rect );
      gridPedidos.DefaultDrawColumnCell( Rect, DataCol, Column, state);
    end
  else if Column.Field = cdsPedidosCOMISSAO then
    begin
      gridPedidos.Canvas.Brush.Color := $00CDD7DA;
      gridPedidos.Canvas.FillRect( rect );
      gridPedidos.DefaultDrawColumnCell( Rect, DataCol, Column, state);
    end
  else if Column.Field = cdsPedidosPRAZO then
    begin
      gridPedidos.Canvas.Brush.Color := clWhite;
      gridPedidos.Canvas.FillRect( rect );
      gridPedidos.DefaultDrawColumnCell( Rect, DataCol, Column, state);
    end;
end;

procedure TfrmRelatorioRaioXRepresentante.btnConfigEmailClick(Sender: TObject);
begin
  pnlconfigEmail.Left := IfThen(pnlconfigEmail.Left = 170, 1282, 170);
end;

procedure TfrmRelatorioRaioXRepresentante.btnEnviarEmailClick(Sender: TObject);
var EnviaEmail :TEnviaEmail;
    lista: TStringList;
begin
  try
    Aguarda('Enviando e-mail');
    lista      := TStringList.Create;
    EnviaEmail := TEnviaEmail.Create;
    RLReport1.SaveToFile( ExtractFilePath(Application.ExeName)+'RaioXRepresentante.pdf' );
    RLReport1.Prepare;
    lista.Add( ExtractFilePath(Application.ExeName)+'RaioXRepresentante.pdf' );
    if EnviaEmail.EnviaEmail(edtNome.Text, edtEmail.Text, edtAssunto.Text, memoTexto.Text, edtEmailCopia.Text, lista) then
      FimAguarda('Enviado com sucesso!');
  Except
    on e : Exception do
      begin
        FimAguarda('');
        avisar( e.Message );
      end;
  end;
end;

procedure TfrmRelatorioRaioXRepresentante.btnImprimirClick(Sender: TObject);
begin
  inherited;
  RLReport1.PreviewModal;
end;

procedure TfrmRelatorioRaioXRepresentante.buscaRepresentante1Exit(Sender: TObject);
begin
  if assigned(buscaRepresentante1.Representante) then
    edtEmail.Text := TStringUtilitario.RemoveCaracter(buscaRepresentante1.Representante.Email,';')
  else
    edtEmail.Clear;
end;

procedure TfrmRelatorioRaioXRepresentante.carrega_medias_empresa;
begin
 try
   Aguarda('Buscando médias da empresa...');
   cdsMediasEmpresa.Close;
   qryMediasEmpresa.SQL.Text := monta_sql_medias_empresa;

   if not chkPeriodoEmp.Checked then begin
     qryMediasEmpresa.ParamByName('dti').AsDateTime := dtpInicio.DateTime;
     qryMediasEmpresa.ParamByName('dtf').AsDateTime := dtpFim.DateTime;
   end;

   if not chkFiltroRepres.Checked then
     qryMediasEmpresa.ParamByName('codRep').AsInteger := buscaRepresentante1.Representante.Codigo;

   Application.ProcessMessages;
   cdsMediasEmpresa.Open;
   gpbMediasEmpresa.Caption := ' MÉDIAS DA EMPRESA   [ '+ intToStr(cdsMediasEmpresa.RecordCount) +' pedidos faturados] ';
 finally
   FimAguarda('');
 end;
end;

function TfrmRelatorioRaioXRepresentante.monta_sql_medias_empresa: String;
var condicao_periodo, condicao_periodo_sem_nota, condicao_representante :String;
begin
  if not chkPeriodoEmp.Checked then begin
    condicao_periodo          := ' and (nf.data_saida >= :dti) and (nf.data_saida <= :dtf) ';
    condicao_periodo_sem_nota := ' and (p.dt_despacho >= :dti) and (p.dt_despacho <= :dtf)';
  end
  else
    condicao_periodo := '';

  if not chkFiltroRepres.Checked then
    condicao_representante := ' and p.cod_repres = :codRep '
  else
    condicao_representante := '';

  Result := ' select (p.desconto_fpgto + p.desconto_itens + p.desconto) TOTAL_DESCONTO, CAST(p.valor_total-((p.valor_total*p.desconto_comiss)/100) as Numeric(15,2)) as total_liquido,   '+
            ' CAST(((p.desconto + p.desconto_fpgto + p.desconto_itens) * 100) / ((p.valor_total-((p.valor_total*p.desconto_comiss)/100)) + p.desconto + p.desconto_fpgto + p.desconto_itens) as numeric(15,2)) PERC_DESCONTO_PEDIDO, '+
            ' iif((cast(sum(fpp.dias_parcela) as float)/fp.numero_parcelas) is null, 0, (cast(sum(fpp.dias_parcela) as float)/fp.numero_parcelas)) PRAZO,  '+
            ' cast( coalesce(( select sum(pro.qtd_pecas) from itens it                                                    '+
            ' LEFT JOIN produtos pro on it.cod_produto = pro.codigo                                              '+
            ' where it.cod_pedido = p.codigo),0) as integer) PECAS,                                                  '+
            ' iif(p.desconto_fpgto > 0, 1, 0) TD                                                                 '+
            ' from pedidos P                                                                                     '+
            ' LEFT JOIN pedidos_faturados         PF  ON PF.CODIGO_PEDIDO = P.CODIGO                             '+
            ' LEFT JOIN NOTAS_FISCAIS             NF  ON NF.codigo = PF.codigo_nota_fiscal                       '+
            ' LEFT JOIN notas_fiscais_nfe_retorno nfr ON nfr.codigo_nota_fiscal = nf.codigo                      '+
            ' INNER JOIN pessoas                   c   on p.cod_cliente = c.codigo                               '+
            ' LEFT JOIN formas_pgto               FP  on fp.codigo = p.cod_forma_pag                             '+
            ' LEFT JOIN formas_pgto_parcelas      FPP on fpp.codformas_pgto = fp.codigo                          '+
            ' where ((nfr.status = ''100'' '+ condicao_periodo + condicao_representante +')                      '+
            '    or (p.despachado = ''S'' '+ condicao_periodo_sem_nota + condicao_representante +'))             '+
            '    and not (p.cancelado = ''S'')                                                                   '+
            ' group by p.valor_total, FP.desconto, p.desconto_fpgto, fp.numero_parcelas, p.codigo, p.desconto,   '+
            ' p.desconto_itens, p.desconto_comiss                                                                ';
end;

procedure TfrmRelatorioRaioXRepresentante.chkPeriodoRepClick(Sender: TObject);
begin
  if chkPeriodoRep.Checked then begin
    dtpInicio.Enabled := false;
    dtpFim.Enabled    := false;
    buscaRepresentante1.edtCodigo.SetFocus;
  end
  else begin
    dtpInicio.Enabled := true;
    dtpFim.Enabled    := true;
    dtpInicio.SetFocus;
  end;

end;

procedure TfrmRelatorioRaioXRepresentante.cdsPedidosCalcFields(
  DataSet: TDataSet);
var dia, ano :Integer;
    mes, ultimoDiaMes :String;
begin
  if cdsPedidos.recno > 0 then  Exit;

  dia := StrToInt( StringReplace(copy(cdsPedidosDT_FATURAMENTO.AsString,1,2),'/','',[]) );
  mes := FormatDateTime('mm',cdsPedidosDT_FATURAMENTO.AsDateTime);
  ano := IfThen( strToInt(mes) = 12, strToInt(FormatDateTime('yyyy', cdsPedidosDT_FATURAMENTO.AsDateTime))+1,
                                     strToInt(FormatDateTime('yyyy', cdsPedidosDT_FATURAMENTO.AsDateTime))    );
  mes := TDateTimeUtilitario.proximo_mes(cdsPedidosDT_FATURAMENTO.AsDateTime);

  if dia > 15 then begin
    ultimoDiaMes := IntToStr( DaysInMonth( strToDate('01/'+mes+'/'+intToStr(ano) ) ) );

    cdsPedidosPREV_PGTO.AsString := ultimoDiaMes +'/'+ mes +'/'+ intToStr(ano);
    comissoes_por_quinzena( cdsPedidosPREV_PGTO.AsDateTime, cdsPedidosVLRCOMISSAO.AsFloat);
  end
  else begin
    cdsPedidosPREV_PGTO.AsString := '15/'+ mes+'/'+ intToStr(ano);
    comissoes_por_quinzena( cdsPedidosPREV_PGTO.AsDateTime, cdsPedidosVLRCOMISSAO.AsFloat);
  end;

end;

procedure TfrmRelatorioRaioXRepresentante.chkPeriodoEmpClick(
  Sender: TObject);
begin
  carrega_medias_empresa;
end;

procedure TfrmRelatorioRaioXRepresentante.comissoes_por_quinzena(
  Data: TDateTime; Valor_comissao: Real);
begin
  if not cdsComissao.Active then  cdsComissao.CreateDataSet;

  if cdsComissao.Locate('DATA', Data, []) then begin
    cdsComissao.Edit;
    cdsComissaoValor_pagar.AsFloat := cdsComissaoValor_pagar.AsFloat + Valor_comissao;
  end
  else begin
    cdsComissao.Append;
    cdsComissaoDATA.AsDateTime     := Data;
    cdsComissaoValor_pagar.AsFloat := Valor_comissao;
  end;

  cdsComissao.Post;
end;

procedure TfrmRelatorioRaioXRepresentante.compra_por_cliente;
var linha_atual, linha_encontrada :integer;
    compras_cliente :integer;
    nome_cliente :String;
begin
  cdsPedidos.OnCalcFields := nil;
  linha_atual := 0;   {}  linha_encontrada := 0;  {} nome_cliente := '';

  cdsPedidos.IndexFieldNames := 'CLIENTE';
  cdsPedidos.First;
  cdsPedidos.DisableControls;
  edtTotClientes.Value := 0;

  while not cdsPedidos.Eof do begin
    compras_cliente := 0;
    linha_atual     := cdsPedidos.RecNo;
    nome_cliente    := cdsPedidosCLIENTE.AsString;

    while nome_cliente = cdsPedidosCLIENTE.AsString do begin
      inc(compras_cliente);

      cdsPedidos.Next;

      if cdsPedidos.Eof then  break;
    end;

    if not cdsPedidos.Eof then
      cdsPedidos.Prior;

    cdsPedidos.Edit;
    cdsPedidosQTD_COMPRAS.AsInteger := compras_cliente;
    cdsPedidos.Post;

    edtTotClientes.Value := edtTotClientes.Value + 1;
    
    cdsPedidos.RecNo := linha_atual + compras_cliente -1;

    cdsPedidos.Next;
  end;

  vezes_compradas;

  cdsPedidos.IndexFieldNames := 'CLIENTE';
  cdsPedidos.First;

  cdsPedidos.EnableControls;
    cdsPedidos.OnCalcFields := cdsPedidosCalcFields;
end;

procedure TfrmRelatorioRaioXRepresentante.vezes_compradas;
var qtde_vezes :String;
    clientes, linha_atual :integer;
    cds :TClientDataSet;
begin
  if not cdsCompras.Active then  cdsCompras.CreateDataSet;

  cdsCompras.EmptyDataSet;

  cds := TClientDataSet.Create(nil);

  try

    cds.CloneCursor(cdsPedidos,false);

    cds.IndexFieldNames := 'QTD_COMPRAS';

    cds.First;

    while not cds.Eof do begin
      if cds.fieldByName('QTD_COMPRAS').AsString <> '' then begin


        linha_atual := cds.RecNo;
        clientes := 0;
        qtde_vezes := cds.fieldByName('QTD_COMPRAS').AsString;

        while qtde_vezes = cds.fieldByName('QTD_COMPRAS').AsString do begin
          Inc(clientes);

          cds.Next;

          if cds.Eof then  break;
        end;

        cdsCompras.Append;
        cdsComprasQTDE_COMPRAS.AsString   := 'Clientes '+ qtde_vezes +' compra';
        cdsComprasQTDE_CLIENTES.AsInteger := clientes;
        cdsCompras.Post;

        cds.RecNo := linha_atual + clientes -1;
      end;

      cds.Next;
    end;

  finally
    FreeAndNil(cds);
  end;
end;

end.
