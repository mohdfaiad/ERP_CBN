unit uEntradaManualMateria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.StrUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, frameBuscaMateria, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, RxCurrEdit, Vcl.Buttons,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, DBGridCBN, Materia;

type
  TEntradaSaida = (tmEntrada, tmSaida);
type
  TfrmEntradaManualMateria = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    pnlRodape: TPanel;
    btnSalvar: TBitBtn;
    btnLimpar: TBitBtn;
    pnlQuantidades: TPanel;
    Shape2: TShape;
    lbQuantidade: TLabel;
    Label4: TLabel;
    lbEntSai: TLabel;
    edtEstoqueAtual: TCurrencyEdit;
    edtQtdEntrada: TCurrencyEdit;
    BuscaMateria1: TBuscaMateria;
    lbResponsavel: TLabel;
    edtObs: TEdit;
    Label1: TLabel;
    DBGridCBN1: TDBGridCBN;
    Label2: TLabel;
    cds: TClientDataSet;
    ds: TDataSource;
    cdsUND_SISTEMA: TStringField;
    cdsQUANTIDADE: TFloatField;
    lbUnidadeMedida: TLabel;
    cdsUND_MOVIMENTO: TStringField;
    procedure BuscaMateria1Exit(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtQtdEntradaChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure DBGridCBN1Enter(Sender: TObject);
  private
    FEntradaZero_SaidaUm :smallint;
  private
    procedure salvaEntradaEstoqueMateria;
    procedure salvaEntradaSaida;
    procedure SetEntradaZero_SaidaUm(const Value: SmallInt);
    procedure carregaUnidades(materia :TMateria);
  public
    property EntradaZero_SaidaUm :SmallInt read FEntradaZero_SaidaUm write SetEntradaZero_SaidaUm;

  public
    constructor Create(AOwner :TComponent; pEntradaZero_SaidaUm :SmallInt); reintroduce;
  end;

var
  frmEntradaManualMateria: TfrmEntradaManualMateria;

implementation

uses repositorio, fabricaRepositorio, Math, EntradaSaidaMateria, UnidadeEntSai;

{$R *.dfm}

procedure TfrmEntradaManualMateria.btnLimparClick(Sender: TObject);
begin
  BuscaMateria1.Clear;
  edtEstoqueAtual.Clear;
  edtQtdEntrada.Clear;
  BuscaMateria1.edtCodigo.SetFocus;
  cds.EmptyDataSet;
end;

procedure TfrmEntradaManualMateria.btnSalvarClick(Sender: TObject);
begin
  if (Length(edtObs.Text) < 3) and (edtObs.Visible) then
  begin
    avisar('Favor informar o responsável pela operação');
    edtObs.SetFocus;
    exit;
  end;
  salvaEntradaEstoqueMateria;
  edtQtdEntrada.Clear;
  edtObs.Clear;
end;

procedure TfrmEntradaManualMateria.BuscaMateria1Exit(Sender: TObject);
begin
  if assigned(BuscaMateria1.Materia) then
  begin
    cds.EmptyDataSet;
    edtEstoqueAtual.Value := BuscaMateria1.Materia.estoque_fisico;
    carregaUnidades(BuscaMateria1.Materia);
    if cds.IsEmpty then
      avisar('Matéria não possui nenhuma unidade de '+ifThen(self.FEntradaZero_SaidaUm=0,'entrada','saída')+' cadastrada, favor cadastrar.');
  end
  else
  begin
    edtEstoqueAtual.Clear;
    lbUnidadeMedida.Caption := '(  )';
    cds.EmptyDataSet;
  end;
end;

procedure TfrmEntradaManualMateria.carregaUnidades(materia: TMateria);
var i :integer;
begin
  if assigned(materia.UnidadesEntSai) then
    for i := 0 to materia.UnidadesEntSai.Count-1 do
    begin
      if TUnidadeEntSai(materia.UnidadesEntSai.items[i]).tipo = IfThen(self.FEntradaZero_SaidaUm = 0,'E','S') then
      begin
        cds.Append;
        cdsUND_SISTEMA.AsString   := TUnidadeEntSai(materia.UnidadesEntSai.items[i]).unidade_sistema;
        cdsUND_MOVIMENTO.AsString := TUnidadeEntSai(materia.UnidadesEntSai.items[i]).unidade_movimento;
        cdsQUANTIDADE.AsFloat     := TUnidadeEntSai(materia.UnidadesEntSai.items[i]).quantidade;
        cds.Post;
      end;
    end;
end;

procedure TfrmEntradaManualMateria.cdsAfterScroll(DataSet: TDataSet);
begin
   lbUnidadeMedida.Caption := '('+cdsUND_MOVIMENTO.AsString+')';
end;

constructor TfrmEntradaManualMateria.Create(AOwner: TComponent; pEntradaZero_SaidaUm: SmallInt);
begin
  inherited Create(AOwner);
  self.FEntradaZero_SaidaUm := pEntradaZero_SaidaUm;
end;

procedure TfrmEntradaManualMateria.DBGridCBN1Enter(Sender: TObject);
begin
  inherited;
  cdsAfterScroll(nil);
end;

procedure TfrmEntradaManualMateria.edtQtdEntradaChange(Sender: TObject);
begin
  btnSalvar.Enabled := assigned(BuscaMateria1.Materia) and (edtQtdEntrada.Value > 0);
end;

procedure TfrmEntradaManualMateria.FormCreate(Sender: TObject);
begin
  inherited;
  BuscaMateria1.ApenasControlaEstoque := true;
end;

procedure TfrmEntradaManualMateria.FormShow(Sender: TObject);
begin
  self.Caption         := IfThen(self.FEntradaZero_SaidaUm = 0, 'Entrada ' , 'Saída ')+'manual de matérias ao estoque';
  lbQuantidade.Caption := IfThen(self.FEntradaZero_SaidaUm = 0,'Informe a quantidade de estoque a ser inserida à matéria selecionada',
                                                               'Informe a quantidade de estoque a ser removida da matéria selecionada');
  lbEntSai.Caption     := IfThen(self.FEntradaZero_SaidaUm = 0,'Quantidade a dar entrada >', 'Quantidade a dar saída >');
  lbEntSai.Font.Color  := IfThen(self.FEntradaZero_SaidaUm = 0, $0000A400, $00076DF8);
  lbUnidadeMedida.Font.Color  := IfThen(self.FEntradaZero_SaidaUm = 0, $0000A400, $00076DF8);
  cds.CreateDataSet;
end;

procedure TfrmEntradaManualMateria.salvaEntradaEstoqueMateria;
var repositorio :TRepositorio;
begin
  try
  try
    fdm.conexao.TxOptions.AutoCommit := false;
    repositorio := TFabricaRepositorio.GetRepositorio(TMateria.ClassName);

    if EntradaZero_SaidaUm = 0 then
      BuscaMateria1.Materia.incrementaEstoque(edtQtdEntrada.Value * cdsQUANTIDADE.AsFloat)
    else
      BuscaMateria1.Materia.decrementaEstoque(edtQtdEntrada.Value * cdsQUANTIDADE.AsFloat);

    repositorio.Salvar(BuscaMateria1.Materia);
    edtEstoqueAtual.Value := BuscaMateria1.Materia.estoque_fisico;

    salvaEntradaSaida;

    fdm.conexao.Commit;
    avisar('Operação realizada com sucesso!',1);
  Except
    on e :Exception do
    begin
      fdm.conexao.Rollback;
      avisar('Erro ao salvar.'+#13#10+e.Message);
    end;
  end;
  finally
    fdm.conexao.TxOptions.AutoCommit := true;
    FreeAndNil(repositorio);
  end;
end;

procedure TfrmEntradaManualMateria.salvaEntradaSaida;
var repositorio  :TRepositorio;
    entradaSaida :TEntradaSaidaMateria;
begin
  try
  try
    repositorio  := TFabricaRepositorio.GetRepositorio(TEntradaSaidaMateria.ClassName);
    entradaSaida := TEntradaSaidaMateria.Create;

    entradaSaida.codigo_materia := BuscaMateria1.Materia.codigo;
    entradaSaida.quantidade     := edtQtdEntrada.Value;
    entradaSaida.data_movimento := Now;
    entradaSaida.tipo           := IfThen(FEntradaZero_SaidaUm = 0, 'E', 'S');
    entradaSaida.observacao     := edtObs.Text;

    repositorio.Salvar(entradaSaida);
  Except
    on e :Exception do
      raise Exception.Create(e.Message);
  end;
  finally
    FreeAndNil(entradaSaida);
    FreeAndNil(repositorio);
  end;
end;

procedure TfrmEntradaManualMateria.SetEntradaZero_SaidaUm(const Value: SmallInt);
begin
  FEntradaZero_SaidaUm := Value;

  lbResponsavel.Visible := FEntradaZero_SaidaUm = 0;
  edtObs.Visible        := FEntradaZero_SaidaUm = 0;
end;

end.
