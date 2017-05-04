inherited frmRelatorioReferencias: TfrmRelatorioReferencias
  Left = 72
  Top = 197
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de C'#243'digo de Barras por Refer'#234'ncia'
  ClientHeight = 539
  ClientWidth = 970
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 976
  ExplicitHeight = 567
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 970
    Height = 97
    Align = alTop
    TabOrder = 0
    TabStop = True
    object Splitter1: TSplitter
      Left = 1
      Top = 1
      Width = 8
      Height = 95
      Cursor = crDefault
      ResizeStyle = rsNone
    end
    object gpbReferencia: TGroupBox
      Left = 337
      Top = 1
      Width = 399
      Height = 95
      Align = alLeft
      Caption = ' Adicionar refer'#234'ncia manualmente '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
      inline BuscaReferencia1: TBuscaReferencia
        Left = 2
        Top = 12
        Width = 394
        Height = 72
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 12
        ExplicitWidth = 394
        ExplicitHeight = 72
        inherited StaticText3: TStaticText
          Left = 279
          Font.Color = 7365174
          ExplicitLeft = 279
        end
        inherited StaticText2: TStaticText
          Left = 105
          Font.Color = 7365174
          ExplicitLeft = 105
        end
        inherited StaticText1: TStaticText
          Font.Color = 7365174
        end
        inherited edtReferencia: TEdit
          Left = 105
          ExplicitLeft = 105
        end
        inherited edtGrade: TEdit
          Left = 280
          ExplicitLeft = 280
        end
        inherited edtCor: TEdit
          Left = 105
          ExplicitLeft = 105
        end
        inherited edtTamanho: TEdit
          Left = 309
          ExplicitLeft = 309
        end
        inherited StaticText4: TStaticText
          Left = 80
          Font.Color = 7365174
          ExplicitLeft = 80
        end
        inherited StaticText5: TStaticText
          Left = 278
          Font.Color = 7365174
          ExplicitLeft = 278
        end
      end
    end
    object gpbPedido: TGroupBox
      Left = 9
      Top = 1
      Width = 328
      Height = 95
      Align = alLeft
      Caption = ' Adicionar refer'#234'ncias de um pedido '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      inline BuscaPedido1: TBuscaPedido
        Left = 17
        Top = 13
        Width = 288
        Height = 73
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 17
        ExplicitTop = 13
        ExplicitWidth = 288
        ExplicitHeight = 73
        inherited btnBuscar: TBitBtn
          Left = 253
          Top = 44
          ExplicitLeft = 253
          ExplicitTop = 44
        end
        inherited rgTipoBusca: TRadioGroup
          Font.Color = clBlack
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited edtNumPedido: TEdit
          Left = 120
          Top = 46
          ExplicitLeft = 120
          ExplicitTop = 46
        end
        inherited stNumPed: TStaticText
          Top = 49
          Width = 106
          AutoSize = False
          ExplicitTop = 49
          ExplicitWidth = 106
        end
      end
    end
    object btnAdicionar: TBitBtn
      Left = 744
      Top = 56
      Width = 208
      Height = 29
      Caption = ' Adicionar'
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00BBE4C20070CF850027B747001EBA40001EBA400027B7
        470070CF8500BBE4C200FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B0057805E000C6B21000053000000560000005600000053
        00000C6B210057805E009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FAFDFA004FB9620019C140001FCE4C0024DC580027DD5C0027DD5C0024DC
        58001FCE4C0019C140004FB96200FAFDFA00FFFFFF00FFFFFF009B9B9B009B9B
        9B009699960000550000005D0000006A00000078000000790000007900000078
        0000006A0000005D000000550000969996009B9B9B009B9B9B00FFFFFF00FBFD
        FB0021A93A001ED04E0022D5550021D3550003B82C0000A7120000A7120003B8
        2C0021D3550022D555001ED04E0021A93A00FBFDFB00FFFFFF009B9B9B009799
        970000450000006C000000710000006F00000054000000430000004300000054
        0000006F000000710000006C000000450000979997009B9B9B00FFFFFF004EB1
        5B001ECE4D0021D354001FCC4D000FCC450000AD1300FFFFFF00FFFFFF0000AD
        13000FCC45001FCC4D0021D354001ECE4D004EB15B00FFFFFF009B9B9B00004D
        0000006A0000006F00000068000000680000004900009B9B9B009B9B9B000049
        00000068000000680000006F0000006A0000004D00009B9B9B00BDDEBE0017BA
        3F0021DA5A001ECC510020D053000DC7420000BE2500FFFFFF00FFFFFF0000BE
        25000DC7420020D053001ECC510021DA5A0017BA3F00BDDEBE00597A5A000056
        00000076000000680000006C000000630000005A00009B9B9B009B9B9B00005A
        000000630000006C0000006800000076000000560000597A5A006ABC740017D1
        510020D45F000BCC4A0004CA430000C1330000BC2200FFFFFF00FFFFFF0000BD
        270000C23B0010CA4B000ECC4C0020D45F0017D151006ABC740006581000006D
        0000007000000068000000660000005D0000005800009B9B9B009B9B9B000059
        0000005E0000006600000068000000700000006D00000658100030A03F0033E6
        7A0000B62D0000AD130000AD130000AD130000AD1300FFFFFF00FFFFFF0000AD
        130000BD270000BD230000AD130000B62D0033E67A0030A14100003C00000082
        160000520000004900000049000000490000004900009B9B9B009B9B9B000049
        00000059000000590000004900000052000000821600003D000030A3430081FC
        C30000AF2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000AF210081FCC40030A14200003F00001D98
        5F00004B00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B00004B00001D986000003D00002395370085FD
        CC002AC26200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF002AC2620085FDCC0023953500003100002199
        6800005E00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B00005E0000219968000031000033933D007BFA
        C3003CD07D0071C780001EBF590021C05B000ABA4D00FFFFFF00FFFFFF0010BC
        510022C05C001EBF590071C780003CD07D007BFAC30033933D00002F00001796
        5F00006C19000D631C00005B0000005C0000005600009B9B9B009B9B9B000058
        0000005C0000005B00000D631C00006C190017965F00002F000067AB66008AE5
        B90065EAB00050DF970056DF9C0041DB8D0022C05C00FFFFFF00FFFFFF0022C0
        5C0049DC930056DF9C0050DF970065EAB0008AE5B90067AB6600034702002681
        550001864C00007B3300007B380000772900005C00009B9B9B009B9B9B00005C
        000000782F00007B3800007B330001864C002681550003470200B9D4B9004EB0
        6800AFFFEA005EE0A10056E19F0045DE970066D58900FFFFFF00FFFFFF0023C0
        5B0050E09E0056E19F005EE0A100AFFFEA004EB06800B9D4B90055705500004C
        04004B9B8600007C3D00007D3B00007A3300027125009B9B9B009B9B9B00005C
        0000007C3A00007D3B00007C3D004B9B8600004C040055705500FFFFFF004589
        45007BDCA800B6FFEF0076E5B50051DFA30066D58900FFFFFF00FFFFFF0024BF
        590056E2A80076E5B500B6FFEF007BDCA80045894500FFFFFF009B9B9B000025
        000017784400529B8B0012815100007B3F00027125009B9B9B009B9B9B00005B
        0000007E440012815100529B8B0017784400002500009B9B9B00FFFFFF00FAFD
        FA00157215006DD6A300B7FFF500AAF7E30070E0B00022C05C0022C05C0074E2
        B300ABF7E400B7FFF5006DD6A30015721500FAFDFA00FFFFFF009B9B9B009699
        9600000E000009723F00539B910046937F000C7C4C00005C0000005C0000107E
        4F0047938000539B910009723F00000E0000969996009B9B9B00FFFFFF00FFFF
        FF00F9FCF9004586450038A75E007FE1B800A9FFEC00B9FFFB00B9FFFB00A9FF
        EC007FE1B80038A75E0045864500F9FCF900FFFFFF00FFFFFF009B9B9B009B9B
        9B009598950000220000004300001B7D5400459B8800559B9700559B9700459B
        88001B7D54000043000000220000959895009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00B7CEB70067A56700247D33002887380028873800247D
        330067A56700B7CEB700FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00536A5300034103000019000000230000002300000019
        000003410300536A53009B9B9B009B9B9B009B9B9B009B9B9B00}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnAdicionarClick
    end
    object rgTipoInsercao: TRadioGroup
      Left = 744
      Top = 1
      Width = 209
      Height = 48
      Caption = ' Adicionar Refer'#234'ncias '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Do pedido'
        'Uma por uma')
      TabOrder = 3
      OnClick = rgTipoInsercaoClick
    end
  end
  object GridUsuarios: TDBGridCBN
    Left = 8
    Top = 110
    Width = 954
    Height = 362
    Hint = 
      'Pressione Ctrl + Alt + F2 para configurar as colunas'#13'Pressione C' +
      'trl + Alt + F3 para configurar as cores'#13'Pressione Ctrl + Alt + F' +
      '4 para configurar o tipo de busca'#13'Pressione Ctrl + Alt + F5 para' +
      ' recarregar o grid'
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = 14803425
    Ctl3D = True
    DataSource = dsRel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = GridUsuariosKeyDown
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
    TipoBusca.ListarApenasEncontrados = True
    TipoBusca.QualquerParte = True
    SalvaConfiguracoes = True
    Columns = <
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Caption = 'Refer'#234'ncia'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUTO'
        Title.Caption = 'Produto'
        Width = 344
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COR'
        Title.Caption = 'Cor'
        Width = 222
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRADE'
        Title.Caption = 'Grade'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAMANHO'
        Title.Caption = 'Tamanho'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_BARRA'
        Title.Caption = 'C'#243'd. Barras'
        Width = 95
        Visible = True
      end>
  end
  object RLReport1: TRLReport
    Left = 48
    Top = 168
    Width = 1123
    Height = 794
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = dsRel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    Visible = False
    object RLBand1: TRLBand
      Left = 39
      Top = 39
      Width = 1045
      Height = 91
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel8: TRLLabel
        Left = 383
        Top = 28
        Width = 287
        Height = 29
        Caption = 'Relat'#243'rio de Refer'#234'ncias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 869
        Top = 71
        Width = 39
        Height = 16
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 975
        Top = 71
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
      end
      object RLLabel9: TRLLabel
        Left = 831
        Top = 71
        Width = 35
        Height = 16
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 937
        Top = 71
        Width = 35
        Height = 16
        Caption = 'Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 39
      Top = 130
      Width = 1045
      Height = 88
      DataFields = 'COD_GRUPO'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 1045
        Height = 42
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDraw2: TRLDraw
          Left = -3
          Top = 20
          Width = 1052
          Height = 20
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Brush.Color = 15790320
          Pen.Style = psClear
        end
        object RLLabel1: TRLLabel
          Left = 7
          Top = 4
          Width = 47
          Height = 16
          Caption = 'Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 58
          Top = 3
          Width = 51
          Height = 16
          DataField = 'GRUPO'
          DataSource = dsRel
          Text = ''
        end
        object RLLabel2: TRLLabel
          Left = 5
          Top = 23
          Width = 73
          Height = 16
          Caption = 'Refer'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 93
          Top = 23
          Width = 54
          Height = 16
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 461
          Top = 23
          Width = 26
          Height = 16
          Caption = 'Cor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 693
          Top = 23
          Width = 43
          Height = 16
          Caption = 'Grade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 773
          Top = 23
          Width = 64
          Height = 16
          Caption = 'Tamanho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 869
          Top = 23
          Width = 114
          Height = 16
          Caption = 'C'#243'digo de Barras'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 42
        Width = 1045
        Height = 24
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBText2: TRLDBText
          Left = 5
          Top = 3
          Width = 87
          Height = 16
          DataField = 'REFERENCIA'
          DataSource = dsRel
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 93
          Top = 3
          Width = 67
          Height = 16
          DataField = 'PRODUTO'
          DataSource = dsRel
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 461
          Top = 3
          Width = 32
          Height = 16
          DataField = 'COR'
          DataSource = dsRel
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 690
          Top = 3
          Width = 50
          Height = 16
          Alignment = taCenter
          DataField = 'GRADE'
          DataSource = dsRel
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 771
          Top = 3
          Width = 68
          Height = 16
          Alignment = taCenter
          DataField = 'TAMANHO'
          DataSource = dsRel
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 872
          Top = 3
          Width = 84
          Height = 16
          DataField = 'COD_BARRA'
          DataSource = dsRel
          Text = ''
        end
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 480
    Width = 953
    Height = 49
    Caption = ' Op'#231#245'es '
    TabOrder = 3
    DesignSize = (
      953
      49)
    object btnImprimir: TSpeedButton
      Left = 787
      Top = 13
      Width = 150
      Height = 30
      Anchors = [akTop, akRight]
      Caption = '<Ctrl + P>  Visualizar'
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00D7C39B00ECE3D600ECE3D600ECE3D600ECE3D600ECE3
        D600ECE3D600D7C39B00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00735F3700887F7200887F7200887F7200887F7200887F
        7200887F7200735F37009B9B9B009B9B9B009B9B9B009B9B9B00B0ACAC00B1AC
        AC00A7A2A200726C7300C4AB7F00EDE1D500EDE1D500EDE1D500EDE1D500EDE1
        D500EDE1D500C4AB7F0076717700A49E9E00A9A4A400ABA5A5004C4848004D48
        4800433E3E000E080F0060471B00897D7100897D7100897D7100897D7100897D
        7100897D710060471B00120D1300403A3A004540400047414100958F8F00C3C0
        BF00C3C0BF00837D8400C6A87400E0CBAE00E0CBAE00E0CBAE00E0CBAE00E0CB
        AE00E0CBAE00C6A87400837D8400C3C0BF00C3C0BF0099929200312B2B005F5C
        5B005F5C5B001F192000624410007C674A007C674A007C674A007C674A007C67
        4A007C674A00624410001F1920005F5C5B005F5C5B00352E2E00A49FA100D1CF
        CE00D1CFCE00D3D2D100D2D2D300D0D0D200D0D0D200D0D0D200D0D0D200D0D0
        D200D0D0D200D2D2D300D3D2D100BACAD7006E9BE300A49FA100403B3D006D6B
        6A006D6B6A006F6E6D006E6E6F006C6C6E006C6C6E006C6C6E006C6C6E006C6C
        6E006C6C6E006E6E6F006F6E6D00566673000A377F00403B3D00AAA7A700D9D7
        D700D9D7D700D9D7D700D9D7D700D9D7D700D9D7D700D9D7D700D9D7D700D9D7
        D700D9D7D700D9D7D700D9D7D7008AC3E900004BFB00ABA8A800464343007573
        7300757373007573730075737300757373007573730075737300757373007573
        7300757373007573730075737300265F85000000970047444400B7B3B300E6E8
        E900D6C5AF00BC6B1000BB6A0F00BB6A0F00BB6A0F00BB6A0F00BB6A0F00BB6A
        0F00BB6A0F00BB6A0F00BC6B1000D6C5AF00E6E8E900B8B5B500534F4F008284
        850072614B005807000057060000570600005706000057060000570600005706
        000057060000570600005807000072614B008284850054515100BCB9BA00EEF2
        F500BA7B3E00E1A94200E1A84200E1A84200E1A84200E1A84200E1A84200E1A8
        4200E1A84200E1A84200E1A94200BA7B3E00EEF2F500BFBBBC00585556008A8E
        9100561700007D4500007D4400007D4400007D4400007D4400007D4400007D44
        00007D4400007D4400007D450000561700008A8E91005B575800CDC8C900F8FC
        FF00CD975300EEC67000EEC77100EEC77100EEC77100EEC77100EEC77100EEC7
        7100EEC77100EEC77100EEC67000CD975300F8FCFF00CECBCC00696465009498
        9B00693300008A620C008A630D008A630D008A630D008A630D008A630D008A63
        0D008A630D008A630D008A620C006933000094989B006A676800D2D0D000FCFF
        FF00D7A55C00EDC97700E9BF6800E9BF6800E9BF6800E9BF6800E9BF6800E9BF
        6800E9BF6800E9BF6800EDC97700D7A55C00FCFFFF00D4D1D0006E6C6C00989B
        9B007341000089651300855B0400855B0400855B0400855B0400855B0400855B
        0400855B0400855B04008965130073410000989B9B00706D6C00DEDCDB00FFFF
        FF00E8C07000E0AC5400B99D6B00D7BD9100D7BD9100D7BD9100D7BD9100D7BD
        9100D7BD9100B99D6B00E0AC5400E8C07000FFFFFF00E3DFDF007A7877009B9B
        9B00845C0C007C4800005539070073592D0073592D0073592D0073592D007359
        2D0073592D00553907007C480000845C0C009B9B9B007F7B7B00D1CBCD00BCBB
        C000DEB67300CF9E5F00C4AB7F00DFCAAD00DFCAAD00DFCAAD00DFCAAD00DFCA
        AD00DFCAAD00C4AB7F00CD995600DDB36E00BEBDC100D1CACC006D6769005857
        5C007A520F006B3A000060471B007B6649007B6649007B6649007B6649007B66
        49007B66490060471B0069350000794F0A005A595D006D666800FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00D0BD9800ECDFD100ECDFD100ECDFD100ECDFD100ECDF
        D100ECDFD100D0BD9800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B006C593400887B6D00887B6D00887B6D00887B6D00887B
        6D00887B6D006C5934009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00D5C4A400EFE4D800EFE4D800EFE4D800EFE4D800EFE4
        D800EFE4D800D5C4A400FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00716040008B8074008B8074008B8074008B8074008B80
        74008B807400716040009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00DED0B800F5EDE400F5EDE400F5EDE400F5EDE400F5ED
        E400F5EDE400DED0B800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B007A6C5400918980009189800091898000918980009189
        8000918980007A6C54009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E2D6C100F8F3EA00F8F3EA00F8F3EA00F8F3EA00F8F3
        EA00F8F3EA00E2D6C100FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B007E725D00948F8600948F8600948F8600948F8600948F
        8600948F86007E725D009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E7DDCD00EFE8DB00EFE8DB00EFE8DB00EFE8DB00EFE8
        DB00EFE8DB00E8DFD000FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00837969008B8477008B8477008B8477008B8477008B84
        77008B847700847B6C009B9B9B009B9B9B009B9B9B009B9B9B00}
      NumGlyphs = 2
      OnClick = btnImprimirClick
    end
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 212
      Height = 13
      Caption = '<Delete> Remove refer'#234'ncia selecionada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5987163
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSalvaPDF: TBitBtn
      Left = 625
      Top = 13
      Width = 155
      Height = 30
      Anchors = [akTop, akRight]
      Caption = ' Salvar em PDF'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        88888888888888888888888888E1E5E3ECECE9F6EBECEAE8E8E6E6E6E5E5E5E4
        E4E4E3E3E3E1E1E1E0E0E0E0E0E0DEDEDEDDDDDDD5D5D5888888888888F0EFEE
        E5E9E9BCC8DCDADDE1F5F3E9E5E6E7E4E5E5E3E4E3E4E3E2E1E1E1DFDFDFDDDE
        DEDBDBDCDDDCDC888888888888FBFAEB6778EE425CD76778D9ACADD8F8F6E6E7
        E9E9E6E5E7E2E3E5E3E1E5EAE8E4EEF0DEE7DFE1DADCDF888888888888F6F1EE
        D1DBF0A4ADE4919BDC2346DC979AD9E9EADDEAE9E2F1EEE6FCF7E5B7BEDF8489
        D4C8D2D6E0E5DD888888888888EEF0F1FAF2F0FAF5F3E0E5EDCDCFF03557E553
        60D5858FD78B97C8808FD71330EF2E44E193A2D6E9E9E3888888888888F2F2F2
        F2F2F1EEF0F0EDF3EDFEFBF0C5CEEC3B4FCFE6E3E1D6D5E81B30E098A6E0DADC
        E5E6E4E8E2E2E2888888888888F4F3F4F3F3F3F2F2F2F2EFF1EAEFEEFFFFEB6F
        7DE7828ACCA8ADE13D54DCFFFBE2EFE9E6E4E5E2E2E2E2888888888888F5F5F5
        F4F4F4F3F3F3F4F2F1EDF1F1F4F1EFE7EAEC4051D7203CD9B0B1E1F6F4EAE4E7
        E9E7E6E5E4E4E4888888888888F6F6F6F5F5F5F5F5F5F3F3F3F3F2F2F0F0F0FF
        FFF08490EF2038E0EDEFE7ECEBEBE9E9E9E7E7E7E6E5E5888888888888F8F8F8
        F7F7F7F5F5F5F4F4F4F4F4F4F2F2F2FEFBF09DAFEE2444E4F3EEE5EDEDECEAEA
        EAE8E8E8E6E6E6888888888888F9F9F9F9F9F9F7F7F7F6F6F6F5F5F5F4F4F4FF
        FFF27083F30017ECBDC4DBF7F5F0ECECECEAEAEAE7E7E7888888888888F9F9F9
        FAFAFAF9F9F9F8F8F8F6F6F6F5F5F5FDFDF691A2ED0926EEA7AFE5FDFBF1EEEE
        EEEBEBEBE9E9E9888888888888FCFCFCFCFCFCFBFBFBF9F9F9F8F8F8F6F6F6F6
        F6F3F0F2F6CCD7EFEAEBF2F1F1F0EFEFEFEDEDEDEBEBEB888888888888F4F4F4
        FBFBFBF9F9F9F8F8F8F7F7F7F6F6F6F4F4F5F5F5F3FBF9F4F3F3F2F0F0F0EFEF
        EFEFEFEFE6E6E688888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888}
      TabOrder = 0
      OnClick = btnSalvaPDFClick
    end
  end
  object dsRel: TDataSource
    DataSet = cdsRel
    Left = 224
    Top = 224
  end
  object cdsRel: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 224
    object cdsRelCODIGO: TStringField
      FieldName = 'CODIGO'
    end
    object cdsRelREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 18
    end
    object cdsRelPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 200
    end
    object cdsRelCOR: TStringField
      FieldName = 'COR'
      Size = 100
    end
    object cdsRelGRADE: TStringField
      FieldName = 'GRADE'
      Size = 25
    end
    object cdsRelTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 6
    end
    object cdsRelCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 15
    end
    object cdsRelCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object cdsRelGRUPO: TStringField
      FieldName = 'GRUPO'
    end
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 104
    Top = 176
    object cdsREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 18
    end
    object cdsCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object cdsPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 200
    end
    object cdsCOD_COR: TIntegerField
      FieldName = 'COD_COR'
    end
    object cdsCOR: TStringField
      FieldName = 'COR'
      Size = 100
    end
    object cdsCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsGRADE: TStringField
      FieldName = 'GRADE'
      Size = 25
    end
    object cdsQTD_RN: TIntegerField
      FieldName = 'QTD_RN'
    end
    object cdsQTD_P: TIntegerField
      FieldName = 'QTD_P'
    end
    object cdsCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object cdsGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 100
    end
    object cdsQTD_M: TIntegerField
      FieldName = 'QTD_M'
    end
    object cdsQTD_G: TIntegerField
      FieldName = 'QTD_G'
    end
    object cdsQTD_1: TIntegerField
      FieldName = 'QTD_1'
    end
    object cdsQTD_2: TIntegerField
      FieldName = 'QTD_2'
    end
    object cdsQTD_3: TIntegerField
      FieldName = 'QTD_3'
    end
    object cdsQTD_4: TIntegerField
      FieldName = 'QTD_4'
    end
    object cdsQTD_6: TIntegerField
      FieldName = 'QTD_6'
    end
    object cdsQTD_8: TIntegerField
      FieldName = 'QTD_8'
    end
    object cdsQTD_UNICA: TBCDField
      FieldName = 'QTD_UNICA'
      Precision = 18
      Size = 2
    end
  end
  object dsp: TDataSetProvider
    DataSet = qry
    Left = 72
    Top = 176
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel'
    Left = 656
    Top = 192
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'pdf'
    Filter = '*.pdf'
    Title = 'Salvar relat'#243'rio de refer'#234'ncias'
    Left = 368
    Top = 184
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2015 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 608
    Top = 192
  end
  object qry: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select p.referencia , i.cod_produto, p.descricao produto, i.cod_' +
        'cor, c.descricao cor, p.cod_grade,'
      
        '       g.descricao grade, i.qtd_rn, i.qtd_p, p.cod_grupo, gr.des' +
        'cricao grupo,'
      
        '       i.qtd_m, i.qtd_g, i.qtd_1, i.qtd_2, i.qtd_3, i.qtd_4, i.q' +
        'td_6, i.qtd_8, i.qtd_unica from itens i'
      '  left join produtos p on p.codigo = i.cod_produto'
      '  left join cores    c on c.codigo = i.cod_cor'
      '  left join grades   g on g.codigo = p.cod_grade'
      '  left join grupo   gr on gr.codigo = p.cod_grupo'
      'where i.cod_pedido = :cod_pedido')
    Left = 40
    Top = 176
    ParamData = <
      item
        Name = 'COD_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
end
