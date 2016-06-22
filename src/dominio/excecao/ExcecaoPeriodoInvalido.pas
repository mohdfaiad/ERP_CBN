unit ExcecaoPeriodoInvalido;

interface

uses
  SysUtils;

type
  TExcecaoPeriodoInvalido = class(Exception)

  public
    constructor Create;
end;

implementation

{ TExcecaoPeriodoInvalido }

constructor TExcecaoPeriodoInvalido.Create;
begin
   inherited Create('A data inicial não pode ser maior que a data final!');
end;

end.
