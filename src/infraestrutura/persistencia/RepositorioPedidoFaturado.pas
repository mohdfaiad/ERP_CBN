unit RepositorioPedidoFaturado;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioPedidoFaturado = class(TRepositorio)
  
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

  protected
    function IsInsercao(Objeto :TObject) :Boolean;           override;
    function IsComponente                :Boolean;           override;

  protected
    procedure SetParametros   (Objeto :TObject                        ); override;

  //==============================================================================
  // Auditoria
  //==============================================================================
  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
end;

implementation

uses
  PedidoFaturado,
  SysUtils;

{ TRepositorioPedidoFaturado }

function TRepositorioPedidoFaturado.Get(Dataset: TDataSet): TObject;
begin
   result := TPedidoFaturado.Create( Dataset.FieldByName('CODIGO_NOTA_FISCAL').AsInteger,
                                     Dataset.FieldByName('CODIGO_PEDIDO').AsInteger,
                                     Dataset.FieldByName('MOTIVO').AsString);
end;

function TRepositorioPedidoFaturado.GetIdentificador(
  Objeto: TObject): Variant;
begin
   result := TPedidoFaturado(Objeto).CodigoNotaFiscal;
end;

function TRepositorioPedidoFaturado.GetNomeDaTabela: String;
begin
   result := 'pedidos_faturados';
end;

function TRepositorioPedidoFaturado.GetRepositorio: TRepositorio;
begin
   result := TRepositorioPedidoFaturado.Create;
end;

function TRepositorioPedidoFaturado.IsComponente: Boolean;
begin
   result := true; 
end;

function TRepositorioPedidoFaturado.IsInsercao(Objeto: TObject): Boolean;
begin
   result := true;
end;

procedure TRepositorioPedidoFaturado.SetCamposExcluidos(
  Auditoria: TAuditoria; Objeto: TObject);
var
  PedidoFaturado :TPedidoFaturado;
begin
   PedidoFaturado := (Objeto as TPedidoFaturado);

   Auditoria.AdicionaCampoExcluido('codigo_nota_fiscal',  FloatToStr(PedidoFaturado.CodigoNotaFiscal));
   Auditoria.AdicionaCampoExcluido('codigo_pedido',       IntToStr(PedidoFaturado.CodigoPedido));
   Auditoria.AdicionaCampoExcluido('motivo',              PedidoFaturado.motivo);
end;

procedure TRepositorioPedidoFaturado.SetCamposIncluidos(
  Auditoria: TAuditoria; Objeto: TObject);
var
  PedidoFaturado :TPedidoFaturado;
begin
   PedidoFaturado := (Objeto as TPedidoFaturado);

   Auditoria.AdicionaCampoIncluido('codigo_nota_fiscal',  FloatToStr(PedidoFaturado.CodigoNotaFiscal));
   Auditoria.AdicionaCampoIncluido('codigo_pedido',       IntToStr(PedidoFaturado.CodigoPedido));
   Auditoria.AdicionaCampoIncluido('motivo',              PedidoFaturado.motivo);
end;

procedure TRepositorioPedidoFaturado.SetParametros(Objeto: TObject);
var
  PedidoFaturado :TPedidoFaturado;
begin
   PedidoFaturado := (Objeto as TPedidoFaturado);

   inherited SetParametro('codigo_nota_fiscal', PedidoFaturado.CodigoNotaFiscal);
   inherited SetParametro('codigo_pedido',      PedidoFaturado.CodigoPedido);
   inherited SetParametro('motivo',             PedidoFaturado.Motivo);
end;

function TRepositorioPedidoFaturado.SQLGet: String;
begin
   result := 'select * from '+ self.GetNomeDaTabela + ' where codigo_nota_fiscal = :codigo_nota_fiscal ';
end;

function TRepositorioPedidoFaturado.SQLGetAll: String;
begin
   result := 'select * from '+ self.GetNomeDaTabela;
end;

function TRepositorioPedidoFaturado.SQLRemover: String;
begin
   result := 'delete from '+self.GetNomeDaTabela+' where codigo_nota_fiscal = :codigo_nota_fiscal '; 
end;

function TRepositorioPedidoFaturado.SQLSalvar: String;
begin
   result := 'update or insert into '+self.GetNomeDaTabela +' (codigo, codigo_nota_fiscal,  codigo_pedido, motivo  )'+
                             '                        values (0,      :codigo_nota_fiscal, :codigo_pedido, :motivo )';
end;

end.
