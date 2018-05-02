unit PlanoContasContabeis;

interface

uses SysUtils, Contnrs;

type
  TPlanoContasContabeis = class

  private
    Fcodigo :Integer;
    Fdt_alt :TDateTime;
    Fcod_nat_cc :String;
    Find_cta :String;
    Fnivel :Integer;
    Fcod_cta :String;
    Fnome_cta :String;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property dt_alt                :TDateTime read Fdt_alt                write Fdt_alt;
    property cod_nat_cc            :String read Fcod_nat_cc            write Fcod_nat_cc;
    property ind_cta               :String read Find_cta               write Find_cta;
    property nivel                 :Integer read Fnivel                 write Fnivel;
    property cod_cta               :String read Fcod_cta               write Fcod_cta;
    property nome_cta              :String read Fnome_cta              write Fnome_cta;
end;

implementation

{ TPlanoContasContabeis }

end.
