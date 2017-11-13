unit RepositorioFormaPagamentoParcelas;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioFormaPagamentoParcelas = class(TRepositorio)

  protected
    function Get             (Dataset :TDataSet) :TObject; overload; override;
    function GetNomeDaTabela                     :String;            override;
    function GetIdentificador(Objeto :TObject)   :Variant;           override;
    function GetRepositorio                     :TRepositorio;       override;

  protected
    function SQLGet                      :String;            override;
    function SQLSalvar                   :String;            override;
    function SQLGetAll                   :String;            override;
    function SQLRemover                  :String;            override;
    function SQLGetExiste(arrayDeCampos :array of string): String;            override;

  protected
    function IsInsercao(Objeto :TObject) :Boolean;           override;

  protected
    procedure SetParametros   (Objeto :TObject                        ); override;
    procedure SetIdentificador(Objeto :TObject; Identificador :Variant); override;

  //==============================================================================
  // Auditoria
  //==============================================================================
  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;

end;

implementation

uses
  SysUtils, FormaPagamentoParcelas;

{ TRepositorioFormaPagamentoParcelas }

function TRepositorioFormaPagamentoParcelas.Get(Dataset: TDataSet): TObject;
var
  FormaPagamentoParcelas :TFormaPagamentoParcelas;
begin
   FormaPagamentoParcelas               := TFormaPagamentoParcelas.Create;
   FormaPagamentoParcelas.Codigo        := self.FQuery.FieldByName('codigo').AsInteger;
   FormaPagamentoParcelas.CodFormasPgto := self.FQuery.fieldByName('codformas_pgto').AsInteger;
   FormaPagamentoParcelas.Parcela       := self.FQuery.fieldByName('parcela').AsInteger;
   FormaPagamentoParcelas.DiasParcela   := self.FQuery.fieldByName('dias_parcela').AsInteger;
   
   result := FormaPagamentoParcelas;
end;

function TRepositorioFormaPagamentoParcelas.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TFormaPagamentoParcelas(Objeto).Codigo;
end;

function TRepositorioFormaPagamentoParcelas.GetNomeDaTabela: String;
begin
  result := 'Formas_Pgto_parcelas';
end;

function TRepositorioFormaPagamentoParcelas.GetRepositorio: TRepositorio;
begin
  result := TRepositorioFormaPagamentoParcelas.Create;
end;

function TRepositorioFormaPagamentoParcelas.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TFormaPagamentoParcelas(Objeto).Codigo <= 0);
end;

procedure TRepositorioFormaPagamentoParcelas.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  FormaPagamentoParcelasAntigo :TFormaPagamentoParcelas;
  FormaPagamentoParcelasNovo   :TFormaPagamentoParcelas;
begin
   FormaPagamentoParcelasAntigo := (AntigoObjeto as TFormaPagamentoParcelas);
   FormaPagamentoParcelasNovo   := (Objeto       as TFormaPagamentoParcelas);

   if (FormaPagamentoParcelasAntigo.CodFormasPgto <> FormaPagamentoParcelasNovo.CodFormasPgto) then
    Auditoria.AdicionaCampoAlterado('codformas_pgto', intToStr(FormaPagamentoParcelasAntigo.CodFormasPgto), intToStr(FormaPagamentoParcelasNovo.CodFormasPgto));

   if (FormaPagamentoParcelasAntigo.Parcela <> FormaPagamentoParcelasNovo.Parcela) then
    Auditoria.AdicionaCampoAlterado('parcela', intToStr(FormaPagamentoParcelasAntigo.Parcela), intToStr(FormaPagamentoParcelasNovo.Parcela));

   if (FormaPagamentoParcelasAntigo.DiasParcela <> FormaPagamentoParcelasNovo.DiasParcela) then
    Auditoria.AdicionaCampoAlterado('dias_parcela', intToStr(FormaPagamentoParcelasAntigo.DiasParcela), intToStr(FormaPagamentoParcelasNovo.DiasParcela));
end;

procedure TRepositorioFormaPagamentoParcelas.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  FormaPagamentoParcelas :TFormaPagamentoParcelas;
begin
   FormaPagamentoParcelas := (Objeto as TFormaPagamentoParcelas);

   Auditoria.AdicionaCampoExcluido('codigo'         , intToStr(FormaPagamentoParcelas.Codigo));
   Auditoria.AdicionaCampoExcluido('codformas_pgto' , intToStr(FormaPagamentoParcelas.CodFormasPgto));
   Auditoria.AdicionaCampoExcluido('parcela'        , intToStr(FormaPagamentoParcelas.Parcela));
   Auditoria.AdicionaCampoExcluido('dias_parcela'   , intToStr(FormaPagamentoParcelas.DiasParcela));
end;

procedure TRepositorioFormaPagamentoParcelas.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  FormaPagamentoParcelas :TFormaPagamentoParcelas;
begin
   FormaPagamentoParcelas := (Objeto as TFormaPagamentoParcelas);

   Auditoria.AdicionaCampoIncluido('codigo'         , intToStr(FormaPagamentoParcelas.Codigo));
   Auditoria.AdicionaCampoIncluido('codformas_pgto' , intToStr(FormaPagamentoParcelas.CodFormasPgto));
   Auditoria.AdicionaCampoIncluido('parcela'        , intToStr(FormaPagamentoParcelas.Parcela));
   Auditoria.AdicionaCampoIncluido('dias_parcela'   , intToStr(FormaPagamentoParcelas.DiasParcela));
end;

procedure TRepositorioFormaPagamentoParcelas.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TFormaPagamentoParcelas(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioFormaPagamentoParcelas.SetParametros(Objeto: TObject);
var
  FormaPagamentoParcelas :TFormaPagamentoParcelas;
begin
   FormaPagamentoParcelas := (Objeto as TFormaPagamentoParcelas);

   if (FormaPagamentoParcelas.Codigo > 0) then  inherited SetParametro('codigo', FormaPagamentoParcelas.Codigo)
   else                         inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('codformas_pgto').AsInteger := FormaPagamentoParcelas.CodFormasPgto;
   self.FQuery.ParamByName('parcela').AsInteger        := FormaPagamentoParcelas.Parcela;
   self.FQuery.ParamByName('dias_parcela').AsInteger   := FormaPagamentoParcelas.DiasParcela;
end;

function TRepositorioFormaPagamentoParcelas.SQLGet: String;
begin
  result := 'select * from Formas_Pgto_parcelas where codigo = :ncod';
end;

function TRepositorioFormaPagamentoParcelas.SQLGetAll: String;
begin
  result := 'select * from Formas_Pgto_parcelas order by parcela ';
end;

function TRepositorioFormaPagamentoParcelas.SQLGetExiste(arrayDeCampos :array of string): String;
begin
   result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), self.GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioFormaPagamentoParcelas.SQLRemover: String;
begin
   result := ' delete from Formas_Pgto_parcelas where codigo = :codigo ';
end;

function TRepositorioFormaPagamentoParcelas.SQLSalvar: String;
begin
  result := 'update or insert into Formas_Pgto_parcelas                  '+
            '(codigo, codformas_pgto, parcela, dias_parcela)             '+
            ' Values (:codigo, :codformas_pgto, :parcela, :dias_parcela) ';
end;

end.







