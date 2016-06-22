unit RepositorioMateria;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioMateria = class(TRepositorio)

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
    function SQLGetExiste(campo: String): String;            override;

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
  SysUtils,
  Materia;

{ TRepositorioMateria }

function TRepositorioMateria.Get(Dataset: TDataSet): TObject;
var
  Materia :TMateria;
begin
   Materia                := TMateria.Create;
   Materia.Codigo         := self.FQuery.FieldByName('codigo'        ).AsInteger;
   Materia.descricao      := self.FQuery.FieldByName('descricao'     ).AsString;
   Materia.cod_ncm        := self.FQuery.FieldByName('cod_ncm'       ).AsString;
   Materia.preco_custo    := self.FQuery.FieldByName('preco_custo'   ).AsFloat;
   Materia.preco_venda    := self.FQuery.FieldByName('preco_venda'   ).AsFloat;
   Materia.estoque_fisico := self.FQuery.FieldByName('estoque_fisico').AsFloat;
   Materia.estoque_minimo := self.FQuery.FieldByName('estoque_minimo').AsFloat;
   Materia.unidade        := self.FQuery.FieldByName('unidade'       ).AsString;

   result := Materia;
end;

function TRepositorioMateria.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TMateria(Objeto).Codigo;
end;

function TRepositorioMateria.GetNomeDaTabela: String;
begin
  result := 'Materias';
end;

function TRepositorioMateria.GetRepositorio: TRepositorio;
begin
  result := TRepositorioMateria.Create;
end;

function TRepositorioMateria.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TMateria(Objeto).Codigo <= 0);
end;

procedure TRepositorioMateria.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  MateriaAntigo :TMateria;
  MateriaNovo   :TMateria;
begin
   MateriaAntigo := (AntigoObjeto as TMateria);
   MateriaNovo   := (Objeto       as TMateria);

   if (MateriaAntigo.descricao <> MateriaNovo.descricao) then
    Auditoria.AdicionaCampoAlterado('descricao', MateriaAntigo.descricao, MateriaNovo.descricao);

   if (MateriaAntigo.cod_ncm <> MateriaNovo.cod_ncm) then
    Auditoria.AdicionaCampoAlterado('cod_ncm', MateriaAntigo.cod_ncm, MateriaNovo.cod_ncm);

   if (MateriaAntigo.preco_custo <> MateriaNovo.preco_custo) then
    Auditoria.AdicionaCampoAlterado('preco_custo', floatToStr(MateriaAntigo.preco_custo), floatToStr(MateriaNovo.preco_custo));

   if (MateriaAntigo.preco_venda <> MateriaNovo.preco_venda) then
    Auditoria.AdicionaCampoAlterado('preco_venda', floatToStr(MateriaAntigo.preco_venda), floatToStr(MateriaNovo.preco_venda));

   if (MateriaAntigo.estoque_fisico <> MateriaNovo.estoque_fisico) then
    Auditoria.AdicionaCampoAlterado('estoque_fisico', floatToStr(MateriaAntigo.estoque_fisico), floatToStr(MateriaNovo.estoque_fisico));

   if (MateriaAntigo.estoque_minimo <> MateriaNovo.estoque_minimo) then
    Auditoria.AdicionaCampoAlterado('estoque_minimo', floatToStr(MateriaAntigo.estoque_minimo), floatToStr(MateriaNovo.estoque_minimo));

   if (MateriaAntigo.unidade <> MateriaNovo.unidade) then
    Auditoria.AdicionaCampoAlterado('unidade', MateriaAntigo.unidade, MateriaNovo.unidade);

end;

procedure TRepositorioMateria.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Materia :TMateria;
begin
   Materia := (Objeto as TMateria);

   Auditoria.AdicionaCampoExcluido('codigo'    , intToStr(Materia.Codigo));
   Auditoria.AdicionaCampoExcluido('DESCRICAO'     , Materia.descricao);
   Auditoria.AdicionaCampoExcluido('COD_NCM'       , Materia.cod_ncm);
   Auditoria.AdicionaCampoExcluido('PRECO_CUSTO'   , floatToStr(Materia.preco_custo));
   Auditoria.AdicionaCampoExcluido('PRECO_VENDA'   , floatToStr(Materia.preco_venda));
   Auditoria.AdicionaCampoExcluido('ESTOQUE_FISICO', floatToStr(Materia.estoque_fisico));
   Auditoria.AdicionaCampoExcluido('ESTOQUE_MINIMO', floatToStr(Materia.estoque_minimo));
   Auditoria.AdicionaCampoExcluido('UNIDADE'       , Materia.unidade);
end;

procedure TRepositorioMateria.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Materia :TMateria;
begin
   Materia := (Objeto as TMateria);

   Auditoria.AdicionaCampoIncluido('codigo'        , intToStr(Materia.Codigo));
   Auditoria.AdicionaCampoIncluido('DESCRICAO'     , Materia.descricao);
   Auditoria.AdicionaCampoIncluido('COD_NCM'       , Materia.cod_ncm);
   Auditoria.AdicionaCampoIncluido('PRECO_CUSTO'   , floatToStr(Materia.preco_custo));
   Auditoria.AdicionaCampoIncluido('PRECO_VENDA'   , floatToStr(Materia.preco_venda));
   Auditoria.AdicionaCampoIncluido('ESTOQUE_FISICO', floatToStr(Materia.estoque_fisico));
   Auditoria.AdicionaCampoIncluido('ESTOQUE_MINIMO', floatToStr(Materia.estoque_minimo));
   Auditoria.AdicionaCampoIncluido('UNIDADE'       , Materia.unidade);
end;

procedure TRepositorioMateria.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TMateria(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioMateria.SetParametros(Objeto: TObject);
var
  Materia :TMateria;
begin
   Materia := (Objeto as TMateria);

   if (Materia.Codigo > 0) then  inherited SetParametro('codigo', Materia.Codigo)
   else                         inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('DESCRICAO').AsString      := Materia.descricao;
   self.FQuery.ParamByName('COD_NCM').AsString        := Materia.cod_ncm;
   self.FQuery.ParamByName('PRECO_CUSTO').AsFloat     := Materia.preco_custo;
   self.FQuery.ParamByName('PRECO_VENDA').AsFloat     := Materia.preco_venda;
   self.FQuery.ParamByName('ESTOQUE_FISICO').AsFloat  := Materia.estoque_fisico;
   self.FQuery.ParamByName('ESTOQUE_MINIMO').AsFloat  := Materia.estoque_minimo;
   self.FQuery.ParamByName('UNIDADE').AsString        := Materia.unidade;

end;

function TRepositorioMateria.SQLGet: String;
begin
  result := 'select * from Materias where codigo = :ncod';
end;

function TRepositorioMateria.SQLGetAll: String;
begin
  result := 'select * from Materias';
end;

function TRepositorioMateria.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from Materias where '+ campo +' = :ncampo';
end;

function TRepositorioMateria.SQLRemover: String;
begin
   result := ' delete from Materias where codigo = :codigo ';
end;

function TRepositorioMateria.SQLSalvar: String;
begin
  result := 'update or insert into Materias                                                                                  '+
            '(CODIGO, DESCRICAO, COD_NCM, PRECO_CUSTO, PRECO_VENDA, ESTOQUE_FISICO, ESTOQUE_MINIMO, UNIDADE)                 '+
            ' Values (:CODIGO, :DESCRICAO, :COD_NCM, :PRECO_CUSTO, :PRECO_VENDA, :ESTOQUE_FISICO, :ESTOQUE_MINIMO, :UNIDADE) ';
end;

end.
              
              
              
              
              
              
              

