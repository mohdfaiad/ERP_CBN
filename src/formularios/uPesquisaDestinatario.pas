unit uPesquisaDestinatario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, DB, DBClient, StdCtrls, Grids, DBGrids,
  DBGridCBN, ComCtrls, Buttons, ExtCtrls, Especificacao;

type
  TfrmPesquisaDestinatario = class(TfrmCadastroPadrao)
    cdsNOME_RAZAO: TStringField;
    cdsCPF_CNPJ: TStringField;
    cdsRG_IE: TStringField;
    cdsCODIGO: TIntegerField;

  private
   { Carrega os registros de acordo com uma especificação. É utilizado apenas no modo de busca. }
    procedure CarregarDados(Especificacao :TEspecificacao); override;

    procedure ExecutarDepoisPesquisar;  override;

    { Inclui um registro no CDS }
    procedure IncluirRegistroNoCDS(Registro :TObject); override;
end;

var
  frmPesquisaDestinatario: TfrmPesquisaDestinatario;

implementation

uses
   Pessoa,
   Repositorio,
   FabricaRepositorio,
   Contnrs;

{$R *.dfm}

{ TfrmCadastroPadrao1 }

procedure TfrmPesquisaDestinatario.CarregarDados(Especificacao: TEspecificacao);
var
  Destinatarios :TObjectList;
  Repositorio   :TRepositorio;
  nX            :Integer;
begin
  Repositorio   := nil;
  Destinatarios := nil;

  try
    Repositorio   := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
    Destinatarios := Repositorio.GetListaPorEspecificacao(self.FEspecificacaoDeBusca);

    if Assigned(Destinatarios) and (Destinatarios.Count > 0) then begin

       for nX := 0 to (Destinatarios.Count-1) do
         self.IncluirRegistroNoCDS(Destinatarios.Items[nX]);

    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Destinatarios);
  end;
end;

procedure TfrmPesquisaDestinatario.ExecutarDepoisPesquisar;
var
  nX :Integer;
begin
  inherited;

  for nX := 0 to (self.gridConsulta.Columns.Count-1) do begin
     if (self.gridConsulta.Columns[nX].FieldName = 'CODIGO') then
       self.gridConsulta.Columns.Delete(nX);
  end;
end;

procedure TfrmPesquisaDestinatario.IncluirRegistroNoCDS(Registro: TObject);
var
  Destinatario :TPessoa;
begin
  Destinatario := (Registro as TPessoa);

  self.cds.Append;
  self.cdsCODIGO.AsInteger    := Destinatario.Codigo;
  self.cdsNOME_RAZAO.AsString := Destinatario.Razao;
  self.cdsCPF_CNPJ.AsString   := Destinatario.CPF_CNPJ;
  self.cdsRG_IE.AsString      := Destinatario.RG_IE;  
  self.cds.Post;
end;

end.
