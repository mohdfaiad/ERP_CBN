unit uRelatorioComissoesRepresentantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, ExtCtrls, StdCtrls, frameBuscaPessoa,
  RLReport, DB, Provider,
  DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RLFilters, Vcl.MPlayer, ShellAPI;

type
  TfrmRelatorioComissoesRepresentantes = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    chkFevereiro: TCheckBox;
    chkJulho: TCheckBox;
    chkMarco: TCheckBox;
    chkAbril: TCheckBox;
    chkMaio: TCheckBox;
    chkJunho: TCheckBox;
    chkJaneiro: TCheckBox;
    chkAgosto: TCheckBox;
    chkSetembro: TCheckBox;
    chkOutubro: TCheckBox;
    chkNovembro: TCheckBox;
    chkDezembro: TCheckBox;
    GroupBox2: TGroupBox;
    BuscaPessoa1: TBuscaPessoa;
    GroupBox3: TGroupBox;
    cbAno: TComboBox;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    btnImprimir: TSpeedButton;
    dsComissao: TDataSource;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel13: TRLLabel;
    RLBand3: TRLBand;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLLabel8: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel3: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLLabel11: TRLLabel;
    cdsComiss: TClientDataSet;
    dspComissao: TDataSetProvider;
    RLBand7: TRLBand;
    rlbMes: TRLLabel;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLBand2: TRLBand;
    RLDBResult4: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLLabel2: TRLLabel;
    RLDraw1: TRLDraw;
    rgTipoRelatorio: TRadioGroup;
    cdsComissNOMEMES: TStringField;
    RLLabel10: TRLLabel;
    RLLabel12: TRLLabel;
    rld2: TRLDraw;
    rld3: TRLDraw;
    rld4: TRLDraw;
    rld5: TRLDraw;
    rld6: TRLDraw;
    rld7: TRLDraw;
    rld8: TRLDraw;
    rld9: TRLDraw;
    rld10: TRLDraw;
    rld11: TRLDraw;
    rld12: TRLDraw;
    cdsComissao: TClientDataSet;
    cdsComissaoCODIGO: TIntegerField;
    cdsComissaoREPRESENTANTE: TStringField;
    cdsComissaoMES: TIntegerField;
    cdsComissaoVLRCOMISSAO1Q: TFloatField;
    cdsComissaoVLRCOMISSAO2Q: TFloatField;
    cdsComissaoNOMEMES: TStringField;
    rld1: TRLDraw;
    qryComissao: TFDQuery;
    qryDescAc: TFDQuery;
    qryDescAcCODIGO_REPRESENTANTE: TIntegerField;
    qryDescAcANO: TIntegerField;
    qryDescAcMES: TIntegerField;
    qryDescAcDIA: TSmallintField;
    qryDescAcTIPO: TStringField;
    qryDescAcVALOR_TOTAL: TBCDField;
    cdsComissCODIGO: TIntegerField;
    cdsComissREPRESENTANTE: TStringField;
    cdsComissMES: TSmallintField;
    cdsComissVLRCOMISSAO1Q: TBCDField;
    cdsComissVLRCOMISSAO2Q: TBCDField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private

    procedure imprimir;
    function monta_sql :String;
    procedure nomea_meses;
    function meses_selecionados :String;
    procedure puxa_desconto_acrescimo(meses :String);
    procedure altera_valores_totais;
    procedure transfere_dados;
    
  public
    { Public declarations }
  end;

var
  frmRelatorioComissoesRepresentantes: TfrmRelatorioComissoesRepresentantes;

implementation

uses StrUtils, RxCurrEdit, TipoPessoa, Math, Funcoes;

{$R *.dfm}

procedure TfrmRelatorioComissoesRepresentantes.SpeedButton1Click(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmRelatorioComissoesRepresentantes.btnImprimirClick(Sender: TObject);
begin
  self.imprimir;
end;

procedure TfrmRelatorioComissoesRepresentantes.imprimir;
begin
   RLReport1.Clear;
   cdsComiss.Close;
   qryComissao.SQL.Text := monta_sql;
   qryComissao.ParamByName('ano').AsInteger := StrToInt( cbAno.Items[ cbAno.ItemIndex ]);

   if BuscaPessoa1.edtRazao.Text <> '' then
    qryComissao.ParamByName('codigo').AsInteger := BuscaPessoa1.edtCodigo.AsInteger;

   cdsComiss.Open;

   if cdsComiss.IsEmpty then begin
     avisar('Nenhum registro foi encontrado com os filtros informados');
     Exit;
   end;

   nomea_meses;
   transfere_dados;

   if not self.qryDescAc.IsEmpty then
     altera_valores_totais;

   RLReport1.Repaint;
   RLReport1.Refresh;  
   RLReport1.PreviewModal;
end;

function TfrmRelatorioComissoesRepresentantes.monta_sql :String;
var condicao_representante, meses, condicao_meses1, condicao_meses2, separa_meses :String;
begin

  if rgTipoRelatorio.ItemIndex = 0 then
    separa_meses := ' iif(p.despachado = ''S'', EXTRACT(Month FROM p.dt_despacho), EXTRACT(Month FROM nf.data_saida)) MES, '
  else
    separa_meses := ' 0 MES, ';

  condicao_representante :=  IfThen( (BuscaPessoa1.edtRazao.Text = '') , '', ' and r.codigo = :codigo ');

  meses := meses_selecionados;

  if meses <> '' then begin
    condicao_meses1 := ' and EXTRACT(Month FROM nf.data_saida) in ('+ meses + ') ';
    condicao_meses2 := ' and EXTRACT(Month FROM p.dt_despacho) in ('+ meses + ') ';
  end;

  result := 'select r.codigo, r.razao Representante, '+ separa_meses +#13#10+
            '       SUM( CAST( iif( (nfr.status = ''100'' and (EXTRACT(DAY FROM nf.data_saida) < 16)) or ( p.despachado = ''S'' and (EXTRACT(DAY FROM p.dt_despacho) < 16)), '+#13#10+
            '                       ((p.valor_total-((p.valor_total*p.desconto_comiss)/100)) * p.comissao / 100), 0 ) as numeric(15,2)) ) vlrComissao1Q, '+#13#10+
            '       SUM( CAST( iif( (nfr.status = ''100'' and (EXTRACT(DAY FROM nf.data_saida) > 15)) or ( p.despachado = ''S'' and (EXTRACT(DAY FROM p.dt_despacho) > 15)), '+#13#10+
            '                       ((p.valor_total-((p.valor_total*p.desconto_comiss)/100)) * p.comissao / 100), 0 ) as numeric(15,2)) ) vlrComissao2Q '+#13#10+
            ' from pedidos P                                                                                 '+#13#10+
            '  LEFT JOIN pedidos_faturados         PF  ON PF.CODIGO_PEDIDO = P.CODIGO                        '+#13#10+
            '  LEFT JOIN NOTAS_FISCAIS             NF  ON NF.codigo = PF.codigo_nota_fiscal                  '+#13#10+
            '  LEFT JOIN notas_fiscais_nfe_retorno nfr ON nfr.codigo_nota_fiscal = nf.codigo                 '+#13#10+
            '  LEFT JOIN pessoas                   r   on p.cod_repres = r.codigo                            '+#13#10+

            ' where ( nfr.status = ''100'' and EXTRACT(YEAR FROM nf.data_saida) = :ano '+condicao_meses1      +#13#10+
            '       OR                                                                                        '+#13#10+
            '       ( p.despachado = ''S''  and EXTRACT(YEAR FROM p.dt_despacho) = :ano '+condicao_meses2+')) '+#13#10+
            '       and not (p.cancelado = ''S'')                                                             '+#13#10+
            condicao_representante +
            ' GROUP BY r.codigo, r.razao, MES                                                                 '+#13#10+
            ' order by 1, 3                                                                                   ';

   puxa_desconto_acrescimo(meses);
end;

procedure TfrmRelatorioComissoesRepresentantes.nomea_meses;
var mes :String;
begin
  cdsComiss.First;
  while not cdsComiss.Eof do begin

    case cdsComissMES.AsInteger of
     1 : mes := 'JANEIRO';
     2 : mes := 'FEVEREIRO';
     3 : mes := 'MARÇO';
     4 : mes := 'ABRIL';
     5 : mes := 'MAIO';
     6 : mes := 'JUNHO';
     7 : mes := 'JULHO';
     8 : mes := 'AGOSTO';
     9 : mes := 'SETEMBRO';
     10: mes := 'OUTUBRO';
     11: mes := 'NOVEMBRO';
     12: mes := 'DEZEMBRO';
    end;

    cdsComiss.Edit;
    cdsComissNOMEMES.AsString := mes;
    cdsComiss.Post;

    cdsComiss.Next;
  end;
end;

function TfrmRelatorioComissoesRepresentantes.meses_selecionados: String;
var algum_selecionado :Boolean;
begin
  result := '';
  algum_selecionado := (chkJaneiro.Checked) or (chkFevereiro.Checked) or (chkMarco.Checked) or (chkAbril.Checked) or (chkMaio.Checked) or (chkJunho.Checked) or
                       (chkJulho.Checked) or (chkAgosto.Checked) or (chkSetembro.Checked) or (chkOutubro.Checked) or (chkNovembro.Checked) or (chkDezembro.Checked);

  if chkJaneiro.Checked or not algum_selecionado then begin
    result := result + ','+IntToStr( chkJaneiro.Tag );
    rld1.visible := true;
  end
  else rld1.visible := false;

  if chkFevereiro.Checked or not algum_selecionado then begin
    result := result + ','+IntToStr( chkFevereiro.Tag );
    rld2.visible := true;
  end
  else rld2.visible := false;

  if chkMarco.Checked or not algum_selecionado then begin
    result := result + ','+IntToStr( chkMarco.Tag );
    rld3.visible := true;
  end
  else rld3.visible := false;

  if chkAbril.Checked or not algum_selecionado    then begin
    result := result + ','+IntToStr( chkAbril.Tag );
    rld4.visible := true;
  end
  else rld4.visible := false;

  if chkMaio.Checked or not algum_selecionado     then begin
    result := result + ','+IntToStr( chkMaio.Tag );
    rld5.visible := true;
  end
  else rld5.visible := false;

  if chkJunho.Checked or not algum_selecionado    then begin
    result := result + ','+IntToStr( chkJunho.Tag );
    rld6.visible := true;
  end
  else rld6.visible := false;

  if chkJulho.Checked or not algum_selecionado   then begin
    result := result + ','+IntToStr( chkJulho.Tag );
    rld7.visible := true;
  end
  else rld7.visible := false;

  if chkAgosto.Checked or not algum_selecionado   then begin
    result := result + ','+IntToStr( chkAgosto.Tag );
    rld8.visible := true;
  end
  else rld8.visible := false;

  if chkSetembro.Checked or not algum_selecionado then begin
    result := result + ','+IntToStr( chkSetembro.Tag );
    rld9.visible := true;
  end
  else rld9.visible := false;

  if chkOutubro.Checked or not algum_selecionado  then begin
    result := result + ','+IntToStr( chkOutubro.Tag );
    rld10.visible := true;
  end
  else rld10.visible := false;

  if chkNovembro.Checked  or not algum_selecionado then begin
    result := result + ','+IntToStr( chkNovembro.Tag );
    rld11.visible := true;
  end
  else rld11.visible := false;

  if chkDezembro.Checked  or not algum_selecionado then begin
    result := result + ','+IntToStr( chkDezembro.Tag );
    rld12.visible := true;
  end
  else rld12.visible := false;


  result := copy(result, 2, length(result));

end;

procedure TfrmRelatorioComissoesRepresentantes.FormShow(Sender: TObject);
var origem, destino :String;
txtComando :PChar;
begin
  cdsComissao.CreateDataSet;
  BuscaPessoa1.TipoPessoa := tpRepresentante;
  cbAno.ItemIndex         := cbAno.Items.IndexOf(FormatDateTime('yyyy', Date ));
end;

procedure TfrmRelatorioComissoesRepresentantes.RLReport1BeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  if rgTipoRelatorio.ItemIndex = 1 then
    rlbMes.Caption := 'Total dos meses selecionados >>'
  else
    rlbMes.Caption := 'Mês >>';
end;

procedure TfrmRelatorioComissoesRepresentantes.puxa_desconto_acrescimo(meses: String);
var condicao_meses, condicao_representante :String;
begin

  condicao_meses := IfThen(meses = '', '', ' and crp.mes in ('+ meses + ') ');

  condicao_representante := IfThen( (BuscaPessoa1.edtRazao.Text = '') , '', ' and crp.codigo_representante = :codigo ');

  self.qryDescAc.Close;
  self.qryDescAc.SQL.Text := 'select crp.codigo_representante, crp.ano, crp.mes, EXTRACT(DAY FROM lan.data_vencimento) DIA, chl.tipo, '+#13#10+
                             '  lan.valor_total from comissao_has_lancamentos chl                                                     '+#13#10+
                             '  left join comissao_representante crp on crp.codigo = chl.codigo_comissao_representante                '+#13#10+
                             '  left join lancamentos            lan on lan.codigo = chl.codigo_lancamento                            '+#13#10+
                             'where chl.tipo in (''D'',''C'') and crp.ano = :ano                                                      '+#13#10+
                             condicao_meses + condicao_representante +
                             'order by 1, 3                                                                                           ';

  if BuscaPessoa1.edtRazao.Text <> '' then
    self.qryDescAc.ParamByName('codigo').AsInteger := BuscaPessoa1.edtCodigo.AsInteger;

  self.qryDescAc.ParamByName('ano').AsInteger := StrToInt( cbAno.Items[ cbAno.itemindex ] );  

  self.qryDescAc.Open;
end;

procedure TfrmRelatorioComissoesRepresentantes.altera_valores_totais;
begin
  self.qryDescAc.First;
  while not self.qryDescAc.Eof do begin

    if cdsComissao.Locate('CODIGO;MES', VarArrayOf([qryDescAcCODIGO_REPRESENTANTE.AsInteger, qryDescAcMES.AsInteger]), []) or
       ( rgTipoRelatorio.ItemIndex = 1 ) then begin
      cdsComissao.Edit;

      if self.qryDescAcDIA.AsInteger < 20 then //respeitando a margem da data prevista p/ 1ª quinzena, q pode ultrapassar o dia 15, mas não o dia 20
        cdsComissaoVLRCOMISSAO1Q.AsFloat := cdsComissaoVLRCOMISSAO1Q.AsFloat + IfThen(qryDescAcTIPO.AsString = 'D', -qryDescAcVALOR_TOTAL.AsFloat, +qryDescAcVALOR_TOTAL.AsFloat)
      else if self.qryDescAcDIA.AsInteger > 20 then //respeitando a margem da dt prevista p/ 2ª quinzena, q pode ser menor que o dia 30, mas não q o dia 20
        cdsComissaoVLRCOMISSAO2Q.AsFloat := cdsComissaoVLRCOMISSAO2Q.AsFloat + IfThen(qryDescAcTIPO.AsString = 'D', -qryDescAcVALOR_TOTAL.AsFloat, +qryDescAcVALOR_TOTAL.AsFloat);

      cdsComissao.Post;  
    end;

    self.qryDescAc.Next;
  end;

end;


procedure TfrmRelatorioComissoesRepresentantes.transfere_dados;
begin
  cdsComissao.EmptyDataSet;
  
  cdsComiss.First;
  while not cdsComiss.Eof do begin
    cdsComissao.Append;
    cdsComissaoCODIGO.AsInteger       := cdsComissCODIGO.AsInteger;
    cdsComissaoREPRESENTANTE.AsString := cdsComissREPRESENTANTE.AsString;
    cdsComissaoMES.AsInteger          := cdsComissMES.AsInteger;
    cdsComissaoVLRCOMISSAO1Q.AsFloat  := arredonda(cdsComissVLRCOMISSAO1Q.AsFloat);
    cdsComissaoVLRCOMISSAO2Q.AsFloat  := arredonda(cdsComissVLRCOMISSAO2Q.AsFloat);
    cdsComissaoNOMEMES.AsString       := cdsComissNOMEMES.AsString;
    cdsComissao.Post;

    cdscomiss.Next;
  end;
end;

end.
