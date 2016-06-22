unit ItemConta;

interface

uses SysUtils, Contnrs;

type
  TItemConta = class

  private
    Fcodigo :Integer;
    Fcodigo_conta :Integer;
    Fcodigo_materia :Integer;
    Fquantidade :Real;
    Fpreco_custo :Real;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property codigo_conta          :Integer read Fcodigo_conta          write Fcodigo_conta;
    property codigo_materia        :Integer read Fcodigo_materia        write Fcodigo_materia;
    property quantidade            :Real    read Fquantidade            write Fquantidade;
    property preco_custo           :Real    read Fpreco_custo           write Fpreco_custo;
end;

implementation

{ TItemConta }

end.
