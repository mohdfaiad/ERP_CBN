unit CorFilha;

interface

uses
  SysUtils,
  Contnrs,
  Cor;

type
  TCorFilha = class

  private
    Fcodigo_cor_filha: integer;
    Fcodigo_cor_pai: integer;
    Fcodigo: integer;
    FCorPai   :TCor;
    FCorFilha :TCor;    
    
    procedure Setcodigo(const Value: integer);
    procedure Setcodigo_cor_filha(const Value: integer);
    procedure Setcodigo_cor_pai(const Value: integer);
    function getCorFilha: TCor;
    function getCorPai: TCor;

    function buscaCor(codigo_cor :integer):TCor;

  public
    property codigo           :integer read Fcodigo           write Setcodigo;
    property codigo_cor_pai   :integer read Fcodigo_cor_pai   write Setcodigo_cor_pai;
    property codigo_cor_filha :integer read Fcodigo_cor_filha write Setcodigo_cor_filha;
    property CorPai           :TCor    read getCorPai;
    property CorFilha         :TCor    read getCorFilha;

end;

implementation

uses Repositorio, fabricarepositorio;

{ TCorFilha }

function TCorFilha.buscaCor(codigo_cor: integer): TCor;
var
  Repositorio   :TRepositorio;
begin
  Repositorio    := nil;

  try
     Repositorio  := TFabricaRepositorio.GetRepositorio(TCor.ClassName);
     result       := TCor( Repositorio.Get(codigo_cor) );

  finally
    FreeAndNil(Repositorio);
  end;
end;

function TCorFilha.getCorFilha: TCor;
begin
  if assigned(self.FCorFilha) then exit;

  self.FCorFilha := buscaCor(self.Fcodigo_cor_filha);
  result         := self.FCorFilha;
end;

function TCorFilha.getCorPai: TCor;
begin
  if assigned(self.FCorPai) then exit;

  self.FCorPai := buscaCor(self.Fcodigo_cor_pai);
  result       := self.FCorPai;
end;

procedure TCorFilha.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TCorFilha.Setcodigo_cor_filha(const Value: integer);
begin
  Fcodigo_cor_filha := Value;
end;

procedure TCorFilha.Setcodigo_cor_pai(const Value: integer);
begin
  Fcodigo_cor_pai := Value;
end;

end.
