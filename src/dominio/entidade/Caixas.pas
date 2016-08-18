unit Caixas;

interface

uses
  SysUtils,
  Contnrs;

type
  TCaixas = class

  private
    Fqtd_P: integer;
    Fqtd_2: integer;
    Fqtd_UNICA: integer;
    Fqtd_8: integer;
    Fqtd_6: integer;
    Fqtd_RN: integer;
    Fqtd_3: integer;
    Fcodigoo: integer;
    Fcodigo_item: integer;
    Fqtd_1: integer;
    Fqtd_4: integer;
    Fqtd_G: integer;
    Fqtd_M: integer;
    Fcodigo_conferencia: integer;
    Fnumero_caixa: String;
    Fcodigo_cor: integer;
    Fqtd_12: integer;
    Fqtd_10: integer;
    Fqtd_14: integer;
    procedure Setcodigo_conferencia(const Value: integer);
    procedure Setcodigo_item(const Value: integer);
    procedure Setcodigoo(const Value: integer);
    procedure Setnumero_caixa(const Value: String);
    procedure Setqtd_1(const Value: integer);
    procedure Setqtd_2(const Value: integer);
    procedure Setqtd_3(const Value: integer);
    procedure Setqtd_4(const Value: integer);
    procedure Setqtd_6(const Value: integer);
    procedure Setqtd_8(const Value: integer);
    procedure Setqtd_G(const Value: integer);
    procedure Setqtd_M(const Value: integer);
    procedure Setqtd_P(const Value: integer);
    procedure Setqtd_RN(const Value: integer);
    procedure Setqtd_UNICA(const Value: integer);
    procedure Setcodigo_cor(const Value: integer);
    procedure Setqtd_10(const Value: integer);
    procedure Setqtd_12(const Value: integer);
    procedure Setqtd_14(const Value: integer);

  public
    property codigo             :integer read Fcodigoo write Setcodigoo;
    property numero_caixa       :String  read Fnumero_caixa write Setnumero_caixa;
    property codigo_conferencia :integer read Fcodigo_conferencia write Setcodigo_conferencia;
    property codigo_item        :integer read Fcodigo_item write Setcodigo_item;
    property codigo_cor         :integer read Fcodigo_cor write Setcodigo_cor;
    property qtd_RN             :integer read Fqtd_RN write Setqtd_RN;
    property qtd_P              :integer read Fqtd_P write Setqtd_P;
    property qtd_M              :integer read Fqtd_M write Setqtd_M;
    property qtd_G              :integer read Fqtd_G write Setqtd_G;
    property qtd_1              :integer read Fqtd_1 write Setqtd_1;
    property qtd_2              :integer read Fqtd_2 write Setqtd_2;
    property qtd_3              :integer read Fqtd_3 write Setqtd_3;
    property qtd_4              :integer read Fqtd_4 write Setqtd_4;
    property qtd_6              :integer read Fqtd_6 write Setqtd_6;
    property qtd_8              :integer read Fqtd_8 write Setqtd_8;
    property qtd_10             :integer read Fqtd_10 write Setqtd_10;
    property qtd_12             :integer read Fqtd_12 write Setqtd_12;
    property qtd_14             :integer read Fqtd_14 write Setqtd_14;
    property qtd_UNICA          :integer read Fqtd_UNICA write Setqtd_UNICA;

end;

implementation

{ TCaixas }

procedure TCaixas.Setcodigo_conferencia(const Value: integer);
begin
  Fcodigo_conferencia := Value;
end;

procedure TCaixas.Setcodigo_item(const Value: integer);
begin
  Fcodigo_item := Value;
end;

procedure TCaixas.Setcodigoo(const Value: integer);
begin
  Fcodigoo := Value;
end;

procedure TCaixas.Setnumero_caixa(const Value: String);
begin
  Fnumero_caixa := Value;
end;

procedure TCaixas.Setqtd_1(const Value: integer);
begin
  Fqtd_1 := Value;
end;

procedure TCaixas.Setqtd_10(const Value: integer);
begin
  Fqtd_10 := Value;
end;

procedure TCaixas.Setqtd_12(const Value: integer);
begin
  Fqtd_12 := Value;
end;

procedure TCaixas.Setqtd_14(const Value: integer);
begin
  Fqtd_14 := Value;
end;

procedure TCaixas.Setqtd_2(const Value: integer);
begin
  Fqtd_2 := Value;
end;

procedure TCaixas.Setqtd_3(const Value: integer);
begin
  Fqtd_3 := Value;
end;

procedure TCaixas.Setqtd_4(const Value: integer);
begin
  Fqtd_4 := Value;
end;

procedure TCaixas.Setqtd_6(const Value: integer);
begin
  Fqtd_6 := Value;
end;

procedure TCaixas.Setqtd_8(const Value: integer);
begin
  Fqtd_8 := Value;
end;

procedure TCaixas.Setqtd_G(const Value: integer);
begin
  Fqtd_G := Value;
end;

procedure TCaixas.Setqtd_M(const Value: integer);
begin
  Fqtd_M := Value;
end;

procedure TCaixas.Setqtd_P(const Value: integer);
begin
  Fqtd_P := Value;
end;

procedure TCaixas.Setqtd_RN(const Value: integer);
begin
  Fqtd_RN := Value;
end;

procedure TCaixas.Setqtd_UNICA(const Value: integer);
begin
  Fqtd_UNICA := Value;
end;

procedure TCaixas.Setcodigo_cor(const Value: integer);
begin
  Fcodigo_cor := Value;
end;

end.

