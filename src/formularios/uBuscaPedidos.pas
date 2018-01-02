unit uBuscaPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, DBGridCBN, Vcl.ComCtrls, Vcl.StdCtrls, System.StrUtils, Generics.Collections, Pedido, Datasnap.Provider,
  Datasnap.DBClient;

type
  TfrmBuscaPedidos = class(TfrmPadrao)
    gbPeriodo: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    DBGridCBN1: TDBGridCBN;
    qry: TFDQuery;
    ds: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    chkPeriodoGeral: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    cdsCODIGO: TIntegerField;
    cdsNUMPEDIDO: TStringField;
    cdsDT_LIMITE_ENTREGA: TDateField;
    cdsVALOR_TOTAL: TBCDField;
    cdsCLIENTE: TStringField;
    cdsPONTOS: TBCDField;
    cdsTAG: TStringField;
    btnFiltrar: TBitBtn;
    procedure chkPeriodoGeralClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure DBGridCBN1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridCBN1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FPedidos: TObjectList<TPedido>;

    procedure BuscaPedidos;
    procedure CarregaPedidos;
  public
    property Pedidos :TObjectList<TPedido> read FPedidos;
  end;

var
  frmBuscaPedidos: TfrmBuscaPedidos;

implementation

uses repositorio, FabricaRepositorio;

{$R *.dfm}

procedure TfrmBuscaPedidos.BuscaPedidos;
var condicao_periodo :String;
begin
  if not chkPeriodoGeral.Checked then
    condicao_periodo := '   AND (PED.dt_limite_entrega between :dti and :dtf) ';

  cds.Close;
  qry.SQL.Text := 'SELECT PED.CODIGO, PED.numpedido, PED.dt_limite_entrega, PED.valor_total, CLI.razao CLIENTE,                       '+
                  '      (sum((coalesce(it.qtd_rn,0) - coalesce(ci.qtd_rn, 0)) + (coalesce(it.qtd_p,0) - coalesce(ci.qtd_p, 0)) +     '+
                  '      (coalesce(it.qtd_m,0) - coalesce(ci.qtd_m, 0))   + (coalesce(it.qtd_g,0) - coalesce(ci.qtd_g, 0)) +          '+
                  '      (coalesce(it.qtd_1,0) - coalesce(ci.qtd_1, 0))   + (coalesce(it.qtd_2,0) - coalesce(ci.qtd_2, 0)) +          '+
                  '      (coalesce(it.qtd_3,0) - coalesce(ci.qtd_3, 0))   + (coalesce(it.qtd_4,0) - coalesce(ci.qtd_4, 0)) +          '+
                  '      (coalesce(it.qtd_6,0) - coalesce(ci.qtd_6, 0))   + (coalesce(it.qtd_8,0) - coalesce(ci.qtd_8, 0)) +          '+
                  '      (coalesce(it.qtd_10,0) - coalesce(ci.qtd_10, 0)) + (coalesce(it.qtd_12,0) - coalesce(ci.qtd_12, 0)) +        '+
                  '      (coalesce(it.qtd_14,0) - coalesce(ci.qtd_14, 0)) + (coalesce(it.qtd_unica,0) - coalesce(ci.qtd_unica, 0)))   '+
                  '      * 2 * count(distinct it.cod_produto) * (ped.dt_limite_entrega - current_date) * 20 * 1) / 1000 as PONTOS     '+

                  ' FROM PEDIDOS PED                                                                                                  '+

                  ' INNER JOIN PESSOAS          CLI on CLI.codigo = PED.cod_cliente                                                   '+
                  ' LEFT JOIN PEDIDOS_FATURADOS PF ON PF.CODIGO_PEDIDO = PED.CODIGO  LEFT JOIN NFCE ON NFCE.CODIGO_PEDIDO = PED.CODIGO'+
                  ' LEFT JOIN PEDIDOS_MAPA PM ON PM.CODIGO_PEDIDO = PEd.CODIGO                                                        '+
                  ' inner join itens              it on it.cod_pedido = PED.codigo                                                    '+
                  ' left  join conferencia_itens   ci on ci.codigo_item = it.codigo                                                   '+

                  ' WHERE ( (PF.CODIGO IS NULL) AND ((PED.DESPACHADO IS NULL) OR (PED.DESPACHADO <> ''S'')) )                         '+
                  '   AND ((PED.CANCELADO IS NULL) OR (PED.CANCELADO <> ''S''))  AND (PM.CODIGO IS NULL)                              '+
                  condicao_periodo+

                  ' group by ped.numpedido, ped.codigo, ped.dt_limite_entrega, PED.valor_total, CLI.razao                             '+
                  ' order by PONTOS                                                                                                   ';

  if not chkPeriodoGeral.Checked then
  begin
    qry.ParamByName('dti').AsDate := dtpInicio.Date;
    qry.ParamByName('dtf').AsDate := dtpFim.Date;
  end;
  cds.Open;
end;

procedure TfrmBuscaPedidos.CarregaPedidos;
var Pedido :TPedido;
    repositorio :TRepositorio;
begin
  FPedidos    := TObjectList<TPedido>.Create();
  repositorio := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);

  cds.First;
  while not qry.Eof do
  begin
    Pedido := TPedido(repositorio.Get(cdsCODIGO.AsInteger));
    Pedido.pontos := cdsPONTOS.AsFloat;
    FPedidos.Add(Pedido);
    cds.Next;
  end;
end;

procedure TfrmBuscaPedidos.chkPeriodoGeralClick(Sender: TObject);
begin
  dtpInicio.Enabled := not chkPeriodoGeral.Checked;
  dtpFim.Enabled    := not chkPeriodoGeral.Checked;
end;

procedure TfrmBuscaPedidos.DBGridCBN1DblClick(Sender: TObject);
begin
  if qry.IsEmpty then
    exit;

  cds.Edit;
  cdsTAG.AsString := IfThen(cdsTAG.AsString = 'S', 'N', 'S');
  cds.Post;
end;

procedure TfrmBuscaPedidos.DBGridCBN1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if cdsTAG.AsString = 'S' then begin
    TDBgridCBN(Sender).Canvas.Brush.Color := clSkyBlue;
    TDBgridCBN(Sender).Canvas.FillRect(Rect);
    TDBgridCBN(Sender).Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);
  end;
end;

procedure TfrmBuscaPedidos.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FPedidos);
  inherited;
end;

procedure TfrmBuscaPedidos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
  begin
    key := 0;
    self.ModalResult := mrCancel;
  end
  else if key = VK_RETURN then
  begin
    cds.Filtered := false;
    cds.Filter   := '(TAG = ''S'')';
    cds.Filtered := true;
    if not qry.IsEmpty then
    begin
      carregaPedidos;
      key := 0;
      self.ModalResult := mrOk
    end;
  end
  else if key = VK_F2 then
    btnFiltrar.Click;

  inherited;
end;

procedure TfrmBuscaPedidos.FormShow(Sender: TObject);
begin
  inherited;
  dtpInicio.Date := Date - 30;
  dtpFim.Date    := Date;
end;

procedure TfrmBuscaPedidos.btnFiltrarClick(Sender: TObject);
begin
  buscaPedidos;
end;

end.
