unit frameBuscaTransportadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Pessoa;

type
  TBuscaTransportadora = class(TFrame)
    gpbTransportadora: TGroupBox;
    lblCodigo: TStaticText;
    lblNomeRazao: TStaticText;
    edtCodigo: TEdit;
    btnBusca: TBitBtn;
    edtRazao: TEdit;

    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscaEnter(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);

  private
    FCriou                     :Boolean;
    FTransportadora            :TPessoa;
    FAposAlterarTransportadora :TNotifyEvent;

  private
    procedure Buscar    (const CodigoPessoa :Integer);
    procedure SetTransportadora(const Value :TPessoa);
    procedure SetAposAlterarTransportadora(const Value: TNotifyEvent);

  public
    constructor Create(AOwner :TComponent); override;
    destructor  Destroy;                    override;

  public
    procedure Clear;

  public
    property Transportadora             :TPessoa read FTransportadora write SetTransportadora;
    property AposAlterarTransportadora  :TNotifyEvent read FAposAlterarTransportadora write SetAposAlterarTransportadora;

end;

implementation

uses
  Repositorio,
  FabricaRepositorio,
  EspecificacaoApenasTransportadoras,
  EspecificacaoTransportadoraComCodigoIgualA,
  uPesquisaTransportadora;

{$R *.dfm}

procedure TBuscaTransportadora.edtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_RETURN) then keybd_event(VK_TAB, 0,  0, 0);
end;

procedure TBuscaTransportadora.btnBuscaEnter(Sender: TObject);
begin
   if (self.edtCodigo.Text = '0') or (self.edtCodigo.Text = '') then
     self.edtRazao.Clear;
     
   self.Buscar(StrToIntDef(self.edtCodigo.Text, 0));
   keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaTransportadora.btnBuscaClick(Sender: TObject);
begin
   self.Buscar(StrToIntDef(self.edtCodigo.Text, 0));
   keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TBuscaTransportadora.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9']) and not (key = #8) then
    Key := #0;
end;

procedure TBuscaTransportadora.Buscar(const CodigoPessoa: Integer);
var
  Repositorio                   :TRepositorio;
  T                             :TPessoa;
  ApenasTransportadoras         :TEspecificacaoApenasTransportadoras;
  TransportadoraComCodigoIgualA :TEspecificacaoTransportadoraComCodigoIgualA;
begin
   Repositorio                    := nil;
   ApenasTransportadoras          := TEspecificacaoApenasTransportadoras.Create;
   TransportadoraComCodigoIgualA  := TEspecificacaoTransportadoraComCodigoIgualA.Create(CodigoPessoa);

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
     T           := TPessoa(Repositorio.GetPorEspecificacao(TransportadoraComCodigoIgualA));

     if not Assigned(T) then begin
       frmPesquisaTransportadora := nil;

       try
         frmPesquisaTransportadora := TfrmPesquisaTransportadora.CreateModoBusca(nil, ApenasTransportadoras);
         frmPesquisaTransportadora.ShowModal;

         if (frmPesquisaTransportadora.ModalResult = mrOK) then begin
            T          := TPessoa(Repositorio.Get(frmPesquisaTransportadora.cdsCODIGO.AsInteger));

            if Assigned(T) then begin
              self.Transportadora := T;
              self.FCriou         := true;
            end;
         end
         else
          self.Clear;
       finally
         frmPesquisaTransportadora.Release;
         frmPesquisaTransportadora := nil;
       end;
     end
     else begin
       self.Transportadora := T;
       self.FCriou         := true;
     end;

   finally
     FreeAndNil(Repositorio);
     FreeAndNil(ApenasTransportadoras);
     FreeAndNil(TransportadoraComCodigoIgualA);
   end;
end;

procedure TBuscaTransportadora.Clear;
begin
   if Self.FCriou and Assigned(self.FTransportadora) then
    FreeAndNil(self.FTransportadora);

   self.edtCodigo.Clear;
   self.edtRazao.Clear;
   self.FCriou := false;
end;

constructor TBuscaTransportadora.Create(AOwner: TComponent);
begin
  inherited;

  self.FTransportadora := nil;
  self.FCriou          := false;
end;

destructor TBuscaTransportadora.Destroy;
begin
  if self.FCriou and Assigned(self.FTransportadora) then
    FreeAndNil(self.FTransportadora);

  inherited;
end;

procedure TBuscaTransportadora.SetTransportadora(const Value: TPessoa);
begin
   try
     if (Value = self.FTransportadora) then
      exit;
   except
     on E: EAccessViolation do
   end;

   if self.FCriou and Assigned(self.FTransportadora) then begin
      FreeAndNil(self.FTransportadora);
      self.FCriou := false;
   end;

   FTransportadora := Value;

   if Assigned(self.FAposAlterarTransportadora) then
    self.FAposAlterarTransportadora(FTransportadora);

  if Assigned(self.FTransportadora) then begin
    self.edtCodigo.Text := IntToStr(self.FTransportadora.Codigo);
    self.edtRazao.Text  := self.FTransportadora.Razao;
  end;
end;

procedure TBuscaTransportadora.SetAposAlterarTransportadora(
  const Value: TNotifyEvent);
begin
  FAposAlterarTransportadora := Value;
end;

end.
