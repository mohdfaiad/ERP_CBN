unit TipoPessoa;

interface

type TTipoPessoa = (tpCliente=0, tpEmpresa=1, tpFornecedor=2, tpRepresentante=3, tpTransportadora=4);

type
  TTipoPessoaUtilitario = class

  public
    // Conversão
    class function DeEnumeradoParaString(TipoPessoa :TTipoPessoa) :String;
    class function DeStringParaEnumerado(TipoPessoa :String)      :TTipoPessoa;

    // Verificação
    class function IsDestinatarioNotaFiscal(TipoPessoa :TTipoPessoa) :Boolean;
    class function IsTransportadora(TipoPessoa :TTipoPessoa)         :Boolean;
end;

implementation

uses
  ExcecaoParametroInvalido;

{ TTipoPessoaUtilitario }

class function TTipoPessoaUtilitario.DeEnumeradoParaString(
  TipoPessoa: TTipoPessoa): String;
begin
   if      (TipoPessoa = tpCliente)        then result := 'C'
   else if (TipoPessoa = tpEmpresa)        then result := 'E'
   else if (TipoPessoa = tpFornecedor)     then result := 'F'
   else if (TipoPessoa = tpRepresentante)  then result := 'R'
   else if (TipoPessoa = tpTransportadora) then result := 'T'
   else
    raise TExcecaoParametroInvalido.Create('TTipoPessoaUtilitario', 'DeEnumeradoParaString', 'TipoPessoa :TTipoPessoa');
end;

class function TTipoPessoaUtilitario.DeStringParaEnumerado(
  TipoPessoa: String): TTipoPessoa;
begin
   case TipoPessoa[1] of
     'C': result := tpCliente;
     'E': result := tpEmpresa;
     'F': result := tpFornecedor;
     'R': result := tpRepresentante;
     'T': result := tpTransportadora;
   else raise TExcecaoParametroInvalido.Create('TTipoPessoaUtilitario', 'DeStringParaEnumerado', 'TipoPessoa :String');
   end;
end;

class function TTipoPessoaUtilitario.IsDestinatarioNotaFiscal(
  TipoPessoa: TTipoPessoa): Boolean;
begin
   result := (TipoPessoa in [tpCliente, tpFornecedor, tpRepresentante]);
end;

class function TTipoPessoaUtilitario.IsTransportadora(
  TipoPessoa: TTipoPessoa): Boolean;
begin
   result := (TipoPessoa = tpTransportadora);
end;

end.


