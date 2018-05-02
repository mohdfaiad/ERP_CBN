unit uOrcamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, DBGridCBN, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmOrcamentos = class(TfrmPadrao)
    Label1: TLabel;
    qryOrcamentos: TFDQuery;
    dsOrcamentos: TDataSource;
    qryOrcamentosIMPORTADO: TDateField;
    qryOrcamentosVALOR_TOTAL: TBCDField;
    qryOrcamentosREPRESENTANTE: TStringField;
    qryOrcamentosCLIENTE: TStringField;
    qryOrcamentosCPF_CNPJ: TStringField;
    qryOrcamentosID_EXTERNO: TStringField;
    qryOrcamentosCODIGO: TIntegerField;
    DBGrid1: TDBGrid;
    btnConfirmaPedido: TSpeedButton;
    btnCancelaPedido: TSpeedButton;
    procedure btnCancelaPedidoClick(Sender: TObject);
    procedure btnConfirmaPedidoClick(Sender: TObject);
    procedure DBGridCBN1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure alteraStatusPedido(status :String);
    function  cancelaPedidoExterno:String;
    procedure alteraPedidoERP(status :String);

    procedure buscarOrcamentos;
  public
    { Public declarations }
  end;

var
  frmOrcamentos: TfrmOrcamentos;

const
  ST_CANCELADO = 'C';
  ST_PEDIDO = 'P';

implementation

uses uModulo, ClienteHttpMeusPedidos, System.StrUtils, PEdido, repositorio, fabricaRepositorio;

{$R *.dfm}

procedure TfrmOrcamentos.alteraPedidoERP(status: String);
var Pedido :TPedido;
    repositorio :TRepositorio;
begin
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);
    Pedido      := TPedido(repositorio.get(qryOrcamentosCODIGO.AsInteger));

    Pedido.tipo := 'P';
    if status.Equals('C') then
      Pedido.cancelado := 'S';
    repositorio.Salvar(Pedido);
  finally
    FreeAndNil(Pedido);
    FreeAndNil(repositorio);
  end;
end;

function TfrmOrcamentos.cancelaPedidoExterno: String;
var
  Client :TClienteHttpMeusPedidos;
  json   :String;
begin
  try
  try
    json   := '';

    Client := nil;
    Client := TClienteHttpMeusPedidos.Create(fdm.configuracoesIntegracao.application_token,
                                             fdm.configuracoesIntegracao.company_token,
                                             fdm.configuracoesIntegracao.url_base);

    result := Client.Post('pedidos/cancelar/'+qryOrcamentosID_EXTERNO.AsString,json);

    result := Client.ClientHttp.ResponseCode.ToString;
  Except
    on e :Exception do
      result := e.Message;
  end;
  finally
    FreeAndNil(Client);
  end;
end;

procedure TfrmOrcamentos.alteraStatusPedido(status: String);
var retorno :String;
begin
  try
  try
    if status.Equals(ST_CANCELADO) then
      if not cancelaPedidoExterno.Equals('200') then
        raise Exception.Create('Erro ao cancelar pedido');

    alteraPedidoERP(status);

    avisar('Alteração realizada com sucesso!');
  Except
    on e :Exception do
    begin
      avisar(e.Message);
    end;
  end;
  finally
    buscarOrcamentos;
  end;
end;

procedure TfrmOrcamentos.btnCancelaPedidoClick(Sender: TObject);
begin
  alteraStatusPedido(ST_CANCELADO);
end;

procedure TfrmOrcamentos.btnConfirmaPedidoClick(Sender: TObject);
begin
  alteraStatusPedido(ST_PEDIDO);
end;

procedure TfrmOrcamentos.buscarOrcamentos;
begin
  qryOrcamentos.Close;
  qryOrcamentos.Open;
end;

procedure TfrmOrcamentos.DBGridCBN1Enter(Sender: TObject);
begin
  btnConfirmaPedido.Enabled := not qryOrcamentos.IsEmpty;
  btnCancelaPedido.Enabled := not qryOrcamentos.IsEmpty;
end;

procedure TfrmOrcamentos.FormShow(Sender: TObject);
begin
  buscarOrcamentos;
end;

end.
