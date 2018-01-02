object frmAlteraCaixas: TfrmAlteraCaixas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Caixas do Pedido'
  ClientHeight = 341
  ClientWidth = 692
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 8
    Width = 249
    Height = 18
    Caption = 'Selecione a caixa desejada para altera-la'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object gridCaixas: TDBGridCBN
    Left = 8
    Top = 32
    Width = 669
    Height = 177
    Color = 14803425
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    BuscaHabilitada = False
    ConfCores.Normal.CorFonte = clWindowText
    ConfCores.Normal.CorFundo = 14803425
    ConfCores.Normal.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Normal.Tipo.Color = clWindowText
    ConfCores.Normal.Tipo.Height = -11
    ConfCores.Normal.Tipo.Name = 'MS Sans Serif'
    ConfCores.Normal.Tipo.Style = []
    ConfCores.Zebrada.CorFonte = clWindowText
    ConfCores.Zebrada.CorFundo = clWhite
    ConfCores.Zebrada.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Zebrada.Tipo.Color = clWindowText
    ConfCores.Zebrada.Tipo.Height = -11
    ConfCores.Zebrada.Tipo.Name = 'MS Sans Serif'
    ConfCores.Zebrada.Tipo.Style = []
    ConfCores.Selecao.CorFonte = clWindowText
    ConfCores.Selecao.CorFundo = 16037533
    ConfCores.Selecao.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Selecao.Tipo.Color = clWindowText
    ConfCores.Selecao.Tipo.Height = -11
    ConfCores.Selecao.Tipo.Name = 'MS Sans Serif'
    ConfCores.Selecao.Tipo.Style = []
    ConfCores.Destacado.CorFonte = 8650884
    ConfCores.Destacado.CorFundo = clWhite
    ConfCores.Destacado.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Destacado.Tipo.Color = 8650884
    ConfCores.Destacado.Tipo.Height = -11
    ConfCores.Destacado.Tipo.Name = 'Lucida Console'
    ConfCores.Destacado.Tipo.Style = [fsBold]
    ConfCores.Titulo.CorFonte = clWindowText
    ConfCores.Titulo.CorFundo = clBtnFace
    ConfCores.Titulo.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Titulo.Tipo.Color = clWindowText
    ConfCores.Titulo.Tipo.Height = -11
    ConfCores.Titulo.Tipo.Name = 'MS Sans Serif'
    ConfCores.Titulo.Tipo.Style = []
    Ordenavel = False
    TipoBusca.ListarApenasEncontrados = False
    TipoBusca.QualquerParte = False
    SalvaConfiguracoes = False
    Columns = <
      item
        Expanded = False
        FieldName = 'NCAIXA'
        Title.Caption = 'N'#186' Caixa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_MATERIA'
        Title.Caption = 'C'#243'd. da Mat'#233'ria'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATERIA'
        Title.Caption = 'Descri'#231#227'o da Mat'#233'ria'
        Width = 455
        Visible = True
      end>
  end
  object gpbMateria: TGroupBox
    Left = 8
    Top = 246
    Width = 669
    Height = 88
    Caption = ' Selecione a Mat'#233'ria correspondente a Caixa '
    TabOrder = 1
    object btnConfirmar: TBitBtn
      Left = 504
      Top = 45
      Width = 78
      Height = 25
      Caption = 'Confirmar'
      Enabled = False
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    inline BuscaMateria1: TBuscaMateria
      Left = 48
      Top = 30
      Width = 428
      Height = 39
      AutoSize = True
      TabOrder = 1
      ExplicitLeft = 48
      ExplicitTop = 30
      ExplicitWidth = 428
      inherited edtDescricao: TEdit
        Width = 313
        ExplicitWidth = 313
      end
    end
  end
  object btnAlterar: TBitBtn
    Left = 512
    Top = 215
    Width = 78
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = btnAlterarClick
  end
  object btnCancelar: TBitBtn
    Left = 599
    Top = 215
    Width = 78
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 646
    Top = 8
    object cdsINDEX: TSmallintField
      FieldName = 'INDEX'
    end
    object cdsNCAIXA: TIntegerField
      FieldName = 'NCAIXA'
    end
    object cdsCODIGO_MATERIA: TIntegerField
      FieldName = 'CODIGO_MATERIA'
    end
    object cdsMATERIA: TStringField
      FieldName = 'MATERIA'
      Size = 40
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 646
    Top = 64
  end
end
