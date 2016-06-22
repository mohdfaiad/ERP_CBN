unit uGeraCodigoBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls;

type
  TfrmGeraCodigoBarras = class(TfrmPadrao)
    Panel1: TPanel;
    btnGerarCodigo: TSpeedButton;
    btnImprimir: TSpeedButton;
    edtCodigo: TEdit;
    comTipo: TComboBox;
    memo3etiquetas: TMemo;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fCor2       :String;
    fCor        :String;
    fCodBar     :String;
    fDescProd2  :String;
    fDescProd   :String;
    fTamanho    :String;
    fReferencia :String;

    function insereInformacao(linha: String):String;
  public
    { Public declarations }
  end;

var
  frmGeraCodigoBarras: TfrmGeraCodigoBarras;

implementation

uses funcoes;

{$R *.dfm}

procedure TfrmGeraCodigoBarras.btnImprimirClick(Sender: TObject);
var
  F: TextFile;
  i :integer;
begin

  AssignFile(f,'D:\Sistemas\Delphi\ERP_CBN\etiqueta3colunas.txt');

  Rewrite(f); //abre o arquivo para escrita

  for i:=0 to memo3etiquetas.Lines.Count - 1 do begin

    Writeln(f, insereInformacao(memo3etiquetas.Lines.Strings[i]) );

  end;

  Closefile(f); //fecha o handle de arquivo

  WinExec(PChar('command.com /c print D:\Sistemas\Delphi\ERP_CBN\etiqueta3colunas.txt'),SW_HIDE);

end;

function TfrmGeraCodigoBarras.insereInformacao(linha: String): String;
var infAtual :String;
begin
  infAtual := '';
  Result := linha;

  {   INSERE INFORMAÇÕES DO PRODUTO    }
  if pos('_COR2_',linha) > 0 then begin
    Result := substituiString(linha,'_COR2_'      ,fCor2);
    infAtual := fCor2;
  end
  else if pos('_COR_',linha) > 0 then begin
    Result := substituiString(linha,'_COR_'       ,fCor);
    infAtual := fCor;
  end
  else if pos('_CODBAR_',linha) > 0 then begin
    Result := substituiString(linha,'_CODBAR_'    ,fCodBar);
    infAtual := fCodBar;
  end
  else if pos('_DESCPROD2_',linha) > 0 then begin
    Result := substituiString(linha,'_DESCPROD2_' ,fDescProd2);
    infAtual := fDescProd2;
  end
  else if pos('_DESCPROD_',linha) > 0 then begin
    Result := substituiString(linha,'_DESCPROD_'  ,fDescProd);
    infAtual := fDescProd;
  end
  else if pos('_TAMANHO_',linha) > 0 then begin
    Result := substituiString(linha,'_TAMANHO_'   ,fTamanho);
    infAtual := fTamanho;
  end
  else if pos('_REFERENCIA_',linha) > 0 then begin
    Result := substituiString(linha,'_REFERENCIA_',fReferencia);
    infAtual := fReferencia;
  end;

  {   INSERE TIPO DO CODIGO DE BARRA    }
  IF comTipo.ItemIndex = 1 then //EAN 13
    Result := substituiString(Result,'^BC','^BE')
  ELSE IF comTipo.ItemIndex = 2 then //COD 39
    Result := substituiString(Result,'^BC','^B3');

  {   ALINHA CONFORME TAMANHO DA INFORMAÇÃO   }
  IF pos('FO005',Result) > 0 then
    Result := substituiString(Result,'FO005', 'FO'+intToStr(265-(length(infAtual)*12)))
  ELSE IF pos('FO290',Result) > 0 then
    Result := substituiString(Result,'FO290', 'FO'+intToStr(550-(length(infAtual)*12)))
  ELSE IF pos('FO575',Result) > 0 then
    Result := substituiString(Result,'FO575', 'FO'+intToStr(830-(length(infAtual)*12)));


end;

procedure TfrmGeraCodigoBarras.FormCreate(Sender: TObject);
begin
  inherited;
  fCor2       := 'cor1';
  fCor        := 'cor2';
  fCodBar     := edtCodigo.Text;
  fDescProd2  := 'descricao1';
  fDescProd   := 'descricao2';
  fTamanho    := 'TAM: '+'tamanho';
  fReferencia := 'REF: '+'referencia';
end;

end.
