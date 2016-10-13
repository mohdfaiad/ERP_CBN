inherited frmRelatorioMovimentos: TfrmRelatorioMovimentos
  Caption = 'Relat'#243'rio de Pedidos (Loja)'
  ClientHeight = 215
  ClientWidth = 455
  OnShow = FormShow
  ExplicitWidth = 471
  ExplicitHeight = 253
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 23
    Top = 133
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Visible = False
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 39
      Top = 39
      Width = 716
      Height = 65
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel1: TRLLabel
        Left = 228
        Top = 16
        Width = 262
        Height = 24
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Pedidos (Loja)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 531
        Top = 46
        Width = 39
        Height = 16
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 497
        Top = 47
        Width = 32
        Height = 15
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 609
        Top = 47
        Width = 33
        Height = 15
        Caption = 'Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 644
        Top = 46
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
      end
      object lbPeriodo: TRLLabel
        Left = 3
        Top = 47
        Width = 46
        Height = 15
        Caption = 'Per'#237'odo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 39
      Top = 129
      Width = 716
      Height = 80
      DataFields = 'NUMPEDIDO'
      object RLBTituloItens: TRLBand
        Left = 0
        Top = 0
        Width = 716
        Height = 39
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.FixedTop = True
        object rldPedido: TRLDraw
          Left = 0
          Top = 1
          Width = 717
          Height = 21
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object rldDesconto: TRLDraw
          Left = 565
          Top = 1
          Width = 69
          Height = 21
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object rldCC: TRLDraw
          Left = 388
          Top = 1
          Width = 78
          Height = 21
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object rldDinheiro: TRLDraw
          Left = 229
          Top = 1
          Width = 70
          Height = 21
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLLabel15: TRLLabel
          Left = -2
          Top = 11
          Width = 720
          Height = 16
          Caption = 
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '---------------------------------------------------'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = -1
          Top = 2
          Width = 82
          Height = 16
          DataField = 'NUMPEDIDO'
          DataSource = ds
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 100
          Top = 4
          Width = 82
          Height = 16
          Alignment = taCenter
          DataField = 'DATA_HORA'
          DataSource = ds
          Text = ''
        end
        object rldbDinheiro: TRLDBText
          Left = 255
          Top = 2
          Width = 29
          Height = 16
          Alignment = taRightJustify
          DataField = 'VP1'
          DataSource = ds
          Text = ''
          BeforePrint = rldbDinheiroBeforePrint
        end
        object rldbConvenio: TRLDBText
          Left = 331
          Top = 2
          Width = 29
          Height = 16
          Alignment = taRightJustify
          DataField = 'VP2'
          DataSource = ds
          Text = ''
          BeforePrint = rldbConvenioBeforePrint
        end
        object rldbCartCredito: TRLDBText
          Left = 420
          Top = 2
          Width = 29
          Height = 16
          Alignment = taRightJustify
          DataField = 'VP3'
          DataSource = ds
          Text = ''
          BeforePrint = rldbCartCreditoBeforePrint
        end
        object rldbCartDebito: TRLDBText
          Left = 506
          Top = 3
          Width = 29
          Height = 16
          Alignment = taRightJustify
          DataField = 'VP4'
          DataSource = ds
          Text = ''
          BeforePrint = rldbCartDebitoBeforePrint
        end
        object rldbDesconto: TRLDBText
          Left = 540
          Top = 3
          Width = 76
          Height = 16
          Alignment = taRightJustify
          DataField = 'DESCONTO'
          DataSource = ds
          Text = ''
          BeforePrint = rldbDescontoBeforePrint
        end
        object rldbTotal: TRLDBText
          Left = 620
          Top = 3
          Width = 95
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR_TOTAL'
          DataSource = ds
          Text = ''
          BeforePrint = rldbTotalBeforePrint
        end
        object RLLabel14: TRLLabel
          Left = 517
          Top = 21
          Width = 34
          Height = 15
          Caption = 'QTDE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 579
          Top = 21
          Width = 35
          Height = 15
          Caption = 'PESO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel12: TRLLabel
          Left = 642
          Top = 21
          Width = 71
          Height = 15
          Caption = 'TOTAL ITEM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel16: TRLLabel
          Left = 443
          Top = 21
          Width = 43
          Height = 15
          Caption = 'PRE'#199'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel17: TRLLabel
          Left = 15
          Top = 21
          Width = 27
          Height = 15
          Caption = 'REF.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel18: TRLLabel
          Left = 85
          Top = 21
          Width = 60
          Height = 15
          Caption = 'PRODUTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBItens: TRLBand
        Left = 0
        Top = 39
        Width = 716
        Height = 20
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBText9: TRLDBText
          Left = 15
          Top = 2
          Width = 80
          Height = 15
          DataField = 'REFERENCIA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText10: TRLDBText
          Left = 87
          Top = 2
          Width = 347
          Height = 16
          AutoSize = False
          DataField = 'DESCRICAO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText11: TRLDBText
          Left = 445
          Top = 2
          Width = 46
          Height = 15
          Alignment = taRightJustify
          DataField = 'PRECO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText12: TRLDBText
          Left = 498
          Top = 2
          Width = 72
          Height = 15
          Alignment = taCenter
          DataField = 'QTD_TOTAL'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText13: TRLDBText
          Left = 586
          Top = 2
          Width = 36
          Height = 15
          Alignment = taRightJustify
          DataField = 'PESO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText14: TRLDBText
          Left = 641
          Top = 2
          Width = 74
          Height = 15
          Alignment = taRightJustify
          DataField = 'TOTAL_ITEM'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
    end
    object RLBTitulo: TRLBand
      Left = 39
      Top = 104
      Width = 716
      Height = 25
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDraw1: TRLDraw
        Left = 0
        Top = 0
        Width = 717
        Height = 24
        Brush.Color = 15395562
        Pen.Style = psClear
      end
      object RLLabel19: TRLLabel
        Left = 0
        Top = 7
        Width = 47
        Height = 16
        Caption = 'N'#186' Ped'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel20: TRLLabel
        Left = 101
        Top = 7
        Width = 79
        Height = 16
        Caption = 'Data e Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 235
        Top = 6
        Width = 58
        Height = 16
        Caption = 'Dinheiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel22: TRLLabel
        Left = 309
        Top = 6
        Width = 64
        Height = 16
        Caption = 'Conv'#234'nio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel23: TRLLabel
        Left = 387
        Top = 6
        Width = 80
        Height = 16
        Caption = 'Cart'#227'o Cr'#233'd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel24: TRLLabel
        Left = 480
        Top = 6
        Width = 75
        Height = 16
        Caption = 'Cart'#227'o D'#233'b'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel25: TRLLabel
        Left = 568
        Top = 6
        Width = 63
        Height = 16
        Caption = 'Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel26: TRLLabel
        Left = 642
        Top = 7
        Width = 74
        Height = 16
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand4: TRLBand
      Left = 39
      Top = 209
      Width = 716
      Height = 40
      AlignToBottom = True
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = RLBand4BeforePrint
      object RLLabel4: TRLLabel
        Left = 230
        Top = 1
        Width = 58
        Height = 16
        Caption = 'Dinheiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 304
        Top = 1
        Width = 64
        Height = 16
        Caption = 'Conv'#234'nio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 382
        Top = 1
        Width = 80
        Height = 16
        Caption = 'Cart'#227'o Cr'#233'd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 475
        Top = 1
        Width = 75
        Height = 16
        Caption = 'Cart'#227'o D'#233'b'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 565
        Top = 1
        Width = 63
        Height = 16
        Caption = 'Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 637
        Top = 2
        Width = 74
        Height = 16
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDinheiro: TRLLabel
        Left = 227
        Top = 19
        Width = 61
        Height = 16
        Alignment = taRightJustify
      end
      object lbConvenio: TRLLabel
        Left = 303
        Top = 19
        Width = 66
        Height = 16
        Alignment = taRightJustify
      end
      object lbCartCredito: TRLLabel
        Left = 383
        Top = 19
        Width = 79
        Height = 16
        Alignment = taRightJustify
      end
      object lbCartDebito: TRLLabel
        Left = 475
        Top = 19
        Width = 75
        Height = 16
        Alignment = taRightJustify
      end
      object lbDesconto: TRLLabel
        Left = 559
        Top = 19
        Width = 69
        Height = 16
        Alignment = taRightJustify
      end
      object lbTotal: TRLLabel
        Left = 669
        Top = 19
        Width = 42
        Height = 16
        Alignment = taRightJustify
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 176
    Width = 455
    Height = 39
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      455
      39)
    object btnImprimir: TSpeedButton
      Left = 275
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
      ExplicitLeft = 314
    end
    object btnSair: TSpeedButton
      Left = 94
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
      OnClick = btnSairClick
      ExplicitLeft = 133
    end
  end
  object gpbPeriodo: TGroupBox
    Left = 8
    Top = 6
    Width = 257
    Height = 90
    Caption = ' Per'#237'odo '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label6: TLabel
      Left = 15
      Top = 16
      Width = 57
      Height = 13
      Caption = 'Data Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 136
      Top = 16
      Width = 52
      Height = 13
      Caption = 'Data Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 1
      Top = 50
      Width = 254
      Height = 14
      AutoSize = False
      Caption = '___________________________________________'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13487565
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object dtpInicio: TDateTimePicker
      Left = 15
      Top = 31
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
    end
    object dtpFim: TDateTimePicker
      Left = 136
      Top = 31
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
    end
    object chkPeriodoGeral: TCheckBox
      Left = 48
      Top = 66
      Width = 161
      Height = 17
      Caption = 'Considerar per'#237'odo geral'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = chkPeriodoGeralClick
    end
  end
  object gpbFiltroMoeda: TGroupBox
    Left = 283
    Top = 8
    Width = 161
    Height = 90
    Caption = ' Filtro tipo moeda '
    TabOrder = 3
    object chkDinheiro: TCheckBox
      Left = 8
      Top = 17
      Width = 97
      Height = 17
      Caption = 'Dinheiro'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chkConvenio: TCheckBox
      Left = 8
      Top = 34
      Width = 97
      Height = 17
      Caption = 'Conv'#234'nio'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chkCartaoCredito: TCheckBox
      Left = 8
      Top = 51
      Width = 97
      Height = 17
      Caption = 'Cart'#227'o cr'#233'dito'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object chkCartaoDebito: TCheckBox
      Left = 8
      Top = 68
      Width = 97
      Height = 17
      Caption = 'Cart'#227'o d'#233'bito'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object rgpLeiaute: TRadioGroup
    Left = 13
    Top = 102
    Width = 431
    Height = 41
    Caption = ' Leiaute '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Sint'#233'tico'
      'Anal'#237'tico')
    TabOrder = 4
  end
  object ds: TDataSource
    DataSet = qry
    Left = 368
    Top = 54
  end
  object qry: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select ped.numpedido, mov.data  data_hora, ped.valor_total, ped.' +
        'desconto,'
      '(select mov1.valor_pago from movimentos mov1'
      
        'where mov1.codigo_pedido = mov.codigo_pedido and mov1.tipo_moeda' +
        ' = 1) VP1,'
      '(select mov2.valor_pago from movimentos mov2'
      
        'where mov2.codigo_pedido = mov.codigo_pedido and mov2.tipo_moeda' +
        ' = 2) VP2,'
      '(select mov3.valor_pago from movimentos mov3'
      
        'where mov3.codigo_pedido = mov.codigo_pedido and mov3.tipo_moeda' +
        ' = 3) VP3,'
      '(select mov4.valor_pago from movimentos mov4'
      
        'where mov4.codigo_pedido = mov.codigo_pedido and mov4.tipo_moeda' +
        ' = 4) VP4,'
      
        'pro.referencia, pro.descricao, itn.preco, itn.qtd_total, itn.pes' +
        'o, itn.valor_total total_item'
      ''
      'from movimentos mov'
      ''
      'inner join pedidos  ped on ped.codigo = mov.codigo_pedido'
      'inner join itens    itn on itn.cod_pedido = ped.codigo'
      'inner join produtos pro on pro.codigo = itn.cod_produto'
      'inner join cores    cor on cor.codigo = itn.cod_cor'
      
        'where  mov.tipo_moeda in (1,2,3,4) and mov.data between :dti and' +
        ' :dtf')
    Left = 368
    Top = 8
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
      end>
    object qryNUMPEDIDO: TStringField
      FieldName = 'NUMPEDIDO'
      Origin = 'NUMPEDIDO'
      Size = 22
    end
    object qryDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
    end
    object qryVP1: TBCDField
      FieldName = 'VP1'
      Origin = 'VALOR_PAGO'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryVP2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VP2'
      Origin = 'VP2'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryVP3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VP3'
      Origin = 'VP3'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryVP4: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VP4'
      Origin = 'VP4'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 18
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object qryPRECO: TBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object qryQTD_TOTAL: TBCDField
      FieldName = 'QTD_TOTAL'
      Origin = 'QTD_TOTAL'
      Precision = 18
      Size = 2
    end
    object qryPESO: TBCDField
      FieldName = 'PESO'
      Origin = 'PESO'
      Precision = 18
      Size = 3
    end
    object qryTOTAL_ITEM: TBCDField
      FieldName = 'TOTAL_ITEM'
      Origin = 'TOTAL_ITEM'
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 2
    end
  end
  object qryEntSai: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select ped.numpedido, mov.data  data_hora, ped.valor_total, ped.' +
        'desconto,'
      '(select mov1.valor_pago from movimentos mov1'
      
        'where mov1.codigo_pedido = mov.codigo_pedido and mov1.tipo_moeda' +
        ' = 1) VP1,'
      '(select mov2.valor_pago from movimentos mov2'
      
        'where mov2.codigo_pedido = mov.codigo_pedido and mov2.tipo_moeda' +
        ' = 2) VP2,'
      '(select mov3.valor_pago from movimentos mov3'
      
        'where mov3.codigo_pedido = mov.codigo_pedido and mov3.tipo_moeda' +
        ' = 3) VP3,'
      '(select mov4.valor_pago from movimentos mov4'
      
        'where mov4.codigo_pedido = mov.codigo_pedido and mov4.tipo_moeda' +
        ' = 4) VP4,'
      
        'pro.referencia, pro.descricao, itn.preco, itn.qtd_total, itn.pes' +
        'o, itn.valor_total total_item'
      ''
      'from movimentos mov'
      ''
      'inner join pedidos  ped on ped.codigo = mov.codigo_pedido'
      'inner join itens    itn on itn.cod_pedido = ped.codigo'
      'inner join produtos pro on pro.codigo = itn.cod_produto'
      'inner join cores    cor on cor.codigo = itn.cod_cor'
      
        'where  mov.tipo_moeda in (1,2,3,4) and mov.data between :dti and' +
        ' :dtf')
    Left = 464
    Top = 8
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
      end>
    object StringField1: TStringField
      FieldName = 'NUMPEDIDO'
      Origin = 'NUMPEDIDO'
      Size = 22
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
    end
    object BCDField1: TBCDField
      FieldName = 'VP1'
      Origin = 'VALOR_PAGO'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object BCDField2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VP2'
      Origin = 'VP2'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object BCDField3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VP3'
      Origin = 'VP3'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object BCDField4: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VP4'
      Origin = 'VP4'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object BCDField5: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object BCDField6: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 18
    end
    object StringField3: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object BCDField7: TBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object BCDField8: TBCDField
      FieldName = 'QTD_TOTAL'
      Origin = 'QTD_TOTAL'
      Precision = 18
      Size = 2
    end
    object BCDField9: TBCDField
      FieldName = 'PESO'
      Origin = 'PESO'
      Precision = 18
      Size = 3
    end
    object BCDField10: TBCDField
      FieldName = 'TOTAL_ITEM'
      Origin = 'TOTAL_ITEM'
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsEntSai: TDataSource
    DataSet = qryEntSai
    Left = 464
    Top = 54
  end
end
