unit uCadastroFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, uPadrao,
  frameBuscaCidade, Provider, DB, DBClient, Grids, DBGrids, DBGridCBN, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, Mask, Pessoa, Repositorio, StrUtils, Endereco,
  frameMaskCpfCnpj, DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmCadastroFornecedor = class(TfrmPadrao)
    panBotoes: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ds: TDataSource;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    cdsCODIGO: TIntegerField;
    cdsPESSOA: TStringField;
    cdsCPF_CNPJ: TStringField;
    cdsRG_IE: TStringField;
    cdsDTCADASTRO: TDateField;
    cdsFONE1: TStringField;
    cdsFONE2: TStringField;
    cdsFAX: TStringField;
    cdsOBSERVACAO: TStringField;
    cdsBLOQUEADO: TStringField;
    cdsMOTIVO_BLOQ: TStringField;
    cdsTIPO: TStringField;
    cdsCODIGO_1: TIntegerField;
    cdsCODPESSOA: TIntegerField;
    cdsLOGRADOURO: TStringField;
    cdsBAIRRO: TStringField;
    cdsCODCIDADE: TIntegerField;
    cdsCEP: TStringField;
    cdsPAIS: TStringField;
    cdsCOMPLEMENTO: TStringField;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtRazao: TEdit;
    edtRg: TMaskEdit;
    edtDtCad: TMaskEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Cidade: TBuscaCidade;
    edtLogradouro: TEdit;
    edtNumero: TEdit;
    edtBairro: TEdit;
    edtPais: TEdit;
    edtCep: TMaskEdit;
    edtComplemento: TEdit;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtFone1: TMaskEdit;
    edtFone2: TMaskEdit;
    edtFax: TMaskEdit;
    edtCodigo: TEdit;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    pagFornecedores: TPageControl;
    gridFornecedores: TDBGridCBN;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    CpfCnpj: TMaskCpfCnpj;
    cdsRAZAO: TStringField;
    cdsNUMERO: TStringField;
    GroupBox8: TGroupBox;
    memObs: TMemo;
    GroupBox7: TGroupBox;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    edtEmail: TDBEdit;
    dsEmails: TDataSource;
    cdsEmails: TClientDataSet;
    cdsEmailsEMAIL: TStringField;
    cdsEMAIL: TStringField;
    lblAsterisco: TLabel;
    lblCamposObrigatorios: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edtNomeFantasia: TEdit;
    Label23: TLabel;
    cdsNOME_FANTASIA: TStringField;
    qry: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure gridFornecedoresTitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEmailEnter(Sender: TObject);
    procedure edtEmailExit(Sender: TObject);
    procedure TabSheet2Exit(Sender: TObject);

  private
    Fornecedor :TPessoa;
    Endereco :TEndereco;
    rep, repEnd :TRepositorio;

    procedure salvar;
    procedure mostraDados;
    procedure limpaCampos;
    function verificaObrigatorios :Boolean;
    procedure habilita(SN:boolean);
    procedure addEmail;
    procedure carregaEmails(emails :String);
    function concatenaEmails :String;

  public
    { Public declarations }
  end;

var
  frmCadastroFornecedor: TfrmCadastroFornecedor;

implementation

uses
  FabricaRepositorio, Math;

{$R *.dfm}

procedure TfrmCadastroFornecedor.FormShow(Sender: TObject);
begin
  inherited;
  pagFornecedores.ActivePageIndex := 0;
  cdsEmails.CreateDataSet;

  cds.Close;
  dsp.DataSet := FDM.GetConsulta('SELECT * FROM pessoas p                           '+
                                 ' left join enderecos en on en.codpessoa = p.codigo'+
                                 ' where p.tipo = ''F''                             ');
  cds.Open;

  gridFornecedores.SetFocus;
end;

procedure TfrmCadastroFornecedor.btnIncluirClick(Sender: TObject);
begin
  inherited;
  self.Tag := 1;
  pagFornecedores.ActivePageIndex := 0;
  gridFornecedores.SetFocus;
  pagFornecedores.ActivePageIndex := 1;
  limpaCampos;
  TabSheet2Enter(nil);
end;

procedure TfrmCadastroFornecedor.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not (cds.Active) or (cds.IsEmpty) then
    exit;

  self.Tag := 2;
  pagFornecedores.ActivePageIndex := 0;
  gridFornecedores.SetFocus;
  pagFornecedores.ActivePageIndex := 1;
end;

procedure TfrmCadastroFornecedor.mostraDados;
begin
  limpaCampos;
  edtCodigo.Text        := cdsCODIGO.AsString;
  edtRazao.text         := cdsRAZAO.AsString;
  edtNomeFantasia.Text  := cdsNOME_FANTASIA.AsString;
  CpfCnpj.pessoa        := cdsPESSOA.AsString;
  CpfCnpj.edtCpf.text   := cdsCPF_CNPJ.AsString;
  edtRg.text	          := cdsRG_IE.AsString;
  edtDtCad.text         := dateToStr(cdsDTCADASTRO.AsDateTime);
  edtLogradouro.text    := cdsLOGRADOURO.AsString;
  edtNumero.text	      := cdsNumero.AsString;
  edtBairro.text        := cdsBAIRRO.AsString;
  Cidade.codCid         := cdsCODCIDADE.AsString;
  edtCep.text 	        := cdsCEP.AsString;
  edtPais.text 	        := cdsPais.AsString;
  edtComplemento.text   := cdsCOMPLEMENTO.AsString;
  edtFone1.text         := cdsFONE1.AsString;
  edtFone2.text         := cdsFone2.AsString;
  edtFax.text 	        := cdsFAX.AsString;
  carregaEmails(cdsEmail.AsString);
  memObs.text 	        := cdsObservacao.AsString;

end;

procedure TfrmCadastroFornecedor.TabSheet2Enter(Sender: TObject);
begin
  inherited;

  if not pagFornecedores.Pages[1].Enabled then
    habilita(true);

  if (self.Tag <> 1) and not (cds.IsEmpty) then
      mostraDados;

  if not (self.Tag in [1,2]) then
    habilita(false)
  else begin
    habilita(true);
    edtRazao.SetFocus;
  end;

  if Rep = nil then begin
    Rep     := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
    Fornecedor := TPessoa.Create;
  end;

  if repEnd = nil then begin
    RepEnd   := TFabricaRepositorio.GetRepositorio(TEndereco.ClassName);
    Endereco := TEndereco.Create;
  end;
end;

procedure TfrmCadastroFornecedor.limpaCampos;
begin
  edtcodigo.Text := '0';
  edtRazao.Clear;
  edtNomeFantasia.Clear;
  CpfCnpj.comPessoa.itemIndex := 0;
  CpfCnpj.edtCpf.Clear;
  edtRg.Clear;
  edtDtCad.text := dateToStr(date);
  edtLogradouro.Clear;
  edtNumero.Clear;
  edtBairro.Clear;
  Cidade.edtCodCid.Clear;
  Cidade.edtCidade.Clear;
  Cidade.edtUf.Clear;
  edtCep.Clear;
  edtPais.Text := 'BRASIL';
  edtComplemento.Clear;
  edtFone1.Clear;
  edtFone2.Clear;
  edtFax.Clear;
  edtEmail.Clear;
  memObs.Clear;
  cdsEmails.EmptyDataSet;
end;

procedure TfrmCadastroFornecedor.btnCancelarClick(Sender: TObject);
begin
  inherited;
  pagFornecedores.ActivePageIndex := 0;
  self.Tag := 0;
  habilita(false);

  gridFornecedores.SetFocus;
  FreeAndNil(Fornecedor);
  FreeAndNil(Rep);
  FreeAndNil(Endereco);
  FreeAndNil(RepEnd);
end;

procedure TfrmCadastroFornecedor.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if verificaObrigatorios then
    salvar;
end;

function TfrmCadastroFornecedor.verificaObrigatorios: Boolean;
begin
  Result := false;

  if trim(edtRazao.Text) = '' then begin
    avisar('Favor informar o Nome / Razão social do Fornecedor');
    edtRazao.SetFocus;
  end
  else if trim(CpfCnpj.edtCpf.Text) = '' then begin
    avisar('Favor informar o CPF / CNPJ do Fornecedor');
    CpfCnpj.edtCpf.SetFocus;
  end
  else if trim(edtRG.Text) = '' then begin
    avisar('Favor informar o RG/ IE do Fornecedor');
    edtRG.SetFocus;
  end
  else if trim(edtLogradouro.Text) = '' then begin
    avisar('Endereço obrigatório! Favor informe o Logradouro');
    edtLogradouro.SetFocus;
  end
  else if trim(edtNumero.Text) = '' then begin
    avisar('Endereço obrigatório! Favor informe o número');
    edtNumero.SetFocus;
  end
  else if trim(edtBairro.Text) = '' then begin
    avisar('Endereço obrigatório! Favor informe o bairro');
    edtBairro.SetFocus;
  end
  else if trim(Cidade.edtCidade.Text) = '' then begin
    avisar('Endereço obrigatório! Favor informe a cidade');
    cidade.edtCodCid.SetFocus;
  end
  else if (trim(edtFone1.Text) = '(  )    -') and
          (trim(edtFone2.Text) = '(  )    -') and
          (trim(edtFax.Text)   = '(  )    -') then begin
    avisar('Favor informar ao menos um telefone para contato');
    edtFone1.SetFocus;
  end
  else
    result := true;
end;

procedure TfrmCadastroFornecedor.salvar;
begin
  if self.Tag = 2 then
    Fornecedor.Codigo := cdsCODIGO.asInteger;

 Fornecedor.Razao                := edtRazao.text;
 Fornecedor.NomeFantasia         := edtNomeFantasia.Text;
 Fornecedor.Pessoa               := copy(CpfCnpj.comPessoa.text,1,1);
 Fornecedor.CPF_CNPJ             := CpfCnpj.edtCpf.text;
 Fornecedor.RG_IE                := edtRg.text;
 Fornecedor.DtCadastro           := strToDate(edtDtCad.text);
 Fornecedor.Fone1                := edtFone1.text;
 Fornecedor.Fone2                := edtFone2.text;
 Fornecedor.Fax                  := edtFax.text;
 Fornecedor.Email                := concatenaEmails;
 Fornecedor.Observacao           := memObs.text;
 Fornecedor.Tipo                 := 'F';

 Rep.Salvar(Fornecedor);

 if self.Tag = 2 then
    Endereco.Codigo := cdsCODIGO_1.asInteger;

 Endereco.CodPessoa   := Fornecedor.Codigo;
 Endereco.Logradouro  := edtLogradouro.text;
 Endereco.Numero      := edtNumero.text;
 Endereco.Bairro      := edtBairro.text;
 Endereco.CodCidade   := StrToInt(Cidade.edtCodCid.text);
 Endereco.CEP         := edtCep.text;
 Endereco.Pais        := edtPais.text;
 Endereco.Complemento := edtComplemento.text;

 RepEnd.Salvar(Endereco);

 btnCancelar.Click;

 avisar('Operação realizada com sucesso!');

 cds.Close;
 cds.Open;
end;

procedure TfrmCadastroFornecedor.TabSheet1Exit(Sender: TObject);
begin
  inherited;
  TabSheet2Enter(nil);

  if self.Tag in [1,2]  then  edtRazao.SetFocus;
end;

procedure TfrmCadastroFornecedor.cdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (self.Tag = 2) and (cdsCODIGO.AsString <> edtCodigo.Text) then
    if confirma('Cancelar alteração do Fornecedor '+edtCodigo.Text+' - '+ edtRazao.Text+'?') then
      btnCancelar.Click
    else begin
      cds.Locate('CODIGO', edtCodigo.Text, []);
      pagFornecedores.ActivePageIndex := 1;
    end;
end;

procedure TfrmCadastroFornecedor.gridFornecedoresTitleClick(Column: TColumn);
begin
  inherited;
  if (self.Tag = 2) and (cdsCODIGO.AsString <> edtCodigo.Text) then
    if confirma('Cancelar alteração do Fornecedor '+edtCodigo.Text+' - '+ edtRazao.Text+'?') then
      btnCancelar.Click
    else begin
      cds.Locate('CODIGO', edtCodigo.Text, []);
      pagFornecedores.ActivePageIndex := 1;
    end;
end;

procedure TfrmCadastroFornecedor.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_F1 then
    pagFornecedores.ActivePageIndex := 0
  else if key = VK_F2 then
    pagFornecedores.ActivePageIndex := 1
  else if (key = VK_F3)and(btnIncluir.Enabled) then
    btnIncluir.Click
  else if (key = VK_F4)and(btnAlterar.Enabled) then
    btnAlterar.Click;
end;

procedure TfrmCadastroFornecedor.habilita(SN: boolean);
begin
  if SN then begin
    btnIncluir.Enabled  := false;
    btnAlterar.Enabled  := false;
    btnSalvar.Enabled   := true;
    btnCancelar.Enabled := true;
    pagFornecedores.Pages[1].Enabled := true;
  end
  else begin
    btnIncluir.Enabled  := true;
    btnAlterar.Enabled  := true;
    btnSalvar.Enabled   := false;
    btnCancelar.Enabled := false;
    pagFornecedores.Pages[1].Enabled := false;
  end;
end;

procedure TfrmCadastroFornecedor.addEmail;
begin
  cdsEmails.Post;
end;

procedure TfrmCadastroFornecedor.carregaEmails(emails: String);
begin
  while emails <> '' do begin
    cdsEmails.Append;
    cdsEmailsEMAIL.AsString := copy( emails, 1, ( pos( ';', emails ) -1 ) );
    cdsEmails.Post;

    emails := trim( copy( emails, (pos(';',emails) +1), length(emails) ) );
  end;
end;

function TfrmCadastroFornecedor.concatenaEmails: String;
begin
  Result := '';

  if not (cdsEmails.Active) or (cdsEmails.IsEmpty) then
    exit;

  cdsEmails.First;
  while not cdsEmails.Eof do begin
    Result := Result + cdsEmailsEMAIL.AsString + ';';

    cdsemails.Next;
  end;
end;

procedure TfrmCadastroFornecedor.DBGrid1DblClick(Sender: TObject);
begin
  if not (cdsEmails.Active) or (cdsEmails.IsEmpty) then   exit;
  cdsEmails.Edit;
  edtemail.SetFocus;
end;

procedure TfrmCadastroFornecedor.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not (cdsEmails.Active) or (cdsEmails.IsEmpty) then
    exit;
    
  if key = vk_delete then
    if confirma('Deseja realmente remover e-mail selecionado?') then
      cdsEmails.Delete;
end;

procedure TfrmCadastroFornecedor.edtEmailEnter(Sender: TObject);
begin
  if not (cdsEmails.State in [dsEdit, dsInsert]) then
    cdsEmails.Append;
end;

procedure TfrmCadastroFornecedor.edtEmailExit(Sender: TObject);
begin
  if length(edtEmail.text) > 5 then
    addEmail
  else
    edtEmail.SetFocus;
end;

procedure TfrmCadastroFornecedor.TabSheet2Exit(Sender: TObject);
begin
  if cdsEmails.State in [dsInsert] then
    cdsEmails.Cancel;
end;

end.
