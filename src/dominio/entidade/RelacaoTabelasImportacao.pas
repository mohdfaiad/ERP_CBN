unit RelacaoTabelasImportacao;

interface

uses SysUtils, Contnrs;

type
  TRelacaoTabelasImportacao = class

  private
    Fcodigo :Integer;
    Furl :String;
    Fid_externo :String;
    Ftabela_erp :String;
    Fid_erp :String;
    FData_alteracao: TDateTime;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property url                   :String read Furl                   write Furl;
    property id_externo            :String read Fid_externo            write Fid_externo;
    property tabela_erp            :String read Ftabela_erp            write Ftabela_erp;
    property id_erp                :String read Fid_erp                write Fid_erp;
    property data_alteracao        :TDateTime read FData_alteracao     write FData_alteracao;

  public
    class procedure criaRelacao(urlExterna, TabelaERP, IdExterno, IdERP: String; data_alteracao :String);
end;

implementation

uses repositorioRelacaoTabelasImportacao, DateTimeUtilitario;

{ TRelacaoTabelasImportacao }

class procedure TRelacaoTabelasImportacao.criaRelacao(urlExterna, TabelaERP, IdExterno, IdERP: String; data_alteracao :String);
var repositorio :TRepositorioRelacaoTabelasImportacao;
    Relacao :TRelacaoTabelasImportacao;
    data_hora :TDateTime;
begin
  try
    repositorio             := TRepositorioRelacaoTabelasImportacao.Create;
    Relacao                 := TRelacaoTabelasImportacao.Create;
    Relacao.Furl            := urlExterna;
    Relacao.Ftabela_erp     := TabelaERP;
    Relacao.Fid_externo     := IdExterno;
    Relacao.Fid_erp         := IdERP;

    if pos('-', data_alteracao) > 0 then
      data_hora := StrToDateTime(TDateTimeUtilitario.padrao_EUA_to_BR(data_alteracao))
    else
      data_hora := StrToDateTime(data_alteracao);

    Relacao.FData_alteracao := data_hora;
    repositorio.Salvar(Relacao);
  finally
    FreeAndNil(repositorio);
    FreeAndNil(Relacao);
  end;
end;

end.
