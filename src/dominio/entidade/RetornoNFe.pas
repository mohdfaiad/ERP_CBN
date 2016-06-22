unit RetornoNFe;

interface

type
  TRetornoNFe = class

  private
    FCodigoNotaFiscal :Integer;
    FStatus           :String;
    FMotivo           :String;

  private
    function GetCodigoNotaFiscal :Integer;
    function GetMotivo           :String;
    function GetStatus           :String;

  public
    constructor Create(CodigoNF    :Integer;
                       Status      :String;
                       Motivo      :String);

  public
    property CodigoNotaFiscal :Integer    read GetCodigoNotaFiscal;
    property Status           :String     read GetStatus;
    property Motivo           :String     read GetMotivo;

  public
    procedure AlterarStatus(const Status :String; const Motivo :String);
end;

implementation

uses
  ExcecaoParametroInvalido,
  StringUtilitario, SysUtils, StrUtils;

{ TRetornoNFe }

procedure TRetornoNFe.AlterarStatus(const Status, Motivo: String);
const
  NOME_METODO = 'AlteraStatus(const Status, Motivo: String)';
begin
   if TStringUtilitario.EstaVazia(Status) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, NOME_METODO, 'Status');

   if TStringUtilitario.EstaVazia(Motivo) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, NOME_METODO, 'Motivo');

   self.FStatus := IfThen(Status = '135', '100', Status);
   self.FMotivo := IfThen(Status = '135', 'Autorizado o uso da NF-e',Motivo);
end;

constructor TRetornoNFe.Create(CodigoNF: Integer; Status, Motivo: String);
const
  NOME_METODO = 'Create(CodigoNF: Integer; Status, Motivo,)';
begin
   if (CodigoNF <= 0) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, NOME_METODO, 'CodigoNF');

   if TStringUtilitario.EstaVazia(Status) or (Length(Status) <> 3) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, NOME_METODO, 'Status');

   if TStringUtilitario.EstaVazia(Motivo) then
    raise TExcecaoParametroInvalido.Create(self.ClassName, NOME_METODO, 'Motivo');

   self.FCodigoNotaFiscal := CodigoNF;
   self.FStatus           := Status;
   self.FMotivo           := Motivo;
end;

function TRetornoNFe.GetCodigoNotaFiscal: Integer;
begin
   result := self.FCodigoNotaFiscal;
end;

function TRetornoNFe.GetMotivo: String;
begin
   result := self.FMotivo;
end;

function TRetornoNFe.GetStatus: String;
begin
   result := self.FStatus;
end;

end.
