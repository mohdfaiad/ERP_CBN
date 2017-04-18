unit DirecionamentoEntrada;

interface

uses SysUtils, Contnrs;

type
  TDirecionamentoEntrada = class

  private
    Fquantidade_conf: Real;
    Fcodigo_entrada: Integer;
    Fcodigo_pedido: Integer;
    Fcodigo: Integer;
    Fconferido: String;
    Fquantidade: Real;

  public
    property quantidade_conf       :Real read Fquantidade_conf       write Fquantidade_conf;
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property codigo_entrada        :Integer read Fcodigo_entrada        write Fcodigo_entrada;
    property codigo_pedido         :Integer read Fcodigo_pedido         write Fcodigo_pedido;
    property quantidade            :Real read Fquantidade            write Fquantidade;
    property conferido             :String read Fconferido             write Fconferido;
end;

implementation

{ TDirecionamentoEntrada }

end.
