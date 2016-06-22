unit frameBuscaContador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, RxToolEdit, RxCurrEdit, Contador;

type
  TBuscaContador = class(TFrame)
    edtCodigo: TCurrencyEdit;
    btnBusca: TBitBtn;
    edtNome: TEdit;
    StaticText2: TStaticText;
    StaticText1: TStaticText;
    procedure btnBuscaClick(Sender: TObject);
    procedure edtNomeEnter(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);

  private
    FContador :TContador;
    Fcodigo: Integer;
    FExecutarAposBuscar: TNotifyEvent;
    FExecutarAposLimpar: TNotifyEvent;

    procedure buscaContador;
    function selecionaContador :String;
    procedure setaContador;

  private
    procedure SetContador          (const Value: TContador);
    procedure Setcodigo            (const Value: Integer);
    procedure SetExecutarAposBuscar(const Value: TNotifyEvent);
    procedure SetExecutarAposLimpar(const Value: TNotifyEvent);

  public
    procedure limpa;

    property contador :TContador read FContador write SetContador;
    property codigo   :Integer   read Fcodigo   write Setcodigo;

  public
    property ExecutarAposBuscar :TNotifyEvent read FExecutarAposBuscar write SetExecutarAposBuscar;
    property ExecutarAposLimpar :TNotifyEvent read FExecutarAposLimpar write SetExecutarAposLimpar;
end;

implementation

uses uPesquisaSimples, Repositorio, FabricaRepositorio;

{$R *.dfm}

{ TBuscaContador }

procedure TBuscaContador.buscaContador;
begin
  setaContador;

  if not assigned( FContador ) then
    selecionaContador;
end;

procedure TBuscaContador.limpa;
begin
  Fcodigo := 0;
  edtNome.Clear;
  edtCodigo.Clear;

  if assigned(FContador) then
    FreeAndNil(FContador);

  if Assigned(FExecutarAposLimpar) then
     self.FExecutarAposLimpar(self);

end;

function TBuscaContador.selecionaContador: String;
begin
  Result := '';

  frmPesquisaSimples := TFrmPesquisaSimples.Create(Self,'Select codigo, nome from Contadores',
                                                        'CODIGO', 'Selecione o Contador desejado...');

  if frmPesquisaSimples.ShowModal = mrOk then begin
    Result := frmPesquisaSimples.cds_retorno.Fields[0].AsString;
    edtCodigo.Text := Result;
    setaContador;
  end;
  frmPesquisaSimples.Release;
  
end;

procedure TBuscaContador.setaContador;
var
    RepContador :TRepositorio;
begin

  RepContador := TFabricaRepositorio.GetRepositorio(TContador.ClassName);
  FContador   := TContador(RepContador.Get(edtCodigo.AsInteger));

  if Assigned(FContador) then begin

    edtCodigo.Value  := FContador.Codigo;
    edtNome.Text     := FContador.nome;
    self.Fcodigo     := Fcontador.codigo;

    if Assigned(FContador) and Assigned(FExecutarAposBuscar) then
     self.FExecutarAposBuscar(FContador);
  end
  else limpa;
end;

procedure TBuscaContador.Setcodigo(const Value: Integer);
begin
  Fcodigo := value;
  edtCodigo.AsInteger := value;
  setaContador;
end;

procedure TBuscaContador.SetContador(const Value: TContador);
begin
  FContador := Value;
end;

procedure TBuscaContador.SetExecutarAposBuscar(const Value: TNotifyEvent);
begin
  FExecutarAposBuscar := Value;
end;

procedure TBuscaContador.SetExecutarAposLimpar(const Value: TNotifyEvent);
begin
  FExecutarAposLimpar := Value;
end;

procedure TBuscaContador.btnBuscaClick(Sender: TObject);
begin
  selecionaContador;
end;

procedure TBuscaContador.edtNomeEnter(Sender: TObject);
begin
  if not Assigned(FContador) or (FContador.Codigo <= 0) then
    btnBusca.Click;

  keybd_event(VK_RETURN, 0, 0, 0); 
end;

procedure TBuscaContador.edtCodigoChange(Sender: TObject);
begin
  edtNome.Clear;

  if (self.edtCodigo.AsInteger <= 0) then
    self.limpa;
end;

procedure TBuscaContador.edtCodigoExit(Sender: TObject);
begin
  if edtCodigo.AsInteger > 0 then
    buscaContador;
end;

end.
