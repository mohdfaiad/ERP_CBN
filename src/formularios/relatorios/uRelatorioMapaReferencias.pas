unit uRelatorioMapaReferencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, RLReport, StdCtrls, Buttons, ExtCtrls,
  frameBuscaProduto, DB, RLFilters, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmRelatorioMapaReferencias = class(TfrmPadrao)
    BuscaProduto1: TBuscaProduto;
    Shape1: TShape;
    cbConsidera: TCheckBox;
    Panel1: TPanel;
    btnImprimir: TBitBtn;
    RLReport1: TRLReport;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLBand3: TRLBand;
    RLDBText2: TRLDBText;
    dsRel: TDataSource;
    RLLabel3: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel4: TRLLabel;
    RLDBText4: TRLDBText;
    RLDBResult1: TRLDBResult;
    RLDraw1: TRLDraw;
    RLBand4: TRLBand;
    RLDBResult3: TRLDBResult;
    RLBand5: TRLBand;
    RLLabel5: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLLabel6: TRLLabel;
    RLLabel19: TRLLabel;
    RLSystemInfo5: TRLSystemInfo;
    qry: TFDQuery;
    qryCODIGO: TIntegerField;
    qryPRODUTO: TStringField;
    qryCODCOR: TIntegerField;
    qryCOR: TStringField;
    qryGRADE: TStringField;
    qryQTDTAM: TIntegerField;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbConsideraClick(Sender: TObject);
  private
    function monta_sql :String;
  public
    { Public declarations }
  end;

var
  frmRelatorioMapaReferencias: TfrmRelatorioMapaReferencias;

implementation

{$R *.dfm}

procedure TfrmRelatorioMapaReferencias.btnImprimirClick(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.SQL.Text := monta_sql;
  qry.Open;

  RLReport1.PreviewModal;
end;

procedure TfrmRelatorioMapaReferencias.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( (ssCtrl in Shift) AND (Key = ord('P')) ) then  btnImprimir.Click;
end;

function TfrmRelatorioMapaReferencias.monta_sql: String;
var condicao :String;
begin
  if BuscaProduto1.edtDescricao.Text <> '' then
    condicao := ' and p.codigo = '+ BuscaProduto1.codproduto
  else
    condicao := '';  

  result := ' select p.codigo ,''[ ''||p.referencia||'' ] ''||p.descricao Produto, c.codigo CODCOR,c.descricao Cor, g.descricao Grade, count(gt.codigo) QTDTAM '+
            '    from produtos p                                                                                                                               '+
            ' left join produto_cores  pc on pc.codproduto = p.codigo                                                                                          '+
            ' left join cores          c  on c.codigo = pc.codcor                                                                                              '+
            ' left join grades         g  on g.codigo = p.cod_grade                                                                                            '+
            ' left join grade_tamanhos gt on gt.codgrade = g.codigo                                                                                            '+
            ' where pc.codigo is not null '+ condicao +
            ' group by p.codigo ,p.referencia, p.descricao, c.codigo, c.descricao, g.descricao                                                                 ';

end;

procedure TfrmRelatorioMapaReferencias.cbConsideraClick(Sender: TObject);
begin
  inherited;
  if cbConsidera.Checked then
    BuscaProduto1.Enabled := false
  else
    BuscaProduto1.Enabled := true;

end;

end.
