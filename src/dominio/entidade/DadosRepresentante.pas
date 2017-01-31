unit DadosRepresentante;

interface

uses SysUtils, Contnrs;

type
  TDadosRepresentante = class

  private
    Fcodigo :Integer;
    Fcodigo_representante :Integer;
    Fpercentagem_comissao :Real;
    FRep_ecommerce: String;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property codigo_representante  :Integer read Fcodigo_representante  write Fcodigo_representante;
    property percentagem_comissao  :Real    read Fpercentagem_comissao  write Fpercentagem_comissao;
    property rep_ecommerce         :String  read FRep_ecommerce         write FRep_ecommerce;
end;

implementation

{ TDadosRepresentante }

end.
