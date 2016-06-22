unit uAtalhoCadastros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmAtalhoCadastros = class(TForm)
    btnCfopCorrespondente: TSpeedButton;
    btnClientes: TSpeedButton;
    btnContadores: TSpeedButton;
    btnCores: TSpeedButton;
    btnEmpresas: TSpeedButton;
    btnFormasPagamento: TSpeedButton;
    btnFornecedores: TSpeedButton;
    btnGrades: TSpeedButton;
    btnMaterias: TSpeedButton;
    btnNaturezasOperacao: TSpeedButton;
    Label1: TLabel;
    btnPerfisAcesso: TSpeedButton;
    btnProdutos: TSpeedButton;
    btnRepresentantes: TSpeedButton;
    btnTabelasPreco: TSpeedButton;
    btnTamanhos: TSpeedButton;
    btnTransportadoras: TSpeedButton;
    btnUsuarios: TSpeedButton;
    Shape1: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Shape2: TShape;
    procedure btnCfopCorrespondenteClick(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure btnContadoresClick(Sender: TObject);
    procedure btnCoresClick(Sender: TObject);
    procedure btnEmpresasClick(Sender: TObject);
    procedure btnFormasPagamentoClick(Sender: TObject);
    procedure btnFornecedoresClick(Sender: TObject);
    procedure btnGradesClick(Sender: TObject);
    procedure btnMateriasClick(Sender: TObject);
    procedure btnNaturezasOperacaoClick(Sender: TObject);
    procedure btnPerfisAcessoClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnRepresentantesClick(Sender: TObject);
    procedure btnTabelasPrecoClick(Sender: TObject);
    procedure btnTamanhosClick(Sender: TObject);
    procedure btnTransportadorasClick(Sender: TObject);
    procedure btnUsuariosClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label2Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmAtalhoCadastros: TfrmAtalhoCadastros;

implementation

uses
  uCadastroPerfilAcesso,
  uCadastroUsuario,
  uCadastroCliente,
  uCadastroRepresentante,
  uCadastroFornecedor,
  uCadastroTabelaPreco,
  uCadastroCores,
  uCadastroTamanho,
  uCadastroGrade,
  uCadastroFormasPagamento,
  uCadastroProduto,
  uCadastroTransportadora,
  uCadastroEmpresa,
  uCadastroNaturezaOperacao,
  uCadastroMateria,
  uCadastroCfopCorrespondente,
  uCadastroContador,
  uInicial;

{$R *.dfm}

{ TForm1 }

procedure TfrmAtalhoCadastros.btnCfopCorrespondenteClick(Sender: TObject);
begin
  (Owner as TFrmInicial).CFOPsCorrespondentes1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnClientesClick(Sender: TObject);
begin
  (Owner as TFrmInicial).Clientes1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnContadoresClick(Sender: TObject);
begin
  (Owner as TFrmInicial).Contadores1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnCoresClick(Sender: TObject);
begin
  (Owner as TFrmInicial).Cores1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnEmpresasClick(Sender: TObject);
begin
  (Owner as TFrmInicial).mnuEmpresaClick(nil);
end;

procedure TfrmAtalhoCadastros.btnFormasPagamentoClick(Sender: TObject);
begin
  (Owner as TFrmInicial).FormasdePagamento1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnFornecedoresClick(Sender: TObject);
begin
  (Owner as TFrmInicial).Fornecedores1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnGradesClick(Sender: TObject);
begin
  (Owner as TFrmInicial).Grades1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnMateriasClick(Sender: TObject);
begin
  (Owner as TFrmInicial).Matrias1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnNaturezasOperacaoClick(Sender: TObject);
begin
  (Owner as TFrmInicial).NaturezasdeOperao1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnPerfisAcessoClick(Sender: TObject);
begin
  (Owner as TFrmInicial).Perfisdeacesso1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnProdutosClick(Sender: TObject);
begin
  (Owner as TFrmInicial).Produtos1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnRepresentantesClick(Sender: TObject);
begin
  (Owner as TFrmInicial).Representantes1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnTabelasPrecoClick(Sender: TObject);
begin
  (Owner as TFrmInicial).abelasdePreo1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnTamanhosClick(Sender: TObject);
begin
  (Owner as TFrmInicial).amanhos1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnTransportadorasClick(Sender: TObject);
begin
  (Owner as TFrmInicial).ransportadoras1Click(nil);
end;

procedure TfrmAtalhoCadastros.btnUsuariosClick(Sender: TObject);
begin
  (Owner as TFrmInicial).Usurios1Click(nil);
end;

procedure TfrmAtalhoCadastros.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if (Shift = [ssCtrl, ssShift]) then
    case Key of
      ord('C') : self.Visible := false;
    end
  else if key = vk_escape then
    self.Close;  
end;

procedure TfrmAtalhoCadastros.Label2Click(Sender: TObject);
begin
  self.Close;
end;

end.
