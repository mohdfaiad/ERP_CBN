unit uAlteraCaixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons, frameBuscaMateria, Vcl.Grids, Vcl.DBGrids, DBGridCBN,
  Datasnap.DBClient, CaixaPedido, Contnrs, uPadrao;

type
  TfrmAlteraCaixas = class(TfrmPadrao)
    gridCaixas: TDBGridCBN;
    gpbMateria: TGroupBox;
    btnConfirmar: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    cds: TClientDataSet;
    ds: TDataSource;
    cdsNCAIXA: TIntegerField;
    cdsCODIGO_MATERIA: TIntegerField;
    cdsMATERIA: TStringField;
    cdsINDEX: TSmallintField;
    Label1: TLabel;
    BuscaMateria1: TBuscaMateria;
    procedure FormShow(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    FCaixasDoPedido :TObjectList;

    procedure CarregaCaixas;
  public
    property CaixasDoPedido :TObjectList read FCaixasDoPedido write FCaixasDoPedido;
  end;

var
  frmAlteraCaixas: TfrmAlteraCaixas;

implementation

{$R *.dfm}

procedure TfrmAlteraCaixas.btnAlterarClick(Sender: TObject);
begin
  BuscaMateria1.Habilitar;
  BuscaMateria1.edtCodigo.SetFocus;
  btnAlterar.Enabled := false;
  gridCaixas.Enabled := false;
  btnCancelar.Enabled := true;
  btnConfirmar.Enabled := true;
end;

procedure TfrmAlteraCaixas.btnCancelarClick(Sender: TObject);
begin
  BuscaMateria1.Desabilitar;
  BuscaMateria1.Clear;
  btnAlterar.Enabled := true;
  btnCancelar.Enabled := false;
  gridCaixas.Enabled := true;
  btnConfirmar.Enabled := false;
  gridCaixas.SetFocus;
end;

procedure TfrmAlteraCaixas.btnConfirmarClick(Sender: TObject);
begin
  if assigned(BuscaMateria1.Materia) then
  begin
    cds.Edit;
    cdsCODIGO_MATERIA.AsInteger := BuscaMateria1.Materia.codigo;
    cdsMATERIA.AsString         := BuscaMateria1.Materia.descricao;
    cds.Post;

    TCaixaPedido(FCaixasDoPedido.Items[cdsINDEX.AsInteger]).codigo_materia := BuscaMateria1.Materia.codigo;
    btnCancelar.Click;
  end
  else
  begin
    BuscaMateria1.edtCodigo.SetFocus;
    avisar('Nenhuma matéria foi selecionada.');
  end;
end;

procedure TfrmAlteraCaixas.CarregaCaixas;
var vCaixaPedido :TCaixaPedido;
    i :integer;
begin
  for i := 0 to FCaixasDoPedido.Count-1 do
  begin
    vCaixaPedido := TCaixaPedido(FCaixasDoPedido.Items[i]);
    cds.Append;
    cdsINDEX.AsInteger          := FCaixasDoPedido.IndexOf(vCaixaPedido);
    cdsNCAIXA.AsInteger         := vCaixaPedido.numero;
    cdsCODIGO_MATERIA.AsInteger := vCaixaPedido.codigo_materia;
    cdsMATERIA.AsString         := vCaixaPedido.Materia.descricao;
    cds.Post;
  end;
end;

procedure TfrmAlteraCaixas.FormShow(Sender: TObject);
begin
  cds.CreateDataSet;
  CarregaCaixas;
  BuscaMateria1.Desabilitar;
  BuscaMateria1.FiltroDescricao := 'DESCRICAO LIKE ''CAIXA PAP.%'' ';
end;

end.
