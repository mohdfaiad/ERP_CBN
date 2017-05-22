unit uMonitorControleNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, ComCtrls, Grids, DBGrids, DBGridCBN, Buttons,
  DB, DBClient, Contnrs, Menus, ExtCtrls, EspecificacaoNotaFiscalPorPeriodoEStatus,
  NotaFiscal, fileCtrl, ImgList, pngimage, ComObj, System.ImageList;

type
  TfrmMonitorControleNFe = class(TfrmPadrao)
    gbAcoes: TGroupBox;
    grid: TDBGridCBN;
    btnEnviar: TBitBtn;
    btnCancelar: TBitBtn;
    cds: TClientDataSet;
    cdsCODIGO: TIntegerField;
    cdsSERIE: TStringField;
    cdsEMITENTE: TStringField;
    cdsDESTINATARIO: TStringField;
    cdsDATA_EMISSAO: TDateTimeField;

    cdsCHAVE_NFE: TStringField;
    ds: TDataSource;
    cdsSTATUS: TIntegerField;
    pmnuOpcoesNF: TPopupMenu;
    mnuAlterarNotaFiscal: TMenuItem;
    pnlTopo: TPanel;
    gbFiltros: TGroupBox;
    gbFiltroPeriodo: TGroupBox;
    lblFiltroDataFinal: TLabel;
    lblFiltroDataInicial: TLabel;
    dtpFiltroDataFinal: TDateTimePicker;
    dtpFiltroDataInicial: TDateTimePicker;
    btnAtualizar: TBitBtn;
    gbFiltroStatus: TGroupBox;
    gbQuantidadeSelecionada: TGroupBox;
    lblQuantidadeSelecionadaAutorizada: TLabel;
    lblQuantidadeSelecionadCancelada: TLabel;
    lblQuantidadeSelecionadaRejeitada: TLabel;
    lblQuantidadeSelecionadaAguardandoEnvio: TLabel;
    lblAjudaEspacoSelecionar: TLabel;
    cdsSTATUS_STR: TStringField;
    cdsMOTIVO: TStringField;
    btnImprimirDANFE: TBitBtn;
    btnEnviarEmails: TBitBtn;
    lblCheckBoxRejeitada: TLabel;
    lblCheckBoxAutorizada: TLabel;
    lblCheckBoxCancelada: TLabel;
    cdsXML: TStringField;
    btnGerarArqXML: TBitBtn;
    lblCheckBoxAguardandoEnvio: TLabel;
    btnImprimirEtiquetaCaixas: TBitBtn;
    cdsPEDIDOS: TStringField;
    pmnuOpcoesNFEnviadas: TPopupMenu;
    mnuCopiarChaveParaAreaTransferencia: TMenuItem;
    mnuConsultarNFe: TMenuItem;
    cdsNUMERO: TStringField;
    cdsIMAGEM: TBCDField;
    ImageList1: TImageList;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    chkFiltroAguardandoEnvio: TCheckBox;
    chkFiltroRejeitada: TCheckBox;
    chkFiltroAutorizada: TCheckBox;
    chkFiltroCancelada: TCheckBox;
    chkMarcarOuDesmarcarTodas: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    lbQtdSelecionada: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    lblQtdNotas: TLabel;
    btnCartaCorrecao: TBitBtn;
    btnConsultaStatus: TBitBtn;
    btnProtocoloEntrega: TBitBtn;


    // Eventos
    procedure gridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure mnuAlterarNotaFiscalClick(Sender: TObject);
    procedure gridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkMarcarOuDesmarcarTodasClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirDANFEClick(Sender: TObject);
    procedure btnEnviarEmailsClick(Sender: TObject);
    procedure btnImprimirEtiquetaCaixasClick(Sender: TObject);
    procedure lblCheckBoxRejeitadaClick(Sender: TObject);
    procedure lblCheckBoxAutorizadaClick(Sender: TObject);
    procedure lblCheckBoxCanceladaClick(Sender: TObject);
    procedure btnGerarArqXMLClick(Sender: TObject);
    procedure lblCheckBoxAguardandoEnvioClick(Sender: TObject);
    procedure mnuCopiarChaveParaAreaTransferenciaClick(Sender: TObject);
    procedure mnuConsultarNFeClick(Sender: TObject);
    procedure btnCartaCorrecaoClick(Sender: TObject);
    procedure btnConsultaStatusClick(Sender: TObject);
    procedure btnProtocoloEntregaClick(Sender: TObject);


  private
    FNotasSelecionadas :TObjectList;
    buscando :Boolean;

  private
    function ApenasAguardandoEnvioERejeitadasSelecionadas            :Boolean;
    function ApenasAguardandoEnvioEAutorizadasSelecionadas           :Boolean;
    function ApenasAguardandoEnvioRejeitadasEAutorizadasSelecionadas :Boolean;
    function ApenasAutorizadasERejeitadasSelecionadas                :Boolean;
    function ApenasAutorizadasSelecionadas                           :Boolean;
    function ApenasAutorizadasECanceladasSelecionadas                :Boolean;

    function EstaAdicionada(const CodigoNotaFiscal :Integer) :Boolean;
    function RetornaQuantidadeSelecionadaPorTipo(Especificacao :TEspecificacaoNotaFiscalPorPeriodoEStatus) :Integer;
    function RetornaQuantidadeSelecionada                :Integer;
    function RetornaQuantidadeSelecionadaAguardandoEnvio :Integer;
    function RetornaQuantidadeSelecionadaAutorizada      :Integer;
    function RetornaQuantidadeSelecionadaCancelada       :Integer;
    function RetornaQuantidadeSelecionadaRejeitada       :Integer;

  private
    property QuantidadeSelecionadaAguardandoEnvio :Integer read RetornaQuantidadeSelecionadaAguardandoEnvio;
    property QuantidadeSelecionadaRejeitada       :Integer read RetornaQuantidadeSelecionadaRejeitada;
    property QuantidadeSelecionadaCancelada       :Integer read RetornaQuantidadeSelecionadaCancelada;
    property QuantidadeSelecionadaAutorizada      :Integer read RetornaQuantidadeSelecionadaAutorizada;
    property QuantidadeSelecionada                :Integer read RetornaQuantidadeSelecionada;

  private
    procedure AdicionarEventosDeBusca;
    procedure AdicionarNotasFiscaisNoCDS(NotasFiscais :TObjectList);
    procedure AdicionarNotaSelecionada(NotaFiscal :TNotaFiscal);
    procedure AtualizarTela;
    procedure AtualizarEstadoDaOperacao(Status :String);
    procedure Buscar(Sender :TObject); overload;
    procedure Buscar;                  overload;
    procedure DeselecionarNotaFiscal(const CodigoNotaFiscal :Integer);
    procedure DeselecionarTodas;
    procedure RemoverEventosDeBusca;
    procedure RemoverNotaSelecionada(NotaFiscal :TNotaFiscal);
    procedure RemoverTodasNotasSelecionadas;
    procedure SelecionarNotaFiscal(const CodigoNotaFiscal :Integer);
    procedure SelecionarTodas;
    procedure GerarXML;
    procedure Atualiza_estoque(NF :TNotaFiscal; adiciona_subtrai :integer);
    procedure Salva_estoque(cod_produto, cod_cor, cod_tamanho :integer; quantidade :Real);
    procedure Busca_tamanhos(var cds :TClientDataSet);
    procedure CancelaPedidos(PedidosFaturados :TObjectList);

  public
    constructor Create(AOwner :TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmMonitorControleNFe: TfrmMonitorControleNFe;

implementation

uses
  TipoStatusNotaFiscal,
  ExcecaoPeriodoInvalido,
  Especificacao,
  Repositorio,
  FabricaRepositorio,
  TipoSerie,
  uFaturamentoPedidos,
  uModulo,
  GeradorNFe,
  StringUtilitario,
  GeradorFinanceiro,
  Fatura,
  uImpressaoEtiquetaCaixa,
  PedidoFaturado,
  Pedido,
  Item, ItemAvulso, QuantidadeItemAvulso,
  Tamanho,
  Estoque,
  ClipBrd,
  ShellApi, uProtocoloEntrega,
  EspecificacaoEstoquePorProdutoCorTamanho,
  uCCe, PermissoesAcesso, Pessoa;

{$R *.dfm}

{ TfrmMonitorControleNFe }

procedure TfrmMonitorControleNFe.AdicionarEventosDeBusca;
begin
   self.btnAtualizar.OnClick := self.Buscar;
   self.chkFiltroAguardandoEnvio.OnClick := self.Buscar;
   self.chkFiltroRejeitada.OnClick := self.Buscar;
   self.chkFiltroAutorizada.OnClick := self.Buscar;
   self.chkFiltroCancelada.OnClick := self.Buscar;
end;

procedure TfrmMonitorControleNFe.AdicionarNotasFiscaisNoCDS(
  NotasFiscais: TObjectList);
var
  nX                :Integer;
  NF                :TNotaFiscal;
  nY                :Integer;
  PedidoFaturado    :TPedidoFaturado;
  Pedido            :TPedido;
  RepositorioPedido :TRepositorio;
begin
   self.cds.EmptyDataSet;

   if not Assigned(NotasFiscais) or (NotasFiscais.Count <= 0) then exit;

   cds.DisableControls;
   for nX := 0 to (NotasFiscais.Count-1) do begin
     Application.ProcessMessages;

     NF := (NotasFiscais[nX] as TNotaFiscal);

     self.cds.Append;
     self.cdsCODIGO.AsInteger        := NF.CodigoNotaFiscal;
     self.cdsNUMERO.AsString         := IntToStr(NF.NumeroNotaFiscal);
     self.cdsSERIE.AsString          := NF.Serie;
     self.cdsEMITENTE.AsString       := NF.Emitente.Razao;
     self.cdsDESTINATARIO.AsString   := NF.Destinatario.Razao;
     self.cdsDATA_EMISSAO.AsDateTime := NF.DataEmissao;
     self.cdsCHAVE_NFE.AsString      := NF.ChaveAcesso;
     self.cdsSTATUS.AsInteger        := TTipoStatusNotaFiscalUtilitario.DeEnumeradoParaInteiro(NF.Status);

     { Pedido(s) }
     if Assigned(NF.PedidosFaturados) then begin
       for nY := 0 to (NF.PedidosFaturados.Count-1) do begin
          PedidoFaturado           := (NF.PedidosFaturados[nY] as TPedidoFaturado);

          Pedido            := nil;
          RepositorioPedido := nil;

          try
            RepositorioPedido := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);
            Pedido            := (RepositorioPedido.Get(PedidoFaturado.CodigoPedido) as TPedido);
            self.cdsPEDIDOS.AsString := (self.cdsPEDIDOS.AsString + Pedido.numpedido);

            // Se não for o último pedido então é adicionado uma vírgula para separar o pedido.
            if (nY <> (NF.PedidosFaturados.Count-1)) then
              self.cdsPEDIDOS.AsString := (self.cdsPEDIDOS.AsString + ', ');
          finally
            FreeAndNil(RepositorioPedido);
            FreeAndNil(Pedido);
          end;
       end;
     end;

     try
       self.cdsXML.AsString          := NF.NFe.XMLText;
       self.cdsSTATUS_STR.AsString   := NF.NFe.Retorno.Status;
       self.cdsMOTIVO.AsString       := NF.NFe.Retorno.Motivo;
     except
       on E: EAccessViolation do begin
          self.cdsSTATUS_STR.AsString := '';
          self.cdsXML.AsString        := '';
          self.cdsMOTIVO.AsString     := 'AGUARDANDO ENVIO';
       end;
     end;
     self.cds.Post;
   end;
   cds.EnableControls;

   self.cds.First;
end;

procedure TfrmMonitorControleNFe.Buscar;
var
  Esp          :TEspecificacao;
  NotasFiscais :TObjectList;
  Repositorio  :TRepositorio;
begin

   Esp          := nil;
   Repositorio  := nil;
   NotasFiscais := nil;

   try
     Aguarda('Buscando notas fiscais...');
     try
       Esp := TEspecificacaoNotaFiscalPorPeriodoEStatus.Create(self.dtpFiltroDataInicial.DateTime,
                                                               self.dtpFiltroDataFinal.DateTime,
                                                               self.chkFiltroAguardandoEnvio.Checked,
                                                               self.chkFiltroAutorizada.Checked,
                                                               self.chkFiltroRejeitada.Checked,
                                                               self.chkFiltroCancelada.Checked);

       Repositorio  := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);
       NotasFiscais := Repositorio.GetListaPorEspecificacao(Esp, ''''+formatDateTime('dd.mm.yyyy hh:mm:ss',dtpFiltroDataInicial.DateTime)+ ''' and ''' +
                                                                 formatDateTime('dd.mm.yyyy hh:mm:ss',dtpFiltroDataFinal.DateTime)+'''');

       self.AdicionarNotasFiscaisNoCDS(NotasFiscais);

       lblQtdNotas.Caption := IntToStr( self.cds.RecordCount );

     except
       on E: TExcecaoPeriodoInvalido do begin
          inherited Avisar(E.Message);
          self.dtpFiltroDataFinal.SetFocus;
       end;
     end;
   finally
     FimAguarda('');
     FreeAndNil(Esp);
     FreeAndNil(Repositorio);
     FreeAndNil(NotasFiscais);
   end;
end;

procedure TfrmMonitorControleNFe.Buscar(Sender: TObject);
begin
   self.Buscar;
end;

constructor TfrmMonitorControleNFe.Create(AOwner: TComponent);
begin
  inherited;

  self.FNotasSelecionadas               := TObjectList.Create;
  self.dtpFiltroDataInicial.DateTime    := strToDateTime( formatDateTime('dd/mm/yyyy 00:00:00', date) );
  self.dtpFiltroDataFinal.DateTime      := strToDateTime( formatDateTime('dd/mm/yyyy 23:59:59', date) );
  self.cds.CreateDataSet;
  self.chkFiltroAguardandoEnvio.Checked := true;
  self.AdicionarEventosDeBusca;
  self.Buscar;
  self.AtualizarTela;
end;

procedure TfrmMonitorControleNFe.gridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   inherited;
  // if (Column.Field = cdsNUMERO) then begin

   if Column.Field = CdsIMAGEM then begin
       TDBGridCBN(Sender).Canvas.FillRect(Rect);

       if (TTipoStatusNotaFiscalUtilitario.DeInteiroParaEnumerado(self.cdsSTATUS.AsInteger) = snfRejeitada) then begin
         { TDBgridCBN(Sender).Canvas.Font.Color := self.chkFiltroRejeitada.Font.Color;
          TDBgridCBN(Sender).Canvas.Font.Style := self.chkFiltroRejeitada.Font.Style;}
          ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +5, Rect.Top , 0, true)
       end
       else if (TTipoStatusNotaFiscalUtilitario.DeInteiroParaEnumerado(self.cdsSTATUS.AsInteger) = snfAutorizada) then begin
         { TDBgridCBN(Sender).Canvas.Font.Color := self.chkFiltroAutorizada.Font.Color;
          TDBgridCBN(Sender).Canvas.Font.Style := self.chkFiltroAutorizada.Font.Style;}
          ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +5, Rect.Top , 1, true)
       end
       else if (TTipoStatusNotaFiscalUtilitario.DeInteiroParaEnumerado(self.cdsSTATUS.AsInteger) = snfCancelada) then begin
         { TDBgridCBN(Sender).Canvas.Font.Color := self.chkFiltroCancelada.Font.Color;
          TDBgridCBN(Sender).Canvas.Font.Style := self.chkFiltroCancelada.Font.Style;}
          ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +5, Rect.Top , 2, true)
       end
       else
          ImageList1.Draw(TDBGridCBN(Sender).Canvas, Rect.Left +5, Rect.Top , 3, true);
   end;


   if self.EstaAdicionada(self.cdsCODIGO.AsInteger) then begin
       TDBgridCBN(Sender).Canvas.Brush.Color := clSkyBlue;

     //TDBgridCBN(Sender).Canvas.FillRect(Rect);
     //TDBgridCBN(Sender).DefaultDrawDataCell(Rect, Column.Field, State);

     if not (Column.Field = CdsIMAGEM) then begin
       TDBgridCBN(Sender).Canvas.FillRect( rect );
       TDBgridCBN(Sender).DefaultDrawColumnCell( Rect, DataCol, Column, state);
     end;
   end;


end;

procedure TfrmMonitorControleNFe.RemoverEventosDeBusca;
begin
   self.btnAtualizar.OnClick := nil;
   self.chkFiltroAguardandoEnvio.OnClick := nil;
   self.chkFiltroRejeitada.OnClick := nil;
   self.chkFiltroAutorizada.OnClick := nil;
   self.chkFiltroCancelada.OnClick := nil;
end;

procedure TfrmMonitorControleNFe.cdsAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if      (DataSet.FieldByName(self.cdsSTATUS.FieldName).AsInteger = TTipoStatusNotaFiscalUtilitario.DeEnumeradoParaInteiro(snfAguardandoEnvio)) or
          (DataSet.FieldByName(self.cdsSTATUS.FieldName).AsInteger = TTipoStatusNotaFiscalUtilitario.DeEnumeradoParaInteiro(snfRejeitada))       then
    self.grid.PopupMenu := self.pmnuOpcoesNF
  else if (DataSet.FieldByName(self.cdsSTATUS.FieldName).AsInteger = TTipoStatusNotaFiscalUtilitario.DeEnumeradoParaInteiro(snfAutorizada)) then
    self.grid.PopupMenu := self.pmnuOpcoesNFEnviadas
  else
    self.grid.PopupMenu := nil;
end;

procedure TfrmMonitorControleNFe.mnuAlterarNotaFiscalClick(
  Sender: TObject);
var
  FrmAlteracaoNotaFiscal :TfrmFaturamentoPedidos;
  NotaFiscal             :TNotaFiscal;
  Repositorio            :TRepositorio;
begin
   Repositorio            := nil;
   FrmAlteracaoNotaFiscal := nil;

   try
     self.DeselecionarNotaFiscal(self.cdsCODIGO.AsInteger);

     Repositorio := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);
     NotaFiscal  := (Repositorio.Get(self.cdsCODIGO.AsInteger) as TNotaFiscal);

     FrmAlteracaoNotaFiscal := TfrmFaturamentoPedidos.Create(nil, NotaFiscal);
     FrmAlteracaoNotaFiscal.ShowModal;

     self.Buscar;

   finally
     FreeAndNil(Repositorio);

     if Assigned(FrmAlteracaoNotaFiscal) then begin
       FrmAlteracaoNotaFiscal.Release;
       FrmAlteracaoNotaFiscal := nil;
     end;
     
     FreeAndNil(NotaFiscal);
   end;
end;

destructor TfrmMonitorControleNFe.Destroy;
begin
  self.cds.Close;
  FreeAndNil(self.FNotasSelecionadas);
  
  inherited;
end;

procedure TfrmMonitorControleNFe.AtualizarTela;
begin
   self.grid.Repaint;

   self.lblQuantidadeSelecionadaAguardandoEnvio.Caption := IntToStr(self.QuantidadeSelecionadaAguardandoEnvio);
   self.lblQuantidadeSelecionadaRejeitada.Caption       := IntToStr(self.QuantidadeSelecionadaRejeitada);
   self.lblQuantidadeSelecionadCancelada.Caption        := IntToStr(self.QuantidadeSelecionadaCancelada);
   self.lblQuantidadeSelecionadaAutorizada.Caption      := IntToStr(self.QuantidadeSelecionadaAutorizada);
   self.lbQtdSelecionada.Caption                        := IntToStr(self.QuantidadeSelecionada);

   self.btnEnviar.Enabled                 := self.ApenasAguardandoEnvioERejeitadasSelecionadas;
   self.btnCancelar.Enabled               := self.ApenasAutorizadasERejeitadasSelecionadas;
   self.btnImprimirDANFE.Enabled          := self.ApenasAguardandoEnvioRejeitadasEAutorizadasSelecionadas;
   self.btnProtocoloEntrega.Enabled       := self.ApenasAguardandoEnvioRejeitadasEAutorizadasSelecionadas;
   self.btnEnviarEmails.Enabled           := self.ApenasAutorizadasSelecionadas;
   self.btnImprimirEtiquetaCaixas.Enabled := self.ApenasAguardandoEnvioRejeitadasEAutorizadasSelecionadas;
   self.btnGerarArqXML.Enabled            := self.ApenasAutorizadasECanceladasSelecionadas;
//   self.btnCartaCorrecao.Enabled          := self.ApenasAutorizadasSelecionadas;
   self.btnConsultaStatus.Enabled         := self.ApenasAutorizadasERejeitadasSelecionadas;

end;

function TfrmMonitorControleNFe.RetornaQuantidadeSelecionadaPorTipo(
  Especificacao: TEspecificacaoNotaFiscalPorPeriodoEStatus): Integer;
var
  nX :Integer;
begin
   result := 0;

   for nX := 0 to (self.FNotasSelecionadas.Count-1) do begin
      if Especificacao.SatisfeitoPor(self.FNotasSelecionadas[nX]) then
        Inc(result);
   end;
end;

function TfrmMonitorControleNFe.RetornaQuantidadeSelecionada: Integer;
begin
   result := (self.QuantidadeSelecionadaAguardandoEnvio +
              self.QuantidadeSelecionadaRejeitada       +
              self.QuantidadeSelecionadaCancelada       +
              self.QuantidadeSelecionadaAutorizada);
end;

function TfrmMonitorControleNFe.RetornaQuantidadeSelecionadaAguardandoEnvio: Integer;
var
  Esp :TEspecificacaoNotaFiscalPorPeriodoEStatus;
begin
   result := 0;

   try
     Esp := TEspecificacaoNotaFiscalPorPeriodoEStatus.Create(self.dtpFiltroDataInicial.DateTime,
                                                             self.dtpFiltroDataFinal.DateTime,
                                                             true,
                                                             false,
                                                             false,
                                                             false);

     result := self.RetornaQuantidadeSelecionadaPorTipo(Esp);
   finally
     FreeAndNil(Esp);
   end;
end;

function TfrmMonitorControleNFe.RetornaQuantidadeSelecionadaAutorizada: Integer;
var
  Esp :TEspecificacaoNotaFiscalPorPeriodoEStatus;
begin
   result := 0;

   try
     Esp := TEspecificacaoNotaFiscalPorPeriodoEStatus.Create(self.dtpFiltroDataInicial.DateTime,
                                                             self.dtpFiltroDataFinal.DateTime,
                                                             false,
                                                             true,
                                                             false,
                                                             false);

     result := self.RetornaQuantidadeSelecionadaPorTipo(Esp);
   finally
     FreeAndNil(Esp);
   end;
end;

function TfrmMonitorControleNFe.RetornaQuantidadeSelecionadaCancelada: Integer;
var
  Esp :TEspecificacaoNotaFiscalPorPeriodoEStatus;
begin
   result := 0;

   try
     Esp := TEspecificacaoNotaFiscalPorPeriodoEStatus.Create(self.dtpFiltroDataInicial.DateTime,
                                                             self.dtpFiltroDataFinal.DateTime,
                                                             false,
                                                             false,
                                                             false,
                                                             true);

     result := self.RetornaQuantidadeSelecionadaPorTipo(Esp);
   finally
     FreeAndNil(Esp);
   end;
end;

function TfrmMonitorControleNFe.RetornaQuantidadeSelecionadaRejeitada: Integer;
var
  Esp :TEspecificacaoNotaFiscalPorPeriodoEStatus;
begin
   result := 0;

   try
     Esp := TEspecificacaoNotaFiscalPorPeriodoEStatus.Create(self.dtpFiltroDataInicial.DateTime,
                                                             self.dtpFiltroDataFinal.DateTime,
                                                             false,
                                                             false,
                                                             true,
                                                             false);

     result := self.RetornaQuantidadeSelecionadaPorTipo(Esp);
   finally
     FreeAndNil(Esp);
   end;
end;

function TfrmMonitorControleNFe.ApenasAguardandoEnvioERejeitadasSelecionadas: Boolean;
begin
   result := (QuantidadeSelecionada = (self.QuantidadeSelecionadaAguardandoEnvio + self.QuantidadeSelecionadaRejeitada)) and
             (QuantidadeSelecionada <> 0);
end;

function TfrmMonitorControleNFe.ApenasAutorizadasSelecionadas: Boolean;
begin
   result := (self.QuantidadeSelecionada = self.QuantidadeSelecionadaAutorizada) and
             (QuantidadeSelecionada <> 0);
end;

procedure TfrmMonitorControleNFe.gridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_SPACE) and not(cds.IsEmpty) and not grid.buscando then begin

      keybd_event(VK_BACK, 0, 0, 0);

      if not self.EstaAdicionada(self.cdsCODIGO.AsInteger) then
        self.SelecionarNotaFiscal(self.cdsCODIGO.AsInteger)
      else
        self.DeselecionarNotaFiscal(self.cdsCODIGO.AsInteger);
   end;
end;

function TfrmMonitorControleNFe.EstaAdicionada(const CodigoNotaFiscal :Integer): Boolean;
var
  nX          :Integer;
  NotaFiscal  :TNotaFiscal;
begin
   result := false;
   
   for nX := 0 to (self.FNotasSelecionadas.Count-1) do begin
      NotaFiscal := (self.FNotasSelecionadas[nX] as TNotaFiscal);

      result := (NotaFiscal.CodigoNotaFiscal = CodigoNotaFiscal);

      if result then
        exit;
   end;
end;

procedure TfrmMonitorControleNFe.DeselecionarNotaFiscal(
  const CodigoNotaFiscal: Integer);
var
  NotaFiscal :TNotaFiscal;
  nX :Integer;
begin
   for nX := 0 to (self.FNotasSelecionadas.Count-1) do begin
      NotaFiscal := (self.FNotasSelecionadas[nX] as TNotaFiscal);

      if (NotaFiscal.CodigoNotaFiscal = CodigoNotaFiscal) then begin
         self.RemoverNotaSelecionada(NotaFiscal);
         exit;
      end;
   end;
end;

procedure TfrmMonitorControleNFe.SelecionarNotaFiscal(
  const CodigoNotaFiscal: Integer);
var
  Repositorio :TRepositorio;
  NotaFiscal  :TNotaFiscal;
begin
   Repositorio := nil;

   if self.EstaAdicionada(CodigoNotaFiscal) then
    exit;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);
     NotaFiscal  := (Repositorio.Get(CodigoNotaFiscal) as TNotaFiscal);

     self.AdicionarNotaSelecionada(NotaFiscal);
   finally
     FreeAndNil(Repositorio);
   end;
end;

procedure TfrmMonitorControleNFe.AdicionarNotaSelecionada(
  NotaFiscal: TNotaFiscal);
begin
   self.FNotasSelecionadas.Add(NotaFiscal);
   self.AtualizarTela;
end;

procedure TfrmMonitorControleNFe.RemoverNotaSelecionada(
  NotaFiscal: TNotaFiscal);
begin
   self.FNotasSelecionadas.Remove(NotaFiscal);
   self.AtualizarTela;
end;

procedure TfrmMonitorControleNFe.chkMarcarOuDesmarcarTodasClick(
  Sender: TObject);
begin
   if TCheckBox(Sender).Checked then
    self.SelecionarTodas
   else
    self.DeselecionarTodas;
end;

procedure TfrmMonitorControleNFe.DeselecionarTodas;
begin
   if self.cds.IsEmpty then exit;

   self.cds.First;
   while not self.cds.Eof do begin
      self.DeselecionarNotaFiscal(self.cdsCODIGO.AsInteger);
      self.cds.Next;
   end;
end;

procedure TfrmMonitorControleNFe.SelecionarTodas;
begin
   if self.cds.IsEmpty then exit;

   self.cds.First;
   while not self.cds.Eof do begin
      self.SelecionarNotaFiscal(self.cdsCODIGO.AsInteger);
      self.cds.Next;
   end;
end;

procedure TfrmMonitorControleNFe.btnEnviarClick(Sender: TObject);
var
  RepositorioNotaFiscal      :TRepositorio;
  GeradorNFe                 :TGeradorNFe;
  NotaFiscal                 :TNotaFiscal;
  nX                         :Integer;
  HouveErros                 :Boolean;
  GeradorFinaceiro           :TGeradorFinanceiro;
  Fatura                     :TFatura;
begin
   dm.conexao.TxOptions.AutoCommit := false;

   if not inherited Confirma('Deseja emitir as notas selecionadas?') then
    exit;

   RepositorioNotaFiscal      := nil;
   GeradorNFe                 := nil;
   GeradorFinaceiro           := nil;
   Fatura                     := nil;
   HouveErros                 := false;

   try
     RepositorioNotaFiscal      := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);
     GeradorFinaceiro           := TGeradorFinanceiro.Create;

     GeradorNFe := TGeradorNFe.Create(FDM.Logo);
     for nX := 0 to (self.FNotasSelecionadas.Count-1) do
        try

          NotaFiscal := nil;
          NotaFiscal := (self.FNotasSelecionadas[nX] as TNotaFiscal);

          self.AtualizarEstadoDaOperacao('Buscando certificado digital...');

          { Obtendo o número do certificado caso não esteja cadastrado }
          if TStringUtilitario.EstaVazia(NotaFiscal.Empresa.ConfiguracoesNF.num_certificado) then begin
            try
              NotaFiscal.Empresa.ConfiguracoesNF.num_certificado := GeradorNFe.ObterCertificado;
            except
              on E: Exception do
                raise Exception.Create('Certificado digital não selecionado!');
            end;
          end;

          { Gravo Lote com Status de Enviando }
          try
            self.AtualizarEstadoDaOperacao('Criando lote para nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal));
            NotaFiscal.CriaLoteEnvio();
            RepositorioNotaFiscal.Salvar(NotaFiscal);
          except
            on E: Exception do
              raise Exception.Create('Erro ao gravar lote da nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                     NotaFiscal.Destinatario.Razao+'.'+#13+
                                     'Erro: '+E.Message);
          end;


          if not (NotaFiscal.Entrada_saida = 'E') then begin // se for nota de entrada não gera financeiro

             { Gerar Financeiro }
             try
               self.AtualizarEstadoDaOperacao('Gerando financeiro para nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal));
               Fatura := GeradorFinaceiro.GerarFatura(NotaFiscal);
               GeradorNFe.AdicionarFatura(Fatura);
             except
               on E: Exception do
                 raise Exception.Create('Erro ao gerar financeiro da nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                        NotaFiscal.Destinatario.Razao+'.'+#13+
                                        'Erro: '+E.Message);
             end;
          end;

          { Emitir para SEFAZ }
          try
            self.AtualizarEstadoDaOperacao('Emitindo nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal));
            GeradorNFe.EmitirNFe(NotaFiscal);
          except
            on E: Exception do
              raise Exception.Create('Erro ao emitir para SEFAZ a nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                     NotaFiscal.Destinatario.Razao+'.'+#13+
                                     'Erro: '+E.Message);
          end;

          { Consultar no SEFAZ }
          try
            self.AtualizarEstadoDaOperacao('Consultando nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal));
            sleep(1000);
            GeradorNFe.ConsultarNFe(NotaFiscal);
          except
            on E: Exception do
              raise Exception.Create('Erro ao consultar no SEFAZ a nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                     NotaFiscal.Destinatario.Razao+'.'+#13+
                                     'Erro: '+E.Message);
          end;

          { Gerar XML da nota fiscal }
         { try
            self.AtualizarEstadoDaOperacao('Gerando XML da nota fiscal'+IntToStr(NotaFiscal.NumeroNotaFiscal));
            GeradorNFe.GerarXML(NotaFiscal);
          except
            on E: Exception do
              raise Exception.Create('Erro ao gerar XML da nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                     NotaFiscal.Destinatario.Razao+'.'+#13+
                                     'Erro: '+E.Message);
          end;  }

          { Persistir Nota Fiscal }
          try
            self.AtualizarEstadoDaOperacao('Gravando nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal));
            NotaFiscal.DataSaida := now;
            RepositorioNotaFiscal.Salvar(NotaFiscal);
          except
            on E: Exception do
              raise Exception.Create('Erro ao gravar nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                     NotaFiscal.Destinatario.Razao+'.'+#13+
                                     'Erro: '+E.Message);
          end;

          { Persitir Financeiro }
//          try
//          except
//            on E: Exception do
//              raise Exception.Create('Erro ao persistir financeiro da nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
//                                     NotaFiscal.Destinatario.Razao+'.'+#13+
//                                     'Erro: '+E.Message);
//          end;

          { Enviar E-mail }
          if assigned(NotaFiscal.NFe) and (NotaFiscal.NFe.Retorno.Status = '100') then
          begin
            try
              self.AtualizarEstadoDaOperacao('Enviando e-mail da nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal));
              GeradorNFe.EnviarEmail(NotaFiscal);
            except
              on E: Exception do
                raise Exception.Create('Erro ao enviar e-mail da nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                       NotaFiscal.Destinatario.Razao+'.'+#13+
                                       'Erro: '+E.Message);
            end;
          end;

          GeradorNFe.Recarregar;
        except
          on E: Exception do begin
            dm.LogErros.AdicionaErro('uMonitorControleNFe', E.ClassName, E.Message);
            HouveErros := true;
            continue;
          end;
        end;

     if HouveErros then begin
       dm.conexao.Rollback;

        if inherited Confirma('Houve erros no processo. Consulte o log na pasta raiz do sistema para maiores detalhes.') then
          inherited AbrirArquivo(dm.LogErros.NomeArquivo);
     end
     else begin
       dm.conexao.Commit;
       avisar('Nota enviada com sucesso!');
     end;

     { Mostrara todas as notas desse período. Assim o usuário poderá identificar o retorno do SEFAZ }
     self.RemoverEventosDeBusca;
     self.chkFiltroAguardandoEnvio.Checked := true;
     self.chkFiltroRejeitada.Checked       := true;
     self.chkFiltroAutorizada.Checked      := true;
     self.chkFiltroCancelada.Checked       := true;
     self.Buscar;
     self.AdicionarEventosDeBusca;
   finally
     dm.conexao.TxOptions.AutoCommit := true;
     self.RemoverTodasNotasSelecionadas;

     FreeAndNil(GeradorFinaceiro);
     FreeAndNil(Fatura);
     FreeAndNil(RepositorioNotaFiscal);
     FreeAndNil(GeradorNFe);
     FimAguarda('');
   end;
end;

procedure TfrmMonitorControleNFe.AtualizarEstadoDaOperacao(Status: String);
begin
   Aguarda(status);
   Application.ProcessMessages;
end;

procedure TfrmMonitorControleNFe.btnCancelarClick(Sender: TObject);
var
  RepositorioNotaFiscal      :TRepositorio;
  GeradorNFe                 :TGeradorNFe;
  NotaFiscal                 :TNotaFiscal;
  nX                         :Integer;
  HouveErros                 :Boolean;
  Justificativa              :String;
begin
   if not inherited Confirma('Deseja cancelar as notas selecionadas?') then
    exit;

   RepositorioNotaFiscal      := nil;
   GeradorNFe                 := nil;
   HouveErros                 := false;

   dm.conexao.TxOptions.AutoCommit := false;

   try
     Justificativa              := inherited chamaInput('TEXT', 'Digite a justificativa. (Se não digitar a justificativa será: CANCELAMENTO DE NF-E)');
     RepositorioNotaFiscal      := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);

     GeradorNFe := TGeradorNFe.Create(FDM.Logo);
     for nX := 0 to (self.FNotasSelecionadas.Count-1) do
        try
          NotaFiscal := (self.FNotasSelecionadas[nX] as TNotaFiscal);

          self.AtualizarEstadoDaOperacao('Buscando certificado digital...');

          { Obtendo o número do certificado caso não esteja cadastrado }
          if TStringUtilitario.EstaVazia(NotaFiscal.Empresa.ConfiguracoesNF.num_certificado) then begin
            try
              NotaFiscal.Empresa.ConfiguracoesNF.num_certificado := GeradorNFe.ObterCertificado;
            except
              on E: Exception do
                raise Exception.Create('Certificado digital não selecionado!');
            end;
          end;

          { Cancelar NF-e no SEFAZ }
          try
            self.AtualizarEstadoDaOperacao('Cancelando nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal));
            GeradorNFe.CancelarNFe(NotaFiscal, Justificativa);
          except
            on E: Exception do
              raise Exception.Create('Erro ao cancelar nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                     NotaFiscal.Destinatario.Razao+'.'+#13+
                                     'Erro: '+E.Message);
          end;

          { Gerar XML de cancelamento da nota fiscal }
          try
            self.AtualizarEstadoDaOperacao('Gerando XML de cancelamento da nota fiscal'+IntToStr(NotaFiscal.NumeroNotaFiscal));
            GeradorNFe.GerarXML(NotaFiscal);
          except
            on E: Exception do
              raise Exception.Create('Erro ao gerar XML de cancelamento da nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                     NotaFiscal.Destinatario.Razao+'.'+#13+
                                     'Erro: '+E.Message);
          end;

          { Persistir Nota Fiscal }
          try
            self.AtualizarEstadoDaOperacao('Gravando nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal));

            { se deu rejeição, pula essa parte e não cancela o pedido }
            if NotaFiscal.Status = snfCancelada then
              CancelaPedidos(NotaFiscal.PedidosFaturados);

            NotaFiscal.LimparPedidosFaturados();
            RepositorioNotaFiscal.Salvar(NotaFiscal);
          except
            on E: Exception do
              raise Exception.Create('Erro ao gravar nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                     NotaFiscal.Destinatario.Razao+'.'+#13+
                                     'Erro: '+E.Message);
          end;

          GeradorNFe.Recarregar;

          try
            { se deu rejeição não atualiza o estoque }
            if NotaFiscal.Status = snfCancelada then
              Atualiza_estoque(NotaFiscal, 1);

          except
            on E: Exception do begin
              raise Exception.Create('Erro ao atualizar estoque '+#13+
                                     'Erro: '+E.Message);
              HouveErros := true;
            end;
          end;

        except
          on E: Exception do begin
            dm.LogErros.AdicionaErro('uMonitorControleNFe', E.ClassName, E.Message);
            HouveErros := true;
            continue;
          end;
        end;

     if HouveErros then begin
       dm.conexao.Rollback;

        if inherited Confirma('Houve erros no processo. Consulte o log na pasta raiz do sistema para maiores detalhes.') then
          inherited AbrirArquivo(dm.LogErros.NomeArquivo);
     end
     else begin
       dm.conexao.Commit;
       avisar('Nota cancelada com sucesso!');
     end;

     { Mostrara todas as notas desse período. Assim o usuário poderá identificar o retorno do SEFAZ }
     self.RemoverEventosDeBusca;
     self.chkFiltroAguardandoEnvio.Checked := true;
     self.chkFiltroRejeitada.Checked       := true;
     self.chkFiltroAutorizada.Checked      := true;
     self.chkFiltroCancelada.Checked       := true;
     self.Buscar;
     self.AdicionarEventosDeBusca;
   finally
     FimAguarda('');   
     dm.conexao.TxOptions.AutoCommit := true;
     self.RemoverTodasNotasSelecionadas;

     FreeAndNil(RepositorioNotaFiscal);
     FreeAndNil(GeradorNFe);
   end;
end;

function TfrmMonitorControleNFe.ApenasAutorizadasERejeitadasSelecionadas: Boolean;
begin
   result := (QuantidadeSelecionada = (self.QuantidadeSelecionadaAutorizada + self.QuantidadeSelecionadaRejeitada)) and
             (QuantidadeSelecionada <> 0);
end;

procedure TfrmMonitorControleNFe.btnImprimirDANFEClick(Sender: TObject);
var
  RepositorioNotaFiscal      :TRepositorio;
  GeradorNFe                 :TGeradorNFe;
  NotaFiscal                 :TNotaFiscal;
  nX                         :Integer;
  HouveErros                 :Boolean;
  GeradorFinanceiro          :TGeradorFinanceiro;
  Fatura                     :TFatura;
begin
   if not inherited Confirma('Deseja imprimir as notas selecionadas?') then
    exit;

   RepositorioNotaFiscal      := nil;
   GeradorNFe                 := nil;
   GeradorFinanceiro          := nil;
   Fatura                     := nil;
   HouveErros                 := false;

   try
     RepositorioNotaFiscal      := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);
     GeradorFinanceiro          := TGeradorFinanceiro.Create;

     GeradorNFe := TGeradorNFe.Create(FDM.Logo);
     for nX := 0 to (self.FNotasSelecionadas.Count-1) do
        try
          NotaFiscal := (self.FNotasSelecionadas[nX] as TNotaFiscal);

          { Gerando o financeiro (Duplicatas) para aparecer na visualização do DANFE }
          try
            self.AtualizarEstadoDaOperacao('Gerando financeiro para nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal));
            Fatura := GeradorFinanceiro.GerarFatura(NotaFiscal);
            GeradorNFe.AdicionarFatura(Fatura);
          except
            on E: Exception do
              raise Exception.Create('Erro ao gerar financeiro da nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                     NotaFiscal.Destinatario.Razao+'.'+#13+
                                     'Erro: '+E.Message);
          end;


          { Imprimir DANFE }
          try
            self.AtualizarEstadoDaOperacao('Imprimindo DANFE da nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal));
            GeradorNFe.ImprimirComVisualizacao(NotaFiscal);
          except
            on E: Exception do
              raise Exception.Create('Erro ao imprimir DANFE da nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                     NotaFiscal.Destinatario.Razao+'.'+#13+
                                     'Erro: '+E.Message);
          end;

          GeradorNFe.Recarregar;
        except
          on E: Exception do begin
            dm.LogErros.AdicionaErro('uMonitorControleNFe', E.ClassName, E.Message);
            HouveErros := true;
            continue;
          end;
        end;

     if HouveErros then begin
        if inherited Confirma('Houve erros no processo. Consulte o log na pasta raiz do sistema para maiores detalhes.') then
          inherited AbrirArquivo(dm.LogErros.NomeArquivo);
     end;

   finally
     self.RemoverTodasNotasSelecionadas;

     FreeAndNil(RepositorioNotaFiscal);
     FreeAndNil(GeradorFinanceiro);
     FreeAndNil(GeradorNFe);
     FimAguarda('');
   end;
end;

procedure TfrmMonitorControleNFe.btnEnviarEmailsClick(Sender: TObject);
var
  RepositorioNotaFiscal      :TRepositorio;
  GeradorNFe                 :TGeradorNFe;
  NotaFiscal                 :TNotaFiscal;
  nX                         :Integer;
  HouveErros                 :Boolean;
begin
   if not inherited Confirma('Deseja enviar e-mail das notas selecionadas?') then
    exit;

   RepositorioNotaFiscal      := nil;
   GeradorNFe                 := nil;
   HouveErros                 := false;

   try
     RepositorioNotaFiscal      := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);

     GeradorNFe := TGeradorNFe.Create(FDM.Logo);
     for nX := 0 to (self.FNotasSelecionadas.Count-1) do
        try
          NotaFiscal := (self.FNotasSelecionadas[nX] as TNotaFiscal);

          { Enviar E-mail }
          try
            self.AtualizarEstadoDaOperacao('Enviando e-mail da nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal));
            GeradorNFe.EnviarEmail(NotaFiscal);
          except
            on E: Exception do
              raise Exception.Create('Erro ao enviar e-mail da nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                     NotaFiscal.Destinatario.Razao+'.'+#13+
                                     'Erro: '+E.Message);
          end;

          GeradorNFe.Recarregar;
        except
          on E: Exception do begin
            dm.LogErros.AdicionaErro('uMonitorControleNFe', E.ClassName, E.Message);
            HouveErros := true;
            continue;
          end;
        end;

     if HouveErros then begin
        if inherited Confirma('Houve erros no processo. Consulte o log na pasta raiz do sistema para maiores detalhes.') then
          inherited AbrirArquivo(dm.LogErros.NomeArquivo);
     end;

   finally
     FimAguarda('');  

     self.RemoverTodasNotasSelecionadas;

     FreeAndNil(RepositorioNotaFiscal);
     FreeAndNil(GeradorNFe);
   end;
end;

procedure TfrmMonitorControleNFe.lblCheckBoxRejeitadaClick(
  Sender: TObject);
begin
   PostMessage(self.chkFiltroRejeitada.Handle, BM_CLICK, 0, 0);
end;

procedure TfrmMonitorControleNFe.lblCheckBoxAutorizadaClick(Sender: TObject);
begin
   PostMessage(self.chkFiltroAutorizada.Handle, BM_CLICK, 0, 0);
end;

procedure TfrmMonitorControleNFe.lblCheckBoxCanceladaClick(Sender: TObject);
begin
   PostMessage(self.chkFiltroCancelada.Handle, BM_CLICK, 0, 0);
end;

procedure TfrmMonitorControleNFe.lblCheckBoxAguardandoEnvioClick(Sender: TObject);
begin
   PostMessage(self.chkFiltroAguardandoEnvio.Handle, BM_CLICK, 0, 0);
end;

procedure TfrmMonitorControleNFe.btnGerarArqXMLClick(Sender: TObject);
begin
  self.gerarXml;
end;

procedure TfrmMonitorControleNFe.GerarXML;
var   NotaFiscal :TNotaFiscal;
      caminho    :String;
      nX         :Integer;
begin

  SelectDirectory('Selecionar Pasta','', caminho);

  if caminho = '' then begin
    avisar('Operação cancelada');
    exit;
  end;

  try
       for nX := 0 to (self.FNotasSelecionadas.Count-1) do begin
           NotaFiscal := (self.FNotasSelecionadas[nX] as TNotaFiscal);

           NotaFiscal.NFe.XML.SaveToFile(caminho+'\NFe'+intToStr(NotaFiscal.NumeroNotaFiscal)+'.xml');
       end;
  finally
    self.RemoverTodasNotasSelecionadas;
  end;
end;

procedure TfrmMonitorControleNFe.btnImprimirEtiquetaCaixasClick(
  Sender: TObject);
var
  NotaFiscal                 :TNotaFiscal;
  nX                         :Integer;
  HouveErros                 :Boolean;
begin
   if not inherited Confirma('Deseja imprimir etiquetas p/ caixas das notas selecionadas?') then
    exit;

   HouveErros                 := false;

   try
     frmImpressaoEtiquetaCaixa            := TfrmImpressaoEtiquetaCaixa.Create(self);
     frmImpressaoEtiquetaCaixa.Automatico := true;
     frmImpressaoEtiquetaCaixa.ShowModal;


     for nX := 0 to (self.FNotasSelecionadas.Count-1) do
        try
          NotaFiscal := (self.FNotasSelecionadas[nX] as TNotaFiscal);

          { Imprimindo Etiqueta }
          try
            self.AtualizarEstadoDaOperacao('Imprimindo etiqueta para caixa da nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal));

            frmImpressaoEtiquetaCaixa.nr_nota        := NotaFiscal.NumeroNotaFiscal;
            frmImpressaoEtiquetaCaixa.codigoEmitente := NotaFiscal.Emitente.Codigo;
            frmImpressaoEtiquetaCaixa.vlr_nota       := TStringUtilitario.FormataDinheiro(NotaFiscal.Totais.TotalNF);
            frmImpressaoEtiquetaCaixa.Imprimir;

          except
            on E: Exception do
              raise Exception.Create('Erro ao imprimir etiqueta da nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                     NotaFiscal.Destinatario.Razao+'.'+#13+
                                     'Erro: '+E.Message);
          end;
        except
          on E: Exception do begin
            dm.LogErros.AdicionaErro('uMonitorControleNFe', E.ClassName, E.Message);
            HouveErros := true;
            continue;
          end;
        end;

     if HouveErros then begin
        if inherited Confirma('Houve erros no processo. Consulte o log na pasta raiz do sistema para maiores detalhes.') then
          inherited AbrirArquivo(dm.LogErros.NomeArquivo);
     end;

   finally
     FimAguarda('');
     if Assigned(frmImpressaoEtiquetaCaixa) then begin
       frmImpressaoEtiquetaCaixa.Release;
       frmImpressaoEtiquetaCaixa := nil;
     end;

     self.RemoverTodasNotasSelecionadas;
     grid.SetFocus;
   end;
end;

function TfrmMonitorControleNFe.ApenasAguardandoEnvioRejeitadasEAutorizadasSelecionadas: Boolean;
begin
   result := (QuantidadeSelecionada = (self.QuantidadeSelecionadaAutorizada     +
                                      self.QuantidadeSelecionadaRejeitada       +
                                      self.QuantidadeSelecionadaAguardandoEnvio) )
          and
             (QuantidadeSelecionada <> 0);
end;

function TfrmMonitorControleNFe.ApenasAguardandoEnvioEAutorizadasSelecionadas: Boolean;
begin
   result := (QuantidadeSelecionada = (self.QuantidadeSelecionadaAguardandoEnvio + self.QuantidadeSelecionadaAutorizada)) and
             (QuantidadeSelecionada <> 0);
end;


function TfrmMonitorControleNFe.ApenasAutorizadasECanceladasSelecionadas: Boolean;
begin
   result := (QuantidadeSelecionada = (self.QuantidadeSelecionadaAutorizada     +
                                       self.QuantidadeSelecionadaCancelada))
          and
             (QuantidadeSelecionada <> 0);
end;

procedure TfrmMonitorControleNFe.mnuCopiarChaveParaAreaTransferenciaClick(
  Sender: TObject);
begin
   Clipboard.AsText := self.cdsCHAVE_NFE.AsString;
end;

procedure TfrmMonitorControleNFe.mnuConsultarNFeClick(Sender: TObject);
begin
   self.mnuCopiarChaveParaAreaTransferencia.OnClick(mnuCopiarChaveParaAreaTransferencia);
   ShellExecute(Handle, 'open', 'iexplore', 'http://www.fazenda.pr.gov.br/', '', 1);
end;

procedure TfrmMonitorControleNFe.RemoverTodasNotasSelecionadas;
begin
   self.FNotasSelecionadas.Clear;
   self.AtualizarTela;
end;

procedure TfrmMonitorControleNFe.Atualiza_estoque(NF: TNotaFiscal; adiciona_subtrai :integer);
var i, j, k :integer;
    Pedido  :TPedido;
    cdsTamanhos :TClientDataSet;
begin
  Busca_tamanhos(cdsTamanhos);

  if assigned(NF.PedidosFaturados) and (NF.PedidosFaturados.Count > 0) then begin

    for i := 0 to NF.PedidosFaturados.Count -1 do begin
      Pedido := (NF.PedidosFaturados.items[i] as TPedidoFaturado).Pedido;

      for j := 0 to Pedido.Itens.Count - 1 do begin

         if ( (Pedido.Itens.Items[j] as TItem).qtd_RN > 0) then begin
           cdsTamanhos.Locate('TAMANHO','RN',[]);
           Salva_estoque((Pedido.Itens.Items[j] as TItem).cod_produto, (Pedido.Itens.Items[j] as TItem).cod_cor,
                          cdsTamanhos.FieldByName('CODIGO').AsInteger, (Pedido.Itens.Items[j] as TItem).qtd_RN * adiciona_subtrai);
         end;
         if ( (Pedido.Itens.Items[j] as TItem).qtd_P > 0) then begin
           cdsTamanhos.Locate('TAMANHO','P',[]);
           Salva_estoque((Pedido.Itens.Items[j] as TItem).cod_produto, (Pedido.Itens.Items[j] as TItem).cod_cor,
                          cdsTamanhos.FieldByName('CODIGO').AsInteger, (Pedido.Itens.Items[j] as TItem).qtd_P * adiciona_subtrai);
         end;
         if ( (Pedido.Itens.Items[j] as TItem).qtd_M > 0) then begin
           cdsTamanhos.Locate('TAMANHO','M',[]);
           Salva_estoque((Pedido.Itens.Items[j] as TItem).cod_produto, (Pedido.Itens.Items[j] as TItem).cod_cor,
                          cdsTamanhos.FieldByName('CODIGO').AsInteger, (Pedido.Itens.Items[j] as TItem).qtd_M * adiciona_subtrai);
         end;
         if ( (Pedido.Itens.Items[j] as TItem).qtd_G > 0) then begin
           cdsTamanhos.Locate('TAMANHO','G',[]);
           Salva_estoque((Pedido.Itens.Items[j] as TItem).cod_produto, (Pedido.Itens.Items[j] as TItem).cod_cor,
                          cdsTamanhos.FieldByName('CODIGO').AsInteger, (Pedido.Itens.Items[j] as TItem).qtd_G * adiciona_subtrai);
         end;
         if ( (Pedido.Itens.Items[j] as TItem).qtd_1 > 0) then begin
           cdsTamanhos.Locate('TAMANHO','1',[]);
           Salva_estoque((Pedido.Itens.Items[j] as TItem).cod_produto, (Pedido.Itens.Items[j] as TItem).cod_cor,
                          cdsTamanhos.FieldByName('CODIGO').AsInteger, (Pedido.Itens.Items[j] as TItem).qtd_1 * adiciona_subtrai);
         end;
         if ( (Pedido.Itens.Items[j] as TItem).qtd_2 > 0) then begin
           cdsTamanhos.Locate('TAMANHO','2',[]);
           Salva_estoque((Pedido.Itens.Items[j] as TItem).cod_produto, (Pedido.Itens.Items[j] as TItem).cod_cor,
                          cdsTamanhos.FieldByName('CODIGO').AsInteger, (Pedido.Itens.Items[j] as TItem).qtd_2 * adiciona_subtrai);
         end;
         if ( (Pedido.Itens.Items[j] as TItem).qtd_3 > 0) then begin
           cdsTamanhos.Locate('TAMANHO','3',[]);
           Salva_estoque((Pedido.Itens.Items[j] as TItem).cod_produto, (Pedido.Itens.Items[j] as TItem).cod_cor,
                          cdsTamanhos.FieldByName('CODIGO').AsInteger, (Pedido.Itens.Items[j] as TItem).qtd_3 * adiciona_subtrai);
         end;
         if ( (Pedido.Itens.Items[j] as TItem).qtd_4 > 0) then begin
           cdsTamanhos.Locate('TAMANHO','4',[]);
           Salva_estoque((Pedido.Itens.Items[j] as TItem).cod_produto, (Pedido.Itens.Items[j] as TItem).cod_cor,
                          cdsTamanhos.FieldByName('CODIGO').AsInteger, (Pedido.Itens.Items[j] as TItem).qtd_4 * adiciona_subtrai);
         end;
         if ( (Pedido.Itens.Items[j] as TItem).qtd_6 > 0) then begin
           cdsTamanhos.Locate('TAMANHO','6',[]);
           Salva_estoque((Pedido.Itens.Items[j] as TItem).cod_produto, (Pedido.Itens.Items[j] as TItem).cod_cor,
                          cdsTamanhos.FieldByName('CODIGO').AsInteger, (Pedido.Itens.Items[j] as TItem).qtd_6 * adiciona_subtrai);
         end;
         if ( (Pedido.Itens.Items[j] as TItem).qtd_8 > 0) then begin
           cdsTamanhos.Locate('TAMANHO','8',[]);
           Salva_estoque((Pedido.Itens.Items[j] as TItem).cod_produto, (Pedido.Itens.Items[j] as TItem).cod_cor,
                          cdsTamanhos.FieldByName('CODIGO').AsInteger, (Pedido.Itens.Items[j] as TItem).qtd_8 * adiciona_subtrai);
         end;
         if ( (Pedido.Itens.Items[j] as TItem).qtd_UNICA > 0) then begin
           cdsTamanhos.Locate('TAMANHO','UNICA',[]);
           Salva_estoque((Pedido.Itens.Items[j] as TItem).cod_produto, (Pedido.Itens.Items[j] as TItem).cod_cor,
                          cdsTamanhos.FieldByName('CODIGO').AsInteger, (Pedido.Itens.Items[j] as TItem).qtd_UNICA * adiciona_subtrai);
         end;

      end; //fim for j

    end;//fim for i

  end
  else if assigned(NF.ItensAvulsos) and (NF.ItensAvulsos.Count > 0) then begin

    for i := 0 to Nf.ItensAvulsos.Count -1 do begin
      for j := 0 to (NF.ItensAvulsos[i] as TItemAvulso).Quantidades.Count -1 do begin

         Salva_estoque( (NF.ItensAvulsos[i] as TItemAvulso).Produto.Codigo,
                        (NF.ItensAvulsos[i] as TItemAvulso).Cor.Codigo,
                        ((NF.ItensAvulsos[i] as TItemAvulso).Quantidades[j] as TQuantidadeItemAvulso).Tamanho.Codigo,
                        ((NF.ItensAvulsos[i] as TItemAvulso).Quantidades[j] as TQuantidadeItemAvulso).Quantidade * adiciona_subtrai );
      end;
    end;

  end;
end;

procedure TfrmMonitorControleNFe.btnProtocoloEntregaClick(Sender: TObject);
begin
  frmProtocoloEntrega := TfrmProtocoloEntrega.Create(nil);
  frmProtocoloEntrega.geraProtocolo(self.FNotasSelecionadas);
  frmProtocoloEntrega.Release;
  frmProtocoloEntrega := nil;
end;

procedure TfrmMonitorControleNFe.Salva_estoque(cod_produto, cod_cor,
  cod_tamanho: integer; quantidade: Real);
var
    Estoque :TEstoque;
    repositorio :TRepositorio;
    Especificacao :TEspecificacaoEstoquePorProdutoCorTamanho;
begin
  repositorio    := nil;
  Estoque        := nil;

  try
    repositorio    := TFabricaRepositorio.GetRepositorio(TEstoque.ClassName);
    Especificacao  := TEspecificacaoEstoquePorProdutoCorTamanho.Create(cod_produto,
                                                                       cod_cor,
                                                                       cod_tamanho);

    Estoque     := TEstoque( repositorio.GetPorEspecificacao( Especificacao, intToStr(cod_produto)) );

    if not assigned(Estoque) then
      Estoque := TEstoque.Create;

    Estoque.codigo_produto := cod_produto;
    Estoque.codigo_cor     := cod_cor;
    Estoque.codigo_tamanho := cod_tamanho;
    Estoque.quantidade     := Estoque.quantidade + quantidade;

    repositorio.Salvar(Estoque);

  finally
    if Assigned(repositorio) then FreeAndNil(repositorio);
    if Assigned(Estoque)     then FreeAndNil(Estoque);
  end;
end;

procedure TfrmMonitorControleNFe.Busca_tamanhos(var cds: TClientDataSet);
var lista :TObjectList;
    repositorio :TRepositorio;
    i :integer;
begin
  repositorio := nil;

  lista := TObjectList.Create(true);

  cds := TClientDataSet.Create(Self);
  cds.Close;
  cds.FieldDefs.Clear;
  cds.FieldDefs.add('CODIGO',ftInteger);
  cds.FieldDefs.add('TAMANHO',ftString,10);
  cds.CreateDataSet;

 try
  repositorio := TFabricaRepositorio.GetRepositorio(TTamanho.ClassName);
  lista       := repositorio.GetAll;

  for i := 0 to lista.Count - 1 do begin
    cds.Append;
    cds.fieldByName('CODIGO').AsInteger := (lista.Items[i] as TTamanho).Codigo;
    cds.fieldByName('TAMANHO').AsString := (lista.Items[i] as TTamanho).Descricao;
    cds.Post;
  end;

 finally
   FreeAndNil(repositorio);
   lista.Free;
 end;
end;

procedure TfrmMonitorControleNFe.CancelaPedidos(PedidosFaturados: TObjectList);
var i           :integer;
    repositorio :TRepositorio;
begin
   repositorio := nil;
 try
   repositorio := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);

   for i := 0 to PedidosFaturados.Count - 1 do begin
     (PedidosFaturados[i] as TPedidoFaturado).Pedido.cancelado := 'S';
     repositorio.Salvar( (PedidosFaturados[i] as TPedidoFaturado).Pedido );
   end;

 finally
   if assigned(repositorio) then  FreeAndNil(repositorio);
 end;
end;

procedure TfrmMonitorControleNFe.btnCartaCorrecaoClick(Sender: TObject);
begin
  self.AbreForm(TfrmCCe, paCartaCorrecaoEletronica);
end;

procedure TfrmMonitorControleNFe.btnConsultaStatusClick(Sender: TObject);
var
  RepositorioNotaFiscal      :TRepositorio;
  GeradorNFe                 :TGeradorNFe;
  NotaFiscal                 :TNotaFiscal;
  nX                         :Integer;
begin
 try
    RepositorioNotaFiscal  := nil;
    GeradorNFe             := nil;
    NotaFiscal             := nil;

    RepositorioNotaFiscal  := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);
    GeradorNFe             := TGeradorNFe.Create(FDM.Logo);

    for nX := 0 to (self.FNotasSelecionadas.Count-1) do
    begin
       NotaFiscal             := (self.FNotasSelecionadas[nX] as TNotaFiscal);

       Aguarda('Consultando nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal));
       Application.ProcessMessages;

       { Obtendo o número do certificado caso não esteja cadastrado }
       if TStringUtilitario.EstaVazia(NotaFiscal.Empresa.ConfiguracoesNF.num_certificado) then begin
         try
           NotaFiscal.Empresa.ConfiguracoesNF.num_certificado := GeradorNFe.ObterCertificado;
         except
           on E: Exception do
             raise Exception.Create('Certificado digital não selecionado!');
         end;
       end;

       { Consultar no SEFAZ }
       try
         GeradorNFe.ConsultarNFe(NotaFiscal);
       except
         on E: Exception do
           raise Exception.Create('Erro ao consultar no SEFAZ a nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                  NotaFiscal.Destinatario.Razao+'.'+#13+
                                  'Erro: '+E.Message);
       end;

       { Persistir Nota Fiscal }
       try
         RepositorioNotaFiscal.Salvar(NotaFiscal);
       except
         on E: Exception do
           raise Exception.Create('Erro ao gravar nota fiscal '+IntToStr(NotaFiscal.NumeroNotaFiscal)+' destinada a '+
                                  NotaFiscal.Destinatario.Razao+'.'+#13+
                                  'Erro: '+E.Message);
       end;

    end;

    self.Buscar;

 Finally
    FimAguarda;
    self.RemoverTodasNotasSelecionadas;
    FreeAndNil(RepositorioNotaFiscal);
    FreeAndNil(GeradorNFe);
 end;
end;

end.
