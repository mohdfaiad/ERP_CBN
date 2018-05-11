unit frameBuscaNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask, RxToolEdit, RxCurrEdit, ObjetoGenerico, NotaFiscal,
  ExtCtrls;

type
  TBuscaNotaFiscal = class(TFrame)
    StaticText1: TStaticText;
    edtNrNota: TCurrencyEdit;
    btnBusca: TBitBtn;
    rgStatus: TRadioGroup;
    rgTipo: TRadioGroup;
    procedure edtNrNotaExit(Sender: TObject);
    procedure edtNrNotaKeyPress(Sender: TObject; var Key: Char);
    procedure btnBuscaClick(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);

  private
    NF                :TObjetoGenerico;
    condicao_filtro   :String;
    condicao_filtro2  :String;

    FcodNotaFiscal    : Integer;
    FNumeroNotaFiscal : String;
    FID               : String;
    FDestinatario     : String;
    FCodigo_empresa   :String;
    FNotaFiscal       :TNotaFiscal;
    FSemContaAssociada :Boolean;
    FEntradaSaida     :String;

    FAposAlterarFormaPagamento :TNotifyEvent;

    procedure SetNumeroNotaFiscal(const Value: String);

    procedure buscaNotaFiscal(codigo :integer);
    function GetNotaFiscal: TNotaFiscal;
    procedure SetCodNotaFiscal(const Value: Integer);

  public

     procedure limpa;

     property NumeroNotaFiscal :String  read FNumeroNotaFiscal write SetNumeroNotaFiscal;
     property codNotaFiscal    :Integer read FcodNotaFiscal write SetCodNotaFiscal;
     property ID               :String  read FID;
     property Destinatario     :String  read FDestinatario;
     property codigo_empresa   :String  read FCodigo_empresa write FCodigo_empresa;
     property NotaFiscal       :TNotaFiscal read GetNotaFiscal;
     property SemContaAssociada :Boolean read FSemContaAssociada write  FSemContaAssociada;
     property EntradaSaida     :String read FEntradaSaida write FEntradaSaida;
  end;

implementation

uses uPesquisaSimples, DB, repositorio, fabricaRepositorio, uModulo, uPAdrao;

{$R *.dfm}

{ TBuscaNotaFiscal }

procedure TBuscaNotaFiscal.buscaNotaFiscal(codigo: integer);
var
  campoRetorno, condicao_empresa, condicao_contas, condicao_entradaSaida :String;
begin
  campoRetorno := 'codigo'; //campo que deseja que retorne

  if FCodigo_empresa <> '' then
    condicao_empresa := ' and (iif(nf.entrada_saida = ''E'', nf.codigo_destinatario, nf.codigo_emitente) = '+FCodigo_empresa+') ';

  if FSemContaAssociada then
    condicao_contas := ' and cp.codigo is null ';

  if FEntradaSaida <> '' then
    condicao_entradaSaida := ' and nf.entrada_saida = '''+FEntradaSaida+''' ';

  if NF = nil then
    NF := TObjetoGenerico.Create;

  NF.SQL := 'Select first 1 nf.codigo, nf.numero_nota_fiscal, p.razao destinatario, nfe.chave_acesso '+
            'from notas_fiscais nf                                                                   '+
            ' left join pessoas           p    on p.codigo = nf.codigo_destinatario                  '+
            ' left join notas_fiscais_nfe nfe  on nfe.codigo_nota_fiscal = nf.codigo                 '+
            ' left join contas_pagar cp on cp.codigo_nf = nf.codigo                                  '+
            'where nf.'+campoRetorno+'='+ intToStr(codigo) + condicao_empresa + condicao_contas + condicao_entradaSaida;


  if not NF.BuscaVazia then begin
    edtNrNota.AsInteger    := NF.getCampo('numero_nota_fiscal').AsInteger;
    self.FNumeroNotaFiscal := NF.getCampo('numero_nota_fiscal').AsString;
    self.FcodNotaFiscal    := NF.getCampo('codigo').AsInteger;
    self.FID               := NF.getCampo('chave_acesso').AsString;
    self.FDestinatario     := NF.getCampo('Destinatario').AsString;

    keybd_event(VK_TAB, 0, 0, 0);
  end
  else
    limpa;

  FreeAndNil(NF);
end;

procedure TBuscaNotaFiscal.limpa;
begin
  edtNrNota.Clear;
  self.FNumeroNotaFiscal := '';
  self.FcodNotaFiscal    := 0;
  self.FID               := '';
  self.FDestinatario     := '';

  if assigned(FNotaFiscal) then
    FreeAndNil(FNotaFiscal);
end;

procedure TBuscaNotaFiscal.SetNumeroNotaFiscal(const Value: String);
begin
  FNumeroNotaFiscal := Value;
end;

procedure TBuscaNotaFiscal.edtNrNotaExit(Sender: TObject);
var condicao_entradaSaida :String;
begin

  if FEntradaSaida <> '' then
    condicao_entradaSaida := ' and nf.entrada_saida = '''+FEntradaSaida+''' ';

  if edtNrNota.AsInteger > 0 then
  begin
    dm.qryGenerica2.Close;
    dm.qryGenerica2.SQL.Text := 'SELECT NF.CODIGO FROM NOTAS_FISCAIS NF  '+
                                ' WHERE NF.NUMERO_NOTA_FISCAL = '+ intToStr(edtNrNota.AsInteger)+ condicao_entradaSaida;
    dm.qryGenerica2.Open();

    if dm.qryGenerica2.RecordCount > 1 then
    begin
      TFrmPadrao(self.Parent).avisar('Mais de um registro foi encontrado com esse identificador, favor seleciona-lo na lista de busca.');
      btnBuscaClick(nil);
    end
    else
      buscaNotaFiscal(dm.qryGenerica2.Fields[0].AsInteger);
  end
  else
    limpa;
end;

procedure TBuscaNotaFiscal.edtNrNotaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    if edtNrNota.AsInteger <= 0 then
      btnBusca.Click;
end;

procedure TBuscaNotaFiscal.btnBuscaClick(Sender: TObject);
var campoRetorno, condicao_empresa, condicao_contas, condicao_entradaSaida  :String;
begin
  campoRetorno := 'codigo';

  if FCodigo_empresa <> '' then
    condicao_empresa := ' and (iif(nf.entrada_saida = ''E'', nf.codigo_destinatario, nf.codigo_emitente) = '+FCodigo_empresa+') ';

  if FSemContaAssociada then
    condicao_contas := ' and cp.codigo is null ';

  if FEntradaSaida <> '' then
    condicao_entradaSaida := ' and nf.entrada_saida = '''+FEntradaSaida+''' ';

  frmPesquisaSimples := TFrmPesquisaSimples.Create(Self,'Select nf.numero_nota_fiscal, p.razao destinatario, tnf.valor_total, nf.codigo '+
                                                        'from notas_fiscais nf                                                          '+
                                                        ' left join pessoas                   p   on p.codigo = nf.codigo_destinatario  '+
                                                        ' left join notas_fiscais_nfe_retorno nfr on nfr.codigo_nota_fiscal = nf.codigo '+
                                                        ' left join contas_pagar cp on cp.codigo_nf = nf.codigo                         '+
                                                        ' left join totais_notas_fiscais tnf on tnf.codigo_nota_fiscal = nf.codigo      '+
                                                        'where 1=1 '+condicao_filtro+condicao_empresa+condicao_contas+condicao_entradaSaida+
                                                        ' order by 1 ', campoRetorno, 'Selecione a Nota Fiscal desejada...', 700, 500);

  if frmPesquisaSimples.ShowModal = mrOk then
    buscaNotaFiscal(frmPesquisaSimples.cds_retorno.Fields[0].AsInteger);

  frmPesquisaSimples.Release;
end;

procedure TBuscaNotaFiscal.FrameEnter(Sender: TObject);
begin
  rgStatusClick(nil);
  rgTipoClick(nil);
end;

procedure TBuscaNotaFiscal.rgStatusClick(Sender: TObject);
begin
  if rgStatus.ItemIndex = 0 then
    condicao_filtro := ' and nfr.status = ''100'' '
  else
    condicao_filtro := ' ';
end;

procedure TBuscaNotaFiscal.rgTipoClick(Sender: TObject);
begin
  if rgTipo.ItemIndex = 0 then
    condicao_filtro2 := ' and nf.entrada_saida = ''E'' '
  else if rgTipo.ItemIndex = 1 then
    condicao_filtro2 := ' and (nf.entrada_saida <> ''E'') or (nf.entrada_saida is null) '
  else
    condicao_filtro2 := ' ';
end;

function TBuscaNotaFiscal.GetNotaFiscal: TNotaFiscal;
var
  repositorio :TRepositorio;
begin
 try
   if not assigned(FNotaFiscal) then
   begin
     repositorio := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);
     FNotaFiscal := TNotaFiscal( repositorio.Get(self.FcodNotaFiscal) );
   end;

   result := FNotaFiscal;

 finally
   FreeAndNil(repositorio);
 end;
end;

procedure TBuscaNotaFiscal.SetCodNotaFiscal(const Value: Integer);
begin
  FcodNotaFiscal := Value;
end;

end.
