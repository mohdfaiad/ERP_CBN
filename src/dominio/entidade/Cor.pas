unit Cor;

interface

uses
  SysUtils,
  Contnrs;

type
  TCor = class

  private
    FCodigo     :Integer;
    FDescricao  :String;
    FReferencia: String;
    FDesc_producao: String;
    FCor: String;
    FTipo: String;
    FCor_pai: String;
    FCodigo_colecao :integer;
    FCoresFilhas :TObjectList;
    FCoresKit :TObjectList;
    FKit :Boolean;

    procedure SetCodigo     (const value :Integer);
    procedure SetDescricao  (const value :String);
    procedure SetReferencia(const Value: String);
    procedure SetCor(const Value: String);
    procedure SetDesc_producao(const Value: String);
    procedure SetTipo(const Value: String);
    procedure SetCor_pai(const Value: String);
    function GetCoresKit: TObjectList;

  private
    function GetCoresFilhas: TObjectList;

  public

    property Codigo        :Integer  read FCodigo        write SetCodigo;
    property Descricao     :String   read FDescricao     write SetDescricao;
    property Referencia    :String   read FReferencia    write SetReferencia;
    property Desc_producao :String   read FDesc_producao write SetDesc_producao;
    property Cor           :String   read FCor           write SetCor;
    property Tipo          :String   read FTipo          write SetTipo;
    property Cor_pai       :String   read FCor_pai       write SetCor_pai;
    property Codigo_colecao :Integer read FCodigo_colecao write FCodigo_colecao;
    property kit           :Boolean  read FKit           write FKit;

    property CoresFilhas   :TObjectList read GetCoresFilhas;
    property CoresKit      :TObjectList read GetCoresKit;
  end;

implementation

uses Repositorio, FabricaRepositorio, EspecificacaoCoresFilhasPorCorPai, CorFilha, CoresKit, EspecificacaoCoresKit;

{ TCor }

function TCor.GetCoresFilhas: TObjectList;
var
  Repositorio   :TRepositorio;
  Especificacao :TEspecificacaoCoresFilhasPorCorPai;
begin
   Repositorio    := nil;
   Especificacao  := nil;

   if (self.Cor_pai <> 'S') then self.FCoresFilhas := nil;

   try
      if (self.Cor_pai = 'S') and not Assigned(self.FCoresFilhas) then begin
        Especificacao         := TEspecificacaoCoresFilhasPorCorPai.Create(self.FCodigo);
        Repositorio           := TFabricaRepositorio.GetRepositorio(TCorFilha.ClassName);
        self.FCoresFilhas     := Repositorio.GetListaPorEspecificacao(Especificacao, IntToStr(self.Codigo));
      end;

      result := self.FCoresFilhas;

   finally
     FreeAndNil(Especificacao);
     FreeAndNil(Repositorio);
   end;
end;

function TCor.GetCoresKit: TObjectList;
var
  Repositorio   :TRepositorio;
  Especificacao :TEspecificacaoCoresKit;
begin
   Repositorio    := nil;
   Especificacao  := nil;

   try
      if not Assigned(self.FCoresKit) then begin
        Especificacao    := TEspecificacaoCoresKit.Create(self);
        Repositorio      := TFabricaRepositorio.GetRepositorio(TCoresKit.ClassName);
        self.FCoresKit   := Repositorio.GetListaPorEspecificacao(Especificacao, IntToStr(self.Codigo));
      end;

      result := self.FCoresKit;

   finally
     FreeAndNil(Especificacao);
     FreeAndNil(Repositorio);
   end;
end;

procedure TCor.SetCodigo(const value: Integer);
begin
  FCodigo := value;
end;

procedure TCor.SetCor(const Value: String);
begin
  FCor := Value;
end;

procedure TCor.SetCor_pai(const Value: String);
begin
  FCor_pai := Value;
end;

procedure TCor.SetDescricao(const value: String);
begin
  FDescricao := value;
end;

procedure TCor.SetDesc_producao(const Value: String);
begin
  FDesc_producao := Value;
end;

procedure TCor.SetReferencia(const Value: String);
begin
  FReferencia := Value;
end;

procedure TCor.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

end.
