unit Lancamento;

interface

uses
  SysUtils,
  TipoLancamento,
  Contnrs;

type
  TLancamento = class

  private
    Fcodigo: Integer;
    Fvalor_total: Real;
    Fvalor_pago: Real;
    Fdescricao: String;
    Fdata_vencimento: TDateTime;
    Fdata_cadastro: TDateTime;
    Ftipo: TTipoLancamento;
    Fobservacao: String;
    procedure Setcodigo(const Value: Integer);
    procedure Setdata_cadastro(const Value: TDateTime);
    procedure Setdata_vencimento(const Value: TDateTime);
    procedure Setdescricao(const Value: String);
    procedure Settipo(const Value: TTipoLancamento);
    procedure Setvalor_pago(const Value: Real);
    procedure Setvalor_total(const Value: Real);
    procedure Setobservacao(const Value: String);

  public
    property codigo          :Integer read Fcodigo write Setcodigo;
    property valor_total     :Real read Fvalor_total write Setvalor_total;
    property valor_pago      :Real read Fvalor_pago write Setvalor_pago;
    property data_vencimento :TDateTime read Fdata_vencimento write Setdata_vencimento;
    property data_cadastro   :TDateTime read Fdata_cadastro write Setdata_cadastro;
    property descricao       :String read Fdescricao write Setdescricao;
    property tipo            :TTipoLancamento read Ftipo write Settipo;
    property observacao      :String read Fobservacao write Setobservacao;

end;

implementation

{ TLancamento }

procedure TLancamento.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TLancamento.Setdata_cadastro(const Value: TDateTime);
begin
  Fdata_cadastro := Value;
end;

procedure TLancamento.Setdata_vencimento(const Value: TDateTime);
begin
  Fdata_vencimento := Value;
end;

procedure TLancamento.Setdescricao(const Value: String);
begin
  Fdescricao := Value;
end;

procedure TLancamento.Setobservacao(const Value: String);
begin
  Fobservacao := Value;
end;

procedure TLancamento.Settipo(const Value: TTipoLancamento);
begin
  Ftipo := Value;
end;

procedure TLancamento.Setvalor_pago(const Value: Real);
begin
  Fvalor_pago := Value;
end;

procedure TLancamento.Setvalor_total(const Value: Real);
begin
  Fvalor_total := Value;
end;

end.
