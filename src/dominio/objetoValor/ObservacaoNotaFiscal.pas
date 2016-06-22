unit ObservacaoNotaFiscal;

interface

uses
  MetodoDelegadoObtemCampoInteger,
  MetodoDelegadoObtemCampoReal,
  MetodoDelegadoObtemCampoString;

type
  TObservacaoNotaFiscal = class

  private
    FBuscadorCodigoNotaFiscal              :TMetodoDelegadoObtemCampoInteger;
    FBuscadorRegimeTributarioDestinatario  :TMetodoDelegadoObtemCampoInteger;
    FBuscadorAliquotaCreditoSN             :TMetodoDelegadoObtemCampoReal;
    FBuscadorValorCreditoSN                :TMetodoDelegadoObtemCampoReal;
    FBuscadorEnderecoEntrega               :TMetodoDelegadoObtemCampoString;
    FObservacoes                           :String;
    FObservacoesGeradasPeloSistema         :String;
    FDadosAdicionais                       :String;
    procedure SetDadosAdicionais(const Value: String);

  private
    procedure SetObservacoes(const Value: String);

  private
    function GetCodigoNotaFiscal              :Integer;
    function GetDadosAdicionais               :String;
    function GetObservacoesGeradasPeloSistema :String;
    function GetObservacoes                   :String;

  public
    constructor CriaParaRepositorio(Observacoes, ObservacoesGeradasPeloSistema :String);

  public
    procedure AdicionarBuscadorDeCodigoNotaFiscal            (Buscador :TMetodoDelegadoObtemCampoInteger);
    procedure AdicionarBuscadorDeRegimeTributarioDestinatario(Buscador :TMetodoDelegadoObtemCampoInteger);
    procedure AdicionarBuscadorDeAliquotaCreditoSN           (Buscador :TMetodoDelegadoObtemCampoReal);
    procedure AdicionarBuscadorDeValorCreditoSN              (Buscador :TMetodoDelegadoObtemCampoReal);
    procedure AdicionarBuscadorEnderecoEntrega               (Buscador :TMetodoDelegadoObtemCampoString);

  public
    property CodigoNotaFiscal              :Integer read GetCodigoNotaFiscal;
    property Observacoes                   :String  read GetObservacoes                   write SetObservacoes;
    property ObservacoesGeradasPeloSistema :String  read GetObservacoesGeradasPeloSistema;
    property DadosAdicionais               :String  read GetDadosAdicionais               write SetDadosAdicionais;

  public
    procedure LimparObservacoesGeradasPeloSistema;
end;

implementation

uses SysUtils, TipoRegimeTributario;

{ TObservacaoNotaFiscal }

procedure TObservacaoNotaFiscal.AdicionarBuscadorDeAliquotaCreditoSN(
  Buscador: TMetodoDelegadoObtemCampoReal);
begin
   self.FBuscadorAliquotaCreditoSN := Buscador;
end;

procedure TObservacaoNotaFiscal.AdicionarBuscadorDeCodigoNotaFiscal(
  Buscador: TMetodoDelegadoObtemCampoInteger);
begin
   self.FBuscadorCodigoNotaFiscal := Buscador;
end;

procedure TObservacaoNotaFiscal.AdicionarBuscadorDeRegimeTributarioDestinatario(
  Buscador: TMetodoDelegadoObtemCampoInteger);
begin
   self.FBuscadorRegimeTributarioDestinatario := Buscador;
end;

procedure TObservacaoNotaFiscal.AdicionarBuscadorDeValorCreditoSN(
  Buscador: TMetodoDelegadoObtemCampoReal);
begin
   self.FBuscadorValorCreditoSN := Buscador;
end;

procedure TObservacaoNotaFiscal.AdicionarBuscadorEnderecoEntrega(
  Buscador: TMetodoDelegadoObtemCampoString);
begin
   self.FBuscadorEnderecoEntrega := Buscador;
end;

constructor TObservacaoNotaFiscal.CriaParaRepositorio(Observacoes,
  ObservacoesGeradasPeloSistema: String);
begin
   self.FObservacoes                    := Observacoes;
   self.FObservacoesGeradasPeloSistema  := ObservacoesGeradasPeloSistema;
end;

function TObservacaoNotaFiscal.GetCodigoNotaFiscal: Integer;
begin
   try
     result := self.FBuscadorCodigoNotaFiscal;
   except
     on E: EAccessViolation do
      raise EAccessViolation.Create('Erro em: TObservacaoNotaFiscal.GetCodigoNotaFiscal: Integer;'+#13+
                                    'Atributo FBuscadorCodigoNotaFiscal não foi instânciado!');
   end;
end;

function TObservacaoNotaFiscal.GetDadosAdicionais: String;
begin
   result := UpperCase(Trim(self.Observacoes + #13 + self.ObservacoesGeradasPeloSistema)); 
end;

function TObservacaoNotaFiscal.GetObservacoes: String;
begin
   result := UpperCase(Trim(self.FObservacoes));
end;

function TObservacaoNotaFiscal.GetObservacoesGeradasPeloSistema: String;
const
  PREFIXO = 'Erro em: TObservacaoNotaFiscal.GetObservacoesGeradasPeloSistema: String;'+#13;
  SUFIXO  = ' não foi instânciado!';
begin
   if (Trim(self.FObservacoesGeradasPeloSistema) <> '') then begin
     result := self.FObservacoesGeradasPeloSistema;
     Exit;
   end;

   if not Assigned(self.FBuscadorRegimeTributarioDestinatario) then
    raise EAccessViolation.Create(PREFIXO+'FBuscadorRegimeTributarioDestinatario'+SUFIXO);

   if not Assigned(self.FBuscadorEnderecoEntrega) then
    raise EAccessViolation.Create(PREFIXO+'FBuscadorEnderecoEntrega'+SUFIXO);

   result := self.FBuscadorEnderecoEntrega;

   if (TTipoRegimeTributarioUtilitario.DeIntegerParaEnumerado(self.FBuscadorRegimeTributarioDestinatario) = trtSimplesNacional) then begin
   if not Assigned(self.FBuscadorAliquotaCreditoSN) then
    raise EAccessViolation.Create(PREFIXO+'FBuscadorAliquotaCreditoSN'+SUFIXO);

   if not Assigned(self.FBuscadorValorCreditoSN) then
    raise EAccessViolation.Create(PREFIXO+'FBuscadorValorCreditoSN'+SUFIXO);

    result := (result+#13+
               'DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL NAO GERA DIREITO A CREDITO FISCAL DE IPI. '                     +
               'PERMITE O APROVEITAMENTO DO CREDITO DE ICMS NO VALOR DE '+ FormatFloat('R$ ,0.00;R$ -,0.00', self.FBuscadorValorCreditoSN)+' '+
               'CORRESPONDENTE A ALÍQUOTA DE '+FormatFloat('#0.00%', self.FBuscadorAliquotaCreditoSN)+', NOS TERMOS DO ART.23 DA '            +
               'LC 123/2006 VLR. DO ICMS DESTACADO EM S/NF = '+FormatFloat('R$ ,0.00;R$ -,0.00', self.FBuscadorValorCreditoSN));
   end;


   result := Trim(result);
end;

procedure TObservacaoNotaFiscal.LimparObservacoesGeradasPeloSistema;
begin
   self.FObservacoesGeradasPeloSistema := '';
end;

procedure TObservacaoNotaFiscal.SetDadosAdicionais(const Value: String);
begin
  FDadosAdicionais := Value;
end;

procedure TObservacaoNotaFiscal.SetObservacoes(const Value: String);
begin
   FObservacoes := Value;
end;

end.
