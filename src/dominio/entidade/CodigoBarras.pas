unit CodigoBarras;

interface

uses
  SysUtils,
  Contnrs,
  FireDAC.Comp.Client;

type
  TCodigoBarras = class

  private
    FTipo: Integer;
    FCodigo: Integer;
    FCodTamanho: Integer;
    FCodProduto: Integer;
    FCodCor: Integer;
    FCodGrade: Integer;
    FNumeracao: String;
    FCod_sku: String;

    procedure SetNumeracao(const Value: String);
    procedure SetCodCor(const Value: Integer);
    procedure SetCodGrade(const Value: Integer);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodProduto(const Value: Integer);
    procedure SetCodTamanho(const Value: Integer);
    procedure SetTipo(const Value: Integer);

    function GetSequenciaCodBar :String;
    function calcDigitoVerificadorEAN13(codBar :string):String;
    function buscaCodigoDisponivel :String;

  public

    property Codigo        :Integer read FCodigo     write SetCodigo;
    property Tipo          :Integer read FTipo       write SetTipo;
    property Numeracao     :String  read FNumeracao  write SetNumeracao;
    property CodProduto    :Integer read FCodProduto write SetCodProduto;
    property CodCor        :Integer read FCodCor     write SetCodCor;
    property CodGrade      :Integer read FCodGrade   write SetCodGrade;
    property CodTamanho    :Integer read FCodTamanho write SetCodTamanho;
    property Cod_sku       :String  read FCod_sku    write FCod_sku;
  private
    function GetQtdCodigosDisponiveis: Integer;

  public
    property SequenciaCodBar :String read GetSequenciaCodBar;
    property QtdCodigosDisponiveis :Integer read GetQtdCodigosDisponiveis;

  private


  end;

CONST
  prefixos : Array[1..5] of string = ('78992426','78991340','78996349','78999967','79081293');
  QTD_MAX_COD_POR_PREFIXO = 10000;

implementation

uses Repositorio, FabricaRepositorio, uModulo, DB;

{ TCodigoBarras }

procedure TCodigoBarras.SetNumeracao(const Value: String);
begin
  FNumeracao := Value;
end;

procedure TCodigoBarras.SetCodCor(const Value: Integer);
begin
  FCodCor := Value;
end;

procedure TCodigoBarras.SetCodGrade(const Value: Integer);
begin
  FCodGrade := Value;
end;

procedure TCodigoBarras.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCodigoBarras.SetCodProduto(const Value: Integer);
begin
  FCodProduto := Value;
end;

procedure TCodigoBarras.SetCodTamanho(const Value: Integer);
begin
  FCodTamanho := Value;
end;

procedure TCodigoBarras.SetTipo(const Value: Integer);
begin
  FTipo := Value;
end;

function TCodigoBarras.GetQtdCodigosDisponiveis: Integer;
var qry :TFDQuery;
begin
  try
    qry          := dm.GetConsulta;
    qry.SQL.Text := ' select  (count(cb.codigo) +                         '+
                    '         ( select count(cb.codigo)                   '+
                    '           from codigo_barras cb                     '+
                    '           where numeracao starts with :prefixo2 ) + '+
                    '         ( select count(cb.codigo)                   '+
                    '           from codigo_barras cb                     '+
                    '           where numeracao starts with :prefixo3 ) + '+
                    '         ( select count(cb.codigo)                   '+
                    '           from codigo_barras cb                     '+
                    '           where numeracao starts with :prefixo4 ) + '+
                    '         ( select count(cb.codigo)                   '+
                    '           from codigo_barras cb                     '+
                    '           where numeracao starts with :prefixo5 ))  '+
                    '         QTD_CODIGOS                                 '+
                    '     from codigo_barras cb                           '+
                    ' where numeracao starts with :prefixo1               ';

    qry.ParamByName('prefixo1').AsString := prefixos[1];
    qry.ParamByName('prefixo2').AsString := prefixos[2];
    qry.ParamByName('prefixo3').AsString := prefixos[3];
    qry.ParamByName('prefixo4').AsString := prefixos[4];
    qry.ParamByName('prefixo5').AsString := prefixos[5];
    qry.Open;

    result := (length(prefixos) * QTD_MAX_COD_POR_PREFIXO) - qry.FieldByName('QTD_CODIGOS').AsInteger;
  finally
    FreeAndNil(qry);
  end;
end;

function TCodigoBarras.GetSequenciaCodBar: String;
var codigo:String;
begin
  codigo := buscaCodigoDisponivel;

  // se encontrou codigo disponivel calcula o digito
  if codigo <> '' then   codigo := codigo + calcDigitoVerificadorEAN13(codigo);

  result := codigo;

end;

function TCodigoBarras.calcDigitoVerificadorEAN13(codBar: string): String;
var i, mult, res:integer;
   num :String;
begin

  num := trim(codBar);  res := 0;  mult := 1;

  for i := 1 to length(num) do begin

    res := res + (strToInt(num[i]) * mult);

    if mult = 1 then mult := 3
                else mult := 1;

  end;

  num := intToStr(res);

  if copy(num,length(num),1) = '0' then
    result := '0'
  else
    result := intToStr( 10 - strToInt( copy( num,length(num),1 ) ) );
end;

function TCodigoBarras.buscaCodigoDisponivel: String;
var i, cod :integer;
begin
  result := '';

  for i := 1 to length(prefixos) do begin
    if result <> '' then break; // encontrou codigo disponivel sai

    dm.qryGenerica.Close;
    dm.qryGenerica.SQL.Text := ' select bcd.cod_barras from busca_codbar_disponivel('''+prefixos[i]+''') bcd ';
    dm.qryGenerica.Open;

    if dm.qryGenerica.fieldByName('cod_barras').AsString <> '' then begin
      result := dm.qryGenerica.fieldByName('cod_barras').AsString;
      break;
    end;

  end;

end;

end.
