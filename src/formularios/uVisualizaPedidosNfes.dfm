object frmVisualizaPedidosNfes: TfrmVisualizaPedidosNfes
  Left = 0
  Top = 0
  Caption = 'frmVisualizaPedidosNfes'
  ClientHeight = 672
  ClientWidth = 1138
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
  object Splitter1: TSplitter
    AlignWithMargins = True
    Left = 3
    Top = 371
    Width = 1132
    Height = 8
    Cursor = crVSplit
    Align = alBottom
    Color = clSilver
    ParentColor = False
    OnCanResize = Splitter1CanResize
    ExplicitTop = 374
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 382
    Width = 1138
    Height = 290
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      1138
      290)
    object Label3: TLabel
      Left = 8
      Top = 14
      Width = 85
      Height = 13
      Caption = 'NOTAS FISCAIS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 1024
      Top = 270
      Width = 105
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'NF-es encontradas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13328150
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 263
    end
    object gbFiltroStatus: TGroupBox
      Left = 115
      Top = -1
      Width = 611
      Height = 36
      Caption = ' Status '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        611
        36)
      object chkFiltroAguardandoEnvio: TCheckBox
        Left = 54
        Top = 14
        Width = 123
        Height = 17
        TabStop = False
        Anchors = [akLeft]
        Caption = 'Aguardando envio'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 0
        OnClick = chkFiltroAguardandoEnvioClick
      end
      object chkFiltroRejeitada: TCheckBox
        Left = 206
        Top = 14
        Width = 75
        Height = 17
        TabStop = False
        Anchors = [akLeft]
        Caption = 'Rejeitadas'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 230
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 1
        OnClick = chkFiltroAguardandoEnvioClick
      end
      object chkFiltroAutorizada: TCheckBox
        Left = 449
        Top = 14
        Width = 88
        Height = 17
        TabStop = False
        Anchors = [akLeft]
        Caption = 'Autorizadas'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 43520
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 2
        OnClick = chkFiltroAguardandoEnvioClick
      end
      object chkFiltroCancelada: TCheckBox
        Left = 330
        Top = 14
        Width = 79
        Height = 17
        TabStop = False
        Anchors = [akLeft]
        Caption = 'Canceladas'
        Checked = True
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9539985
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        State = cbChecked
        TabOrder = 3
        OnClick = chkFiltroAguardandoEnvioClick
      end
    end
    object edtQtdNotas: TCurrencyEdit
      Left = 976
      Top = 268
      Width = 42
      Height = 22
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13328150
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Anchors = [akRight, akBottom]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBGridCBN2: TDBGridCBN
      Left = 8
      Top = 38
      Width = 1122
      Height = 230
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 14803425
      DataSource = dsNotas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      BuscaHabilitada = True
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
      Ordenavel = True
      TipoBusca.ListarApenasEncontrados = False
      TipoBusca.QualquerParte = False
      SalvaConfiguracoes = True
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMERO_NOTA_FISCAL'
          Title.Caption = 'N'#186' Nota'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_EMISSAO'
          Title.Caption = 'Dt. Faturamento'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Title.Caption = 'Status'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMITENTE'
          Title.Caption = 'Emitente'
          Width = 328
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESTINATARIO'
          Title.Caption = 'Destinat'#225'rio'
          Width = 338
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = 'Valor'
          Visible = True
        end>
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 1138
    Height = 368
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      1138
      368)
    object Label2: TLabel
      Left = 8
      Top = 98
      Width = 49
      Height = 13
      Caption = 'PEDIDOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 1009
      Top = 347
      Width = 118
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Pedidos encontrados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13328150
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGridCBN1: TDBGridCBN
      Left = 8
      Top = 113
      Width = 1122
      Height = 231
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 14803425
      DataSource = dsPedidos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      BuscaHabilitada = True
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
      Ordenavel = True
      TipoBusca.ListarApenasEncontrados = False
      TipoBusca.QualquerParte = False
      SalvaConfiguracoes = True
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMPEDIDO'
          Title.Caption = 'N'#186' Pedido'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_CADASTRO'
          Title.Caption = 'Dt. Cadastro'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_REPRESENTANTE'
          Title.Caption = 'Dt. Representante'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_RECEBIMENTO'
          Title.Caption = 'Dt. Recebimento'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_ENTREGA'
          Title.Caption = 'Dt. Entrega'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_LIMITE_ENTREGA'
          Title.Caption = 'Dt. Limite Entrega'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_APROVACAO'
          Title.Caption = 'Dt. Aprova'#231#227'o'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCONTO'
          Title.Caption = 'Desconto'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCONTO_FPGTO'
          Title.Caption = 'Desconto F. Pgto'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACRESCIMO'
          Title.Caption = 'Acr'#233'scimo'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Title.Caption = 'Valor Total'
          Width = 160
          Visible = True
        end>
    end
    object edtQtdPedidos: TCurrencyEdit
      Left = 961
      Top = 345
      Width = 42
      Height = 22
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13328150
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Anchors = [akRight, akBottom]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object gpbCliente: TGroupBox
      Left = 580
      Top = 10
      Width = 480
      Height = 84
      TabOrder = 2
      inline BuscaPessoa1: TBuscaPessoa
        Left = 15
        Top = 23
        Width = 451
        Height = 38
        AutoSize = True
        TabOrder = 0
        ExplicitLeft = 15
        ExplicitTop = 23
        ExplicitWidth = 451
        inherited edtCodigo: TCurrencyEdit
          Width = 59
          ExplicitWidth = 59
        end
        inherited StaticText2: TStaticText
          Left = 88
          ExplicitLeft = 88
        end
        inherited btnBuscar: TBitBtn
          Left = 60
          ExplicitLeft = 60
        end
        inherited edtRazao: TEdit
          Left = 87
          Width = 364
          ExplicitLeft = 87
          ExplicitWidth = 364
        end
      end
    end
    object rgPedido: TRadioGroup
      Left = 464
      Top = 4
      Width = 109
      Height = 91
      Caption = ' Filtro Pedidos '
      ItemIndex = 0
      Items.Strings = (
        'Faturados'
        'N'#227'o faturados'
        'Todos')
      TabOrder = 3
    end
    object gbFiltroPeriodo: TGroupBox
      Left = 8
      Top = 4
      Width = 449
      Height = 90
      Caption = 
        '                                                                ' +
        '             [ Per'#237'odo ]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object lblFiltroDataFinal: TLabel
        Left = 266
        Top = 43
        Width = 52
        Height = 13
        Caption = 'Data Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFiltroDataInicial: TLabel
        Left = 266
        Top = 17
        Width = 57
        Height = 13
        Caption = 'Data Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 232
        Top = 55
        Width = 216
        Height = 14
        Caption = '____________________________________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14869218
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object dtpFiltroDataFinal: TDateTimePicker
        Left = 332
        Top = 40
        Width = 89
        Height = 23
        Date = 41523.559567326390000000
        Time = 41523.559567326390000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = False
      end
      object dtpFiltroDataInicial: TDateTimePicker
        Left = 331
        Top = 13
        Width = 89
        Height = 23
        Date = 41523.559567326390000000
        Time = 41523.559567326390000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = False
      end
      object rgTipoData: TRadioGroup
        Left = 0
        Top = 0
        Width = 224
        Height = 90
        Caption = ' Filtrar por data de: '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Cadastro'
          'Representante'
          'Recebimento'
          'Limite Entrega'
          'Despacho')
        TabOrder = 2
      end
      object chkPeriodoGeral: TCheckBox
        Left = 248
        Top = 69
        Width = 172
        Height = 17
        TabStop = False
        Caption = ' Considerar per'#237'odo geral'
        TabOrder = 3
        OnClick = chkPeriodoGeralClick
      end
    end
    object btnFiltrar: TBitBtn
      Left = 1066
      Top = 10
      Width = 63
      Height = 85
      Caption = 'Filtrar'
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B4682200D09D7400F0E2D900FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B00500400006C3910008C7E75009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0933C00E8A52700AD570F00BC7B
        4C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B006C2F000084410000490000005817
        00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CD903F00EAAF3000BD660E00B562
        1700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B00692C0000864B0000590200005100
        00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0944600E9B23E00C06B1400BA67
        1D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B006C300000854E00005C0700005603
        00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2994A00ECB84900C6711B00BE6B
        1F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B006E35000088540000620D00005A07
        00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D59C4E00EEBF5300CB782000C26F
        2200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B00713800008A5B0000671400005E0B
        00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8A25300F1C45F00CE7E2400C77A
        2700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B00743E00008D6000006A1A00006316
        00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DAA55800F2C86600D1842A00CB7F
        2C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B00764100008E6402006D200000671B
        00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00E2B88B00EAC68100EFC26100DA983A00CB78
        2400E3BD8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B007E54270086621D008B5E0000763400006714
        00007F592A009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EFD6B900E9C58800F3CF7600EFC26400E7B35800D17D
        2600D58C3300F1DBC000FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B008B725500856124008F6B12008B5E0000834F00006D19
        0000712800008D775C009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00F5E5D200E5BB7C00F8DB8F00EEC46300EFC76C00F2C96C00DC93
        3700D5852C00D9983C00F6E7D600FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B0091816E008157180094772B008A6000008B6308008E650800782F
        00007121000075340000928372009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FDF7F000E1AC5A00F8DE9100F1C55D00F2C66600F1C36300F4CB6A00E8AF
        4400D9851D00DF933100E19F4000FEFBF600FFFFFF00FFFFFF009B9B9B009B9B
        9B0099938C007D480000947A2D008D6100008E6202008D5F000090670600844B
        0000752100007B2F00007D3B00009A9792009B9B9B009B9B9B00FFFFFF00FFFF
        FF00E5B46C00FBEEC300FAE8B900F7E8C600F5EEE000F3F0EA00F1EDE900EEE9
        DB00DAA96400D6A25900E0AB5D00E4B06100FFFFFF00FFFFFF009B9B9B009B9B
        9B0081500800978A5F009684550093846200918A7C008F8C86008D8985008A85
        770076450000723E00007C470000804C00009B9B9B009B9B9B00FBF3E700ECC9
        9000FEFEFA00FFFFFF00F6F4F300F2F3F400EEE9DF00E7D5AA00E2CFA100E6E2
        D700D9C9A800CFB27800CAB79600D3C4AD00EBC68E00FCF3E700978F83008865
        2C009A9A96009B9B9B0092908F008E8F90008A857B00837146007E6B3D00827E
        7300756544006B4E1400665332006F60490087622A00988F8300E5AF5400E7B7
        5B00E5B24E00DB931A00DC981E00DD971E00DD971E00DC961A00DD951B00DF99
        2000E09D2900E19F2A00E2A02900E0AA4300E2AF5200E4B05400814B00008353
        0000814E0000772F000078340000793300007933000078320000793100007B35
        00007C3900007D3B00007E3C00007C4600007E4B0000804C0000F9ECD300F4DB
        AC00F0CC8900F1CB7D00EFC56D00EFC56D00F0C56C00F4CD7A00F4CE7C00F0C5
        6E00EFC56D00EFC66D00F1CA7E00F2CE8B00F5DBAD00FAECD30095886F009077
        48008C6825008D6719008B6109008B6109008C61080090691600906A18008C61
        0A008B6109008B6209008D661A008E6A27009177490096886F00}
      Layout = blGlyphTop
      NumGlyphs = 2
      TabOrder = 5
      OnClick = btnFiltrarClick
    end
  end
  object qryPedidos: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select numpedido, dt_cadastro, dt_representante, dt_recebimento,' +
        ' dt_entrega, dt_limite_entrega,'
      
        '       dt_aprovacao, desconto, desconto_fpgto, acrescimo, valor_' +
        'total'
      ''
      'from pedidos')
    Left = 48
    Top = 144
    object qryPedidosNUMPEDIDO: TStringField
      FieldName = 'NUMPEDIDO'
      Origin = 'NUMPEDIDO'
      Size = 22
    end
    object qryPedidosDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object qryPedidosDT_REPRESENTANTE: TDateField
      FieldName = 'DT_REPRESENTANTE'
      Origin = 'DT_REPRESENTANTE'
    end
    object qryPedidosDT_RECEBIMENTO: TDateField
      FieldName = 'DT_RECEBIMENTO'
      Origin = 'DT_RECEBIMENTO'
    end
    object qryPedidosDT_ENTREGA: TDateField
      FieldName = 'DT_ENTREGA'
      Origin = 'DT_ENTREGA'
    end
    object qryPedidosDT_LIMITE_ENTREGA: TDateField
      FieldName = 'DT_LIMITE_ENTREGA'
      Origin = 'DT_LIMITE_ENTREGA'
    end
    object qryPedidosDT_APROVACAO: TDateField
      FieldName = 'DT_APROVACAO'
      Origin = 'DT_APROVACAO'
    end
    object qryPedidosDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryPedidosDESCONTO_FPGTO: TBCDField
      FieldName = 'DESCONTO_FPGTO'
      Origin = 'DESCONTO_FPGTO'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryPedidosACRESCIMO: TBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryPedidosVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsPedidos: TDataSource
    DataSet = qryPedidos
    Left = 104
    Top = 144
  end
  object dsNotas: TDataSource
    DataSet = qryNotas
    Left = 104
    Top = 424
  end
  object qryNotas: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select nf.numero_nota_fiscal, nf.data_emissao,emit.razao emitent' +
        'e, dest.razao destinatario,'
      
        '(sum(inf.valor_unitario * inf.quantidade) - tnf.desconto + tnf.f' +
        'rete + tnf.seguro + tnf.outras_despesas) valor,'
      'CASE'
      '       WHEN nfr.status = '#39'100'#39' THEN '#39'Autorizada'#39
      '       WHEN nfr.status = '#39'135'#39' THEN '#39'Cancelada'#39
      '       WHEN nfr.status is null THEN '#39'Aguardando Envio'#39
      '       ELSE '#39'Rejeitada'#39
      'END Status'
      ''
      ''
      'from notas_fiscais nf'
      ''
      
        'left join NOTAS_FISCAIS_NFE_RETORNO nfr on nfr.codigo_nota_fisca' +
        'l = nf.codigo'
      
        'inner join totais_notas_fiscais tnf on tnf.codigo_nota_fiscal = ' +
        'nf.codigo'
      
        'left join itens_notas_fiscais inf on inf.codigo_nota_fiscal = nf' +
        '.codigo'
      'inner join pessoas emit on emit.codigo = nf.codigo_emitente'
      'inner join pessoas dest on dest.codigo = nf.codigo_destinatario'
      ''
      'where nf.entrada_saida = '#39'S'#39
      ''
      
        'group by nf.numero_nota_fiscal, nf.data_emissao, emit.razao, des' +
        't.razao, nfr.status, tnf.desconto, tnf.frete, tnf.seguro, tnf.ou' +
        'tras_despesas')
    Left = 48
    Top = 424
    object qryNotasNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      Origin = 'NUMERO_NOTA_FISCAL'
      Required = True
    end
    object qryNotasDATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
      Required = True
    end
    object qryNotasSTATUS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 16
    end
    object qryNotasEMITENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMITENTE'
      Origin = 'EMITENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryNotasDESTINATARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESTINATARIO'
      Origin = 'DESTINATARIO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryNotasVALOR: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
    end
  end
end
