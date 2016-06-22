unit uCadastroFormasPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, DBGridCBN, ComCtrls,
  ExtCtrls, Provider, DB, DBClient, Mask, RxToolEdit, RxCurrEdit,
  Repositorio, FormaPagamento, FormaPagamentoParcelas, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCadastroFormasPagamento = class(TfrmPadrao)
    panBotoes: TPanel;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    pagFormasPgto: TPageControl;
    TabSheet1: TTabSheet;
    gridFormasPAg: TDBGridCBN;
    TabSheet2: TTabSheet;
    ds: TDataSource;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    cdsCODIGO: TIntegerField;
    cdsDESCRICAO: TStringField;
    cdsNUMERO_PARCELAS: TIntegerField;
    btnSalvar: TBitBtn;
    Label1: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    edtNumParcelas: TCurrencyEdit;
    edtDesconto: TCurrencyEdit;
    edtAcrescimo: TCurrencyEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TCurrencyEdit;
    dbgridParcelas: TDBGrid;
    cdsParc: TClientDataSet;
    dsParc: TDataSource;
    cdsParcPARCELA: TIntegerField;
    cdsParcDIAS: TIntegerField;
    cdsParcCODFORMA_PGTO: TIntegerField;
    btnCancelar: TSpeedButton;
    btnCriarParc: TBitBtn;
    lblAsterisco: TLabel;
    lblCamposObrigatorios: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    qry: TFDQuery;
    edtPercComissao: TCurrencyEdit;
    Label8: TLabel;
    cdsPERC_COMISSAO: TBCDField;
    cdsDESCONTO: TBCDField;
    cdsACRESCIMO: TBCDField;
    procedure btnCriarParcClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dbgridParcelasExit(Sender: TObject);
    procedure cdsParcAfterScroll(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    formaPagamento :TFormaPagamento;
    formaPagParcelas :TFormaPagamentoParcelas;
    rep :TRepositorio;
    insertLocked :Boolean;

    procedure habilita(SN:Boolean);
    procedure criaParcelas;
    procedure mostraDados;
    procedure limpaCampos;
    procedure salvar;
    procedure deletaRelacoes;
    procedure verificaParcelas;
    procedure busca;
    
  public
    { Public declarations }
  end;

var
  frmCadastroFormasPagamento: TfrmCadastroFormasPagamento;

implementation

uses
  FabricaRepositorio;

{$R *.dfm}

{ TfrmCadastroFormasPagamento }

procedure TfrmCadastroFormasPagamento.criaParcelas;
var i :integer;
begin
  insertLocked := false;

  if not cdsParc.Active then
    cdsParc.CreateDataSet
  else
    cdsParc.EmptyDataSet;

  for i:=1 to edtNumParcelas.AsInteger do begin
    cdsParc.Append;
    cdsParcCODFORMA_PGTO.AsInteger := edtCodigo.AsInteger;
    cdsParcPARCELA.AsInteger       := i;
    cdsParcDIAS.Asinteger          := 0;
    cdsParc.Post;
  end;

  insertLocked := true;
  dbgridParcelas.SetFocus;
end;

procedure TfrmCadastroFormasPagamento.habilita(SN: Boolean);
begin
  if SN then begin
    btnIncluir.Enabled  := false;
    btnAlterar.Enabled  := false;
    btnCancelar.Enabled := true;
    btnSalvar.Enabled   := true;
    pagFormasPgto.Pages[1].Enabled := true;
    edtDescricao.SetFocus;
  end
  else begin
    btnIncluir.Enabled  := true;
    btnAlterar.Enabled  := true;
    btnCancelar.Enabled := false;
    btnSalvar.Enabled   := false;
    pagFormasPgto.Pages[1].Enabled := false;
  end;
end;

procedure TfrmCadastroFormasPagamento.btnCriarParcClick(Sender: TObject);
begin
  inherited;
  if edtNumParcelas.AsInteger > 0 then
    criaParcelas;
end;

procedure TfrmCadastroFormasPagamento.btnIncluirClick(Sender: TObject);
begin
  inherited;
  self.Tag := 1;
  pagFormasPgto.ActivePageIndex := 0;
  gridFormasPAg.SetFocus;
  pagFormasPgto.ActivePageIndex := 1;
end;

procedure TfrmCadastroFormasPagamento.btnAlterarClick(Sender: TObject);
begin
  inherited;
  self.Tag := 2;
  pagFormasPgto.ActivePageIndex := 0;
  gridFormasPAg.SetFocus;
  pagFormasPgto.ActivePageIndex := 1;
end;

procedure TfrmCadastroFormasPagamento.FormShow(Sender: TObject);
begin
  inherited;
  pagFormasPgto.ActivePageIndex := 0;
  insertLocked := true;

  busca;

  gridFormasPAg.SetFocus;
end;

procedure TfrmCadastroFormasPagamento.TabSheet1Exit(Sender: TObject);
begin
  inherited;
  TabSheet2Enter(nil);
end;

procedure TfrmCadastroFormasPagamento.TabSheet2Enter(Sender: TObject);
begin
  inherited;

  if self.Tag in [1,2] then
    habilita(true)
  else
    habilita(false);

  limpaCampos;

  if self.Tag in [0,2] then
    mostraDados;
end;

procedure TfrmCadastroFormasPagamento.limpaCampos;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtNumParcelas.Clear;
  edtDesconto.Clear;
  edtAcrescimo.Clear;
  edtPercComissao.Clear;
  if cdsparc.active then
    cdsParc.EmptyDataSet;
end;

procedure TfrmCadastroFormasPagamento.mostraDados;
begin
  edtCodigo.AsInteger      := cdsCODIGO.AsInteger;
  edtDescricao.Text        := cdsDESCRICAO.AsString;
  edtNumParcelas.AsInteger := cdsNUMERO_PARCELAS.AsInteger;
  edtDesconto.AsInteger    := cdsDESCONTO.AsInteger;
  edtAcrescimo.AsInteger   := cdsACRESCIMO.AsInteger;
  edtPercComissao.Value    := cdsPERC_COMISSAO.Value;

  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select * from formas_pgto_parcelas where codformas_pgto = :codigo  order by parcela';
  fdm.qryGenerica.ParamByName('codigo').AsInteger := cdsCODIGO.AsInteger;
  fdm.qryGenerica.Open;

  insertLocked := false;

  if not cdsParc.Active then
    cdsParc.CreateDataSet;

  while not fdm.qryGenerica.eof do begin
    cdsParc.Append;
    cdsParcCODFORMA_PGTO.AsInteger := fdm.qryGenerica.fieldByName('codformas_pgto').AsInteger;
    cdsParcPARCELA.AsInteger := fdm.qryGenerica.fieldByName('parcela').AsInteger;
    cdsParcDIAS.AsInteger    := fdm.qryGenerica.fieldByName('dias_parcela').AsInteger;
    cdsParc.Post;

    fdm.qryGenerica.Next;
  end;

  insertLocked := true;
end;

procedure TfrmCadastroFormasPagamento.btnCancelarClick(Sender: TObject);
begin
  inherited;
  self.Tag := 0;
  pagFormasPgto.ActivePageIndex := 0;
  habilita(false);
  gridFormasPAg.SetFocus;

  FreeAndNil(rep);
  FreeAndNil(formaPagamento );
  FreeAndNil(formaPagParcelas);
end;

procedure TfrmCadastroFormasPagamento.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if trim(edtDescricao.Text) = '' then begin
    avisar('Favor informar uma descrição para a forma de pagamento');
    edtDescricao.SetFocus;
    exit;
  end
  else if edtNumParcelas.AsInteger < 1 then begin
    avisar('1 é o valor mínimo para a quantidade de parcelas');
    edtNumParcelas.SetFocus;
    exit;
  end
  else if not(cdsParc.Active) or (cdsParc.IsEmpty) then begin
    avisar('Parcelas não foram criadas, favor criar');
    exit;
  end;

  salvar;
end;

procedure TfrmCadastroFormasPagamento.busca;
begin
  cds.Close;
  dsp.DataSet := FDM.GetConsulta('select f.* from formas_pgto f ');
  cds.Open;
end;

procedure TfrmCadastroFormasPagamento.salvar;
begin
   {  Inicio  Salva  Forma de Pagamento   }
  Rep := TFabricaRepositorio.GetRepositorio(TFormaPagamento.ClassName);

  if (formaPagamento = nil)  then  formaPagamento := TformaPagamento.Create;

  if (self.Tag = 2)          then  formaPagamento.Codigo := cdsCODIGO.AsInteger;

  formaPagamento.Descricao   := edtDescricao.Text;
  formaPagamento.NumParcelas := edtNumParcelas.AsInteger;
  formaPagamento.Desconto    := edtDesconto.Value;
  formaPagamento.Acrescimo   := edtAcrescimo.Value;
  formaPagamento.Perc_Comissao := edtPercComissao.Value;

  rep.Salvar(formaPagamento);

  {  Inicio  Salva  Parcelas da Forma de Pagamento   }
  Rep := TFabricaRepositorio.GetRepositorio(TFormaPagamentoParcelas.ClassName);

  if (formaPagParcelas = nil) then  formaPagParcelas := TFormaPagamentoParcelas.Create;

  deletaRelacoes;

  cdsParc.First;
  while not cdsParc.Eof do begin

    formaPagParcelas.Codigo        := 0;

    if (self.Tag = 2) then  formaPagParcelas.CodFormasPgto := cdsParcCODFORMA_PGTO.AsInteger
    else
    if (self.Tag = 1) then begin
      fdm.qryGenerica.Close;
      fdm.qryGenerica.SQL.Text := 'select max(codigo) from formas_pgto';
      fdm.qryGenerica.Open;

      formaPagParcelas.CodFormasPgto := fdm.qryGenerica.fieldByName('max').AsInteger;
    end;

    formaPagParcelas.Parcela       := cdsParcPARCELA.AsInteger;
    formaPagParcelas.DiasParcela   := cdsParcDIAS.AsInteger;

    rep.Salvar(formaPagParcelas);

    cdsParc.Next;
  end;

  btnCancelar.Click;
  busca;
  avisar('Operação realizada com sucesso!');
end;

procedure TfrmCadastroFormasPagamento.deletaRelacoes;
begin
  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'delete from formas_pgto_parcelas where codformas_pgto = :codigo';
  fdm.qryGenerica.ParamByName('codigo').AsInteger := formaPagamento.Codigo;
  fdm.qryGenerica.ExecSQL;
end;

procedure TfrmCadastroFormasPagamento.verificaParcelas;
var dias ,i :integer;
begin
  for i:=2 to cdsParc.RecordCount do begin
    cdsParc.RecNo := i;
    dias := cdsParcDIAS.AsInteger;
    cdsParc.First;


      cdsParc.RecNo := i - 1;
      if dias <= cdsParcDIAS.AsInteger then begin
         avisar('Atenção! Dias da ''Parcela '+intToStr(i)+'''Deve ser maior que dias da ''Parcela '+intToStr(cdsParc.RecNo)+'''');
         dbGridParcelas.SetFocus;
         break;
      end;


    if not (i = cdsParc.RecordCount) then begin
      cdsParc.RecNo := i + 1;
      if dias >= cdsParcDIAS.AsInteger then begin
         avisar('Atenção! Dias da ''Parcela '+intToStr(i)+'''Deve ser menor que dias da ''Parcela '+intToStr(cdsParc.RecNo)+'''');
         dbGridParcelas.SetFocus;
         break;
      end;
    end;
  end;

end;

procedure TfrmCadastroFormasPagamento.dbgridParcelasExit(Sender: TObject);
begin
  if not (self.Tag = 0) then
    verificaParcelas;
end;

procedure TfrmCadastroFormasPagamento.cdsParcAfterScroll(
  DataSet: TDataSet);
begin
  if (insertLocked) and (cdsParc.State in [dsInsert]) then
    cdsParc.Cancel;

end;

procedure TfrmCadastroFormasPagamento.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_F1 then
    pagFormasPgto.ActivePageIndex := 0
  else if key = VK_F2 then
    pagFormasPgto.ActivePageIndex := 1
  else if (key = VK_F3)and(btnIncluir.Enabled) then
    btnIncluir.Click
  else if (key = VK_F4)and(btnAlterar.Enabled) then
    btnAlterar.Click;
end;

end.
