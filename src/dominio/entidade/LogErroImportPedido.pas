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
    FImportador :String;
    FNum_pedido: String;
    FExportado: Boolean;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property erro                  :String read Ferro                  write Ferro;
    property data                  :TDateTime read Fdata                  write Fdata;
    property hora                  :TDateTime read Fhora                  write Fhora;
    property verificado            :Boolean read Fverificado            write Fverificado;
    property importador            :String  read FImportador            write FImportador;
    property num_pedido            :String  read FNum_pedido            write FNum_pedido;
    property exportado             :Boolean  read FExportado             write FExportado;
end;

implementation

{ TLogErroImportPedido }

end.
