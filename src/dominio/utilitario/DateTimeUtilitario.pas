unit DateTimeUtilitario;

interface

type
  TDateTimeUtilitario = class

  public
    class function DataSEFAZToDateTime(const Data :String) :TDateTime;
    class function proximo_mes(data :TDateTime) :String;
    class function mes_extenso(mes :integer) :String;
    class function dia_semana(data :TDateTime) :String;
    class function padrao_EUA_to_BR(data :String) :String;
    class function SegundosToTime( Segundos : Cardinal ) : String;
end;

implementation

uses
  SysUtils,
  DateUtils;

{ TDateTimeUtilitario }

class function TDateTimeUtilitario.SegundosToTime( Segundos : Cardinal ) : String;
var
  Seg, Min, Hora: Cardinal;
begin
  Hora := Segundos div 3600;
  Seg := Segundos mod 3600;
  Min := Seg div 60;
  Seg := Seg mod 60;

  Result := FormatFloat(',00', Hora) + ':' +
  FormatFloat('00', Min) + ':' +
  FormatFloat('00', Seg);
end;

class function TDateTimeUtilitario.DataSEFAZToDateTime(const Data: String): TDateTime;
var
  Ano, Mes, Dia, Hora, Minuto, Segundo, Milisegundo: Word;
  cData :String;
  cHoras :String;
  cAno, cMes, cDia, cHora, cMinuto, cSegundo, cMilisegundo :String;
begin
   //1234567890 1 23456789
   { 2013-10-29 T 13:24:49 }
   cData := Copy(Data, 1,  10);
   cAno  := Copy(cData, 1, 4);
   cMes  := Copy(cData, 6,  2);
   cDia  := Copy(cData, 9, 2);

   cHoras   := Copy(Data, 12, 8);
   cHora    := Copy(cHoras, 1, 2);
   cMinuto  := Copy(cHoras, 4, 2);
   cSegundo := Copy(cHoras, 7, 2);

   Ano     := StrToIntDef(cAno, 0);
   Mes     := StrToIntDef(cMes, 0);
   Dia     := StrToIntDef(cDia, 0);
   Hora    := StrToIntDef(cHora, 0);
   Minuto  := StrToIntDef(cMinuto, 0);
   Segundo := StrToIntDef(cSegundo, 0);

   result := EncodeDateTime(Ano, Mes, Dia, Hora, Minuto, Segundo, 0);
end;

class function TDateTimeUtilitario.dia_semana(data: TDateTime): String;
const diasem: array[0..6] of string = ('domingo', 'segunda-feira', 'terça-feira', 'quarta-feira', 'quinta-feira', 'sexta-feira', 'sábado');
var dia :word;
begin
  dia := DayOfTheWeek(data);

  result := diasem[dia];
end;

class function TDateTimeUtilitario.mes_extenso(mes: integer): String;
begin
  case mes of
    1 :  Result := 'JANEIRO';
    2 :  Result := 'FEVEREIRO';
    3 :  Result := 'MARÇO';
    4 :  Result := 'ABRIL';
    5 :  Result := 'MAIO';
    6 :  Result := 'JUNHO';
    7 :  Result := 'JULHO';
    8 :  Result := 'AGOSTO';
    9 :  Result := 'SETEMBRO';
    10 : Result := 'OUTUBRO';
    11 : Result := 'NOVEMBRO';
    12 : Result := 'DEZEMBRO';
  end;
end;

class function TDateTimeUtilitario.padrao_EUA_to_BR(data: String): String;
var
  D: TDateTime;
  T: TFormatSettings;
begin
  T.ShortDateFormat := 'yyyy-mm-dd';
  T.DateSeparator := '-';

  D := StrToDate(data, T);

  result := DateToStr(D);
end;

class function TDateTimeUtilitario.proximo_mes(data: TDateTime): String;
var mes :Integer;
begin
  mes := StrToInt(FormatDateTime('mm', data));

  case mes of
    01 : Result := '02';
    02 : Result := '03';
    03 : Result := '04';
    04 : Result := '05';
    05 : Result := '06';
    06 : Result := '07';
    07 : Result := '08';
    08 : Result := '09';
    09 : Result := '10';
    10 : Result := '11';
    11 : Result := '12';
    12 : Result := '01';
  end;

end;

end.
