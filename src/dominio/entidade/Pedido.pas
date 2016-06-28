unit Pedido;

interface

uses
  SysUtils,
  Contnrs,
  Repositorio,
  FormaPagamento,
  Pessoa, Empresa,
  MetodoDelegadoSomarCampoEspecificoReal,
  MetodoDelegadoSomarCampoEspecificoInteger,
  Item, ConferenciaPedido;


type
  TPedido = class

  private
    FCriouListaItens :Boolean;
    Fcancelado: String;
    procedure Setcancelado(const Value: String);
    function GetValor_total_bruto: Real;

  private
    Fnumpedido: String;
    Fcod_cliente: Integer;
    Fcod_filial_digi: Integer;
    Fcod_tab_preco: Integer;
    Fcod_filial: Integer;
    Fcod_forma_pag: Integer;
    Ftipo_frete: Integer;
    Fcod_transp: Integer;
    Fcod_repres: Integer;
    FCodigo: Integer;
    Facrescimo: Real;
    Fdesconto: Real;
    Fvalor_total: Real;
    Fvalor_total_bruto: Real;
    Fcomissao: Real;
    Faprovacao: String;
    Fobservacao: String;
    Faprovado_por: String;
    Fdt_cadastro: TDateTime;
    Fdt_recebimento: TDateTime;
    Fdt_representante: TDateTime;
    FItens: TObjectList;
    FItem: TItem;
    Fdt_limite_entrega: TDateTime;
    Fdt_entrega: TDateTime;
    Fdt_aprovacao: TDateTime;
    FFormaPagamento :TFormaPagamento;
    FTransportadora :TPessoa;
    Fdesconto_fpgto: Real;
    Fdespachado: String;
    Fdt_despacho: TDateTime;
    FRepresentante :TPessoa;
    FCliente :TPessoa;
    FConferencia :TConferenciaPedido;
    Fdesconto_itens: Real;
    Fcod_pedido_matriz: Integer;
    Fdesconto_comiss: Real;
    FEmpresa :TEmpresa;

    procedure Setacrescimo(const Value: Real);
    procedure Setaprovacao(const Value: String);
    procedure Setaprovado_por(const Value: String);
    procedure Setcod_cliente(const Value: Integer);
    procedure Setcod_filial(const Value: Integer);
    procedure Setcod_filial_digi(const Value: Integer);
    procedure Setcod_forma_pag(const Value: Integer);
    procedure Setcod_repres(const Value: Integer);
    procedure Setcod_tab_preco(const Value: Integer);
    procedure Setcod_transp(const Value: Integer);
    procedure SetCodigo(const Value: Integer);
    procedure Setcomissao(const Value: Real);
    procedure Setdesconto(const Value: Real);
    procedure Setdt_representante(const Value: TDateTime);
    procedure Setdt_cadastro(const Value: TDateTime);
    procedure Setdt_recebimento(const Value: TDateTime);
    procedure Setnumpedido(const Value: String);
    procedure Setobservacao(const Value: String);
    procedure Settipo_frete(const Value: Integer);
    procedure Setvalor_total(const Value: Real);
    procedure SetItens(const Value: TObjectList);
    procedure SetItem(const Value: TItem);
    procedure Setdt_entrega(const Value: TDateTime);
    procedure Setdt_limite_entrega(const Value: TDateTime);
    procedure Setdt_aprovacao(const Value: TDateTime);
    procedure Setdesconto_fpgto(const Value: Real);
    procedure Setdespachado(const Value: String);
    procedure Setdt_despacho(const Value: TDateTime);
    procedure Setdesconto_itens(const Value: Real);
    procedure Setcod_pedido_matriz(const Value: Integer);
    procedure Setdesconto_comiss(const Value: Real);

  private
    function GetItens             :TObjectList;
    function GetFormaPagamento    :TFormaPagamento;
    function GetTransportadora    :TPessoa;
    function GetCliente: TPessoa;
    function GetRepresentante: TPessoa;
    function GetConferencia: TConferenciaPedido;
    function GetEmpresa: TEmpresa;

    function GetPesoBrutoTotal    :Real;
    function GetPesoLiquidoTotal  :Real;
    function GetTotal_desconto    :Real;

    function SomarCampoEspecificoReal   (MetodoQueSoma :TMetodoDelegadoSomarCampoEspecificoReal)    :Real;
    function SomarCampoEspecificoInteger(MetodoQueSoma :TMetodoDelegadoSomarCampoEspecificoInteger) :Integer;
    function SomarPesoBrutoItem         (ValorAtual :Real; Objeto :TObject)                         :Real;
    function SomarPesoLiquidoItem       (ValorAtual :Real; Objeto :TObject)                         :Real;
  private
    repPedido, repItem :TRepositorio;
    FPeso: Real;
    FVolumes: Integer;

    procedure commit;
    procedure rollBack;

  public
    property Codigo            :Integer      read FCodigo            write SetCodigo;
    property numpedido         :String       read Fnumpedido         write Setnumpedido;
    property cod_tab_preco     :Integer      read Fcod_tab_preco     write Setcod_tab_preco;
    property cod_forma_pag     :Integer      read Fcod_forma_pag     write Setcod_forma_pag;
    property cod_filial        :Integer      read Fcod_filial        write Setcod_filial;
    property cod_filial_digi   :Integer      read Fcod_filial_digi   write Setcod_filial_digi;
    property cod_cliente       :Integer      read Fcod_cliente       write Setcod_cliente;
    property cod_transp        :Integer      read Fcod_transp        write Setcod_transp;
    property cod_repres        :Integer      read Fcod_repres        write Setcod_repres;
    property dt_cadastro       :TDateTime    read Fdt_cadastro       write Setdt_cadastro;
    property dt_representante  :TDateTime    read Fdt_representante  write Setdt_representante;
    property dt_recebimento    :TDateTime    read Fdt_recebimento    write Setdt_recebimento;
    property dt_entrega        :TDateTime    read Fdt_entrega        write Setdt_entrega;
    property dt_limite_entrega :TDateTime    read Fdt_limite_entrega write Setdt_limite_entrega;
    property desconto          :Real         read Fdesconto          write Setdesconto;
    property acrescimo         :Real         read Facrescimo         write Setacrescimo;
    property comissao          :Real         read Fcomissao          write Setcomissao;
    property valor_total       :Real         read Fvalor_total       write Setvalor_total;
    property valor_total_bruto :Real         read GetValor_total_bruto;
    property aprovacao         :String       read Faprovacao         write Setaprovacao;
    property aprovado_por      :String       read Faprovado_por      write Setaprovado_por;
    property dt_aprovacao      :TDateTime    read Fdt_aprovacao      write Setdt_aprovacao;
    property observacao        :String       read Fobservacao        write Setobservacao;
    property tipo_frete        :Integer      read Ftipo_frete        write Settipo_frete;
    property desconto_fpgto    :Real         read Fdesconto_fpgto    write Setdesconto_fpgto;
    property total_desconto    :Real         read GetTotal_desconto;
    property Itens             :TObjectList  read GetItens           write SetItens;
    property Item              :TItem        read FItem              write SetItem;
    property despachado        :String       read Fdespachado        write Setdespachado;
    property dt_despacho       :TDateTime    read Fdt_despacho       write Setdt_despacho;
    property desconto_itens    :Real         read Fdesconto_itens    write Setdesconto_itens;
    property cod_pedido_matriz :Integer      read Fcod_pedido_matriz write Setcod_pedido_matriz;
    property desconto_comiss   :Real         read Fdesconto_comiss   write Setdesconto_comiss;
    property cancelado         :String       read Fcancelado write Setcancelado;
    property peso              :Real         read FPeso              write FPeso;
    property volumes           :Integer      read FVolumes           write FVolumes;

  public
    property FormaPagamento   :TFormaPagamento    read GetFormaPagamento;
    property Transportadora   :TPessoa            read GetTransportadora;
    property Cliente          :TPessoa            read GetCliente;
    Property Representante    :TPessoa            read GetRepresentante;
    property Empresa          :TEmpresa           read GetEmpresa;
    property PesoBrutoTotal   :Real               read GetPesoBrutoTotal;
    property PesoLiquidoTotal :Real               read GetPesoLiquidoTotal;
    property Conferencia      :TConferenciaPedido read GetConferencia;

  public
    constructor Create;
    destructor  Destroy; override;

  public
    procedure AdicionarItem(I :TItem);

  public
    function salvar: Boolean;
    function SalvarSemDeletar :Boolean;
    function Recebido :Boolean;
  end;

implementation

uses
  EspecificacaoItensDoPedido,
  FabricaRepositorio,
  Classes,
  uModulo,
  ExcecaoParametroInvalido,
  Especificacao, Funcoes,
  EspecificacaoConferenciaPorCodigoPedido;

{ TPedido }

procedure TPedido.Setacrescimo(const Value: Real);
begin
  Facrescimo := Value;
end;

procedure TPedido.Setaprovacao(const Value: String);
begin
  Faprovacao := Value;
end;

procedure TPedido.Setaprovado_por(const Value: String);
begin
  Faprovado_por := Value;
end;

procedure TPedido.Setcod_cliente(const Value: Integer);
begin
  Fcod_cliente := Value;
end;

procedure TPedido.Setcod_filial(const Value: Integer);
begin
  Fcod_filial := Value;
end;

procedure TPedido.Setcod_filial_digi(const Value: Integer);
begin
  Fcod_filial_digi := Value;
end;

procedure TPedido.Setcod_forma_pag(const Value: Integer);
begin
  Fcod_forma_pag := Value;
end;

procedure TPedido.Setcod_repres(const Value: Integer);
begin
  Fcod_repres := Value;
end;

procedure TPedido.Setcod_tab_preco(const Value: Integer);
begin
  Fcod_tab_preco := Value;
end;

procedure TPedido.Setcod_transp(const Value: Integer);
begin
  Fcod_transp := Value;
end;

procedure TPedido.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPedido.Setcomissao(const Value: Real);
begin
  Fcomissao := Value;
end;

procedure TPedido.Setdesconto(const Value: Real);
begin
  Fdesconto := Value;
end;

procedure TPedido.Setdt_representante(const Value: TDateTime);
begin
  Fdt_representante := Value;
end;

procedure TPedido.Setdt_cadastro(const Value: TDateTime);
begin
  Fdt_cadastro := Value;
end;

procedure TPedido.Setdt_recebimento(const Value: TDateTime);
begin
  Fdt_recebimento := Value;
end;

procedure TPedido.Setnumpedido(const Value: String);
begin
  Fnumpedido := Value;
end;

procedure TPedido.Setobservacao(const Value: String);
begin
  Fobservacao := Value;
end;

procedure TPedido.Settipo_frete(const Value: Integer);
begin
  Ftipo_frete := Value;
end;

procedure TPedido.Setvalor_total(const Value: Real);
begin
  Fvalor_total := Value;
end;

function TPedido.salvar: Boolean;
var
    i :integer;
begin
 try
   try
      Result := true;

      repPedido     := TFabricaRepositorio.GetRepositorio(Self.ClassName);

      if repPedido.Salvar(self) then begin

        repItem  := TFabricaRepositorio.GetRepositorio(TItem.ClassName);

        for i:=0 to Itens.Count - 1 do begin

          if TItem(Itens[i]).qtd_total = 0 then begin
            repItem.Remover(TItem(Itens[i]));
            continue;
          end;

          if not repItem.Salvar(TItem(Itens[i])) then begin
            rollBack;
            Result := false;
            exit;
          end;

        end;

      end;

   except
   on e : Exception do
     begin
       Result := false;
       raise Exception.Create(e.Message);
     end;
   end;

 finally
   FreeAndNil(repPedido);
   FreeAndNil(repItem);
//   FreeAndNil(FItem);
 end;
end;

constructor TPedido.create;
begin
  inherited create;

  self.FCriouListaItens := false;
  self.FItens           := nil;
  self.FFormaPagamento  := nil;
  self.FTransportadora  := nil;

//  if FItens = nil then
//    FItens := TObjectList.Create;
end;

procedure TPedido.SetItens(const Value: TObjectList);
begin
  FItens := Value;
end;

procedure TPedido.SetItem(const Value: TItem);
begin
  FItem := Value;
end;

procedure TPedido.rollBack;
begin
  repPedido.ExecutaRollbackNaTransacao;
  repItem.ExecutaRollbackNaTransacao;
  dm.conexao.Rollback; //desfaz generator
end;

procedure TPedido.commit;
begin
  dm.qryGenerica.Connection.Commit;
  repPedido.ExecutaCommitNaTransacao;
  repItem.ExecutaCommitNaTransacao;
end;

procedure TPedido.Setdt_entrega(const Value: TDateTime);
begin
  Fdt_entrega := Value;
end;

procedure TPedido.Setdt_limite_entrega(const Value: TDateTime);
begin
  Fdt_limite_entrega := Value;
end;

procedure TPedido.Setdt_aprovacao(const Value: TDateTime);
begin
  Fdt_aprovacao := Value;
end;

destructor TPedido.Destroy;
begin
  if self.FCriouListaItens and Assigned(self.FItens) then
    FreeAndNil(self.FItens);

  if Assigned(self.FTransportadora) then
    FreeAndNil(self.FTransportadora);

  if Assigned(self.FFormaPagamento) then
    FreeAndNil(self.FFormaPagamento);
    
  inherited;
end;

function TPedido.GetItens: TObjectList;
var
  Repositorio   :TRepositorio;
  Especificacao :TEspecificacaoItensDoPedido;
begin
   Repositorio    := nil;
   Especificacao  := nil;
   
   try
      if not Assigned(self.FItens) then begin
        Especificacao         := TEspecificacaoItensDoPedido.Create(self);
        Repositorio           := TFabricaRepositorio.GetRepositorio(TItem.ClassName);
        self.FItens           := Repositorio.GetListaPorEspecificacao(Especificacao, IntToStr(self.Codigo));
        self.FCriouListaItens := true;
      end;

      result := self.FItens;
   finally
     FreeAndNil(Especificacao);
     FreeAndNil(Repositorio);
   end;
end;

procedure TPedido.AdicionarItem(I: TItem);
begin
   if not Assigned(self.FItens) then begin
     self.FItens           := TObjectList.Create;
     self.FCriouListaItens := true;
   end;

   self.FItens.Add(I);
end;

function TPedido.GetFormaPagamento: TFormaPagamento;
var
  Repositorio :TRepositorio;
begin
   Repositorio := nil;

   try
     if not Assigned(self.FFormaPagamento) then begin

       Repositorio := TFabricaRepositorio.GetRepositorio(TFormaPagamento.ClassName);
       self.FFormaPagamento := (Repositorio.Get(self.Fcod_forma_pag) as TFormaPagamento);
     end;

     result := self.FFormaPagamento;
   finally
     FreeAndNil(Repositorio);
   end;
end;

function TPedido.GetTransportadora: TPessoa;
var
  Repositorio :TRepositorio;
begin
   Repositorio := nil;

   try
     if not Assigned(self.FTransportadora) then begin
         Repositorio          := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
         self.FTransportadora := (Repositorio.Get(self.Fcod_transp) as TPessoa);
     end;

     result := self.FTransportadora; 
   finally
     FreeAndNil(Repositorio);
   end;
end;

function TPedido.SomarCampoEspecificoInteger(MetodoQueSoma: TMetodoDelegadoSomarCampoEspecificoInteger) :Integer;
var
  nX :Integer;
begin
   if not Assigned(MetodoQueSoma) then
    raise TExcecaoParametroInvalido.Create(self.ClassName,
                                           'SomarCampoEspecificoInteger(MetodoQueSoma: TMetodoDelegadoSomarCampoEspecificoInteger)',
                                           'MetodoQueSoma');

   result := 0;

   try
     for nX := 0 to (self.Itens.Count-1) do begin
        result := MetodoQueSoma(result, TItem(self.FItens.Items[nX]));
     end;
   except
     on E :EAccessViolation do
      raise EAccessViolation.Create('Erro em '+self.ClassName+' SomarCampoEspecificoInteger(MetodoQueSoma: TMetodoDelegadoSomarCampoEspecificoInteger) :Integer. '+#13+
                                    'Não há nenhum item adicionado pedido!');
   end;
end;

function TPedido.SomarCampoEspecificoReal(
  MetodoQueSoma: TMetodoDelegadoSomarCampoEspecificoReal) :Real;
var
  nX :Integer;
begin
   if not Assigned(MetodoQueSoma) then
    raise TExcecaoParametroInvalido.Create(self.ClassName,
                                           'SomarCampoEspecificoReal(MetodoQueSoma: TMetodoDelegadoSomarCampoEspecificoReal)',
                                           'MetodoQueSoma');

   result := 0;

   try
     for nX := 0 to (self.Itens.Count-1) do begin
        result := MetodoQueSoma(result, TItem(self.FItens.Items[nX]));
     end;
   except
     on E :EAccessViolation do
      raise EAccessViolation.Create('Erro em '+self.ClassName+' SomarCampoEspecificoReal(MetodoQueSoma: TMetodoDelegadoSomarCampoEspecificoReal) :Real. '+#13+
                                    'Não há nenhum item adicionado pedido!');
   end;
end;

function TPedido.SomarPesoBrutoItem(ValorAtual :Real; Objeto: TObject): Real;
var
  I :TItem;
begin
   try
     I := (Objeto as TItem);
   except
     on E: EInvalidCast do
       raise TExcecaoParametroInvalido.Create(self.ClassName, 'SomarPesoBrutoItem(ValorAtual :Real; Objeto: TObject)', 'Objeto');
   end;

   result := (ValorAtual + I.PesoBrutoTotal);
end;

function TPedido.SomarPesoLiquidoItem(ValorAtual :Real; Objeto: TObject): Real;
var
  I :TItem;
begin
   try
     I := (Objeto as TItem);
   except
     on E: EInvalidCast do
       raise TExcecaoParametroInvalido.Create(self.ClassName, 'SomarPesoLiquidoItem(ValorAtual :Real; Objeto: TObject)', 'Objeto');
   end;
   
   result := (ValorAtual + I.PesoLiquidoTotal);
end;

function TPedido.GetPesoBrutoTotal: Real;
begin
   result := self.SomarCampoEspecificoReal(self.SomarPesoBrutoItem);
end;

function TPedido.GetPesoLiquidoTotal: Real;
begin
   result := self.SomarCampoEspecificoReal(self.SomarPesoLiquidoItem);
end;

procedure TPedido.Setdesconto_fpgto(const Value: Real);
begin
  Fdesconto_fpgto := Value;
end;

function TPedido.GetTotal_desconto: Real;
begin
  result := Fdesconto_fpgto + Fdesconto;
end;

procedure TPedido.Setdespachado(const Value: String);
begin
  Fdespachado := Value;
end;

procedure TPedido.Setdt_despacho(const Value: TDateTime);
begin
  Fdt_despacho := Value;
end;

procedure TPedido.Setdesconto_itens(const Value: Real);
begin
  Fdesconto_itens := Value;
end;

function TPedido.GetCliente: TPessoa;
var
  Repositorio :TRepositorio;
begin
   Repositorio := nil;

   try
     if not Assigned(self.FCliente) then begin
         Repositorio      := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
         self.FCliente    := (Repositorio.Get(self.Fcod_cliente) as TPessoa);
     end;

     result := self.FCliente;
   finally
     FreeAndNil(Repositorio);
   end;
end;

function TPedido.GetRepresentante: TPessoa;
var
  Repositorio :TRepositorio;
begin
   Repositorio := nil;

   try
     if not Assigned(self.FRepresentante) then begin
         Repositorio          := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
         self.FRepresentante  := (Repositorio.Get(self.Fcod_repres) as TPessoa);
     end;

     result := self.FRepresentante;
   finally
     FreeAndNil(Repositorio);
   end;
end;

procedure TPedido.Setcod_pedido_matriz(const Value: Integer);
begin
  Fcod_pedido_matriz := Value;
end;

function TPedido.GetConferencia: TConferenciaPedido;
var
  Repositorio :TRepositorio;
  Especificacao :TEspecificacao;
begin
   Repositorio := nil;
   Especificacao:= nil;
   try
     if not Assigned(self.FConferencia) then begin
         Repositorio          := TFabricaRepositorio.GetRepositorio(TConferenciaPedido.ClassName);
         Especificacao        := TEspecificacaoConferenciaPorCodigoPedido.Create( self.Codigo );
         self.FConferencia    := (Repositorio.GetPorEspecificacao(Especificacao) as TConferenciaPedido);
     end;

     result := self.FConferencia;
   finally
     FreeAndNil(Repositorio);
     FreeAndNil(Especificacao);
   end;
end;

function TPedido.GetEmpresa: TEmpresa;
var
  Repositorio :TRepositorio;
begin
   Repositorio := nil;

   try
     if not Assigned(self.FEmpresa) then begin
         Repositorio    := TFabricaRepositorio.GetRepositorio(TEmpresa.ClassName);
         self.FEmpresa  := (Repositorio.Get(self.Fcod_filial) as TEmpresa);
     end;

     result := self.FEmpresa;
   finally
     FreeAndNil(Repositorio);
   end;
end;

procedure TPedido.Setdesconto_comiss(const Value: Real);
begin
  Fdesconto_comiss := Value;
end;

procedure TPedido.Setcancelado(const Value: String);
begin
  Fcancelado := Value;
end;

function TPedido.SalvarSemDeletar: Boolean;
var
    i :integer;
begin
 try
   try
      Result := true;

      repPedido     := TFabricaRepositorio.GetRepositorio(Self.ClassName);

      if repPedido.Salvar(self) then begin

        repItem  := TFabricaRepositorio.GetRepositorio(TItem.ClassName);

        for i:=0 to Itens.Count - 1 do begin

{          if TItem(Itens[i]).qtd_total = 0 then begin
            repItem.Remover(TItem(Itens[i]));
            continue;
          end;
}

          if not repItem.Salvar(TItem(Itens[i])) then begin
            rollBack;
            Result := false;
            exit;
          end;

        end;

      end;

   except
   on e : Exception do
     begin
       Result := false;
       raise Exception.Create(e.Message);
     end;
   end;

 finally
   FreeAndNil(repPedido);
   FreeAndNil(repItem);
//   FreeAndNil(FItem);
 end;

end;

function TPedido.GetValor_total_bruto: Real;
begin
  result := (Fdesconto + Fdesconto_fpgto + Fdesconto_itens + Fvalor_total) - Facrescimo;
end;

function TPedido.Recebido: Boolean;
begin
  result := (StrToIntDef(Campo_por_campo('MOVIMENTOS','CODIGO','CODIGO_PEDIDO', intToStr(self.FCodigo)) ,0) > 0);
end;

end.
