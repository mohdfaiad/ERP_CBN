unit Unidade;

interface

uses SysUtils, Contnrs;

type
  TUnidade = class

  private
    Fcodigo :Integer;
    Funidade_medida :Integer;
    Fdescricao :Integer;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property unidade_medida        :Integer read Funidade_medida        write Funidade_medida;
    property descricao             :Integer read Fdescricao             write Fdescricao;
end;

implementation

{ TUnidade }

end.
