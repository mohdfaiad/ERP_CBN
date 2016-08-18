unit OrdemServico;

interface

uses SysUtils, Contnrs;

type
  TOrdemServico = class

  private
    Fcodigo :Integer;
    Fnumero :Integer;
    Fcodigo_produto :Integer;
    Fcodigo_cor :Integer;
    Fcodigo_tamanho :Integer;
    Fquantidade :Integer;
    FImpresso: Boolean;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property numero                :Integer read Fnumero                write Fnumero;
    property codigo_produto        :Integer read Fcodigo_produto        write Fcodigo_produto;
    property codigo_cor            :Integer read Fcodigo_cor            write Fcodigo_cor;
    property codigo_tamanho        :Integer read Fcodigo_tamanho        write Fcodigo_tamanho;
    property quantidade            :Integer read Fquantidade            write Fquantidade;
    property impresso              :Boolean read FImpresso              write FImpresso;
end;

implementation

{ TOrdemServico }

end.
