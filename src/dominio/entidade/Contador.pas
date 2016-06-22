unit Contador;

interface

uses
  SysUtils,
  Contnrs;

type
  TContador = class
  
  private
    Fcodigo_cidade: Integer;
    Fcodigo: Integer;
    Fcnpj: String;
    Fcep: String;
    Fnumero: String;
    Femail: String;
    Frua: String;
    Ffone: String;
    Fbairro: String;
    Fcrc: String;
    Fnome: String;
    Fcpf: String;
    procedure Setbairro(const Value: String);
    procedure Setcep(const Value: String);
    procedure Setcnpj(const Value: String);
    procedure Setcodigo(const Value: Integer);
    procedure Setcodigo_cidade(const Value: Integer);
    procedure Setcrc(const Value: String);
    procedure Setemail(const Value: String);
    procedure Setfone(const Value: String);
    procedure Setnome(const Value: String);
    procedure Setnumero(const Value: String);
    procedure Setrua(const Value: String);
    procedure Setcpf(const Value: String);

  public
    property codigo        :Integer read Fcodigo        write Setcodigo;
    property nome          :String  read Fnome          write Setnome;
    property crc           :String  read Fcrc           write Setcrc;
    property cpf           :String read Fcpf write Setcpf;
    property cnpj          :String  read Fcnpj          write Setcnpj;
    property cep           :String  read Fcep           write Setcep;
    property rua           :String  read Frua           write Setrua;
    property numero        :String  read Fnumero        write Setnumero;
    property bairro        :String  read Fbairro        write Setbairro;
    property codigo_cidade :Integer read Fcodigo_cidade write Setcodigo_cidade;
    property fone          :String  read Ffone          write Setfone;
    property email         :String  read Femail         write Setemail;

end;

implementation

{ TContador }

procedure TContador.Setbairro(const Value: String);
begin
  Fbairro := Value;
end;

procedure TContador.Setcep(const Value: String);
begin
  Fcep := Value;
end;

procedure TContador.Setcnpj(const Value: String);
begin
  Fcnpj := Value;
end;

procedure TContador.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TContador.Setcodigo_cidade(const Value: Integer);
begin
  Fcodigo_cidade := Value;
end;

procedure TContador.Setcpf(const Value: String);
begin
  Fcpf := Value;
end;

procedure TContador.Setcrc(const Value: String);
begin
  Fcrc := Value;
end;

procedure TContador.Setemail(const Value: String);
begin
  Femail := Value;
end;

procedure TContador.Setfone(const Value: String);
begin
  Ffone := Value;
end;

procedure TContador.Setnome(const Value: String);
begin
  Fnome := Value;
end;

procedure TContador.Setnumero(const Value: String);
begin
  Fnumero := Value;
end;

procedure TContador.Setrua(const Value: String);
begin
  Frua := Value;
end;

end.
