unit uPesquisaTransportadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, DB, DBClient, StdCtrls, Grids, DBGrids,
  DBGridCBN, ComCtrls, Buttons, ExtCtrls, Especificacao;

type
  TfrmPesquisaTransportadora = class(TfrmCadastroPadrao)
    cdsCODIGO: TIntegerField;
    cdsRAZAO_SOCIAL: TStringField;

  private
   { Carrega os registros de acordo com uma especificação. É utilizado apenas no modo de busca. }
    procedure CarregarDados(Especificacao :TEspecificacao); override;

    procedure ExecutarDepoisPesquisar;  override;

    { Inclui um registro no CDS }
    procedure IncluirRegistroNoCDS(Registro :TObject); override;
end;

var
  frmPesquisaTransportadora: TfrmPesquisaTransportadora;

implementation

uses
  Pessoa,
  Repositorio,
  FabricaRepositorio,
  Contnrs;

{$R *.dfm}

{ TfrmPesquisaTransportadora }

procedure TfrmPesquisaTransportadora.CarregarDados(
  Especificacao: TEspecificacao);
var
  Transportadoras :TObjectList;
  Repositorio     :TRepositorio;
  nX              :Integer;
begin
  Repositorio     := nil;
  Transportadoras := nil;

  try
    Repositorio     := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
    Transportadoras := Repositorio.GetListaPorEspecificacao(self.FEspecificacaoDeBusca);

    if Assigned(Transportadoras) and (Transportadoras.Count > 0) then begin

       for nX := 0 to (Transportadoras.Count-1) do
         self.IncluirRegistroNoCDS(Transportadoras.Items[nX]);

    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Transportadoras);
  end;

end;

procedure TfrmPesquisaTransportadora.ExecutarDepoisPesquisar;
var
  nX :Integer;
begin
  inherited;
  
  for nX := 0 to (self.gridConsulta.Columns.Count-1) do begin
     if (self.gridConsulta.Fields[nX].FieldName = 'CODIGO') then
       self.gridConsulta.Columns.Delete(nX);
  end;
end;

procedure TfrmPesquisaTransportadora.IncluirRegistroNoCDS(
  Registro: TObject);
var
  Transportadora :TPessoa;
begin
  Transportadora := (Registro as TPessoa);

  self.cds.Append;
  self.cdsCODIGO.AsInteger    := Transportadora.Codigo;
  self.cdsRAZAO_SOCIAL.AsString := Transportadora.Razao;
  self.cds.Post;
end;

end.
