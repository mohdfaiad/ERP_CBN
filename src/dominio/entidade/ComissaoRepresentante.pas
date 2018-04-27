unit ComissaoRepresentante;

interface

uses
  SysUtils,
  Contnrs, ComissaoHasLancamentos, Lancamento;

type
  TComissaoRepresentante = class

  private
    Fcodigo: integer;
    Fmes: integer;
    Fcodigo_representante: integer;
    Fano: integer;
    FHasLancamentos :TObjectList;
    FApenas_uma_parcela: Boolean;

    procedure Setano(const Value: integer);
    procedure Setcodigo(const Value: integer);
    procedure Setcodigo_representante(const Value: integer);
    procedure Setmes(const Value: integer);
    function GetHasLancamentos: TObjectList;
    function GetLancamentoReferenteComissao: TLancamento;

  public
    property codigo               :integer read Fcodigo write Setcodigo;
    property codigo_representante :integer read Fcodigo_representante write Setcodigo_representante;
    property ano                  :integer read Fano write Setano;
    property mes                  :integer read Fmes write Setmes;
    property Apenas_uma_parcela  :Boolean read FApenas_uma_parcela  write FApenas_uma_parcela;

  public
    property HasLancamentos       :TObjectList read GetHasLancamentos;
    property LancamentoReferenteComissao :TLancamento read GetLancamentoReferenteComissao;

  public
    Destructor destroy;override;

end;

implementation

uses EspecificacaoCodigosLancamentoPorCodigoComissao, repositorio, fabricaRepositorio;

{ TComissaoRepresentante }

destructor TComissaoRepresentante.destroy;
begin
  if Assigned(FHasLancamentos) then
    FHasLancamentos.free;
  inherited;
end;

function TComissaoRepresentante.GetHasLancamentos: TObjectList;
var especificacao :TEspecificacaoCodigosLancamentoPorCodigoComissao;
    repositorio   :TRepositorio;
begin
  try
    repositorio       := nil;
    especificacao     := nil;
    if not assigned(FHasLancamentos) then
    begin
      repositorio     := TFabricaRepositorio.GetRepositorio(TComissaoHasLancamentos.ClassName);
      especificacao   := TEspecificacaoCodigosLancamentoPorCodigoComissao.Create( self.Fcodigo );
      FHasLancamentos := repositorio.GetListaPorEspecificacao(especificacao);
    end;

    result := FHasLancamentos;
  finally
    FreeAndNil(repositorio);
    FreeAndNil(especificacao);
  end;
end;

function TComissaoRepresentante.GetLancamentoReferenteComissao: TLancamento;
var
  i: Integer;
begin
  result := nil;

  if not assigned(FHasLancamentos) then
    HasLancamentos;

  if not assigned(FHasLancamentos) then
    exit;

  {tipo "Q" significa o lançamento referente a comissão mensal do representante em questão }
  for i := 0 to self.FHasLancamentos.Count-1 do
    if TComissaoHasLancamentos(self.FHasLancamentos.Items[i]).tipo = 'Q' then
      result := TComissaoHasLancamentos(self.FHasLancamentos.Items[i]).Lancamento;
end;

procedure TComissaoRepresentante.Setano(const Value: integer);
begin
  Fano := Value;
end;

procedure TComissaoRepresentante.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TComissaoRepresentante.Setcodigo_representante(
  const Value: integer);
begin
  Fcodigo_representante := Value;
end;

procedure TComissaoRepresentante.Setmes(const Value: integer);
begin
  Fmes := Value;
end;

end.
