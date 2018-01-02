unit EntradaSaidaMateria;

interface

uses SysUtils, Contnrs;

type
  TEntradaSaidaMateria = class

  private
    Fcodigo :Integer;
    Fcodigo_materia :Integer;
    Fquantidade :Real;
    Fdata_movimento :TDateTime;
    Ftipo :String;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property codigo_materia        :Integer read Fcodigo_materia        write Fcodigo_materia;
    property quantidade            :Real read Fquantidade            write Fquantidade;
    property data_movimento        :TDateTime read Fdata_movimento        write Fdata_movimento;
    property tipo                  :String read Ftipo                  write Ftipo;
end;

implementation

{ TEntradaSaidaMateria }

end.
