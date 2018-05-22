unit uImportadadorClientesTricae;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, StdCtrls, Buttons, frameListaCampo, ComObj;

type TStatus = (stAlterando, stIncluindo);

type
  TfrmImportadadorClientesTricae = class(TfrmPadrao)
    GroupBox3: TGroupBox;
    ListaTabelaPreco: TListaCampo;
    GroupBox4: TGroupBox;
    ListaFormaPagamento: TListaCampo;
    GroupBox5: TGroupBox;
    ListaRepresentante: TListaCampo;
    GroupBox6: TGroupBox;
    ListaTransportadora: TListaCampo;
    GroupBox1: TGroupBox;
    edtCaminhoArquivo: TEdit;
    BitBtn1: TBitBtn;
    pnlRodape: TPanel;
    btnImportar: TBitBtn;
    btnSair: TBitBtn;
    mmoLog: TMemo;
    Label1: TLabel;
    lbClientesAlt: TLabel;
    lbClientesInc: TLabel;
    label3: TLabel;
    label2: TLabel;
    BitBtn2: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    function verificaObrigatorios :Boolean;
    function getNumero(texto :String) :String;
    function getRua(texto :String) :String;

    procedure CriaArquivoPadroes;
    procedure CarregaPadroes;
    procedure SalvarLog;
  public
    { Public declarations }
  end;

CONST
  TABELA_PRECO    = 'TABELA_PRECO=';
  _REPRESENTANTE   = 'REPRESENTANTE=';
  FORMA_PAGAMENTO = 'FORMA_PAGAMENTO=';
  TRANSPORTADORA  = 'TRANSPORTADORA=';

var
  frmImportadadorClientesTricae: TfrmImportadadorClientesTricae;

implementation

uses Pessoa, repositorio, fabricarepositorio, EspecificacaoPessoaPorCpfCnpj, Endereco, Cliente, Cliente_Representante,
     EspecificacaoCidadePorNome, Cidade, Funcoes, uModulo, EspecificacaoClientePorCodigoPessoa, EspecificacaoEnderecoComPessoaIgualA,
     EspecificacaoClienteHasRepresentantePorCodPessoa, Representante;

{$R *.dfm}

procedure TfrmImportadadorClientesTricae.btnSairClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TfrmImportadadorClientesTricae.BitBtn1Click(Sender: TObject);
var Dialog :TOpenDialog;
begin
  try
   Dialog            := TOpenDialog.Create(nil);
   Dialog.InitialDir := GetCurrentDir;
   Dialog.Options    := [ofFileMustExist];
   Dialog.Filter     := 'Arquivos Excel|*.XLSX;*.XLS;*.CSV';

  // Select pascal files as the starting filter type

   if Dialog.Execute then
     edtCaminhoArquivo.Text := Dialog.FileName;

  Finally
    FreeAndNil(Dialog);
  end;
end;

procedure TfrmImportadadorClientesTricae.FormShow(Sender: TObject);
begin
  ListaTabelaPreco.setValores('select * from tabelas_preco', 'descricao','Tabelas de Preço');
  ListaTabelaPreco.executa;
  ListaFormaPagamento.setValores('select * from formas_pgto', 'descricao', 'Formas de Pagamento');
  ListaFormaPagamento.executa;
  ListaRepresentante.setValores('select codigo, razao from pessoas where tipo = ''R''', 'razao', 'Representante associado');
  ListaRepresentante.executa;
  ListaTransportadora.setValores('select codigo, razao from pessoas where tipo = ''T''', 'razao', 'Transportadora associada');
  ListaTransportadora.executa;

  if FileExists(dm.DiretorioSistema+'padroes.txt') then
    CarregaPadroes;
end;

function TfrmImportadadorClientesTricae.getNumero(texto: String): String;
var i :integer;
begin
  result := '';
  for i := Length(texto) downto 1 do
  begin
    try
      StrToInt(texto[i]);
      result := texto[i] + result;
    Except
      exit;
    end;
  end;
end;

function TfrmImportadadorClientesTricae.getRua(texto: String): String;
var i :integer;
begin
  result := '';
  for i := Length(texto) downto 1 do
  begin
    try
      StrToInt(texto[i]);
    Except
      result := copy(texto,1,i);
      exit;
    end;
  end;
end;

procedure TfrmImportadadorClientesTricae.btnImportarClick(Sender: TObject);
var Excel, Sheet: OleVariant;
  i, CInc, CAlt, codigoPessoa :integer;
  Cliente :TCliente;
  repositorio :TRepositorio;
  repositorioCliente :TRepositorio;
  especificacao :TEspecificacaoPessoaPorCpfCnpj;
  especificacaoCidade :TEspecificacaoCidadePorNome;
  cpfCnpj, cidade, estado :String;
  CidadeCliente :TCidade;
  EspecificacaoCliente       :TEspecificacaoClientePorCodigoPessoa;
  Status :TStatus;
begin
  Aguarda('Importando clientes, aguarde...');

  if not verificaObrigatorios then
    Exit;

  try
    try
      Excel := CreateOleObject('Excel.Application');
      Excel.WorkBooks.Open(edtCaminhoArquivo.Text);
      Excel.Visible := false;

    except
      on e : Exception do
        begin
          avisar('Ocorreu um erro ao abrir o arquivo.'+#13#10+ e.Message);
        end;
    end;

  try

     repositorio   := nil;
     Cliente       := nil;
     CidadeCliente := nil;
     i             := 2;
     CInc          := 0;
     CAlt          := 0;
     mmoLog.Lines.Clear;
     lbClientesAlt.Caption := '0';
     lbClientesInc.Caption := '0';

     while Excel.WorkBooks[1].Sheets[1].Cells[i,2].value > 0 do
     begin
        Application.ProcessMessages;

        cpfCnpj := TRIM( Excel.WorkBooks[1].Sheets[1].Cells[i,9] );

        if length(cpfCnpj) = 10 then
          cpfCnpj := '0'+ cpfCnpj;

        repositorioCliente := TFabricaRepositorio.GetRepositorio(TCliente.ClassName);
        codigoPessoa       := strToIntDef(Campo_por_campo('PESSOAS','CODIGO','CPF_CNPJ',cpfCnpj,'TIPO','C'),0);
        Cliente            := TCliente(repositorioCliente.Get(codigoPessoa));

        if not assigned(Cliente) then
          Cliente := TCliente.Create;

        if Cliente.codigo = 0 then
        begin
          inc(CInc);
          status := stIncluindo;
        end
        else
        begin
          inc(CAlt);
          status := stAlterando;
        end;

        Cliente.Razao      := TRIM(copy(AnsiUpperCase( Excel.WorkBooks[1].Sheets[1].Cells[i,10]),1,60));
        Cliente.Pessoa     := 'F';
        Cliente.Tipo       := 'C';
        Cliente.CPF_CNPJ   := TRIM(cpfCnpj);
        Cliente.DtCadastro := Date;
        Cliente.Fone1      := copy(Excel.WorkBooks[1].Sheets[1].Cells[i,16], 1,15);

        if not ( pos('(', Cliente.Fone1) > 0 ) then
          Cliente.Fone1 := '('+copy(Cliente.Fone1,1,2)+')'+ copy(Cliente.Fone1,3,12);

        Cliente.Observacao := 'CLIENTE TRICAE';

        if not assigned(Cliente.Endereco) then
          Cliente.Endereco := TEndereco.Create;

        cidade               := TRIM(AnsiUpperCase(Excel.WorkBooks[1].Sheets[1].Cells[i,18]));
        estado               := TRIM(Excel.WorkBooks[1].Sheets[1].Cells[i,14]);

        especificacaoCidade  := TEspecificacaoCidadePorNome.Create( RemoveAcento(cidade), estado);
        repositorio          := TFabricaRepositorio.GetRepositorio(TCidade.ClassName);
        CidadeCliente        := TCIdade(repositorio.GetPorEspecificacao(especificacaoCidade));
        try
          Cliente.Endereco.CodCidade   := CidadeCliente.codibge;
        except
          mmoLog.Lines.Add('Atenção! Nome de cidade inválido: "'+ cidade + '". Cadastro de cidade pendente,');
          mmoLog.Lines.Add('para o cliente '+inttostr(Cliente.codigo)+' - "'+AnsiUpperCase(Cliente.Razao)+'" < < <');
        end;

        if assigned(Cliente.Endereco) then
        begin
          Cliente.Endereco.Logradouro  := getRua( TRIM(AnsiUpperCase(Excel.WorkBooks[1].Sheets[1].Cells[i,11])) );
          Cliente.Endereco.Numero      := getNumero( TRIM(Excel.WorkBooks[1].Sheets[1].Cells[i,11] ));
          Cliente.Endereco.Bairro      := TRIM(AnsiUpperCase( Excel.WorkBooks[1].Sheets[1].Cells[i,13]));
          Cliente.Endereco.CEP         := substituiString( Excel.WorkBooks[1].Sheets[1].Cells[i,19], '-', '');
          Cliente.Endereco.Pais        := 'BRASIL';
          Cliente.Endereco.Complemento := TRIM(AnsiUpperCase(Excel.WorkBooks[1].Sheets[1].Cells[i,12]));
        end;


        Cliente.CodTabelaPreco    := ListaTabelaPreco.CodCampo;
        Cliente.CodFormasPgto     := ListaFormaPagamento.CodCampo;
        Cliente.CodTransportadora := ListaTransportadora.CodCampo;
        Cliente.CodRepresentante  := ListaRepresentante.CodCampo;

        repositorioCliente.Salvar(Cliente);

        lbClientesInc.Caption := IntToStr(CInc);
        lbClientesAlt.Caption := IntToStr(CAlt);

        inc(i);
     end;

    CriaArquivoPadroes;

    Avisar('Importação concluída');

    except
      on e : Exception do
        begin
          avisar('Ocorreu um erro ao importar os clientes.'+#13#10+ e.Message);
        end;
    end;

  finally
    FimAguarda;
    FreeAndNil(repositorio);
    FreeAndNil(repositorioCliente);
    FreeAndNil(Cliente);
    FreeAndNil(CidadeCliente);

    Excel := Unassigned;
    PostMessage(FindWindow('XLMAIN', nil), WM_CLOSE,0,0);
    Sheet := Unassigned;
    Excel.Quit;
  end;
end;

function TfrmImportadadorClientesTricae.verificaObrigatorios: Boolean;
begin
  result := false;

  if not (ListaTabelaPreco.CodCampo > 0) then
  begin
    avisar('Favor informar a tabela de preço');
    ListaTabelaPreco.comListaCampo.SetFocus;
  end
  else if not (ListaFormaPagamento.CodCampo > 0) then
  begin
    avisar('Favor informar a forma de pagamento');
    ListaFormaPagamento.comListaCampo.SetFocus;
  end
  else if not (ListaRepresentante.CodCampo > 0) then
  begin
    avisar('Favor informar o representante');
    ListaRepresentante.comListaCampo.SetFocus;
  end
  else if not (ListaTransportadora.CodCampo > 0) then
  begin
    avisar('Favor informar a transportadora');
    ListaTransportadora.comListaCampo.SetFocus;
  end
  else if (edtCaminhoArquivo.Text = '') then
  begin
    avisar('Favor selecionar o arquivo para realizar a importação');
    edtCaminhoArquivo.SetFocus;
  end
  else
    result := true;
end;

procedure TfrmImportadadorClientesTricae.CriaArquivoPadroes;
var
  arq: TextFile;
begin
 try
    AssignFile(arq, dm.DiretorioSistema+ 'padroes.txt');
    Rewrite(arq);

    Writeln(arq, TABELA_PRECO + IntToStr(ListaTabelaPreco.CodCampo));
    Writeln(arq, _REPRESENTANTE+ IntToStr(ListaRepresentante.CodCampo));
    Writeln(arq, FORMA_PAGAMENTO+ IntToStr(ListaFormaPagamento.CodCampo));
    Writeln(arq, TRANSPORTADORA+ IntToStr(ListaTransportadora.CodCampo));

    CloseFile(arq);
 Except
   on e: Exception do
      Avisar('Erro ao criar arquivo de padrões');
 end;
end;

procedure TfrmImportadadorClientesTricae.CarregaPadroes;
var
  arq: TextFile;
  linha :String;
begin
 try
    AssignFile(arq, dm.DiretorioSistema+ 'padroes.txt');
    Reset(arq);

    while (not eof(arq)) do
    begin
       readln(arq, linha); // [ 6 ] Lê uma linha do arquivo

       if pos(TABELA_PRECO, linha) > 0 then
         ListaTabelaPreco.CodCampo := StrToInt( copy(linha, pos('=',linha)+1, 5) )
       else if pos(_REPRESENTANTE, linha) > 0 then
         ListaRepresentante.CodCampo := StrToInt( copy(linha, pos('=',linha)+1, 5) )
       else if pos(FORMA_PAGAMENTO, linha) > 0 then
         ListaFormaPagamento.CodCampo := StrToInt( copy(linha, pos('=',linha)+1, 5) )
       else if pos(TRANSPORTADORA, linha) > 0 then
         ListaTransportadora.CodCampo := StrToInt( copy(linha, pos('=',linha)+1, 5) );
    end;


    CloseFile(arq);
 Except
   on e: Exception do
      Avisar('Erro ao abrir arquivo de padrões');
 end;
end;

procedure TfrmImportadadorClientesTricae.BitBtn2Click(Sender: TObject);
begin
  if not (mmoLog.Text = '') then
    SalvarLog;
end;

procedure TfrmImportadadorClientesTricae.SalvarLog;
var
  Dialog :TSaveDialog;
begin
 try
   Dialog            := TSaveDialog.Create(nil);
   Dialog.Filter     := 'Arquivos Texto (*.txt)|*.txt';
   Dialog.DefaultExt := 'txt';

   if Dialog.Execute then
   begin
      mmoLog.Lines.SaveToFile(Dialog.FileName);
      avisar('Log salvo com sucesso em:'+#13#10+'"'+Dialog.FileName+'"', 5);
   end
   else
     avisar('Operação abortada');

 Finally
   FreeAndNil(Dialog);
 end;
end;

end.
