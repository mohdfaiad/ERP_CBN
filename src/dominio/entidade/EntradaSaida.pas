unit EntradaSaida;

interface

uses SysUtils, Contnrs;

type
  TEntradaSaida = class

  private
    Fcodigo :Integer;
    Fcodigo_produto :Integer;
    Fcodigo_cor :Integer;
    Fcodigo_tamanho :Integer;
    Fcodigo_intervalo :Integer;
    Fdata_lancamento :TDateTime;
    Fdata_producao :TDateTime;
    Fquantidade :Real;
    Ftipo :String;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property codigo_produto        :Integer read Fcodigo_produto        write Fcodigo_produto;
    property codigo_cor            :Integer read Fcodigo_cor            write Fcodigo_cor;
    property codigo_tamanho        :Integer read Fcodigo_tamanho        write Fcodigo_tamanho;
    property codigo_intervalo      :Integer read Fcodigo_intervalo      write Fcodigo_intervalo;
    property data_lancamento       :TDateTime read Fdata_lancamento       write Fdata_lancamento;
    property data_producao         :TDateTime read Fdata_producao         write Fdata_producao;
    property quantidade            :Real read Fquantidade            write Fquantidade;
    property tipo                  :String read Ftipo                  write Ftipo;
end;

implementation

{ TEntradaSaida }

end.
