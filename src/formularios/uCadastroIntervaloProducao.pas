unit uCadastroIntervaloProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, DB, DBClient, StdCtrls, Grids, DBGrids,
  DBGridCBN, ComCtrls, Buttons, ExtCtrls, Mask, ContNrs;

type
  TfrmCadastroIntervaloProducao = class(TfrmCadastroPadrao)
    edtHoraInicio: TMaskEdit;
    edtHoraFim: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cdsCODIGO: TIntegerField;
    cdsHORA_INICIO: TTimeField;
    cdsHORA_FIM: TTimeField;
    edtCodigo: TEdit;
    procedure edtHoraInicioExit(Sender: TObject);
    procedure edtHoraFimExit(Sender: TObject);
  private
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

  private
    function verifica_transgressao(hora :TDateTime) :Boolean;  
  end;

var
  frmCadastroIntervaloProducao: TfrmCadastroIntervaloProducao;

implementation

uses IntervaloProducao, Repositorio, FabricaRepositorio;

{$R *.dfm}

{ TfrmCadastroIntervaloProducao }

procedure TfrmCadastroIntervaloProducao.AlterarRegistroNoCDS(Registro: TObject);
var
  Intervalo :TIntervaloProducao;
begin
  inherited;

  Intervalo := (Registro as TIntervaloProducao);

  self.cds.Edit;
  self.cdsCODIGO.AsInteger       := Intervalo.codigo;
  self.cdsHORA_INICIO.AsDateTime := Intervalo.hora_inicio;
  self.cdsHORA_FIM.AsDateTime    := Intervalo.hora_fim;
  self.cds.Post;
end;

procedure TfrmCadastroIntervaloProducao.CarregarDados;
var
  Intervalos  :TObjectList;
  Repositorio :TRepositorio;
  nX          :Integer;
begin
  inherited;

  Repositorio := nil;
  Intervalos  := nil;

  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TIntervaloProducao.ClassName);
    Intervalos  := Repositorio.GetAll;

    if Assigned(Intervalos) and (Intervalos.Count > 0) then begin

       for nX := 0 to (Intervalos.Count-1) do
         self.IncluirRegistroNoCDS(Intervalos.Items[nX]);
         
    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Intervalos);
  end;
end;

procedure TfrmCadastroIntervaloProducao.ExecutarDepoisAlterar;
begin
  inherited;
  edtHoraInicio.SetFocus;
end;

procedure TfrmCadastroIntervaloProducao.ExecutarDepoisIncluir;
begin
  inherited;
  edtHoraInicio.SetFocus;
end;

function TfrmCadastroIntervaloProducao.GravarDados: TObject;
var
  Intervalo             :TIntervaloProducao;
  RepositorioIntervalo  :TRepositorio;
begin
   Intervalo             := nil;
   RepositorioIntervalo  := nil;

   try
     RepositorioIntervalo  := TFabricaRepositorio.GetRepositorio(TIntervaloProducao.ClassName);
     Intervalo             := TIntervaloProducao(RepositorioIntervalo.Get(StrToIntDef(self.edtCodigo.Text, 0)));

     if not Assigned(Intervalo) then
      Intervalo := TIntervaloProducao.Create;

     Intervalo.hora_inicio   := StrToTime(self.edtHoraInicio.Text);
     Intervalo.hora_fim      := StrToTime(self.edtHoraFim.Text);

     RepositorioIntervalo.Salvar(Intervalo);

     result := Intervalo;

   finally
     FreeAndNil(RepositorioIntervalo);

   end;
end;

procedure TfrmCadastroIntervaloProducao.IncluirRegistroNoCDS(Registro: TObject);
var
  Intervalo :TIntervaloProducao;
begin
  inherited;

  Intervalo := (Registro as TIntervaloProducao);

  self.cds.Append;
  self.cdsCODIGO.AsInteger       := Intervalo.codigo;
  self.cdsHORA_INICIO.AsDateTime := Intervalo.hora_inicio;
  self.cdsHORA_FIM.AsDateTime    := Intervalo.hora_fim;
  self.cds.Post;
end;

procedure TfrmCadastroIntervaloProducao.LimparDados;
begin
  inherited;
  edtHoraInicio.Clear;
  edtHoraFim.Clear;
end;

procedure TfrmCadastroIntervaloProducao.MostrarDados;
var
  Intervalo                 :TIntervaloProducao;
  RepositorioIntervalo      :TRepositorio;
begin
  inherited;

  Intervalo                              := nil;
  RepositorioIntervalo                   := nil;

  try
    RepositorioIntervalo  := TFabricaRepositorio.GetRepositorio(TIntervaloProducao.ClassName);

    Intervalo             := TIntervaloProducao(RepositorioIntervalo.Get(self.cdsCODIGO.AsInteger));

    if not Assigned(Intervalo) then exit;

    self.edtCodigo.Text          := IntToStr(Intervalo.codigo);
    self.edtHoraInicio.Text      := FormatDateTime('hh:mm',Intervalo.hora_inicio);
    self.edtHoraFim.Text         := FormatDateTime('hh:mm',Intervalo.hora_fim);

  finally
    FreeAndNil(RepositorioIntervalo);
    FreeAndNil(Intervalo);
  end;
end;

function TfrmCadastroIntervaloProducao.VerificaDados: Boolean;
begin
  result := false;

  if trim(edtHoraInicio.Text) = ':' then begin
    avisar('Favor informar a hora inicial do intervalo');
    edtHoraInicio.SetFocus;
  end
  {else if verifica_transgressao(StrToTime(edtHoraInicio.Text)) then
    edtHoraInicio.SetFocus
  else if verifica_transgressao(StrToTime(edtHoraFim.Text)) then
    edtHoraFim.SetFocus    }
  else if trim(edtHoraFim.Text) = ':' then begin
    avisar('Favor informar a hora final do intervalo');
    edtHoraFim.SetFocus;
  end
  else
    result := true;

end;

procedure TfrmCadastroIntervaloProducao.edtHoraInicioExit(Sender: TObject);
begin
  try
    if (trim(edtHoraInicio.Text) = ':') then
      Exit;

    strToTime(edtHoraInicio.Text);

    if (trim(edtHoraFim.Text) <> ':') and (StrToTime(edtHoraInicio.Text) >= StrToTime(edtHoraFim.Text)) then begin
      avisar('Hora inicial deve ser menor que a final');
      edtHoraInicio.SetFocus;
    end;
  except
    avisar('Hora inválida');
    edtHoraInicio.Clear;
  end;
end;

procedure TfrmCadastroIntervaloProducao.edtHoraFimExit(Sender: TObject);
begin
  try
    if (trim(edtHoraFim.Text) = ':') then
      Exit;

    strToTime(edtHoraFim.Text);

    if (trim(edtHoraInicio.Text) <> ':') and (StrToTime(edtHoraInicio.Text) >= StrToTime(edtHoraFim.Text)) then begin
      avisar('Hora final deve ser maior que a inicial');
      edtHoraFim.SetFocus;
    end;
  except
    avisar('Hora inválida');
    edtHoraFim.Clear;
  end;
end;

function TfrmCadastroIntervaloProducao.verifica_transgressao(hora: TDateTime): Boolean;
begin
 //
end;

end.
