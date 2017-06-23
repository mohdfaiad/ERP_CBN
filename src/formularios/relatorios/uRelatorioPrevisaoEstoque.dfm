inherited frmRelatorioPrevisaoEstoque: TfrmRelatorioPrevisaoEstoque
  Left = 381
  Top = 211
  Caption = 'Relat'#243'rio de previs'#227'o de estoque'
  ClientHeight = 309
  ClientWidth = 629
  OnShow = FormShow
  ExplicitWidth = 645
  ExplicitHeight = 347
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 20
    Top = 279
    Width = 1123
    Height = 794
    Margins.LeftMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = dsPrevisao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    Visible = False
    object RLBand1: TRLBand
      Left = 20
      Top = 39
      Width = 1083
      Height = 81
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
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
        Left = 316
        Top = 15
        Width = 442
        Height = 24
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Previs'#227'o de Estoque (em dias)'
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
        Width = 1089
        Height = 16
        Caption = 
          '________________________________________________________________' +
          '________________________________________________________________' +
          '___________________________'
      end
    end
    object RLGroup1: TRLGroup
      Left = 20
      Top = 120
      Width = 1083
      Height = 73
      DataFields = 'CODPRO'
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 1083
        Height = 24
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDraw3: TRLDraw
          Left = -294
          Top = -180
          Width = 755
          Height = 203
          Brush.Color = 13158600
          Color = clWhite
          DrawKind = dkTriangle
          ParentColor = False
          Pen.Style = psClear
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 73
          Top = 5
          Width = 356
          Height = 16
          AutoSize = False
          DataField = 'PRODUTO'
          DataSource = dsPrevisao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 1
          Top = 5
          Width = 57
          Height = 16
          DataField = 'REFPRO'
          DataSource = dsPrevisao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLLabel2: TRLLabel
          Left = 496
          Top = 5
          Width = 564
          Height = 16
          Caption = 
            'RN       P        M        G        1        2        3        4' +
            '        6        8        10       12       14    UNICA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 24
        Width = 1083
        Height = 26
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = 15132390
        ParentColor = False
        Transparent = False
        BeforePrint = RLBand5BeforePrint
        object RLDBText6: TRLDBText
          Left = 13
          Top = 5
          Width = 58
          Height = 16
          DataField = 'REFCOR'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
        end
        object RLDBText8: TRLDBText
          Left = 93
          Top = 5
          Width = 340
          Height = 16
          AutoSize = False
          DataField = 'COR'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
        end
        object RLDBText9: TRLDBText
          Left = 482
          Top = 5
          Width = 50
          Height = 16
          Alignment = taCenter
          DataField = 'DIAS_RN'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
          BeforePrint = RLDBText9BeforePrint
        end
        object RLDBText10: TRLDBText
          Left = 524
          Top = 5
          Width = 50
          Height = 16
          Alignment = taCenter
          DataField = 'DIAS_P'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
          BeforePrint = RLDBText9BeforePrint
        end
        object RLDBText11: TRLDBText
          Left = 609
          Top = 5
          Width = 50
          Height = 16
          Alignment = taCenter
          DataField = 'DIAS_G'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
          BeforePrint = RLDBText9BeforePrint
        end
        object RLDBText12: TRLDBText
          Left = 567
          Top = 5
          Width = 50
          Height = 16
          Alignment = taCenter
          DataField = 'DIAS_M'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
          BeforePrint = RLDBText9BeforePrint
        end
        object RLDBText14: TRLDBText
          Left = 728
          Top = 5
          Width = 50
          Height = 16
          Alignment = taCenter
          DataField = 'DIAS_3'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
          BeforePrint = RLDBText9BeforePrint
        end
        object RLDBText15: TRLDBText
          Left = 651
          Top = 5
          Width = 50
          Height = 16
          Alignment = taCenter
          DataField = 'DIAS_1'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
          BeforePrint = RLDBText9BeforePrint
        end
        object RLDBText16: TRLDBText
          Left = 690
          Top = 5
          Width = 50
          Height = 16
          Alignment = taCenter
          DataField = 'DIAS_2'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
          BeforePrint = RLDBText9BeforePrint
        end
        object RLDBText13: TRLDBText
          Left = 768
          Top = 6
          Width = 50
          Height = 16
          Alignment = taCenter
          DataField = 'DIAS_4'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
          BeforePrint = RLDBText9BeforePrint
        end
        object RLDBText17: TRLDBText
          Left = 807
          Top = 6
          Width = 50
          Height = 16
          Alignment = taCenter
          DataField = 'DIAS_6'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
          BeforePrint = RLDBText9BeforePrint
        end
        object RLDBText18: TRLDBText
          Left = 845
          Top = 6
          Width = 50
          Height = 16
          Alignment = taCenter
          DataField = 'DIAS_8'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
          BeforePrint = RLDBText9BeforePrint
        end
        object RLDBText19: TRLDBText
          Left = 1015
          Top = 6
          Width = 50
          Height = 16
          Alignment = taCenter
          DataField = 'DIAS_UNICA'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
          BeforePrint = RLDBText9BeforePrint
        end
        object RLDBText1: TRLDBText
          Left = 969
          Top = 6
          Width = 56
          Height = 16
          Alignment = taCenter
          DataField = 'DIAS_14'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
          BeforePrint = RLDBText9BeforePrint
        end
        object RLDBText2: TRLDBText
          Left = 928
          Top = 6
          Width = 56
          Height = 16
          Alignment = taCenter
          DataField = 'DIAS_12'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
          BeforePrint = RLDBText9BeforePrint
        end
        object RLDBText3: TRLDBText
          Left = 885
          Top = 6
          Width = 56
          Height = 16
          Alignment = taCenter
          DataField = 'DIAS_10'
          DataSource = dsPrevisao
          Text = ''
          Transparent = False
          BeforePrint = RLDBText9BeforePrint
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 270
    Width = 629
    Height = 39
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 284
    ExplicitWidth = 630
    DesignSize = (
      629
      39)
    object btnImprimir: TSpeedButton
      Left = 449
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
      ExplicitLeft = 448
    end
    object SpeedButton1: TSpeedButton
      Left = 268
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
      ExplicitLeft = 267
    end
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 8
    Width = 605
    Height = 89
    Caption = ' PRODUTO '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    inline BuscaProduto1: TBuscaProduto
      Left = 26
      Top = 16
      Width = 559
      Height = 66
      TabOrder = 0
      ExplicitLeft = 26
      ExplicitTop = 16
      ExplicitWidth = 559
      inherited StaticText3: TStaticText
        Width = 33
        Color = clBtnFace
        Font.Style = []
        ExplicitWidth = 33
      end
      inherited StaticText1: TStaticText
        Width = 56
        Color = clBtnFace
        Font.Style = []
        ExplicitWidth = 56
      end
      inherited StaticText2: TStaticText
        Width = 52
        Caption = 'Descri'#231#227'o'
        Color = clBtnFace
        Font.Style = []
        ExplicitWidth = 52
      end
      inherited edtReferencia: TEdit
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited edtDescricao: TEdit
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited edtGrade: TEdit
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object rgpOrdem: TRadioGroup
    Left = 332
    Top = 104
    Width = 285
    Height = 87
    Caption = ' ORDENADO POR: '
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ItemIndex = 1
    Items.Strings = (
      'Refer'#234'ncia da cor'
      'Descri'#231#227'o da cor')
    ParentFont = False
    TabOrder = 3
  end
  object GroupBox2: TGroupBox
    Left = 12
    Top = 104
    Width = 309
    Height = 87
    Caption = ' PER'#205'ODO DE VENDAS '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object Label6: TLabel
      Left = 29
      Top = 21
      Width = 57
      Height = 13
      Caption = 'Data Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 174
      Top = 21
      Width = 52
      Height = 13
      Caption = 'Data Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object dtpInicio: TDateTimePicker
      Left = 29
      Top = 36
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
      Left = 174
      Top = 36
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
    object chkPeriodoRep: TCheckBox
      Left = 29
      Top = 66
      Width = 97
      Height = 16
      Caption = 'Per'#237'odo Geral'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      OnClick = chkPeriodoRepClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 12
    Top = 200
    Width = 605
    Height = 57
    TabOrder = 5
    object chkMFS: TCheckBox
      Left = 24
      Top = 24
      Width = 273
      Height = 17
      Caption = 'Incluir cores MASCULINO, FEMININO e SORTIDO'
      TabOrder = 0
    end
    object chkNF: TCheckBox
      Left = 328
      Top = 24
      Width = 233
      Height = 17
      Caption = 'Incluir Pedidos N'#195'O faturados'
      TabOrder = 1
    end
  end
  object dsPrevisao: TDataSource
    DataSet = qryPrevisao
    Left = 48
    Top = 8
  end
  object qryPrevisao: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'Select pro.codigo codpro, pro.referencia refpro, pro.descricao p' +
        'roduto, cor.referencia refcor, cor.descricao cor, prev.data_inic' +
        'ial,'
      
        '       TRUNC(prev.dias_rn) dias_rn, TRUNC(prev.dias_p) dias_p, T' +
        'RUNC(prev.dias_m) dias_m, TRUNC(prev.dias_g) dias_g,'
      
        'TRUNC(prev.dias_1) dias_1, TRUNC(prev.dias_2) dias_2, TRUNC(prev' +
        '.dias_3) dias_3, TRUNC(prev.dias_4) dias_4,  '
      
        'TRUNC(prev.dias_6) dias_6, TRUNC(prev.dias_8) dias_8, TRUNC(prev' +
        '.dias_10) dias_10, TRUNC(prev.dias_12) dias_12,'
      'TRUNC(prev.dias_14) dias_14, TRUNC(prev.dias_unica) dias_unica'
      ''
      'from produtos pro'
      ''
      'left join produto_cores pc on pc.codproduto = pro.codigo'
      'left join cores    cor on cor.codigo = pc.codcor'
      
        'left join previsao_estoque(cor.codigo, pro.codigo, :dti, :dtf, '#39 +
        'S'#39') prev on 1=1'
      ''
      'where pro.codigo = 41 and'
      
        '      ((prev.dias_rn+ prev.dias_p+ prev.dias_m+ prev.dias_g+ pre' +
        'v.dias_1+ prev.dias_2+'
      
        '       prev.dias_3+ prev.dias_4+ prev.dias_6+ prev.dias_8+prev.d' +
        'ias_10+prev.dias_12+prev.dias_14+ prev.dias_unica) > 0)'
      'order by cor.descricao')
    Left = 8
    Top = 8
    ParamData = <
      item
        Name = 'DTI'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DTF'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qryPrevisaoCODPRO: TIntegerField
      FieldName = 'CODPRO'
      Origin = 'CODIGO'
      Required = True
    end
    object qryPrevisaoREFPRO: TStringField
      FieldName = 'REFPRO'
      Origin = 'REFERENCIA'
      Size = 18
    end
    object qryPrevisaoPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object qryPrevisaoREFCOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFCOR'
      Origin = 'REFERENCIA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoCOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COR'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryPrevisaoDATA_INICIAL: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_INICIAL'
      Origin = 'DATA_INICIAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoDIAS_RN: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_RN'
      Origin = 'DIAS_RN'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoDIAS_P: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_P'
      Origin = 'DIAS_P'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoDIAS_M: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_M'
      Origin = 'DIAS_M'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoDIAS_G: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_G'
      Origin = 'DIAS_G'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoDIAS_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_1'
      Origin = 'DIAS_1'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoDIAS_2: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_2'
      Origin = 'DIAS_2'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoDIAS_3: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_3'
      Origin = 'DIAS_3'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoDIAS_4: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_4'
      Origin = 'DIAS_4'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoDIAS_6: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_6'
      Origin = 'DIAS_6'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoDIAS_8: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_8'
      Origin = 'DIAS_8'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoDIAS_UNICA: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_UNICA'
      Origin = 'DIAS_UNICA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoDIAS_10: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_10'
      Origin = 'DIAS_10'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoDIAS_12: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_12'
      Origin = 'DIAS_12'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPrevisaoDIAS_14: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_14'
      Origin = 'DIAS_14'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
