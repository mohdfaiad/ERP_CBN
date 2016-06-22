inherited frmRelatorioComissoesRepresentantes: TfrmRelatorioComissoesRepresentantes
  Left = 446
  Top = 226
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Comiss'#245'es'
  ClientHeight = 258
  ClientWidth = 554
  OnShow = FormShow
  ExplicitWidth = 560
  ExplicitHeight = 286
  PixelsPerInch = 96
  TextHeight = 13
  object rgTipoRelatorio: TRadioGroup
    Left = 8
    Top = 159
    Width = 537
    Height = 47
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Relat'#243'rio Anal'#237'tico'
      'Relat'#243'rio Sint'#233'tico')
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 90
    Width = 537
    Height = 76
    Caption = ' MESES '
    TabOrder = 3
    object chkJulho: TCheckBox
      Tag = 7
      Left = 16
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Julho'
      TabOrder = 1
    end
    object chkJaneiro: TCheckBox
      Tag = 1
      Left = 16
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Janeiro'
      TabOrder = 6
    end
    object chkAgosto: TCheckBox
      Tag = 8
      Left = 104
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Agosto'
      TabOrder = 7
    end
    object chkSetembro: TCheckBox
      Tag = 9
      Left = 192
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Setembro'
      TabOrder = 8
    end
    object chkOutubro: TCheckBox
      Tag = 10
      Left = 280
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Outubro'
      TabOrder = 9
    end
    object chkNovembro: TCheckBox
      Tag = 11
      Left = 368
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Novembro'
      TabOrder = 10
    end
    object chkDezembro: TCheckBox
      Tag = 12
      Left = 448
      Top = 48
      Width = 84
      Height = 17
      Caption = 'Dezembro'
      TabOrder = 11
    end
    object chkFevereiro: TCheckBox
      Tag = 2
      Left = 104
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Fevereiro'
      TabOrder = 0
    end
    object chkMarco: TCheckBox
      Tag = 3
      Left = 192
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Mar'#231'o'
      TabOrder = 2
    end
    object chkAbril: TCheckBox
      Tag = 4
      Left = 280
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Abril'
      TabOrder = 3
    end
    object chkMaio: TCheckBox
      Tag = 5
      Left = 368
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Maio'
      TabOrder = 4
    end
    object chkJunho: TCheckBox
      Tag = 6
      Left = 448
      Top = 24
      Width = 84
      Height = 17
      Caption = 'Junho'
      TabOrder = 5
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 405
    Height = 78
    Caption = ' REPRESENTANTE '
    TabOrder = 0
    inline BuscaPessoa1: TBuscaPessoa
      Left = 10
      Top = 24
      Width = 383
      Height = 38
      AutoSize = True
      TabOrder = 0
      ExplicitLeft = 10
      ExplicitTop = 24
      ExplicitWidth = 383
      inherited StaticText1: TStaticText
        Width = 37
        Font.Style = []
        ExplicitWidth = 37
      end
      inherited edtCodigo: TCurrencyEdit
        Width = 53
        ExplicitWidth = 53
      end
      inherited StaticText2: TStaticText
        Left = 86
        Width = 65
        Caption = 'Raz'#227'o social'
        Font.Style = []
        ExplicitLeft = 86
        ExplicitWidth = 65
      end
      inherited btnBuscar: TBitBtn
        Left = 55
        ExplicitLeft = 55
      end
      inherited edtRazao: TEdit
        Left = 85
        Width = 298
        ExplicitLeft = 85
        ExplicitWidth = 298
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 418
    Top = 8
    Width = 127
    Height = 78
    Caption = ' ANO '
    TabOrder = 1
    object cbAno: TComboBox
      Left = 16
      Top = 40
      Width = 101
      Height = 21
      Style = csDropDownList
      ItemIndex = 1
      TabOrder = 0
      Text = '2014'
      Items.Strings = (
        '2013'
        '2014'
        '2015'
        '2016')
    end
  end
  object RLReport1: TRLReport
    Left = 552
    Top = 6
    Width = 794
    Height = 1123
    Margins.LeftMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = dsComissao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Visible = False
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 20
      Top = 39
      Width = 754
      Height = 112
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel10: TRLLabel
        Left = -3
        Top = 65
        Width = 760
        Height = 16
        Caption = 
          '________________________________________________________________' +
          '____________________________________________'
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 584
        Top = 61
        Width = 87
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 260
        Top = 15
        Width = 234
        Height = 24
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 376
        Top = 61
        Width = 39
        Height = 16
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 507
        Top = 61
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
      end
      object RLLabel4: TRLLabel
        Left = 337
        Top = 61
        Width = 37
        Height = 16
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 467
        Top = 61
        Width = 38
        Height = 16
        Caption = 'Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 593
        Top = 61
        Width = 35
        Height = 16
        Caption = 'P'#225'g.:'
      end
      object RLLabel7: TRLLabel
        Left = 672
        Top = 61
        Width = 8
        Height = 16
        Caption = '/'
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 681
        Top = 61
        Width = 112
        Height = 16
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel13: TRLLabel
        Left = -3
        Top = 41
        Width = 760
        Height = 16
        Caption = 
          '________________________________________________________________' +
          '____________________________________________'
      end
      object rld2: TRLDraw
        Left = 74
        Top = 89
        Width = 65
        Height = 14
        Brush.Color = 15658734
        Pen.Color = 13553358
        Visible = False
      end
      object rld3: TRLDraw
        Left = 150
        Top = 89
        Width = 44
        Height = 14
        Brush.Color = 15658734
        Pen.Color = 13553358
        Visible = False
      end
      object rld4: TRLDraw
        Left = 205
        Top = 89
        Width = 38
        Height = 14
        Brush.Color = 15658734
        Pen.Color = 13553358
        Visible = False
      end
      object rld5: TRLDraw
        Left = 252
        Top = 89
        Width = 35
        Height = 14
        Brush.Color = 15658734
        Pen.Color = 13553358
        Visible = False
      end
      object rld6: TRLDraw
        Left = 298
        Top = 89
        Width = 41
        Height = 14
        Brush.Color = 15658734
        Pen.Color = 13553358
        Visible = False
      end
      object rld7: TRLDraw
        Left = 349
        Top = 89
        Width = 41
        Height = 14
        Brush.Color = 15658734
        Pen.Color = 13553358
        Visible = False
      end
      object rld8: TRLDraw
        Left = 402
        Top = 89
        Width = 51
        Height = 14
        Brush.Color = 15658734
        Pen.Color = 13553358
        Visible = False
      end
      object rld9: TRLDraw
        Left = 465
        Top = 89
        Width = 61
        Height = 14
        Brush.Color = 15658734
        Pen.Color = 13553358
        Visible = False
      end
      object rld10: TRLDraw
        Left = 538
        Top = 89
        Width = 56
        Height = 14
        Brush.Color = 15658734
        Pen.Color = 13553358
        Visible = False
      end
      object rld11: TRLDraw
        Left = 605
        Top = 89
        Width = 66
        Height = 14
        Brush.Color = 15658734
        Pen.Color = 13553358
        Visible = False
      end
      object rld12: TRLDraw
        Left = 682
        Top = 89
        Width = 64
        Height = 14
        Brush.Color = 15658734
        Pen.Color = 13553358
        Visible = False
      end
      object rld1: TRLDraw
        Left = 12
        Top = 89
        Width = 52
        Height = 14
        Brush.Color = 15658734
        Pen.Color = 13553358
        Visible = False
      end
      object RLLabel12: TRLLabel
        Left = 7
        Top = 89
        Width = 735
        Height = 14
        Caption = 
          '   JANEIRO      FEVEREIRO      MAR'#199'O      ABRIL      MAIO      J' +
          'UNHO      JULHO      AGOSTO      SETEMBRO      OUTUBRO      NOVE' +
          'MBRO      DEZEMBRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 20
      Top = 237
      Width = 754
      Height = 24
      AlignToBottom = True
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBResult1: TRLDBResult
        Left = 561
        Top = 3
        Width = 179
        Height = 18
        Alignment = taRightJustify
        DataField = 'VLRCOMISSAO2Q'
        DataSource = dsComissao
        DisplayMask = ',0.00;-,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult2: TRLDBResult
        Left = 431
        Top = 3
        Width = 179
        Height = 18
        Alignment = taRightJustify
        DataField = 'VLRCOMISSAO1Q'
        DataSource = dsComissao
        DisplayMask = ',0.00;-,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel11: TRLLabel
        Left = 355
        Top = 4
        Width = 107
        Height = 16
        Caption = 'TOTAL GERAL >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 20
      Top = 151
      Width = 754
      Height = 86
      DataFields = 'REPRESENTANTE'
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 754
        Height = 24
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = 14737632
        ParentColor = False
        Transparent = False
        object RLLabel8: TRLLabel
          Left = 3
          Top = 5
          Width = 119
          Height = 16
          Caption = 'REPRESENTANTE:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 125
          Top = 5
          Width = 115
          Height = 16
          DataField = 'REPRESENTANTE'
          DataSource = dsComissao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLLabel3: TRLLabel
          Left = 515
          Top = 4
          Width = 85
          Height = 16
          Caption = '1'#170' QUINZENA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel9: TRLLabel
          Left = 647
          Top = 4
          Width = 85
          Height = 16
          Caption = '2'#170' QUINZENA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 24
        Width = 754
        Height = 21
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clWhite
        ParentColor = False
        Transparent = False
        object RLDBText6: TRLDBText
          Left = 112
          Top = 4
          Width = 63
          Height = 15
          DataField = 'NOMEMES'
          DataSource = dsComissao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText7: TRLDBText
          Left = 506
          Top = 4
          Width = 104
          Height = 15
          Alignment = taRightJustify
          DataField = 'VLRCOMISSAO1Q'
          DataSource = dsComissao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText8: TRLDBText
          Left = 636
          Top = 4
          Width = 104
          Height = 15
          Alignment = taRightJustify
          DataField = 'VLRCOMISSAO2Q'
          DataSource = dsComissao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object rlbMes: TRLLabel
          Left = 35
          Top = 4
          Width = 49
          Height = 16
          Caption = 'M'#234's >>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 45
        Width = 754
        Height = 22
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clWhite
        ParentColor = False
        Transparent = False
        object RLDBResult4: TRLDBResult
          Left = 561
          Top = 3
          Width = 179
          Height = 18
          Alignment = taRightJustify
          DataField = 'VLRCOMISSAO2Q'
          DataSource = dsComissao
          DisplayMask = ',0.00;-,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult3: TRLDBResult
          Left = 431
          Top = 3
          Width = 179
          Height = 18
          Alignment = taRightJustify
          DataField = 'VLRCOMISSAO1Q'
          DataSource = dsComissao
          DisplayMask = ',0.00;-,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLLabel2: TRLLabel
          Left = 363
          Top = 4
          Width = 86
          Height = 16
          Caption = 'SUBTOTAL >'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDraw1: TRLDraw
          Left = -1
          Top = -1
          Width = 362
          Height = 22
          Brush.Color = 14079702
          Brush.Style = bsBDiagonal
          Pen.Style = psClear
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 217
    Width = 554
    Height = 41
    Align = alBottom
    TabOrder = 4
    DesignSize = (
      554
      41)
    object SpeedButton1: TSpeedButton
      Left = 189
      Top = 5
      Width = 169
      Height = 30
      Anchors = [akTop, akRight]
      Caption = '<ESC> Sair'
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD6B2C00E1A5
        3C00E7C69000F3E1C400F9F1E300FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00490700007D41
        000083622C008F7D6000958D7F009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5CEBB00B6B7BA00975C1A00DF9C
        1F00CC891B00CD8A1B00CD8A1B00D7A24A00E6BF7400E5CEB8009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B00816A570052535600330000007B38
        0000682500006926000069260000733E0000825B1000816A5400FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B366240012101900804A0900E39C
        2000CB891C00CD8A1C00CD8A1C00CC891C00D6941C00AC641D009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B004F020000000000001C0000007F38
        0000672500006926000069260000682500007230000048000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C77C2D0013111A00864F0900E49A
        2100CD8A1D00CF8B1D00CF8B1D00CE8A1D00D8941B00B4702B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B006318000000000000220000008036
        0000692600006B2700006B2700006A26000074300000500C0000FFFFFF00FFFF
        FF00FFFFFF00FEFEFF002121CB00FFFFFF00D792410014111B008A530B00E69E
        2200CE8C1F00CF8D1F00CF8D1F00CE8C1F00D6941D00B77430009B9B9B009B9B
        9B009B9B9B009A9A9B00000067009B9B9B00732E00000000000026000000823A
        00006A2800006B2900006B2900006A2800007230000053100000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF001614D900242AF500AE6E4100251A00008E530E00D892
        2000CF8C1F00D08F2300D08F2200CF8E2200D7962000BB7934009B9B9B009B9B
        9B009B9B9B009B9B9B0000007500000091004A0A0000000000002A000000742E
        00006B2800006C2B00006C2B00006B2A000073320000571500003039E8001D2A
        E800232CE800222EEB002430EF002032FF001B25F90000002F00AA6F0600E4EA
        F100BC741800D6932400D2922700D2912700D8992500BF7E3600000084000000
        8400000084000000870000008B0000009B000000950000000000460B00008086
        8D0058100000722F00006E2E00006E2D0000743500005B1A0000616EF000152E
        F400223AF4002137F4002338F200273AEF00213CFF002B3FFF0089564500FAD2
        7300D29A3D00D6982E00D3922900D4932B00DA9C2D00C3833900000A8C000000
        9000000090000000900000008E0000008B0000009B0000009B0025000000966E
        0F006E360000723400006F2E0000702F0000763800005F1F00006B7BF5004565
        F7004A67F6004E69F600425CF3001F3CF2005E7FFF001F28B900A4682000F0BA
        4D00DEAE5600DFAF5800DBA74900D59A3600DB9F3100C6893E00071791000001
        9300000392000005920000008F0000008E00001B9B0000005500400400008C56
        00007A4A00007B4B00007743000071360000773B0000622500005A61F000656F
        F100636DF1006670F000495FF100638AFF008667B4000D030000AA762800F2C4
        6D00E0B05D00E0B25E00E2B46200E2B26100E1AE4B00CB8C3F0000008C00010B
        8D0000098D00020C8C0000008D0000269B002203500000000000461200008E60
        09007C4C00007C4E00007E5000007E4E00007D4A000067280000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF003B40F0005461FF00EAA94F0022180B00A8793A00F5CA
        7700E2B76800E3B86900E3B86900E4B86A00EAC37700D2994D009B9B9B009B9B
        9B009B9B9B009B9B9B0000008C0000009B008645000000000000441500009166
        13007E5304007F5405007F54050080540600865F13006E350000FFFFFF00FFFF
        FF00FFFFFF00FBFBFF002222FF00FFFFFF00F7B64D001C101400B2803F00F8D2
        8400E6BF7300E7C07400E7C07400E7BF7300ECCB8000D69E53009B9B9B009B9B
        9B009B9B9B0097979B0000009B009B9B9B0093520000000000004E1C0000946E
        2000825B0F00835C1000835C1000835B0F0088671C00723A0000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6B245001D121200B9894900FDD9
        9100EAC68100EAC58100EAC58100EAC58100F0D08F00D9A458009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B00924E000000000000552500009975
        2D0086621D0086611D0086611D0086611D008C6C2B0075400000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7AC5C00180D0E00C4995700FFF2
        AF00FFE09D00FFE4A000F8DB9A00F3D49500F5DEA300DEAC5D009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B008348000000000000603500009B8E
        4B009B7C39009B803C00947736008F703100917A3F007A480000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECB15C00301F1B00231F20006E5A
        44009E866300BBA77C00DDC18C00F1D39900FEEBBA00E3B265009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B00884D000000000000000000000A00
        00003A22000057431800795D28008D6F35009A8756007F4E0100FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB96800DCA85100D09D4E00C594
        4700BA8A4100B3823900CF9A4800DFAC5400E9B96400E4B360009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B0086550400784400006C3900006130
        0000562600004F1E00006B3600007B48000085550000804F0000}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object btnImprimir: TSpeedButton
      Left = 370
      Top = 5
      Width = 169
      Height = 30
      Anchors = [akTop, akRight]
      Caption = '<Ctrl + P>  Imprimir'
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
  end
  object dsComissao: TDataSource
    DataSet = cdsComissao
    Left = 200
    Top = 154
  end
  object cdsComiss: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComissao'
    Left = 96
    Top = 154
    object cdsComissNOMEMES: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOMEMES'
      Size = 10
    end
    object cdsComissCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsComissREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Size = 60
    end
    object cdsComissMES: TSmallintField
      FieldName = 'MES'
    end
    object cdsComissVLRCOMISSAO1Q: TBCDField
      FieldName = 'VLRCOMISSAO1Q'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object cdsComissVLRCOMISSAO2Q: TBCDField
      FieldName = 'VLRCOMISSAO2Q'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspComissao: TDataSetProvider
    DataSet = qryComissao
    Left = 56
    Top = 154
  end
  object cdsComissao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 154
    object cdsComissaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsComissaoREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Size = 150
    end
    object cdsComissaoMES: TIntegerField
      FieldName = 'MES'
    end
    object cdsComissaoVLRCOMISSAO1Q: TFloatField
      FieldName = 'VLRCOMISSAO1Q'
      DisplayFormat = ',0.00;-,0.00'
    end
    object cdsComissaoVLRCOMISSAO2Q: TFloatField
      FieldName = 'VLRCOMISSAO2Q'
      DisplayFormat = ',0.00;-,0.00'
    end
    object cdsComissaoNOMEMES: TStringField
      FieldName = 'NOMEMES'
      Size = 12
    end
  end
  object qryComissao: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select r.codigo ,r.razao Representante,  iif(p.despachado = '#39'S'#39',' +
        ' EXTRACT(Month FROM p.dt_despacho), EXTRACT(Month FROM nf.data_s' +
        'aida)) MES,'
      
        '       CAST( SUM( iif( (nfr.status = '#39'100'#39' and (EXTRACT(DAY FROM' +
        ' nf.data_saida) < 16)) or ( p.despachado = '#39'S'#39' and (EXTRACT(DAY ' +
        'FROM p.dt_despacho) < 16)), '
      
        '                      ((p.valor_total-((p.valor_total*p.desconto' +
        '_comiss)/100)) * p.comissao / 100), 0 ) ) as numeric(15,2)) vlrC' +
        'omissao1Q, '
      
        '       CAST( SUM( iif( (nfr.status = '#39'100'#39' and (EXTRACT(DAY FROM' +
        ' nf.data_saida) > 15)) or ( p.despachado = '#39'S'#39' and (EXTRACT(DAY ' +
        'FROM p.dt_despacho) > 15)), '
      
        '                      ((p.valor_total-((p.valor_total*p.desconto' +
        '_comiss)/100)) * p.comissao / 100), 0 ) ) as numeric(15,2)) vlrC' +
        'omissao2Q'
      ''
      ''
      
        ' from pedidos P                                                 ' +
        '                '
      
        '  LEFT JOIN pedidos_faturados         PF  ON PF.CODIGO_PEDIDO = ' +
        'P.CODIGO        '
      
        '  LEFT JOIN NOTAS_FISCAIS             NF  ON NF.codigo = PF.codi' +
        'go_nota_fiscal  '
      
        '  LEFT JOIN notas_fiscais_nfe_retorno nfr ON nfr.codigo_nota_fis' +
        'cal = nf.codigo '
      
        '  LEFT JOIN pessoas                   r   on p.cod_repres = r.co' +
        'digo'
      ''
      ''
      
        ' where ( nfr.status = '#39'100'#39' and EXTRACT(YEAR FROM nf.data_saida)' +
        ' = :ano  and EXTRACT(Month FROM nf.data_saida) in (1,2)'
      
        '       OR                                                       ' +
        '                                 '
      
        '       ( p.despachado = '#39'S'#39'  and EXTRACT(YEAR FROM p.dt_despacho' +
        ') = :ano  and EXTRACT(Month FROM p.dt_despacho) in (1,2) ))'
      '       and not (p.cancelado = '#39'S'#39')'
      ' GROUP BY r.codigo, r.razao, MES'
      ' order by 1, 3'
      '')
    Left = 16
    Top = 152
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object qryDescAc: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select crp.codigo_representante, crp.ano, crp.mes, EXTRACT(DAY F' +
        'ROM lan.data_vencimento) DIA,'
      'chl.tipo, lan.valor_total from comissao_has_lancamentos chl'
      
        '  left join comissao_representante crp on crp.codigo = chl.codig' +
        'o_comissao_representante'
      
        '  left join lancamentos            lan on lan.codigo = chl.codig' +
        'o_lancamento'
      'where chl.tipo in ('#39'D'#39','#39'C'#39') and crp.ano = :ano'
      'order by 3')
    Left = 16
    Top = 200
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryDescAcCODIGO_REPRESENTANTE: TIntegerField
      FieldName = 'CODIGO_REPRESENTANTE'
      Origin = 'CODIGO_REPRESENTANTE'
    end
    object qryDescAcANO: TIntegerField
      FieldName = 'ANO'
      Origin = 'ANO'
    end
    object qryDescAcMES: TIntegerField
      FieldName = 'MES'
      Origin = 'MES'
    end
    object qryDescAcDIA: TSmallintField
      FieldName = 'DIA'
      Origin = 'DIA'
    end
    object qryDescAcTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qryDescAcVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2015 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 264
    Top = 128
  end
end
