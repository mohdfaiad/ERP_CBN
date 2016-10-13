unit Grupo;

interface

uses SysUtils, Contnrs;

type
  TGrupo = class

  private
    Fcodigo :Integer;
    Fdescricao :String;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property descricao             :String read Fdescricao             write Fdescricao;
end;

implementation

{ TGrupo }

end.
