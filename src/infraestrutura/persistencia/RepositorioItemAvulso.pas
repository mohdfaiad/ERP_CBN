unit RepositorioItemAvulso;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioItemAvulso = class(TRepositorio)

  protected
    function Get             (Dataset :TDataSet) :TObject; overload; override;
    function GetNomeDaTabela                     :String;            override;
    function GetIdentificador(Objeto :TObject)   :Variant;           override;
    function GetRepositorio                      :TRepositorio;      override;

  protected
    function SQLGet                      :String;            override;
    function SQLSalvar                   :String;            override;
    function SQLGetAll                   :String;            override;
    function SQLRemover                  :String;            override;

  protected
    function IsInsercao(Objeto :TObject) :Boolean;           override;

  protected
    procedure SetParametros   (Objeto :TObject                        ); override;
    procedure SetIdentificador(Objeto          :TObject; Identificador :Variant); override;

  protected
    procedure ExecutaDepoisDeSalvar (Objeto :TObject); override;

  //==============================================================================
  // Auditoria
  //==============================================================================
  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
end;

implementation

uses
  SysUtils,
  ItemAvulso, QuantidadeItemAvulso, FabricaRepositorio;

{ TRepositorioItemAvulso }

procedure TRepositorioItemAvulso.ExecutaDepoisDeSalvar(Objeto: TObject);
var
  RepQuantidades    :TRepositorio;
  ItemAvulso        :TItemAvulso;
  nX                :Integer;
begin
   ItemAvulso := (Objeto as TItemAvulso);

   RepQuantidades := nil;

   try
     { Quantidades }
     RepQuantidades := TFabricaRepositorio.GetRepositorio(TQuantidadeItemAvulso.ClassName);

     if Assigned(ItemAvulso.Quantidades) then begin
         for nX := 0 to (ItemAvulso.Quantidades.Count-1) do begin
           RepQuantidades.Remover(ItemAvulso.Quantidades[nX]);
           break;
         end;

         for nX := 0 to (ItemAvulso.Quantidades.Count-1) do
           RepQuantidades.Salvar(ItemAvulso.Quantidades[nX]);
     end;
   finally
     FreeAndNil(RepQuantidades);
   end;
end;

function TRepositorioItemAvulso.Get(Dataset: TDataSet): TObject;
begin
   result := TItemAvulso.CriaParaRepositorio(Dataset.FieldByName('codigo').AsInteger,
                                             Dataset.FieldByName('codigo_nota_fiscal').AsInteger,
                                             Dataset.FieldByName('codigo_produto').AsInteger,
                                             Dataset.FieldByName('codigo_cor').AsInteger,
                                             Dataset.FieldByName('preco').AsFloat,
                                             Dataset.FieldByName('percentual_desconto').AsFloat);
end;

function TRepositorioItemAvulso.GetIdentificador(Objeto: TObject): Variant;
begin
   result := TItemAvulso(Objeto).CodigoNotaFiscal;
end;

function TRepositorioItemAvulso.GetNomeDaTabela: String;
begin
   result := 'itens_avulsos';
end;

function TRepositorioItemAvulso.GetRepositorio: TRepositorio;
begin
   result := TRepositorioItemAvulso.Create;
end;

function TRepositorioItemAvulso.IsInsercao(Objeto: TObject): Boolean;
begin
   result := true;
end;

procedure TRepositorioItemAvulso.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
   ItemAvulso :TItemAvulso;
begin
   ItemAvulso := (Objeto as TItemAvulso);

   Auditoria.AdicionaCampoExcluido('codigo',              IntToStr(ItemAvulso.Codigo));
   Auditoria.AdicionaCampoExcluido('codigo_nota_fiscal',  IntToStr(ItemAvulso.CodigoNotaFiscal));
   Auditoria.AdicionaCampoExcluido('codigo_produto',      IntToStr(ItemAvulso.Produto.Codigo));
   Auditoria.AdicionaCampoExcluido('codigo_cor',      IntToStr(ItemAvulso.Cor.Codigo));   
   Auditoria.AdicionaCampoExcluido('preco',               FloatToStr(ItemAvulso.Preco));
   Auditoria.AdicionaCampoExcluido('percentual_desconto', FloatToStr(ItemAvulso.PercentualDesconto));
end;

procedure TRepositorioItemAvulso.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
   ItemAvulso :TItemAvulso;
begin
   ItemAvulso := (Objeto as TItemAvulso);

   Auditoria.AdicionaCampoIncluido('codigo',              IntToStr(ItemAvulso.Codigo));
   Auditoria.AdicionaCampoIncluido('codigo_nota_fiscal',  IntToStr(ItemAvulso.CodigoNotaFiscal));
   Auditoria.AdicionaCampoIncluido('codigo_produto',      IntToStr(ItemAvulso.Produto.Codigo));
   Auditoria.AdicionaCampoIncluido('codigo_cor',      IntToStr(ItemAvulso.Cor.Codigo));
   Auditoria.AdicionaCampoIncluido('preco',               FloatToStr(ItemAvulso.Preco));
   Auditoria.AdicionaCampoIncluido('percentual_desconto', FloatToStr(ItemAvulso.PercentualDesconto));
end;

procedure TRepositorioItemAvulso.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
   TItemAvulso(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioItemAvulso.SetParametros(Objeto: TObject);
var
   ItemAvulso :TItemAvulso;
begin
   ItemAvulso := (Objeto as TItemAvulso);

   inherited SetParametro('codigo',              ItemAvulso.Codigo);
   inherited SetParametro('codigo_nota_fiscal',  ItemAvulso.CodigoNotaFiscal);
   inherited SetParametro('codigo_produto',      ItemAvulso.Produto.Codigo);
   inherited SetParametro('codigo_cor',          ItemAvulso.Cor.Codigo);
   inherited SetParametro('preco',               ItemAvulso.Preco);
   inherited SetParametro('percentual_desconto', ItemAvulso.PercentualDesconto);
end;

function TRepositorioItemAvulso.SQLGet: String;
begin
   result := 'select * from '+ self.GetNomeDaTabela + ' where codigo_nota_fiscal = :codigo_nota_fiscal ';  
end;

function TRepositorioItemAvulso.SQLGetAll: String;
begin
   result := 'select * from '+ self.GetNomeDaTabela;
end;

function TRepositorioItemAvulso.SQLRemover: String;
begin
   result := 'delete from '+self.GetNomeDaTabela+' where codigo_nota_fiscal = :codigo_nota_fiscal ';
end;

function TRepositorioItemAvulso.SQLSalvar: String;
begin
   result := 'update or insert into '+self.GetNomeDaTabela +' (codigo, codigo_nota_fiscal,  codigo_produto,             '+
                                                            '  codigo_cor, preco, percentual_desconto)                  '+
                                    'values                   (:codigo,     :codigo_nota_fiscal,  :codigo_produto,      '+
                                                            '  :codigo_cor, :preco,               :percentual_desconto) ';
end;

end.
