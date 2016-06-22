unit uCadastroTransportadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, uPadrao,
  frameBuscaCidade, Provider, DB, DBClient, Grids, DBGrids, DBGridCBN, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, Mask, Pessoa, Repositorio, StrUtils, Endereco, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCadastroTransportadora = class(TfrmPadrao)
    panBotoes: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label16: TLabel;
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
    Label15: TLabel;
    edtFone1: TMaskEdit;
    edtFone2: TMaskEdit;
    edtFax: TMaskEdit;
    edtEmail: TEdit;
    memObs: TMemo;
    edtCodigo: TEdit;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    pagTransportadoras: TPageControl;
    gridTransportadoras: TDBGridCBN;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    ds: TDataSource;
    cds: TClientDataSet;
    cdsCODIGO: TIntegerField;
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
    dsp: TDataSetProvider;
    edtCpf: TEdit;
    cdsRAZAO: TStringField;
    cdsPESSOA: TStringField;
    cdsEMAIL: TStringField;
    cdsNUMERO: TStringField;
    lblAsterisco: TLabel;
    lblCamposObrigatorios: TLabel;
    Label2: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    qry: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure gridTransportadorasTitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    Transportadora :TPessoa;
    Endereco :TEndereco;
    rep, repEnd :TRepositorio;

    procedure incluir;
    procedure alterar;
    procedure salvar;
    procedure mostraDados;
    procedure limpaCampos;
    function verificaObrigatorios :Boolean;
    procedure habilita(SN:boolean);

  public
    { Public declarations }
  end;

var
  frmCadastroTransportadora: TfrmCadastroTransportadora;

implementation

uses
  FabricaRepositorio, Math;

{$R *.dfm}

procedure TfrmCadastroTransportadora.FormShow(Sender: TObject);
begin
  inherited;
  pagTransportadoras.ActivePageIndex := 0;

  cds.Close;
  dsp.DataSet := FDM.GetConsulta('SELECT * FROM pessoas p                           '+
                                 ' left join enderecos en on en.codpessoa = p.codigo'+
                                 ' where p.tipo = ''T''                             ');
  cds.Open;

  gridTransportadoras.SetFocus;
end;

procedure TfrmCadastroTransportadora.btnIncluirClick(Sender: TObject);
begin
  inherited;
  self.Tag := 1;
  pagTransportadoras.ActivePageIndex := 0;
  gridTransportadoras.SetFocus;
  pagTransportadoras.ActivePageIndex := 1;
  limpaCampos;
  TabSheet2Enter(nil);
end;

procedure TfrmCadastroTransportadora.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not (cds.Active) or (cds.IsEmpty) then
    exit;

  self.Tag := 2;
  pagTransportadoras.ActivePageIndex := 0;
  gridTransportadoras.SetFocus;
  pagTransportadoras.ActivePageIndex := 1;
end;

procedure TfrmCadastroTransportadora.alterar;
begin
  if Rep = nil then begin
    Rep     := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
    Transportadora := TPessoa(Rep.Get(cdsCODIGO.AsInteger));
  end;

  if repEnd = nil then begin
    RepEnd   := TFabricaRepositorio.GetRepositorio(TEndereco.ClassName);
    Endereco := TEndereco(Rep.Get(cdsCODIGO.AsInteger));
    mostraDados;
  end;
end;

procedure TfrmCadastroTransportadora.incluir;
begin
  if Rep = nil then begin
    Rep     := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
    Transportadora := TPessoa.Create;
  end;

  if repEnd = nil then begin
    RepEnd   := TFabricaRepositorio.GetRepositorio(TEndereco.ClassName);
    Endereco := TEndereco.Create;
    limpaCampos;
  end;
end;

procedure TfrmCadastroTransportadora.mostraDados;
begin
  edtCodigo.Text        := cdsCODIGO.AsString;
  edtRazao.text         := cdsRAZAO.AsString;
  edtCpf.text           := cdsCPF_CNPJ.AsString;
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
  edtEmail.text         := cdsEmail.AsString;
  memObs.text 	        := cdsObservacao.AsString;

end;

procedure TfrmCadastroTransportadora.TabSheet2Enter(Sender: TObject);
begin
  inherited;

  if not pagTransportadoras.Pages[1].Enabled then
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
    Transportadora := TPessoa.Create;
  end;

  if repEnd = nil then begin
    RepEnd   := TFabricaRepositorio.GetRepositorio(TEndereco.ClassName);
    Endereco := TEndereco.Create;
  end;
end;

procedure TfrmCadastroTransportadora.limpaCampos;
begin
  edtcodigo.Text := '0';
  edtRazao.Clear;
  edtCpf.Clear;
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
end;

procedure TfrmCadastroTransportadora.btnCancelarClick(Sender: TObject);
begin
  inherited;
  pagTransportadoras.ActivePageIndex := 0;
  self.Tag := 0;
  habilita(false);

  gridTransportadoras.SetFocus;
  FreeAndNil(Transportadora);
  FreeAndNil(Rep);
  FreeAndNil(Endereco);
  FreeAndNil(RepEnd);
end;

procedure TfrmCadastroTransportadora.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if verificaObrigatorios then
    salvar;
end;

function TfrmCadastroTransportadora.verificaObrigatorios: Boolean;
begin
  Result := true;

  if trim(edtRazao.Text) = '' then begin
    avisar('Favor informar o Nome / Razão social da Transportadora');
    edtRazao.SetFocus;
    result := false;
  end
  else if trim(edtCpf.Text) = '' then begin
    avisar('Favor informar o CGC da Transportadora');
    edtCpf.SetFocus;
    result := false;
  end
  else if trim(edtLogradouro.Text) = '' then begin
    avisar('Endereço obrigatório! Favor informe o Logradouro');
    edtLogradouro.SetFocus;
    result := false;
  end
  else if trim(edtNumero.Text) = '' then begin
    avisar('Endereço obrigatório! Favor informe o número');
    edtNumero.SetFocus;
    result := false;
  end
  else if trim(edtBairro.Text) = '' then begin
    avisar('Endereço obrigatório! Favor informe o bairro');
    edtBairro.SetFocus;
    result := false;
  end
  else if trim(Cidade.edtCidade.Text) = '' then begin
    avisar('Endereço obrigatório! Favor informe a cidade');
    cidade.edtCodCid.SetFocus;
    result := false;
  end
  else if (trim(edtFone1.Text) = '(  )    -') and
          (trim(edtFone2.Text) = '(  )    -') and
          (trim(edtFax.Text)   = '(  )    -') then begin
    avisar('Favor informar ao menos um telefone para contato');
    edtFone1.SetFocus;
    result := false;
  end;
end;

procedure TfrmCadastroTransportadora.salvar;
begin
  if self.Tag = 2 then
    Transportadora.Codigo := cdsCODIGO.asInteger;

 Transportadora.Razao                := edtRazao.text;
 Transportadora.Pessoa               := 'J';
 Transportadora.CPF_CNPJ             := edtCpf.text;
 Transportadora.RG_IE                := edtRg.text;
 Transportadora.DtCadastro           := strToDate(edtDtCad.text);
 Transportadora.Fone1                := edtFone1.text;
 Transportadora.Fone2                := edtFone2.text;
 Transportadora.Fax                  := edtFax.text;
 Transportadora.Email                := edtEmail.text;
 Transportadora.Observacao           := memObs.text;
 Transportadora.Tipo                 := 'T';

 Rep.Salvar(Transportadora);

 if self.Tag = 2 then
    Endereco.Codigo := cdsCODIGO_1.asInteger;

 Endereco.CodPessoa   := Transportadora.Codigo;
 Endereco.Logradouro  := edtLogradouro.text;
 Endereco.Numero      := edtNumero.text;
 Endereco.Bairro      := edtBairro.text;
 Endereco.CodCidade   := StrToInt(Cidade.edtCodCid.text);
 Endereco.CEP         := edtCep.text;
 Endereco.Pais        := edtPais.text;
 Endereco.Complemento := edtComplemento.text;

 RepEnd.Salvar(Endereco);

 btnCancelar.Click;

 cds.Close;
 cds.Open;

 avisar('Operação realizada com sucesso!');
end;

procedure TfrmCadastroTransportadora.TabSheet1Exit(Sender: TObject);
begin
  inherited;
  TabSheet2Enter(nil);

  if self.Tag in [1,2]  then  edtRazao.SetFocus;
end;

procedure TfrmCadastroTransportadora.cdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (self.Tag = 2) and (cdsCODIGO.AsString <> edtCodigo.Text) then
    if confirma('Cancelar alteração do Transportadora '+edtCodigo.Text+' - '+ edtRazao.Text+'?') then
      btnCancelar.Click
    else begin
      cds.Locate('CODIGO', edtCodigo.Text, []);
      pagTransportadoras.ActivePageIndex := 1;
    end;

end;

procedure TfrmCadastroTransportadora.gridTransportadorasTitleClick(Column: TColumn);
begin
  inherited;
  if (self.Tag = 2) and (cdsCODIGO.AsString <> edtCodigo.Text) then
    if confirma('Cancelar alteração do Transportadora '+edtCodigo.Text+' - '+ edtRazao.Text+'?') then
      btnCancelar.Click
    else begin
      cds.Locate('CODIGO', edtCodigo.Text, []);
      pagTransportadoras.ActivePageIndex := 1;
    end;
end;

procedure TfrmCadastroTransportadora.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_F1 then
    pagTransportadoras.ActivePageIndex := 0
  else if key = VK_F2 then
    pagTransportadoras.ActivePageIndex := 1
  else if (key = VK_F3)and(btnIncluir.Enabled) then
    btnIncluir.Click
  else if (key = VK_F4)and(btnAlterar.Enabled) then
    btnAlterar.Click;
end;

procedure TfrmCadastroTransportadora.habilita(SN: boolean);
begin
  if SN then begin
    btnIncluir.Enabled  := false;
    btnAlterar.Enabled  := false;
    btnSalvar.Enabled   := true;
    btnCancelar.Enabled := true;
    pagTransportadoras.Pages[1].Enabled := true;
  end
  else begin
    btnIncluir.Enabled  := true;
    btnAlterar.Enabled  := true;
    btnSalvar.Enabled   := false;
    btnCancelar.Enabled := false;
    pagTransportadoras.Pages[1].Enabled := false;
  end;
end;

end.
