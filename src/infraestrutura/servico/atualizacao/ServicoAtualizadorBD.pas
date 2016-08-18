unit ServicoAtualizadorBD;

interface

uses
  uModulo,
  BuscadorDeAtualizacoesBD,
  Parametros,
  ManutencaoSistema, FireDAC.Comp.ScriptCommands,
  Classes, FireDAC.Comp.Client, FireDAC.Comp.Script;

type
  TServicoAtualizadorBD = class

  private
    FManutencao              :TManutencaoSistema;
    FBuscadorDeAtualizacoes  :IBuscadorDeAtualizacoesBD;
    FDM                      :TDM;
    FQuery                   :TFDQuery;
    FSQLScript               :TFDScript;

  private
    procedure HabilitaAutoCommit;
    procedure DesabilitaAutoCommit;
    procedure ExecutaRollbackNaTransacao;
    procedure ExecutaCommitNaTransacao;

    procedure ExecutaScripts;
    procedure GravaVersaoBancoDeDados;
    procedure LiberarSistemaParaTerminais;

    function getVersaoSistema :Integer;

  private
    function SeparaSQLs(StringComSQLs :String) :TStrings;

  public
    constructor Create(BuscadorDeAtualizacoesBD :IBuscadorDeAtualizacoesBD; DM :Tdm; Manutencao :TManutencaoSistema);
    destructor Destroy; override;

  public
    procedure ExecutaAtualizacoes;

    property versaoSistema :Integer  read getVersaoSistema;
end;

implementation

uses
  ExcecaoScriptDeAtualizacaoInvalido,
  ExcecaoParametroInvalido,
  SysUtils,
  Repositorio,
  FabricaRepositorio,
  ExcecaoSistemaEmManutencao;

const
  VERSAO_SISTEMA = 171;


{ TServicoAtualizadorBD }

constructor TServicoAtualizadorBD.Create(BuscadorDeAtualizacoesBD :IBuscadorDeAtualizacoesBD; DM :Tdm; Manutencao :TManutencaoSistema);
const
  NOME_DO_METODO = 'Create(Parametros: TParametros; BuscadorDeAtualizacoesBD: IBuscadorDeAtualizacoesBD; DM :Tdm)';
begin
   if not Assigned(BuscadorDeAtualizacoesBD) then
    raise TExcecaoParametroInvalido.Create(self.ClassName,
                                           NOME_DO_METODO,
                                           'BuscadorDeAtualizacoesBD');

    if not Assigned(DM) then
      raise TExcecaoParametroInvalido.Create(self.ClassName,
                                             NOME_DO_METODO,
                                             'DM');

   self.FBuscadorDeAtualizacoes     := BuscadorDeAtualizacoesBD;
   self.FDM                         := DM;
   self.FQuery                      := self.FDM.GetConsulta;
   self.FSQLScript                  := TFDScript.Create(nil);
   self.FSQLScript.ScriptOptions.CommandSeparator := '^';
   self.FSQLScript.Connection       := self.FDM.conexao;
   self.FManutencao                 := Manutencao;
end;

procedure TServicoAtualizadorBD.DesabilitaAutoCommit;
begin
   self.FQuery.Connection.TxOptions.AutoCommit := false;
end;

destructor TServicoAtualizadorBD.Destroy;
begin
  self.FBuscadorDeAtualizacoes := nil;
  self.FManutencao             := nil;
  self.FDM                     := nil;

  if Assigned(self.FQuery) then
    FreeAndNil(self.FQuery);
  
  inherited;
end;

procedure TServicoAtualizadorBD.ExecutaScripts;
var
  VersaoAtual :Integer;
  ListaSQLs   :TStrings;
  nX          :Integer;
begin
   self.DesabilitaAutoCommit;

   try
      VersaoAtual := self.FDM.Parametros.VersaoBancoDeDados;

      while (VersaoAtual < VERSAO_SISTEMA) do begin
         Inc(VersaoAtual);
         ListaSQLs := self.SeparaSQLs(self.FBuscadorDeAtualizacoes.BuscaScriptPorNumeroDaVersao(VersaoAtual));

         try
           for nX := 0 to (ListaSQLs.Count-1) do begin
               with FSQLScript do begin
                 SQLScripts.Clear;
                 SQLScripts.Add;
                 with SQLScripts[0].SQL do begin
                   Add(ListaSQLs[nX]);
                 end;
                 ValidateAll;
                 ExecuteAll;
               end;
           end;

           self.ExecutaCommitNaTransacao;
         except
           on E: Exception do begin
             self.ExecutaRollbackNaTransacao;
             raise TExcecaoScriptDeAtualizacaoInvalido.Create(VersaoAtual, E.Message);
           end;
         end;

         FreeAndNil(ListaSQLs);
      end;

      self.ExecutaCommitNaTransacao;
   finally
     self.HabilitaAutoCommit;
   end;
end;

procedure TServicoAtualizadorBD.ExecutaCommitNaTransacao;
begin
   if self.FQuery.Connection.InTransaction then
     self.FQuery.Connection.Commit;
end;

procedure TServicoAtualizadorBD.ExecutaRollbackNaTransacao;
begin
   self.FQuery.Connection.Rollback;
end;

procedure TServicoAtualizadorBD.HabilitaAutoCommit;
begin
   self.FQuery.Connection.TxOptions.AutoCommit := true;
end;

function TServicoAtualizadorBD.SeparaSQLs(StringComSQLs: String): TStrings;
var
  nX :Integer;
begin
  result           := TStringList.Create;
  StringComSQLs    := StringReplace(StringComSQLs, #$D#$A, ' ',    [rfReplaceAll]);
  result.Text      := StringReplace(StringComSQLs, '^',    #13#10, [rfReplaceAll]);

  // Para remover a última linha vazia.
  if (result.Count > 1) and (Trim(result[result.Count-1]) = '') then
    result.Delete(result.Count-1);
end;

procedure TServicoAtualizadorBD.ExecutaAtualizacoes;
begin
   // Se o FManutencao estiver nulo, significa que o sistema não está em manutenção
   if not Assigned(self.FManutencao) then exit;

   // Se o terminal não for o mesmo que iniciou a manutenção, então uma exceção é lançada
   if (self.FManutencao.TerminalResponsavel <> self.FDM.NomeDoTerminal) then
    raise TExcecaoSistemaEmManutencao.Create;

   self.ExecutaScripts;
   self.GravaVersaoBancoDeDados;
   self.LiberarSistemaParaTerminais;
end;

procedure TServicoAtualizadorBD.GravaVersaoBancoDeDados;
var
  Repositorio :TRepositorio;
begin
   try
     Repositorio                             := TFabricaRepositorio.GetRepositorio(self.FDM.Parametros.ClassName);
     self.FDM.Parametros.VersaoBancoDeDados  := VERSAO_SISTEMA;
     Repositorio.Salvar(self.FDM.Parametros);
   finally
     FreeAndNil(Repositorio);
   end;
end;

procedure TServicoAtualizadorBD.LiberarSistemaParaTerminais;
var
  Repositorio :TRepositorio;
begin
   Repositorio := TFabricaRepositorio.GetRepositorio(self.FManutencao.ClassName);

   try
     Repositorio.Remover(self.FManutencao);
   finally
     FreeAndNil(Repositorio);
   end;
end;

function TServicoAtualizadorBD.getVersaoSistema: Integer;
begin
  Result := VERSAO_SISTEMA;
end;

end.
