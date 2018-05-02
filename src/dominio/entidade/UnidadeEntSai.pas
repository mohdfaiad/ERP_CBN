unit UnidadeEntSai;

interface

uses SysUtils, Contnrs;

type
  TUnidadeEntSai = class

  private
    Fcodigo :Integer;
    Fcodigo_materia :Integer;
    Funidade_movimento :String;
    Fquantidade :Real;
    FTipo: String;
    Funidade_sistema: String;

  public
    property codigo            :Integer read Fcodigo             write Fcodigo;
    property codigo_materia    :Integer read Fcodigo_materia     write Fcodigo_materia;
    property unidade_movimento :String  read Funidade_movimento  write Funidade_movimento;
    property quantidade        :Real    read Fquantidade         write Fquantidade;
    property unidade_sistema   :String  read Funidade_sistema    write Funidade_sistema;
    property tipo              :String  read FTipo               write FTipo;
end;

implementation

{ TUnidadeSaida }

end.
