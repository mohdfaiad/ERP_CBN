unit CoresKit;

interface

uses SysUtils, Contnrs, Cor;

type
  TCoresKit = class

  private
    Fcodigo :Integer;
    Fcodigo_kit :Integer;
    Fcodigo_cor :Integer;
    FCor: TCor;
    function GetCor: TCor;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property codigo_kit            :Integer read Fcodigo_kit            write Fcodigo_kit;
    property codigo_cor            :Integer read Fcodigo_cor            write Fcodigo_cor;

  public
    property Cor :TCor  read GetCor;
end;

implementation

{ TCoresKit }

uses repositorio, fabricaRepositorio;

function TCoresKit.GetCor: TCor;
var repositorio :TRepositorio;
begin
  repositorio := nil;

  if not assigned(FCor) then
  begin
    repositorio := TFabricaRepositorio.GetRepositorio(TCor.ClassName);
    FCor        := TCor(repositorio.Get(Fcodigo_cor));
  end;

  result := FCor;
end;

end.
