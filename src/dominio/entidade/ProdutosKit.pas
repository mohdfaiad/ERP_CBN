unit ProdutosKit;

interface

uses SysUtils, Contnrs;

type
  TProdutosKit = class

  private
    Fcodigo :Integer;
    Fcodigo_kit :Integer;
    Fcodigo_produto :Integer;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property codigo_kit            :Integer read Fcodigo_kit            write Fcodigo_kit;
    property codigo_produto        :Integer read Fcodigo_produto        write Fcodigo_produto;
end;

implementation

{ TProdutosKit }

end.
