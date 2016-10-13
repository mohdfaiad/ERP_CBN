unit frameBuscaPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RxToolEdit, RxCurrEdit, Buttons, ObjetoGenerico, Pedido, Contnrs, Item, TipoBuscaPedido,
  ExtCtrls;

type
  TBuscaPedido = class(TFrame)
    btnBuscar: TBitBtn;
    rgTipoBusca: TRadioGroup;
    edtNumPedido: TEdit;
    stNumPed: TStaticText;
    procedure btnBuscarClick(Sender: TObject);
    procedure edtNumPedidoExit(Sender: TObject);
    procedure rgTipoBuscaClick(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
    procedure edtNumPedidoKeyPress(Sender: TObject; var Key: Char);

  private
    Pedido             :TObjetoGenerico;
    Fcodigo            :integer;
    Fnumped            :String;
    FPed               :TPedido;
    FItens             :TObjectList;
    FbuscaParaInclusao :boolean;
    FPedido_Faturado   :Boolean;
    FTipoBusca         :TTipoBuscaPedido;
    FBuscaParcial      :Boolean;
    FpermiteCancelado  :Boolean;
    FBuscaParaConferencia: Boolean;
    FPedidosLoja: Boolean;

    procedure buscaPedido(codigo:String);
    procedure Setcodigo(const Value: integer);
    procedure Setnumped(const Value: String);
    procedure SetPed(const Value: TPedido);
    procedure buscaItens;
    procedure SetbuscaParaInclusao(const Value: boolean);
    procedure SetpermiteCancelado(const Value: Boolean);
    procedure SetBuscaParaConferencia(const Value: Boolean);
    function GetExiste: Boolean;

  public
    property codigo :integer            read Fcodigo            write Setcodigo;
    property numped :String             read Fnumped            write Setnumped;
    property Ped    :TPedido            read FPed               write SetPed;
    property Itens  :TObjectList        read FItens;
    property existe :Boolean            read GetExiste;
    property buscaParaInclusao    :boolean read FbuscaParaInclusao write SetbuscaParaInclusao;
    property pedido_faturado      :Boolean read FPedido_Faturado;
    property permiteCancelado     :Boolean read FpermiteCancelado write SetpermiteCancelado;
    property BuscaParaConferencia :Boolean read FBuscaParaConferencia write SetBuscaParaConferencia;
    property pedidosLoja          :Boolean read FPedidosLoja     write FPedidosLoja;
    
    procedure limpa;
    
  end;

implementation

uses uPesquisaSimples, DB, uModulo, StrUtils;

{$R *.dfm}

{ TBuscaPedido }

procedure TBuscaPedido.buscaPedido(codigo: String);
var campoRetorno, condicao_tipo, condicao_cancelado :String;
begin
  campoRetorno := 'NUMPEDIDO'; //campo que deseja que retorne

  condicao_tipo := IfThen(FTipoBusca = tbpTodos, '',
                                                IfThen(FTipoBusca = tbpFaturados, ' and not (pf.codigo is null) ',
                                                                                  ' and ( (pf.codigo is null) and ((p.despachado is null) or (p.despachado <> ''S'')) ) '));
  if not self.FpermiteCancelado then
    condicao_cancelado := ' and ((p.cancelado is null) or (p.cancelado <> ''S'')) ';

  if FPedidosLoja then
    condicao_tipo := ' and (p.numpedido like ''L%'') and (nfce.codigo is null)';

  if Pedido = nil then
    Pedido := TObjetoGenerico.Create;

  Pedido.SQL := 'Select first 1 p.*, pf.codigo_nota_fiscal from Pedidos p       '+
                ' left join pedidos_faturados pf on pf.codigo_pedido = p.codigo '+
                ' left join nfce on nfce.codigo_pedido = p.codigo               '+
                'where p.'+campoRetorno+'='''+ codigo + ''''+ condicao_tipo +
                condicao_cancelado;

                               //condição para bloquear a seleção de pedidos bloqueados
  if not (Pedido.BuscaVazia) {and (Pedido.getCampo('codigo_nota_fiscal').AsFloat = 0)} then begin

    if FPed = nil then  FPed := TPedido.Create;

    edtNumPedido.Text   := Pedido.getCampo('numpedido').AsString;
    self.codigo         := Pedido.getCampo('codigo').AsInteger;

    FPed.Codigo            := Pedido.getCampo('codigo').AsInteger;
    FPed.numpedido         := Pedido.getCampo('numpedido').AsString;
    FPed.cod_tab_preco     := Pedido.getCampo('cod_tab_preco').AsInteger;
    Fped.cod_forma_pag     := Pedido.getCampo('cod_forma_pag').AsInteger;
    Fped.cod_filial        := Pedido.getCampo('cod_filial').AsInteger;
    Fped.cod_filial_digi   := Pedido.getCampo('cod_filial_digi').AsInteger;
    Fped.cod_cliente       := Pedido.getCampo('cod_cliente').AsInteger;
    Fped.cod_transp        := Pedido.getCampo('cod_transp').AsInteger;
    Fped.cod_repres        := Pedido.getCampo('cod_repres').AsInteger;
    Fped.dt_cadastro       := Pedido.getCampo('dt_cadastro').AsDateTime;
    Fped.dt_representante  := Pedido.getCampo('dt_representante').AsDateTime;
    Fped.dt_recebimento    := Pedido.getCampo('dt_recebimento').AsDateTime;
    Fped.dt_entrega        := Pedido.getCampo('dt_entrega').AsDateTime;
    Fped.dt_limite_entrega := Pedido.getCampo('dt_limite_entrega').AsDateTime;
    Fped.desconto          := Pedido.getCampo('desconto').AsFloat;
    FPed.desconto_itens    := Pedido.getCampo('desconto_itens').AsFloat;
    FPed.desconto_fpgto    := Pedido.getCampo('desconto_fpgto').AsFloat;
    Fped.acrescimo         := Pedido.getCampo('acrescimo').AsFloat;
    Fped.comissao          := Pedido.getCampo('comissao').AsFloat;
    FPed.desconto_comiss   := Pedido.getCampo('desconto_comiss').AsFloat;
    Fped.valor_total       := Pedido.getCampo('valor_total').AsFloat;
    Fped.aprovacao         := Pedido.getCampo('aprovacao').AsString;
    Fped.aprovado_por      := Pedido.getCampo('aprovado_por').AsString;
    Fped.dt_aprovacao      := Pedido.getCampo('dt_aprovacao').AsDateTime;
    Fped.tipo_frete        := Pedido.getCampo('tipo_frete').AsInteger;
    Fped.observacao        := Pedido.getCampo('observacao').AsString;
    Fped.despachado        := Pedido.getCampo('despachado').AsString;
    FPed.cod_pedido_matriz := Pedido.getCampo('cod_pedido_matriz').AsInteger;
    Fped.dt_despacho       := Pedido.getCampo('dt_despacho').AsDateTime;
    FPedido_Faturado       := (Pedido.getCampo('codigo_nota_fiscal').AsFloat > 0);
    FPed.cancelado         := Pedido.getCampo('cancelado').AsString;
    FPed.valor_frete       := Pedido.getCampo('valor_frete').AsFloat;

    buscaItens;
    keybd_event(VK_TAB, 0, 0, 0);

  end
  else begin
   // if (Pedido.getCampo('codigo_nota_fiscal').AsFloat > 0) then   raise Exception.Create('Não se pode alterar um pedido já faturado');
    if not buscaParaInclusao then  Limpa;
  end;

    FreeAndNil(Pedido);
end;

procedure TBuscaPedido.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TBuscaPedido.Setnumped(const Value: String);
begin
  buscaPedido(Value);
end;

procedure TBuscaPedido.btnBuscarClick(Sender: TObject);
var campoRetorno, condicao_tipo, SQL :String;
begin
  campoRetorno  := 'NUMPEDIDO';
  condicao_tipo := '';
  condicao_tipo := IfThen(FTipoBusca = tbpTodos, '',
                          IfThen(FTipoBusca = tbpFaturados, ' and (not (pf.codigo is null) or (p.despachado = ''S'')) ',
                                                            ' and ( (pf.codigo is null) and ((p.despachado is null) or (p.despachado <> ''S'')) ) '));
  if FPedidosLoja then
    condicao_tipo := ' and (p.numpedido like ''L%'') and (nfce.codigo is null)';

  if not FBuscaParaConferencia then
  begin
    SQL := 'select '+IfThen(FPedidosLoja, 'iif(nfce.codigo is null, '''', ''ENVIADO'') st', 'p.dt_representante "Data Rep."')+', p.numpedido , p.valor_total, c.razao cliente '+
           '   from pedidos p                                                                   '+
           ' left join pessoas c on c.codigo = p.cod_cliente                                    '+
           ' left join pedidos_faturados pf on pf.codigo_pedido = p.codigo                      '+
           ' left join nfce on nfce.codigo_pedido = p.codigo                                    '+
           ' where ((p.cancelado is null) or (p.cancelado <> ''S'')) '+ condicao_tipo+
           ' order by p.dt_representante                                                        ';
  end
  else
  begin
    SQL := 'select p.dt_representante "Data Rep.", p.numpedido , p.valor_total, p.razao cliente, '+
           ' per.percent_disponivel "% Estoque", per.q_caixas "CX''s completas"                  '+
           '    from vw_pedidos_p_conferencia p                                                  '+
           ' left join percent_estoque_disponivel(p.codigo) per on (1=1)                         '+
           ' order by p.dt_representante, per.percent_disponivel, per.q_caixas                   ';
  end;
  frmPesquisaSimples := TFrmPesquisaSimples.Create(Self, SQL , campoRetorno, 'Selecione o pedido desejado...');
  frmPesquisaSimples.Align := alClient;
  if frmPesquisaSimples.ShowModal = mrOk then
    buscaPedido(frmPesquisaSimples.cds_retorno.Fields[0].AsString);
  frmPesquisaSimples.Release;
end;

procedure TBuscaPedido.limpa;
begin
//  edtNumPedido.Value := 0;
  self.codigo := 0;
  self.FPedido_Faturado := false;

  if assigned(self.Itens) then
    if (self.Itens.Count) > 0 then
       Self.Itens.Clear;

  FreeAndNil(FPed);
end;

procedure TBuscaPedido.edtNumPedidoExit(Sender: TObject);
begin
 try
   if edtNumPedido.Text <> '' then
     buscaPedido(edtNumPedido.text);
 except
   on e : Exception do
     begin
       raise Exception.Create(e.Message);
     end;
 end;
end;

procedure TBuscaPedido.SetPed(const Value: TPedido);
begin
  FPed := Value;
end;

procedure TBuscaPedido.buscaItens;
var  Item: TItem;
begin
  try
    dm.qryGenerica.Close;
    dm.qryGenerica.SQL.Text := 'select i.*, p.referencia refProd, c.referencia refCor from itens i '+
                               'left join produtos p on p.codigo = i.cod_produto                   '+
                               'left join cores c on c.codigo = i.cod_cor                          '+
                               'where i.cod_pedido = :pedido                                       ';
    dm.qryGenerica.ParamByName('pedido').AsInteger := ped.Codigo;
    dm.qryGenerica.Open;

    if not dm.qryGenerica.IsEmpty then begin
      FItens := TObjectList.Create(true);
      self.Itens.OwnsObjects := true;
    end;

    dm.qryGenerica.First;
    while not dm.qryGenerica.Eof do begin

      Item := TItem.Create;

      Item.codigo            := dm.qryGenerica.fieldByName('codigo').AsInteger;
        Item.cod_pedido        := dm.qryGenerica.fieldByName('cod_pedido').AsInteger;
      Item.cod_produto       := dm.qryGenerica.fieldByName('cod_produto').AsInteger;
      Item.cod_cor           := dm.qryGenerica.fieldByName('cod_cor').AsInteger;
      Item.preco             := dm.qryGenerica.fieldByName('preco').AsFloat;
      Item.desconto          := dm.qryGenerica.fieldByName('desconto').AsFloat;
      Item.valor_total       := dm.qryGenerica.fieldByName('valor_total').AsFloat;
      Item.ref_prod          := dm.qryGenerica.fieldByName('refProd').AsString;
      Item.ref_cor           := dm.qryGenerica.fieldByName('refCor').AsString;
      Item.qtd_RN            := dm.qryGenerica.fieldByName('QTD_RN').AsInteger;
      Item.qtd_P             := dm.qryGenerica.fieldByName('QTD_P').AsInteger;
      Item.qtd_M             := dm.qryGenerica.fieldByName('QTD_M').AsInteger;
      Item.qtd_G             := dm.qryGenerica.fieldByName('QTD_G').AsInteger;
      Item.qtd_1             := dm.qryGenerica.fieldByName('QTD_1').AsInteger;
      Item.qtd_2             := dm.qryGenerica.fieldByName('QTD_2').AsInteger;
      Item.qtd_3             := dm.qryGenerica.fieldByName('QTD_3').AsInteger;
      Item.qtd_4             := dm.qryGenerica.fieldByName('QTD_4').AsInteger;
      Item.qtd_6             := dm.qryGenerica.fieldByName('QTD_6').AsInteger;
      Item.qtd_8             := dm.qryGenerica.fieldByName('QTD_8').AsInteger;
      Item.qtd_UNICA         := dm.qryGenerica.fieldByName('QTD_UNICA').AsFloat;
      Item.qtd_total         := dm.qryGenerica.fieldByName('QTD_TOTAL').AsFloat;
      Item.observacao        := dm.qryGenerica.fieldByName('OBSERVACAO').AsString;

      Fitens.Add(Item);

      dm.qryGenerica.Next;
    end;
  except
    FreeAndNil(Item);
  end;
end;

function TBuscaPedido.GetExiste: Boolean;
begin
  Result := false;

  if edtNumPedido.Text = '' then  exit;

  dm.qryGenerica.Close;
  dm.qryGenerica.SQL.Text := 'Select codigo from Pedidos where numpedido = :pedido';
  dm.qryGenerica.ParamByName('pedido').AsString := edtNumPedido.Text;
  dm.qryGenerica.Open;

  if dm.qryGenerica.IsEmpty then  result := false
                            else  result := true;
end;

procedure TBuscaPedido.SetbuscaParaInclusao(const Value: boolean);
begin
  FbuscaParaInclusao := Value;
end;

procedure TBuscaPedido.rgTipoBuscaClick(Sender: TObject);
begin
  if rgTipoBusca.ItemIndex = 0 then
    self.FTipoBusca := tbpTodos
  else if rgTipoBusca.ItemIndex = 1 then
    self.FTipoBusca := tbpFaturados
  else if rgTipoBusca.ItemIndex = 2 then
    self.FTipoBusca := tbpNaoFaturados;

  if edtNumPedido.enabled then
    edtNumPedido.SetFocus;
end;

procedure TBuscaPedido.FrameEnter(Sender: TObject);
begin
  rgTipoBuscaClick(nil);
end;

procedure TBuscaPedido.edtNumPedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = '-') and (Pos('-',self.edtNumPedido.Text) > 0) then
    Key := #0;
    
  If not( key in['0'..'9',#08,'-','#','L','l'] ) then
    key := #0;
end;

procedure TBuscaPedido.SetpermiteCancelado(const Value: Boolean);
begin
  FpermiteCancelado := Value;
end;

procedure TBuscaPedido.SetBuscaParaConferencia(const Value: Boolean);
begin
  FBuscaParaConferencia := Value;
end;

end.
