unit Devolucao;

interface

uses SysUtils, Contnrs;

type
  TDevolucao = class

  private
    Fcodigo_pedido: Integer;
    Fmotivo: String;
    Fcodigo: Integer;
    Fparcial_total: String;
    Fdata: TDateTime;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property codigo_pedido         :Integer read Fcodigo_pedido         write Fcodigo_pedido;
    property data                  :TDateTime read Fdata                  write Fdata;
    property motivo                :String read Fmotivo                write Fmotivo;
    property parcial_total         :String read Fparcial_total         write Fparcial_total;
end;

implementation

{ TDevolucao }

end.
