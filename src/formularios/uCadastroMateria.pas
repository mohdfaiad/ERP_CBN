unit uCadastroMateria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, StdCtrls, Mask, RxToolEdit, RxCurrEdit, DB, Contnrs,
  DBClient, Grids, DBGrids, DBGridCBN, ComCtrls, Buttons, ExtCtrls, pcnNFe, System.StrUtils,
  frameListaCampo, Especificacao;

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
    Label5: TLabel;
    Label6: TLabel;
    cdsCODIGO: TIntegerField;
    cdsDESCRICAO: TStringField;
    Label7: TLabel;
    cbxControlaEstoque: TComboBox;
    cdsCONTROLA_ESTOQUE: TStringField;
    GroupBox1: TGroupBox;
    ListaUnidMovimento: TListaCampo;
    Label8: TLabel;
    edtEquivale: TCurrencyEdit;
    ListaUnidSistema: TListaCampo;
    cdsUnidades: TClientDataSet;
    dsUnidades: TDataSource;
    cdsUnidadesCODIGO: TIntegerField;
    Label4: TLabel;
    cbxTipoMovimento: TComboBox;
    btnConfirma: TBitBtn;
    gridUnidades: TDBGridCBN;
    Label9: TLabel;
    cdsUnidadesUND_MOV: TStringField;
    cdsUnidadesUND_SIS: TStringField;
    cdsUnidadesQUANTIDADE: TFloatField;
    cdsUnidadesTIPO: TStringField;
    edtCodigoUnidade: TCurrencyEdit;
    btnDeletar: TBitBtn;
    cdsUnidsDeletadas: TClientDataSet;
    cdsUnidsDeletadasCODIGO: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodNCMKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure gridUnidadesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbxTipoMovimentoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FProdutoNfe :TProd;
    FUndEntrada :String;
    FCodigoMateria :integer;
    FFiltroDescricao :String;
    FApenasControlaEstoque: Boolean;

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
  private
    procedure addUnidade(codigoUnidade :integer; unidadeMovimento :String; qtdEquivalente :Real;
                         unidadeSistema, tipoMovimento :String);
    procedure limpaCamposUnidade;
    procedure verificaPreenchidosUnidade;
    procedure persisteDeletadas;

  public
    constructor Create(AOwner: TComponent; codigoMateria: integer; unidadeEntrada: String);overload;

    property produtoNfe :TProd read FprodutoNfe write SetprodutoNfe;
    property filtroDescricao :String read FFiltroDescricao write FFiltroDescricao;
    property ApenasControlaEstoque :Boolean read FApenasControlaEstoque write FApenasControlaEstoque;
  end;

var
  frmCadastroMateria: TfrmCadastroMateria;

implementation

uses Materia, Repositorio, FabricaRepositorio, Math, UnidadeEntSai;

{$R *.dfm}

{ TfrmCadastroMateria }

procedure TfrmCadastroMateria.addUnidade(codigoUnidade: integer; unidadeMovimento: String; qtdEquivalente: Real; unidadeSistema, tipoMovimento: String);
begin
  if (codigoUnidade > 0) and cdsUnidades.Locate('CODIGO', codigoUnidade, []) then
    cdsUnidades.Edit
  else
    cdsUnidades.Append;

  cdsUnidadesCODIGO.AsInteger   := codigoUnidade;
  cdsUnidadesUND_MOV.AsString   := unidadeMovimento;
  cdsUnidadesQUANTIDADE.AsFloat := qtdEquivalente;
  cdsUnidadesUND_SIS.AsString   := unidadeSistema;
  cdsUnidadesTIPO.AsString      := tipoMovimento;
  cdsUnidades.Post;
end;

procedure TfrmCadastroMateria.AlterarRegistroNoCDS(Registro: TObject);
var
  Materia :TMateria;
begin
  inherited;
  Materia := (Registro as TMateria);

  self.cds.Edit;
  self.cdsCODIGO.AsInteger          := Materia.codigo;
  self.cdsDESCRICAO.AsString        := Materia.descricao;
  self.cdsCONTROLA_ESTOQUE.AsString := IfThen(Materia.controla_estoque,'S','N');
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

procedure TfrmCadastroMateria.cbxTipoMovimentoChange(Sender: TObject);
begin
  inherited;
  if cbxTipoMovimento.ItemIndex = 0 then
    ListaUnidMovimento.staTitulo.Caption := 'Und. Entrada'
  else if cbxTipoMovimento.ItemIndex = 1 then
    ListaUnidMovimento.staTitulo.Caption := 'Und. Saída'
  else
    ListaUnidMovimento.staTitulo.Caption := 'Unidade';  
end;

constructor TfrmCadastroMateria.Create(AOwner: TComponent; codigoMateria: integer; unidadeEntrada:String);
begin
  self.Create(AOwner);
  FUndEntrada := unidadeEntrada;
  FCodigoMateria := codigoMateria;
end;

procedure TfrmCadastroMateria.gridUnidadesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  
  if Column.Field = cdsUnidadesTIPO then begin
    TDBGridCBN(Sender).Canvas.FillRect(Rect);
    gridUnidades.Canvas.Font.Style  := [fsBold];
    
    if cdsUnidadesTIPO.asString = 'ENTRADA' then
      gridUnidades.Canvas.Font.Color  := $0022956C
    else
      gridUnidades.Canvas.Font.Color  := $000061C1;
      
    gridUnidades.Canvas.FillRect( rect );
    gridUnidades.DefaultDrawColumnCell( Rect, DataCol, Column, state);
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
  Materia             :TMateria;
  UnidadeEntSai       :TUnidadeEntSai;
  RepositorioMateria  :TRepositorio;
begin
   Materia               := nil;
   RepositorioMateria    := nil;
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
     Materia.controla_estoque         := copy(cbxControlaEstoque.Text,1,1) = 'S';

     { * * SALVA UNIDADES DE MEDIDA EQUIVALENTES * * }
     if not assigned(Materia.UnidadesEntSai) then
       Materia.UnidadesEntSai := TObjectList.Create(true);

     cdsUnidades.First;
     while not cdsUnidades.Eof do
     begin     
       UnidadeEntSai                   := TUnidadeEntSai.Create;
       UnidadeEntSai.codigo            := cdsUnidadesCODIGO.AsInteger;
       UnidadeEntSai.unidade_movimento := cdsUnidadesUND_MOV.AsString;       
       UnidadeEntSai.quantidade        := cdsUnidadesQUANTIDADE.AsFloat;
       UnidadeEntSai.unidade_sistema   := cdsUnidadesUND_SIS.AsString;
       UnidadeEntSai.tipo              := Copy(cdsUnidadesTIPO.AsString,1,1);
            
       Materia.UnidadesEntSai.Add(UnidadeEntSai);
       cdsUnidades.Next;
     end;

     RepositorioMateria.Salvar(Materia);

     if not cdsUnidsDeletadas.IsEmpty then
       persisteDeletadas;

     result := Materia;

     if assigned(FProdutoNfe) or not(FUndEntrada.IsEmpty) then
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
  self.cdsCODIGO.AsInteger          := Materia.codigo;
  self.cdsDESCRICAO.AsString        := Materia.descricao;
  self.cdsCONTROLA_ESTOQUE.AsString := IfThen(Materia.controla_estoque,'S','N');
  self.cds.Post;
end;

procedure TfrmCadastroMateria.limpaCamposUnidade;
begin
  ListaUnidSistema.comListaCampo.ItemIndex   := 0;
  ListaUnidMovimento.comListaCampo.ItemIndex := 0;
  edtEquivale.Clear;
  cbxTipoMovimento.ItemIndex := -1;
end;

procedure TfrmCadastroMateria.LimparDados;
begin
  inherited;
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtCodNCM.Clear;
  edtPrecoCusto.Clear;
  edtPrecoVenda.Clear;
  edtEstoqueFisico.Clear;
  edtEstoqueMinimo.Clear;
  cbxControlaEstoque.ItemIndex := 1;
  limpaCamposUnidade;
  cdsUnidades.EmptyDataSet;
  if cdsUnidsDeletadas.Active then
    cdsUnidsDeletadas.EmptyDataSet;
end;

procedure TfrmCadastroMateria.MostrarDados;
var
  Materia             :TMateria;
  RepositorioMateria  :TRepositorio;
  i :integer;
  unidade :TUnidadeEntSai;
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
//    self.ListaUnidadeSaida.comListaCampo.ItemIndex   := self.ListaUnidadeSaida.comListaCampo.Items.IndexOf(UPPERCASE(Materia.unidade));
//    self.ListaUnidadeEntrada.comListaCampo.ItemIndex := self.ListaUnidadeEntrada.comListaCampo.Items.IndexOf(UPPERCASE(Materia.unidade));
    self.cbxControlaEstoque.ItemIndex := IfThen(Materia.controla_estoque, 0, 1);

    if assigned(Materia.UnidadesEntSai) and (Materia.UnidadesEntSai.Count > 0) then
    begin
      for i := 0 to Materia.UnidadesEntSai.Count-1 do
      begin  
        unidade := TUnidadeEntSai(Materia.UnidadesEntSai.Items[i]);
        cdsUnidades.Append;
        cdsUnidadesCODIGO.AsInteger   := unidade.codigo;        
        cdsUnidadesUND_MOV.AsString   := unidade.unidade_movimento;        
        cdsUnidadesUND_SIS.AsString   := unidade.unidade_sistema;        
        cdsUnidadesQUANTIDADE.AsFloat := unidade.quantidade;                                
        cdsUnidadesTIPO.AsString      := ifThen(unidade.tipo = 'E','ENTRADA', 'SAÍDA');
        cdsUnidades.Post;        
      end;
    end;

  finally
    FreeAndNil(RepositorioMateria);
    FreeAndNil(Materia);
  end;
end;

procedure TfrmCadastroMateria.persisteDeletadas;
var repositorio :TRepositorio;
begin
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TUnidadeEntSai.ClassName);
    cdsUnidsDeletadas.First;
    while not cdsUnidsDeletadas.Eof do
    begin
      repositorio.RemoverPorIdentificador(cdsUnidsDeletadasCODIGO.AsInteger);
      cdsUnidsDeletadas.Next;
    end;
  finally
    FreeAndNil(repositorio);
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
  else if (cbxControlaEstoque.ItemIndex = 0) and (((cdsUnidades.IsEmpty) or not cdsUnidades.Locate('TIPO', 'ENTRADA', []))) then
  begin
    avisar('Favor informar uma quantidade de equivalência para unidade de entrada da matéria');
    ListaUnidMovimento.comListaCampo.SetFocus;
  end
  {else if (cbxControlaEstoque.ItemIndex = 0) and ((cdsUnidades.IsEmpty) or not cdsUnidades.Locate('TIPO', 'SAÍDA', [])) then
  begin
    avisar('Favor informar uma quantidade de equivalência para unidade de saída da matéria');
    ListaUnidMovimento.comListaCampo.SetFocus;
  end }
  else
    result := true;
end;

procedure TfrmCadastroMateria.verificaPreenchidosUnidade;
begin
  if cbxTipoMovimento.ItemIndex < 0 then
    raise Exception.Create('Favor informar o tipo do movimento')
  else if (ListaUnidMovimento.comListaCampo.ItemIndex <= 0) then
    raise Exception.Create('Favor informar a unidade de "'+cbxTipoMovimento.Text+'"')
  else if (ListaUnidSistema.comListaCampo.ItemIndex <= 0) then
    raise Exception.Create('Favor informar a unidade de "'+cbxTipoMovimento.Text+'"')
  else if edtEquivale.Value <= 0 then
    raise Exception.Create('Favor informar a quantidade')
  else if cdsUnidades.Locate('UND_MOV;UND_SIS;TIPO',VarArrayOf([ListaUnidMovimento.comListaCampo.Text,
                                                                ListaUnidSistema.comListaCampo.Text,
                                                                cbxTipoMovimento.Text]), []) then
    raise Exception.Create('Esta combinação de unidades já foi inserida');                                                            
         
end;

procedure TfrmCadastroMateria.FormCreate(Sender: TObject);
begin
  inherited;
  cdsUnidades.CreateDataSet;
  cdsUnidsDeletadas.CreateDataSet;
end;

procedure TfrmCadastroMateria.FormShow(Sender: TObject);
begin
  inherited;

  if filtroDescricao <> '' then
  begin
    cds.Filtered := false;
    cds.Filter   := filtroDescricao;
    cds.Filtered := true;
  end;

  if FApenasControlaEstoque then
  begin
    cds.Filtered := false;
    cds.Filter   := 'CONTROLA_ESTOQUE = ''S''';
    cds.Filtered := true;
  end;

  if cds.IsEmpty then
  begin
    avisar('Nenhuma matéria foi encontrada.');
    self.Close;
  end;

  if assigned(FProdutoNfe) then begin
    btnIncluir.Click;
    edtDescricao.Text      := FProdutoNfe.xProd;
    edtCodNCM.Text         := FProdutoNfe.NCM;
    edtPrecoCusto.Value    := FProdutoNfe.vUnCom;
  end;

  ListaUnidSistema.setValores('select UPPER(UNIDADE_MEDIDA) UNIDADE from UNIDADES', 'UNIDADE', 'Unid. Sist.');
  ListaUnidSistema.executa;

  ListaUnidMovimento.setValores('select UPPER(UNIDADE_MEDIDA) UNIDADE from UNIDADES', 'UNIDADE', 'Unidade');
  ListaUnidMovimento.executa;

  if not (FUndEntrada.IsEmpty) then
  begin
    cds.Locate('CODIGO',FCodigoMateria,[]);
    btnAlterar.Click;
    ListaUnidMovimento.comListaCampo.ItemIndex := ListaUnidMovimento.comListaCampo.Items.IndexOf(FUndEntrada);
    cbxTipoMovimento.ItemIndex := 0;
    cbxControlaEstoque.ItemIndex := 1;
    cbxTipoMovimento.Enabled   := false;
    cbxTipoMovimentoChange(nil);
    edtEquivale.SetFocus;
  end;
end;

procedure TfrmCadastroMateria.btnCancelarClick(Sender: TObject);
begin
  if assigned(FProdutoNfe) or not(FUndEntrada.IsEmpty) then
    self.ModalResult := MrCancel;
    
  inherited;
end;

procedure TfrmCadastroMateria.btnConfirmaClick(Sender: TObject);
begin
  try
    verificaPreenchidosUnidade;
    addUnidade(edtCodigoUnidade.AsInteger,
               ListaUnidMovimento.comListaCampo.Text,
               edtEquivale.Value,
               ListaUnidSistema.comListaCampo.Text,
               cbxTipoMovimento.Text);
    limpaCamposUnidade;
    if cbxTipoMovimento.Enabled then
      cbxTipoMovimento.SetFocus
    else
      btnSalvar.Click;
  Except
    on e :Exception do
      avisar(e.Message);
  end;
end;

procedure TfrmCadastroMateria.btnDeletarClick(Sender: TObject);
begin
  if cdsUnidades.IsEmpty then
    exit;

  if cdsUnidadesCODIGO.AsInteger > 0 then
  begin
    cdsUnidsDeletadas.Append;
    cdsUnidsDeletadasCODIGO.AsInteger := cdsUnidadesCODIGO.AsInteger;
    cdsUnidsDeletadas.Post;
  end;
  cdsUnidades.Delete;
end;

procedure TfrmCadastroMateria.edtCodNCMKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#08]) then
    key := #0;
end;

end.
