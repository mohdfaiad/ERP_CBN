unit uCadastroMateria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, StdCtrls, Mask, RxToolEdit, RxCurrEdit, DB, Contnrs,
  DBClient, Grids, DBGrids, DBGridCBN, ComCtrls, Buttons, ExtCtrls, pcnNFe,
  frameListaCampo;

type
  TfrmCadastroMateria = class(TfrmCadastroPadrao)
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtCodNCM: TEdit;
    Label12: TLabel;
    edtPrecoCusto: TCurrencyEdit;
    Label1: TLabel;
    edtPrecoVenda: TCurrencyEdit;
    Label2: TLabel;
    edtEstoqueFisico: TCurrencyEdit;
    Label3: TLabel;
    edtEstoqueMinimo: TCurrencyEdit;
    cbUnidade: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cdsCODIGO: TIntegerField;
    cdsDESCRICAO: TStringField;
    ListaUnidade: TListaCampo;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodNCMKeyPress(Sender: TObject; var Key: Char);
  private
    FProdutoNfe :TProd;

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
    procedure SetprodutoNfe(const Value: TProd);

  private
    { Persiste os dados no banco de dados }
    function GravarDados   :TObject;                   override;

    { Verifica os dados antes de persistir }
    function VerificaDados :Boolean;                   override;

  public

    property produtoNfe :TProd read FprodutoNfe write SetprodutoNfe;
  end;

var
  frmCadastroMateria: TfrmCadastroMateria;

implementation

uses Materia, Repositorio, FabricaRepositorio;

{$R *.dfm}

{ TfrmCadastroMateria }

procedure TfrmCadastroMateria.AlterarRegistroNoCDS(Registro: TObject);
var
  Materia :TMateria;
begin
  inherited;

  Materia := (Registro as TMateria);

  self.cds.Edit;
  self.cdsCODIGO.AsInteger   := Materia.codigo;
  self.cdsDESCRICAO.AsString := Materia.descricao;
  self.cds.Post;
end;

procedure TfrmCadastroMateria.CarregarDados;
var
  Materias    :TObjectList;
  Repositorio :TRepositorio;
  nX          :Integer;
begin
  inherited;

  Repositorio := nil;
  MAterias    := nil;

  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TMateria.ClassName);
    Materias    := Repositorio.GetAll;

    if Assigned(Materias) and (Materias.Count > 0) then begin

       for nX := 0 to (Materias.Count-1) do
         self.IncluirRegistroNoCDS(Materias.Items[nX]);
         
    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Materias);
  end;
end;

procedure TfrmCadastroMateria.ExecutarDepoisAlterar;
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadastroMateria.ExecutarDepoisIncluir;
begin
  inherited;
  edtDescricao.SetFocus;

end;

function TfrmCadastroMateria.GravarDados: TObject;
var
  Materia     :TMateria;

  RepositorioMateria  :TRepositorio;
begin
   Materia             := nil;
   RepositorioMateria  := nil;

   try
   try
     RepositorioMateria  := TFabricaRepositorio.GetRepositorio(TMateria.ClassName);
     Materia             := TMateria(RepositorioMateria.Get(StrToIntDef(self.edtCodigo.Text, 0)));

     if not Assigned(Materia) then
      Materia := TMateria.Create;

     Materia.descricao                := self.edtDescricao.Text;
     Materia.cod_ncm                  := self.edtCodNCM.Text;
     Materia.preco_custo              := self.edtPrecoCusto.Value;
     Materia.preco_venda              := self.edtPrecoVenda.Value;
     Materia.estoque_fisico           := self.edtEstoqueFisico.Value;
     Materia.estoque_minimo           := self.edtEstoqueMinimo.Value;
     Materia.unidade                  := ListaUnidade.comListaCampo.Items[ListaUnidade.comListaCampo.itemIndex];//self.cbUnidade.Text;

     RepositorioMateria.Salvar(Materia);

     result := Materia;

     if assigned(FProdutoNfe) then
       self.ModalResult := MrOk;

   Except
    on e : Exception do                              
      begin
        if assigned(FProdutoNfe) then
           self.ModalResult := MrCancel;

      end;
   end;

   finally
     FreeAndNil(RepositorioMateria);

   end;
end;

procedure TfrmCadastroMateria.IncluirRegistroNoCDS(Registro: TObject);
var
  Materia :TMateria;
begin
  inherited;

  Materia := (Registro as TMateria);

  self.cds.Append;
  self.cdsCODIGO.AsInteger   := Materia.codigo;
  self.cdsDESCRICAO.AsString := Materia.descricao;
  self.cds.Post;
end;

procedure TfrmCadastroMateria.LimparDados;
begin
  inherited;
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtCodNCM.Clear;
  cbUnidade.ItemIndex := -1;
  edtPrecoCusto.Clear;
  edtPrecoVenda.Clear;
  edtEstoqueFisico.Clear;
  edtEstoqueMinimo.Clear;
  ListaUnidade.comListaCampo.ItemIndex := 0;
end;

procedure TfrmCadastroMateria.MostrarDados;
var
  Materia                              :TMateria;
  RepositorioMateria                   :TRepositorio;
begin
  inherited;

  Materia                              := nil;
  RepositorioMateria                   := nil;

  try
    RepositorioMateria  := TFabricaRepositorio.GetRepositorio(TMateria.ClassName);

    Materia             := TMateria(RepositorioMateria.Get(self.cdsCODIGO.AsInteger));

    if not Assigned(Materia) then exit;

    self.edtCodigo.Text               := IntToStr(Materia.codigo);
    self.edtDescricao.Text            := Materia.descricao;
    self.edtCodNCM.Text               := Materia.cod_ncm;
  //  self.cbUnidade.Text               := Materia.unidade;
    self.edtPrecoCusto.Value          := Materia.preco_custo;
    self.edtPrecoVenda.Value          := Materia.preco_venda;
    self.edtEstoqueFisico.Value       := Materia.estoque_fisico;
    self.edtEstoqueMinimo.Value       := Materia.estoque_minimo;
    self.ListaUnidade.comListaCampo.ItemIndex := self.ListaUnidade.comListaCampo.Items.IndexOf(UPPERCASE(Materia.unidade));

  finally
    FreeAndNil(RepositorioMateria);
    FreeAndNil(Materia);
  end;
end;

procedure TfrmCadastroMateria.SetprodutoNfe(const Value: TProd);
begin
  FprodutoNfe := Value;
end;

function TfrmCadastroMateria.VerificaDados: Boolean;
begin
  result := false;

  if trim(edtDescricao.Text) = '' then begin
    avisar('Favor informar a descrição da matéria');
    edtDescricao.SetFocus;
  end
  else if length(edtCodNCM.Text) < 8 then begin
    avisar('Favor informar um código NCM válido');
    edtCodNCM.SetFocus;
  end
  else if ListaUnidade.comListaCampo.Items[ListaUnidade.comListaCampo.itemIndex] = '' then begin
    avisar('Favor informar a unidade de medida da matéria');
    cbUnidade.SetFocus;
  end
  else
    result := true;
end;

procedure TfrmCadastroMateria.FormShow(Sender: TObject);
begin
  inherited;
  if assigned(FProdutoNfe) then begin
    btnIncluir.Click;
    edtDescricao.Text      := FProdutoNfe.xProd;
    edtCodNCM.Text         := FProdutoNfe.NCM;
    cbUnidade.Text         := UPPERCASE(copy(FProdutoNfe.uCom,1,3));
    edtPrecoCusto.Value    := FProdutoNfe.vUnCom;
  end;

  ListaUnidade.setValores('select distinct UPPER(UNIDADE) UNIDADE from MATERIAS', 'UNIDADE', 'Unidade');
  ListaUnidade.executa;
end;

procedure TfrmCadastroMateria.btnCancelarClick(Sender: TObject);
begin
  if assigned(FProdutoNfe) then
    self.ModalResult := MrCancel;
    
  inherited;

end;

procedure TfrmCadastroMateria.edtCodNCMKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#08]) then
    key := #0;
end;

end.
