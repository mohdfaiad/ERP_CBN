unit Colecao;

interface

uses SysUtils, Contnrs;

type
  TColecao = class

  private
    Fcodigo :Integer;
    Fdescricao :String;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property descricao             :String  read Fdescricao             write Fdescricao;
end;

implementation

{ TColecao }

end.
