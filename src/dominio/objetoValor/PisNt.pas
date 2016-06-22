unit PisNt;

interface

uses
  TributacaoItemNotaFiscal;

type
  TPisNt = class(TTributacaoItemNotaFiscal)

  private
    function GetCST: String;

  public
    property CST :String read GetCST;
end;

implementation

{ TPisNt }

function TPisNt.GetCST: String;
begin
   result := '07';
end;

end.
