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

    procedure CriaArquivoPadroes;
    procedure CarregaPadroes;
    procedure SalvarLog;
  public
    { Public declarations }
  end;

CONST
  TABELA_PRECO    = 'TABELA_PRECO=';
  REPRESENTANTE   = 'REPRESENTANTE=';
  FORMA_PAGAMENTO = 'FORMA_PAGAMENTO=';
  TRANSPORTADORA  = 'TRANSPORTADORA=';

var
  frmImportadadorClientesTricae: TfrmImportadadorClientesTricae;

implementation

uses Pessoa, repositorio, fabricarepositorio, EspecificacaoPessoaPorCpfCnpj, Endereco, Cliente, Cliente_Representante,
     EspecificacaoCidadePorNome, Cidade, Funcoes, uModulo, EspecificacaoClientePorCodigoPessoa, EspecificacaoEnderecoComPessoaIgualA,
     EspecificacaoClienteHasRepresentantePorCodPessoa;

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

procedure TfrmImportadadorClientesTricae.btnImportarClick(Sender: TObject);
var Excel, Sheet: OleVariant;
  i, CInc, CAlt :integer;
  Cliente :TPessoa;
  repositorio :TRepositorio;
  repositorioCliente :TRepositorio;
  especificacao :TEspecificacaoPessoaPorCpfCnpj;
  especificacaoCidade :TEspecificacaoCidadePorNome;
  cpfCnpj, cidade, estado :String;
  Endereco :TEndereco;
  InfoCliente :TCliente;
  Cliente_Representante :TCliente_Representante;
  CidadeCliente :TCidade;
  EspecificacaoCliente       :TEspecificacaoClientePorCodigoPessoa;
  EspecificacaoEndereco      :TEspecificacaoEnderecoComPessoaIgualA;
  EspecificacaoRepresentante :TEspecificacaoClienteHasRepresentantePorCodPessoa;
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
     InfoCliente   := nil;
     Endereco      := nil;
     CidadeCliente := nil;
     i             := 2;
     CInc          := 0;
     CAlt          := 0;
     mmoLog.Lines.Clear;
     lbClientesAlt.Caption := '0';
     lbClientesInc.Caption := '0';

    // Sheet := Excel.Workbooks[1].WorkSheets[''];

     while Excel.WorkBooks[1].Sheets[1].Cells[i,2].value > 0 do
     begin
        Application.ProcessMessages;

        cpfCnpj := TRIM( Excel.WorkBooks[1].Sheets[1].Cells[i,9] );

        if length(cpfCnpj) = 10 then
          cpfCnpj := '0'+ cpfCnpj;

        repositorioCliente := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
        especificacao      := TEspecificacaoPessoaPorCpfCnpj.Create(cpfCnpj);
        Cliente            := TPessoa(repositorioCliente.GetPorEspecificacao(especificacao, cpfCnpj));

        if not assigned(Cliente) then
          Cliente := TPessoa.Create;

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

        Cliente.Razao      := TRIM(AnsiUpperCase( Excel.WorkBooks[1].Sheets[1].Cells[i,10]));
        Cliente.Pessoa     := 'F';
        Cliente.Tipo       := 'C';
        Cliente.CPF_CNPJ   := TRIM(cpfCnpj);
        Cliente.DtCadastro := Date;
        Cliente.Fone1      := copy(Excel.WorkBooks[1].Sheets[1].Cells[i,16], 1,15);

        if not ( pos('(', Cliente.Fone1) > 0 ) then
          Cliente.Fone1 := '('+copy(Cliente.Fone1,1,2)+')'+ copy(Cliente.Fone1,3,12);

        Cliente.Observacao := 'CLIENTE TRICAE';

        if Status = stAlterando then
        begin
          EspecificacaoEndereco := TEspecificacaoEnderecoComPessoaIgualA.Create(Cliente);
          repositorio           := TFabricaRepositorio.GetRepositorio(TEndereco.ClassName);
          Endereco              := TEndereco( repositorio.GetPorEspecificacao(EspecificacaoEndereco, IntTostr(Cliente.codigo)) );
        end
        else
          Endereco := TEndereco.Create;

        cidade               := TRIM(AnsiUpperCase( copy(Excel.WorkBooks[1].Sheets[1].Cells[i,13], 1, pos('/',Excel.WorkBooks[1].Sheets[1].Cells[i,13])-1 )));
        estado               := TRIM(copy(Excel.WorkBooks[1].Sheets[1].Cells[i,13], pos('/',Excel.WorkBooks[1].Sheets[1].Cells[i,13])+1, 3) );
        especificacaoCidade  := TEspecificacaoCidadePorNome.Create( RemoveAcento(cidade), estado);
        repositorio          := TFabricaRepositorio.GetRepositorio(TCidade.ClassName);
        CidadeCliente        := TCIdade(repositorio.GetPorEspecificacao(especificacaoCidade));
        try
          Endereco.CodCidade   := CidadeCliente.codibge;
        except
          mmoLog.Lines.Add('Atenção! Nome de cidade inválido: "'+ cidade + '". Cadastro de cidade pendente,');
          mmoLog.Lines.Add('para o cliente '+inttostr(Cliente.codigo)+' - "'+AnsiUpperCase(Cliente.Razao)+'" < < <');
        end;

        repositorioCliente.Salvar(Cliente);

        if assigned(Endereco) then
        begin
          Endereco.codpessoa   := Cliente.Codigo;
          Endereco.Logradouro  := TRIM(AnsiUpperCase( copy(Excel.WorkBooks[1].Sheets[1].Cells[i,11], 1, pos(',',Excel.WorkBooks[1].Sheets[1].Cells[i,11])-1)));
          Endereco.Numero      := TRIM(copy(Excel.WorkBooks[1].Sheets[1].Cells[i,11], pos(',',Excel.WorkBooks[1].Sheets[1].Cells[i,11])+1, 10));
          Endereco.Bairro      := TRIM(AnsiUpperCase( Excel.WorkBooks[1].Sheets[1].Cells[i,14]));
          Endereco.CEP         := substituiString( Excel.WorkBooks[1].Sheets[1].Cells[i,19], '-', '');
          Endereco.Pais        := 'BRASIL';
          Endereco.Complemento := TRIM(AnsiUpperCase(Excel.WorkBooks[1].Sheets[1].Cells[i,12]));

          repositorio := TFabricaRepositorio.GetRepositorio(TEndereco.ClassName);
          repositorio.Salvar(Endereco);
        end;

        repositorio           := TFabricaRepositorio.GetRepositorio(TCliente.ClassName);
        if Status = stAlterando then
        begin
          EspecificacaoCliente  := TEspecificacaoClientePorCodigoPessoa.Create(Cliente.Codigo);
          InfoCliente           := TCliente( repositorio.GetPorEspecificacao(EspecificacaoCliente, IntTostr(Cliente.codigo)) );
        end;

        if not assigned(InfoCliente) then
          InfoCliente := TCliente.Create;

        InfoCliente.CodCli            := Cliente.Codigo;
        InfoCliente.CodTabelaPreco    := ListaTabelaPreco.CodCampo;
        InfoCliente.CodFormasPgto     := ListaFormaPagamento.CodCampo;
        InfoCliente.CodTransportadora := ListaTransportadora.CodCampo;

        repositorio.Salvar(InfoCliente);

        FreeAndNil(InfoCliente);

        repositorio := TFabricaRepositorio.GetRepositorio(TCliente_Representante.ClassName);
        if Status = stAlterando then
        begin
          EspecificacaoRepresentante := TEspecificacaoClienteHasRepresentantePorCodPessoa.Create(Cliente.Codigo);
          Cliente_Representante      := TCliente_Representante( repositorio.GetPorEspecificacao(EspecificacaoRepresentante, IntTostr(Cliente.codigo)) );
        end;

        if not assigned(Cliente_Representante) then
          Cliente_Representante := TCliente_Representante.Create;

        Cliente_Representante.cod_cliente       := Cliente.Codigo;
        Cliente_Representante.cod_representante := ListaRepresentante.CodCampo;

        repositorio.Salvar(Cliente_Representante);
        FreeAndNil(Cliente_Representante);

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
    FreeAndNil(Endereco);
    FreeAndNil(InfoCliente);
    FreeAndNil(Cliente_Representante);    
    FreeAndNil(CidadeCliente);

    Excel := Unassigned;
    PostMessage(FindWindow('XLMAIN', nil), WM_CLOSE,0,0);
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
    Writeln(arq, REPRESENTANTE+ IntToStr(ListaRepresentante.CodCampo));
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
       else if pos(REPRESENTANTE, linha) > 0 then
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
