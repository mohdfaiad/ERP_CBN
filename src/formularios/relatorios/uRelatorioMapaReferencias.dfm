inherited frmRelatorioMapaReferencias: TfrmRelatorioMapaReferencias
  Left = 408
  Top = 227
  BorderStyle = bsSingle
  Caption = 'Mapa de Refer'#234'ncias'
  ClientHeight = 147
  ClientWidth = 594
  ExplicitWidth = 600
  ExplicitHeight = 175
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 66
    Width = 594
    Height = 23
    Align = alTop
    Brush.Style = bsClear
    ExplicitWidth = 602
  end
  object RLReport1: TRLReport
    Left = 64
    Top = 136
    Width = 794
    Height = 1123
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
    Visible = False
    object RLGroup1: TRLGroup
      Left = 39
      Top = 98
      Width = 716
      Height = 111
      DataFields = 'PRODUTO'
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 716
        Height = 39
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDraw1: TRLDraw
          Left = 0
          Top = 0
          Width = 716
          Height = 38
          Brush.Color = 15066597
          Pen.Style = psClear
        end
        object RLLabel1: TRLLabel
          Left = 0
          Top = 2
          Width = 58
          Height = 17
          Caption = 'Produto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 1
          Top = 19
          Width = 67
          Height = 16
          DataField = 'PRODUTO'
          DataSource = dsRel
          Text = ''
        end
        object RLLabel3: TRLLabel
          Left = 464
          Top = 2
          Width = 44
          Height = 17
          Caption = 'Grade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 462
          Top = 19
          Width = 50
          Height = 16
          Alignment = taCenter
          DataField = 'GRADE'
          DataSource = dsRel
          Text = ''
        end
        object RLLabel4: TRLLabel
          Left = 545
          Top = 2
          Width = 103
          Height = 17
          Caption = 'Qtd. Tamanhos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText4: TRLDBText
          Left = 570
          Top = 19
          Width = 58
          Height = 16
          Alignment = taCenter
          DataField = 'QTDTAM'
          DataSource = dsRel
          Text = ''
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 39
        Width = 716
        Height = 23
        object RLDBText2: TRLDBText
          Left = 24
          Top = 3
          Width = 32
          Height = 16
          DataField = 'COR'
          DataSource = dsRel
          Text = ''
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 62
        Width = 716
        Height = 26
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel5: TRLLabel
          Left = 273
          Top = 4
          Width = 90
          Height = 17
          Caption = 'Combina'#231#245'es:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult2: TRLDBResult
          Left = 367
          Top = 4
          Width = 116
          Height = 18
          DataField = 'QTDTAM'
          DataSource = dsRel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 0
          Width = 257
          Height = 25
          Brush.Color = 13158600
          Brush.Style = bsFDiagonal
          Pen.Style = psClear
        end
        object RLDraw3: TRLDraw
          Left = 456
          Top = 0
          Width = 260
          Height = 25
          Brush.Color = 13158600
          Brush.Style = bsFDiagonal
          Pen.Style = psClear
        end
      end
    end
    object RLBand2: TRLBand
      Left = 39
      Top = 39
      Width = 716
      Height = 59
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel2: TRLLabel
        Left = 248
        Top = 2
        Width = 224
        Height = 23
        Caption = 'Relat'#243'rio de Refer'#234'ncias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDBResult1: TRLDBResult
        Left = 136
        Top = 0
        Width = 56
        Height = 16
        Text = ''
      end
      object RLLabel19: TRLLabel
        Left = 529
        Top = 36
        Width = 68
        Height = 15
        Caption = 'Data / Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo5: TRLSystemInfo
        Left = 600
        Top = 35
        Width = 37
        Height = 16
        Info = itNow
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 39
      Top = 209
      Width = 716
      Height = 33
      BandType = btSummary
      object RLDBResult3: TRLDBResult
        Left = 354
        Top = 12
        Width = 96
        Height = 16
        Alignment = taCenter
        DataField = 'QTDTAM'
        DataSource = dsRel
        Info = riSum
        Text = ''
      end
      object RLLabel6: TRLLabel
        Left = 203
        Top = 12
        Width = 145
        Height = 17
        Caption = 'Total de Combina'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inline BuscaProduto1: TBuscaProduto
    Left = 0
    Top = 0
    Width = 594
    Height = 66
    Align = alTop
    Enabled = False
    Color = clBtnFace
    ParentColor = False
    TabOrder = 0
    ExplicitWidth = 602
  end
  object cbConsidera: TCheckBox
    Left = 16
    Top = 70
    Width = 257
    Height = 17
    Caption = 'Considerar todas as refer'#234'ncias cadastradas'
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = cbConsideraClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 106
    Width = 594
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 112
    ExplicitWidth = 602
    object btnImprimir: TBitBtn
      Left = 432
      Top = 6
      Width = 153
      Height = 29
      Caption = ' Imprimir'
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
      TabOrder = 0
      OnClick = btnImprimirClick
    end
  end
  object dsRel: TDataSource
    DataSet = qry
    Left = 72
    Top = 48
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2015 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 384
    Top = 96
  end
  object qry: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select p.codigo ,'#39'[ '#39'||p.referencia||'#39' ] '#39'||p.descricao Produto,' +
        ' c.codigo CODCOR,c.descricao Cor, g.descricao Grade, count(gt.co' +
        'digo) QTDTAM'
      '    from produtos p'
      'left join produto_cores  pc on pc.codproduto = p.codigo'
      'left join cores          c  on c.codigo = pc.codcor'
      'left join grades         g  on g.codigo = p.cod_grade'
      'left join grade_tamanhos gt on gt.codgrade = g.codigo'
      'where pc.codigo is not null'
      
        'group by p.codigo ,p.referencia, p.descricao, c.codigo, c.descri' +
        'cao, g.descricao'
      '')
    Left = 40
    Top = 48
    object qryCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 223
    end
    object qryCODCOR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCOR'
      Origin = 'CODCOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COR'
      Origin = 'COR'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryGRADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GRADE'
      Origin = 'GRADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
    object qryQTDTAM: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTDTAM'
      Origin = 'QTDTAM'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0'
    end
  end
end
