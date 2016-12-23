unit RepositorioParcela;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioParcela = class(TRepositorio)

  protected
    function Get             (Dataset :TDataSet) :TObject; overload; override;
    function GetNomeDaTabela                     :String;            override;
    function GetIdentificador(Objeto :TObject)   :Variant;           override;
    function GetRepositorio                     :TRepositorio;       override;

  protected
    function SQLGet                      :String;            override;
    function SQLSalvar                   :String;            override;
    function CondicaoSQLGetAll           :String;            override;
    function SQLGetAll                   :String;            override;
    function SQLRemover                  :String;            override;
    function SQLGetExiste(campo: String): String;            override;

  protected
    function IsInsercao(Objeto :TObject) :Boolean;           override;
  protected
    procedure SetParametros   (Objeto :TObject                        ); override;
    procedure SetIdentificador(Objeto :TObject; Identificador :Variant); override;

  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
end;

implementation

uses SysUtils, Parcela, StrUtils;

{ TRepositorioParcela }

function TRepositorioParcela.CondicaoSQLGetAll: String;
begin
  result := ' WHERE CODIGO_CONTA = '+FIdentificador;  
end;

function TRepositorioParcela.Get(Dataset: TDataSet): TObject;
var
  Parcela :TParcela;
begin
   Parcela:= TParcela.Create;
   Parcela.codigo        := self.FQuery.FieldByName('codigo').AsInteger;
   Parcela.codigo_conta  := self.FQuery.FieldByName('codigo_conta').AsInteger;
   Parcela.num_parcela   := self.FQuery.FieldByName('num_parcela').AsInteger;
   Parcela.dt_vencimento := self.FQuery.FieldByName('dt_vencimento').AsDateTime;
   Parcela.dt_pagamento  := self.FQuery.FieldByName('dt_pagamento').AsDateTime;
   Parcela.status        := self.FQuery.FieldByName('status').AsString;
   Parcela.desc_status   := self.FQuery.FieldByName('desc_status').AsString;
   Parcela.valor         := self.FQuery.FieldByName('valor').AsFloat;
   Parcela.valor_pago    := self.FQuery.FieldByName('valor_pago').AsFloat;
   Parcela.codigo_pedido := self.FQuery.FieldByName('codigo_pedido').AsInteger;

   result := Parcela;
end;

function TRepositorioParcela.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TParcela(Objeto).Codigo;
end;

function TRepositorioParcela.GetNomeDaTabela: String;
begin
  result := 'PARCELAS';
end;

function TRepositorioParcela.GetRepositorio: TRepositorio;
begin
  result := TRepositorioParcela.Create;
end;

function TRepositorioParcela.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TParcela(Objeto).Codigo <= 0);
end;

procedure TRepositorioParcela.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  ParcelaAntigo :TParcela;
  ParcelaNovo :TParcela;
begin
   ParcelaAntigo := (AntigoObjeto as TParcela);
   ParcelaNovo   := (Objeto       as TParcela);

   if (ParcelaAntigo.codigo_conta <> ParcelaNovo.codigo_conta) then
     Auditoria.AdicionaCampoAlterado('codigo_conta', IntToStr(ParcelaAntigo.codigo_conta), IntToStr(ParcelaNovo.codigo_conta));

   if (ParcelaAntigo.num_parcela <> ParcelaNovo.num_parcela) then
     Auditoria.AdicionaCampoAlterado('num_parcela', IntToStr(ParcelaAntigo.num_parcela), IntToStr(ParcelaNovo.num_parcela));

   if (ParcelaAntigo.dt_vencimento <> ParcelaNovo.dt_vencimento) then
     Auditoria.AdicionaCampoAlterado('dt_vencimento', DateTimeToStr(ParcelaAntigo.dt_vencimento), DateTimeToStr(ParcelaNovo.dt_vencimento));

   if (ParcelaAntigo.dt_pagamento <> ParcelaNovo.dt_pagamento) then
     Auditoria.AdicionaCampoAlterado('dt_pagamento', DateTimeToStr(ParcelaAntigo.dt_pagamento), DateTimeToStr(ParcelaNovo.dt_pagamento));

   if (ParcelaAntigo.status <> ParcelaNovo.status) then
     Auditoria.AdicionaCampoAlterado('status', ParcelaAntigo.status, ParcelaNovo.status);

   if (ParcelaAntigo.desc_status <> ParcelaNovo.desc_status) then
     Auditoria.AdicionaCampoAlterado('desc_status', ParcelaAntigo.desc_status, ParcelaNovo.desc_status);

   if (ParcelaAntigo.valor <> ParcelaNovo.valor) then
     Auditoria.AdicionaCampoAlterado('valor', FloatToStr(ParcelaAntigo.valor), FloatToStr(ParcelaNovo.valor));

   if (ParcelaAntigo.valor_pago <> ParcelaNovo.valor_pago) then
     Auditoria.AdicionaCampoAlterado('valor_pago', FloatToStr(ParcelaAntigo.valor_pago), FloatToStr(ParcelaNovo.valor_pago));

    if (ParcelaAntigo.codigo_pedido <> ParcelaNovo.codigo_pedido) then
     Auditoria.AdicionaCampoAlterado('codigo_pedido', IntToStr(ParcelaAntigo.codigo_pedido), IntToStr(ParcelaNovo.codigo_pedido));
end;

procedure TRepositorioParcela.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  Parcela :TParcela;
begin
  Parcela := (Objeto as TParcela);
  Auditoria.AdicionaCampoExcluido('codigo'       , IntToStr(Parcela.codigo));
  Auditoria.AdicionaCampoExcluido('codigo_conta' , IntToStr(Parcela.codigo_conta));
  Auditoria.AdicionaCampoExcluido('num_parcela'  , IntToStr(Parcela.num_parcela));
  Auditoria.AdicionaCampoExcluido('dt_vencimento', DateTimeToStr(Parcela.dt_vencimento));
  Auditoria.AdicionaCampoExcluido('dt_pagamento' , DateTimeToStr(Parcela.dt_pagamento));
  Auditoria.AdicionaCampoExcluido('status'       , Parcela.status);
  Auditoria.AdicionaCampoExcluido('desc_status'  , Parcela.desc_status);
  Auditoria.AdicionaCampoExcluido('valor'        , FloatToStr(Parcela.valor));
  Auditoria.AdicionaCampoExcluido('valor_pago'   , FloatToStr(Parcela.valor_pago));
  Auditoria.AdicionaCampoExcluido('codigo_pedido' , IntToStr(Parcela.codigo_pedido));
end;

procedure TRepositorioParcela.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  Parcela :TParcela;
begin
  Parcela := (Objeto as TParcela);
  Auditoria.AdicionaCampoIncluido('codigo'       ,    IntToStr(Parcela.codigo));
  Auditoria.AdicionaCampoIncluido('codigo_conta' ,    IntToStr(Parcela.codigo_conta));
  Auditoria.AdicionaCampoIncluido('num_parcela'  ,    IntToStr(Parcela.num_parcela));
  Auditoria.AdicionaCampoIncluido('dt_vencimento',    DateTimeToStr(Parcela.dt_vencimento));
  Auditoria.AdicionaCampoIncluido('dt_pagamento' ,    DateTimeToStr(Parcela.dt_pagamento));
  Auditoria.AdicionaCampoIncluido('status'       ,    Parcela.status);
  Auditoria.AdicionaCampoIncluido('desc_status'  ,    Parcela.desc_status);
  Auditoria.AdicionaCampoIncluido('valor'        ,    FloatToStr(Parcela.valor));
  Auditoria.AdicionaCampoIncluido('valor_pago'   ,    FloatToStr(Parcela.valor_pago));
  Auditoria.AdicionaCampoIncluido('codigo_pedido' , IntToStr(Parcela.codigo_pedido));
end;

procedure TRepositorioParcela.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TParcela(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioParcela.SetParametros(Objeto: TObject);
var
  Parcela :TParcela;
begin
  Parcela := (Objeto as TParcela);

  self.FQuery.ParamByName('codigo').AsInteger        := Parcela.codigo;

  if Parcela.codigo_conta > 0 then
    self.FQuery.ParamByName('codigo_conta').AsInteger  := Parcela.codigo_conta;

  self.FQuery.ParamByName('num_parcela').AsInteger   := Parcela.num_parcela;
  self.FQuery.ParamByName('dt_vencimento').AsDateTime := Parcela.dt_vencimento;
  self.FQuery.ParamByName('dt_pagamento').AsDateTime  := Parcela.dt_pagamento;
  self.FQuery.ParamByName('status').AsString        := Parcela.status;
  self.FQuery.ParamByName('desc_status').AsString   := Parcela.desc_status;
  self.FQuery.ParamByName('valor').AsFloat         := Parcela.valor;
  self.FQuery.ParamByName('valor_pago').AsFloat    := Parcela.valor_pago;

  if Parcela.codigo_pedido > 0 then
    self.FQuery.ParamByName('codigo_pedido').AsInteger  := Parcela.codigo_pedido;

end;

function TRepositorioParcela.SQLGet: String;
begin
  result := 'select * from PARCELAS where codigo = :ncod';
end;

function TRepositorioParcela.SQLGetAll: String;
begin
  result := 'select * from PARCELAS '+ IfThen(FIdentificador = '','', CondicaoSQLGetAll);
end;

function TRepositorioParcela.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from PARCELAS where '+ campo +' = :ncampo';
end;

function TRepositorioParcela.SQLRemover: String;
begin
  result := ' delete from PARCELAS where codigo = :codigo ';
end;

function TRepositorioParcela.SQLSalvar: String;
begin
  result := 'update or insert into PARCELAS (CODIGO ,CODIGO_CONTA ,NUM_PARCELA ,DT_VENCIMENTO ,DT_PAGAMENTO ,STATUS ,DESC_STATUS ,VALOR, VALOR_PAGO, CODIGO_PEDIDO) '+
           '                      values ( :CODIGO , :CODIGO_CONTA , :NUM_PARCELA , :DT_VENCIMENTO , :DT_PAGAMENTO , :STATUS , :DESC_STATUS , :VALOR, :VALOR_PAGO, :CODIGO_PEDIDO) ';
end;

end.

