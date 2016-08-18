unit RepositorioCaixas;

interface

uses
  DB,
  Auditoria,
  Repositorio;                                                                               

type
  TRepositorioCaixas = class(TRepositorio)

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

  protected
    procedure ExecutaDepoisDeSalvar (Objeto :TObject); override;  

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
  Caixas;

{ TRepositorioCaixas }

procedure TRepositorioCaixas.ExecutaDepoisDeSalvar(Objeto: TObject);
begin
   TCaixas(Objeto).Codigo := 0;
end;

function TRepositorioCaixas.Get(Dataset: TDataSet): TObject;
var
  Caixas :TCaixas;
begin
   Caixas                    := TCaixas.Create;
   Caixas.Codigo             := self.FQuery.FieldByName('CODIGO'           ).AsInteger;
   Caixas.numero_caixa       := self.FQuery.FieldByName('NUMERO_CAIXA'     ).AsString;
   Caixas.codigo_conferencia := self.FQuery.FieldByName('CODIGO_CONFERENCIA').AsInteger;
   Caixas.codigo_item        := self.FQuery.FieldByName('CODIGO_ITEM'      ).AsInteger;
   Caixas.codigo_cor         := self.FQuery.FieldByName('CODIGO_COR'       ).AsInteger;   
   Caixas.qtd_RN             := self.FQuery.FieldByName('QTD_RN'           ).AsInteger;
   Caixas.qtd_P              := self.FQuery.FieldByName('QTD_P'            ).AsInteger;
   Caixas.qtd_M              := self.FQuery.FieldByName('QTD_M'            ).AsInteger;
   Caixas.qtd_G              := self.FQuery.FieldByName('QTD_G'            ).AsInteger;
   Caixas.qtd_1              := self.FQuery.FieldByName('QTD_1'            ).AsInteger;
   Caixas.qtd_2              := self.FQuery.FieldByName('QTD_2'            ).AsInteger;
   Caixas.qtd_3              := self.FQuery.FieldByName('QTD_3'            ).AsInteger;
   Caixas.qtd_4              := self.FQuery.FieldByName('QTD_4'            ).AsInteger;
   Caixas.qtd_6              := self.FQuery.FieldByName('QTD_6'            ).AsInteger;
   Caixas.qtd_8              := self.FQuery.FieldByName('QTD_8'            ).AsInteger;
   Caixas.qtd_10             := self.FQuery.FieldByName('QTD_10'           ).AsInteger;
   Caixas.qtd_12             := self.FQuery.FieldByName('QTD_12'           ).AsInteger;
   Caixas.qtd_14             := self.FQuery.FieldByName('QTD_14'           ).AsInteger;
   Caixas.qtd_UNICA          := self.FQuery.FieldByName('QTD_UNICA'        ).AsInteger;

   result := Caixas;
end;

function TRepositorioCaixas.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TCaixas(Objeto).Codigo;
end;

function TRepositorioCaixas.GetNomeDaTabela: String;
begin
  result := 'CAIXAS';
end;

function TRepositorioCaixas.GetRepositorio: TRepositorio;
begin
  result := TRepositorioCaixas.Create;
end;

function TRepositorioCaixas.IsInsercao(Objeto: TObject): Boolean;
begin
   result := (TCaixas(Objeto).Codigo <= 0);
end;

procedure TRepositorioCaixas.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  CaixasAntigo :TCaixas;
  CaixasNovo   :TCaixas;
begin
   CaixasAntigo := (AntigoObjeto as TCaixas);
   CaixasNovo   := (Objeto       as TCaixas);

   if (CaixasAntigo.numero_caixa <> CaixasNovo.numero_caixa) then
    Auditoria.AdicionaCampoAlterado('numero_caixa', CaixasAntigo.numero_caixa, CaixasNovo.numero_caixa);
   if (CaixasAntigo.codigo_conferencia <> CaixasNovo.codigo_conferencia) then
    Auditoria.AdicionaCampoAlterado('codigo_conferencia', intToStr(CaixasAntigo.codigo_conferencia), intToStr(CaixasNovo.codigo_conferencia));
   if (CaixasAntigo.codigo_item <> CaixasNovo.codigo_item) then
    Auditoria.AdicionaCampoAlterado('codigo_item', intToStr(CaixasAntigo.codigo_item), intToStr(CaixasNovo.codigo_item));
   if (CaixasAntigo.codigo_cor <> CaixasNovo.codigo_cor) then
    Auditoria.AdicionaCampoAlterado('codigo_cor', intToStr(CaixasAntigo.codigo_cor), intToStr(CaixasNovo.codigo_cor));
   if (CaixasAntigo.qtd_RN <> CaixasNovo.qtd_RN) then
    Auditoria.AdicionaCampoAlterado('qtd_RN', IntToStr(CaixasAntigo.qtd_RN), IntToStr(CaixasNovo.qtd_RN));
   if (CaixasAntigo.qtd_P <> CaixasNovo.qtd_P) then
    Auditoria.AdicionaCampoAlterado('qtd_P', IntToStr(CaixasAntigo.qtd_P), IntToStr(CaixasNovo.qtd_P));
   if (CaixasAntigo.qtd_M <> CaixasNovo.qtd_M) then
    Auditoria.AdicionaCampoAlterado('qtd_M', IntToStr(CaixasAntigo.qtd_M), IntToStr(CaixasNovo.qtd_M));
   if (CaixasAntigo.qtd_G <> CaixasNovo.qtd_G) then
    Auditoria.AdicionaCampoAlterado('qtd_G', IntToStr(CaixasAntigo.qtd_G), IntToStr(CaixasNovo.qtd_G));
   if (CaixasAntigo.qtd_1 <> CaixasNovo.qtd_1) then
    Auditoria.AdicionaCampoAlterado('qtd_1', IntToStr(CaixasAntigo.qtd_1), IntToStr(CaixasNovo.qtd_1));
   if (CaixasAntigo.qtd_2 <> CaixasNovo.qtd_2) then
    Auditoria.AdicionaCampoAlterado('qtd_RN', IntToStr(CaixasAntigo.qtd_2), IntToStr(CaixasNovo.qtd_2));
   if (CaixasAntigo.qtd_3 <> CaixasNovo.qtd_3) then
    Auditoria.AdicionaCampoAlterado('qtd_3', IntToStr(CaixasAntigo.qtd_3), IntToStr(CaixasNovo.qtd_3));
   if (CaixasAntigo.qtd_4 <> CaixasNovo.qtd_4) then
    Auditoria.AdicionaCampoAlterado('qtd_4', IntToStr(CaixasAntigo.qtd_4), IntToStr(CaixasNovo.qtd_4));
   if (CaixasAntigo.qtd_6 <> CaixasNovo.qtd_6) then
    Auditoria.AdicionaCampoAlterado('qtd_6', IntToStr(CaixasAntigo.qtd_6), IntToStr(CaixasNovo.qtd_6));
   if (CaixasAntigo.qtd_8 <> CaixasNovo.qtd_8) then
    Auditoria.AdicionaCampoAlterado('qtd_8', IntToStr(CaixasAntigo.qtd_8), IntToStr(CaixasNovo.qtd_8));
   if (CaixasAntigo.qtd_10 <> CaixasNovo.qtd_10) then
    Auditoria.AdicionaCampoAlterado('qtd_10', IntToStr(CaixasAntigo.qtd_10), IntToStr(CaixasNovo.qtd_10));
   if (CaixasAntigo.qtd_12 <> CaixasNovo.qtd_12) then
    Auditoria.AdicionaCampoAlterado('qtd_12', IntToStr(CaixasAntigo.qtd_12), IntToStr(CaixasNovo.qtd_12));
   if (CaixasAntigo.qtd_14 <> CaixasNovo.qtd_14) then
    Auditoria.AdicionaCampoAlterado('qtd_14', IntToStr(CaixasAntigo.qtd_14), IntToStr(CaixasNovo.qtd_14));
   if (CaixasAntigo.qtd_UNICA <> CaixasNovo.qtd_UNICA) then
    Auditoria.AdicionaCampoAlterado('qtd_UNICA', IntToStr(CaixasAntigo.qtd_UNICA), IntToStr(CaixasNovo.qtd_UNICA));
end;

procedure TRepositorioCaixas.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Caixas :TCaixas;
begin
   Caixas := (Objeto as TCaixas);

   Auditoria.AdicionaCampoExcluido('CODIGO'           , intToStr(Caixas.codigo)            );
   Auditoria.AdicionaCampoExcluido('NUMERO_CAIXA'     , Caixas.numero_caixa                );
   Auditoria.AdicionaCampoExcluido('CODIGO_CONFERENCIA', intToStr(Caixas.codigo_conferencia)      );
   Auditoria.AdicionaCampoExcluido('CODIGO_ITEM'      , intToStr(Caixas.codigo_item)          );
   Auditoria.AdicionaCampoExcluido('CODIGO_COR'       , intToStr(Caixas.codigo_cor)          );   
   Auditoria.AdicionaCampoExcluido('QTD_RN'           , intToStr(Caixas.qtd_RN   )          );
   Auditoria.AdicionaCampoExcluido('QTD_P'            , intToStr(Caixas.qtd_P    )          );
   Auditoria.AdicionaCampoExcluido('QTD_M'            , intToStr(Caixas.qtd_M    )          );
   Auditoria.AdicionaCampoExcluido('QTD_G'            , intToStr(Caixas.qtd_G    )          );
   Auditoria.AdicionaCampoExcluido('QTD_1'            , intToStr(Caixas.qtd_1    )          );
   Auditoria.AdicionaCampoExcluido('QTD_2'            , intToStr(Caixas.qtd_2    )          );
   Auditoria.AdicionaCampoExcluido('QTD_3'            , intToStr(Caixas.qtd_3    )          );
   Auditoria.AdicionaCampoExcluido('QTD_4'            , intToStr(Caixas.qtd_4    )          );
   Auditoria.AdicionaCampoExcluido('QTD_6'            , intToStr(Caixas.qtd_6    )          );
   Auditoria.AdicionaCampoExcluido('QTD_8'            , intToStr(Caixas.qtd_8    )          );
   Auditoria.AdicionaCampoExcluido('QTD_10'           , intToStr(Caixas.QTD_10    )          );
   Auditoria.AdicionaCampoExcluido('qtd_12'           , intToStr(Caixas.qtd_12    )          );
   Auditoria.AdicionaCampoExcluido('qtd_14'           , intToStr(Caixas.qtd_14    )          );
   Auditoria.AdicionaCampoExcluido('QTD_UNICA'        , intToStr(Caixas.qtd_UNICA)          );

end;

procedure TRepositorioCaixas.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  Caixas :TCaixas;
begin
   Caixas := (Objeto as TCaixas);

   Auditoria.AdicionaCampoIncluido('CODIGO'           , intToStr(Caixas.codigo)             );
   Auditoria.AdicionaCampoIncluido('NUMERO_CAIXA'     , Caixas.numero_caixa                   );
   Auditoria.AdicionaCampoIncluido('CODIGO_CONFERENCIA', intToStr(Caixas.codigo_conferencia) );
   Auditoria.AdicionaCampoIncluido('CODIGO_ITEM'      , intToStr(Caixas.codigo_item)         );
   Auditoria.AdicionaCampoIncluido('CODIGO_COR'       , intToStr(Caixas.codigo_cor)         );
   Auditoria.AdicionaCampoIncluido('QTD_RN'           , intToStr(Caixas.qtd_RN   )          );
   Auditoria.AdicionaCampoIncluido('QTD_P'            , intToStr(Caixas.qtd_P    )          );
   Auditoria.AdicionaCampoIncluido('QTD_M'            , intToStr(Caixas.qtd_M    )          );
   Auditoria.AdicionaCampoIncluido('QTD_G'            , intToStr(Caixas.qtd_G    )          );
   Auditoria.AdicionaCampoIncluido('QTD_1'            , intToStr(Caixas.qtd_1    )          );
   Auditoria.AdicionaCampoIncluido('QTD_2'            , intToStr(Caixas.qtd_2    )          );
   Auditoria.AdicionaCampoIncluido('QTD_3'            , intToStr(Caixas.qtd_3    )          );
   Auditoria.AdicionaCampoIncluido('QTD_4'            , intToStr(Caixas.qtd_4    )          );
   Auditoria.AdicionaCampoIncluido('QTD_6'            , intToStr(Caixas.qtd_6    )          );
   Auditoria.AdicionaCampoIncluido('QTD_8'            , intToStr(Caixas.qtd_8    )          );
   Auditoria.AdicionaCampoIncluido('QTD_10'           , intToStr(Caixas.QTD_10    )          );
   Auditoria.AdicionaCampoIncluido('qtd_12'           , intToStr(Caixas.qtd_12    )          );
   Auditoria.AdicionaCampoIncluido('qtd_14'           , intToStr(Caixas.qtd_14    )          );
   Auditoria.AdicionaCampoIncluido('QTD_UNICA'        , intToStr(Caixas.qtd_UNICA)          );

end;

procedure TRepositorioCaixas.SetIdentificador(Objeto: TObject;
  Identificador: Variant);
begin
  TCaixas(Objeto).Codigo := Integer(Identificador);
end;

procedure TRepositorioCaixas.SetParametros(Objeto: TObject);
var                                    
  Caixas :TCaixas;
begin
   Caixas := (Objeto as TCaixas);

   if (Caixas.Codigo > 0) then  inherited SetParametro('codigo', Caixas.Codigo)
   else                       inherited LimpaParametro('codigo');

   inherited SetParametro('NUMERO_CAIXA'     , Caixas.numero_caixa);
   inherited SetParametro('CODIGO_CONFERENCIA', Caixas.codigo_conferencia);
   inherited SetParametro('CODIGO_ITEM'       , Caixas.codigo_item);
   inherited SetParametro('CODIGO_COR'        , Caixas.codigo_cor);
   inherited SetParametro('QTD_RN'           , Caixas.qtd_RN   );
   inherited SetParametro('QTD_P'            , Caixas.qtd_P    );
   inherited SetParametro('QTD_M'            , Caixas.qtd_M    );
   inherited SetParametro('QTD_G'            , Caixas.qtd_G    );
   inherited SetParametro('QTD_1'            , Caixas.qtd_1    );
   inherited SetParametro('QTD_2'            , Caixas.qtd_2    );
   inherited SetParametro('QTD_3'            , Caixas.qtd_3    );
   inherited SetParametro('QTD_4'            , Caixas.qtd_4    );
   inherited SetParametro('QTD_6'            , Caixas.qtd_6    );
   inherited SetParametro('QTD_8'            , Caixas.qtd_8    );
   inherited SetParametro('qtd_10'           , Caixas.qtd_10    );
   inherited SetParametro('qtd_12'           , Caixas.qtd_12    );
   inherited SetParametro('qtd_14'           , Caixas.qtd_14    );
   inherited SetParametro('QTD_UNICA'        , Caixas.qtd_UNICA);

end;

function TRepositorioCaixas.SQLGet: String;
begin
  result := 'select * from CAIXAS where codigo = :ncod';
end;

function TRepositorioCaixas.SQLGetAll: String;
begin
  result := 'select * from caixas';
end;

function TRepositorioCaixas.SQLGetExiste(campo: String): String;
begin
  result := 'select '+ campo +' from caixas where '+ campo +' = :ncampo';
end;

function TRepositorioCaixas.SQLRemover: String;
begin
   result := ' delete from caixas where codigo_conferencia = :codigo ';
end;

function TRepositorioCaixas.SQLSalvar: String;
begin
  result := 'UPDATE OR INSERT INTO CAIXAS (CODIGO, NUMERO_CAIXA, CODIGO_CONFERENCIA, CODIGO_ITEM,             '+
            '                              CODIGO_COR, QTD_RN, QTD_P, QTD_M, QTD_G, QTD_1, QTD_2, QTD_3,      '+
            '                              QTD_4, QTD_6, QTD_8, QTD_10, QTD_12, QTD_14, QTD_UNICA )           '+
            'VALUES (:CODIGO, :NUMERO_CAIXA, :CODIGO_CONFERENCIA, :CODIGO_ITEM, :CODIGO_COR, :QTD_RN, :QTD_P, '+
            '        :QTD_M, :QTD_G, :QTD_1, :QTD_2, :QTD_3, :QTD_4, :QTD_6, :QTD_8, :QTD_10, :QTD_12, :QTD_14, :QTD_UNICA ) ';

end;

end.
