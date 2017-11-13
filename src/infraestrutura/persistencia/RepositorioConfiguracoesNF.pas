unit RepositorioConfiguracoesNF;

interface

uses
  DB,
  Auditoria,
  Repositorio;

type
  TRepositorioConfiguracoesNF = class(TRepositorio)

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
    function IsInsercao(Objeto :TObject)       :Boolean;           override;
    function IsComponente()                    :Boolean;           override;

  protected
    procedure SetParametros   (Objeto :TObject                        ); override;

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
  ConfiguracoesNF, FabricaRepositorio, ConfiguracoesNFEmail;

{ TRepositorioConfiguracoesNF }

function TRepositorioConfiguracoesNF.Get(Dataset: TDataSet): TObject;
var
  ConfiguracoesNF :TConfiguracoesNF;
begin
   ConfiguracoesNF                      := TConfiguracoesNF.CriarParaRepositorio(Dataset.FieldByName('codigo_empresa').AsInteger, Dataset.FieldByName('senha_certificado').AsString);
   ConfiguracoesNF.aliq_cred_sn         := self.FQuery.fieldByName('aliq_cred_sn'   ).AsFloat;
   ConfiguracoesNF.aliq_icms            := self.FQuery.fieldByName('aliq_icms'      ).AsFloat;
   ConfiguracoesNF.aliq_pis             := self.FQuery.fieldByName('aliq_pis'       ).AsFloat;
   ConfiguracoesNF.aliq_cofins          := self.FQuery.fieldByName('aliq_cofins'    ).AsFloat;
   ConfiguracoesNF.num_certificado      := self.FQuery.FieldByName('num_certificado').AsString;
   ConfiguracoesNF.ambiente_nfe         := self.FQuery.FieldByName('ambiente_nfe'   ).AsString;
   ConfiguracoesNF.SequenciaNotaFiscal  := self.FQuery.FieldByName('sequencia_nf').AsInteger;
   ConfiguracoesNF.Tipo_emissao         := self.FQuery.FieldByName('tipo_emissao').AsInteger;
   ConfiguracoesNF.Dt_contingencia      := self.FQuery.FieldByName('Dt_contingencia').AsDateTime;

   result := ConfiguracoesNF;
end;

function TRepositorioConfiguracoesNF.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TConfiguracoesNF(Objeto).CodigoEmpresa;
end;

function TRepositorioConfiguracoesNF.GetNomeDaTabela: String;
begin
  result := 'Configuracoes_NF';
end;

function TRepositorioConfiguracoesNF.GetRepositorio: TRepositorio;
begin
  result := TRepositorioConfiguracoesNF.Create;
end;

function TRepositorioConfiguracoesNF.IsComponente: Boolean;
begin
   result := true;
end;

function TRepositorioConfiguracoesNF.IsInsercao(Objeto: TObject): Boolean;
begin
   result := true;
end;

procedure TRepositorioConfiguracoesNF.SetCamposAlterados(Auditoria: TAuditoria;
  AntigoObjeto, Objeto: TObject);
var
  ConfiguracoesNFAntigo :TConfiguracoesNF;
  ConfiguracoesNFNovo   :TConfiguracoesNF;
begin
   ConfiguracoesNFAntigo := (AntigoObjeto as TConfiguracoesNF);
   ConfiguracoesNFNovo   := (Objeto       as TConfiguracoesNF);

   if (ConfiguracoesNFAntigo.aliq_cred_sn <> ConfiguracoesNFNovo.aliq_cred_sn) then
    Auditoria.AdicionaCampoAlterado('aliq_cred_sn', floatToStr(ConfiguracoesNFAntigo.aliq_cred_sn), floatToStr(ConfiguracoesNFNovo.aliq_cred_sn));
   if (ConfiguracoesNFAntigo.aliq_icms <> ConfiguracoesNFNovo.aliq_icms) then
    Auditoria.AdicionaCampoAlterado('aliq_icms', floatToStr(ConfiguracoesNFAntigo.aliq_icms), floatToStr(ConfiguracoesNFNovo.aliq_icms));
   if (ConfiguracoesNFAntigo.aliq_pis <> ConfiguracoesNFNovo.aliq_pis) then
    Auditoria.AdicionaCampoAlterado('aliq_pis', floatToStr(ConfiguracoesNFAntigo.aliq_pis), floatToStr(ConfiguracoesNFNovo.aliq_pis));
   if (ConfiguracoesNFAntigo.aliq_cofins <> ConfiguracoesNFNovo.aliq_cofins) then
    Auditoria.AdicionaCampoAlterado('aliq_cofins', floatToStr(ConfiguracoesNFAntigo.aliq_cofins), floatToStr(ConfiguracoesNFNovo.aliq_cofins));
   if (ConfiguracoesNFAntigo.num_certificado <> ConfiguracoesNFNovo.num_certificado) then
    Auditoria.AdicionaCampoAlterado('num_certificado', ConfiguracoesNFAntigo.num_certificado, ConfiguracoesNFNovo.num_certificado);
   if (ConfiguracoesNFAntigo.ambiente_nfe <> ConfiguracoesNFNovo.ambiente_nfe) then
    Auditoria.AdicionaCampoAlterado('ambiente_nfe', ConfiguracoesNFAntigo.ambiente_nfe, ConfiguracoesNFNovo.ambiente_nfe);
   if (ConfiguracoesNFAntigo.SequenciaNotaFiscal <> ConfiguracoesNFNovo.SequenciaNotaFiscal) then
    Auditoria.AdicionaCampoAlterado('sequencia_nf', IntToStr(ConfiguracoesNFAntigo.SequenciaNotaFiscal), IntToStr(ConfiguracoesNFNovo.SequenciaNotaFiscal));
   if (ConfiguracoesNFAntigo.Tipo_emissao <> ConfiguracoesNFNovo.Tipo_emissao) then
    Auditoria.AdicionaCampoAlterado('Tipo_emissao', IntToStr(ConfiguracoesNFAntigo.Tipo_emissao), IntToStr(ConfiguracoesNFNovo.Tipo_emissao));
   if (ConfiguracoesNFAntigo.Dt_contingencia <> ConfiguracoesNFNovo.Dt_contingencia) then
    Auditoria.AdicionaCampoAlterado('Dt_contingencia', DatetimeToStr(ConfiguracoesNFAntigo.Dt_contingencia), DatetimeToStr(ConfiguracoesNFNovo.Dt_contingencia));

   if (ConfiguracoesNFAntigo.SenhaCertificadoCriptografada <> ConfiguracoesNFNovo.SenhaCertificadoCriptografada) then
    Auditoria.AdicionaCampoAlterado('senha_certificado', ConfiguracoesNFAntigo.SenhaCertificadoCriptografada, ConfiguracoesNFNovo.SenhaCertificadoCriptografada);

end;

procedure TRepositorioConfiguracoesNF.SetCamposExcluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  ConfiguracoesNF :TConfiguracoesNF;
begin
   ConfiguracoesNF := (Objeto as TConfiguracoesNF);

   Auditoria.AdicionaCampoExcluido('codigo_empresa' , intToStr(ConfiguracoesNF.CodigoEmpresa));
   Auditoria.AdicionaCampoExcluido('aliq_cred_sn'   , floatToStr(ConfiguracoesNF.aliq_cred_sn));
   Auditoria.AdicionaCampoExcluido('aliq_icms'      , floatToStr(ConfiguracoesNF.aliq_icms));
   Auditoria.AdicionaCampoExcluido('aliq_pis'       , floatToStr(ConfiguracoesNF.aliq_pis));
   Auditoria.AdicionaCampoExcluido('aliq_cofins'    , floatToStr(ConfiguracoesNF.aliq_cofins));
   Auditoria.AdicionaCampoExcluido('num_certificado', ConfiguracoesNF.num_certificado);
   Auditoria.AdicionaCampoExcluido('ambiente_nfe'   , ConfiguracoesNF.ambiente_nfe);
   Auditoria.AdicionaCampoExcluido('sequencia_nf',    IntToStr(ConfiguracoesNF.SequenciaNotaFiscal));
   Auditoria.AdicionaCampoExcluido('senha_certificado', ConfiguracoesNF.SenhaCertificadoCriptografada);
   Auditoria.AdicionaCampoExcluido('Tipo_emissao', IntToStr(ConfiguracoesNF.Tipo_emissao));
   Auditoria.AdicionaCampoExcluido('dt_contingencia', DateTimeToStr(ConfiguracoesNF.dt_contingencia));
end;

procedure TRepositorioConfiguracoesNF.SetCamposIncluidos(Auditoria: TAuditoria;
  Objeto: TObject);
var
  ConfiguracoesNF :TConfiguracoesNF;
begin
   ConfiguracoesNF := (Objeto as TConfiguracoesNF);

   Auditoria.AdicionaCampoIncluido('codigo_empresa' , intToStr(ConfiguracoesNF.CodigoEmpresa));
   Auditoria.AdicionaCampoIncluido('aliq_cred_sn'   , floatToStr(ConfiguracoesNF.aliq_cred_sn));
   Auditoria.AdicionaCampoIncluido('aliq_icms'      , floatToStr(ConfiguracoesNF.aliq_icms));
   Auditoria.AdicionaCampoIncluido('aliq_pis'       , floatToStr(ConfiguracoesNF.aliq_pis));
   Auditoria.AdicionaCampoIncluido('aliq_cofins'    , floatToStr(ConfiguracoesNF.aliq_cofins));
   Auditoria.AdicionaCampoIncluido('num_certificado', ConfiguracoesNF.num_certificado);
   Auditoria.AdicionaCampoIncluido('ambiente_nfe'   , ConfiguracoesNF.ambiente_nfe);
   Auditoria.AdicionaCampoIncluido('sequencia_nf',    IntToStr(ConfiguracoesNF.SequenciaNotaFiscal));
   Auditoria.AdicionaCampoIncluido('sequencia_nf',    IntToStr(ConfiguracoesNF.SequenciaNotaFiscal));
   Auditoria.AdicionaCampoIncluido('senha_certificado', ConfiguracoesNF.SenhaCertificadoCriptografada);
   Auditoria.AdicionaCampoIncluido('Tipo_emissao',    IntToStr(ConfiguracoesNF.Tipo_emissao));
   Auditoria.AdicionaCampoIncluido('dt_contingencia', DateTimeToStr(ConfiguracoesNF.dt_contingencia));
end;

procedure TRepositorioConfiguracoesNF.SetParametros(Objeto: TObject);
var
  ConfiguracoesNF :TConfiguracoesNF;
begin
   ConfiguracoesNF := (Objeto as TConfiguracoesNF);

//   if (ConfiguracoesNF.Codigo > 0) then  inherited SetParametro('codigo', ConfiguracoesNF.Codigo)
//   else                         inherited LimpaParametro('codigo');

   self.FQuery.ParamByName('codigo_empresa').AsInteger        := ConfiguracoesNF.CodigoEmpresa;
   self.FQuery.ParamByName('aliq_cred_sn'   ).AsFloat         := ConfiguracoesNF.aliq_cred_sn;
   self.FQuery.ParamByName('aliq_icms'      ).AsFloat         := ConfiguracoesNF.aliq_icms;
   self.FQuery.ParamByName('aliq_pis'       ).AsFloat         := ConfiguracoesNF.aliq_pis;
   self.FQuery.ParamByName('aliq_cofins'    ).AsFloat         := ConfiguracoesNF.aliq_cofins;
   self.FQuery.ParamByName('num_certificado').AsString        := ConfiguracoesNF.num_certificado;
   self.FQuery.ParamByName('ambiente_nfe'   ).AsString        := ConfiguracoesNF.ambiente_nfe;
   self.FQuery.ParamByName('sequencia_nf').AsInteger          := ConfiguracoesNF.SequenciaNotaFiscal;
   self.FQuery.ParamByName('senha_certificado').AsString      := ConfiguracoesNF.SenhaCertificadoCriptografada;
   self.FQuery.ParamByName('Tipo_emissao').AsInteger          := ConfiguracoesNF.Tipo_emissao;
   self.FQuery.ParamByName('dt_contingencia').AsDateTime      := ConfiguracoesNF.Dt_contingencia;
end;

function TRepositorioConfiguracoesNF.SQLGet: String;
begin
  result := 'select * from Configuracoes_NF where codigo_empresa = :codigo ';
end;

function TRepositorioConfiguracoesNF.SQLGetAll: String;
begin
  result := 'select * from Configuracoes_NF';
end;

function TRepositorioConfiguracoesNF.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioConfiguracoesNF.SQLRemover: String;
begin
   result := ' delete from Configuracoes_NF where codigo_empresa = :codigo_empresa ';
end;

function TRepositorioConfiguracoesNF.SQLSalvar: String;
begin
  result := 'update or insert into Configuracoes_NF                                                                                                 '+
            '(codigo_empresa, aliq_cred_sn, aliq_icms, aliq_pis, aliq_cofins, num_certificado, ambiente_nfe, sequencia_nf, senha_certificado, Tipo_emissao, DT_CONTINGENCIA)   '+
            ' Values (:codigo_empresa, :aliq_cred_sn, :aliq_icms, :aliq_pis, :aliq_cofins, :num_certificado, :ambiente_nfe, :sequencia_nf, :senha_certificado, :Tipo_emissao, :DT_CONTINGENCIA) ';
end;

end.
              
              
              
              
              
              
              

