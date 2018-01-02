unit LogErroImportPedido;

interface

uses SysUtils, Contnrs;

type
  TLogErroImportPedido = class

  private
    Fcodigo :Integer;
    Ferro :String;
    Fdata :TDateTime;
    Fhora :TDateTime;
    Fverificado :Boolean;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property erro                  :String read Ferro                  write Ferro;
    property data                  :TDateTime read Fdata                  write Fdata;
    property hora                  :TDateTime read Fhora                  write Fhora;
    property verificado            :Boolean read Fverificado            write Fverificado;
end;

implementation

{ TLogErroImportPedido }

end.
