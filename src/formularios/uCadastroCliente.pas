unit uCadastroCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, uPadrao,
  frameBuscaCidade, Provider, DB, DBClient, Grids, DBGrids, DBGridCBN, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, Mask, Pessoa, Repositorio, StrUtils, Endereco,
  frameListaCampo, Cliente, ImgList, Cliente_Representante,
  frameMaskCpfCnpj, DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList;

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
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtFone1: TMaskEdit;
    edtFone2: TMaskEdit;
    edtFax: TMaskEdit;
    edtCodigo: TEdit;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    ListaTabelaPreco: TListaCampo;
    GroupBox4: TGroupBox;
    ListaFormaPagamento: TListaCampo;
    btnSalvar: TBitBtn;
    cdsCODIGO: TIntegerField;
    cdsPESSOA: TStringField;
    cdsTIPO: TStringField;
    cdsCPF_CNPJ: TStringField;
    cdsRG_IE: TStringField;
    cdsDTCADASTRO: TDateField;
    cdsFONE1: TStringField;
    cdsFONE2: TStringField;
    cdsFAX: TStringField;
    cdsOBSERVACAO: TStringField;
    cdsBLOQUEADO: TStringField;
    cdsMOTIVO_BLOQ: TStringField;
    cdsCODTABELAPRECO: TIntegerField;
    cdsCODFORMASPGTO: TIntegerField;
    cdsCODIGO2: TIntegerField;
    cdsCODIGO_1: TIntegerField;
    cdsCODPESSOA: TIntegerField;
    cdsLOGRADOURO: TStringField;
    cdsBAIRRO: TStringField;
    cdsCODCIDADE: TIntegerField;
    cdsCEP: TStringField;
    cdsPAIS: TStringField;
    cdsCOMPLEMENTO: TStringField;
    Image1: TImage;
    Image2: TImage;
    Label17: TLabel;
    Label18: TLabel;
    ImageList1: TImageList;
    btnBloquear: TSpeedButton;
    GroupBox5: TGroupBox;
    ListaRepresentante: TListaCampo;
    cdsCODREP: TIntegerField;
    cdsCODIGO3: TIntegerField;
    GroupBox6: TGroupBox;
    ListaTransportadora: TListaCampo;
    cdsCODTRANSPORTADORA: TIntegerField;
    CpfCnpj: TMaskCpfCnpj;
    cdsNUMERO: TStringField;
    cdsRAZAO: TStringField;
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
    cdsEMAIL: TStringField;
    lblAsterisco: TLabel;
    lblCamposObrigatorios: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    cdsCODCLI: TIntegerField;
    cbxFuncionario: TComboBox;
    Label24: TLabel;
    cdsFUNCIONARIO: TStringField;
    btnCancelar: TSpeedButton;
    Label25: TLabel;
    Image3: TImage;
    btnAddPendencia: TSpeedButton;
    edtCodigoEndereco: TEdit;
    qry: TFDQuery;
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

  private
    procedure salvar;
    procedure mostraDados;
    procedure limpaCampos;
    function verificaObrigatorios :Boolean;
    procedure habilita(SN :boolean);
    procedure addEmail;
    procedure carregaEmails(emails :String);
    function concatenaEmails :String;

  public
    { Public declarations }
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
  qry.SQL.Text := 'select p.*, e.*, p.codigo codcli, c.codtabelapreco, c.codformaspgto, c.codtransportadora,  '+
                      'c.codigo as codigo2, cr.codigo as codigo3, c.funcionario,                                  '+
                      '(select codigo codrep from pessoas where codigo = cr.cod_representante) from pessoas p     '+
                      'inner join clientes c on c.codcli = p.codigo                                               '+
                      'inner join enderecos e on e.codpessoa = p.codigo                                           '+
                      'left join cliente_representante cr on cr.cod_cliente = p.codigo                            ';

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

  self.Tag := 2;
  pagClientes.ActivePageIndex := 0;
  gridClientes.SetFocus;
  pagClientes.ActivePageIndex := 1;
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
  edtFone1.text            := cdsFONE1.AsString;
  edtFone2.text            := cdsFone2.AsString;
  edtFax.text 	           := cdsFAX.AsString;
  cbxFuncionario.ItemIndex := IfThen(cdsFUNCIONARIO.AsString = 'S', 0, 1);
  edtCodigoEndereco.Text   := cdsCODIGO_1.AsString;
  carregaEmails(cdsEmail.AsString);

  memObs.text 	        := cdsObservacao.AsString;

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
  edtFone1.Clear;
  edtFone2.Clear;
  edtFax.Clear;
  cdsEmails.EmptyDataSet;
  memObs.Clear;
  cbxFuncionario.ItemIndex := -1;
  edtCodigoEndereco.Text := '0';
  edtCodigoEndereco.Text   := '0';
end;

procedure TfrmCadastroCliente.btnCancelarClick(Sender: TObject);
begin
  inherited;
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
{  else if trim(edtRg.Text) = '' then begin
    avisar('Favor informar o RG / IE do cliente');
    edtRG.SetFocus;
  end}
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
    result := True;
end;

procedure TfrmCadastroCliente.salvar;
var
  Cliente :TPessoa;
  EspecificoCliente :TCliente;
  Endereco :TEndereco;
  Cliente_Representante :TCliente_Representante;
  repositorio :TRepositorio;
begin
  Cliente               := nil;
  EspecificoCliente     := nil;
  Endereco              := nil;
  Cliente_Representante := nil;
  repositorio           := nil;
 try

    repositorio  := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
    Cliente      := TPessoa(repositorio.Get( StrToInt(edtCodigo.Text)) );

    if not assigned(Cliente) then
      Cliente := TPessoa.Create;

    Cliente.Razao                := edtRazao.text;
    Cliente.Pessoa               := copy(CpfCnpj.comPessoa.text,1,1);
    Cliente.CPF_CNPJ             := CpfCnpj.edtCpf.text;
    Cliente.RG_IE                := edtRg.text;
    Cliente.DtCadastro           := strToDate(edtDtCad.text);
    Cliente.Fone1                := edtFone1.text;
    Cliente.Fone2                := edtFone2.text;
    Cliente.Fax                  := edtFax.text;
    Cliente.Email                := concatenaEmails;
    Cliente.Observacao           := memObs.text;
    Cliente.Tipo                 := 'C';

    repositorio.Salvar(Cliente);

    repositorio   := TFabricaRepositorio.GetRepositorio(TEndereco.ClassName);
    Endereco      := TEndereco(repositorio.Get( StrToInt(edtCodigoEndereco.Text) ));

    if not assigned(Endereco) then
      Endereco := TEndereco.Create;

    Endereco.CodPessoa   := Cliente.Codigo;
    Endereco.Logradouro  := TRIM(edtLogradouro.text);
    Endereco.Numero      := TRIM(edtNumero.text);
    Endereco.Bairro      := TRIM(edtBairro.text);
    Endereco.CodCidade   := StrToInt(Cidade.edtCodCid.text);
    Endereco.CEP         := edtCep.text;
    Endereco.Pais        := edtPais.text;
    Endereco.Complemento := TRIM(edtComplemento.text);

    repositorio.Salvar(Endereco);

    { Salva dados específicos dos clientes }

    repositorio       := TFabricaRepositorio.GetRepositorio(TCliente.ClassName);
    EspecificoCliente := TCliente.Create;

    if (self.Tag = 2) and repositorio.GetExiste('codcli',Cliente.codigo) then
      EspecificoCliente.Codigo := cdsCODIGO2.AsInteger;

    EspecificoCliente.CodCli         := Cliente.codigo;
    EspecificoCliente.Funcionario    := (cbxFuncionario.ItemIndex = 0);

    if (ListaTabelaPreco.comListaCampo.Text <> '') then
      EspecificoCliente.CodTabelaPreco := ListaTabelaPreco.CodCampo;

    if (ListaFormaPagamento.comListaCampo.Text <> '') then
      EspecificoCliente.CodFormasPgto  := ListaFormaPagamento.CodCampo;

    if (ListaTransportadora.comListaCampo.Text <> '') then
      EspecificoCliente.CodTransportadora := ListaTransportadora.CodCampo;

    repositorio.Salvar(EspecificoCliente);

    { Salva representante associado }

    if (ListaRepresentante.comListaCampo.Text <> '') then begin
      repositorio           := TFabricaRepositorio.GetRepositorio(TCliente_Representante.ClassName);
      Cliente_Representante := TCliente_Representante.Create;

      if (self.Tag = 2) and repositorio.GetExiste('cod_cliente',Cliente.codigo) then
        Cliente_Representante.Codigo := cdsCODIGO3.AsInteger;

      Cliente_Representante.cod_cliente := Cliente.codigo;

      if (ListaRepresentante.comListaCampo.Text <> '') then
        Cliente_Representante.cod_representante := ListaRepresentante.CodCampo;

      repositorio.Salvar(Cliente_Representante);
    end;

    btnCancelar.Click;

    cds.Close;
    cds.Open;

    avisar('Operação realizada com sucesso!');

 Finally
   FreeAndNil(Cliente);
   FreeAndNil(repositorio);
   FreeAndNil(Endereco);
   FreeAndNil(EspecificoCliente);
   FreeAndNil(Cliente_Representante);
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

  if (cdsCODREP.AsInteger > 0) and (self.Tag in [0,2]) then
    ListaRepresentante.CodCampo := cdsCODREP.AsInteger
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

  btnAddPendencia.Enabled := not (cdsBLOQUEADO.AsString = 'B');

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

procedure TfrmCadastroCliente.btnBloquearClick(Sender: TObject);
var
  Cliente :TPessoa;
  repositorio :TRepositorio;
  motivo :String;
begin
 try
    repositorio  := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
    Cliente      := TPessoa(repositorio.Get( cdsCODIGO.AsInteger) );

    Cliente.Bloqueado  := IfThen(Cliente.Bloqueado = 'B', 'N', 'B');

    if Cliente.Bloqueado = 'N' then
      Cliente.MotivoBloq := ''
    else
    begin
      if Cliente.MotivoBloq <> '' then
      begin
        if not confirma('"'+Cliente.MotivoBloq+'"'+#13#10+'É o motivo de bloqueio do cliente?') then
          Cliente.MotivoBloq := UPPERCASE(chamaInput('TEXT','Motivo do bloqueio'));
      end
      else
        Cliente.MotivoBloq := UPPERCASE(chamaInput('TEXT','Motivo do bloqueio'));
        
      if length(Cliente.MotivoBloq) < 6 then
      begin
        avisar('Motivo de bloqueio inválido ou não informado. Operação abortada.');
        exit;
      end;
    end;

    repositorio.Salvar(Cliente);

    cds.Edit;
    cdsBLOQUEADO.AsString := Cliente.Bloqueado;
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
begin
  while emails <> '' do begin
    cdsEmails.Append;
    cdsEmailsEMAIL.AsString := copy( emails, 1, ( pos( ';', emails ) -1 ) );
    cdsEmails.Post;

    emails := trim( copy( emails, (pos(';',emails) +1), length(emails) ) );
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
  Cliente :TPessoa;
  repositorio :TRepositorio;
  motivo :String;
begin
 try
    repositorio  := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
    Cliente      := TPessoa(repositorio.Get( cdsCODIGO.AsInteger) );

    Cliente.Bloqueado  := IfThen(Cliente.Bloqueado = 'P', 'N', 'P');

    if Cliente.Bloqueado = 'N' then
      Cliente.MotivoBloq := ''
    else
    begin
      Cliente.MotivoBloq := chamaInput('TEXT','Informe a pendência do cliente');

      if length(Cliente.MotivoBloq) < 6 then
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
