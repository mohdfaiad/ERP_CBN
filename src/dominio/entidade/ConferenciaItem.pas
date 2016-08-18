unit ConferenciaItem;

interface

uses
  SysUtils,
  Contnrs,
  Item;

type
  TConferenciaItem = class

  private
    Fcodigo_item: integer;
    Fcodigo: integer;
    Fcodigo_conferencia: integer;
    FQTD_UNICA: integer;
    FQTD_2: integer;
    FQTD_3: integer;
    FQTD_4: integer;
    FQTD_RN: integer;
    FQTD_6: integer;
    FQTD_8: integer;
    FQTD_G: integer;
    FQTD_1: integer;
    FQTD_P: integer;
    FQTD_M: integer;
    FNumero_caixa: integer;
    FItem: TItem;
    FQTD_12: integer;
    FQTD_10: integer;
    FQTD_14: integer;
  //  FNovo :String;

    procedure Setcodigo(const Value: integer);
    procedure Setcodigo_conferencia(const Value: integer);
    procedure Setcodigo_item(const Value: integer);
    procedure SetQTD_1(const Value: integer);
    procedure SetQTD_2(const Value: integer);
    procedure SetQTD_3(const Value: integer);
    procedure SetQTD_4(const Value: integer);
    procedure SetQTD_6(const Value: integer);
    procedure SetQTD_8(const Value: integer);
    procedure SetQTD_G(const Value: integer);
    procedure SetQTD_M(const Value: integer);
    procedure SetQTD_P(const Value: integer);
    procedure SetQTD_RN(const Value: integer);
    procedure SetQTD_UNICA(const Value: integer);
    procedure SetNumero_caixa(const Value: integer);
    function GetQTD_TOTAL: integer;
    function GetItem: TItem;
    procedure SetQTD_10(const Value: integer);
    procedure SetQTD_12(const Value: integer);
    procedure SetQTD_14(const Value: integer);

  public
    property codigo             :integer read Fcodigo write Setcodigo;
    property codigo_conferencia :integer read Fcodigo_conferencia write Setcodigo_conferencia;
    property codigo_item        :integer read Fcodigo_item write Setcodigo_item;
    property QTD_RN             :integer read FQTD_RN write SetQTD_RN;
    property QTD_P              :integer read FQTD_P write SetQTD_P;
    property QTD_M              :integer read FQTD_M write SetQTD_M;
    property QTD_G              :integer read FQTD_G write SetQTD_G;
    property QTD_1              :integer read FQTD_1 write SetQTD_1;
    property QTD_2              :integer read FQTD_2 write SetQTD_2;
    property QTD_3              :integer read FQTD_3 write SetQTD_3;
    property QTD_4              :integer read FQTD_4 write SetQTD_4;
    property QTD_6              :integer read FQTD_6 write SetQTD_6;
    property QTD_8              :integer read FQTD_8 write SetQTD_8;
    property QTD_10              :integer read FQTD_10 write SetQTD_10;
    property QTD_12              :integer read FQTD_12 write SetQTD_12;
    property QTD_14              :integer read FQTD_14 write SetQTD_14;
    property QTD_UNICA          :integer read FQTD_UNICA write SetQTD_UNICA;
    property Numero_caixa       :integer read FNumero_caixa write SetNumero_caixa;
    property QTD_TOTAL          :integer read GetQTD_TOTAL;
    property Item               :TItem   read GetItem;
  //  property Novo               :String  read FNovo  write FNovo;

end;

implementation

uses repositorio, fabricaRepositorio, EspecificacaoItemPorCodigo;

{ TConferenciaItem }

function TConferenciaItem.GetItem: TItem;
var
  Repositorio   :TRepositorio;
  //Especificacao :TEspecificacaoItemPorCodigo;
begin
   Repositorio := nil;

   try

     if not Assigned(self.FItem) then begin
         Repositorio     := TFabricaRepositorio.GetRepositorio(TItem.ClassName);
         self.FItem      := (Repositorio.Get(self.Fcodigo_item) as TItem);
     end;

     result := self.FItem;

   finally
     FreeAndNil(Repositorio);
     //FreeAndNil(Especificacao);
   end;
end;

function TConferenciaItem.GetQTD_TOTAL: integer;
begin
  result := self.FQTD_RN + self.FQTD_P + self.FQTD_M + self.FQTD_G + self.FQTD_1 + self.FQTD_2 +
            self.FQTD_3  + self.FQTD_4 + self.FQTD_6 + self.FQTD_8 + self.FQTD_UNICA;
end;

procedure TConferenciaItem.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TConferenciaItem.Setcodigo_conferencia(const Value: integer);
begin
  Fcodigo_conferencia := Value;
end;

procedure TConferenciaItem.Setcodigo_item(const Value: integer);
begin
  Fcodigo_item := Value;
end;

procedure TConferenciaItem.SetNumero_caixa(const Value: integer);
begin
  FNumero_caixa := Value;
end;

procedure TConferenciaItem.SetQTD_1(const Value: integer);
begin
  FQTD_1 := Value;
end;

procedure TConferenciaItem.SetQTD_10(const Value: integer);
begin
  FQTD_10 := Value;
end;

procedure TConferenciaItem.SetQTD_12(const Value: integer);
begin
  FQTD_12 := Value;
end;

procedure TConferenciaItem.SetQTD_14(const Value: integer);
begin
  FQTD_14 := Value;
end;

procedure TConferenciaItem.SetQTD_2(const Value: integer);
begin
  FQTD_2 := Value;
end;

procedure TConferenciaItem.SetQTD_3(const Value: integer);
begin
  FQTD_3 := Value;
end;

procedure TConferenciaItem.SetQTD_4(const Value: integer);
begin
  FQTD_4 := Value;
end;

procedure TConferenciaItem.SetQTD_6(const Value: integer);
begin
  FQTD_6 := Value;
end;

procedure TConferenciaItem.SetQTD_8(const Value: integer);
begin
  FQTD_8 := Value;
end;

procedure TConferenciaItem.SetQTD_G(const Value: integer);
begin
  FQTD_G := Value;
end;

procedure TConferenciaItem.SetQTD_M(const Value: integer);
begin
  FQTD_M := Value;
end;

procedure TConferenciaItem.SetQTD_P(const Value: integer);
begin
  FQTD_P := Value;
end;

procedure TConferenciaItem.SetQTD_RN(const Value: integer);
begin
  FQTD_RN := Value;
end;

procedure TConferenciaItem.SetQTD_UNICA(const Value: integer);
begin
  FQTD_UNICA := Value;
end;

end.
