unit uLancamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, DB, DBClient, StdCtrls, Grids, DBGrids,
  DBGridCBN, ComCtrls, Buttons, ExtCtrls, contnrs, Mask, RxToolEdit, RxCurrEdit;

type
  TfrmLancamentos = class(TfrmCadastroPadrao)
    cdsCODIGO: TFloatField;
    cdsVALOR: TFloatField;
    cdsOBSERVACAO: TStringField;
    cdsVALOR_PAGO: TFloatField;
    cdsVALOR_TOTAL: TFloatField;
    edtCodigo: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    memDescricao: TMemo;
    edtTotalLancamento: TCurrencyEdit;
    dtpDataVencimento: TDateTimePicker;
    dtpDataCadastro: TDateTimePicker;
    gpbValores: TGroupBox;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtValor: TCurrencyEdit;
    edtValorAcertado: TCurrencyEdit;
    edtValorPendente: TCurrencyEdit;
    cbTipo: TComboBox;
  private
    { Altera um registro existente no CDS de consulta }
    procedure AlterarRegistroNoCDS(Registro :TObject); override;

    { Carrega todos os registros pra aba de Consulta }
    procedure CarregarDados;                           override;

    procedure ExecutarDepoisAlterar;                   override;
    procedure ExecutarDepoisIncluir;                   override;

    { Inclui um registro no CDS }
    procedure IncluirRegistroNoCDS(Registro :TObject); override;

    { Limpa as informações da aba Dados }
    procedure LimparDados;                             override;

    { Mostra um registro detalhado na aba de Dados   }
    procedure MostrarDados;                            override;

  private
    { Persiste os dados no banco de dados }
    function GravarDados   :TObject;                   override;

    { Verifica os dados antes de persistir }
    function VerificaDados :Boolean;                   override;
  end;

var
  frmLancamentos: TfrmLancamentos;

implementation

uses Lancamento, FabricaRepositorio, Repositorio, Especificacao, TipoLancamento, Math;

{$R *.dfm}

{ TfrmCadastroPadrao1 }

procedure TfrmLancamentos.AlterarRegistroNoCDS(Registro: TObject);
var
  Lancamento :TLancamento;
begin
  inherited;

  Lancamento := (Registro as TLancamento);

  self.cds.Edit;
  self.cdsCODIGO.AsFloat        := Lancamento.Codigo;
  self.cdsVALOR.AsFloat         := Lancamento.valor_total;
  self.cdsOBSERVACAO.AsString   := Lancamento.descricao;
  self.cdsVALOR_PAGO.AsFloat    := Lancamento.valor_pago;
  self.cdsVALOR_TOTAL.AsFloat   := Lancamento.valor_total;
  self.cds.Post;
end;

procedure TfrmLancamentos.CarregarDados;
var
  Lancamentos    :TObjectList;
  Repositorio    :TRepositorio;
  nX             :Integer;
  Especificacao  :TEspecificacao;
  tipoLancamento :TTipoLancamento;
begin
  inherited;

  Repositorio    := nil;
  Lancamentos    := nil;
  Especificacao  := nil;

  try

       {  if rgTipos.ItemIndex = 0 then   tipoLancamento := tPagar
    else if rgTipos.ItemIndex = 1 then   tipoLancamento := tReceber
    else if rgTipos.ItemIndex = 2 then   tipoLancamento := tTodas;  }

    Repositorio    := TFabricaRepositorio.GetRepositorio(TLancamento.ClassName);
    //especificacao  := TEspecificacaoLancamentosPeriodoTipo.Create(dtpInicio.Date, dtpFim.Date, tipoLancamento);
    //Lancamentos    := Repositorio.GetListaPorEspecificacao(Especificacao);
    Lancamentos    := Repositorio.GetAll;

    if Assigned(Lancamentos) and (Lancamentos.Count > 0) then begin

       for nX := 0 to (Lancamentos.Count-1) do
         self.IncluirRegistroNoCDS(Lancamentos.Items[nX]);

    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Lancamentos);
  end;
end;

procedure TfrmLancamentos.ExecutarDepoisAlterar;
begin
  inherited;
  edtValor.SetFocus;
end;

procedure TfrmLancamentos.ExecutarDepoisIncluir;
begin
  inherited;
  edtTotalLancamento.SetFocus;
end;

function TfrmLancamentos.GravarDados: TObject;
var
  Lancamento               :TLancamento;
  RepositorioLancamento    :TRepositorio;
begin
   Lancamento         := nil;

   RepositorioLancamento   := nil;

   try
     RepositorioLancamento := TFabricaRepositorio.GetRepositorio(TLancamento.ClassName);
     Lancamento            := TLancamento(RepositorioLancamento.Get(self.edtCodigo.AsInteger));

     if not Assigned(Lancamento) then
      Lancamento := TLancamento.Create;

     Lancamento.valor_total          := edtTotalLancamento.Value;
     Lancamento.valor_pago           := edtValorAcertado.Value + edtValor.Value;
     Lancamento.data_vencimento      := dtpDataVencimento.Date;
     Lancamento.data_cadastro        := dtpDataCadastro.Date;
     Lancamento.descricao            := memDescricao.Text;
     Lancamento.tipo                 := TTipoLancamentoUtilitario.DeStringParaEnumerado( copy(cbTipo.Text,3,1) );

     RepositorioLancamento.Salvar(Lancamento);

     result := Lancamento;

   finally
     FreeAndNil(RepositorioLancamento);
   end;
end;

procedure TfrmLancamentos.IncluirRegistroNoCDS(Registro: TObject);
var
  Lancamento :TLancamento;
begin
  inherited;

  Lancamento := (Registro as TLancamento);

  self.cds.Append;
  self.cdsCODIGO.AsFloat        := Lancamento.Codigo;
  self.cdsVALOR.AsFloat         := Lancamento.valor_total;
  self.cdsOBSERVACAO.AsString   := Lancamento.descricao;
  self.cdsVALOR_PAGO.AsFloat    := Lancamento.valor_pago;
  self.cdsVALOR_TOTAL.AsFloat   := Lancamento.valor_total;
  self.cds.Post;
end;

procedure TfrmLancamentos.LimparDados;
begin
  inherited;
  edtTotalLancamento.Clear;
  edtValor.Clear;
  edtValorAcertado.Clear;
  edtValorPendente.Clear;
  edtCodigo.Clear;
  memDescricao.Clear;
  dtpDataVencimento.Date   := Date -1;
  dtpDataCadastro.DateTime := Date;
  cbTipo.ItemIndex := 0;
end;

procedure TfrmLancamentos.MostrarDados;
var
  Lancamento                       :TLancamento;
  RepositorioLancamento            :TRepositorio;
begin
  inherited;

  Lancamento                          := nil;
  RepositorioLancamento               := nil;

  try
    RepositorioLancamento     := TFabricaRepositorio.GetRepositorio(TLancamento.ClassName);

    Lancamento                := TLancamento(RepositorioLancamento.Get(self.cdsCODIGO.AsInteger));

    if not Assigned(Lancamento) then exit;

    self.edtCodigo.Value            := Lancamento.Codigo;
    self.edtTotalLancamento.Value   := Lancamento.valor_total;
    self.edtValorAcertado.Value     := Lancamento.valor_pago;
    self.dtpDataVencimento.Date     := Lancamento.data_vencimento;
    self.dtpDataCadastro.Date       := Lancamento.data_cadastro;
    self.cbTipo.ItemIndex           := IfThen( Lancamento.tipo = tPagar, 1, 2);

    self.edtValorPendente.Value     := (Lancamento.valor_total - Lancamento.valor_pago);
    self.edtValor.MaxValue          := self.edtValorPendente.Value;
    self.edtValor.Value             := self.edtValorPendente.Value;

  finally
    FreeAndNil(RepositorioLancamento);
    FreeAndNil(Lancamento);
  end;
end;

function TfrmLancamentos.VerificaDados: Boolean;
begin
  result := false;

  if edtTotalLancamento.Value <= 0 then begin
    avisar('Favor informar o valor do lançamento');
    edtTotalLancamento.SetFocus;
  end
  else if self.dtpDataVencimento.Date < Date then begin
    avisar('Favor informar a data de vencimento do lançamento');
    self.dtpDataVencimento.SetFocus;
  end
  else if trim(self.memDescricao.Text) = '' then begin
    avisar('Favor informar uma descrição para o lançamento');
    self.memDescricao.SetFocus;
  end
  else if cbTipo.ItemIndex = 0 then begin
    avisar('Favor informar o Tipo do lançamento');
    self.cbTipo.SetFocus;
  end
  else
    result := true;

end;

end.
 