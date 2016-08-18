unit ProdutosKit;

interface

uses SysUtils, Contnrs;

type
  TProdutosKit = class

  private
    Fcodigo :Integer;
    Fcodigo_kit :Integer;
    Fcodigo_produto :Integer;
    Fcodigo_cor: Integer;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property codigo_kit            :Integer read Fcodigo_kit            write Fcodigo_kit;
    property codigo_produto        :Integer read Fcodigo_produto        write Fcodigo_produto;
    property codigo_cor            :Integer read Fcodigo_cor            write Fcodigo_cor;
end;

implementation

{ TProdutosKit }

end.
