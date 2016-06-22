inherited frmRelatorioRaioXRepresentante: TfrmRelatorioRaioXRepresentante
  Left = -8
  Top = 5
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Tela de Raio X do Representante'
  ClientHeight = 658
  ClientWidth = 1280
  OldCreateOrder = True
  WindowState = wsMaximized
  OnShow = FormShow
  ExplicitWidth = 1286
  ExplicitHeight = 686
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter5: TSplitter
    Left = 0
    Top = 61
    Width = 1280
    Height = 10
    Cursor = crDefault
    Align = alTop
    ResizeStyle = rsNone
  end
  object Splitter3: TSplitter
    Left = 0
    Top = 71
    Width = 10
    Height = 364
    Cursor = crDefault
    ResizeStyle = rsNone
  end
  object Splitter4: TSplitter
    Left = 1270
    Top = 71
    Width = 10
    Height = 364
    Cursor = crDefault
    Align = alRight
    ResizeStyle = rsNone
  end
  object gridPedidos: TDBGridCBN
    Left = 10
    Top = 71
    Width = 1260
    Height = 364
    Align = alClient
    Color = 14803425
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = gridPedidosDrawColumnCell
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
    SalvaConfiguracoes = False
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMPEDIDO'
        Title.Caption = 'Pedido'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_REPRESENTANTE'
        Title.Caption = 'Representante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_CADASTRO'
        Title.Caption = 'Cadastro'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_RECEBIMENTO'
        Title.Caption = 'Recebimento'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_FATURAMENTO'
        Title.Caption = 'Faturamento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DT_FATURAMENTO'
        Title.Caption = 'Faturamento'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_COMPRAS'
        Title.Caption = 'Compras'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Title.Caption = 'Cliente'
        Width = 239
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRAZO'
        Title.Caption = 'Prazo'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FPGTO'
        Title.Caption = 'Forma de Pagamento'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_DESCONTO_PEDIDO'
        Title.Caption = '% Desconto'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_DESCONTO'
        Title.Caption = 'R$ Desconto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_LIQUIDO'
        Title.Caption = 'Total L'#237'q. Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PECAS'
        Title.Caption = 'Pe'#231'as'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISSAO'
        Title.Caption = '% Com.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLRCOMISSAO'
        Title.Caption = 'Comiss'#227'o'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREV_PGTO'
        Title.Caption = 'Prev. Pgto'
        Width = 61
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1280
    Height = 61
    Align = alTop
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      1280
      61)
    object Label6: TLabel
      Left = 29
      Top = 5
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
    object Label7: TLabel
      Left = 150
      Top = 5
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
    object Shape1: TShape
      Left = 286
      Top = 6
      Width = 1
      Height = 37
      Pen.Color = 11842740
    end
    object SpeedButton1: TSpeedButton
      Left = 1208
      Top = 9
      Width = 59
      Height = 41
      Anchors = [akTop, akRight]
      Caption = '< Esc >'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFF8CD64
        F8CD64F6CA5DF2C057F1BC4FF5BF58F6BA50F2AE3BEBA52FDE900DD88500D57E
        00D77E00DB8915FFFFFFFFFFFFE89F26F9F6E2F8F2E0F9F3DEFFFCE0B5AD9F95
        897B938878B5AE9DFFF4D0FDEBC6FDECC5FDEBBDAE5213FFFFFFFFFFFFE89F26
        F0F4FFF0F5FFF0F5FEFEFFFF92939967666E6B687198989FFFFFFFFCFFFFFDFF
        FFFFFFFFAD4E14FFFFFFFFFFFFE99E23E9EAEBEAEBEBEAEAE9F9F8F88F8A896B
        6663605C5A898785FFFFFFF3F2F2F5F7F6FEFFFFAD4E14FFFFFFFFFFFFE99E23
        E2E4E6E4E3E5E4E5E3F3F3F282807F605E5C504F4E7D7978FDFCFBEDEDECF1F1
        F1F2F5F4AE5114FFFFFFFFFFFFEAA024DDDDE0DFDDDFE1DEDDEFEFED78757453
        51515655547C7A78F4F4F3E7E6E5EAEAEBEBEDEEAF5014FFFFFFFFFFFFEA9F24
        D8D8DBD8D7D9DAD7D7E9E7E6545051242324272425585152F0EFEFE1E0E0E5E5
        E5E6E7EAAD4F12FFFFFFFFFFFFECA52ACDCFD6D2D3D7D6D4D0DAD9D7AFACACA9
        A7A6AAA9A8AFADACE0DFDEDCDAD8DFE1E6DCE3EDAF4F0AFFFFFFF0C46EEEAF34
        CF9E4FB0B4BECFCFD3D2CECDD4D1D0D3D0CFD4D2CFDEDDDBD7D4D3D6D7DDD6DE
        E9DDAF4CDA8200D0831BF7DBA7F3D088F6BC4CCFA24FA9ABB8D0CFD1A9A3A184
        7E7E807B7ABEB9B6D4D6D9CBD3E2D9A745E68A00CC7A0DD6A77AFFFFFFFDF5E7
        F2D397FECC62D1A75BA7A9B3A9A7A8908C8B8D8987BCBCC0C1C5CFD09939E681
        00D18116F5EBE4FFFFFFFFFFFFFFFFFFFCF3E5F2D397FFD979D3AC628D8C96A7
        A3A6A6A4A49FA2B1D5A147E89500C99A5CF1DFD3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFBF1E3F1D49EFFE78BD4B16C9798A0979AA4CDA65FF9B42FE7E5D7BAA2
        8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF1E3F0D39BFFEF9DD0
        B377CEB37FFFD052F1C678F1FFFFBAA28DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAEFE1F1D29CFFF3A9FFEC8BE5AD52D29C6FE4FFFFBAA2
        8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF3EAEF
        CD91EAC077FFFFFFF4E5D7E2C3A4E4C9AEFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    inline BuscaPessoa1: TBuscaPessoa
      Left = 322
      Top = 5
      Width = 527
      Height = 38
      AutoSize = True
      TabOrder = 2
      ExplicitLeft = 322
      ExplicitTop = 5
      inherited StaticText1: TStaticText
        Width = 87
        Caption = 'Representante'
        ExplicitWidth = 87
      end
      inherited StaticText2: TStaticText
        Visible = False
      end
    end
    object dtpInicio: TDateTimePicker
      Left = 29
      Top = 20
      Width = 105
      Height = 21
      Date = 41523.559567326390000000
      Time = 41523.559567326390000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = dtpInicioChange
    end
    object dtpFim: TDateTimePicker
      Left = 150
      Top = 20
      Width = 105
      Height = 21
      Date = 41523.559567326390000000
      Time = 41523.559567326390000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = dtpFimChange
    end
    object btnBuscar: TBitBtn
      Left = 938
      Top = 16
      Width = 121
      Height = 25
      Caption = ' Buscar'
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF0094713B0094713B0094713B0096713B0096713B0096713B0096713B009671
        3B0096713B0094713B0094713B005D3E24002F5B91002F5B91009B9B9B009B9B
        9B00300D0000300D0000300D0000320D0000320D0000320D0000320D0000320D
        0000320D0000300D0000300D00000000000000002D0000002D00FFFFFF00FFFF
        FF0094713B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C2D1F6002F5B9100C1FFFF00005FDE009B9B9B009B9B
        9B00300D00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B005E6D920000002D005D9B9B0000007A00FFFFFF00FFFF
        FF00A3845300FAEEEE00B9836100B8816000BC876700C5916F00C8967400BE8B
        6B00CC8F6400714B4B002F5B9100B6FFFF00005FDE00FFFFFF009B9B9B009B9B
        9B003F200000968A8A00551F0000541D000058230300612D0B00643210005A27
        0700682B00000D00000000002D00529B9B0000007A009B9B9B00FFFFFF00FFFF
        FF00A3845300FFFFFF00F8F8F500FFFFFF00ECF1F7009877710098777100925B
        4C00D9E4EB002F5B9100AEFBFF00005FDE00543B2100FFFFFF009B9B9B009B9B
        9B003F2000009B9B9B00949491009B9B9B00888D930034130D0034130D002E00
        00007580870000002D004A979B0000007A00000000009B9B9B00FFFFFF00FFFF
        FF00A3845300F3E3DE00C8906E008F513A0072453500DCD09F00F6F5C500FFFF
        FD00925B4C0059709700005FDE00B8C0C60075460500FFFFFF009B9B9B009B9B
        9B003F2000008F7F7A00642C0A002B0000000E000000786C3B00929161009B9B
        99002E000000000C330000007A00545C6200110000009B9B9B00FFFFFF00FFFF
        FF00AD906000FFFFFF00F3F9F90098777100F8D69E00FBEBC000FFFAD900FFFF
        FD00FFFFFF00A9614B00D2DFEB00FFFBE70075460500FFFFFF009B9B9B009B9B
        9B00492C00009B9B9B008F95950034130D0094723A0097875C009B9675009B9B
        99009B9B9B00450000006E7B87009B978300110000009B9B9B00FFFFFF00FFFF
        FF00AD906000F9E9E1008D5B4A00C4896200F2C69A00ECD2B000FEF8DA00FAF5
        DE00FFFFFF00DBD0CE00BF887500F8F9F20078470600FFFFFF009B9B9B009B9B
        9B00492C000095857D0029000000602500008E623600886E4C009A9476009691
        7A009B9B9B00776C6A005B24110094958E00140000009B9B9B00FFFFFF00FFFF
        FF00AC916700FFFFFF00C3B6B800C4835A00F6D8AC00F0DABE00F8EAD000FEF8
        DE00FFFDE300E9E4D100BEB0B100FAF6EE00784A0800FFFFFF009B9B9B009B9B
        9B00482D03009B9B9B005F525400601F0000927448008C765A0094866C009A94
        7A009B997F0085806D005A4C4D0096928A00140000009B9B9B00FFFFFF00FFFF
        FF00B19F7C00FCEDE700A77D6C00BA745500FCDEAB00FFFFFF00F1DEBF00F2E0
        BB00FFFDD300CCBC9800AC877D00EDE5D7007A4C0B00FFFFFF009B9B9B009B9B
        9B004D3B1800988983004319080056100000987A47009B9B9B008D7A5B008E7C
        57009B996F00685834004823190089817300160000009B9B9B00FFFFFF00FFFF
        FF00BAA18000FFFFFF00FFFFFF00A5766800D6895200FBE0A900F2DAAE00F6D9
        A100F6D9A1008E6A6200DCD1CD00D9CDB5007D501000FFFFFF009B9B9B009B9B
        9B00563D1C009B9B9B009B9B9B004112040072250000977C45008E764A009275
        3D0092753D002A060000786D690075695100190000009B9B9B00FFFFFF00FFFF
        FF00C6B19100F5E8E300C28A6900B98E7B00B0897F00B8714F00CC8C6300D09D
        7700A0786C00874B2D00AD7A5100C0AC880081551800FFFFFF009B9B9B009B9B
        9B00624D2D0091847F005E260500552A17004C251B00540D0000682800006C39
        13003C14080023000000491600005C4824001D0000009B9B9B00FFFFFF00FFFF
        FF00C4B19200FFFFFF00FCFFFF00FFFFFF00F8FBFA00CFC6C200C6B5B600B3A1
        9A00CCBA9E00F9F8F000E5E1D000B3976D00865A1D00FFFFFF009B9B9B009B9B
        9B00604D2E009B9B9B00989B9B009B9B9B00949796006B625E00625152004F3D
        360068563A0095948C00817D6C004F330900220000009B9B9B00FFFFFF00FFFF
        FF00C8B89A00F2E6DF00BD856300BE866400BC856300BB856300BF8463009C62
        3D00CDBA9900E5E1D000CCB69B009C774100FFFFFF00FFFFFF009B9B9B009B9B
        9B00645436008E827B00592100005A22000058210000572100005B2000003800
        000069563500817D6C0068523700381300009B9B9B009B9B9B00FFFFFF00FFFF
        FF00C8B89A00FFFFFF00FFFFFF00FFFFFF00FCFCFA00EDEDEA00EBE5D900D3C0
        A100B9A88300D4C5AF00946D3100FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B00645436009B9B9B009B9B9B009B9B9B009898960089898600878175006F5C
        3D0055441F0070614B00300900009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00C8BA9D00FFFFFF00FFFFFF00F8F6F500F0E5DE00DED5C400D5C2AA00BEA5
        7E009A7B44009D774100FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B00645639009B9B9B009B9B9B00949291008C817A007A716000715E46005A41
        1A0036170000391300009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00C8B89A00CCB89C00C6B49700C3AF9000C2AE9000BFA78000BBA07700A991
        60008D652D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B006454360068543800625033005F4B2C005E4A2C005B431C00573C1300452D
        0000290100009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00}
      NumGlyphs = 2
      TabOrder = 3
      OnClick = btnBuscarClick
    end
    object chkPeriodoRep: TCheckBox
      Left = 29
      Top = 42
      Width = 97
      Height = 16
      Caption = 'Per'#237'odo Geral'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 4
      OnClick = chkPeriodoRepClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 435
    Width = 1280
    Height = 223
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      1280
      223)
    object Shape4: TShape
      Left = 10
      Top = 0
      Width = 1261
      Height = 27
      Brush.Color = 12566463
      Pen.Color = 11382189
      Pen.Width = 2
      Shape = stRoundRect
    end
    object Label1: TLabel
      Left = 479
      Top = 5
      Width = 56
      Height = 15
      Alignment = taRightJustify
      Caption = 'Desconto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 672
      Top = 5
      Width = 65
      Height = 15
      Alignment = taRightJustify
      Caption = 'Valor Geral:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 879
      Top = 5
      Width = 34
      Height = 15
      Alignment = taRightJustify
      Caption = 'Pe'#231'as:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 1054
      Top = 5
      Width = 86
      Height = 15
      Alignment = taRightJustify
      Caption = 'Valor Comiss'#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Shape2: TShape
      Left = 10
      Top = 0
      Width = 205
      Height = 27
      Brush.Color = 8026746
      Pen.Color = 13353400
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Label16: TLabel
      Left = 24
      Top = 4
      Width = 177
      Height = 18
      Alignment = taRightJustify
      Caption = 'T O T A I S    >  >  >'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 239
      Top = 4
      Width = 140
      Height = 16
      Caption = 'Quantidade Pedidos:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object gpbMediasEmpresa: TGroupBox
      Left = 16
      Top = 32
      Width = 352
      Height = 185
      Caption = ' M'#201'DIAS DA EMPRESA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label18: TLabel
        Left = 34
        Top = 22
        Width = 147
        Height = 15
        Alignment = taRightJustify
        Caption = 'M'#233'dia % Desconto Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4737096
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label19: TLabel
        Left = 25
        Top = 49
        Width = 156
        Height = 15
        Alignment = taRightJustify
        Caption = 'M'#233'dia Vlr. Desconto Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5066061
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label20: TLabel
        Left = 71
        Top = 76
        Width = 110
        Height = 15
        Alignment = taRightJustify
        Caption = 'M'#233'dia Valor Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5066061
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label21: TLabel
        Left = 69
        Top = 103
        Width = 112
        Height = 15
        Alignment = taRightJustify
        Caption = 'M'#233'dia Pe'#231'as Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5066061
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label22: TLabel
        Left = 69
        Top = 130
        Width = 112
        Height = 15
        Alignment = taRightJustify
        Caption = 'M'#233'dia Prazo Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5066061
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label23: TLabel
        Left = 0
        Top = 145
        Width = 350
        Height = 15
        Alignment = taRightJustify
        Caption = 
          '________________________________________________________________' +
          '______'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12303291
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object DBEdit14: TDBEdit
        Left = 193
        Top = 127
        Width = 127
        Height = 23
        Color = clWhite
        DataField = 'MEDIA_PRAZO'
        DataSource = dsMediasEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit13: TDBEdit
        Left = 193
        Top = 100
        Width = 127
        Height = 23
        Color = 10997199
        DataField = 'MEDIA_PECAS'
        DataSource = dsMediasEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit12: TDBEdit
        Left = 193
        Top = 73
        Width = 127
        Height = 23
        Color = 13102033
        DataField = 'MEDIA_VALOR'
        DataSource = dsMediasEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object chkPeriodoEmp: TCheckBox
        Left = 24
        Top = 164
        Width = 97
        Height = 17
        Caption = 'Per'#237'odo Geral'
        Checked = True
        Color = clBtnFace
        ParentColor = False
        State = cbChecked
        TabOrder = 3
        OnClick = chkPeriodoEmpClick
      end
      object chkFiltroRepres: TCheckBox
        Left = 168
        Top = 164
        Width = 145
        Height = 17
        Caption = 'Todos Representantes'
        Checked = True
        Color = clBtnFace
        ParentColor = False
        State = cbChecked
        TabOrder = 4
        OnClick = chkPeriodoEmpClick
      end
      object DBEdit10: TDBEdit
        Left = 194
        Top = 46
        Width = 126
        Height = 23
        Color = 15716559
        DataField = 'MEDIA_VLR_DESC'
        DataSource = dsMediasEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit11: TDBEdit
        Left = 194
        Top = 19
        Width = 126
        Height = 23
        Color = 15716559
        DataField = 'MEDIA_PERC_DESC'
        DataSource = dsMediasEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
    end
    object DBEdit1: TDBEdit
      Left = 542
      Top = 2
      Width = 110
      Height = 23
      Color = 15716559
      DataField = 'TOT_DESCONTO'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 744
      Top = 2
      Width = 110
      Height = 23
      Color = 13102033
      DataField = 'TOT_VALOR'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 920
      Top = 2
      Width = 110
      Height = 23
      Color = 10997199
      DataField = 'TOT_PECAS'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 1147
      Top = 2
      Width = 110
      Height = 23
      Color = 13490138
      DataField = 'TOT_COMISSAO'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object GroupBox2: TGroupBox
      Left = 384
      Top = 32
      Width = 313
      Height = 185
      Caption = ' M'#201'DIAS DO REPRESENTANTE '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object Label11: TLabel
        Left = 13
        Top = 58
        Width = 156
        Height = 15
        Alignment = taRightJustify
        Caption = 'M'#233'dia Vlr. Desconto Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4737096
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label12: TLabel
        Left = 59
        Top = 87
        Width = 110
        Height = 15
        Alignment = taRightJustify
        Caption = 'M'#233'dia Valor Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4737096
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label13: TLabel
        Left = 57
        Top = 116
        Width = 112
        Height = 15
        Alignment = taRightJustify
        Caption = 'M'#233'dia Pe'#231'as Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4737096
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label14: TLabel
        Left = 22
        Top = 29
        Width = 147
        Height = 15
        Alignment = taRightJustify
        Caption = 'M'#233'dia % Desconto Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4737096
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label15: TLabel
        Left = 57
        Top = 143
        Width = 112
        Height = 15
        Alignment = taRightJustify
        Caption = 'M'#233'dia Prazo Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4737096
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object DBEdit5: TDBEdit
        Left = 178
        Top = 54
        Width = 110
        Height = 23
        Color = 15716559
        DataField = 'MEDIA_VLR_DESC'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit6: TDBEdit
        Left = 178
        Top = 83
        Width = 110
        Height = 23
        Color = 13102033
        DataField = 'MEDIA_VALOR'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit7: TDBEdit
        Left = 178
        Top = 112
        Width = 110
        Height = 23
        Color = 10997199
        DataField = 'MEDIA_PECAS'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit8: TDBEdit
        Left = 178
        Top = 25
        Width = 110
        Height = 23
        Color = 15716559
        DataField = 'MEDIA_PERC_DESC'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit9: TDBEdit
        Left = 178
        Top = 141
        Width = 110
        Height = 23
        Color = clWhite
        DataField = 'MEDIA_PRAZO'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    object edtQtdPedidos: TEdit
      Left = 386
      Top = 2
      Width = 63
      Height = 23
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Text = '0'
    end
    object GroupBox1: TGroupBox
      Left = 1040
      Top = 32
      Width = 233
      Height = 185
      Anchors = [akTop, akRight]
      Caption = ' COMISS'#195'O DO REPRESENTANTE '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object DBGrid1: TDBGrid
        Left = 16
        Top = 20
        Width = 201
        Height = 155
        Ctl3D = False
        DataSource = dsComissao
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Caption = 'Data'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_pagar'
            Title.Alignment = taCenter
            Title.Caption = 'Valor a Pagar'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = 24064
            Title.Font.Height = -11
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 90
            Visible = True
          end>
      end
    end
    object GroupBox3: TGroupBox
      Left = 768
      Top = 32
      Width = 264
      Height = 185
      Anchors = [akTop, akRight]
      Caption = ' COMPRAS CLIENTES '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      object Label8: TLabel
        Left = 12
        Top = 158
        Width = 152
        Height = 15
        Alignment = taRightJustify
        Caption = 'Total de Clientes atendidos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4737096
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object DBGrid2: TDBGrid
        Left = 11
        Top = 20
        Width = 241
        Height = 133
        Ctl3D = False
        DataSource = dsCompras
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'QTDE_COMPRAS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Qtde. Compras'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 127
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTDE_CLIENTES'
            Title.Caption = 'Qtde. Clientes'
            Width = 77
            Visible = True
          end>
      end
      object edtTotClientes: TCurrencyEdit
        Left = 170
        Top = 156
        Width = 82
        Height = 21
        AutoSize = False
        Color = clWhite
        Ctl3D = False
        DisplayFormat = '0'
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qry
    Left = 320
    Top = 168
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DataSetProvider1'
    OnCalcFields = ClientDataSet1CalcFields
    Left = 352
    Top = 168
    object ClientDataSet1QTD_COMPRAS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'QTD_COMPRAS'
    end
    object ClientDataSet1PREV_PGTO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'PREV_PGTO'
    end
    object ClientDataSet1DT_REPRESENTANTE: TDateField
      FieldName = 'DT_REPRESENTANTE'
    end
    object ClientDataSet1DT_RECEBIMENTO: TDateField
      FieldName = 'DT_RECEBIMENTO'
    end
    object ClientDataSet1DT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object ClientDataSet1DT_FATURAMENTO: TDateField
      FieldName = 'DT_FATURAMENTO'
      ReadOnly = True
    end
    object ClientDataSet1CLIENTE: TStringField
      FieldName = 'CLIENTE'
      ReadOnly = True
      Size = 60
    end
    object ClientDataSet1FPGTO: TStringField
      FieldName = 'FPGTO'
      ReadOnly = True
      Size = 100
    end
    object ClientDataSet1PRAZO: TFloatField
      FieldName = 'PRAZO'
      ReadOnly = True
    end
    object ClientDataSet1PECAS: TSingleField
      FieldName = 'PECAS'
      ReadOnly = True
    end
    object ClientDataSet1COMISSAO: TBCDField
      FieldName = 'COMISSAO'
      Precision = 18
      Size = 2
    end
    object ClientDataSet1VLRCOMISSAO: TBCDField
      FieldName = 'VLRCOMISSAO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object ClientDataSet1PERC_DESCONTO_PEDIDO: TBCDField
      FieldName = 'PERC_DESCONTO_PEDIDO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object ClientDataSet1TOTAL_LIQUIDO: TBCDField
      FieldName = 'TOTAL_LIQUIDO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object ClientDataSet1NUMPEDIDO: TStringField
      FieldName = 'NUMPEDIDO'
      Size = 22
    end
    object ClientDataSet1TOTAL_DESCONTO: TBCDField
      FieldName = 'TOTAL_DESCONTO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object ClientDataSet1TOT_VALOR: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOT_VALOR'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'SUM(TOTAL_LIQUIDO)'
    end
    object ClientDataSet1TOT_DESCONTO: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOT_DESCONTO'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'SUM(TOTAL_DESCONTO)'
    end
    object ClientDataSet1TOT_PECAS: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOT_PECAS'
      Active = True
      DisplayName = ''
      DisplayFormat = '0'
      Expression = 'SUM(PECAS)'
    end
    object ClientDataSet1TOT_COMISSAO: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOT_COMISSAO'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'SUM(VLRCOMISSAO)'
    end
    object ClientDataSet1MEDIA_VALOR: TAggregateField
      Alignment = taRightJustify
      FieldName = 'MEDIA_VALOR'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'AVG(TOTAL_LIQUIDO)'
    end
    object ClientDataSet1MEDIA_PERC_DESC: TAggregateField
      Alignment = taRightJustify
      FieldName = 'MEDIA_PERC_DESC'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'AVG(PERC_DESCONTO_PEDIDO)'
    end
    object ClientDataSet1MEDIA_VLR_DESC: TAggregateField
      Alignment = taRightJustify
      FieldName = 'MEDIA_VLR_DESC'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'AVG(TOTAL_DESCONTO)'
    end
    object ClientDataSet1MEDIA_PRAZO: TAggregateField
      Alignment = taRightJustify
      FieldName = 'MEDIA_PRAZO'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'AVG(PRAZO)'
    end
    object ClientDataSet1MEDIA_PECAS: TAggregateField
      Alignment = taRightJustify
      FieldName = 'MEDIA_PECAS'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'AVG(PECAS)'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 384
    Top = 168
  end
  object dspMediasEmpresa: TDataSetProvider
    DataSet = qryMediasEmpresa
    Left = 40
    Top = 256
  end
  object cdsMediasEmpresa: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspMediasEmpresa'
    Left = 72
    Top = 256
    object cdsMediasEmpresaTOTAL_DESCONTO: TBCDField
      FieldName = 'TOTAL_DESCONTO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsMediasEmpresaTOTAL_LIQUIDO: TBCDField
      FieldName = 'TOTAL_LIQUIDO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsMediasEmpresaPERC_DESCONTO_PEDIDO: TBCDField
      FieldName = 'PERC_DESCONTO_PEDIDO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsMediasEmpresaPRAZO: TFloatField
      FieldName = 'PRAZO'
      ReadOnly = True
    end
    object cdsMediasEmpresaPECAS: TSingleField
      FieldName = 'PECAS'
      ReadOnly = True
    end
    object cdsMediasEmpresaTD: TIntegerField
      FieldName = 'TD'
      ReadOnly = True
    end
    object cdsMediasEmpresaMEDIA_VALOR: TAggregateField
      Alignment = taRightJustify
      FieldName = 'MEDIA_VALOR'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'Avg(TOTAL_LIQUIDO)'
    end
    object cdsMediasEmpresaMEDIA_PRAZO: TAggregateField
      Alignment = taRightJustify
      FieldName = 'MEDIA_PRAZO'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'Avg(PRAZO)'
    end
    object cdsMediasEmpresaMEDIA_PECAS: TAggregateField
      Alignment = taRightJustify
      FieldName = 'MEDIA_PECAS'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'Avg(PECAS)'
    end
    object cdsMediasEmpresaMEDIA_PERC_DESC: TAggregateField
      Alignment = taRightJustify
      FieldName = 'MEDIA_PERC_DESC'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'AVG(PERC_DESCONTO_PEDIDO)'
    end
    object cdsMediasEmpresaMEDIA_VLR_DESC: TAggregateField
      Alignment = taRightJustify
      FieldName = 'MEDIA_VLR_DESC'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'AVG(TOTAL_DESCONTO)'
    end
  end
  object dsMediasEmpresa: TDataSource
    DataSet = cdsMediasEmpresa
    Left = 104
    Top = 256
  end
  object cdsComissao: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 1120
    Top = 552
    object cdsComissaoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsComissaoValor_pagar: TFloatField
      FieldName = 'Valor_pagar'
      DisplayFormat = ' ,0.00; -,0.00'
    end
  end
  object dsComissao: TDataSource
    DataSet = cdsComissao
    Left = 1152
    Top = 552
  end
  object cdsCompras: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 832
    Top = 512
    object cdsComprasQTDE_COMPRAS: TStringField
      FieldName = 'QTDE_COMPRAS'
      Size = 30
    end
    object cdsComprasQTDE_CLIENTES: TIntegerField
      FieldName = 'QTDE_CLIENTES'
    end
  end
  object dsCompras: TDataSource
    DataSet = cdsCompras
    Left = 864
    Top = 512
  end
  object qry: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select p.dt_representante, p.dt_recebimento, p.dt_cadastro, c.ra' +
        'zao cliente, fp.descricao FPGTO, '
      ''
      
        ' cast(((p.desconto + p.desconto_fpgto + p.desconto_itens) * 100)' +
        ' / p.valor_total as numeric(15,2)) PERC_DESCONTO_PEDIDO,'
      ''
      ' CAST( iif(not nfr.codigo_nota_fiscal is null,'
      
        '       lpad(EXTRACT(DAY FROM nf.data_saida), 2, '#39'0'#39') || '#39'.'#39' || l' +
        'pad(EXTRACT(MONTH FROM nf.data_saida), 2, '#39'0'#39') || '#39'.'#39' || EXTRACT' +
        '(YEAR FROM nf.data_saida),'
      
        '       lpad(EXTRACT(DAY FROM nf.data_saida), 2, '#39'0'#39') || '#39'.'#39' || l' +
        'pad(EXTRACT(MONTH FROM nf.data_saida), 2, '#39'0'#39') || '#39'.'#39' || EXTRACT' +
        '(YEAR FROM nf.data_saida) ) as Date ) dt_faturamento,'
      
        ' p.valor_total as total_liquido, p.numpedido, (cast(sum(fpp.dias' +
        '_parcela) as float)/fp.numero_parcelas) PRAZO, (p.desconto_fpgto' +
        ' + p.desconto_itens + p.desconto) TOTAL_DESCONTO,'
      ''
      
        '       cast(( select sum(pro.qtd_pecas) from itens it           ' +
        '                                                       '
      
        '        LEFT JOIN produtos pro on it.cod_produto = pro.codigo   ' +
        '                                                       '
      
        '        where it.cod_pedido = p.codigo) as Float) pecas, p.comis' +
        'sao, cast(p.valor_total * p.comissao / 100 as numeric(15,2)) vlr' +
        'Comissao    '
      
        ' from pedidos P                                                 ' +
        '                                                       '
      
        '       LEFT JOIN pedidos_faturados         PF  ON PF.CODIGO_PEDI' +
        'DO = P.CODIGO                                          '
      
        '       LEFT JOIN NOTAS_FISCAIS             NF  ON NF.codigo = PF' +
        '.codigo_nota_fiscal'
      
        '       LEFT JOIN notas_fiscais_nfe_retorno nfr ON nfr.codigo_not' +
        'a_fiscal = nf.codigo                                   '
      
        '       LEFT JOIN pessoas                   c   on p.cod_cliente ' +
        '= c.codigo                                             '
      
        '       LEFT JOIN formas_pgto               FP  on fp.codigo = p.' +
        'cod_forma_pag                                          '
      
        '       LEFT JOIN formas_pgto_parcelas      FPP on fpp.codformas_' +
        'pgto = fp.codigo                                       '
      
        ' where ((nfr.status = '#39'100'#39'  and nf.data_saida >= :dti and nf.da' +
        'ta_saida <= :dtf  and p.cod_repres = :codRep)'
      
        '    or (p.despachado = '#39'S'#39' and p.dt_despacho >= :dti and p.dt_de' +
        'spacho <= :dtf and p.cod_repres = :codRep))'
      '    and not (p.cancelado = '#39'S'#39')'
      ''
      
        ' group by p.dt_representante, p.dt_recebimento, p.dt_cadastro, c' +
        '.razao, fp.descricao, fp.numero_parcelas,'
      
        '         p.valor_total, p.numpedido, p.codigo, nf.data_emissao, ' +
        'nf.data_saida, nfr.status, p.desconto_fpgto, p.comissao,'
      '         nfr.codigo_nota_fiscal , p.desconto, p.desconto_itens'
      ' ORDER BY c.razao'
      '')
    Left = 280
    Top = 168
    ParamData = <
      item
        Name = 'DTI'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Name = 'DTF'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Name = 'CODREP'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryMediasEmpresa: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select (p.desconto_fpgto + p.desconto_itens + p.desconto) TOTAL_' +
        'DESCONTO, p.valor_total as total_liquido,'
      
        '      cast (((p.desconto + p.desconto_fpgto + p.desconto_itens) ' +
        '* 100) / (p.valor_total + p.desconto + p.desconto_fpgto + p.desc' +
        'onto_itens) as numeric(15,2)) PERC_DESCONTO_PEDIDO,'
      
        '       iif(fpp.dias_parcela is null, 0,(cast(sum(fpp.dias_parcel' +
        'a) as float)/fp.numero_parcelas)) PRAZO,'
      '       cast( ( select sum(pro.qtd_pecas) from itens it'
      
        '             LEFT JOIN produtos pro on it.cod_produto = pro.codi' +
        'go'
      '             where it.cod_pedido = p.codigo)  as float) PECAS,'
      
        '       iif(p.desconto_fpgto > 0, 1, 0) TD                       ' +
        '         from pedidos P'
      
        '    LEFT JOIN pedidos_faturados         PF  ON PF.CODIGO_PEDIDO ' +
        '= P.CODIGO'
      
        '    LEFT JOIN NOTAS_FISCAIS             NF  ON NF.codigo = PF.co' +
        'digo_nota_fiscal'
      
        '    LEFT JOIN notas_fiscais_nfe_retorno nfr ON nfr.codigo_nota_f' +
        'iscal = nf.codigo'
      
        '    LEFT JOIN pessoas                   c   on p.cod_cliente = c' +
        '.codigo'
      
        '    LEFT JOIN formas_pgto               FP  on fp.codigo = p.cod' +
        '_forma_pag'
      
        '    LEFT JOIN formas_pgto_parcelas      FPP on fpp.codformas_pgt' +
        'o = fp.codigo'
      
        ' where ((nfr.status = '#39'100'#39' ) or (p.despachado = '#39'S'#39' ) ) and not' +
        ' (p.cancelado = '#39'S'#39')'
      
        ' group by p.valor_total, FP.desconto, p.desconto_fpgto, fp.numer' +
        'o_parcelas, p.codigo, p.desconto, p.desconto_itens,'
      '       fpp.codigo, fp.codigo,fpp.dias_parcela'
      '')
    Left = 8
    Top = 256
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2015 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 632
    Top = 328
  end
end
