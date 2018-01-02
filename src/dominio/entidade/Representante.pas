unit Representante;

interface

uses Pessoa, DadosRepresentante, System.SysUtils;

type
  TRepresentante = class(TPessoa)
  private
    FDadosDoRepresentante :TDadosRepresentante;

    function GetDadosRepresentante: TDadosRepresentante;
  public

    property DadosRepresentante :TDadosRepresentante read GetDadosRepresentante     write FDadosDoRepresentante;
  end;

implementation

uses Repositorio, FabricaRepositorio, EspecificacaoDadosRepresentantePorCodPessoa;

{ TRepresentante }

function TRepresentante.GetDadosRepresentante: TDadosRepresentante;
var
  Repositorio   :TRepositorio;
  Especificacao :TEspecificacaoDadosRepresentantePorCodPessoa;
begin
   if not Assigned(self.FDadosDoRepresentante) then begin
     Repositorio   := nil;

     try
       Repositorio                := TFabricaRepositorio.GetRepositorio(TDadosRepresentante.ClassName);
       Especificacao              := TEspecificacaoDadosRepresentantePorCodPessoa.Create(self.Codigo);
       self.FDadosDoRepresentante := (Repositorio.GetPorEspecificacao(Especificacao) as TDadosRepresentante);
     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FDadosDoRepresentante;
end;

end.
