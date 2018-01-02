unit ConfiguracoesECommerce;

interface

uses SysUtils, Contnrs;

type
  TConfiguracoesECommerce = class

  private
    Fcodigo :Integer;
    Ftoken :String;
    Furl_base :String;
    Fcod_tabela_preco :Integer;
    FIntervalo_verificacao: SmallInt;
    FCodigo_representante: integer;
    FCodigo_empresa: integer;
    FCodigo_forma_pgto: integer;
    FUltimo_ped_importado: integer;

  public
    property codigo                :Integer  read Fcodigo                write Fcodigo;
    property token                 :String   read Ftoken                 write Ftoken;
    property url_base              :String   read Furl_base              write Furl_base;
    property cod_tabela_preco      :Integer  read Fcod_tabela_preco      write Fcod_tabela_preco;
    property intervalo_verificacao :SmallInt read FIntervalo_verificacao write FIntervalo_verificacao;
    property codigo_empresa        :integer  read FCodigo_empresa        write FCodigo_empresa;
    property codigo_representante  :integer  read FCodigo_representante  write FCodigo_representante;
    property codigo_forma_pagto    :integer  read FCodigo_forma_pgto     write FCodigo_forma_pgto;
end;

implementation

{ TConfiguracoesECommerce }

end.
