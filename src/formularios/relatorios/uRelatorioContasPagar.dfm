inherited frmRelatorioContasPagar: TfrmRelatorioContasPagar
  Left = 602
  Top = 132
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Contas a Pagar'
  ClientHeight = 472
  ClientWidth = 476
  OnShow = FormShow
  ExplicitWidth = 482
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport2: TRLReport
    Left = 488
    Top = 72
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
    BeforePrint = RLReport2BeforePrint
    OnPageStarting = RLReport2PageStarting
    object RLGroup2: TRLGroup
      Left = 39
      Top = 104
      Width = 716
      Height = 161
      DataFields = 'CODIGO'
      BeforePrint = RLGroup2BeforePrint
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 716
        Height = 71
        BandType = btColumnHeader
        Color = clWhite
        ParentColor = False
        Transparent = False
        BeforePrint = RLBand4BeforePrint
        object RLDraw1: TRLDraw
          Left = 0
          Top = 11
          Width = 717
          Height = 59
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Brush.Color = 14145495
          Pen.Style = psClear
        end
        object RLDBText1: TRLDBText
          Left = 56
          Top = 15
          Width = 71
          Height = 16
          DataField = 'NUM_DOCUMENTO'
          DataSource = ds
          Text = ''
        end
        object RLDBText11: TRLDBText
          Left = 187
          Top = 15
          Width = 70
          Height = 16
          DataField = 'DT_DOCUMENTO'
          DataSource = ds
          Text = ''
        end
        object RLDBText12: TRLDBText
          Left = 325
          Top = 15
          Width = 70
          Height = 16
          DataField = 'DT_LANCAMENTO'
          DataSource = ds
          Text = ''
        end
        object RLDBText13: TRLDBText
          Left = 448
          Top = 15
          Width = 97
          Height = 16
          DataField = 'DESC_STATUS'
          DataSource = ds
          Text = ''
        end
        object RLLabel1: TRLLabel
          Left = 5
          Top = 15
          Width = 50
          Height = 16
          Caption = 'N'#186' Doc:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel12: TRLLabel
          Left = 133
          Top = 15
          Width = 53
          Height = 16
          Caption = 'DT Doc:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 263
          Top = 15
          Width = 60
          Height = 16
          Caption = 'DT Lanc:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel14: TRLLabel
          Left = 399
          Top = 15
          Width = 47
          Height = 16
          Caption = 'Status:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel15: TRLLabel
          Left = 575
          Top = 15
          Width = 53
          Height = 16
          Caption = 'VALOR:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText14: TRLDBText
          Left = 664
          Top = 15
          Width = 48
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR'
          DataSource = ds
          Text = ''
          BeforePrint = RLDBText14BeforePrint
        end
        object RLDBText15: TRLDBText
          Left = 84
          Top = 32
          Width = 95
          Height = 16
          DataField = 'FORNECEDOR'
          DataSource = ds
          Text = ''
        end
        object RLLabel16: TRLLabel
          Left = 5
          Top = 32
          Width = 77
          Height = 16
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel17: TRLLabel
          Left = 5
          Top = 49
          Width = 79
          Height = 16
          Caption = 'Observa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText19: TRLDBText
          Left = 85
          Top = 49
          Width = 96
          Height = 16
          DataField = 'OBSERVACAO'
          DataSource = ds
          Text = ''
          BeforePrint = RLDBText8BeforePrint
        end
      end
      object RLGroup3: TRLGroup
        Left = 0
        Top = 71
        Width = 716
        Height = 27
        DataFields = 'CODIGO;CODIGO_1'
        object RLBand5: TRLBand
          Left = 0
          Top = 0
          Width = 716
          Height = 19
          BeforePrint = RLBand5BeforePrint
          object RLDBText9: TRLDBText
            Left = 6
            Top = 1
            Width = 329
            Height = 15
            AutoSize = False
            DataField = 'MATERIA'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText10: TRLDBText
            Left = 375
            Top = 1
            Width = 53
            Height = 16
            DataField = 'QUANTIDADE'
            DataSource = ds
            Text = ''
            Transparent = False
          end
          object RLDBText20: TRLDBText
            Left = 524
            Top = 1
            Width = 54
            Height = 17
            Alignment = taRightJustify
            DataField = 'PRECO_CUSTO'
            DataSource = ds
            Text = ''
            Transparent = False
          end
          object RLLabel8: TRLLabel
            Left = 338
            Top = 1
            Width = 38
            Height = 16
            Caption = 'Qtde:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel9: TRLLabel
            Left = 440
            Top = 1
            Width = 84
            Height = 16
            Caption = 'Pre'#231'o Custo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel10: TRLLabel
            Left = 602
            Top = 1
            Width = 28
            Height = 16
            Caption = 'Tot:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLDBText2: TRLDBText
            Left = 665
            Top = 1
            Width = 44
            Height = 16
            Alignment = taRightJustify
            DataField = 'TOTAL'
            DataSource = ds
            Text = ''
            Transparent = False
          end
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 98
        Width = 716
        Height = 42
        AutoSize = True
        BandType = btFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel11: TRLLabel
          Left = -2
          Top = -11
          Width = 718
          Height = 16
          Caption = 
            '________________________________________________________________' +
            '______________________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 9671571
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = -2
          Top = 9
          Width = 718
          Height = 16
          Caption = 
            '________________________________________________________________' +
            '______________________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 9671571
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object rlmParcelas: TRLMemo
          Left = 25
          Top = 26
          Width = 688
          Height = 16
          Behavior = [beSiteExpander]
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Borders.Color = 6381921
        end
        object RLLabel2: TRLLabel
          Left = 26
          Top = 7
          Width = 71
          Height = 16
          Caption = 'N'#186' Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel3: TRLLabel
          Left = 117
          Top = 7
          Width = 101
          Height = 16
          Caption = 'DT Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel4: TRLLabel
          Left = 247
          Top = 7
          Width = 98
          Height = 16
          Caption = 'DT Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel5: TRLLabel
          Left = 399
          Top = 7
          Width = 38
          Height = 16
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel6: TRLLabel
          Left = 503
          Top = 7
          Width = 75
          Height = 16
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel22: TRLLabel
          Left = 647
          Top = 7
          Width = 41
          Height = 16
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
    object RLBand6: TRLBand
      Left = 39
      Top = 39
      Width = 716
      Height = 65
      BandType = btTitle
      AfterPrint = RLBand6AfterPrint
      object RLLabel18: TRLLabel
        Left = 229
        Top = 8
        Width = 263
        Height = 22
        Caption = 'Relat'#243'rio de Contas a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel19: TRLLabel
        Left = 492
        Top = 47
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
      object RLSystemInfo3: TRLSystemInfo
        Left = 528
        Top = 47
        Width = 39
        Height = 16
        Text = ''
      end
      object RLLabel20: TRLLabel
        Left = 616
        Top = 47
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
      object RLSystemInfo4: TRLSystemInfo
        Left = 652
        Top = 47
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 39
      Top = 265
      Width = 716
      Height = 57
      AlignToBottom = True
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = RLBand2BeforePrint
      object RLLabel21: TRLLabel
        Left = 463
        Top = 2
        Width = 138
        Height = 16
        Caption = 'TOTAL DE CONTAS >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlbTotalContas: TRLLabel
        Left = 683
        Top = 2
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel25: TRLLabel
        Left = 463
        Top = 20
        Width = 101
        Height = 16
        Caption = 'TOTAL PAGO >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3947580
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlbTotalPago: TRLLabel
        Left = 683
        Top = 18
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel27: TRLLabel
        Left = 463
        Top = 38
        Width = 61
        Height = 16
        Caption = 'SALDO >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3947580
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlbTotalSaldo: TRLLabel
        Left = 683
        Top = 36
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
    end
  end
  object gpbPeriodo: TGroupBox
    Left = 8
    Top = 2
    Width = 257
    Height = 81
    Caption = ' Per'#237'odo '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
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
      Top = 46
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
      Top = 62
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
  object rgpFiltroPeriodo: TRadioGroup
    Left = 280
    Top = 2
    Width = 185
    Height = 81
    Caption = ' Filtro Per'#237'odo [ Data de: ] '
    ItemIndex = 0
    Items.Strings = (
      'Lan'#231'amento'
      'Documento'
      'Vencimento')
    TabOrder = 1
  end
  object gpbMateria: TGroupBox
    Left = 8
    Top = 181
    Width = 457
    Height = 83
    Caption = ' Filtro [ Mat'#233'ria ] '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    inline BuscaMateria1: TBuscaMateria
      Left = 18
      Top = 27
      Width = 426
      Height = 39
      AutoSize = True
      TabOrder = 0
      ExplicitLeft = 18
      ExplicitTop = 27
      ExplicitWidth = 426
      inherited StaticText2: TStaticText
        Width = 52
        Font.Style = []
        ExplicitWidth = 52
      end
      inherited StaticText1: TStaticText
        Width = 37
        Font.Style = []
        ExplicitWidth = 37
      end
      inherited edtCodigo: TCurrencyEdit
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited edtDescricao: TEdit
        Width = 311
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 311
      end
    end
  end
  object rgpLeiaute: TRadioGroup
    Left = 8
    Top = 371
    Width = 457
    Height = 42
    Caption = ' Leiaute do relat'#243'rio '
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'Sint'#233'tico'
      'Anal'#237'tico')
    TabOrder = 3
  end
  object rgpStatus: TRadioGroup
    Left = 8
    Top = 270
    Width = 457
    Height = 45
    Caption = ' Filtro [ Status da Conta ] '
    Columns = 5
    ItemIndex = 4
    Items.Strings = (
      'Abertas'
      'Quitadas'
      'Parciais'
      'Canceladas'
      'Todas')
    TabOrder = 4
    OnClick = rgpStatusClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 428
    Width = 476
    Height = 44
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      476
      44)
    object btnImprimir: TSpeedButton
      Left = 248
      Top = 7
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
      ExplicitLeft = 246
    end
    object SpeedButton1: TSpeedButton
      Left = 64
      Top = 7
      Width = 169
      Height = 30
      Anchors = [akTop, akRight]
      Caption = '<ESC>  Sair'
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
      ExplicitLeft = 62
    end
  end
  object gpbFornecedor: TGroupBox
    Left = 8
    Top = 92
    Width = 457
    Height = 83
    Caption = ' Filtro [ Fornecedor ] '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    inline BuscaFornecedor: TBuscaPessoa
      Left = 18
      Top = 29
      Width = 426
      Height = 38
      AutoSize = True
      TabOrder = 0
      ExplicitLeft = 18
      ExplicitTop = 29
      ExplicitWidth = 426
      inherited StaticText1: TStaticText
        Font.Style = []
      end
      inherited StaticText2: TStaticText
        Width = 68
        Caption = 'Raz'#227'o Social'
        Font.Style = []
        ExplicitWidth = 68
      end
      inherited edtRazao: TEdit
        Width = 325
        ExplicitWidth = 325
      end
    end
  end
  object rgpStatusParcela: TRadioGroup
    Left = 8
    Top = 321
    Width = 457
    Height = 45
    Caption = ' Filtro [ Status das Parcelas ] '
    Columns = 5
    ItemIndex = 3
    Items.Strings = (
      'Abertas'
      'Quitadas'
      'Parciais'
      'Todas')
    TabOrder = 8
  end
  object ds: TDataSource
    DataSet = qry
    Left = 384
    Top = 88
  end
  object dsItens: TDataSource
    DataSet = qryItens
    Left = 384
    Top = 122
  end
  object qry: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'SELECT CP.codigo, CP.codigo_nf, CP.dt_documento, CP.dt_lancament' +
        'o, CP.num_documento, CP.status, CP.desc_status,'
      
        '       CP.valor, CP.observacao, (CP.cod_fornecedor || '#39' '#39'|| PF.r' +
        'azao) FORNECEDOR, IC.CODIGO,'
      
        '       IC.codigo_conta, ic.codigo_materia, ic.quantidade, ic.pre' +
        'co_custo, (ic.quantidade* ic.preco_custo) total, MT.descricao MA' +
        'TERIA FROM contas_pagar CP'
      '  INNER JOIN pessoas     PF ON PF.codigo = CP.cod_fornecedor'
      '  INNER JOIN itens_conta IC ON IC.codigo_conta = CP.codigo'
      '  INNER JOIN materias    MT ON MT.codigo = IC.codigo_materia'
      '  INNER JOIN parcelas    PA ON PA.codigo_conta = CP.codigo'
      ''
      
        'group by CP.codigo, CP.codigo_nf, CP.dt_documento, CP.dt_lancame' +
        'nto, CP.num_documento, CP.status, CP.desc_status,'
      
        '       CP.valor, CP.observacao, CP.cod_fornecedor,PF.razao, IC.C' +
        'ODIGO,'
      
        '       IC.codigo_conta, ic.codigo_materia, ic.quantidade, ic.pre' +
        'co_custo, MT.descricao'
      'order by CP.CODIGO, IC.CODIGO'
      '')
    Left = 296
    Top = 88
    object qryCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCODIGO_NF: TIntegerField
      FieldName = 'CODIGO_NF'
      Origin = 'CODIGO_NF'
    end
    object qryDT_DOCUMENTO: TDateField
      FieldName = 'DT_DOCUMENTO'
      Origin = 'DT_DOCUMENTO'
    end
    object qryDT_LANCAMENTO: TDateField
      FieldName = 'DT_LANCAMENTO'
      Origin = 'DT_LANCAMENTO'
    end
    object qryNUM_DOCUMENTO: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Origin = 'NUM_DOCUMENTO'
    end
    object qrySTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDESC_STATUS: TStringField
      FieldName = 'DESC_STATUS'
      Origin = 'DESC_STATUS'
      FixedChar = True
      Size = 10
    end
    object qryVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object qryOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 120
    end
    object qryFORNECEDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 67
    end
    object qryCODIGO_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_1'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCODIGO_CONTA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_CONTA'
      Origin = 'CODIGO_CONTA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCODIGO_MATERIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_MATERIA'
      Origin = 'CODIGO_MATERIA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryQUANTIDADE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qryPRECO_CUSTO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRECO_CUSTO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryTOTAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
    end
    object qryMATERIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MATERIA'
      Origin = 'MATERIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
  end
  object qryItens: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      'SELECT PA.* FROM contas_pagar CP'
      '  INNER JOIN pessoas     PF ON PF.codigo = CP.cod_fornecedor'
      '  INNER JOIN itens_conta IC ON IC.codigo_conta = CP.codigo'
      '  INNER JOIN materias    MT ON MT.codigo = IC.codigo_materia'
      '  INNER JOIN parcelas    PA ON PA.codigo_conta = CP.codigo'
      ''
      'WHERE PA.CODIGO_CONTA = :cod_conta'
      ''
      
        'group by PA.codigo, PA.codigo_conta, PA.num_parcela, PA.dt_venci' +
        'mento,'
      
        '         PA.dt_pagamento, PA.status, PA.desc_status, PA.valor, P' +
        'A.valor_pago'
      ''
      'order by 1'
      '')
    Left = 296
    Top = 120
    ParamData = <
      item
        Name = 'COD_CONTA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItensCODIGO_CONTA: TIntegerField
      FieldName = 'CODIGO_CONTA'
      Origin = 'CODIGO_CONTA'
    end
    object qryItensNUM_PARCELA: TSmallintField
      FieldName = 'NUM_PARCELA'
      Origin = 'NUM_PARCELA'
    end
    object qryItensDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
      Origin = 'DT_VENCIMENTO'
    end
    object qryItensDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
      Origin = 'DT_PAGAMENTO'
    end
    object qryItensSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryItensDESC_STATUS: TStringField
      FieldName = 'DESC_STATUS'
      Origin = 'DESC_STATUS'
      FixedChar = True
      Size = 10
    end
    object qryItensVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryItensVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'VALOR_PAGO'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
  end
end
