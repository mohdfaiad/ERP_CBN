unit RepositorioPedido;

interface

uses
  DB,
  Auditoria,
  Repositorio;                                                                               

type
  TRepositorioPedido = class(TRepositorio)

  protected
    function Get             (Dataset :TDataSet) :TObject; overload; override;
    function GetNomeDaTabela                     :String;            override;
    function GetIdentificador(Objeto :TObject)   :Variant;           override;
    function GetRepositorio                     :TRepositorio;       override;

  protected
    function SQLGet                      :String;            override;
    function SQLSalvar                   :String;            override;
    function SQLGetAll                   :String;            override;
    function SQLRemover                  :String;            override;
    function SQLGetExiste(arrayDeCampos :array of string): String;            override;

  protected
    function IsInsercao(Objeto :TObject) :Boolean;           override;

  protected
    procedure SetParametros   (Objeto :TObject                        ); override;
    procedure SetIdentificador(Objeto :TObject; Identificador :Variant); override;

  //==============================================================================
  // Auditoria
  //==============================================================================
  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;

end;

implementation

uses
  SysUtils,
  Pedido;

{ TRepositorioPedido }

function TRepositorioPedido.Get(Dataset: TDataSet): TObject;
var
  Pedido :TPedido;
begin
   Pedido                   := TPedido.Create;
   Pedido.Codigo            := self.FQuery.FieldByName('CODIGO'           ).AsInteger;
   Pedido.numpedido         := self.FQuery.FieldByName('NUMPEDIDO'        ).AsString;
   Pedido.cod_tab_preco     := self.FQuery.FieldByName('COD_TAB_PRECO'    ).AsInteger;
   Pedido.cod_forma_pag     := self.FQuery.FieldByName('COD_FORMA_PAG'    ).AsInteger;
   Pedido.cod_filial        := self.FQuery.FieldByName('COD_FILIAL'       ).AsInteger;
   Pedido.cod_filial_digi   := self.FQuery.FieldByName('COD_FILIAL_DIGI'  ).AsInteger;
   Pedido.cod_cliente       := self.FQuery.FieldByName('COD_CLIENTE'      ).AsInteger;
   Pedido.cod_transp        := self.FQuery.FieldByName('COD_TRANSP'       ).AsInteger;
   Pedido.cod_repres        := self.FQuery.FieldByName('COD_REPRES'       ).AsInteger;
   Pedido.dt_cadastro       := self.FQuery.FieldByName('DT_cadastro'      ).AsDateTime;
   Pedido.dt_representante  := self.FQuery.FieldByName('DT_representante' ).AsDateTime;
   Pedido.dt_recebimento    := self.FQuery.FieldByName('DT_RECEBIMENTO'   ).AsDateTime;
   Pedido.dt_entrega        := self.FQuery.FieldByName('DT_ENTREGA'       ).AsDateTime;
   Pedido.dt_limite_entrega := self.FQuery.FieldByName('DT_LIMITE_ENTREGA').AsDateTime;
   Pedido.desconto          := self.FQuery.FieldByName('DESCONTO'         ).AsFloat;
   Pedido.acrescimo         := self.FQuery.FieldByName('ACRESCIMO'        ).AsFloat;
   Pedido.valor_frete       := self.FQuery.FieldByName('valor_frete'      ).AsFloat;
   Pedido.comissao          := self.FQuery.FieldByName('COMISSAO'         ).AsFloat;
   Pedido.valor_total       := self.FQuery.FieldByName('VALOR_TOTAL'      ).AsFloat;
   Pedido.aprovacao         := self.FQuery.FieldByName('APROVACAO'        ).AsString;
   Pedido.aprovado_por      := self.FQuery.FieldByName('APROVADO_POR'     ).AsString;
   Pedido.dt_aprovacao      := self.FQuery.FieldByName('DT_APROVACAO'     ).AsDateTime;
   Pedido.observacao        := self.FQuery.FieldByName('OBSERVACAO'       ).AsString;
   Pedido.tipo_frete        := self.FQuery.FieldByName('TIPO_FRETE'       ).AsInteger;
   Pedido.desconto_fpgto    := self.FQuery.FieldByName('DESCONTO_FPGTO'   ).AsFloat;
   Pedido.despachado        := self.FQuery.FieldByName('DESPACHADO'       ).AsString;
   Pedido.dt_despacho       := self.FQuery.FieldByName('DT_DESPACHO'      ).AsDateTime;
   Pedido.desconto_itens    := self.FQuery.FieldByName('DESCONTO_ITENS'   ).AsFloat;
   Pedido.cod_pedido_matriz := self.FQuery.FieldByName('COD_PEDIDO_MATRIZ').AsInteger;
   Pedido.desconto_comiss   := self.FQuery.FieldByName('DESCONTO_COMISS'  ).AsFloat;
   Pedido.cancelado         := self.FQuery.FieldByName('CANCELADO'        ).AsString;
   Pedido.peso              := self.FQuery.FieldByName('peso'  ).AsFloat;
   Pedido.volumes           := self.FQuery.FieldByName('volumes'  ).AsInteger;

   Result := Pedido;
end;

function TRepositorioPedido.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TPedido(Objeto).Codigo;
end;

function TRepositorioPedido.GetNomeDaTabela: String;
begin
  result := 'PedidoS';
end;

function TRepositorioPedido.GetRepositorio: TRepositorio;
begin
  result := TRepositorioPedido.Create;
end;

function TRepositorioPedido.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TPedido(Objeto).Codigo <= 0);
end;

procedure TRepositorioPedido.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  PedidoAntigo :TPedido;
  PedidoNovo   :TPedido;
begin
   PedidoAntigo := (AntigoObjeto as TPedido);
   PedidoNovo   := (Objeto       as TPedido);

   if (PedidoAntigo.numpedido <> PedidoNovo.numpedido) then
    Auditoria.AdicionaCampoAlterado('numpedido', PedidoAntigo.numpedido, PedidoNovo.numpedido);
   if (PedidoAntigo.cod_tab_preco <> PedidoNovo.cod_tab_preco) then
    Auditoria.AdicionaCampoAlterado('cod_tab_preco', intToStr(PedidoAntigo.cod_tab_preco), intToStr(PedidoNovo.cod_tab_preco));
   if (PedidoAntigo.cod_forma_pag <> PedidoNovo.cod_forma_pag) then
    Auditoria.AdicionaCampoAlterado('cod_forma_pag', intToStr(PedidoAntigo.cod_forma_pag), intToStr(PedidoNovo.cod_forma_pag));
   if (PedidoAntigo.cod_filial <> PedidoNovo.cod_filial) then
    Auditoria.AdicionaCampoAlterado('cod_filial', intToStr(PedidoAntigo.cod_filial), intToStr(PedidoNovo.cod_filial));
   if (PedidoAntigo.cod_filial_digi <> PedidoNovo.cod_filial_digi) then
    Auditoria.AdicionaCampoAlterado('cod_filial_digi', intToStr(PedidoAntigo.cod_filial_digi), intToStr(PedidoNovo.cod_filial_digi));
   if (PedidoAntigo.cod_cliente <> PedidoNovo.cod_cliente) then
    Auditoria.AdicionaCampoAlterado('cod_cliente', intToStr(PedidoAntigo.cod_cliente), intToStr(PedidoNovo.cod_cliente));
   if (PedidoAntigo.cod_transp <> PedidoNovo.cod_transp) then
    Auditoria.AdicionaCampoAlterado('cod_transp', intToStr(PedidoAntigo.cod_transp), intToStr(PedidoNovo.cod_transp));
   if (PedidoAntigo.cod_repres <> PedidoNovo.cod_repres) then
    Auditoria.AdicionaCampoAlterado('cod_repres', intToStr(PedidoAntigo.cod_repres), intToStr(PedidoNovo.cod_repres));
   if (PedidoAntigo.dt_cadastro <> PedidoNovo.dt_cadastro) then
    Auditoria.AdicionaCampoAlterado('dt_cadastro', DateToStr(PedidoAntigo.dt_cadastro), DateToStr(PedidoNovo.dt_cadastro));
   if (PedidoAntigo.dt_representante <> PedidoNovo.dt_representante) then
    Auditoria.AdicionaCampoAlterado('dt_representante', DateToStr(PedidoAntigo.dt_representante), DateToStr(PedidoNovo.dt_representante));
   if (PedidoAntigo.dt_recebimento <> PedidoNovo.dt_recebimento) then
    Auditoria.AdicionaCampoAlterado('dt_recebimento', DateToStr(PedidoAntigo.dt_recebimento), DateToStr(PedidoNovo.dt_recebimento));
   if (PedidoAntigo.dt_entrega <> PedidoNovo.dt_entrega) then
    Auditoria.AdicionaCampoAlterado('dt_entrega', DateToStr(PedidoAntigo.dt_entrega), DateToStr(PedidoNovo.dt_entrega));
   if (PedidoAntigo.dt_limite_entrega <> PedidoNovo.dt_limite_entrega) then
    Auditoria.AdicionaCampoAlterado('dt_limite_entrega', DateToStr(PedidoAntigo.dt_limite_entrega), DateToStr(PedidoNovo.dt_limite_entrega));
   if (PedidoAntigo.desconto <> PedidoNovo.desconto) then
    Auditoria.AdicionaCampoAlterado('desconto', FloatToStr(PedidoAntigo.desconto), FloatToStr(PedidoNovo.desconto));
   if (PedidoAntigo.acrescimo <> PedidoNovo.acrescimo) then
    Auditoria.AdicionaCampoAlterado('acrescimo', FloatToStr(PedidoAntigo.acrescimo), floatToStr(PedidoNovo.acrescimo));
   if (PedidoAntigo.comissao <> PedidoNovo.comissao) then
    Auditoria.AdicionaCampoAlterado('comissao', floatToStr(PedidoAntigo.comissao), floatToStr(PedidoNovo.comissao));
   if (PedidoAntigo.valor_frete <> PedidoNovo.valor_frete) then
    Auditoria.AdicionaCampoAlterado('valor_frete', floatToStr(PedidoAntigo.valor_frete), floatToStr(PedidoNovo.valor_frete));
   if (PedidoAntigo.valor_total <> PedidoNovo.valor_total) then
    Auditoria.AdicionaCampoAlterado('valor_total', floatToStr(PedidoAntigo.valor_total), floatToStr(PedidoNovo.valor_total));
   if (PedidoAntigo.aprovacao <> PedidoNovo.aprovacao) then
    Auditoria.AdicionaCampoAlterado('aprovacao', PedidoAntigo.aprovacao, PedidoNovo.aprovacao);
   if (PedidoAntigo.aprovado_por <> PedidoNovo.aprovado_por) then
    Auditoria.AdicionaCampoAlterado('aprovado_por', PedidoAntigo.aprovado_por, PedidoNovo.aprovado_por);
   if (PedidoAntigo.dt_aprovacao <> PedidoNovo.dt_aprovacao) then
    Auditoria.AdicionaCampoAlterado('dt_aprovacao', DateToStr(PedidoAntigo.dt_aprovacao), DateToStr(PedidoNovo.dt_aprovacao));
   if (PedidoAntigo.observacao <> PedidoNovo.observacao) then
    Auditoria.AdicionaCampoAlterado('observacao', PedidoAntigo.observacao, PedidoNovo.observacao);
   if (PedidoAntigo.tipo_frete <> PedidoNovo.tipo_frete) then
    Auditoria.AdicionaCampoAlterado('tipo_frete', intToStr(PedidoAntigo.tipo_frete), intToStr(PedidoNovo.tipo_frete));
   if (PedidoAntigo.desconto_fpgto <> PedidoNovo.desconto_fpgto) then
    Auditoria.AdicionaCampoAlterado('desconto_fpgto', FloatToStr(PedidoAntigo.desconto_fpgto), FloatToStr(PedidoNovo.desconto_fpgto));
   if (PedidoAntigo.despachado <> PedidoNovo.despachado) then
    Auditoria.AdicionaCampoAlterado('despachado', PedidoAntigo.despachado, PedidoNovo.despachado);
   if (PedidoAntigo.dt_despacho <> PedidoNovo.dt_despacho) then
    Auditoria.AdicionaCampoAlterado('dt_despacho', DateToStr(PedidoAntigo.dt_despacho), DateToStr(PedidoNovo.dt_despacho));
   if (PedidoAntigo.desconto_itens <> PedidoNovo.desconto_itens) then
    Auditoria.AdicionaCampoAlterado('desconto_itens', FloatToStr(PedidoAntigo.desconto_itens), FloatToStr(PedidoNovo.desconto_itens));
   if (PedidoAntigo.cod_pedido_matriz <> PedidoNovo.cod_pedido_matriz) then
    Auditoria.AdicionaCampoAlterado('cod_pedido_matriz', iNTToStr(PedidoAntigo.cod_pedido_matriz), IntToStr(PedidoNovo.cod_pedido_matriz));
   if (PedidoAntigo.desconto_itens <> PedidoNovo.desconto_comiss) then
    Auditoria.AdicionaCampoAlterado('desconto_COMISS', FloatToStr(PedidoAntigo.desconto_comiss), FloatToStr(PedidoNovo.desconto_comiss));
   if (PedidoAntigo.cancelado <> PedidoNovo.cancelado) then
    Auditoria.AdicionaCampoAlterado('CANCELADO', PedidoAntigo.cancelado, PedidoNovo.cancelado);
   if (PedidoAntigo.peso <> PedidoNovo.peso) then
    Auditoria.AdicionaCampoAlterado('peso', FloatToStr(PedidoAntigo.peso), FloatToStr(PedidoNovo.peso));
   if (PedidoAntigo.volumes <> PedidoNovo.volumes) then
    Auditoria.AdicionaCampoAlterado('volumes', iNTToStr(PedidoAntigo.volumes), IntToStr(PedidoNovo.volumes));

end;

procedure TRepositorioPedido.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Pedido :TPedido;
begin
   Pedido := (Objeto as TPedido);

   Auditoria.AdicionaCampoExcluido('CODIGO'           , IntToStr(Pedido.Codigo)           );
   Auditoria.AdicionaCampoExcluido('NUMPEDIDO'        , Pedido.numpedido                  );
   Auditoria.AdicionaCampoExcluido('COD_TAB_PRECO'    , IntToStr(Pedido.cod_tab_preco)    );
   Auditoria.AdicionaCampoExcluido('COD_FORMA_PAG'    , IntToStr(Pedido.cod_forma_pag)    );
   Auditoria.AdicionaCampoExcluido('COD_FILIAL'       , IntToStr(Pedido.cod_filial)       );
   Auditoria.AdicionaCampoExcluido('COD_FILIAL_DIGI'  , IntToStr(Pedido.cod_filial_digi)  );
   Auditoria.AdicionaCampoExcluido('COD_CLIENTE'      , IntToStr(Pedido.cod_cliente)      );
   Auditoria.AdicionaCampoExcluido('COD_TRANSP'       , IntToStr(Pedido.cod_transp)       );
   Auditoria.AdicionaCampoExcluido('COD_REPRES'       , IntToStr(Pedido.cod_repres)       );
   Auditoria.AdicionaCampoExcluido('DT_cadastro'      , DateToStr(Pedido.dt_cadastro)     );
   Auditoria.AdicionaCampoExcluido('DT_representante' , DateToStr(Pedido.dt_representante));
   Auditoria.AdicionaCampoExcluido('DT_RECEBIMENTO'   , DateToStr(Pedido.dt_recebimento)  );
   Auditoria.AdicionaCampoExcluido('DT_ENTREGA'       , DateToStr(Pedido.dt_entrega)      );
   Auditoria.AdicionaCampoExcluido('DT_LIMITE_ENTREGA', DateToStr(Pedido.dt_limite_entrega));
   Auditoria.AdicionaCampoExcluido('DESCONTO'         , FloatToStr(Pedido.desconto)       );
   Auditoria.AdicionaCampoExcluido('ACRESCIMO'        , FloatToStr(Pedido.acrescimo)      );
   Auditoria.AdicionaCampoExcluido('VALOR_FRETE'      , FloatToStr(Pedido.valor_frete)    );
   Auditoria.AdicionaCampoExcluido('COMISSAO'         , FloatToStr(Pedido.comissao)       );
   Auditoria.AdicionaCampoExcluido('VALOR_TOTAL'      , FloatToStr(Pedido.valor_total)    );
   Auditoria.AdicionaCampoExcluido('APROVACAO'        , Pedido.aprovacao                  );
   Auditoria.AdicionaCampoExcluido('APROVADO_POR'     , Pedido.aprovado_por               );
   Auditoria.AdicionaCampoExcluido('DT_APROVACAO'     , DateToStr(Pedido.dt_aprovacao)    );
   Auditoria.AdicionaCampoExcluido('OBSERVACAO'       , Pedido.observacao                 );
   Auditoria.AdicionaCampoExcluido('TIPO_FRETE'       , IntToStr(Pedido.tipo_frete)       );
   Auditoria.AdicionaCampoExcluido('DESCONTO_FPGTO'   , FloatToStr(Pedido.desconto_fpgto) );
   Auditoria.AdicionaCampoExcluido('DESPACHADO'       , Pedido.despachado                 );
   Auditoria.AdicionaCampoExcluido('DT_DESPACHO'      , DateToStr(Pedido.dt_despacho)     );
   Auditoria.AdicionaCampoExcluido('DESCONTO_ITENS'   , FloatToStr(Pedido.desconto_itens) );
   Auditoria.AdicionaCampoExcluido('COD_PEDIDO_MATRIZ', IntToStr(Pedido.cod_pedido_matriz));
   Auditoria.AdicionaCampoExcluido('DESCONTO_COMISS'  , FloatToStr(Pedido.desconto_comiss));
   Auditoria.AdicionaCampoExcluido('CANCELADO'        , Pedido.cancelado                  );
   Auditoria.AdicionaCampoExcluido('PESO'             , FloatToStr(Pedido.PESO)           );
   Auditoria.AdicionaCampoExcluido('VOLUMES'           , IntToStr(Pedido.volumes)           );
end;

procedure TRepositorioPedido.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Pedido :TPedido;
begin
   Pedido := (Objeto as TPedido);

   Auditoria.AdicionaCampoIncluido('CODIGO'           , IntToStr(Pedido.Codigo)           );
   Auditoria.AdicionaCampoIncluido('NUMPEDIDO'        , Pedido.numpedido                  );
   Auditoria.AdicionaCampoIncluido('COD_TAB_PRECO'    , IntToStr(Pedido.cod_tab_preco)    );
   Auditoria.AdicionaCampoIncluido('COD_FORMA_PAG'    , IntToStr(Pedido.cod_forma_pag)    );
   Auditoria.AdicionaCampoIncluido('COD_FILIAL'       , IntToStr(Pedido.cod_filial)       );
   Auditoria.AdicionaCampoIncluido('COD_FILIAL_DIGI'  , IntToStr(Pedido.cod_filial_digi)  );
   Auditoria.AdicionaCampoIncluido('COD_CLIENTE'      , IntToStr(Pedido.cod_cliente)      );
   Auditoria.AdicionaCampoIncluido('COD_TRANSP'       , IntToStr(Pedido.cod_transp)       );
   Auditoria.AdicionaCampoIncluido('COD_REPRES'       , IntToStr(Pedido.cod_repres)       );
   Auditoria.AdicionaCampoIncluido('DT_cadastro'      , DateToStr(Pedido.dt_cadastro)     );
   Auditoria.AdicionaCampoIncluido('DT_representante' , DateToStr(Pedido.dt_representante));
   Auditoria.AdicionaCampoIncluido('DT_RECEBIMENTO'   , DateToStr(Pedido.dt_recebimento)  );
   Auditoria.AdicionaCampoIncluido('DT_ENTREGA'       , DateToStr(Pedido.dt_entrega)      );
   Auditoria.AdicionaCampoIncluido('DT_LIMITE_ENTREGA', DateToStr(Pedido.dt_limite_entrega));
   Auditoria.AdicionaCampoIncluido('DESCONTO'         , FloatToStr(Pedido.desconto)       );
   Auditoria.AdicionaCampoIncluido('ACRESCIMO'        , FloatToStr(Pedido.acrescimo)      );
   Auditoria.AdicionaCampoIncluido('VALOR_FRETE'      , FloatToStr(Pedido.valor_frete)    );
   Auditoria.AdicionaCampoIncluido('COMISSAO'         , FloatToStr(Pedido.comissao)       );
   Auditoria.AdicionaCampoIncluido('VALOR_TOTAL'      , FloatToStr(Pedido.valor_total)    );
   Auditoria.AdicionaCampoIncluido('APROVACAO'        , Pedido.aprovacao                  );
   Auditoria.AdicionaCampoIncluido('APROVADO_POR'     , Pedido.aprovado_por               );
   Auditoria.AdicionaCampoIncluido('DT_APROVACAO'     , DateToStr(Pedido.dt_aprovacao)    );
   Auditoria.AdicionaCampoIncluido('OBSERVACAO'       , Pedido.observacao                 );
   Auditoria.AdicionaCampoIncluido('TIPO_FRETE'       , IntToStr(Pedido.tipo_frete)       );
   Auditoria.AdicionaCampoIncluido('DESCONTO_FPGTO'   , FloatToStr(Pedido.desconto_fpgto) );
   Auditoria.AdicionaCampoIncluido('DESPACHADO'       , Pedido.despachado                 );
   Auditoria.AdicionaCampoIncluido('DT_DESPACHO'      , DateToStr(Pedido.dt_despacho)     );
   Auditoria.AdicionaCampoIncluido('DESCONTO_ITENS'   , FloatToStr(Pedido.desconto_itens) );
   Auditoria.AdicionaCampoIncluido('COD_PEDIDO_MATRIZ', IntToStr(Pedido.cod_pedido_matriz));
   Auditoria.AdicionaCampoIncluido('DESCONTO_COMISS'  , FloatToStr(Pedido.desconto_comiss));
   Auditoria.AdicionaCampoIncluido('CANCELADO'        , Pedido.cancelado                  );
   Auditoria.AdicionaCampoIncluido('PESO'             , FloatToStr(Pedido.PESO)           );
   Auditoria.AdicionaCampoIncluido('VOLUMES'           , IntToStr(Pedido.volumes)           );
end;

procedure TRepositorioPedido.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TPedido(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioPedido.SetParametros(Objeto: TObject);
var
  Pedido :TPedido;
begin
   Pedido := (Objeto as TPedido);

   if (Pedido.Codigo > 0) then  inherited SetParametro('codigo', Pedido.Codigo)
   else                         inherited LimpaParametro('codigo');

   inherited SetParametro('NUMPEDIDO'      , Pedido.numpedido);

   if Pedido.cod_tab_preco > 0 then
     inherited SetParametro('cod_tab_preco'  , Pedido.cod_tab_preco);
   if Pedido.cod_forma_pag > 0 then
     inherited SetParametro('COD_FORMA_PAG'  , Pedido.cod_forma_pag);
   if Pedido.cod_filial > 0 then
     inherited SetParametro('COD_FILIAL'     , Pedido.cod_filial);
   if Pedido.cod_filial_digi > 0 then
     inherited SetParametro('COD_FILIAL_DIGI', Pedido.cod_filial_digi);
   if Pedido.cod_cliente > 0 then
     inherited SetParametro('COD_CLIENTE'    , Pedido.cod_cliente);
   if Pedido.cod_transp > 0 then
     inherited SetParametro('COD_TRANSP'     , Pedido.cod_transp);
   if Pedido.cod_repres > 0 then
     inherited SetParametro('COD_REPRES'     , Pedido.cod_repres);

   inherited SetParametro('DT_cadastro'      , Pedido.dt_cadastro);
   inherited SetParametro('DT_representante' , Pedido.dt_representante);
   inherited SetParametro('DT_RECEBIMENTO'   , Pedido.dt_recebimento);
   inherited SetParametro('DT_ENTREGA'       , Pedido.dt_entrega);
   inherited SetParametro('DT_LIMITE_ENTREGA', Pedido.dt_limite_entrega);
   inherited SetParametro('DESCONTO'         , Pedido.desconto);
   inherited SetParametro('ACRESCIMO'        , Pedido.acrescimo);
   inherited SetParametro('VALOR_FRETE'      , Pedido.valor_frete);
   inherited SetParametro('COMISSAO'         , Pedido.comissao);
   inherited SetParametro('VALOR_TOTAL'      , Pedido.valor_total);
   inherited SetParametro('APROVACAO'        , Pedido.aprovacao);
   inherited SetParametro('APROVADO_POR'     , Pedido.aprovado_por);
   inherited SetParametro('DT_APROVACAO'     , Pedido.dt_aprovacao);
   inherited SetParametro('OBSERVACAO'       , Pedido.observacao);
   inherited SetParametro('TIPO_FRETE'       , Pedido.tipo_frete);
   inherited SetParametro('DESCONTO_FPGTO'   , Pedido.desconto_fpgto);
   inherited SetParametro('DESPACHADO'       , Pedido.despachado);
   inherited SetParametro('DT_DESPACHO'      , Pedido.dt_despacho);
   inherited SetParametro('DESCONTO_ITENS'   , Pedido.desconto_itens);
   inherited SetParametro('COD_PEDIDO_MATRIZ', Pedido.cod_pedido_matriz);
   inherited SetParametro('DESCONTO_COMISS'  , Pedido.desconto_comiss);
   inherited SetParametro('CANCELADO'        , Pedido.cancelado);
   inherited SetParametro('PESO'             , Pedido.peso);
   inherited SetParametro('VOLUMES'           , Pedido.volumes);
end;

function TRepositorioPedido.SQLGet: String;
begin
  result := 'select * from PedidoS where codigo = :ncod';
end;

function TRepositorioPedido.SQLGetAll: String;
begin
  result := 'select * from PedidoS';
end;

function TRepositorioPedido.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), self.GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioPedido.SQLRemover: String;
begin
   result := ' delete from PedidoS where codigo = :codigo ';
end;

function TRepositorioPedido.SQLSalvar: String;
begin
  result := 'UPDATE OR INSERT INTO PEDIDOS (CODIGO, NUMPEDIDO, COD_TAB_PRECO, COD_FORMA_PAG, COD_FILIAL, COD_FILIAL_DIGI,                '+
            'COD_CLIENTE, COD_TRANSP, COD_REPRES, DT_cadastro, DT_representante, DT_RECEBIMENTO, DT_ENTREGA, DT_LIMITE_ENTREGA,          '+
            'DESCONTO, ACRESCIMO, VALOR_FRETE, COMISSAO, VALOR_TOTAL, APROVACAO, APROVADO_POR, DT_APROVACAO, OBSERVACAO, TIPO_FRETE, DESCONTO_FPGTO,  '+
            'DESPACHADO, DT_DESPACHO, DESCONTO_ITENS, COD_PEDIDO_MATRIZ, DESCONTO_COMISS, CANCELADO, PESO, VOLUMES)                       '+
            'VALUES (:CODIGO, :NUMPEDIDO, :COD_TAB_PRECO, :COD_FORMA_PAG, :COD_FILIAL, :COD_FILIAL_DIGI, :COD_CLIENTE, :COD_TRANSP,      '+
            ':COD_REPRES, :DT_cadastro, :DT_representante, :DT_RECEBIMENTO, :DT_ENTREGA, :DT_LIMITE_ENTREGA, :DESCONTO, :ACRESCIMO, :VALOR_FRETE,     '+
            ':COMISSAO, :VALOR_TOTAL, :APROVACAO, :APROVADO_POR, :DT_APROVACAO, :OBSERVACAO, :TIPO_FRETE, :DESCONTO_FPGTO, :DESPACHADO,  '+
            ':DT_DESPACHO, :DESCONTO_ITENS, :COD_PEDIDO_MATRIZ, :DESCONTO_COMISS, :CANCELADO, :PESO, :VOLUMES)                            ';
end;

end.








