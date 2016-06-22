unit IpiNt;

interface

uses
  TributacaoItemNotaFiscal;

type
  TIpiNt = class(TTributacaoItemNotaFiscal)
  
  private
    function GetCST: String;

  public
    property CST :String read GetCST;
end;

implementation

{ TIpiNt }

function TIpiNt.GetCST: String;
begin
   result := '52';
end;

end.
