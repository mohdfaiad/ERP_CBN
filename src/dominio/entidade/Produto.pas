unit Produto;

interface

uses
  SysUtils,
  Contnrs,
  Grade, NcmIbpt;

type
  TProduto = class

  private
    FCodigo      :integer;
    FDescricao   :String;
    FCod_Ncm     :integer;
    FCod_tipo    :integer;
    FCod_Grupo   :integer;
    FCod_Colecao :integer;
    FCod_Grade   :integer;
    FLinha_ano   :String;
    FAtivo       :Boolean;
    FPrecoVenda  :Real;
    FPrecoCusto  :Real;
    FPrecoAtacado:Real;
    FPrecoMedio  :Real;
    FEstoqueFis  :integer;
    FEstoqueMin  :integer;
    FPesoLiq     :Real;
    FPesoBru     :Real;
    FQtd_Pecas   :Integer;
    FReferencia: String;
    FGrade       :TGrade;
    FTipo: String;
    FUnidadeMedida: String;
    FKit: Boolean;
    FProdutosKit :TObjectList;
    FDescricaoTipoCor :String;

    procedure setCodigo       (const value:integer);
    procedure setDescricao    (const value:String);
    procedure setCod_Ncm      (const value:integer);
    procedure setCod_tipo     (const value:integer);
    procedure setCod_Grupo    (const value:integer);
    procedure setCod_Colecao  (const value:integer);
    procedure setCod_Grade    (const value:integer);
    procedure setLinha_ano    (const value:String);
    procedure setAtivo        (const value:Boolean);
    procedure setPrecoVenda   (const value:Real);
    procedure setPrecoCusto   (const value:Real);
    procedure setPrecoAtacado (const value:Real);
    procedure setPrecoMedio   (const value:Real);
    procedure setEstoqueFis   (const value:integer);
    procedure setEstoqueMin   (const value:integer);
    procedure setPesoLiq      (const value:Real);
    procedure setPesoBru      (const value:Real);
    procedure SetQtd_Pecas    (const Value: Integer);
    procedure SetReferencia(const Value: String);
    procedure SetTipo(const Value: String);
    procedure SetUnidadeMedida(const Value: String);

  private
    FNcmIbpt: TNcmIbpt;
    FCodigo_ibpt: integer;
    function GetGrade: TGrade;
    function GetProdutosKit: TObjectList;
    function GetNcmIbpt: TNcmIbpt;
    function GetAliqNcmIbpt: Real;

  public
    property Codigo       :integer read FCodigo       write setCodigo;
    property Descricao    :String  read FDescricao    write setDescricao;
    property Cod_Ncm      :integer read FCod_Ncm      write setCod_Ncm;
    property Cod_tipo     :integer read FCod_tipo     write setCod_tipo;
    property Cod_Grupo    :integer read FCod_Grupo    write setCod_Grupo;
    property Cod_Colecao  :integer read FCod_Colecao  write setCod_Colecao;
    property Cod_Grade    :integer read FCod_Grade    write setCod_Grade;
    property Linha_ano    :String  read FLinha_ano    write setLinha_ano;
    property Ativo        :Boolean read FAtivo        write setAtivo;
    property PrecoVenda   :Real    read FPrecoVenda   write setPrecoVenda;
    property PrecoCusto   :Real    read FPrecoCusto   write setPrecoCusto;
    property PrecoAtacado :Real    read FPrecoAtacado write setPrecoAtacado;
    property PrecoMedio   :Real    read FPrecoMedio   write setPrecoMedio;
    property EstoqueFis   :integer read FEstoqueFis   write setEstoqueFis;
    property EstoqueMin   :integer read FEstoqueMin   write setEstoqueMin;
    property PesoLiq      :Real    read FPesoLiq      write setPesoLiq;
    property PesoBru      :Real    read FPesoBru      write setPesoBru;
    property Qtd_Pecas    :Integer read FQtd_Pecas    write SetQtd_Pecas;
    property Referencia   :String  read FReferencia   write SetReferencia;
    property Tipo         :String  read FTipo         write SetTipo;
    property UnidadeMedida:String  read FUnidadeMedida write SetUnidadeMedida;
    property Codigo_ibpt  :integer read FCodigo_ibpt  write FCodigo_ibpt;
    property descricaoTipoCor :String read FDescricaoTipoCor write FDescricaoTipoCor;

  public
    property Kit          :Boolean read FKit          write FKit;

    property ProdutosKit  :TObjectList read GetProdutosKit;
    property AliqNcmIbpt  :Real    read GetAliqNcmIbpt;

  public
    constructor Create;
    destructor  Destroy; override;

  public
    property Grade :TGrade read GetGrade;
end;

implementation

uses FabricaRepositorio, Repositorio, EspecificacaoProdutosKit, ProdutosKit, funcoes;

{ TProduto }

procedure TProduto.setAtivo(const value: Boolean);
begin
  FAtivo := value;
end;

procedure TProduto.setCod_Colecao(const value: integer);
begin
  FCod_Colecao := value;
end;

procedure TProduto.setCod_Grade(const value: integer);
begin
  FCod_Grade := value;
end;

procedure TProduto.setCod_Grupo(const value: integer);
begin
  FCod_Grupo := value;
end;

procedure TProduto.setCod_Ncm(const value: integer);
begin
  FCod_Ncm := value;
end;

procedure TProduto.setCod_tipo(const value: integer);
begin
  FCod_tipo := value;
end;

procedure TProduto.setCodigo(const value: integer);
begin
  FCodigo := value;
end;

procedure TProduto.setDescricao(const value: String);
begin
  FDescricao := value;
end;

procedure TProduto.setEstoqueFis(const value: integer);
begin
  FEstoqueFis := value;
end;

procedure TProduto.setEstoqueMin(const value: integer);
begin
  FEstoqueMin := value;
end;

procedure TProduto.setLinha_ano(const value: String);
begin
  FLinha_ano := value;
end;

procedure TProduto.setPesoBru(const value: Real);
begin
  FPesoBru := value;
end;

procedure TProduto.setPesoLiq(const value: Real);
begin
  FPesoLiq := value;
end;

procedure TProduto.setPrecoAtacado(const value: Real);
begin
  FPrecoAtacado := value;
end;

procedure TProduto.setPrecoCusto(const value: Real);
begin
  FPrecoCusto := value;
end;

procedure TProduto.setPrecoMedio(const value: Real);
begin
  FPrecoMedio := value;
end;

procedure TProduto.setPrecoVenda(const value: Real);
begin
  FPrecoVenda := value;
end;

procedure TProduto.SetQtd_Pecas(const Value: Integer);
begin
  FQtd_Pecas := Value;
end;

procedure TProduto.SetReferencia(const Value: String);
begin
  FReferencia := Value;
end;

function TProduto.GetAliqNcmIbpt: Real;
begin
  result := StrToFloatDef(Campo_por_campo('IBPT','ALIQNACIONAL_IBPT','NCM_IBPT',intToStr(self.Cod_Ncm)) ,0);
end;

function TProduto.GetGrade: TGrade;
var
  Repositorio :TRepositorio;
begin
   if not Assigned(self.FGrade) then begin
     Repositorio := nil;

     try
       Repositorio := TFabricaRepositorio.GetRepositorio(TGrade.ClassName);
       self.FGrade := (Repositorio.Get(self.FCod_Grade) as TGrade);
     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FGrade;
end;

function TProduto.GetNcmIbpt: TNcmIbpt;
var
  Repositorio   :TRepositorio;
begin
   Repositorio    := nil;

   {serviço nao tributa imposto}
  // if self.tipo = 'S' then exit;

   try
      if not Assigned(self.FNcmIBPT) then begin
        Repositorio           := TFabricaRepositorio.GetRepositorio(TNcmIBPT.ClassName);
        self.FNcmIBPT         := TNcmIBPT( Repositorio.Get(self.Fcodigo_ibpt) );
      end;

      result := self.FNcmIBPT;
   finally
     FreeAndNil(Repositorio);
   end;
end;

constructor TProduto.Create;
begin
   self.FGrade := nil;
end;

destructor TProduto.Destroy;
begin
  FreeAndNil(FGrade);
  
  inherited;
end;

procedure TProduto.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

procedure TProduto.SetUnidadeMedida(const Value: String);
begin
  FUnidadeMedida := Value;
end;

function TProduto.GetProdutosKit: TObjectList;
var
  Repositorio   :TRepositorio;
  Especificacao :TEspecificacaoProdutosKit;
begin
   Repositorio    := nil;
   Especificacao  := nil;
   
   try
      if not Assigned(self.FProdutosKit) then begin
        Especificacao         := TEspecificacaoProdutosKit.Create(self);
        Repositorio           := TFabricaRepositorio.GetRepositorio(TProdutosKit.ClassName);
        self.FProdutosKit     := Repositorio.GetListaPorEspecificacao(Especificacao, IntToStr(self.FCodigo));
      end;

      result := self.FProdutosKit;
   finally
     FreeAndNil(Especificacao);
     FreeAndNil(Repositorio);
   end;
end;

end.
