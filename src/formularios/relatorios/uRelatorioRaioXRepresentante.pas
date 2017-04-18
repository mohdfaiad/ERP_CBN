unit uRelatorioRaioXRepresentante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, DBGridCBN, DB, DBClient, Provider,
  TipoPessoa, ExtCtrls, Buttons, ComCtrls, StdCtrls, frameBuscaPessoa, Mask,
  DBCtrls, RxToolEdit, RxCurrEdit, DateUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLFilters, RLPDFFilter;

type
  TfrmRelatorioRaioXRepresentante = class(TfrmPadrao)
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    gridPedidos: TDBGridCBN;
    Panel1: TPanel;
    BuscaPessoa1: TBuscaPessoa;
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
    ClientDataSet1TOT_VALOR: TAggregateField;
    ClientDataSet1TOT_DESCONTO: TAggregateField;
    ClientDataSet1TOT_PECAS: TAggregateField;
    ClientDataSet1TOT_COMISSAO: TAggregateField;
    ClientDataSet1MEDIA_VALOR: TAggregateField;
    ClientDataSet1MEDIA_PERC_DESC: TAggregateField;
    ClientDataSet1MEDIA_VLR_DESC: TAggregateField;
    ClientDataSet1MEDIA_PRAZO: TAggregateField;
    ClientDataSet1MEDIA_PECAS: TAggregateField;
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
    SpeedButton1: TSpeedButton;
    ClientDataSet1PREV_PGTO: TStringField;
    ClientDataSet1QTD_COMPRAS: TIntegerField;
    qry: TFDQuery;
    qryMediasEmpresa: TFDQuery;
    cdsMediasEmpresaTOTAL_DESCONTO: TBCDField;
    cdsMediasEmpresaTOTAL_LIQUIDO: TBCDField;
    cdsMediasEmpresaPRAZO: TFloatField;
    cdsMediasEmpresaPECAS: TSingleField;
    cdsMediasEmpresaTD: TIntegerField;
    ClientDataSet1DT_REPRESENTANTE: TDateField;
    ClientDataSet1DT_RECEBIMENTO: TDateField;
    ClientDataSet1DT_CADASTRO: TDateField;
    ClientDataSet1DT_FATURAMENTO: TDateField;
    ClientDataSet1CLIENTE: TStringField;
    ClientDataSet1FPGTO: TStringField;
    ClientDataSet1PRAZO: TFloatField;
    ClientDataSet1PECAS: TSingleField;
    ClientDataSet1COMISSAO: TBCDField;
    ClientDataSet1TOTAL_LIQUIDO: TBCDField;
    ClientDataSet1NUMPEDIDO: TStringField;
    ClientDataSet1TOTAL_DESCONTO: TBCDField;
    cdsMediasEmpresaPERC_DESCONTO_PEDIDO: TBCDField;
    ClientDataSet1PERC_DESCONTO_PEDIDO: TBCDField;
    ClientDataSet1VLRCOMISSAO: TBCDField;
    RLPDFFilter1: TRLPDFFilter;
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure dtpInicioChange(Sender: TObject);
    procedure dtpFimChange(Sender: TObject);
    procedure gridPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkPeriodoRepClick(Sender: TObject);
    procedure ClientDataSet1CalcFields(DataSet: TDataSet);
    procedure chkPeriodoEmpClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

    function monta_sql_representante :String;
    function monta_sql_medias_empresa :String;

    procedure carrega_medias_empresa;
    procedure comissoes_por_quinzena(Data: TDateTime; Valor_comissao :Real);
    procedure compra_por_cliente;
    procedure vezes_compradas;
  public
    { Public declarations }
  end;

var
  frmRelatorioRaioXRepresentante: TfrmRelatorioRaioXRepresentante;

implementation

uses DateTimeUtilitario, Math;

{$R *.dfm}

procedure TfrmRelatorioRaioXRepresentante.FormShow(Sender: TObject);
begin
  inherited;
  BuscaPessoa1.TipoPessoa := tpRepresentante;
  dtpInicio.DateTime      := strToDateTime( DateToStr(Date)+' '+'00:00:00');
  dtpFim.DateTime         := strToDateTime( DateToStr(Date)+' '+'23:59:59');
  carrega_medias_empresa;

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
            '       cast(( select sum(pro.qtd_pecas) from itens it                                                                   '+#13+
            '        LEFT JOIN produtos pro on it.cod_produto = pro.codigo                                                           '+#13+
            '        where it.cod_pedido = p.codigo) as Float) pecas, p.comissao, cast((p.valor_total-((p.valor_total*p.desconto_comiss)/100)) * p.comissao / 100 as numeric(15,2)) vlrComissao     '+#13+
            ' from pedidos P                                                                                                         '+#13+
            '       LEFT JOIN pedidos_faturados         PF  ON PF.CODIGO_PEDIDO = P.CODIGO                                           '+#13+
            '       LEFT JOIN NOTAS_FISCAIS             NF  ON NF.codigo = PF.codigo_nota_fiscal                                     '+#13+
            '       LEFT JOIN notas_fiscais_nfe_retorno nfr ON nfr.codigo_nota_fiscal = nf.codigo                                    '+#13+
            '       LEFT JOIN pessoas                   c   on p.cod_cliente = c.codigo                                              '+#13+
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

procedure TfrmRelatorioRaioXRepresentante.btnBuscarClick(Sender: TObject);
begin
  if (BuscaPessoa1.edtCodigo.AsInteger <= 0) then begin
    avisar('Representante não foi informado!');
    exit;
  end;

  ClientDataSet1.Close;
  qry.SQL.Text := monta_sql_representante;

  if not chkPeriodoRep.Checked then begin
    qry.ParamByName('dti').AsDateTime := dtpInicio.DateTime;
    qry.ParamByName('dtf').AsDateTime := dtpFim.DateTime;
  end;

  if cdsComissao.active then cdsComissao.EmptyDataSet;

  qry.ParamByName('codRep').AsInteger := BuscaPessoa1.edtCodigo.AsInteger;
  ClientDataSet1.Open;

  if ClientDataSet1.IsEmpty then begin
    avisar('Não foram encontrados registros com os filtros fornecidos');
    exit;
  end;

  compra_por_cliente;
  
  edtQtdPedidos.Text := IntToStr(ClientDataSet1.RecordCount);
end;

procedure TfrmRelatorioRaioXRepresentante.dtpInicioChange(Sender: TObject);
begin
  if dtpInicio.Date > dtpFim.Date then
    dtpFim.Date := dtpInicio.Date +1;
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
  if Column.Field = ClientDataSet1TOTAL_DESCONTO then
    begin
      gridPedidos.Canvas.Brush.Color := $00EFD0CF;
      gridPedidos.Canvas.FillRect( rect );
      gridPedidos.DefaultDrawColumnCell( Rect, DataCol, Column, state);
    end
  else if Column.Field = ClientDataSet1PERC_DESCONTO_PEDIDO then
    begin
      gridPedidos.Canvas.Brush.Color := $00EFD0CF;
      gridPedidos.Canvas.FillRect( rect );
      gridPedidos.DefaultDrawColumnCell( Rect, DataCol, Column, state);
    end
  else if Column.Field = ClientDataSet1TOTAL_LIQUIDO then
    begin
      gridPedidos.Canvas.Brush.Color := $00C7EBD1;
      gridPedidos.Canvas.FillRect( rect );
      gridPedidos.DefaultDrawColumnCell( Rect, DataCol, Column, state);
    end
  else if Column.Field = ClientDataSet1PECAS then
    begin
      gridPedidos.Canvas.Brush.Color := $00A7CDCF;
      gridPedidos.Canvas.FillRect( rect );
      gridPedidos.DefaultDrawColumnCell( Rect, DataCol, Column, state);
    end
  else if Column.Field = ClientDataSet1COMISSAO then
    begin
      gridPedidos.Canvas.Brush.Color := $00CDD7DA;
      gridPedidos.Canvas.FillRect( rect );
      gridPedidos.DefaultDrawColumnCell( Rect, DataCol, Column, state);
    end
  else if Column.Field = ClientDataSet1PRAZO then
    begin
      gridPedidos.Canvas.Brush.Color := clWhite;
      gridPedidos.Canvas.FillRect( rect );
      gridPedidos.DefaultDrawColumnCell( Rect, DataCol, Column, state);
    end;
end;

procedure TfrmRelatorioRaioXRepresentante.carrega_medias_empresa;
begin
  cdsMediasEmpresa.Close;
  qryMediasEmpresa.SQL.Text := monta_sql_medias_empresa;

  if not chkPeriodoEmp.Checked then begin
    qryMediasEmpresa.ParamByName('dti').AsDateTime := dtpInicio.DateTime;
    qryMediasEmpresa.ParamByName('dtf').AsDateTime := dtpFim.DateTime;
  end;

  if not chkFiltroRepres.Checked then
    qryMediasEmpresa.ParamByName('codRep').AsInteger := BuscaPessoa1.edtCodigo.AsInteger;

  cdsMediasEmpresa.Open;
  gpbMediasEmpresa.Caption := ' MÉDIAS DA EMPRESA   [ '+ intToStr(cdsMediasEmpresa.RecordCount) +' pedidos faturados] ';

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
            ' cast( ( select sum(pro.qtd_pecas) from itens it                                                    '+
            ' LEFT JOIN produtos pro on it.cod_produto = pro.codigo                                              '+
            ' where it.cod_pedido = p.codigo)  as float) PECAS,                                                  '+
            ' iif(p.desconto_fpgto > 0, 1, 0) TD                                                                 '+
            ' from pedidos P                                                                                     '+
            ' LEFT JOIN pedidos_faturados         PF  ON PF.CODIGO_PEDIDO = P.CODIGO                             '+
            ' LEFT JOIN NOTAS_FISCAIS             NF  ON NF.codigo = PF.codigo_nota_fiscal                       '+
            ' LEFT JOIN notas_fiscais_nfe_retorno nfr ON nfr.codigo_nota_fiscal = nf.codigo                      '+
            ' LEFT JOIN pessoas                   c   on p.cod_cliente = c.codigo                                '+
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
    BuscaPessoa1.edtCodigo.SetFocus;
  end
  else begin
    dtpInicio.Enabled := true;
    dtpFim.Enabled    := true;
    dtpInicio.SetFocus;
  end;

end;

procedure TfrmRelatorioRaioXRepresentante.ClientDataSet1CalcFields(
  DataSet: TDataSet);
var dia, ano :Integer;
    mes, ultimoDiaMes :String;
begin
  if ClientDataSet1.recno > 0 then  Exit;

  dia := StrToInt( StringReplace(copy(ClientDataSet1DT_FATURAMENTO.AsString,1,2),'/','',[]) );
  mes := FormatDateTime('mm',ClientDataSet1DT_FATURAMENTO.AsDateTime);
  ano := IfThen( strToInt(mes) = 12, strToInt(FormatDateTime('yyyy', ClientDataSet1DT_FATURAMENTO.AsDateTime))+1,
                                     strToInt(FormatDateTime('yyyy', ClientDataSet1DT_FATURAMENTO.AsDateTime))    );
  mes := TDateTimeUtilitario.proximo_mes(ClientDataSet1DT_FATURAMENTO.AsDateTime);

  if dia > 15 then begin
    ultimoDiaMes := IntToStr( DaysInMonth( strToDate('01/'+mes+'/'+intToStr(ano) ) ) );

    ClientDataSet1PREV_PGTO.AsString := ultimoDiaMes +'/'+ mes +'/'+ intToStr(ano);
    comissoes_por_quinzena( ClientDataSet1PREV_PGTO.AsDateTime, ClientDataSet1VLRCOMISSAO.AsFloat);
  end
  else begin
    ClientDataSet1PREV_PGTO.AsString := '15/'+ mes+'/'+ intToStr(ano);
    comissoes_por_quinzena( ClientDataSet1PREV_PGTO.AsDateTime, ClientDataSet1VLRCOMISSAO.AsFloat);
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
  ClientDataSet1.OnCalcFields := nil;
  linha_atual := 0;   {}  linha_encontrada := 0;  {} nome_cliente := '';

  ClientDataSet1.IndexFieldNames := 'CLIENTE';
  ClientDataSet1.First;
  ClientDataSet1.DisableControls;
  edtTotClientes.Value := 0;

  while not ClientDataSet1.Eof do begin
    compras_cliente := 0;
    linha_atual     := ClientDataSet1.RecNo;
    nome_cliente    := ClientDataSet1CLIENTE.AsString;

    while nome_cliente = ClientDataSet1CLIENTE.AsString do begin
      inc(compras_cliente);

      ClientDataSet1.Next;

      if ClientDataSet1.Eof then  break;
    end;

    if not ClientDataSet1.Eof then
      ClientDataSet1.Prior;

    ClientDataSet1.Edit;
    ClientDataSet1QTD_COMPRAS.AsInteger := compras_cliente;
    ClientDataSet1.Post;

    edtTotClientes.Value := edtTotClientes.Value + 1;
    
    ClientDataSet1.RecNo := linha_atual + compras_cliente -1;

    ClientDataSet1.Next;
  end;

  vezes_compradas;

  ClientDataSet1.IndexFieldNames := 'CLIENTE';
  ClientDataSet1.First;

  ClientDataSet1.EnableControls;
    ClientDataSet1.OnCalcFields := ClientDataSet1CalcFields;
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

    cds.CloneCursor(ClientDataSet1,false);

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

procedure TfrmRelatorioRaioXRepresentante.SpeedButton1Click(
  Sender: TObject);
begin
  Close;
end;

end.
