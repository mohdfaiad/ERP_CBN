unit FormaPagamento;

interface

uses
  SysUtils,
  Contnrs;

type
  TFormaPagamento = class

  private
    FCodigo      :Integer;
    FDescricao   :String;
    FNumParcelas :Integer;
    FDesconto    :Real;
    FAcrescimo   :Real;
    FPerc_comissao :Real;
    FParcelas    :TObjectList;

    procedure SetCodigo     (const value :Integer);
    procedure SetDescricao  (const value :String);
    procedure SetNumParcelas(const value :Integer);
    procedure SetDesconto   (const value :Real);
    procedure SetAcrescimo  (const value :Real);

  private
    function GetParcelas  :TObjectList;
    function GetIsAVista  :Boolean;

  public
    constructor Create;
    destructor  Destroy; override;

  public
    property Codigo      :Integer     read FCodigo      write SetCodigo;
    property Descricao   :String      read FDescricao   write SetDescricao;
    property NumParcelas :Integer     read FNumParcelas write SetNumParcelas;
    property Desconto    :Real        read FDesconto    write SetDesconto;
    property Acrescimo   :Real        read FAcrescimo   write SetAcrescimo;
    property Perc_Comissao :Real      read FPerc_comissao write FPerc_comissao;
    property Parcelas    :TObjectList read GetParcelas;
    property IsAVista    :Boolean     read GetIsAVista;
  end;

implementation

uses
  Repositorio,
  FabricaRepositorio,
  Especificacao, FormaPagamentoParcelas,
  EspecificacaoParcelasPorFormaPagamento;

{ TFormaPagamento }

constructor TFormaPagamento.Create;
begin
   self.FParcelas := nil;
end;

destructor TFormaPagamento.Destroy;
begin
   FreeAndNil(self.FParcelas);

  inherited;
end;

function TFormaPagamento.GetIsAVista: Boolean;
begin
   try
     result := (((self.FNumParcelas = 1) or (self.FNumParcelas = 0))         and
                (TFormaPagamentoParcelas(self.Parcelas[0]).DiasParcela = 0));
   except
     // Se gerar uma exceção é porque a forma de pagamento não tem parcelas, então ela é a vista
     result := true;
   end;
end;

function TFormaPagamento.GetParcelas: TObjectList;
var
  Repositorio :TRepositorio;
  Esp         :TEspecificacao;
begin
   if not Assigned(self.FParcelas) then begin
     Repositorio := nil;
     Esp         := nil;

     try
       Esp         := TEspecificacaoParcelasPorFormaPagamento.Create(self.FCodigo);
       Repositorio := TFabricaRepositorio.GetRepositorio(TFormaPagamentoParcelas.ClassName);

       self.FParcelas := Repositorio.GetListaPorEspecificacao(Esp);
     finally
       FreeAndNil(Esp);
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FParcelas;
end;

procedure TFormaPagamento.SetAcrescimo(const value: Real);
begin
  FAcrescimo := value;
end;

procedure TFormaPagamento.SetCodigo(const value: Integer);
begin
  FCodigo := value;
end;

procedure TFormaPagamento.SetDesconto(const value: Real);
begin
  FDesconto := value;
end;

procedure TFormaPagamento.SetDescricao(const value: String);
begin
  FDescricao := value;
end;

procedure TFormaPagamento.SetNumParcelas(const value: Integer);
begin
  FNumParcelas := value;
end;

end.
