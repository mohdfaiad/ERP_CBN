unit Parcela;

interface

uses SysUtils, Contnrs;

type
  TParcela = class

  private
    Fcodigo :Integer;
    Fcodigo_conta :Integer;
    Fnum_parcela :Integer;
    Fdt_vencimento :TDateTime;
    Fdt_pagamento :TDateTime;
    Fstatus :String;
    Fdesc_status :String;
    Fvalor :Real;
    Fvalor_pago :Real;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property codigo_conta          :Integer read Fcodigo_conta          write Fcodigo_conta;
    property num_parcela           :Integer read Fnum_parcela           write Fnum_parcela;
    property dt_vencimento         :TDateTime read Fdt_vencimento         write Fdt_vencimento;
    property dt_pagamento          :TDateTime read Fdt_pagamento          write Fdt_pagamento;
    property status                :String read Fstatus                write Fstatus;
    property desc_status           :String read Fdesc_status           write Fdesc_status;
    property valor                 :Real read Fvalor                 write Fvalor;
    property valor_pago            :Real read Fvalor_pago            write Fvalor_pago;
end;

implementation

{ TParcela }

end.
