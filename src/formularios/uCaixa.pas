unit uCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, StrUtils,
  Dialogs, uPadrao, StdCtrls, Mask, RXToolEdit, RXCurrEdit, ExtCtrls, ComCtrls, AcbrDevice,
  ImgList, pngimage, Buttons, Contnrs, Caixa, StringUtilitario;

type
  TfrmCaixa = class(TfrmPadrao)
    edtValor: TCurrencyEdit;
    Label1: TLabel;
    edtDataCorrente: TEdit;
    Label2: TLabel;
    edtHoraCorrente: TEdit;
    Label3: TLabel;
    Panel1: TPanel;
    btnAbreCaixa: TBitBtn;
    btnFechaCaixa: TBitBtn;
    Shape1: TShape;
    Label4: TLabel;
    lblStatus: TLabel;
    imgCxAberto: TImage;
    Shape2: TShape;
    imgCxFechado: TImage;
    edtCodigo: TCurrencyEdit;
    pnlAberto: TPanel;
    Label5: TLabel;
    lblAbertura: TLabel;
    Label6: TLabel;
    lblValorAbertura: TLabel;
    Shape3: TShape;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    Shape4: TShape;
    Label8: TLabel;
    btnMovimento: TBitBtn;
    procedure btnAbreCaixaClick(Sender: TObject);
    procedure btnFechaCaixaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnMovimentoClick(Sender: TObject);

  private

    procedure Carrega_dados_caixa;
    function AbreCaixa :Boolean;
    procedure FechaCaixa;
    function CalculaValorCaixa(Caixa :TCaixa) :Real;
    procedure ConfiguraTela(estadoTela:String);
  end;

var
  frmCaixa: TfrmCaixa;

implementation

uses Repositorio, FabricaRepositorio, Funcoes, EspecificacaoMovimentosPorCodigoCaixa, Movimento,
  Pedido, uModulo, EspecificacaoCaixaPorData, Math, uEntradaSaidaMoeda, PermissoesAcesso;

{$R *.dfm}

function TfrmCaixa.AbreCaixa :Boolean;
var
  repositorio   :TRepositorio;
  Especificacao :TEspecificacaoCaixaPorData;
  Caixa         :TCaixa;
begin
  repositorio   := nil;
  Caixa         := nil;
  Especificacao := nil;
  result        := false;
  try
    Especificacao := TEspecificacaoCaixaPorData.Create(Date);
    repositorio   := TFabricaRepositorio.GetRepositorio(TCaixa.ClassName);

    Caixa               := TCaixa(repositorio.GetPorEspecificacao(Especificacao));

    if assigned(Caixa) then
      avisar('O movimento de hoje já foi finalizado.')
    else begin
      Caixa := TCaixa.Create;
      Caixa.data_abertura  := now;
      Caixa.valor_abertura := edtValor.Value;

      repositorio.Salvar( Caixa );
      dm.CaixaLoja := nil;
      result := true;
    end;

  Finally
    FreeAndNil(repositorio);
    FreeAndNil(Caixa);
  end;
end;

procedure TfrmCaixa.FechaCaixa;
var
  repositorio :TRepositorio;
  Caixa       :TCaixa;
begin
  repositorio := nil;
  Caixa       := nil;
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TCaixa.ClassName);

    Caixa               := TCaixa(repositorio.Get(edtCodigo.AsInteger));

    Caixa.data_fechamento  := now;
    Caixa.valor_fechamento := edtValor.Value;

    repositorio.Salvar( Caixa );

    dm.CaixaLoja := nil;
  Finally
    FreeAndNil(repositorio);
    FreeAndNil(Caixa);
  end;
end;

procedure TfrmCaixa.btnAbreCaixaClick(Sender: TObject);
begin
  try
    if edtValor.Value <= 0 then begin
      avisar('Favor informar o valor com que o caixa será iniciado.');
      edtValor.SetFocus;
    end
    else begin

      if not confirma('Confirma abertura do caixa com o valor de '+FormatFloat('R$ ,0.00; -,0.00;',edtValor.Value)+'?') then
        Exit;

      if AbreCaixa then
        Carrega_dados_caixa;

    end;

  Except
    on E: Exception do
       Avisar(E.Message);
  end;
end;

procedure TfrmCaixa.btnFechaCaixaClick(Sender: TObject);
begin
  try
    if not confirma('O caixa só poderá ser aberto novamente no dia seguinte a última abertura.'+#13#10+#13#10+
                    'Confirma fechamento do caixa?') then
      Exit;
                    
    FechaCaixa;

    Carrega_dados_caixa;

  Except
    on E: Exception do
       Avisar(E.Message);
  end;
end;

procedure TfrmCaixa.btnMovimentoClick(Sender: TObject);
begin
  self.AbreForm(TfrmEntradaSaidaMoeda, paEntradaSaidaMoeda);
end;

procedure TfrmCaixa.Carrega_dados_caixa;
var
  repositorio        :TRepositorio;
  Caixa              :TCaixa;
begin
  repositorio          := nil;
  Caixa                := nil;

  edtValor.Clear;
  ConfiguraTela('FECHADO');

  try
    repositorio := TFabricaRepositorio.GetRepositorio(TCaixa.ClassName);
    Caixa       := TCaixa( repositorio.Get( StrToIntDef( Maior_Valor_Cadastrado('Caixa', 'Codigo') ,0) ) );

    if not assigned(Caixa) then
      exit;

   /// edtValor.Value            := Caixa.valor_abertura + CalculaValorCaixa(Caixa);

    if (Caixa.data_fechamento > 0) then
      Exit;

    edtCodigo.AsInteger       := Caixa.codigo;
    lblAbertura.Caption       := FormatDateTime('dd/mm/yyyy  -  hh:mm:ss', Caixa.data_abertura);
   // edtValor.Value            := Caixa.valor_abertura + CalculaValorCaixa(Caixa);
    lblValorAbertura.Caption  := FormatFloat('R$  ,0.00; -,0.00;', Caixa.valor_abertura);

    ConfiguraTela('ABERTO');

  Finally
    FreeAndNil(repositorio);
    FreeAndNil(Caixa);
  end;
end;

procedure TfrmCaixa.FormShow(Sender: TObject);
begin
  edtDataCorrente.Text := FormatDateTime('dd/mm/yyyy', now);
  edtHoraCorrente.Text := FormatDateTime('hh:mm:ss', now);
  Carrega_dados_caixa;

  if not pnlAberto.Visible then
    edtValor.SetFocus;
end;

function TfrmCaixa.CalculaValorCaixa(Caixa :TCaixa): Real;
var
  Especificacao : TEspecificacaoMovimentosPorCodigoCaixa;
  Movimentos    : TObjectList;
  repositorio   : TRepositorio;
  i             : integer;
begin
  result        := 0;
  Especificacao := nil;
  repositorio   := nil;

  try
    repositorio   := TFabricaRepositorio.GetRepositorio(TMovimento.ClassName);
    Especificacao := TEspecificacaoMovimentosPorCodigoCaixa.Create(Caixa);
    Movimentos    := repositorio.GetListaPorEspecificacao(Especificacao, 'DATA >= '''+DateTimeToStr(Caixa.data_abertura)+'''');

    if not assigned(Movimentos) then
      Exit;
      
    for i := 0 to Movimentos.Count - 1 do
      result := result + TMovimento(Movimentos.Items[i]).valor_pago;
      
  Finally
    FreeAndNil(Especificacao);
    FreeAndNil(repositorio);
    Movimentos.Free;    
  end;
end;

procedure TfrmCaixa.BitBtn1Click(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TfrmCaixa.ConfiguraTela(estadoTela: String);
begin
  pnlAberto.Visible      := (estadoTela = 'ABERTO');
  edtValor.ReadOnly      := (estadoTela = 'ABERTO');
  lblStatus.Caption      := estadoTela;
  edtValor.ReadOnly      := (estadoTela = 'ABERTO');
  pnlAberto.Visible      := (estadoTela = 'ABERTO');
  btnFechaCaixa.Enabled  := (estadoTela = 'ABERTO');
  btnMovimento.Enabled   := (estadoTela = 'ABERTO');
  btnAbreCaixa.Enabled   := not (estadoTela = 'ABERTO');
  imgCxAberto.Visible    := (estadoTela = 'ABERTO');
  imgCxFechado.Visible   := not (estadoTela = 'ABERTO');
  edtValor.Enabled       := not(estadoTela = 'ABERTO');

  if (estadoTela = 'ABERTO') then
    lblStatus.Font.Color      := clGreen
  else
    lblStatus.Font.Color := $000000BB;

end;

end.
