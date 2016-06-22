unit IntervaloProducao;

interface

uses SysUtils, Contnrs;

type
  TIntervaloProducao = class

  private
    Fcodigo :Integer;
    Fhora_inicio :TDateTime;
    Fhora_fim :TDateTime;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property hora_inicio           :TDateTime read Fhora_inicio           write Fhora_inicio;
    property hora_fim              :TDateTime read Fhora_fim              write Fhora_fim;
end;

implementation

{ TIntervaloProducao }

end.
