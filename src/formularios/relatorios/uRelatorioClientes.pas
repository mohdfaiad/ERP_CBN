unit uRelatorioClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, ExtCtrls, frameBuscaPessoa, frameBuscaCidade,
  StdCtrls, RLReport, DB, TipoPessoa,
  RLFilters, RLPDFFilter, frameBuscaEstado, RLXLSFilter, ComObj, FileCtrl,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmRelatorioClientes = class(TfrmPadrao)
    gpbCidade: TGroupBox;
    BuscaCidade1: TBuscaCidade;
    GroupBox2: TGroupBox;
    BuscaPessoa1: TBuscaPessoa;
    Panel1: TPanel;
    btnImprimir: TSpeedButton;
    dsClientes: TDataSource;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel7: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    RLDBResult1: TRLDBResult;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLLabel8: TRLLabel;
    RLDBText5: TRLDBText;
    RLGroup2: TRLGroup;
    RLBand5: TRLBand;
    RLLabel9: TRLLabel;
    RLDBText6: TRLDBText;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLBand6: TRLBand;
    RLDBResult2: TRLDBResult;
    RLLabel16: TRLLabel;
    RLBand7: TRLBand;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel14: TRLLabel;
    btnSair: TSpeedButton;
    RLDBText4: TRLDBText;
    rgFiltroClientes: TRadioGroup;
    RLPDFFilter1: TRLPDFFilter;
    gpbEstado: TGroupBox;
    BuscaEstado1: TBuscaEstado;
    rgpFiltro: TRadioGroup;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLXLSFilter1: TRLXLSFilter;
    RLLabel3: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel17: TRLLabel;
    edtCaminhoPlanilha: TEdit;
    btnCaminho: TBitBtn;
    chkGeraPlanilha: TCheckBox;
    Label1: TLabel;
    qryClientes: TFDQuery;
    qryClientesCODIGO: TIntegerField;
    qryClientesRAZAO: TStringField;
    qryClientesCPF_CNPJ: TStringField;
    qryClientesFONE1: TStringField;
    qryClientesEMAIL: TStringField;
    qryClientesCOD_REPRESENTANTE: TIntegerField;
    qryClientesCODCIDADE: TIntegerField;
    qryClientesUF: TStringField;
    qryClientesLOGRADOURO: TStringField;
    qryClientesNUMERO: TStringField;
    qryClientesBAIRRO: TStringField;
    qryClientesREPRESENTANTE: TStringField;
    qryClientesCIDADE: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RLGroup2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure rgpFiltroClick(Sender: TObject);
    procedure chkGeraPlanilhaClick(Sender: TObject);
    procedure btnCaminhoClick(Sender: TObject);
  private

    procedure imprimir;
    procedure gerarPlanilhaExcel;

    function monta_sql :String;

  public
    { Public declarations }
  end;

var
  frmRelatorioClientes: TfrmRelatorioClientes;

implementation

uses StrUtils;

{$R *.dfm}

procedure TfrmRelatorioClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( (ssCtrl in Shift) AND (Key = ord('P')) ) then  btnImprimir.Click;
  if key = VK_ESCAPE then
    btnSair.Click;
end;

procedure TfrmRelatorioClientes.btnImprimirClick(Sender: TObject);
begin
 try
   if chkGeraPlanilha.Checked and (edtCaminhoPlanilha.Text = '') then
   begin
     Avisar('Favor informar o diretório em que será gerada a planilha.');
     btnCaminho.SetFocus;
     Exit;
   end;
   
   self.Aguarda('Aguarde, buscando clientes...');
   Application.ProcessMessages;
   imprimir;
 Finally
   FimAguarda('');
 end;
end;

procedure TfrmRelatorioClientes.imprimir;
begin
  qryClientes.Close;
  qryClientes.SQL.Text := monta_sql;

  if BuscaPessoa1.edtRazao.Text <> '' then
    qryClientes.ParamByName('cod_rep').AsInteger := BuscaPessoa1.edtCodigo.AsInteger;

  if gpbCidade.Visible and (BuscaCidade1.edtCidade.Text <> '') then
    qryClientes.ParamByName('cod_cid').AsInteger := BuscaCidade1.edtCodCid.AsInteger
  else if gpbEstado.Visible and (BuscaEstado1.edtEstado.Text <> '') then
    qryClientes.ParamByName('cod_est').AsInteger := BuscaEstado1.edtCodigo.AsInteger;

  if rgFiltroClientes.ItemIndex = 1 then
    qryClientes.ParamByName('bloq').AsString  := 'S';

  qryClientes.Open;

  if qryClientes.IsEmpty then
    avisar('Não foram encontrados registros com os filtros fornecidos')
  else
    RLReport1.PreviewModal;

  if chkGeraPlanilha.Checked then
    gerarPlanilhaExcel;
end;

function TfrmRelatorioClientes.monta_sql: String;
var condicao_representante, condicao_cidade_estado, condicao_clientes_bloqueados, where :String;
begin
  if BuscaPessoa1.edtRazao.Text <> '' then
    condicao_representante := ' cr.cod_representante = :cod_rep ';

  if gpbCidade.Visible and (BuscaCidade1.edtCidade.Text <> '') then
    condicao_cidade_estado   := IfThen(condicao_representante = '',' en.codcidade = :cod_cid ', ' and en.codcidade = :cod_cid ')
  else if gpbEstado.Visible and (BuscaEstado1.edtEstado.Text <> '') then
    condicao_cidade_estado   := IfThen(condicao_representante = '',' est.codigo = :cod_est ', ' and est.codigo = :cod_est ');

  if rgFiltroClientes.ItemIndex = 1 then
    condicao_clientes_bloqueados := IfThen((condicao_representante = '')and(condicao_cidade_estado = ''),
                                           ' iif(cli.bloqueado is null, ''N'', cli.bloqueado) <> :bloq ',
                                           ' and iif(cli.bloqueado is null, ''N'', cli.bloqueado) <> :bloq ');



  if (BuscaPessoa1.edtRazao.Text <> '') or (BuscaCidade1.edtCidade.Text <> '') or (rgFiltroClientes.ItemIndex = 1) then
    where := ' where ';

  Result := ' select cli.codigo, cli.razao, cli.cpf_cnpj, cli.fone1, cli.email, cr.cod_representante,  '+
            '        en.codcidade, est.sigla uf, en.logradouro, en.numero, en.bairro, rep.razao representante, cid.nome || '' - '' || est.sigla cidade '+
            ' from pessoas cli                                                                         '+
            ' left join cliente_representante cr  on cr.cod_cliente = cli.codigo                       '+
            ' inner join pessoas               rep on rep.codigo = cr.cod_representante                '+
            ' inner join enderecos             en  on en.codpessoa = cli.codigo                        '+
            ' left join cidades               cid on cid.codibge = en.codcidade                        '+
            ' left join estados               est on est.codigo = cid.codest                           '+
             where + condicao_representante + condicao_cidade_estado + condicao_clientes_bloqueados +
            ' order by cr.cod_representante, en.codcidade';
end;

procedure TfrmRelatorioClientes.FormShow(Sender: TObject);
begin
  BuscaPessoa1.TipoPessoa := tpRepresentante;

end;

procedure TfrmRelatorioClientes.RLGroup2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var cor_atual :TColor;
begin
  if RLBand5.Color = clWhite then   cor_atual := $00E6E6E6
                             else   cor_atual := clWhite;

  RLBand5.Color := cor_atual;
  RLBand7.Color       := cor_atual;
  RLBand2.Color       := cor_atual;
  RLBand6.Color       := cor_atual;

{  if RLDraw3.Brush.Color = clWhite then
    RLDraw3.Brush.Color := $00E6E6E6
  else
    RLDraw3.Brush.Color := clWhite;}

end;

procedure TfrmRelatorioClientes.btnSairClick(Sender: TObject);
begin
  inherited;
  self.close;
end;

procedure TfrmRelatorioClientes.rgpFiltroClick(Sender: TObject);
begin
  gpbCidade.Visible := rgpFiltro.ItemIndex = 0;
  gpbEstado.Visible := rgpFiltro.ItemIndex = 1;
end;

procedure TfrmRelatorioClientes.chkGeraPlanilhaClick(Sender: TObject);
begin
   btnCaminho.Enabled := chkGeraPlanilha.Checked;
end;

procedure TfrmRelatorioClientes.gerarPlanilhaExcel;
var objExcel,Sheet,Chart,s : Variant;
    cTitulo : string;
    i : integer;
begin
 try
   cTitulo := 'Relatório de Clientes';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := False;
   objExcel.Caption := cTitulo;

   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;

   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

   Sheet.Range['A1'] := 'UF';
   Sheet.Range['A1'].ColumnWidth := 5;
   Sheet.Range['B1'] := 'Cidade';
   Sheet.Range['B1'].ColumnWidth := 40;
   Sheet.Range['C1'] := 'Representante';
   Sheet.Range['C1'].ColumnWidth := 40;
   Sheet.Range['D1'] := 'Cliente';
   Sheet.Range['D1'].ColumnWidth := 50;
   Sheet.Range['E1'] := 'Telefone';
   Sheet.Range['E1'].ColumnWidth := 15;
   Sheet.Range['F1'] := 'Logradouro';
   Sheet.Range['F1'].ColumnWidth := 45;
   Sheet.Range['G1'] := 'Nº';
   Sheet.Range['G1'].ColumnWidth := 10;
   Sheet.Range['H1'] := 'Bairro';
   Sheet.Range['H1'].ColumnWidth := 45;

   qryClientes.IndexFieldNames := 'UF;CODCIDADE';

   qryClientes.First;
   while not qryClientes.Eof do begin
     Sheet.Cells[qryClientes.RecNo+1,1] := qryClientesUF.AsString;
     Sheet.Cells[qryClientes.RecNo+1,2] := qryClientesCIDADE.AsString;
     Sheet.Cells[qryClientes.RecNo+1,3] := qryClientesREPRESENTANTE.AsString;
     // Formata o Numero para se tornar MOEDA
     // Sheet.Cells[qryClientes+1,5].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
     Sheet.Cells[qryClientes.RecNo+1,4] := qryClientesRAZAO.AsString;
     Sheet.Cells[qryClientes.RecNo+1,5] := qryClientesFONE1.AsString;
     Sheet.Cells[qryClientes.RecNo+1,6] := qryClientesLOGRADOURO.AsString;
     Sheet.Cells[qryClientes.RecNo+1,7] := qryClientesNUMERO.AsString;
     Sheet.Cells[qryClientes.RecNo+1,8] := qryClientesBAIRRO.AsString;

     qryClientes.Next;
   end;

   // Formatando o Cabeçalho
   Sheet.Range['A1','H1'].font.name      := 'Verdana'; // Fonte
   Sheet.Range['A1','H1'].font.size      := 12; // Tamanho da Fonte
   Sheet.Range['A1','H1'].font.bold      := true; // Negrito
   Sheet.Range['A1','H1'].font.italic    := true; // Italico
   Sheet.Range['A1','H1'].font.color     := $00F0E4DB; // Cor da Fonte
   Sheet.Range['A1','H1'].Interior.Color := $00BD895E; // Cor da Célula
   // Define o tamanho das Colunas (basta fazer em uma delas e as demais serão alteradas)
  { Sheet.Range['B1','G1' ].ColumnWidth := 27;
   Sheet.Range['B1','G1' ].RowHeight := 25;
   Sheet.Range['D1'] .ColumnWidth := 16; }

  // Sheet.PrintPreview;
   Sheet.SaveAs(edtCaminhoPlanilha.Text+'\RelatorioDeClientes.xlsx');

 finally
   PostMessage(FindWindow('XLMAIN', nil), WM_CLOSE,0,0);
   Sheet := Unassigned;
   objExcel.Quit;
 end;
end;

procedure TfrmRelatorioClientes.btnCaminhoClick(Sender: TObject);
var
  Dir: string;
begin

  if selectdirectory('Select a directory', '', Dir) then
    edtCaminhoPlanilha.Text := Dir;
end;

end.
