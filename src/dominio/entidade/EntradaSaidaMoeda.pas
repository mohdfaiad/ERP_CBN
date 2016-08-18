unit EntradaSaidaMoeda;

interface

uses SysUtils, Contnrs;

type
  TEntradaSaidaMoeda = class

  private
    Fcodigo :Integer;
    Fcodigo_caixa :Integer;
    Ftipo :String;
    Fvalor :Real;
    Fdescricao :String;
    Fhora :TDateTime;
    FTipo_moeda: Integer;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property codigo_caixa          :Integer read Fcodigo_caixa          write Fcodigo_caixa;
    property tipo                  :String read Ftipo                  write Ftipo;
    property valor                 :Real read Fvalor                 write Fvalor;
    property descricao             :String read Fdescricao             write Fdescricao;
    property hora                  :TDateTime read Fhora                  write Fhora;
    property tipo_moeda            :Integer   read FTipo_moeda         write FTipo_moeda;
end;

implementation

{ TEntradaSaidaMoeda }

end.
