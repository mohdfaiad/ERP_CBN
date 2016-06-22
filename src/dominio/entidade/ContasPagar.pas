unit ContasPagar;

interface

uses SysUtils, Contnrs, NotaFiscal;

type
  TContasPagar = class

  private
    Fcodigo :Integer;
    Fcodigo_nf :Integer;
    Fdt_documento :TDateTime;
    Fdt_lancamento :TDateTime;
    Fnum_documento :Integer;
    Fcod_fornecedor :Integer;
    Fstatus :String;
    Fdesc_status :String;
    Fvalor :Real;
    Fobservacao :String;
    FItensConta :TObjectList;
    FParcelas :TObjectList;
    FNotaFiscal :TNotaFiscal;
    FCodContaBanco: integer;

    function GetItensConta: TObjectList;
    function GetParcelasConta: TObjectList;
    function GetNotaFiscal: TNotaFiscal;

  public
    property codigo                :Integer read Fcodigo                write Fcodigo;
    property codigo_nf             :Integer read Fcodigo_nf             write Fcodigo_nf;
    property dt_documento          :TDateTime read Fdt_documento          write Fdt_documento;
    property dt_lancamento         :TDateTime read Fdt_lancamento         write Fdt_lancamento;
    property num_documento         :Integer read Fnum_documento         write Fnum_documento;
    property cod_fornecedor        :Integer read Fcod_fornecedor        write Fcod_fornecedor;
    property status                :String read Fstatus                write Fstatus;
    property desc_status           :String read Fdesc_status           write Fdesc_status;
    property valor                 :Real read Fvalor                 write Fvalor;
    property observacao            :String read Fobservacao            write Fobservacao;
    property codContaBanco         :integer read FCodContaBanco        write FCodContaBanco;

    property NotaFiscal            :TNotaFiscal read GetNotaFiscal;
    property ItensConta            :TObjectList read GetItensConta;
    property Parcelas              :TObjectList read GetParcelasConta;
end;

implementation

uses
  Repositorio, FabricaRepositorio, EspecificacaoItensDaConta, EspecificacaoParcelasDaConta, ItemConta, Parcela;

{ TContasPagar }

function TContasPagar.GetItensConta: TObjectList;
var
  Repositorio   :TRepositorio;
  Especificacao :TEspecificacaoItensDaConta;
begin
   Repositorio    := nil;
   Especificacao  := nil;
                                  // se tiver codigo_nf busca os itens da nota
   try
      if not Assigned(self.FItensConta) then begin
        Especificacao      := TEspecificacaoItensDaConta.Create(self);
        Repositorio        := TFabricaRepositorio.GetRepositorio(TItemConta.ClassName);
        self.FItensConta   := Repositorio.GetListaPorEspecificacao(Especificacao, IntToStr(self.Codigo));
      end;

      result := self.FItensConta;
   finally
     FreeAndNil(Especificacao);
     FreeAndNil(Repositorio);
   end;
end;

function TContasPagar.GetNotaFiscal: TNotaFiscal;
var
  Repositorio   :TRepositorio;
begin
   Repositorio    := nil;

   if self.Fcodigo_nf <= 0 then
     Exit;

   try
      if not Assigned(self.FNotaFiscal) then begin
        Repositorio        := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);
        self.FNotaFiscal   := TNotaFiscal( Repositorio.Get( self.codigo_nf ));
      end;

      result := self.FNotaFiscal;
   finally
     FreeAndNil(Repositorio);
   end;
end;

function TContasPagar.GetParcelasConta: TObjectList;
var
  Repositorio   :TRepositorio;
  Especificacao :TEspecificacaoParcelasDaConta;
begin
   Repositorio    := nil;
   Especificacao  := nil;

   try
      if not Assigned(self.FParcelas) then begin
        Especificacao      := TEspecificacaoParcelasDaConta.Create(self);
        Repositorio        := TFabricaRepositorio.GetRepositorio(TParcela.ClassName);
        self.FParcelas     := Repositorio.GetListaPorEspecificacao(Especificacao, IntToStr(self.Codigo));
      end;

      result := self.FParcelas;
   finally
     FreeAndNil(Especificacao);
     FreeAndNil(Repositorio);
   end;
end;

end.
