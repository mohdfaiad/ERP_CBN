unit frameBuscaOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, RxToolEdit, RxCurrEdit, OrdemServico;

type
  TBuscaOS = class(TFrame)
    StaticText1: TStaticText;
    edtNumeroOS: TCurrencyEdit;
    btnBusca: TBitBtn;
    edtCodigo: TCurrencyEdit;
    procedure btnBuscaClick(Sender: TObject);
    procedure edtNumeroOSExit(Sender: TObject);
    procedure edtNumeroOSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FOrdemServico :TOrdemServico;
    FcodigoOS     :integer;
    FExcluiImpressas: Boolean;

  private
    procedure SetCodigoOS(const Value: integer);

  private
    procedure Buscar(const pCodigoOS :Integer);

  public
    procedure Clear;

  public
    property OrdemServico :TOrdemServico read FOrdemServico;
    property codigoOS     :integer       read FcodigoOS      write SetCodigoOS;
    property ExcluiImpressas :Boolean    read FExcluiImpressas write FExcluiImpressas;
  end;

implementation

uses FabricaRepositorio, repositorio, uPesquisaSimples, funcoes, uPadrao;

{$R *.dfm}

{ TBuscaOS }

procedure TBuscaOS.btnBuscaClick(Sender: TObject);
var condicaoImpressas :String;
begin
  if FExcluiImpressas then
    condicaoImpressas := ' Where not(os.impresso = ''S'') ';

  frmPesquisaSimples := TFrmPesquisaSimples.Create(Self,'select os.numero, pro.referencia REFPRO, cor.referencia REFCOR, tam.descricao tamanhos,  os.quantidade  from ordem_servico os '+
                                                        ' inner join produtos pro on pro.codigo = os.codigo_produto '+
                                                        ' inner join cores    cor on cor.codigo = os.codigo_cor     '+
                                                        ' inner join tamanhos tam on tam.codigo = os.codigo_tamanho'+
                                                        condicaoImpressas,
                                                        'NUMERO', 'Selecione a O.S. desejada...');

  if frmPesquisaSimples.ShowModal = mrOk then
    Buscar( strToIntDef(campo_por_campo('ORDEM_SERVICO','CODIGO','NUMERO',frmPesquisaSimples.cds_retorno.Fields[0].AsString),0));

  frmPesquisaSimples.Release;
end;

procedure TBuscaOS.Buscar(const pCodigoOS: Integer);
var
  Repositorio :TRepositorio;
begin
   Repositorio := nil;

   try
     Repositorio    := TFabricaRepositorio.GetRepositorio(TOrdemServico.ClassName);
     FOrdemServico  := TOrdemServico(Repositorio.Get(pCodigoOS));

     if ((FExcluiImpressas) and (FOrdemServico.impresso)) then
       frmPadrao.avisar('Ordem de serviço Nº'+IntToStr(FOrdemServico.numero)+' já foi impressa.');

     if Assigned(FOrdemServico) and ((FExcluiImpressas) and not(FOrdemServico.impresso)) then begin
       edtCodigo.AsInteger   := pCodigoOS;
       edtNumeroOS.AsInteger := FOrdemServico.numero;
       keybd_event(VK_TAB,0,0,0);
     end
     else
       self.Clear;

   finally
     FreeAndNil(Repositorio);
   end;
end;

procedure TBuscaOS.Clear;
begin
  if assigned(FOrdemServico) then
    FreeAndNil(FOrdemServico);
  edtCodigo.Clear;
  edtNumeroOS.Clear;
end;

procedure TBuscaOS.edtNumeroOSExit(Sender: TObject);
begin
  if edtNumeroOS.AsInteger > 0 then
    Buscar( strToIntDef(campo_por_campo('ORDEM_SERVICO','CODIGO','NUMERO',edtNumeroOS.Text),0));
end;

procedure TBuscaOS.edtNumeroOSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    if edtNumeroOS.AsInteger > 0 then
      Buscar( strToIntDef(campo_por_campo('ORDEM_SERVICO','CODIGO','NUMERO',edtNumeroOS.Text),0))
    else
      btnBusca.Click;
end;

procedure TBuscaOS.SetCodigoOS(const Value: integer);
begin
  if value > 0 then
    self.Buscar( Value )
  else
    self.Clear;
end;

end.
