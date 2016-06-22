unit EspecificacaoComissaoRepresentantePorAnoMes;

interface

uses Especificacao;

type
  TEspecificacaoComissaoRepresentantePorAnoMes = class(TEspecificacao)

  private
    FCodigoRepresentante :Integer;
    FAno :Integer;
    FMes :Integer;

  public
    constructor Create(CodigoRepresentante, ano, mes :Integer);

  public
    function SatisfeitoPor(Comissao_representante :TObject) :Boolean; override;

end;    

implementation

uses ComissaoRepresentante;

{ TEspecificacaoComissaoRepresentantePorAnoMes }

constructor TEspecificacaoComissaoRepresentantePorAnoMes.Create(
  CodigoRepresentante, ano, mes: Integer);
begin
  self.FCodigoRepresentante := CodigoRepresentante;
  self.FAno                 := ano;
  self.FMes                 := mes;
end;

function TEspecificacaoComissaoRepresentantePorAnoMes.SatisfeitoPor(
  Comissao_representante: TObject): Boolean;
var
  C :TComissaoRepresentante;
begin
   C := (Comissao_representante as TComissaoRepresentante);

   result := (C.codigo_representante = self.FCodigoRepresentante) and
             (C.ano = self.FAno) and (C.mes = self.FMes);
end;

end.
