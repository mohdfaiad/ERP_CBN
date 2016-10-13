unit uInformacoesPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Repositorio, Pessoa, ExtCtrls, StdCtrls, Grids,
  DBGrids, frameMaskCpfCnpj, Mask, DB, DBClient, frameFone;

type
  TfrmInformacoesPessoa = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    edtRg: TEdit;
    edtLogradouro: TEdit;
    edtNumero: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtUf: TEdit;
    edtCEP: TMaskEdit;
    edtPais: TEdit;
    CpfCnpj: TMaskCpfCnpj;
    GridEmail: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cdsEmails: TClientDataSet;
    dsEmails: TDataSource;
    cdsEmailsemail: TStringField;
    Fone1: TFone;
    procedure FormShow(Sender: TObject);
  private
    FCodigo :Integer;

    procedure BuscaInformacoesCliente;
    procedure MostraInformacoes;
    procedure CarregaEmails(emails :String);

  public
    constructor create(AOwner: TComponent; codigo :integer);overload;

  end;

var
  frmInformacoesPessoa: TfrmInformacoesPessoa;

implementation

uses FabricaRepositorio;

{$R *.dfm}

{ TfrmPadrao2 }

procedure TfrmInformacoesPessoa.BuscaInformacoesCliente;
begin
  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select p.cpf_cnpj, p.rg_ie, p.email, e.logradouro, e.numero, e.bairro, '+
                              '       e.cep, e.pais, c.nome, est.sigla, p.fone1        from pessoas p '+
                              'left join enderecos e   on e.codpessoa = p.codigo                      '+
                              'left join cidades   c   on c.codibge = e.codcidade                     '+
                              'left join estados   est on est.codigo = c.codest                       '+
                              'where p.codigo = :codigo                                               ';
  fdm.qryGenerica.ParamByName('codigo').AsInteger  := FCodigo;
  fdm.qryGenerica.Open;

  if not fdm.qryGenerica.IsEmpty then   MostraInformacoes;
end;

procedure TfrmInformacoesPessoa.CarregaEmails(emails: String);
begin
  if not cdsEmails.Active then  cdsEmails.CreateDataSet;
  
  while emails <> '' do begin
    cdsEmails.Append;
    cdsEmailsemail.AsString := copy( emails, 1, ( pos( ';', emails ) -1 ) );
    cdsEmails.Post;

    emails := trim( copy( emails, (pos(';',emails) +1), length(emails) ) );
  end;
end;

constructor TfrmInformacoesPessoa.create(AOwner: TComponent; codigo: integer);
begin
  self.Create(AOwner);
  FCodigo := codigo;
end;

procedure TfrmInformacoesPessoa.FormShow(Sender: TObject);
begin
  self.BuscaInformacoesCliente;
end;

procedure TfrmInformacoesPessoa.MostraInformacoes;
begin
  CpfCnpj.edtCpf.Text := fdm.qryGenerica.fieldByName('CPF_CNPJ').AsString;
  edtRg.Text          := fdm.qryGenerica.fieldByName('RG_IE').AsString;
  edtLogradouro.Text  := fdm.qryGenerica.fieldByName('LOGRADOURO').AsString;
  edtNumero.Text      := fdm.qryGenerica.fieldByName('NUMERO').AsString;
  edtBairro.Text      := fdm.qryGenerica.fieldByName('BAIRRO').AsString;
  edtCidade.Text      := fdm.qryGenerica.fieldByName('NOME').AsString;
  edtUf.Text          := fdm.qryGenerica.fieldByName('SIGLA').AsString;
  edtCEP.Text         := fdm.qryGenerica.fieldByName('CEP').AsString;
  edtPais.Text        := fdm.qryGenerica.fieldByName('PAIS').AsString;
  Fone1.Fone          := fdm.qryGenerica.fieldByName('FONE1').AsString;
  carregaEmails(fdm.qryGenerica.FieldByName('EMAIL').AsString);
end;

end.
