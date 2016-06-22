unit Grade;

interface

uses
  SysUtils,
  Contnrs;

type
  TGrade = class

  private
    FCodigo     :Integer;
    FDescricao  :String;
    FTamanhos: TObjectList;

    procedure SetCodigo     (const value :Integer);
    procedure SetDescricao  (const value :String);

  private
    function GetTamanhos: TObjectList;

  public
    property Codigo     :Integer     read FCodigo     write SetCodigo;
    property Descricao  :String      read FDescricao  write SetDescricao;

  public
    constructor Create;
    destructor  Destroy; override;

  public
    property Tamanhos   :TObjectList read GetTamanhos;
  end;

implementation

uses
  Repositorio,
  FabricaRepositorio, Especificacao,
  EspecificacaoGradeTamanhoPorCodigoGrade, Grade_Tamanhos, Tamanho;

{ TGrade }

constructor TGrade.Create;
begin
   self.FTamanhos := nil;
end;

destructor TGrade.Destroy;
begin
  FreeAndNil(FTamanhos);
  
  inherited;
end;

function TGrade.GetTamanhos: TObjectList;
var
  RepositorioGradeTamanho, RepositorioTamanho :TRepositorio;
  GradeTamanhoPorGrade                        :TEspecificacao;
  ListaGradesTamanhos                         :TObjectList;
  nX                                          :Integer;
begin
   if not Assigned(FTamanhos) then begin
     RepositorioGradeTamanho := nil;
     GradeTamanhoPorGrade    := nil;
     ListaGradesTamanhos     := nil;

     try
       GradeTamanhoPorGrade     := TEspecificacaoGradeTamanhoPorCodigoGrade.Create(self.FCodigo);
       RepositorioGradeTamanho  := TFabricaRepositorio.GetRepositorio(TGrade_Tamanhos.ClassName);
       ListaGradesTamanhos      := RepositorioGradeTamanho.GetListaPorEspecificacao(GradeTamanhoPorGrade);

       if Assigned(ListaGradesTamanhos) and (ListaGradesTamanhos.Count > 0) then begin
         self.FTamanhos := TObjectList.Create;

         for nX := 0 to (ListaGradesTamanhos.Count-1) do begin
            RepositorioTamanho      := nil;

            try
              RepositorioTamanho := TFabricaRepositorio.GetRepositorio(TTamanho.ClassName);
              self.FTamanhos.Add(RepositorioTamanho.Get(TGrade_Tamanhos(ListaGradesTamanhos[nX]).Codtamanho));
            finally
              FreeAndNil(RepositorioTamanho);
            end;
         end;
       end;
     finally
       FreeAndNil(GradeTamanhoPorGrade);
       FreeAndNil(RepositorioGradeTamanho);
       FreeAndNil(ListaGradesTamanhos);
     end;
   end;

   result := self.FTamanhos;
end;

procedure TGrade.SetCodigo(const value: Integer);
begin
  FCodigo := value;
end;

procedure TGrade.SetDescricao(const value: String);
begin
  FDescricao := value;
end;

end.
