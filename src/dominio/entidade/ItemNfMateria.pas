unit ItemNfMateria;

interface

uses
  SysUtils,
  TipoOrigemMercadoria,
  Contnrs, pcnConversao, Materia, NaturezaOperacao;

type
  TItemNfMateria = class

  private
    FMateria :TMateria;
    Fcodigo: integer;
    Fcodigo_nota_fiscal: integer;
    Fcodigo_materia: integer;
    Fbase_sub: Real;
    Fper_pis: Real;
    Fper_cofins: Real;
    Fbase_pis: Real;
    Fper_sub: Real;
    Fper_ipi: Real;
    Fquantidade: Real;
    Fbase_icm: Real;
    Fbase_ipi: Real;
    Fper_icm: Real;
    Fbase_cofins: Real;
    Fvalor_unitario: Real;
    Funidade: String;
    Fclassificacao_fiscal: String;
    Forigem: TTipoOrigemMercadoria;
    Fvalor_outras_despesas: Real;
    Fvalor_frete: Real;
    Fvalor_desconto: Real;
    Fvalor_seguro: Real;
    Fvalor_bruto: Real;
    Fcsosn: String;
    Fcst: String;
    Fcfop: String;
    Fvalor_icm :Real;
    Fvalor_ipi :Real;
    Fvalor_pis :Real;
    Fvalor_cofins :Real;
    FNaturezaOperacao :TNaturezaOperacao;

    procedure Setbase_cofins(const Value: Real);
    procedure Setbase_icm(const Value: Real);
    procedure Setbase_ipi(const Value: Real);
    procedure Setbase_pis(const Value: Real);
    procedure Setbase_sub(const Value: Real);
    procedure Setclassificacao_fiscal(const Value: String);
    procedure Setcodigo(const Value: integer);
    procedure Setcodigo_materia(const Value: integer);
    procedure Setcodigo_nota_fiscal(const Value: integer);
    procedure Setper_cofins(const Value: Real);
    procedure Setper_icm(const Value: Real);
    procedure Setper_ipi(const Value: Real);
    procedure Setper_pis(const Value: Real);
    procedure Setper_sub(const Value: Real);
    procedure Setquantidade(const Value: Real);
    procedure Setunidade(const Value: String);
    procedure Setvalor_unitario(const Value: Real);
    procedure Setorigem(const Value: integer);
    procedure Setvalor_bruto(const Value: Real);
    procedure Setvalor_desconto(const Value: Real);
    procedure Setvalor_frete(const Value: Real);
    procedure Setvalor_outras_despesas(const Value: Real);
    procedure Setvalor_seguro(const Value: Real);
    procedure Setcsosn(const Value: String);
    procedure Setcst(const Value: String);
    procedure Setcfop(const Value: String);

    function GetOrigem: integer;
    function getMateria: TMateria;
    function getvalor_cofins: Real;
    function getvalor_icm: Real;
    function getvalor_ipi: Real;
    function getvalor_pis: Real;
    function getNaturezaOperacao: TNaturezaOperacao;
    function getValorLiquido: Real;

  public
    property Materia               :TMateria read getMateria;
    property codigo                :integer  read Fcodigo write Setcodigo;
    property codigo_nota_fiscal    :integer  read Fcodigo_nota_fiscal write Setcodigo_nota_fiscal;
    property codigo_materia        :integer  read Fcodigo_materia write Setcodigo_materia;
    property quantidade            :Real     read Fquantidade write Setquantidade;
    property unidade               :String   read Funidade write Setunidade;
    property classificacao_fiscal  :String   read Fclassificacao_fiscal write Setclassificacao_fiscal;
    property origem                :integer  read GetOrigem write Setorigem;
    property valor_unitario        :Real     read Fvalor_unitario write Setvalor_unitario;
    property valor_bruto           :Real     read Fvalor_bruto write Setvalor_bruto;
    property valor_frete           :Real     read Fvalor_frete write Setvalor_frete;
    property valor_seguro          :Real     read Fvalor_seguro write Setvalor_seguro;
    property valor_desconto        :Real     read Fvalor_desconto write Setvalor_desconto;
    property valor_outras_despesas :Real     read Fvalor_outras_despesas write Setvalor_outras_despesas;
    property per_icm               :Real     read Fper_icm write Setper_icm;
    property per_ipi               :Real     read Fper_ipi write Setper_ipi;
    property per_sub               :Real     read Fper_sub write Setper_sub;
    property per_pis               :Real     read Fper_pis write Setper_pis;
    property per_cofins            :Real     read Fper_cofins write Setper_cofins;
    property base_icm              :Real     read Fbase_icm write Setbase_icm;
    property base_ipi              :Real     read Fbase_ipi write Setbase_ipi;
    property base_sub              :Real     read Fbase_sub write Setbase_sub;
    property base_pis              :Real     read Fbase_pis write Setbase_pis;
    property base_cofins           :Real     read Fbase_cofins write Setbase_cofins;
    property cst                   :String   read FCst   write Setcst;
    property csosn                 :String   read Fcsosn write Setcsosn;
    property cfop                  :String   read Fcfop write Setcfop;
    property valor_icm             :Real     read getvalor_icm;
    property valor_ipi             :Real     read getvalor_ipi;
    property valor_pis             :Real     read getvalor_pis;
    property valor_cofins          :Real     read getvalor_cofins;
    property valor_liquido         :Real     read getValorLiquido;

    property NaturezaOperacao      :TNaturezaOperacao read getNaturezaOperacao;

  public
    function getCstEnumeradoToString(cst :TpcnCSTIcms) :String;
    function getCsosnEnumeradoToString(csosn :TpcnCSOSNIcms) :String;
end;

implementation

uses Repositorio, FabricaRepositorio, EspecificacaoNaturezaComCFOPIgualA, Funcoes, math;

{ TItemNfMateria }

function TItemNfMateria.getCsosnEnumeradoToString(
  csosn: TpcnCSOSNIcms): String;
begin
  result := EnumeradoToStr(csosn, ['', '101' ,'102', '103', '201', '202', '203', '300', '400', '500', '900'],
                                [csosnVazio, csosn101, csosn102, csosn103, csosn201, csosn202, csosn203, csosn300, csosn400, csosn500,csosn900]);
end;

function TItemNfMateria.getCstEnumeradoToString(cst: TpcnCSTIcms): String;
begin
  result := EnumeradoToStr(cst, ['00' , '10' , '20' , '30' , '40' , '41' , '50' , '51' , '60' , '70' , '80' , '81', '90', '10', '90', '41', '90', 'SN'],
                                [cst00, cst10, cst20, cst30, cst40, cst41, cst50, cst51, cst60, cst70, cst80, cst81, cst90, cstPart10 , cstPart90 , cstRep41, cstICMSOutraUF, cstICMSSN]);
end;

function TItemNfMateria.getMateria: TMateria;
var
  Repositorio :TRepositorio;
begin
   Repositorio := nil;
   Result      := nil;

   if not Assigned(self.FMateria) then begin
     try
       Repositorio := TFabricaRepositorio.GetRepositorio(TMateria.ClassName);
       FMateria    := (Repositorio.Get(self.Fcodigo_materia) as TMateria);
       
     finally
       FreeAndNil(Repositorio);
     end;
   end;

   result := self.FMateria;
   
end;

function TItemNfMateria.getNaturezaOperacao: TNaturezaOperacao;
var Especificacao :TEspecificacaoNaturezaComCFOPIgualA;
    repositorio   :TRepositorio;
begin
  repositorio   := nil;
  Especificacao := nil;
  try

    if not Assigned(FNaturezaOperacao) then begin
      repositorio       := TFabricaRepositorio.GetRepositorio(TNaturezaOperacao.ClassName);
      Especificacao     := TEspecificacaoNaturezaComCFOPIgualA.Create(self.cfop);
      FNaturezaOperacao := TNaturezaOperacao( repositorio.GetPorEspecificacao( Especificacao ) );
    end;

    result := FNaturezaOperacao;
  Finally
    FreeAndNil(repositorio);
    FreeAndNil(Especificacao);
  end;
end;

function TItemNfMateria.GetOrigem: integer;
begin
  Result := TTipoOrigemMercadoriaUtilitario.DeEnumeradoParaInteger(Forigem)
end;

function TItemNfMateria.getValorLiquido: Real;
begin
  result := 0;
  result := Fvalor_bruto + Fvalor_frete + Fvalor_seguro + Fvalor_outras_despesas - Fvalor_desconto +
            IfThen(Fbase_ipi > 0, Fper_ipi * Fbase_ipi / 100, 0);
end;

function TItemNfMateria.getvalor_cofins: Real;
begin
  result             := 0;
  self.Fvalor_cofins := result;

  if self.Fper_cofins = 0 then exit;

  result             := arredonda((self.Fper_cofins * self.base_cofins) / 100);
  self.Fvalor_cofins := result;
end;

function TItemNfMateria.getvalor_icm: Real;
begin
  result          := 0;
  self.Fvalor_icm := result;

  if self.Fper_icm = 0 then exit;

  result          := arredonda((self.Fper_icm * self.base_icm) / 100);

  self.Fvalor_icm := result;
end;

function TItemNfMateria.getvalor_ipi: Real;
begin
  result          := 0;
  self.Fvalor_ipi := result;

  if self.Fper_ipi = 0 then exit;

  result          := arredonda((self.Fper_ipi * self.base_ipi) / 100);

  self.Fvalor_ipi := result;
end;

function TItemNfMateria.getvalor_pis: Real;
begin
  result          := 0;
  self.Fvalor_pis := result;

  if self.Fper_pis = 0 then exit;

  result          := Arredonda((self.Fper_pis * self.base_pis) / 100);
  self.Fvalor_pis := result;
end;

procedure TItemNfMateria.Setbase_cofins(const Value: Real);
begin
  Fbase_cofins := Value;
end;

procedure TItemNfMateria.Setbase_icm(const Value: Real);
begin
  Fbase_icm := Value;
end;

procedure TItemNfMateria.Setbase_ipi(const Value: Real);
begin
  Fbase_ipi := Value;
end;

procedure TItemNfMateria.Setbase_pis(const Value: Real);
begin
  Fbase_pis := Value;
end;

procedure TItemNfMateria.Setbase_sub(const Value: Real);
begin
  Fbase_sub := Value;
end;

procedure TItemNfMateria.Setcfop(const Value: String);
begin
  Fcfop := Value;
end;

procedure TItemNfMateria.Setclassificacao_fiscal(const Value: String);
begin
  Fclassificacao_fiscal := Value;
end;

procedure TItemNfMateria.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TItemNfMateria.Setcodigo_materia(const Value: integer);
begin
  Fcodigo_materia := Value;
end;

procedure TItemNfMateria.Setcodigo_nota_fiscal(const Value: integer);
begin
  Fcodigo_nota_fiscal := Value;
end;

procedure TItemNfMateria.Setcsosn(const Value: String);
begin
  Fcsosn := Value;
end;

procedure TItemNfMateria.Setcst(const Value: String);
begin
  Fcst := Value;
end;

procedure TItemNfMateria.Setorigem(const Value: integer);
begin
  Forigem := TTipoOrigemMercadoriaUtilitario.DeIntegerParaEnumerado(Value);
end;

procedure TItemNfMateria.Setper_cofins(const Value: Real);
begin
  Fper_cofins := Value;
end;

procedure TItemNfMateria.Setper_icm(const Value: Real);
begin
  Fper_icm := Value;
end;

procedure TItemNfMateria.Setper_ipi(const Value: Real);
begin
  Fper_ipi := Value;
end;

procedure TItemNfMateria.Setper_pis(const Value: Real);
begin
  Fper_pis := Value;
end;

procedure TItemNfMateria.Setper_sub(const Value: Real);
begin
  Fper_sub := Value;
end;

procedure TItemNfMateria.Setquantidade(const Value: Real);
begin
  Fquantidade := Value;
end;

procedure TItemNfMateria.Setunidade(const Value: String);
begin
  Funidade := Value;
end;

procedure TItemNfMateria.Setvalor_bruto(const Value: Real);
begin
  Fvalor_bruto := Value;
end;

procedure TItemNfMateria.Setvalor_desconto(const Value: Real);
begin
  Fvalor_desconto := Value;
end;

procedure TItemNfMateria.Setvalor_frete(const Value: Real);
begin
  Fvalor_frete := Value;
end;

procedure TItemNfMateria.Setvalor_outras_despesas(const Value: Real);
begin
  Fvalor_outras_despesas := Value;
end;

procedure TItemNfMateria.Setvalor_seguro(const Value: Real);
begin
  Fvalor_seguro := Value;
end;

procedure TItemNfMateria.Setvalor_unitario(const Value: Real);
begin
  Fvalor_unitario := Value;
end;

end.
