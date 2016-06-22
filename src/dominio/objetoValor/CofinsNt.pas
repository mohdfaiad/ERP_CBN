unit CofinsNt;

interface

uses
  TributacaoItemNotaFiscal;

type
  TCofinsNt = class(TTributacaoItemNotaFiscal)
  
  private
    function GetCST: String;

  public
    property CST :String read GetCST;
end;

implementation

{ TCofinsNt }

function TCofinsNt.GetCST: String;
begin
   result := '07';
end;

end.
