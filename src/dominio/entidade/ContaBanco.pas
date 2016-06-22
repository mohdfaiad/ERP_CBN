unit ContaBanco;

interface

uses SysUtils, Contnrs;

type
  TContaBanco = class

  private
    Fcodigo :Integer;
    Fbanco :String;
    Ftitular :String;
    Fagencia :String;
    Fnumero_conta :String;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property banco                 :String read Fbanco                 write Fbanco;
    property titular               :String read Ftitular               write Ftitular;
    property agencia               :String read Fagencia               write Fagencia;
    property numero_conta          :String read Fnumero_conta          write Fnumero_conta;
end;

implementation

{ TContaBanco }

end.
