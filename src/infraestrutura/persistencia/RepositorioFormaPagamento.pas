unit RepositorioFormaPagamento;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioFormaPagamento = class(TRepositorio)

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
  SysUtils, FormaPagamento;

{ TRepositorioFormaPagamento }

function TRepositorioFormaPagamento.Get(Dataset: TDataSet): TObject;
var
  FormaPagamento :TFormaPagamento;
begin
   FormaPagamento             := TFormaPagamento.Create;
   FormaPagamento.Codigo      := self.FQuery.FieldByName('codigo'    ).AsInteger;
   FormaPagamento.Descricao   := self.FQuery.FieldByName('Descricao' ).AsString;
   FormaPagamento.NumParcelas := self.FQuery.fieldByName('numero_parcelas').AsInteger;
   FormaPagamento.Desconto    := self.FQuery.fieldByName('desconto').AsFloat;
   FormaPagamento.acrescimo   := self.FQuery.fieldByName('acrescimo').AsFloat;
   FormaPagamento.Perc_Comissao := self.FQuery.fieldByName('perc_comissao').AsFloat;
   result := FormaPagamento;
end;

function TRepositorioFormaPagamento.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TFormaPagamento(Objeto).Codigo;
end;

function TRepositorioFormaPagamento.GetNomeDaTabela: String;
begin
  result := 'Formas_Pgto';
end;

function TRepositorioFormaPagamento.GetRepositorio: TRepositorio;
begin
  result := TRepositorioFormaPagamento.Create;
end;

function TRepositorioFormaPagamento.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TFormaPagamento(Objeto).Codigo <= 0);
end;

procedure TRepositorioFormaPagamento.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  FormaPagamentoAntigo :TFormaPagamento;
  FormaPagamentoNovo   :TFormaPagamento;
begin
   FormaPagamentoAntigo := (AntigoObjeto as TFormaPagamento);
   FormaPagamentoNovo   := (Objeto       as TFormaPagamento);

   if (FormaPagamentoAntigo.Descricao <> FormaPagamentoNovo.Descricao) then
    Auditoria.AdicionaCampoAlterado('Descricao', FormaPagamentoAntigo.Descricao, FormaPagamentoNovo.Descricao);

   if (FormaPagamentoAntigo.NumParcelas <> FormaPagamentoNovo.NumParcelas) then
    Auditoria.AdicionaCampoAlterado('numero_parcelas', intToStr(FormaPagamentoAntigo.NumParcelas), intToStr(FormaPagamentoNovo.NumParcelas));

   if (FormaPagamentoAntigo.desconto <> FormaPagamentoNovo.desconto) then
    Auditoria.AdicionaCampoAlterado('desconto', FloatToStr(FormaPagamentoAntigo.desconto), FloatToStr(FormaPagamentoNovo.desconto));

   if (FormaPagamentoAntigo.Acrescimo <> FormaPagamentoNovo.Acrescimo) then
    Auditoria.AdicionaCampoAlterado('Acrescimo', FloatToStr(FormaPagamentoAntigo.Acrescimo), FloatToStr(FormaPagamentoNovo.Acrescimo));

   if (FormaPagamentoAntigo.Perc_Comissao <> FormaPagamentoNovo.Perc_Comissao) then
    Auditoria.AdicionaCampoAlterado('Perc_Comissao', FloatToStr(FormaPagamentoAntigo.Perc_Comissao), FloatToStr(FormaPagamentoNovo.Perc_Comissao));
end;

procedure TRepositorioFormaPagamento.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  FormaPagamento :TFormaPagamento;
begin
   FormaPagamento := (Objeto as TFormaPagamento);

   Auditoria.AdicionaCampoExcluido('codigo'         , intToStr(FormaPagamento.Codigo));
   Auditoria.AdicionaCampoExcluido('Descricao'      , FormaPagamento.Descricao);
   Auditoria.AdicionaCampoExcluido('numero_parcelas', intToStr(FormaPagamento.NumParcelas));
   Auditoria.AdicionaCampoExcluido('desconto'       , FloatToStr(FormaPagamento.Desconto));
   Auditoria.AdicionaCampoExcluido('acrescimo'      , FloatToStr(FormaPagamento.Acrescimo));
   Auditoria.AdicionaCampoExcluido('perc_comissao'  , FloatToStr(FormaPagamento.perc_comissao));
end;

procedure TRepositorioFormaPagamento.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  FormaPagamento :TFormaPagamento;
begin
   FormaPagamento := (Objeto as TFormaPagamento);

   Auditoria.AdicionaCampoIncluido('codigo'         , intToStr(FormaPagamento.Codigo));
   Auditoria.AdicionaCampoIncluido('Descricao'      , FormaPagamento.Descricao);
   Auditoria.AdicionaCampoIncluido('numero_parcelas', intToStr(FormaPagamento.NumParcelas));
   Auditoria.AdicionaCampoIncluido('desconto'       , FloatToStr(FormaPagamento.Desconto));
   Auditoria.AdicionaCampoIncluido('acrescimo'      , FloatToStr(FormaPagamento.Acrescimo));
   Auditoria.AdicionaCampoIncluido('perc_comissao'  , FloatToStr(FormaPagamento.perc_comissao));
end;

procedure TRepositorioFormaPagamento.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TFormaPagamento(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioFormaPagamento.SetParametros(Objeto: TObject);
var
  FormaPagamento :TFormaPagamento;
begin
   FormaPagamento := (Objeto as TFormaPagamento);

   if (FormaPagamento.Codigo > 0) then  inherited SetParametro('codigo', FormaPagamento.Codigo)
   else                         inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('descricao').AsString        := FormaPagamento.Descricao;
   self.FQuery.ParamByName('numero_parcelas').AsInteger := FormaPagamento.NumParcelas;
   self.FQuery.ParamByName('desconto').AsFloat          := FormaPagamento.Desconto;
   self.FQuery.ParamByName('acrescimo').AsFloat         := FormaPagamento.Acrescimo;
   self.FQuery.ParamByName('perc_comissao').AsFloat     := FormaPagamento.Perc_Comissao;
end;

function TRepositorioFormaPagamento.SQLGet: String;
begin
  result := 'select * from Formas_Pgto where codigo = :ncod';
end;

function TRepositorioFormaPagamento.SQLGetAll: String;
begin
  result := 'select * from Formas_Pgto';
end;

function TRepositorioFormaPagamento.SQLGetExiste(arrayDeCampos :array of string): String;
begin
   result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), self.GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioFormaPagamento.SQLRemover: String;
begin
   result := ' delete from Formas_Pgto where codigo = :codigo ';
end;

function TRepositorioFormaPagamento.SQLSalvar: String;
begin
  result := 'update or insert into Formas_Pgto                                                      '+
            '(codigo, descricao, numero_parcelas, desconto, acrescimo, perc_comissao)               '+
            ' Values (:codigo, :descricao, :numero_parcelas, :desconto, :acrescimo, :perc_comissao) ';
end;

end.







