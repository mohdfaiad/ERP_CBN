unit Documentos;

interface

uses System.StrUtils, System.SysUtils;

function getCPF_CNPJ(pNumeroDocumento :String) :String;
function MascaraCpfCnpj(const CpfCnpj :String): String;

implementation

uses funcoes;

function getCPF_CNPJ(pNumeroDocumento :String) :String;
begin
  result := trim(pNumeroDocumento);
  if length(pNumeroDocumento) <= 11 then
    result := zeroEsquerda(pNumeroDocumento, 11)
  else
    result := zeroEsquerda(pNumeroDocumento, 14);
end;

function MascaraCpfCnpj(const CpfCnpj :String): String;
begin
  result := trim(CpfCnpj);
  result := getCPF_CNPJ(CpfCnpj);
  result := IfThen(length(CpfCnpj) > 11,
                                        copy(CpfCnpj,1,2) +'.'+ copy(CpfCnpj,3,3) +'.'+ copy(CpfCnpj,6,3) +'/'+ copy(CpfCnpj,9,4) +'-'+ copy(CpfCnpj,13,2),
                                        copy(CpfCnpj,1,3) +'.'+ copy(CpfCnpj,4,3) +'.'+ copy(CpfCnpj,7,3) +'-'+ copy(CpfCnpj,10,2)
                   );
end;

end.
