inherited frmRelatorioClientes: TfrmRelatorioClientes
  Left = 453
  Top = 205
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Clientes por Representante'
  ClientHeight = 470
  ClientWidth = 496
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 502
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 11
    Top = 376
    Width = 263
    Height = 15
    Caption = 'Informe o diret'#243'rio em que o arquivo ser'#225' salvo'
  end
  object RLReport1: TRLReport
    Left = 27
    Top = 155
    Width = 1123
    Height = 794
    Margins.LeftMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = dsClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    Visible = False
    BeforePrint = RLReport1BeforePrint
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
        Left = 864
        Top = 61
        Width = 87
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 446
        Top = 15
        Width = 214
        Height = 24
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 656
        Top = 61
        Width = 39
        Height = 16
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 787
        Top = 61
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
      end
      object RLLabel4: TRLLabel
        Left = 617
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
        Left = 747
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
        Left = 873
        Top = 61
        Width = 35
        Height = 16
        Caption = 'P'#225'g.:'
      end
      object RLLabel7: TRLLabel
        Left = 952
        Top = 61
        Width = 8
        Height = 16
        Caption = '/'
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 961
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
      object RLLabel18: TRLLabel
        Left = 5
        Top = 61
        Width = 58
        Height = 16
        Caption = 'Per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlbPeriodo: TRLLabel
        Left = 65
        Top = 61
        Width = 52
        Height = 16
        Caption = 'Per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 20
      Top = 261
      Width = 1083
      Height = 24
      AlignToBottom = True
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBResult1: TRLDBResult
        Left = 688
        Top = 4
        Width = 53
        Height = 17
        DataField = 'CPF_CNPJ'
        DataSource = dsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Info = riCount
        ParentFont = False
        Text = ''
      end
      object RLLabel12: TRLLabel
        Left = 472
        Top = 5
        Width = 193
        Height = 16
        Caption = 'Quantidade Total de Clientes:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 20
      Top = 120
      Width = 1083
      Height = 141
      DataFields = 'COD_REPRESENTANTE'
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
        end
        object RLDBText5: TRLDBText
          Left = 125
          Top = 5
          Width = 115
          Height = 16
          DataField = 'REPRESENTANTE'
          DataSource = dsClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
      end
      object RLGroup2: TRLGroup
        Left = 0
        Top = 24
        Width = 1083
        Height = 105
        DataFields = 'CODCIDADE;COD_REPRESENTANTE'
        BeforePrint = RLGroup2BeforePrint
        object RLBand5: TRLBand
          Left = 0
          Top = 0
          Width = 1083
          Height = 26
          BandType = btHeader
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          Color = 15132390
          ParentColor = False
          Transparent = False
          object RLLabel9: TRLLabel
            Left = 13
            Top = 5
            Width = 53
            Height = 16
            Caption = 'Cidade:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLDBText6: TRLDBText
            Left = 69
            Top = 5
            Width = 52
            Height = 16
            DataField = 'CIDADE'
            DataSource = dsClientes
            Text = ''
            Transparent = False
          end
        end
        object RLBand2: TRLBand
          Left = 0
          Top = 47
          Width = 1083
          Height = 23
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          Color = 15132390
          ParentColor = False
          Transparent = False
          object RLDBText1: TRLDBText
            Left = 54
            Top = 4
            Width = 307
            Height = 15
            AutoSize = False
            DataField = 'RAZAO'
            DataSource = dsClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText2: TRLDBText
            Left = 369
            Top = 4
            Width = 52
            Height = 14
            Alignment = taCenter
            DataField = 'CPF_CNPJ'
            DataSource = dsClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText3: TRLDBText
            Left = 584
            Top = 4
            Width = 38
            Height = 14
            Alignment = taCenter
            DataField = 'FONE1'
            DataSource = dsClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText4: TRLDBText
            Left = 4
            Top = 4
            Width = 46
            Height = 14
            Alignment = taCenter
            DataField = 'CODIGO'
            DataSource = dsClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText7: TRLDBText
            Left = 646
            Top = 4
            Width = 238
            Height = 15
            AutoSize = False
            DataField = 'LOGRADOURO'
            DataSource = dsClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText8: TRLDBText
            Left = 887
            Top = 4
            Width = 48
            Height = 15
            AutoSize = False
            DataField = 'NUMERO'
            DataSource = dsClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText9: TRLDBText
            Left = 937
            Top = 4
            Width = 144
            Height = 15
            AutoSize = False
            DataField = 'BAIRRO'
            DataSource = dsClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText10: TRLDBText
            Left = 451
            Top = 4
            Width = 38
            Height = 14
            AutoSize = False
            DataField = 'QTD_COMPRAS'
            DataSource = dsClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
            BeforePrint = RLDBText10BeforePrint
          end
          object RLDBText11: TRLDBText
            Left = 475
            Top = 4
            Width = 78
            Height = 14
            Alignment = taRightJustify
            DataField = 'VLR_COMPRAS'
            DataSource = dsClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
            BeforePrint = RLDBText11BeforePrint
          end
        end
        object RLBand6: TRLBand
          Left = 0
          Top = 70
          Width = 1083
          Height = 22
          BandType = btFooter
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Color = 15132390
          ParentColor = False
          Transparent = False
          object RLDBResult2: TRLDBResult
            Left = 1008
            Top = 3
            Width = 53
            Height = 17
            DataField = 'CPF_CNPJ'
            DataSource = dsClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            Info = riCount
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLLabel16: TRLLabel
            Left = 851
            Top = 5
            Width = 137
            Height = 15
            Caption = 'Quantidade de Clientes:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 3881787
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
        object RLBand7: TRLBand
          Left = 0
          Top = 26
          Width = 1083
          Height = 21
          BandType = btColumnHeader
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          Color = 15132390
          ParentColor = False
          Transparent = False
          object RLLabel10: TRLLabel
            Left = 3
            Top = 4
            Width = 46
            Height = 15
            Caption = 'CLIENTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel11: TRLLabel
            Left = 367
            Top = 4
            Width = 56
            Height = 15
            Caption = 'CPF/CNPJ'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel14: TRLLabel
            Left = 443
            Top = 4
            Width = 99
            Height = 15
            Caption = 'COMPRAS  TOTAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel3: TRLLabel
            Left = 645
            Top = 4
            Width = 27
            Height = 15
            Caption = 'Rua:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2894892
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel15: TRLLabel
            Left = 887
            Top = 4
            Width = 22
            Height = 15
            Caption = 'N'#186':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2894892
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel17: TRLLabel
            Left = 937
            Top = 4
            Width = 40
            Height = 15
            Caption = 'Bairro:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2894892
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel2: TRLLabel
            Left = 585
            Top = 4
            Width = 33
            Height = 15
            Caption = 'FONE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
      end
    end
  end
  object gpbCidade: TGroupBox
    Left = 10
    Top = 216
    Width = 474
    Height = 85
    Caption = ' Cidade '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    inline BuscaCidade1: TBuscaCidade
      Left = 16
      Top = 18
      Width = 444
      Height = 47
      TabOrder = 0
      ExplicitLeft = 16
      ExplicitTop = 18
      ExplicitHeight = 47
      inherited StaticText3: TStaticText
        Left = 411
        Font.Color = 4079166
        ExplicitLeft = 411
      end
      inherited StaticText2: TStaticText
        Left = 106
        Width = 37
        Font.Color = 4079166
        Font.Style = []
        Transparent = True
        ExplicitLeft = 106
        ExplicitWidth = 37
      end
      inherited StaticText1: TStaticText
        Width = 65
        Caption = 'C'#243'digo IBGE'
        Font.Color = 4079166
        Font.Style = []
        Transparent = True
        ExplicitWidth = 65
      end
      inherited edtCidade: TEdit
        Left = 107
        ExplicitLeft = 107
      end
      inherited btnBusca: TBitBtn
        Left = 82
        ExplicitLeft = 82
      end
      inherited edtUF: TEdit
        Left = 410
        ExplicitLeft = 410
      end
      inherited edtCodCid: TCurrencyEdit
        Width = 81
        ExplicitWidth = 81
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 10
    Top = 7
    Width = 474
    Height = 78
    Caption = ' Representante '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    inline BuscaPessoa1: TBuscaPessoa
      Left = 16
      Top = 24
      Width = 444
      Height = 38
      AutoSize = True
      TabOrder = 0
      ExplicitLeft = 16
      ExplicitTop = 24
      ExplicitWidth = 444
      inherited StaticText1: TStaticText
        Font.Color = 4079166
      end
      inherited StaticText2: TStaticText
        Width = 68
        Caption = 'Raz'#227'o Social'
        Font.Color = 4079166
        ExplicitWidth = 68
      end
      inherited edtRazao: TEdit
        Width = 343
        ExplicitWidth = 343
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 431
    Width = 496
    Height = 39
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      496
      39)
    object btnImprimir: TSpeedButton
      Left = 316
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
      Left = 135
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
  object rgFiltroClientes: TRadioGroup
    Left = 10
    Top = 306
    Width = 474
    Height = 43
    Caption = ' Filtro de Clientes '
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'INCLUIR clientes bloqueados'
      'EXCLUIR clientes bloqueados')
    TabOrder = 4
  end
  object gpbEstado: TGroupBox
    Left = 10
    Top = 256
    Width = 474
    Height = 85
    Caption = ' Estado '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Visible = False
    inline BuscaEstado1: TBuscaEstado
      Left = 14
      Top = 24
      Width = 452
      Height = 47
      TabOrder = 0
      ExplicitLeft = 14
      ExplicitTop = 24
      ExplicitWidth = 452
      inherited StaticText2: TStaticText
        Left = 105
        Width = 37
        Font.Color = 4079166
        Font.Style = []
        Transparent = True
        ExplicitLeft = 105
        ExplicitWidth = 37
      end
      inherited StaticText1: TStaticText
        Width = 18
        Font.Color = 4079166
        Font.Style = []
        Transparent = True
        ExplicitWidth = 18
      end
      inherited btnBusca: TBitBtn
        Left = 75
        ExplicitLeft = 75
      end
      inherited edtEstado: TEdit
        Left = 104
        Width = 341
        ExplicitLeft = 104
        ExplicitWidth = 341
      end
      inherited edtUF: TEdit
        Width = 69
        ExplicitWidth = 69
      end
    end
  end
  object rgpFiltro: TRadioGroup
    Left = 10
    Top = 166
    Width = 474
    Height = 47
    Caption = ' Filtrar por: '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Cidade'
      'Estado')
    TabOrder = 6
    OnClick = rgpFiltroClick
  end
  object edtCaminhoPlanilha: TEdit
    Left = 11
    Top = 392
    Width = 430
    Height = 23
    Color = clWhite
    ReadOnly = True
    TabOrder = 7
  end
  object btnCaminho: TBitBtn
    Left = 450
    Top = 390
    Width = 33
    Height = 25
    Enabled = False
    Glyph.Data = {
      36080000424D3608000000000000360000002800000020000000100000000100
      2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00667BB7003370
      C200206DC9001E69C6001B67C6001A65C6001864C6001663C6001460C400125E
      C600105CC400105BC400105BC400105EC8001059C1005E77B60002175300000C
      5E00000965000005620000036200000162000000620000006200000060000000
      62000000600000006000000060000000640000005D0000135200284AA10080DF
      FF0041BCFF0043B8FF003FB4FF003BB1FF0036AEFF0032A9FF002EA6FF0029A1
      FF00259EFF00219AFF002097FF00209AFF00229FFF00063AA00000003D001C7B
      9B0000589B0000549B0000509B00004D9B00004A9B0000459B0000429B00003D
      9B00003A9B0000369B0000339B0000369B00003B9B0000003C002447A30079D3
      FF0040B1FE0041AEFC003FABFC0039A7FA0037A3F90033A0F9002F9CF9002C99
      F9002896F8002393F8001E8EF8001D8DF9001F92FF00053CA20000003F00156F
      9B00004D9A00004A98000047980000439600003F9500003C9500003895000035
      950000329400002F9400002A940000299500002E9B0000003E00254CA8007ED7
      FF0045B7FE0048B3FC0044B0FC0040ACFC003CA9FB0039A6FA0035A2FA00319F
      FA002D9BFA002998F9002594F9002292FB002095FF00063FA600000044001A73
      9B0000539A00004F9800004C9800004898000045970000429600003E9600003B
      9600003796000034950000309500002E970000319B0000004200254CA80084DB
      FF004CBBFE004DB8FD004AB5FD0045B1FC0041AEFC003EAAFC003AA7FA0036A4
      FA0032A0FA002D9DFA002B99FA002998FA002499FF000642AC00000044002077
      9B0000579A000054990000519900004D9800004A980000469800004396000040
      9600003C960000399600003596000034960000359B00000048002554B30080DD
      FF004EBFFE0050BDFD004FBAFD004CB6FC0046B3FC0043AFFC003FABFC003DA7
      FB0037A4FA0033A1FA002D9CFA002396FB00259BFF000642AC0000004F001C79
      9B00005B9A00005999000056990000529800004F9800004B9800004798000043
      970000409600003D9600003896000032970000379B00000048002554B300AAEC
      FF0061C9FE0053C2FD004EBDFD004AB9FD0046B5FD0042B1FC003EAEFC003AAA
      FC0036A6FB0031A3FA0036A2FB004DADFD006FC0FF001450B70000004F004688
      9B0000659A00005E9900005999000055990000519900004D9800004A98000046
      980000429700003F9600003E9700004999000B5C9B0000005300295ABC00BEF4
      FF0095DEFF0093D9FE0082D3FE0071C9FD0069C6FD0067C4FD0062C0FD005FBC
      FD006ABFFD0072C2FD007EC6FD007CC5FE0080CBFF001452BB00000058005A90
      9B00317A9B002F759A001E6F9A000D6599000562990003609900005C99000058
      9900065B99000E5E99001A62990018619A001C679B0000005700285DC200BDF5
      FF0093DFFF0094DCFE0093DAFE0091DAFE0090D8FF008DD6FF008BD4FF0087D1
      FF0083CDFF007EC8FF0076C5FF0076C4FF007BCBFF001456C20000005E005991
      9B002F7B9B0030789A002F769A002D769A002C749B0029729B0027709B00236D
      9B001F699B001A649B0012619B0012609B0017679B0000005E00285DC200C0F8
      FF0097E1FF0095DFFE0093DFFF00B4EFFF00B2EDFF00B0EBFF00AFE9FF00ACE6
      FF00A9E4FF00A7E2FF00A5E0FF00A7E1FF00A9E5FF001B5FCA0000005E005C94
      9B00337D9B00317B9A002F7B9B00508B9B004E899B004C879B004B859B004882
      9B0045809B00437E9B00417C9B00437D9B0045819B0000006600285DC200BFFB
      FF0099E5FF0098E2FF009DE9FF004881D9002B60CD002D6CD2002D6BD1002D6B
      D1002C6AD1002B6AD0002D6BD0002D6CD1002E6DD30085A9E20000005E005B97
      9B0035819B00347E9B0039859B00001D75000000690000086E0000076D000007
      6D0000066D0000066C0000076C0000086D0000096F0021457E002E6ED500D4FF
      FF00A8F1FF00A6EFFF00B1F9FF001462D200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000A7100709B
      9B00448D9B00428B9B004D959B0000006E009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B001866D800B6E5
      FA00B3E8FB00B2E5FC00A8DEF8001667D900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000274005281
      96004F8497004E819800447A9400000375009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00ACC8F2001F6C
      DE002B72DE002B70DE00206CDE00A2C1F000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0048648E000008
      7A00000E7A00000C7A0000087A003E5D8C009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00}
    NumGlyphs = 2
    TabOrder = 8
    OnClick = btnCaminhoClick
  end
  object chkGeraPlanilha: TCheckBox
    Left = 178
    Top = 353
    Width = 306
    Height = 17
    Caption = 'Gerar planilha do excel com o resultado do relat'#243'rio'
    TabOrder = 9
    OnClick = chkGeraPlanilhaClick
  end
  inline Periodo: TPeriodo
    Left = 0
    Top = 87
    Width = 487
    Height = 74
    TabOrder = 1
    ExplicitTop = 87
    ExplicitWidth = 487
    ExplicitHeight = 74
    inherited grpPeriodo: TGroupBox
      Left = 240
      Top = 3
      Width = 242
      Caption = ' Per'#237'odo da compra '
      ExplicitLeft = 240
      ExplicitTop = 3
      ExplicitWidth = 242
    end
  end
  object rgpFiltroCompras: TRadioGroup
    Left = 10
    Top = 90
    Width = 224
    Height = 68
    Caption = ' '
    ItemIndex = 2
    Items.Strings = (
      'Clientes COM compras efetuadas'
      'Clientes SEM compras efetuadas'
      'Ambos os clientes')
    TabOrder = 11
  end
  object dsClientes: TDataSource
    DataSet = qryClientes
    Left = 56
    Top = 200
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel'
    Left = 314
    Top = 192
  end
  object qryClientes: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select cli.codigo, cli.razao, cli.cpf_cnpj, cli.fone1, cli.email' +
        ', cr.cod_representante,'
      
        '       en.codcidade, est.sigla uf, en.logradouro, en.numero, en.' +
        'bairro, rep.razao representante, cid.nome || '#39' - '#39' || est.sigla ' +
        'cidade, ccp.qtd_compras, ccp.vlr_compras'
      ''
      '  from pessoas cli'
      ''
      
        '  left join cliente_representante cr  on cr.cod_cliente = cli.co' +
        'digo'
      
        '  inner join pessoas               rep on rep.codigo = cr.cod_re' +
        'presentante'
      
        '  inner join enderecos             en  on en.codpessoa = cli.cod' +
        'igo'
      
        '  left join cidades               cid on cid.codibge = en.codcid' +
        'ade'
      '  left join estados               est on est.codigo = cid.codest'
      
        '  left join COMPRAS_CLIENTE_PERIODO(cli.codigo, :dti, :dtf) CCP ' +
        'on (1=1)'
      ''
      
        '   where  en.codcidade = :cod_cid  and iif(cli.bloqueado is null' +
        ', '#39'N'#39', cli.bloqueado) <> :bloq'
      '       and (CCP.qtd_compras > 0)'
      '   order by cr.cod_representante, en.codcidade'
      '')
    Left = 16
    Top = 200
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
      end
      item
        Name = 'COD_CID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'BLOQ'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end>
    object qryClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesRAZAO: TStringField
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Size = 60
    end
    object qryClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Size = 14
    end
    object qryClientesFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'FONE1'
      Size = 15
    end
    object qryClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 250
    end
    object qryClientesCOD_REPRESENTANTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_REPRESENTANTE'
      Origin = 'COD_REPRESENTANTE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryClientesCODCIDADE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCIDADE'
      Origin = 'CODCIDADE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryClientesUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'SIGLA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qryClientesLOGRADOURO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryClientesNUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryClientesBAIRRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryClientesREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Origin = 'RAZAO'
      ProviderFlags = []
      Size = 60
    end
    object qryClientesCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 77
    end
    object qryClientesQTD_COMPRAS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_COMPRAS'
      Origin = 'QTD_COMPRAS'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryClientesVLR_COMPRAS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VLR_COMPRAS'
      Origin = 'VLR_COMPRAS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
end
