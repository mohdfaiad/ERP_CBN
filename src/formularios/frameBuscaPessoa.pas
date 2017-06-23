unit frameBuscaPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask, RxToolEdit, RxCurrEdit, ObjetoGenerico, TipoPessoa,
  ExtCtrls;

type
  TBuscaPessoa = class(TFrame)
    edtCodigo: TCurrencyEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    btnBuscar: TBitBtn;
    edtRazao: TEdit;
    procedure btnBuscarClick(Sender: TObject);
    procedure edtRazaoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    Pessoa :TObjetoGenerico;
    FTipoPessoa: TTipoPessoa;
    FTipoPessoaID: String;
    FTipoPessoaDesc: String;
    Fcod_rep: String;
    FCamposAdicionais :String;
    FTabelaAdicional :String;
    Fforma_pgto: integer;
    Ftab_preco: integer;
    Fcod_pessoa: String;
    CampoRetorno :String;
    Frazao_rep: String;
    FEmail :String;
    FUF: String;
    FCidade: String;
    FCnpj: String;
    FPercComissaoRep :Real;

    procedure buscaPessoa(codigo :String);
    procedure Setcod_pessoa(const Value: String);
    procedure Setrazao_rep(const Value: String);
    procedure SetTipoPessoa(const Value: TTipoPessoa);

  public
    procedure limpa;

    property TipoPessoa   :TTipoPessoa read FTipoPessoa write SetTipoPessoa;
    property cod_rep      :String read Fcod_rep;
    property razao_rep    :String read Frazao_rep write Setrazao_rep;
    property tab_preco    :integer read Ftab_preco;
    property forma_pgto   :integer read Fforma_pgto;
    property cod_pessoa   :String read Fcod_pessoa write Setcod_pessoa;
    property Email        :String read FEmail;
    property Cidade       :String read FCidade;
    property UF           :String read FUF;
    property cnpj         :String read FCnpj;
    property percComissaoRep :Real read FPercComissaoRep;

  end;

implementation

uses uPesquisaSimples, DB, uPadrao;

{$R *.dfm}

procedure TBuscaPessoa.btnBuscarClick(Sender: TObject);
begin

  frmPesquisaSimples := TFrmPesquisaSimples.Create(Self,'Select p.codigo, p.CPF_CNPJ, p.razao, p.nome_fantasia from pessoas p left join empresas e on e.codigo_pessoa = p.codigo where p.tipo = '''+FTipoPessoaID+'''',
                                                         'CODIGO', 'Selecione '+FTipoPessoaDesc+' e pressione ENTER');

  if frmPesquisaSimples.ShowModal = mrOk then
    buscaPessoa(frmPesquisaSimples.cds_retorno.Fields[0].AsString);


  frmPesquisaSimples.Release;

  edtRazao.SetFocus;
end;

procedure TBuscaPessoa.buscaPessoa(codigo: String);
begin
 try
   if pessoa = nil then
     pessoa := TObjetoGenerico.Create;

   pessoa.SQL := 'Select first 1 p.codigo, p.razao, p.email, cr.cod_representante, rep.razao representante, dr.percentagem_comissao, '+
                 '               cid.nome cidade, p.cpf_cnpj ,est.sigla uf, p.motivo_bloq '+FCamposAdicionais+' from pessoas p '+
                  FTabelaAdicional +
                 ' left join cliente_representante cr on cr.cod_cliente = p.codigo      '+
                 ' left join pessoas rep on rep.codigo = cr.cod_representante           '+
                 ' left join dados_representante dr on dr.codigo_representante = rep.codigo '+
                 ' left join enderecos ed on ed.codpessoa = p.codigo                  '+
                 ' left join cidades cid on cid.codibge = ed.codcidade                 '+
                 ' left join estados est on est.codigo = cid.codest                     '+
                 ' where p.'+campoRetorno+'='+ codigo + ' and p.tipo = '''+FTipoPessoaID+'''';

   if not pessoa.BuscaVazia then begin
     Fcod_pessoa    := pessoa.getCampo('codigo').AsString;
     edtCodigo.Text := pessoa.getCampo('codigo').AsString;
     edtRazao.Text  := pessoa.getCampo('razao').AsString;
     Fcod_rep       := pessoa.getCampo('cod_representante').AsString;
     Frazao_rep     := pessoa.getCampo('representante').AsString;
     FEmail         := copy(pessoa.getCampo('email').AsString,1, length(pessoa.getCampo('email').AsString)-1);
     FCidade        := pessoa.getCampo('cidade').AsString;
     FUF            := pessoa.getCampo('uf').AsString;
     FCnpj          := pessoa.getCampo('cpf_cnpj').AsString;
     FPercComissaoRep := pessoa.getCampo('percentagem_comissao').AsFloat;

     if FTipoPessoa = tpCliente then
     begin
       Ftab_preco  := pessoa.getCampo('codtabelapreco').AsInteger;
       Fforma_pgto := pessoa.getCampo('codformaspgto').AsInteger;
     end;

   end
   else
     limpa;

 Finally
  FreeAndNil(pessoa);
 end;
end;

procedure TBuscaPessoa.edtRazaoEnter(Sender: TObject);
begin
  keybd_event(VK_RETURN, 0, 0, 0);
end;

procedure TBuscaPessoa.edtCodigoExit(Sender: TObject);
begin
  if edtCodigo.Value > 0 then
    buscaPessoa(edtCodigo.Text)
  else
    limpa;
end;

procedure TBuscaPessoa.SetTipoPessoa(const Value: TTipoPessoa);
begin
  FTipoPessoa := Value;
  campoRetorno := 'CODIGO';

  if      value = tpCliente        then begin
    FTipoPessoaID     := 'C';
    FTipoPessoaDesc   := 'o Cliente';
    FCamposAdicionais := ' ,c.codtabelapreco, c.codformaspgto ';
    FTabelaAdicional  := ' left join clientes c on c.codcli = p.codigo ';
  end
  else if value = tpRepresentante  then begin
    FTipoPessoaID   := 'R';
    FTipoPessoaDesc := 'o Representante';
  end
  else if value = tpFornecedor     then begin
    FTipoPessoaID   := 'F';
    FTipoPessoaDesc := 'o Fornecedor';
  end
  else if value = tpTransportadora then begin
    FTipoPessoaID   := 'T';
    FTipoPessoaDesc := 'a Transportadora';
  end;

end;

procedure TBuscaPessoa.limpa;
begin
  Fcod_pessoa := '0';
  edtCodigo.Value := 0;
  Ftab_preco  := 0;
  Fforma_pgto := 0;
  Fcod_rep    := '0';
  FRazao_Rep := '';
  FEmail := '';
  FCidade := '';
  FUF := '';
  FCnpj := '';
  edtRazao.Clear;
end;

procedure TBuscaPessoa.Setcod_pessoa(const Value: String);
begin
  buscaPessoa(Value);
end;

procedure TBuscaPessoa.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    if edtCodigo.Value <= 0 then
      btnBuscar.Click;
end;

procedure TBuscaPessoa.Setrazao_rep(const Value: String);
begin
  Frazao_rep := Value;
end;

end.
