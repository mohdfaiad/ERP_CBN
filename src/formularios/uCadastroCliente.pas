unit uCadastroCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, uPadrao,
  frameBuscaCidade, Provider, DB, DBClient, Grids, DBGrids, DBGridCBN, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, Mask, Repositorio, StrUtils, Endereco,
  frameListaCampo, Cliente, ImgList, Cliente_Representante,
  frameMaskCpfCnpj, DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, frameFone, StringUtilitario;

type
  TfrmCadastroCliente = class(TfrmPadrao)
    panBotoes: TPanel;
    pagClientes: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    gridClientes: TDBGridCBN;
    ds: TDataSource;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
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
    edtCodigo: TEdit;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    ListaTabelaPreco: TListaCampo;
    GroupBox4: TGroupBox;
    ListaFormaPagamento: TListaCampo;
    btnSalvar: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Label17: TLabel;
    Label18: TLabel;
    ImageList1: TImageList;
    btnBloquear: TSpeedButton;
    GroupBox5: TGroupBox;
    ListaRepresentante: TListaCampo;
    GroupBox6: TGroupBox;
    ListaTransportadora: TListaCampo;
    CpfCnpj: TMaskCpfCnpj;
    GroupBox7: TGroupBox;
    Label15: TLabel;
    DBGrid1: TDBGrid;
    cdsEmails: TClientDataSet;
    dsEmails: TDataSource;
    cdsEmailsEMAIL: TStringField;
    Label2: TLabel;
    Label3: TLabel;
    edtEmail: TDBEdit;
    GroupBox8: TGroupBox;
    memObs: TMemo;
    lblAsterisco: TLabel;
    lblCamposObrigatorios: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    cbxFuncionario: TComboBox;
    Label24: TLabel;
    btnCancelar: TSpeedButton;
    Label25: TLabel;
    Image3: TImage;
    btnAddPendencia: TSpeedButton;
    edtCodigoEndereco: TEdit;
    qry: TFDQuery;
    Fone1: TFone;
    Fone2: TFone;
    FoneFax: TFone;
    cdsCODIGO: TIntegerField;
    cdsRAZAO: TStringField;
    cdsPESSOA: TStringField;
    cdsTIPO: TStringField;
    cdsCPF_CNPJ: TStringField;
    cdsRG_IE: TStringField;
    cdsDTCADASTRO: TDateField;
    cdsFONE1: TStringField;
    cdsFONE2: TStringField;
    cdsFAX: TStringField;
    cdsEMAIL: TStringField;
    cdsOBSERVACAO: TStringField;
    cdsBLOQUEADO: TStringField;
    cdsNOME_FANTASIA: TStringField;
    cdsCODIGO_1: TIntegerField;
    cdsCODPESSOA: TIntegerField;
    cdsLOGRADOURO: TStringField;
    cdsNUMERO: TStringField;
    cdsBAIRRO: TStringField;
    cdsCODCIDADE: TIntegerField;
    cdsCEP: TStringField;
    cdsPAIS: TStringField;
    cdsCOMPLEMENTO: TStringField;
    cdsCODCLI: TIntegerField;
    cdsCODTABELAPRECO: TIntegerField;
    cdsCODFORMASPGTO: TIntegerField;
    cdsCODTRANSPORTADORA: TIntegerField;
    cdsFUNCIONARIO: TStringField;
    cdsCODREPRESENTANTE: TIntegerField;
    cdsMOTIVO_BLOQUEIO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure gridClientesTitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridClientesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnBloquearClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEmailEnter(Sender: TObject);
    procedure TabSheet2Exit(Sender: TObject);
    procedure edtEmailExit(Sender: TObject);
    procedure btnAddPendenciaClick(Sender: TObject);
    procedure gridClientesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridClientesCellClick(Column: TColumn);

  private
    FModoBusca :Boolean;
    registroFocado :integer;

    procedure salvar;
    procedure mostraDados;
    procedure limpaCampos;
    function verificaObrigatorios :Boolean;
    procedure habilita(SN :boolean);
    procedure addEmail;
    procedure carregaEmails(emails :String);
    function concatenaEmails :String;

  public
    constructor Create(AOwner :TComponent);       override;
    constructor CreateBusca(AOwner :TComponent);  overload;
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

uses
  FabricaRepositorio, Math;

{$R *.dfm}

procedure TfrmCadastroCliente.FormShow(Sender: TObject);
begin
  inherited;
  pagClientes.ActivePageIndex := 0;
  cdsEmails.CreateDataSet;

  cds.Close;
  qry.SQL.Text := 'select c.codigo codcli, c.codtabelapreco, c.codformaspgto, c.codtransportadora, '+
                  ' c.funcionario, c.codrepresentante, c.bloqueado, c.motivo_bloqueio,   '+
                  ' p.*, e.*                                                             '+
                  ' from pessoas p                                                       '+
                  ' inner join clientes c on c.codcli = p.codigo                         '+
                  ' inner join enderecos e on e.codpessoa = p.codigo                     ';

  cds.Open;

  gridClientes.SetFocus;

  ListaTabelaPreco.setValores('select * from tabelas_preco', 'descricao','Tabelas de Preço');
  ListaTabelaPreco.executa;
  ListaFormaPagamento.setValores('select * from formas_pgto', 'descricao', 'Formas de Pagamento');
  ListaFormaPagamento.executa;
  ListaRepresentante.setValores('select codigo, razao from pessoas where tipo = ''R''', 'razao', 'Representante associado');
  ListaRepresentante.executa;
  ListaTransportadora.setValores('select codigo, razao from pessoas where tipo = ''T''', 'razao', 'Transportadora associada');
  ListaTransportadora.executa;
end;

procedure TfrmCadastroCliente.btnIncluirClick(Sender: TObject);
begin
  inherited;
  self.Tag := 1;
  limpaCampos;
  pagClientes.ActivePageIndex := 0;
  gridClientes.SetFocus;
  pagClientes.ActivePageIndex := 1;
end;

procedure TfrmCadastroCliente.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not (cds.Active) or (cds.IsEmpty) then
    exit;

  cds.AfterScroll := nil;
  self.Tag := 2;
  pagClientes.ActivePageIndex := 0;
  gridClientes.SetFocus;
  pagClientes.ActivePageIndex := 1;
  cds.AfterScroll := cdsAfterScroll;
end;

procedure TfrmCadastroCliente.mostraDados;
begin
  limpaCampos;
  edtCodigo.Text           := cdsCODIGO.AsString;
  edtRazao.text            := cdsRAZAO.AsString;
  CpfCnpj.pessoa           := cdsPESSOA.AsString;
  CpfCnpj.edtCpf.text      := cdsCPF_CNPJ.AsString;
  edtRg.text	             := cdsRG_IE.AsString;
  edtDtCad.text            := dateToStr(cdsDTCADASTRO.AsDateTime);
  edtLogradouro.text       := cdsLOGRADOURO.AsString;
  edtNumero.text	         := cdsNumero.AsString;
  edtBairro.text           := cdsBAIRRO.AsString;
  Cidade.codCid            := cdsCODCIDADE.AsString;
  edtCep.text 	           := cdsCEP.AsString;
  edtPais.text 	           := cdsPais.AsString;
  edtComplemento.text      := cdsCOMPLEMENTO.AsString;
  Fone1.Fone               := cdsFONE1.AsString;
  Fone2.Fone               := cdsFone2.AsString;
  FoneFax.Fone 	           := cdsFAX.AsString;
  cbxFuncionario.ItemIndex := IfThen(cdsFUNCIONARIO.AsString = 'S', 0, 1);
  edtCodigoEndereco.Text   := cdsCODIGO_1.AsString;
  carregaEmails(cdsEmail.AsString);

  memObs.text 	        := cdsObservacao.AsString;
  registroFocado        := cds.RecNo;

end;

procedure TfrmCadastroCliente.TabSheet2Enter(Sender: TObject);
begin
  inherited;

  if not pagClientes.Pages[1].Enabled then
    habilita(true);

  if (self.Tag <> 1) and not (cds.IsEmpty) then
      mostraDados;

  if not (self.Tag in [1,2]) then
    habilita(false)
  else
    habilita(true);
end;

procedure TfrmCadastroCliente.limpaCampos;
begin
  edtcodigo.Text := '0';
  edtRazao.Clear;
  CpfCnpj.setPadrao;
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
  Fone1.Limpa;
  Fone2.limpa;
  FoneFax.limpa;
  cdsEmails.EmptyDataSet;
  memObs.Clear;
  cbxFuncionario.ItemIndex := -1;
  edtCodigoEndereco.Text := '0';
end;

procedure TfrmCadastroCliente.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpaCampos;
  pagClientes.ActivePageIndex := 0;
  self.Tag := 0;
  habilita(false);
  gridClientes.SetFocus;
end;

procedure TfrmCadastroCliente.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if verificaObrigatorios then
    salvar;
end;

function TfrmCadastroCliente.verificaObrigatorios: Boolean;
begin
  Result := False;
  pagClientes.ActivePageIndex := 1;

  if trim(edtRazao.Text) = '' then begin
    avisar('Favor informar o Nome / Razão social do cliente');
    edtRazao.SetFocus;
  end
  else if trim(CpfCnpj.edtCpf.Text) = '' then begin
    avisar('Favor informar o CPF / CNPJ do cliente');
    CpfCnpj.edtCpf.SetFocus;
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
  else if (StringReplace(trim(Fone1.edtFone.Text),' ','',[rfReplaceAll]) = '()-') and
          (StringReplace(trim(Fone2.edtFone.Text),' ','',[rfReplaceAll]) = '()-') and
          (StringReplace(trim(FoneFax.edtFone.Text),' ','',[rfReplaceAll]) = '()-') then begin
    avisar('Favor informar ao menos um telefone para contato');
    Fone1.edtFone.SetFocus;
  end
  else
    result := True;
end;

procedure TfrmCadastroCliente.salvar;
var
  Cliente :TCliente;
  repositorio :TRepositorio;
begin
  Cliente               := nil;
  repositorio           := nil;
 try
    repositorio  := TFabricaRepositorio.GetRepositorio(TCliente.ClassName);
    Cliente      := TCliente(repositorio.Get( StrToInt(edtCodigo.Text)) );

    if not assigned(Cliente) then
      Cliente := TCliente.Create;

    Cliente.Razao                := edtRazao.text;
    Cliente.Pessoa               := copy(CpfCnpj.comPessoa.text,1,1);
    Cliente.CPF_CNPJ             := CpfCnpj.edtCpf.text;
    Cliente.RG_IE                := edtRg.text;
    Cliente.DtCadastro           := strToDate(edtDtCad.text);
    Cliente.Fone1                := Fone1.edtFone.text;
    Cliente.Fone2                := Fone2.edtFone.text;
    Cliente.Fax                  := FoneFax.edtFone.Text;
    Cliente.Email                := concatenaEmails;
    Cliente.Observacao           := memObs.text;
    Cliente.Tipo                 := 'C';
    Cliente.Funcionario          := (cbxFuncionario.ItemIndex = 0);

    if (ListaTabelaPreco.comListaCampo.Text <> '') then
      Cliente.CodTabelaPreco    := ListaTabelaPreco.CodCampo;

    if (ListaFormaPagamento.comListaCampo.Text <> '') then
      Cliente.CodFormasPgto     := ListaFormaPagamento.CodCampo;

    if (ListaTransportadora.comListaCampo.Text <> '') then
      Cliente.CodTransportadora := ListaTransportadora.CodCampo;

    if not assigned(Cliente.Endereco) then
      Cliente.Endereco := TEndereco.Create;

    if (ListaRepresentante.comListaCampo.Text <> '') then
      Cliente.CodRepresentante := ListaRepresentante.CodCampo;

    Cliente.Endereco.Logradouro  := TRIM(edtLogradouro.text);
    Cliente.Endereco.Numero      := TRIM(edtNumero.text);
    Cliente.Endereco.Bairro      := TRIM(edtBairro.text);
    Cliente.Endereco.CodCidade   := StrToInt(Cidade.edtCodCid.text);
    Cliente.Endereco.CEP         := edtCep.text;
    Cliente.Endereco.Pais        := edtPais.text;
    Cliente.Endereco.Complemento := TRIM(edtComplemento.text);

    repositorio.Salvar(Cliente);
    btnCancelar.Click;
    cds.Close;
    cds.Open;
    cds.RecNo := registroFocado;

    avisar('Operação realizada com sucesso!');
 Finally
   FreeAndNil(Cliente);
   FreeAndNil(repositorio);
 end;
end;

procedure TfrmCadastroCliente.TabSheet1Exit(Sender: TObject);
begin
  inherited;
  TabSheet2Enter(nil);

  if (self.Tag in [1,2]) and (pagClientes.ActivePageIndex = 1) then  edtRazao.SetFocus;

  if (cdsCODTABELAPRECO.AsInteger > 0) and (self.Tag in [0,2]) then
    ListaTabelaPreco.CodCampo := cdsCODTABELAPRECO.AsInteger
  else
    ListaTabelaPreco.CodCampo := 0;

  if (cdsCODFORMASPGTO.AsInteger > 0) and (self.Tag in [0,2]) then
    ListaFormaPagamento.CodCampo := cdsCODFORMASPGTO.AsInteger
  else
    ListaFormaPagamento.CodCampo := 0;

  if (cdsCODTRANSPORTADORA.AsInteger > 0) and (self.Tag in [0,2]) then
    ListaTransportadora.CodCampo := cdsCODTRANSPORTADORA.AsInteger
  else
    ListaTransportadora.CodCampo := 0;

  if (cdsCODREPRESENTANTE.AsInteger > 0) and (self.Tag in [0,2]) then
    ListaRepresentante.CodCampo := cdsCODREPRESENTANTE.AsInteger
  else
    ListaRepresentante.CodCampo := 0;

end;

procedure TfrmCadastroCliente.cdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (self.Tag = 2) and (cdsCODIGO.AsString <> edtCodigo.Text) then
    if confirma('Cancelar alteração do cliente '+edtCodigo.Text+' - '+ edtRazao.Text+'?') then
      btnCancelar.Click
    else begin
      cds.Locate('CODIGO', edtCodigo.Text, []);
      pagClientes.ActivePageIndex := 1;
    end;

  btnAddPendencia.Enabled := not (cdsBLOQUEADO.AsString = 'B') and not FModoBusca;

  if cdsBLOQUEADO.AsString = 'B' then
  begin
    btnBloquear.Caption := 'Desbloquear';
    btnAddPendencia.Caption := 'Criar Pendência';
  end
  else if cdsBLOQUEADO.AsString = 'P' then
  begin
    btnAddPendencia.Caption := 'Retirar Pendência';
    btnBloquear.Caption := 'Bloquear';
  end
  else
  begin
    btnBloquear.Caption := 'Bloquear';
    btnAddPendencia.Caption := 'Criar Pendência';
  end;
end;

procedure TfrmCadastroCliente.gridClientesTitleClick(Column: TColumn);
begin
  inherited;
  if (self.Tag = 2) and (cdsCODIGO.AsString <> edtCodigo.Text) then
    if confirma('Cancelar alteração do cliente '+edtCodigo.Text+' - '+ edtRazao.Text+'?') then
      btnCancelar.Click
    else begin
      cds.Locate('CODIGO', edtCodigo.Text, []);
      pagClientes.ActivePageIndex := 1;
    end;
end;

procedure TfrmCadastroCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) and (self.ActiveControl = memObs) then
  begin
   // memObs.lines.Add('');
    key := 0;
  end;

  inherited;
  if key = VK_F1 then
    pagClientes.ActivePageIndex := 0
  else if key = VK_F2 then
    pagClientes.ActivePageIndex := 1
  else if (key = VK_F3)and(btnIncluir.Enabled) then
    btnIncluir.Click
  else if (key = VK_F4)and(btnAlterar.Enabled) then
    btnAlterar.Click
  else if (key = VK_F5) then
    pagClientes.ActivePageIndex := 2;
end;

procedure TfrmCadastroCliente.habilita(SN: boolean);
begin
  if FModoBusca then
    exit;

  if SN then begin
    btnIncluir.Enabled  := false;
    btnAlterar.Enabled  := false;
    btnSalvar.Enabled   := true;
    btnCancelar.Enabled := true;
    pagClientes.Pages[1].Enabled := true;
    pagClientes.Pages[2].Enabled := true;
  end
  else begin
    btnIncluir.Enabled  := true;
    btnAlterar.Enabled  := true;
    btnSalvar.Enabled   := false;
    btnCancelar.Enabled := false;
    pagClientes.Pages[1].Enabled := false;
    pagClientes.Pages[2].Enabled := false;
  end;
end;

procedure TfrmCadastroCliente.gridClientesCellClick(Column: TColumn);
begin
  if (Column.FieldName = 'BLOQUEADO') and (pos(cdsBLOQUEADO.Text,'P,B') > 0) then
    avisar(IfThen(cdsBLOQUEADO.Text = 'B','Motivo Bloqueio: ', 'Pendência: ')+cdsMOTIVO_BLOQUEIO.AsString);
end;

procedure TfrmCadastroCliente.gridClientesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsBLOQUEADO then begin
    TDBGridCBN(Sender).Canvas.FillRect(Rect);

    if cdsBLOQUEADO.asString = 'B' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +12, Rect.Top , 1, true)
    else if cdsBLOQUEADO.asString = 'P' then
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +12, Rect.Top , 2, true)
    else
      ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +12, Rect.Top , 0, true);
  end;
end;

procedure TfrmCadastroCliente.gridClientesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) and FModoBusca then
  begin
    Key := 0;
    self.ModalResult := mrOk;
  end
  else
    inherited;
end;

procedure TfrmCadastroCliente.btnBloquearClick(Sender: TObject);
var
  Cliente :TCliente;
  repositorio :TRepositorio;
  motivo :String;
begin
 try
    repositorio  := TFabricaRepositorio.GetRepositorio(TCliente.ClassName);
    Cliente      := TCliente(repositorio.Get( cdsCODIGO.AsInteger) );

    Cliente.bloqueado  := IfThen(Cliente.bloqueado = 'B', 'N', 'B');

    if Cliente.Bloqueado = 'N' then
      Cliente.motivoBloqueio := ''
    else
    begin
      if Cliente.motivoBloqueio <> '' then
      begin
        if not confirma('"'+Cliente.motivoBloqueio+'"'+#13#10+'É o motivo de bloqueio do cliente?') then
          Cliente.motivoBloqueio := UPPERCASE(chamaInput('TEXT','Motivo do bloqueio'));
      end
      else
        Cliente.motivoBloqueio := UPPERCASE(chamaInput('TEXT','Motivo do bloqueio'));
        
      if length(Cliente.motivoBloqueio) < 6 then
      begin
        avisar('Motivo de bloqueio inválido ou não informado. Operação abortada.');
        exit;
      end;
    end;

    repositorio.Salvar(Cliente);

    cds.Edit;
    cdsBLOQUEADO.AsString := Cliente.bloqueado;
    cds.Post;

    if cdsBLOQUEADO.AsString = 'N' then
      avisar('Cliente '+ cdsRAZAO.AsString +' foi desbloqueado!')
    else
      avisar('Cliente '+ cdsRAZAO.AsString +' foi bloqueado!');

    cdsAfterScroll(nil);

 Finally
   FreeAndNil(Cliente);
   FreeAndNil(repositorio);
 end;
end;

procedure TfrmCadastroCliente.addEmail;
begin
  cdsEmails.Post;
end;

procedure TfrmCadastroCliente.DBGrid1DblClick(Sender: TObject);
begin
  if not (cdsEmails.Active) or (cdsEmails.IsEmpty) then   exit;
  cdsEmails.Edit;
  edtemail.SetFocus;
end;

procedure TfrmCadastroCliente.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not (cdsEmails.Active) or (cdsEmails.IsEmpty) then
    exit;
    
  if key = vk_delete then
    if confirma('Deseja realmente remover e-mail selecionado?') then
      cdsEmails.Delete;
end;

procedure TfrmCadastroCliente.carregaEmails(emails: String);
var email :String;
begin
  while emails <> '' do begin
    if pos(';', emails) > 0 then
    begin
      email := copy( emails, 1, ( pos( ';', emails ) -1 ) );
      emails := trim( copy( emails, (pos(';',emails) +1), length(emails) ) );
    end
    else
    begin
      email  := emails;
      emails := '';
    end;

    cdsEmails.Append;
    cdsEmailsEMAIL.AsString := email;
    cdsEmails.Post;
  end;
end;

function TfrmCadastroCliente.concatenaEmails: String;
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

constructor TfrmCadastroCliente.Create(AOwner: TComponent);
begin
  inherited;
end;

constructor TfrmCadastroCliente.CreateBusca(AOwner: TComponent);
begin
  self.Create(AOwner);
  btnIncluir.Enabled      := false;
  btnAlterar.Enabled      := false;
  btnBloquear.Enabled     := false;
  btnAddPendencia.Enabled := false;
  FModoBusca              := true;
  panBotoes.Visible       := false;
  self.Caption            := 'Selecione o cliente desejado e tecle <ENTER>';
end;

procedure TfrmCadastroCliente.edtEmailEnter(Sender: TObject);
begin
  if not (cdsEmails.State in [dsEdit, dsInsert]) then
    cdsEmails.Append;
end;

procedure TfrmCadastroCliente.TabSheet2Exit(Sender: TObject);
begin
  if cdsEmails.State in [dsInsert] then
    cdsEmails.Cancel;
end;

procedure TfrmCadastroCliente.edtEmailExit(Sender: TObject);
begin
  if length(edtEmail.text) > 5 then
    addEmail;
end;

procedure TfrmCadastroCliente.btnAddPendenciaClick(Sender: TObject);
var
  Cliente :TCliente;
  repositorio :TRepositorio;
  motivo :String;
begin
 try
    repositorio  := TFabricaRepositorio.GetRepositorio(TCliente.ClassName);
    Cliente      := TCliente(repositorio.Get( cdsCODIGO.AsInteger) );

    Cliente.Bloqueado  := IfThen(Cliente.Bloqueado = 'P', 'N', 'P');

    if Cliente.Bloqueado = 'N' then
      Cliente.motivoBloqueio := ''
    else
    begin
      Cliente.motivoBloqueio := chamaInput('TEXT','Informe a pendência do cliente');

      if length(Cliente.motivoBloqueio) < 6 then
      begin
        avisar('Pendência inválida ou não informada. Operação abortada.');
        exit;
      end;
    end;

    repositorio.Salvar(Cliente);

    cds.Edit;
    cdsBLOQUEADO.AsString := Cliente.Bloqueado;
    cds.Post;

    if cdsBLOQUEADO.AsString = 'N' then
      avisar('Pendência retirada!')
    else
      avisar('Pendência Criada!');

    cdsAfterScroll(nil);
 Finally
   FreeAndNil(Cliente);
   FreeAndNil(repositorio);
 end;
end;

end.
