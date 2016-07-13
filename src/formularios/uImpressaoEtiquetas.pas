unit uImpressaoEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, ExtCtrls, StdCtrls, DB, Grids, DBGrids,
  DBGridCBN, Provider, DBClient, Mask, RxToolEdit, RxCurrEdit, pngimage, RLReport, RLBarcode,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, ComObj, System.StrUtils,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmImpressaoEtiquetas = class(TfrmPadrao)
    memo3etiquetas: TMemo;
    dsCodBar: TDataSource;
    cdsCodBar: TClientDataSet;
    dspCodBar: TDataSetProvider;
    cdsCodBarCODPRODUTO: TIntegerField;
    cdsCodBarNUMERACAO: TStringField;
    cdsCodBarCODCOR: TIntegerField;
    cdsCodBarCODGRADE: TIntegerField;
    cdsCodBarCODTAMANHO: TIntegerField;
    cdsCodBarCOR: TStringField;
    cdsCodBarGRADE: TStringField;
    cdsCodBarTAMANHO: TStringField;
    comTipo: TComboBox;
    cdsCodBarPRODUTO: TStringField;
    cdsImp: TClientDataSet;
    dsImp: TDataSource;
    cdsImpCODBAR: TStringField;
    cdsImpCOR: TStringField;
    cdsImpGRADE: TStringField;
    cdsImpTAMANHO: TStringField;
    cdsImpQTDE: TIntegerField;
    cdsImpPRODUTO: TStringField;
    Memo1: TMemo;
    dsPro: TDataSource;
    cdsPro: TClientDataSet;
    dspPro: TDataSetProvider;
    dsCor: TDataSource;
    cdsCor: TClientDataSet;
    dspCor: TDataSetProvider;
    cdsCorCODCOR: TIntegerField;
    cdsCorDESCRICAO: TStringField;
    dsTam: TDataSource;
    cdsTam: TClientDataSet;
    cdsTamDESCRICAO: TStringField;
    cdsTamCODTAMANHO: TIntegerField;
    cdsProCODPRODUTO: TIntegerField;
    cdsProDESCRICAO: TStringField;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    gridCodbar: TDBGridCBN;
    GridCor: TDBGridCBN;
    gridImp: TDBGrid;
    cdsTamQtde: TIntegerField;
    gridTam: TDBGrid;
    GroupBox5: TGroupBox;
    btnAdiciona: TSpeedButton;
    btnImprimirZebra: TSpeedButton;
    cdsProREFERENCIA: TStringField;
    cdsImpREFERENCIA: TStringField;
    btnLimpa: TSpeedButton;
    cdsCorREFERENCIA: TStringField;
    chkLimpar: TCheckBox;
    labTotRef: TLabel;
    Shape2: TShape;
    edtQtde: TCurrencyEdit;
    rgTipoEtiqueta: TRadioGroup;
    gpbCaminhoLogo: TGroupBox;
    edtCaminho: TEdit;
    btnSeleciona: TSpeedButton;
    RLReport2: TRLReport;
    RLDetailGrid3: TRLDetailGrid;
    dspTam: TDataSetProvider;
    RLImage22: TRLImage;
    RLLabel127: TRLLabel;
    RLLabel129: TRLLabel;
    RLLabel130: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBBarcode1: TRLDBBarcode;
    RLDBText3: TRLDBText;
    btnImprimirLazer: TSpeedButton;
    cdsImpLaser: TClientDataSet;
    dsImpLaser: TDataSource;
    cdsImpLaserCODBAR: TStringField;
    cdsImpLaserCOR: TStringField;
    cdsImpLaserGRADE: TStringField;
    cdsImpLaserTAMANHO: TStringField;
    cdsImpLaserPRODUTO: TStringField;
    cdsImpLaserREFERENCIA: TStringField;
    RLDBMemo1: TRLDBMemo;
    RLDBMemo2: TRLDBMemo;
    qry: TFDQuery;
    cdsTamOS: TIntegerField;
    cdsImpOS: TIntegerField;
    BitBtn1: TBitBtn;
    procedure btnImprimirZebraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridImpDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gridImpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAdicionaClick(Sender: TObject);
    procedure cdsProAfterScroll(DataSet: TDataSet);
    procedure cdsCorAfterScroll(DataSet: TDataSet);
    procedure gridTamDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsTamAfterScroll(DataSet: TDataSet);
    procedure btnLimpaClick(Sender: TObject);
    procedure gridCodbarKeyPress(Sender: TObject; var Key: Char);
    procedure GridCorKeyPress(Sender: TObject; var Key: Char);
    procedure gridTamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridTamEnter(Sender: TObject);
    procedure rgTipoEtiquetaClick(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnImprimirLazerClick(Sender: TObject);
    procedure cdsTamQtdeChange(Sender: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    fCor2       :String;
    fCor        :String;
    fCodBar     :String;
    fDescProd2  :String;
    fDescProd   :String;
    fTamanho    :String;
    fReferencia :String;

    function insereInformacao(linha, texto: String):String;
    procedure imprimir;
    procedure insereAFila;
    function buscaCodBar(produto, cor, tamanho :integer):String;
    function retornaIdQuebra(texto :String; meio :integer; Left_Right :String):integer;

    procedure adicionaLista(referencia, descricao, codbarras, cor, tamanho :String; quantidade, os :integer);
    procedure preparaRegistrosLaser;
    procedure importarOrdensServico(caminho :String);
  public
    { Public declarations }
  end;

var
  frmImpressaoEtiquetas: TfrmImpressaoEtiquetas;

implementation

uses funcoes, repositorio, fabricaRepositorio, Produto, Cor, OrdemServico,
  uModulo, Tamanho;

{$R *.dfm}

procedure TfrmImpressaoEtiquetas.btnImprimirZebraClick(Sender: TObject);
begin
  imprimir;

  if chkLimpar.Checked then
    btnLimpa.Click;
end;

function TfrmImpressaoEtiquetas.insereInformacao(linha, texto: String): String;
var infAtual :String;
begin
  infAtual := '';
  Result := linha;

  Result := substituiString(linha,'_TEXTO_' ,texto);

  {   INSERE TIPO DO CODIGO DE BARRA    }
  if comTipo.ItemIndex = 1 then //EAN 13
    Result := substituiString(Result,'^BC','^BE')
  else if comTipo.ItemIndex = 2 then //COD 39
    Result := substituiString(Result,'^BC','^B3');

  {   ALINHA CONFORME TAMANHO DA INFORMAÇÃO   }
  if pos('FO005',Result) > 0 then
    Result := substituiString(Result,'FO005', 'FO'+intToStr(265-(length(texto)*12)))
  else if pos('FO290',Result) > 0 then
    Result := substituiString(Result,'FO290', 'FO'+intToStr(550-(length(texto)*12)))
  else if pos('FO575',Result) > 0 then
    Result := substituiString(Result,'FO575', 'FO'+intToStr(830-(length(texto)*12)));
    
end;

procedure TfrmImpressaoEtiquetas.FormShow(Sender: TObject);
begin
  inherited;

  cdsPro.Close;
  dspPro.DataSet := FDM.GetConsulta('select cb.codproduto, p.descricao, p.referencia from codigo_barras cb '+
                                    'inner join produtos p on p.codigo = cb.codproduto                     '+
                                    'group by cb.codproduto, p.descricao, p.referencia                     ');
  cdsPro.Open;

end;

procedure TfrmImpressaoEtiquetas.importarOrdensServico(caminho: String);
var Excel, Sheet: OleVariant;
   i, ordemServico, quantidade :integer;
   codProduto, codCor, codTamanho :integer;
   repProduto :TRepositorio;
   repCor     :TRepositorio;
   repOS      :TRepositorio;
   produto :TProduto;
   cor :TCor;
   OS  :TOrdemServico;
   tamanho, codBarras :String;
begin
  Aguarda('Importando ordens de serviço, aguarde...');

  try
    OS           := nil;
    repOS        := nil;
    repProduto   := nil;
    repCor       := nil;
    try
      Excel := CreateOleObject('Excel.Application');
      Excel.WorkBooks.Open(caminho);
      Excel.Visible := false;

    except
      on e : Exception do
        begin
          avisar('Ocorreu um erro ao abrir o arquivo.'+#13#10+ e.Message);
        end;
    end;

    try
      i := 2;
      repProduto := TFabricaRepositorio.GetRepositorio(TProduto.ClassName);
      repCor     := TFabricaRepositorio.GetRepositorio(TCor.ClassName);
      repOs      := TFabricaRepositorio.GetRepositorio(TOrdemServico.ClassName);

      btnLimpa.Click;
      dm.conexao.TxOptions.AutoCommit := false;

      while Excel.WorkBooks[1].Sheets[1].Cells[i,1].value > 0 do
      begin
        ordemServico := StrToInt(TRIM( Excel.WorkBooks[1].Sheets[1].Cells[i,1] ));
        tamanho      := TRIM( Excel.WorkBooks[1].Sheets[1].Cells[i,4] );
        tamanho      := IfThen(tamanho = 'U','UNICA', tamanho);
        quantidade   := StrToIntDef(TRIM( Excel.WorkBooks[1].Sheets[1].Cells[i,5] ) ,0);

        codProduto := strToIntDef(Campo_por_campo('PRODUTOS','CODIGO','REFERENCIA',TRIM( Excel.WorkBooks[1].Sheets[1].Cells[i,2] )) ,0);
        codCor     := strToIntDef(Campo_por_campo('CORES','CODIGO','REFERENCIA',TRIM( Excel.WorkBooks[1].Sheets[1].Cells[i,3] )) ,0);
        codTamanho := strToIntDef(Campo_por_campo('TAMANHOS','CODIGO','DESCRICAO',TRIM( Excel.WorkBooks[1].Sheets[1].Cells[i,4] )) ,0);

        if (codProduto > 0) and (codCor > 0) and (codTamanho > 0) then
        begin
          codBarras  := '';
          codbarras  := buscaCodBar(codProduto, codCor, codTamanho);

          if (codBarras <> '') and (Campo_por_campo('ORDEM_SERVICO','CODIGO','NUMERO',intToStr(ordemServico)) = '') then
          begin
            produto    := TProduto(repProduto.Get(codProduto));
            cor        := TCor(repCor.Get(codCor));

            adicionaLista(produto.Referencia,
                          produto.Descricao,
                          codbarras,
                          cor.Referencia+' '+cor.Descricao,
                          tamanho,
                          quantidade,
                          ordemServico);

            FreeAndNil(produto);
            FreeAndNil(cor);

            {se não existir OS cadastrada com esse grupo}
            if Campo_por_campo('ORDEM_SERVICO','CODIGO','NUMERO',intToStr(ordemServico)) = '' then
            begin
              OS := TOrdemServico.Create;
              OS.numero := ordemServico;
              OS.codigo_produto := codProduto;
              OS.codigo_cor     := codCor;
              OS.codigo_tamanho := codTamanho;
              OS.quantidade     := quantidade;
              repOS.Salvar(OS);
            end;
          end;
        end;

        inc(i);
      end;

    except
      on e : Exception do
        begin
          avisar('Ocorreu um erro ao importar os clientes.'+#13#10+ e.Message);
        end;
    end;

  finally
    FreeAndNil(OS);
    FreeAndNil(repOS);
    FreeAndNil(repProduto);
    FreeAndNil(repCor);
    FimAguarda;
    Excel := Unassigned;
    PostMessage(FindWindow('XLMAIN', nil), WM_CLOSE,0,0);
  end;
end;

procedure TfrmImpressaoEtiquetas.imprimir;
var
  F: TextFile;
  i, x, lin3, lin6, coluna, margem, margem_logo :integer;
  cor1, cor2, codbar, prod1, prod2, tam, ref, nomeLogo, codcor, site, os :String;
begin
  nomeLogo := '';
  site     := 'www.babyduck.com.br';
  
  if cdsImp.IsEmpty then begin
    avisar('Não há referências na fila de impressão!');
    exit;
  end;

  coluna := 1;
  lin3 := 015;  lin6 := 020;  margem_logo := 0;

  try
    cdsimp.First;
    while not cdsImp.Eof do
    begin

      for x := 1 to cdsImpQTDE.AsInteger do
      begin

        if      coluna = 1 then   margem := 260
        else if coluna = 2 then   margem := 545
        else if coluna = 3 then   margem := 825;

        cor1     := TRIM(copy(cdsImpCOR.AsString,1,retornaIdQuebra(cdsImpCOR.AsString,21,'L')));
        cor2     := TRIM(copy(cdsImpCOR.AsString,retornaIdQuebra(cdsImpCOR.AsString,21,'L'),20));
        codcor   := TRIM(copy(cor1,1,pos(' ',cor1)-1));

        cor1     := StringOfChar(' ',length(codcor)+1) + copy(cor1, pos(' ',cor1) +1, length(cor1));

        codbar   := TRIM(cdsImpCODBAR.AsString);
        prod1    := TRIM(copy(cdsImpPRODUTO.AsString,1,retornaIdQuebra(cdsImpPRODUTO.AsString,21,'L')));
        prod2    := TRIM(copy(cdsImpPRODUTO.AsString,retornaIdQuebra(cdsImpPRODUTO.AsString,21,'L'),20));
        tam      := TRIM(cdsImpTAMANHO.AsString);
        ref      := TRIM(cdsImpREFERENCIA.AsString);
        os       := cdsImpOS.AsString;
        nomeLogo := edtCaminho.Text;

        if nomeLogo <> '' then
          memo1.Lines.Add('^FO'+intToStr(margem_logo)                     +',325^XGE:'+ nomeLogo +'.GRF^FS');

        memo1.Lines.Add('^FO'+intToStr(margem-(length(cor1)*12))          +',078^ADI,15,12^FD'+cor1+'^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length(codcor)*12))        +',076^A0I,30,24^FD'+codcor+'^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length(cor2)*12))          +',056^ADI,15,12^FD'+cor2+'^FS');
        memo1.Lines.Add('^FO'+intToStr(lin3)                              +',160^ADI,15,12^FD'+codbar+'^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length(prod1)*12))         +',136^ADI,15,12^FD'+prod1+'^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length(prod2)*12))         +',111^ADI,15,12^FD'+prod2+'^FS');
        memo1.Lines.Add('^FO'+intToStr(lin6)                              +',180^BY1,3,12^BCI,90,N,N,N^FD'+codbar+'^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length('TAM: ')*12))       +',031^ADI,15,12^FDTAM: ^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length(site)*12))          +',276^ADI,15,12^FD'+site+'^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length('TAM: '+tam)*12))   +',029^A0I,30,24^FD'+tam+'^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length('REF: ')*12))       +',005^ADI,15,12^FDREF: ^FS');
        memo1.Lines.Add('^FO'+intToStr(margem-(length('REF: '+ref)*12))   +',003^A0I,30,24^FD'+ref+'^FS');

        if os <> '0' then
        begin
          memo1.Lines.Add('^FO'+intToStr(margem-(length('OS ')*12))       +',292^ADI,15,12^FDOS ^FS');
          memo1.Lines.Add('^FO'+intToStr(margem-(length('OS '+os)*12))      +',292^ADI,15,12^FD'+os+'^FS');
        end;
        lin3 := lin3 + 285;  lin6 := lin6 + 285;  margem_logo := margem_logo + 282;

        inc(coluna);

         if (coluna = 4) or ((x = cdsImpQTDE.AsInteger)and(cdsImp.RecordCount = cdsImp.RecNo)) then begin
           lin3 := 015;  lin6 := 020; margem_logo := 0;
           coluna := 1;
           memo1.Lines.Add('^XZ');
           memo1.Lines.SaveToFile(ExtractFilePath( Application.ExeName )+'\etiqueta3colunas.txt');
           WinExec(PAnsiChar(AnsiString('print :LPT1 '+ExtractFilePath( Application.ExeName )+'\etiqueta3colunas.txt')),SW_HIDE);
           sleep(600);
           memo1.Clear;
           memo1.Lines.Add('^XA');
           memo1.Lines.Add('^LH000,000');

         end;
      end;

      cdsImp.Next;
    end;

    if dm.conexao.TxOptions.AutoCommit = false then
    begin
      dm.conexao.Commit;
      dm.conexao.TxOptions.AutoCommit := true;
    end;
  Except
    on e: Exception do
       avisar('Erro ao imprimir.'+#13#10+e.Message);
  end;

end;

procedure TfrmImpressaoEtiquetas.gridImpDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if gdSelected in State then
   begin
     gridImp.Canvas.Font.Color := clBlack; //Fundo
     gridImp.Canvas.Brush.Color:= $0098E0B7; //Fonte
   end
  else
   begin
     If odd(cdsImp.RecNo) then
      begin
        gridImp.Canvas.Font.Color := clBlack;
        gridImp.Canvas.Brush.Color:= $00F0F0F0;
      end
     else
      begin
        gridImp.Canvas.Font.Color := clBlack;
        gridImp.Canvas.Brush.Color:= clWhite;
      end;
  end;

  gridImp.Canvas.FillRect(Rect);
  gridImp.Canvas.TextOut(Rect.Left + 2,Rect.Top, Column.Field.AsString);

end;

procedure TfrmImpressaoEtiquetas.insereAFila;
var codigoBarras :String;
begin
  cdsTam.First;
  while not cdsTam.Eof do begin

    codigoBarras := buscaCodBar(cdsProCODPRODUTO.AsInteger, cdsCorCODCOR.AsInteger, cdsTamCODTAMANHO.asInteger);

    if not (cdsTamQtde.AsInteger > 0) or ((cdsImp.Active) and (cdsImp.Locate('CODBAR', codigoBarras,[]))) then begin
      cdsTam.Next;
      continue;
    end;

    adicionaLista(cdsProREFERENCIA.AsString,
                  cdsProDESCRICAO.AsString,
                  codigoBarras,
                  cdsCorREFERENCIA.AsString + ' ' + cdsCorDESCRICAO.AsString,
                  cdsTamDESCRICAO.AsString,
                  cdsTamQTDE.asInteger,
                  cdsTamOS.AsInteger);

    cdsTam.Next;
  end;
end;

procedure TfrmImpressaoEtiquetas.gridImpKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_delete) and not (cdsImp.IsEmpty) and (cdsImp.Active) then begin
    edtQtde.AsInteger := edtQtde.AsInteger - cdsImpQTDE.AsInteger;
    cdsImp.Delete;
  end;
end;

procedure TfrmImpressaoEtiquetas.adicionaLista(referencia, descricao, codbarras, cor, tamanho: String; quantidade, os: integer);
begin
  if not cdsImp.Active then
    cdsImp.CreateDataSet;

  cdsImp.Append;
  cdsImpREFERENCIA.AsString := referencia;
  cdsImpPRODUTO.AsString    := descricao;
  cdsImpCODBAR.AsString     := codbarras;
  cdsImpCOR.AsString        := cor;
  //cdsImpGRADE.AsString      := cdsTamGRADE.AsString;
  cdsImpTAMANHO.AsString    := tamanho;
  cdsImpQTDE.asInteger      := quantidade;
  cdsImpOS.AsInteger        := os;
  cdsImp.Post;

  edtQtde.AsInteger := edtQtde.AsInteger + cdsImpQTDE.AsInteger;
end;

procedure TfrmImpressaoEtiquetas.BitBtn1Click(Sender: TObject);
var Dialog :TOpenDialog;
  caminho  :String;
begin
  if dm.conexao.TxOptions.AutoCommit = false then
  begin
    dm.conexao.Rollback;
    dm.conexao.TxOptions.AutoCommit := true;
  end;

  try
    caminho := '';

    Dialog            := TOpenDialog.Create(nil);
    Dialog.Title      := 'Selecione o arquivo com as ordens de serviço';
    Dialog.DefaultExt := 'xls; xlsm';

    if Dialog.Execute then
      caminho := Dialog.FileName;

    if caminho <> '' then
      importarOrdensServico(caminho);

  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TfrmImpressaoEtiquetas.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  insereAFila;
  cdsCorAfterScroll(nil);
  GridCor.SetFocus;
end;

function TfrmImpressaoEtiquetas.buscaCodBar(produto,cor,tamanho: integer): String;
begin
  fdm.qryGenerica.Close;
  fdm.qryGenerica.SQL.Text := 'select cb.numeracao from codigo_barras cb                                         '+
                              'where cb.codproduto = :codpro and cb.codcor = :codcor and cb.codtamanho = :codtam ';
  fdm.qryGenerica.ParamByName('codpro').AsInteger := produto;
  fdm.qryGenerica.ParamByName('codcor').AsInteger := cor;
  fdm.qryGenerica.ParamByName('codtam').AsInteger := tamanho;
  fdm.qryGenerica.Open;

  result := fdm.qryGenerica.fieldByName('numeracao').AsString;
end;

procedure TfrmImpressaoEtiquetas.cdsProAfterScroll(DataSet: TDataSet);
begin
  cdsCor.Close;
  dspCor.DataSet := FDM.GetConsulta('select cb.codcor, c.referencia , iif(c.desc_producao <> '''',(c.desc_producao || '' '' || c.cor),max(c.descricao)) descricao '+
                                    '                                                             from codigo_barras cb                '+
                                    'inner join cores c on c.codigo = cb.codcor                                                        '+
                                    'where cb.codproduto = :codpro                                                                     '+
                                    'group by cb.codcor, c.descricao, c.referencia, c.desc_producao, c.cor                             ');

  TFDQuery(dspCor.DataSet).ParamByName('codpro').AsInteger := cdsProCODPRODUTO.AsInteger;
  cdsCor.Open;

end;

procedure TfrmImpressaoEtiquetas.cdsCorAfterScroll(DataSet: TDataSet);
begin
  cdsTam.Close;
  dspTam.DataSet := FDM.GetConsulta('select  cb.codtamanho, t.descricao from codigo_barras cb '+
                                    'inner join tamanhos t on t.codigo = cb.codtamanho        '+
                                    'where cb.codproduto = :codpro and cb.codcor = :codcor    '+
                                    'group by cb.codtamanho, t.descricao                      ');

  TFDQuery(dspTam.DataSet).ParamByName('codpro').AsInteger := cdsProCODPRODUTO.AsInteger;
  TFDQuery(dspTam.DataSet).ParamByName('codcor').AsInteger := cdsCorCODCOR.AsInteger;
  cdsTam.Open;
end;

procedure TfrmImpressaoEtiquetas.gridTamDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if gdSelected in State then
   begin
     gridTam.Canvas.Font.Color := clBlack; //Fundo
     gridTam.Canvas.Brush.Color:= $0098E0B7; //Fonte
   end
  else
   begin
     If odd(cdsTam.RecNo) then
      begin
        gridTam.Canvas.Font.Color := clBlack;
        gridTam.Canvas.Brush.Color:= $00F0F0F0;
      end
     else
      begin
        gridTam.Canvas.Font.Color := clBlack;
        gridTam.Canvas.Brush.Color:= clWhite;
      end;
  end;

  gridTam.Canvas.FillRect(Rect);
  gridTam.Canvas.TextOut(Rect.Left + 2,Rect.Top, Column.Field.AsString);
end;

procedure TfrmImpressaoEtiquetas.cdsTamAfterScroll(DataSet: TDataSet);
begin
   if cdsTam.State in [dsInsert] then
    cdsTam.Cancel;

   cdsTamOS.ReadOnly := (cdsTamQtde.AsInteger <= 0);
end;

procedure TfrmImpressaoEtiquetas.cdsTamQtdeChange(Sender: TField);
begin
  if (Sender.Value <= 0) then
  begin
    if cdsTamOS.AsInteger > 0 then
      cdsTamOS.Clear;

    cdsTamOS.ReadOnly := true;
  end
  else
    cdsTamOS.ReadOnly := false;
end;

procedure TfrmImpressaoEtiquetas.btnLimpaClick(Sender: TObject);
begin
  if cdsImp.Active then
    cdsImp.EmptyDataSet;

  if cdsImpLaser.Active then
    cdsImpLaser.EmptyDataSet;
    
  edtQtde.Clear;
end;

function TfrmImpressaoEtiquetas.retornaIdQuebra(texto: String;
  meio: integer; Left_Right: String): integer;
var i, pos :integer;
begin
  i := 1;

  if length(trim(texto)) < 22 then begin
    result := 21;
    exit;
  end;

  while i < meio do begin

    if Left_Right = 'L' then
      pos := meio-i
    else if Left_Right = 'R' then
      pos := meio + 1;

    if texto[pos] = ' ' then begin
      result := pos;
      break;
    end;

    inc(i);

  end;

end;

procedure TfrmImpressaoEtiquetas.gridCodbarKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
    gridCor.SetFocus;
end;

procedure TfrmImpressaoEtiquetas.GridCorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    gridTam.SetFocus;

end;

procedure TfrmImpressaoEtiquetas.gridTamKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = 65 then begin
      GridCor.SetFocus;
      btnAdiciona.Click
    end;
end;

procedure TfrmImpressaoEtiquetas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dm.conexao.TxOptions.AutoCommit = false then
  begin
    dm.conexao.Rollback;
    dm.conexao.TxOptions.AutoCommit := true;
  end;
end;

procedure TfrmImpressaoEtiquetas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( (ssCtrl in Shift) AND (Key = ord('A')) ) then  btnAdiciona.Click;
end;

procedure TfrmImpressaoEtiquetas.gridTamEnter(Sender: TObject);
begin
  cdsTam.RecNo := 1;
  gridTam.SelectedIndex := 0;
end;

procedure TfrmImpressaoEtiquetas.rgTipoEtiquetaClick(Sender: TObject);
begin
  gpbCaminhoLogo.Visible := (rgTipoEtiqueta.ItemIndex = 1);

  if not gpbCaminhoLogo.Visible then
    edtCaminho.Clear;
end;

procedure TfrmImpressaoEtiquetas.btnSelecionaClick(Sender: TObject);
var Dialog :TOpenDialog;
  caminho  :String;
begin
  try
    caminho := '';

    Dialog            := TOpenDialog.Create(nil);
    Dialog.Title      := 'Selecione a Logomarca';
    Dialog.DefaultExt := 'png';
    Dialog.Filter     := 'Logomarca para etiqueta | *.png';

    if Dialog.Execute then
      caminho := Dialog.FileName;

    if caminho <> '' then
      edtCaminho.Text := copy(ExtractFileName(caminho), 1, length(ExtractFileName(caminho)) - 4);

  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TfrmImpressaoEtiquetas.btnImprimirLazerClick(Sender: TObject);
begin
  if cdsImp.IsEmpty then begin
    avisar('Não há referências na fila de impressão!');
    exit;
  end;

  preparaRegistrosLaser;

  RLReport2.PreviewModal;

  if chkLimpar.Checked then
    btnLimpa.Click;
end;

procedure TfrmImpressaoEtiquetas.preparaRegistrosLaser;
var nX :integer;
begin

  if not cdsImpLaser.Active then
    cdsImpLaser.CreateDataSet
  else
    cdsImpLaser.EmptyDataSet;

  cdsImp.First;
  while not cdsImp.Eof do begin

    for nX := 0 to cdsImpQTDE.AsInteger -1 do begin
      cdsImpLaser.Append;
      cdsImpLaserCODBAR.AsString     := cdsImpCODBAR.AsString;
      cdsImpLaserCOR.AsString        := cdsImpCOR.AsString;
      cdsImpLaserGRADE.AsString      := cdsImpGRADE.AsString;
      cdsImpLaserTAMANHO.AsString    := cdsImpTAMANHO.AsString;
      cdsImpLaserPRODUTO.AsString    := cdsImpPRODUTO.AsString;
      cdsImpLaserREFERENCIA.AsString := cdsImpREFERENCIA.AsString;
      cdsImpLaser.Post;
    end;

    cdsImp.Next;
  end;
  
  cdsImp.First;
end;

end.

