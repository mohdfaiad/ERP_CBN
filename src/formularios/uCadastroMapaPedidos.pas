unit uCadastroMapaPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, Data.DB, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, RxCurrEdit, Vcl.ExtCtrls, frameBuscaPedido,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, DBGridCBN, Vcl.ComCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Generics.Collections, Contnrs, System.ImageList, Vcl.ImgList, System.StrUtils;

type
  TfrmCadastroMapaPedidos = class(TfrmCadastroPadrao)
    Label1: TLabel;
    Shape1: TShape;
    Label2: TLabel;
    cdsCODIGO: TIntegerField;
    cdsCRIACAO: TDateTimeField;
    dsPedidos: TDataSource;
    cdsPedidosDeletados: TClientDataSet;
    edtCodigoMapa: TCurrencyEdit;
    cdsPedidos: TClientDataSet;
    cdsPedidosCODIGO_PEDIDO: TIntegerField;
    cdsPedidosNUMPEDIDO: TStringField;
    cdsPedidosCODIGO: TIntegerField;
    cdsPedidosDeletadosCODIGO: TIntegerField;
    Shape2: TShape;
    Label3: TLabel;
    btnRemove: TSpeedButton;
    cdsFINALIZADO: TStringField;
    ImageList1: TImageList;
    cdsPedidosFATURADO: TStringField;
    edtCodigo: TCurrencyEdit;
    cdsNUMERO_MAPA: TIntegerField;
    cdsPedidosPESO: TSmallintField;
    gridPedidos: TDBGrid;
    btnSelecionar: TBitBtn;
    cdsPedidosPONTOS: TFloatField;
    procedure btnRemoveClick(Sender: TObject);
    procedure gridPedidosEnter(Sender: TObject);
    procedure gridPedidosExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridConsultaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsPedidosPESOChange(Sender: TField);
    procedure btnSelecionarClick(Sender: TObject);
  private
    { Altera um registro existente no CDS de consulta }
    procedure AlterarRegistroNoCDS(Registro :TObject); override;

    { Carrega todos os registros pra aba de Consulta }
    procedure CarregarDados;                           override;

    procedure ExecutarDepoisAlterar;                   override;
    procedure ExecutarDepoisIncluir;                   override;

    { Inclui um registro no CDS }
    procedure IncluirRegistroNoCDS(Registro :TObject); override;

    { Limpa as informações da aba Dados }
    procedure LimparDados;                             override;

    { Mostra um registro detalhado na aba de Dados   }
    procedure MostrarDados;                            override;

  private
    procedure adicionaPedido;
    procedure removePedido;
    procedure calculaPontuacao;
    { Persiste os dados no banco de dados }
    function GravarDados   :TObject;                   override;

    { Verifica os dados antes de persistir }
    function VerificaDados :Boolean;                   override;
    function verificaPedidos :String;
    function geraNumeroMapa :Integer;
  end;

var
  frmCadastroMapaPedidos: TfrmCadastroMapaPedidos;

implementation

uses Mapa, repositorio, fabricarepositorio, PedidoMapa, funcoes, Pedido, uBuscaPedidos;

{$R *.dfm}

procedure TfrmCadastroMapaPedidos.adicionaPedido;
var Pedido :TPedido;
begin
  for Pedido in frmBuscaPedidos.Pedidos do
  begin
    cdsPedidos.Append;
    cdsPedidosCODIGO_PEDIDO.AsInteger := Pedido.Codigo;
    cdsPedidosNUMPEDIDO.AsString      := Pedido.numpedido;
    cdsPedidosFATURADO.AsString       := 'N';
    cdsPedidosPESO.AsInteger          := 1;
    cdsPedidosPONTOS.AsFloat          := Pedido.pontos;
    cdsPedidos.Post;
  end;
end;

procedure TfrmCadastroMapaPedidos.AlterarRegistroNoCDS(Registro: TObject);
var
  Mapa :TMapa;
begin
  inherited;

  Mapa := (Registro as TMapa);

  self.cds.Edit;
  self.cdsCODIGO.AsInteger      := Mapa.codigo;
  self.cdsNUMERO_MAPA.AsInteger := Mapa.numero_mapa;
  self.cdsCRIACAO.AsDateTime    := Mapa.criacao;
  self.cdsFINALIZADO.AsString   := Mapa.finalizado;
  self.cds.Post;
end;

procedure TfrmCadastroMapaPedidos.btnRemoveClick(Sender: TObject);
begin
  if confirma('Confirma remoção do pedido nº '+cdsPedidosNUMPEDIDO.AsString+' do mapa nº '+cdsCODIGO.AsString+'?') then
    removePedido;
end;

procedure TfrmCadastroMapaPedidos.btnSelecionarClick(Sender: TObject);
begin
  frmBuscaPedidos := TfrmBuscaPedidos.Create(nil);

  if frmBuscaPedidos.showModal = mrOk then
    adicionaPedido;

  frmBuscaPedidos.Release;
  frmBuscaPedidos := nil;
end;

procedure TfrmCadastroMapaPedidos.calculaPontuacao;
begin
  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select (sum((coalesce(it.qtd_rn,0) - coalesce(ci.qtd_rn, 0)) + (coalesce(it.qtd_p,0) - coalesce(ci.qtd_p, 0)) + '+
                              '(coalesce(it.qtd_m,0) - coalesce(ci.qtd_m, 0))   + (coalesce(it.qtd_g,0) - coalesce(ci.qtd_g, 0)) +             '+
                              '(coalesce(it.qtd_1,0) - coalesce(ci.qtd_1, 0))   + (coalesce(it.qtd_2,0) - coalesce(ci.qtd_2, 0)) +             '+
                              '(coalesce(it.qtd_3,0) - coalesce(ci.qtd_3, 0))   + (coalesce(it.qtd_4,0) - coalesce(ci.qtd_4, 0)) +             '+
                              '(coalesce(it.qtd_6,0) - coalesce(ci.qtd_6, 0))   + (coalesce(it.qtd_8,0) - coalesce(ci.qtd_8, 0)) +             '+
                              '(coalesce(it.qtd_10,0) - coalesce(ci.qtd_10, 0)) + (coalesce(it.qtd_12,0) - coalesce(ci.qtd_12, 0)) +           '+
                              '(coalesce(it.qtd_14,0) - coalesce(ci.qtd_14, 0)) + (coalesce(it.qtd_unica,0) - coalesce(ci.qtd_unica, 0)))      '+
                              '* 2 * count(distinct it.cod_produto) * (ped.dt_limite_entrega - current_date) * 20 * pm.peso) / 1000 as PONTOS  '+
                              '   from pedidos ped                                                                                             '+
                              ' inner join pedidos_mapa       pm on pm.codigo_pedido = ped.codigo                                              '+
                              ' inner join mapas              mp on mp.codigo = pm.codigo_mapa                                                 '+
                              ' inner join itens              it on it.cod_pedido = pm.codigo_pedido                                           '+
                              ' left  join conferencia_itens   ci on ci.codigo_item = it.codigo                                                '+
                              ' where ped.codigo = :codped                                                                                     '+
                              ' group by mp.numero_mapa, mp.criacao, ped.numpedido, ped.codigo, ped.dt_limite_entrega, pm.peso                 '+
                              ' order by mp.criacao, mp.numero_mapa, PONTOS                                                                    ';

  fdm.qryGenerica.ParamByName('codped').AsInteger := cdsPedidosCODIGO_PEDIDO.AsInteger;
  fdm.qryGenerica.Open;

  cdsPedidosPONTOS.AsInteger := fdm.qryGenerica.FieldByName('PONTOS').AsInteger;
end;

procedure TfrmCadastroMapaPedidos.CarregarDados;
var
  Mapas        :TObjectList;
  Repositorio  :TRepositorio;
  nX           :Integer;
begin
  inherited;
  Repositorio := nil;
  Mapas    := nil;
  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TMapa.ClassName);
    Mapas  := Repositorio.GetAll;

    if Assigned(Mapas) and (Mapas.Count > 0) then begin
       for nX := 0 to (Mapas.Count-1) do
         self.IncluirRegistroNoCDS(Mapas.Items[nX]);
    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Mapas);
  end;
end;

procedure TfrmCadastroMapaPedidos.cdsPedidosPESOChange(Sender: TField);
begin
  inherited;
  calculaPontuacao;
end;

procedure TfrmCadastroMapaPedidos.gridConsultaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsFINALIZADO then begin
    TDBGridCBN(Sender).Canvas.FillRect(Rect);

    if cdsFINALIZADO.asString = 'S' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +12, Rect.Top , 0, true)
    else
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +12, Rect.Top , 1, true);
  end;
end;

procedure TfrmCadastroMapaPedidos.gridPedidosEnter(Sender: TObject);
begin
  btnRemove.Enabled := not cdsPedidos.IsEmpty;
end;

procedure TfrmCadastroMapaPedidos.gridPedidosExit(Sender: TObject);
begin
  btnRemove.Enabled := false;
end;

procedure TfrmCadastroMapaPedidos.ExecutarDepoisAlterar;
begin
  inherited;
  btnSelecionar.SetFocus;
end;

procedure TfrmCadastroMapaPedidos.ExecutarDepoisIncluir;
begin
  inherited;
  btnSelecionar.SetFocus;
end;

procedure TfrmCadastroMapaPedidos.FormCreate(Sender: TObject);
begin
  inherited;
  cdsPedidosDeletados.CreateDataSet;
  cdsPedidos.CreateDataSet;
end;

function TfrmCadastroMapaPedidos.geraNumeroMapa: Integer;
var codigo :integer;
begin
  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select count(CODIGO) qtd from MAPAS '+
                              ' where SUBSTRING(CAST(numero_mapa as char(8)) from 1 for 6) = '''+FormatDateTime('yyyymm', Date)+'''';
  fdm.qryGenerica.Open;

  codigo := fdm.qryGenerica.FieldByName('QTD').AsInteger + 1;
  result := StrToInt(FormatDateTime('yyyymm', Date) + zeroEsquerda(intToStr(codigo),2) );
end;

function TfrmCadastroMapaPedidos.GravarDados: TObject;
var
  Mapa         :TMapa;
  Repositorio  :TRepositorio;
  PedidoMapa   :TPedidoMapa;
begin
   Mapa             := nil;
   Repositorio  := nil;

   try
     Repositorio  := TFabricaRepositorio.GetRepositorio(TMapa.ClassName);
     Mapa         := TMapa(Repositorio.Get(self.edtCodigo.AsInteger));

     if not Assigned(Mapa) then
     begin
      Mapa             := TMapa.Create;
      Mapa.criacao     := now;
      Mapa.numero_mapa := edtCodigoMapa.AsInteger;
     end;

     if Mapa.codigo = 0 then
       Mapa.Pedidos := TObjectList.Create
     else
       Mapa.finalizado := verificaPedidos;

     cdsPedidos.First;
     while not cdsPedidos.Eof do
     begin
        PedidoMapa               := TPedidoMapa.Create;
        PedidoMapa.codigo        := cdsPedidosCODIGO.AsInteger;
        PedidoMapa.codigo_pedido := cdsPedidosCODIGO_PEDIDO.AsInteger;
        PedidoMapa.peso          := cdsPedidosPESO.AsInteger;
        Mapa.Pedidos.Add(PedidoMapa);
        if cdsPedidosCODIGO.AsInteger = 0 then
          Mapa.finalizado          := 'N';
        cdsPedidos.Next;
     end;

     Repositorio.Salvar(Mapa);

     {deleta items removidos}
     if not cdsPedidosDeletados.IsEmpty then
     begin
       FreeAndNil(Repositorio);
       repositorio := TFabricaRepositorio.GetRepositorio(TPedidoMapa.ClassName);
       cdsPedidosDeletados.First;
       while not cdsPedidosDeletados.Eof do
       begin
         Repositorio.RemoverPorIdentificador(cdsPedidosDeletadosCODIGO.AsInteger);
         cdsPedidosDeletados.Next;
       end;
     end;

     result := Mapa;
   finally
     FreeAndNil(Repositorio);
   end;
end;

procedure TfrmCadastroMapaPedidos.IncluirRegistroNoCDS(Registro: TObject);
var
  Mapa :TMapa;
begin
  inherited;
  Mapa := (Registro as TMapa);

  self.cds.Append;
  self.cdsCODIGO.AsInteger      := Mapa.codigo;
  self.cdsNUMERO_MAPA.AsInteger := Mapa.numero_mapa;
  self.cdsCRIACAO.AsDateTime    := Mapa.criacao;
  self.cdsFINALIZADO.AsString   := Mapa.finalizado;
  self.cds.Post;
end;

procedure TfrmCadastroMapaPedidos.LimparDados;
begin
  inherited;
  edtCodigoMapa.AsInteger := geraNumeroMapa;
  if cdsPedidos.Active then
    cdsPedidos.EmptyDataSet;
  cdsPedidosDeletados.EmptyDataSet;
end;

procedure TfrmCadastroMapaPedidos.MostrarDados;
var
  Mapa                              :TMapa;
  RepositorioMapa                   :TRepositorio;
  i :integer;
begin
  inherited;

  Mapa                              := nil;
  RepositorioMapa                   := nil;

  try
    RepositorioMapa  := TFabricaRepositorio.GetRepositorio(TMapa.ClassName);
    Mapa             := TMapa(RepositorioMapa.Get(self.cdsCODIGO.AsInteger));

    if not Assigned(Mapa) then exit;

    self.edtCodigoMapa.AsInteger  := Mapa.numero_mapa;
    self.edtCodigo.AsInteger      := Mapa.codigo;

    for i := 0 to Mapa.Pedidos.Count-1 do
    begin
      cdsPedidos.Append;
      cdsPedidosCODIGO_PEDIDO.AsInteger := TPedidoMapa(Mapa.Pedidos.Items[i]).Pedido.Codigo;
      cdsPedidosNUMPEDIDO.AsString      := TPedidoMapa(Mapa.Pedidos.Items[i]).Pedido.numpedido;
      cdsPedidosCODIGO.AsInteger        := TPedidoMapa(Mapa.Pedidos.Items[i]).Codigo;
      cdsPedidosFATURADO.AsString       := IfThen(TPedidoMapa(Mapa.Pedidos.Items[i]).Pedido.Faturado,'S','N');
      cdsPedidosPESO.AsInteger          := TPedidoMapa(Mapa.Pedidos.Items[i]).peso;
      cdsPedidos.Post;
    end;

  finally
    FreeAndNil(RepositorioMapa);
    FreeAndNil(Mapa);
  end;
end;

procedure TfrmCadastroMapaPedidos.removePedido;
begin
  if cdsPedidosCODIGO.AsInteger > 0 then
  begin
    cdsPedidosDeletados.Append;
    cdsPedidosDeletadosCODIGO.AsInteger := cdsPedidosCODIGO.AsInteger;
    cdsPedidosDeletados.Post;
  end;

  cdsPedidos.Delete;
end;

function TfrmCadastroMapaPedidos.VerificaDados: Boolean;
begin
  result := false;

  if cdsPedidos.IsEmpty then begin
    avisar('Ao menos um pedido deve ser adicionado ao mapa');
    btnSelecionar.SetFocus;
  end
  else
    result := true;
end;

function TfrmCadastroMapaPedidos.verificaPedidos: String;
begin
  cdsPedidos.First;
  while not cdsPedidos.Eof do
  begin
    result := cdsPedidosFATURADO.AsString;
    {se algum pedido nao estiver sido faturado, o mapa ainda esta aberto}
    if result = 'N' then
      exit;
    cdsPedidos.Next;
  end;
end;

end.
