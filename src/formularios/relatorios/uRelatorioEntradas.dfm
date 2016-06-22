inherited frmRelatorioEntradas: TfrmRelatorioEntradas
  Left = 547
  Top = 314
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de entradas'
  ClientHeight = 238
  ClientWidth = 443
  OnDblClick = FormDblClick
  OnShow = FormShow
  ExplicitWidth = 449
  ExplicitHeight = 266
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 379
    Top = 16
    Width = 794
    Height = 1123
    Margins.LeftMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Visible = False
    BeforePrint = RLReport1BeforePrint
    object RLBand4: TRLBand
      Left = 20
      Top = 39
      Width = 754
      Height = 74
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLDraw1: TRLDraw
        Left = 600
        Top = -1
        Width = 1
        Height = 76
      end
      object RLLabel13: TRLLabel
        Left = 134
        Top = 13
        Width = 330
        Height = 24
        Caption = 'Relat'#243'rio de entradas por intervalo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rlbperiodo: TRLLabel
        Left = 267
        Top = 42
        Width = 46
        Height = 16
        Alignment = taCenter
        Caption = 'periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 672
        Top = 27
        Width = 39
        Height = 16
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 672
        Top = 47
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
      end
      object RLLabel14: TRLLabel
        Left = 625
        Top = 27
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
      object RLLabel15: TRLLabel
        Left = 625
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
      object RLLabel4: TRLLabel
        Left = 625
        Top = 6
        Width = 35
        Height = 16
        Caption = 'P'#225'g.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 672
        Top = 6
        Width = 19
        Height = 16
        Info = itPageNumber
        Text = ''
      end
      object RLLabel5: TRLLabel
        Left = 692
        Top = 6
        Width = 8
        Height = 16
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 699
        Top = 6
        Width = 112
        Height = 16
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel10: TRLLabel
        Left = 208
        Top = 80
        Width = 46
        Height = 16
      end
      object RLLabel11: TRLLabel
        Left = 257
        Top = 80
        Width = 46
        Height = 16
      end
      object RLLabel12: TRLLabel
        Left = 306
        Top = 80
        Width = 46
        Height = 16
      end
      object RLLabel16: TRLLabel
        Left = 355
        Top = 80
        Width = 46
        Height = 16
      end
      object RLLabel17: TRLLabel
        Left = 404
        Top = 80
        Width = 46
        Height = 16
      end
      object RLLabel18: TRLLabel
        Left = 453
        Top = 80
        Width = 46
        Height = 16
      end
      object RLLabel19: TRLLabel
        Left = 502
        Top = 80
        Width = 46
        Height = 16
      end
      object RLLabel20: TRLLabel
        Left = 551
        Top = 80
        Width = 46
        Height = 16
      end
      object RLLabel21: TRLLabel
        Left = 600
        Top = 80
        Width = 46
        Height = 16
      end
      object RLLabel22: TRLLabel
        Left = 649
        Top = 80
        Width = 46
        Height = 16
      end
      object RLLabel23: TRLLabel
        Left = 698
        Top = 80
        Width = 46
        Height = 16
      end
      object RLLabel24: TRLLabel
        Left = 1
        Top = 80
        Width = 46
        Height = 16
      end
      object RLLabel25: TRLLabel
        Left = 50
        Top = 80
        Width = 39
        Height = 17
        Caption = 'Refs.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5592405
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel26: TRLLabel
        Left = 105
        Top = 80
        Width = 87
        Height = 16
        Caption = 'Total Geral >'
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
      Top = 152
      Width = 754
      Height = 129
      DataFields = 'DATA_PRODUCAO'
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 754
        Height = 23
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel1: TRLLabel
          Left = 1
          Top = 4
          Width = 129
          Height = 16
          Caption = 'Data da produ'#231#227'o >'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 134
          Top = 4
          Width = 119
          Height = 16
          DataField = 'DATA_PRODUCAO'
          DataSource = DataSource1
          Text = ''
          BeforePrint = RLDBText2BeforePrint
        end
        object lbDataExtenso: TRLLabel
          Left = 265
          Top = 3
          Width = 79
          Height = 16
          Caption = 'data extenso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 23
        Width = 754
        Height = 34
        BandType = btHeader
        object RLDraw5: TRLDraw
          Left = 598
          Top = 0
          Width = 49
          Height = 33
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw4: TRLDraw
          Left = 500
          Top = 0
          Width = 49
          Height = 33
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw3: TRLDraw
          Left = 402
          Top = 0
          Width = 49
          Height = 33
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw2: TRLDraw
          Left = 304
          Top = 0
          Width = 49
          Height = 33
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw12: TRLDraw
          Left = 207
          Top = 0
          Width = 49
          Height = 33
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw18: TRLDraw
          Left = -5
          Top = 18
          Width = 1088
          Height = 15
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          Borders.Color = 15461355
          Borders.FixedBottom = True
          Brush.Style = bsClear
          Pen.Style = psClear
        end
        object memIntervalo1: TRLMemo
          Left = 208
          Top = 0
          Width = 46
          Height = 31
          Alignment = taCenter
          AutoSize = False
          Behavior = [beSiteExpander]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Lines.Strings = (
            '13:00')
          ParentFont = False
          Visible = False
        end
        object memIntervalo2: TRLMemo
          Left = 257
          Top = 0
          Width = 46
          Height = 31
          Alignment = taCenter
          AutoSize = False
          Behavior = [beSiteExpander]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Lines.Strings = (
            '13:00')
          ParentFont = False
          Visible = False
        end
        object memIntervalo5: TRLMemo
          Left = 404
          Top = 0
          Width = 46
          Height = 31
          Alignment = taCenter
          AutoSize = False
          Behavior = [beSiteExpander]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Lines.Strings = (
            '13:00')
          ParentFont = False
          Visible = False
        end
        object memIntervalo3: TRLMemo
          Left = 306
          Top = 0
          Width = 46
          Height = 31
          Alignment = taCenter
          AutoSize = False
          Behavior = [beSiteExpander]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Lines.Strings = (
            '13:00')
          ParentFont = False
          Visible = False
        end
        object memIntervalo4: TRLMemo
          Left = 355
          Top = 0
          Width = 46
          Height = 31
          Alignment = taCenter
          AutoSize = False
          Behavior = [beSiteExpander]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Lines.Strings = (
            '13:00')
          ParentFont = False
          Visible = False
        end
        object memIntervalo8: TRLMemo
          Left = 551
          Top = 0
          Width = 46
          Height = 31
          Alignment = taCenter
          AutoSize = False
          Behavior = [beSiteExpander]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Lines.Strings = (
            '13:00')
          ParentFont = False
          Visible = False
        end
        object memIntervalo6: TRLMemo
          Left = 453
          Top = 0
          Width = 46
          Height = 31
          Alignment = taCenter
          AutoSize = False
          Behavior = [beSiteExpander]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Lines.Strings = (
            '13:00')
          ParentFont = False
          Visible = False
        end
        object memIntervalo7: TRLMemo
          Left = 502
          Top = 0
          Width = 46
          Height = 31
          Alignment = taCenter
          AutoSize = False
          Behavior = [beSiteExpander]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Lines.Strings = (
            '13:00')
          ParentFont = False
          Visible = False
        end
        object memIntervalo10: TRLMemo
          Left = 649
          Top = 0
          Width = 46
          Height = 31
          Alignment = taCenter
          AutoSize = False
          Behavior = [beSiteExpander]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Lines.Strings = (
            '13:00')
          ParentFont = False
          Visible = False
        end
        object memIntervalo9: TRLMemo
          Left = 600
          Top = 0
          Width = 46
          Height = 31
          Alignment = taCenter
          AutoSize = False
          Behavior = [beSiteExpander]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Lines.Strings = (
            '13:00')
          ParentFont = False
          Visible = False
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 79
        Width = 754
        Height = 37
        GreenBarColor = clWhite
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clWhite
        ParentColor = False
        Transparent = False
        object RLDraw20: TRLDraw
          Left = 646
          Top = 18
          Width = 110
          Height = 19
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw16: TRLDraw
          Left = 598
          Top = -2
          Width = 49
          Height = 22
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw15: TRLDraw
          Left = 500
          Top = -2
          Width = 49
          Height = 22
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw14: TRLDraw
          Left = 402
          Top = -2
          Width = 49
          Height = 22
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw13: TRLDraw
          Left = 304
          Top = -2
          Width = 49
          Height = 22
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw11: TRLDraw
          Left = 207
          Top = -2
          Width = 49
          Height = 22
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDBResult1: TRLDBResult
          Left = 208
          Top = 3
          Width = 46
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo1'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult2: TRLDBResult
          Left = 257
          Top = 3
          Width = 46
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo2'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult3: TRLDBResult
          Left = 306
          Top = 3
          Width = 46
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo3'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult4: TRLDBResult
          Left = 355
          Top = 3
          Width = 46
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo4'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult5: TRLDBResult
          Left = 404
          Top = 3
          Width = 46
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo5'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult6: TRLDBResult
          Left = 453
          Top = 3
          Width = 46
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo6'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult7: TRLDBResult
          Left = 502
          Top = 3
          Width = 46
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo7'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult8: TRLDBResult
          Left = 551
          Top = 3
          Width = 46
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo8'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult9: TRLDBResult
          Left = 600
          Top = 3
          Width = 46
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo9'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult10: TRLDBResult
          Left = 649
          Top = 3
          Width = 46
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo10'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLLabel3: TRLLabel
          Left = 100
          Top = 4
          Width = 93
          Height = 16
          Caption = 'Total do Dia >'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 50
          Top = 10
          Width = 42
          Height = 18
          Caption = 'Refs.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5592405
          Font.Height = -15
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object RLDBResult24: TRLDBResult
          Left = 2
          Top = 10
          Width = 47
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'TOTAL_INTERVALOS'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5592405
          Font.Height = -15
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Info = riCount
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBResult21: TRLDBResult
          Left = 703
          Top = 3
          Width = 50
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'TOTAL_INTERVALOS'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult26: TRLDBResult
          Left = 703
          Top = 19
          Width = 50
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'TOTAL_PECAS'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210752
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDraw19: TRLDraw
          Left = -14
          Top = -5
          Width = 775
          Height = 4
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          Borders.Color = 14342874
          Borders.FixedBottom = True
          Brush.Style = bsClear
          Pen.Style = psClear
        end
        object RLLabel8: TRLLabel
          Left = 650
          Top = 21
          Width = 46
          Height = 14
          Caption = 'PE'#199'AS >'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 57
        Width = 754
        Height = 22
        object RLDraw10: TRLDraw
          Left = 598
          Top = 0
          Width = 49
          Height = 21
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw9: TRLDraw
          Left = 500
          Top = 0
          Width = 49
          Height = 21
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw8: TRLDraw
          Left = 402
          Top = 0
          Width = 49
          Height = 21
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw7: TRLDraw
          Left = 304
          Top = 0
          Width = 49
          Height = 21
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw6: TRLDraw
          Left = 207
          Top = 0
          Width = 49
          Height = 21
          Brush.Color = 16053492
          Pen.Style = psClear
        end
        object RLDraw17: TRLDraw
          Left = -2
          Top = 4
          Width = 1088
          Height = 15
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          Borders.Color = 15461355
          Borders.FixedBottom = True
          Brush.Style = bsClear
          Pen.Style = psClear
        end
        object RLDBText1: TRLDBText
          Left = 208
          Top = 2
          Width = 46
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo1'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 257
          Top = 2
          Width = 46
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo2'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 306
          Top = 2
          Width = 46
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo3'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 355
          Top = 2
          Width = 46
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo4'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 404
          Top = 2
          Width = 46
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo5'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText9: TRLDBText
          Left = 453
          Top = 2
          Width = 46
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo6'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText10: TRLDBText
          Left = 502
          Top = 2
          Width = 46
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo7'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText11: TRLDBText
          Left = 551
          Top = 2
          Width = 46
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo8'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText12: TRLDBText
          Left = 600
          Top = 2
          Width = 46
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo9'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText13: TRLDBText
          Left = 649
          Top = 2
          Width = 46
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'intervalo10'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 88
          Top = 3
          Width = 62
          Height = 14
          DataField = 'DESCRICAO'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 4
          Top = 3
          Width = 80
          Height = 15
          Alignment = taRightJustify
          DataField = 'REFERENCIA'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText14: TRLDBText
          Left = 703
          Top = 2
          Width = 50
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'TOTAL_INTERVALOS'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
      end
    end
    object RLBand6: TRLBand
      Left = 20
      Top = 281
      Width = 754
      Height = 38
      AlignToBottom = True
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Color = 15987699
      ParentColor = False
      Transparent = False
      object RLLabel2: TRLLabel
        Left = 105
        Top = 2
        Width = 87
        Height = 16
        Caption = 'Total Geral >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult11: TRLDBResult
        Left = 208
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'INTERVALO1'
        DataSource = DataSource1
        Info = riSum
        Text = ''
        Transparent = False
        BeforePrint = RLDBResult11BeforePrint
      end
      object RLDBResult12: TRLDBResult
        Left = 257
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'intervalo2'
        DataSource = DataSource1
        Info = riSum
        Text = ''
        Transparent = False
        BeforePrint = RLDBResult12BeforePrint
      end
      object RLDBResult13: TRLDBResult
        Left = 306
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'intervalo3'
        DataSource = DataSource1
        Info = riSum
        Text = ''
        Transparent = False
        BeforePrint = RLDBResult13BeforePrint
      end
      object RLDBResult14: TRLDBResult
        Left = 355
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'intervalo4'
        DataSource = DataSource1
        Info = riSum
        Text = ''
        Transparent = False
        BeforePrint = RLDBResult14BeforePrint
      end
      object RLDBResult15: TRLDBResult
        Left = 404
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'intervalo5'
        DataSource = DataSource1
        Info = riSum
        Text = ''
        Transparent = False
        BeforePrint = RLDBResult15BeforePrint
      end
      object RLDBResult16: TRLDBResult
        Left = 454
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'intervalo6'
        DataSource = DataSource1
        Info = riSum
        Text = ''
        Transparent = False
        BeforePrint = RLDBResult16BeforePrint
      end
      object RLDBResult17: TRLDBResult
        Left = 502
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'intervalo7'
        DataSource = DataSource1
        Info = riSum
        Text = ''
        Transparent = False
        BeforePrint = RLDBResult17BeforePrint
      end
      object RLDBResult18: TRLDBResult
        Left = 551
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'intervalo8'
        DataSource = DataSource1
        Info = riSum
        Text = ''
        Transparent = False
        BeforePrint = RLDBResult18BeforePrint
      end
      object RLDBResult19: TRLDBResult
        Left = 600
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'intervalo9'
        DataSource = DataSource1
        Info = riSum
        Text = ''
        Transparent = False
        BeforePrint = RLDBResult19BeforePrint
      end
      object RLDBResult20: TRLDBResult
        Left = 649
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'intervalo10'
        DataSource = DataSource1
        Info = riSum
        Text = ''
        Transparent = False
        BeforePrint = RLDBResult20BeforePrint
      end
      object RLDBResult22: TRLDBResult
        Left = 703
        Top = 3
        Width = 50
        Height = 15
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOTAL_INTERVALOS'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Info = riSum
        ParentFont = False
        Text = ''
        Transparent = False
        BeforePrint = RLDBResult22BeforePrint
      end
      object RLDBResult23: TRLDBResult
        Left = 2
        Top = 10
        Width = 48
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOTAL_INTERVALOS'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5592405
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Info = riCount
        ParentFont = False
        Text = ''
        Transparent = False
        BeforePrint = RLDBResult23BeforePrint
      end
      object RLLabel6: TRLLabel
        Left = 50
        Top = 9
        Width = 39
        Height = 17
        Caption = 'Refs.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5592405
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDBResult25: TRLDBResult
        Left = 703
        Top = 20
        Width = 50
        Height = 15
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOTAL_PECAS'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Info = riSum
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLLabel9: TRLLabel
        Left = 650
        Top = 21
        Width = 42
        Height = 14
        Caption = 'Pe'#231'as >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand7: TRLBand
      Left = 20
      Top = 113
      Width = 754
      Height = 39
      BandType = btTitle
      Color = 15987699
      ParentColor = False
      Transparent = False
      object TOT_ITVLO1: TRLLabel
        Left = 208
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        Caption = 'periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        BeforePrint = TOT_ITVLO1BeforePrint
      end
      object TOT_ITVLO2: TRLLabel
        Left = 259
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        Caption = 'periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        BeforePrint = TOT_ITVLO1BeforePrint
      end
      object TOT_ITVLO3: TRLLabel
        Left = 306
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        Caption = 'periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        BeforePrint = TOT_ITVLO1BeforePrint
      end
      object TOT_ITVLO4: TRLLabel
        Left = 355
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        Caption = 'periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        BeforePrint = TOT_ITVLO1BeforePrint
      end
      object TOT_ITVLO5: TRLLabel
        Left = 404
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        Caption = 'periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        BeforePrint = TOT_ITVLO1BeforePrint
      end
      object TOT_ITVLO6: TRLLabel
        Left = 453
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        Caption = 'periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        BeforePrint = TOT_ITVLO1BeforePrint
      end
      object TOT_ITVLO7: TRLLabel
        Left = 502
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        Caption = 'periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        BeforePrint = TOT_ITVLO1BeforePrint
      end
      object TOT_ITVLO8: TRLLabel
        Left = 551
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        Caption = 'periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        BeforePrint = TOT_ITVLO1BeforePrint
      end
      object TOT_ITVLO9: TRLLabel
        Left = 600
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        Caption = 'periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        BeforePrint = TOT_ITVLO1BeforePrint
      end
      object TOT_ITVLO10: TRLLabel
        Left = 649
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        Caption = 'periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        BeforePrint = TOT_ITVLO1BeforePrint
      end
      object RLLabel27: TRLLabel
        Left = 113
        Top = 3
        Width = 87
        Height = 16
        Caption = 'Total Geral >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object TOT_ITVLO_TOTAIS: TRLLabel
        Left = 705
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        Caption = 'periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        BeforePrint = TOT_ITVLO1BeforePrint
      end
      object TOT_PECAS_TOTAIS: TRLLabel
        Left = 705
        Top = 21
        Width = 46
        Height = 16
        Alignment = taCenter
        Caption = 'periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        BeforePrint = TOT_ITVLO1BeforePrint
      end
      object RLLabel30: TRLLabel
        Left = 650
        Top = 22
        Width = 42
        Height = 14
        Caption = 'Pe'#231'as >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object rlReferencias: TRLLabel
        Left = 3
        Top = 12
        Width = 39
        Height = 17
        Caption = 'Refs.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5592405
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        BeforePrint = rlReferenciasBeforePrint
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 197
    Width = 443
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnImprimir: TBitBtn
      Left = 232
      Top = 6
      Width = 153
      Height = 29
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
      TabOrder = 0
      OnClick = btnImprimirClick
    end
    object btnSair: TBitBtn
      Left = 64
      Top = 6
      Width = 153
      Height = 29
      Caption = ' <ESC> Sair'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD6B2CE1A53CE7C690F3E1C4F9F1
        E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5CEBBB6
        B7BA975C1ADF9C1FCC891BCD8A1BCD8A1BD7A24AE6BF74E5CEB8FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFB36624121019804A09E39C20CB891CCD8A1CCD8A
        1CCC891CD6941CAC641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC77C2D13
        111A864F09E49A21CD8A1DCF8B1DCF8B1DCE8A1DD8941BB4702BFFFFFFFFFFFF
        FFFFFFFEFEFF2121CBFFFFFFD7924114111B8A530BE69E22CE8C1FCF8D1FCF8D
        1FCE8C1FD6941DB77430FFFFFFFFFFFFFFFFFFFFFFFF1614D9242AF5AE6E4125
        1A008E530ED89220CF8C1FD08F23D08F22CF8E22D79620BB79343039E81D2AE8
        232CE8222EEB2430EF2032FF1B25F900002FAA6F06E4EAF1BC7418D69324D292
        27D29127D89925BF7E36616EF0152EF4223AF42137F42338F2273AEF213CFF2B
        3FFF895645FAD273D29A3DD6982ED39229D4932BDA9C2DC383396B7BF54565F7
        4A67F64E69F6425CF31F3CF25E7FFF1F28B9A46820F0BA4DDEAE56DFAF58DBA7
        49D59A36DB9F31C6893E5A61F0656FF1636DF16670F0495FF1638AFF8667B40D
        0300AA7628F2C46DE0B05DE0B25EE2B462E2B261E1AE4BCB8C3FFFFFFFFFFFFF
        FFFFFFFFFFFF3B40F05461FFEAA94F22180BA8793AF5CA77E2B768E3B869E3B8
        69E4B86AEAC377D2994DFFFFFFFFFFFFFFFFFFFBFBFF2222FFFFFFFFF7B64D1C
        1014B2803FF8D284E6BF73E7C074E7C074E7BF73ECCB80D69E53FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF6B2451D1212B98949FDD991EAC681EAC581EAC5
        81EAC581F0D08FD9A458FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7AC5C18
        0D0EC49957FFF2AFFFE09DFFE4A0F8DB9AF3D495F5DEA3DEAC5DFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFECB15C301F1B231F206E5A449E8663BBA77CDDC1
        8CF1D399FEEBBAE3B265FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAB968DC
        A851D09D4EC59447BA8A41B38239CF9A48DFAC54E9B964E4B360}
      TabOrder = 1
      OnClick = btnSairClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 96
    Top = 56
    Width = 252
    Height = 73
    Caption = ' Per'#237'odo '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label6: TLabel
      Left = 13
      Top = 21
      Width = 57
      Height = 13
      Caption = 'Data Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4079166
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 134
      Top = 21
      Width = 52
      Height = 13
      Caption = 'Data Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4079166
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtpInicio: TDateTimePicker
      Left = 13
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
      OnExit = dtpInicioExit
    end
    object dtpFim: TDateTimePicker
      Left = 134
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
      OnExit = dtpFimExit
    end
  end
  object DataSource1: TDataSource
    DataSet = cds
    Left = 184
    Top = 8
  end
  object cds: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    OnCalcFields = cdsCalcFields
    Left = 128
    Top = 8
    object cdsDATA_PRODUCAO: TDateField
      FieldName = 'DATA_PRODUCAO'
    end
    object cdsCODIGO_PRODUTO: TIntegerField
      FieldName = 'CODIGO_PRODUTO'
    end
    object cdsREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 18
    end
    object cdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsINTERVALO1: TIntegerField
      FieldName = 'INTERVALO1'
      DisplayFormat = '0'
    end
    object cdsINTERVALO2: TIntegerField
      FieldName = 'INTERVALO2'
      DisplayFormat = '0'
    end
    object cdsINTERVALO3: TIntegerField
      FieldName = 'INTERVALO3'
      DisplayFormat = '0'
    end
    object cdsINTERVALO4: TIntegerField
      FieldName = 'INTERVALO4'
      DisplayFormat = '0'
    end
    object cdsINTERVALO5: TIntegerField
      FieldName = 'INTERVALO5'
      DisplayFormat = '0'
    end
    object cdsINTERVALO6: TIntegerField
      FieldName = 'INTERVALO6'
      DisplayFormat = '0'
    end
    object cdsINTERVALO7: TIntegerField
      FieldName = 'INTERVALO7'
      DisplayFormat = '0'
    end
    object cdsINTERVALO8: TIntegerField
      FieldName = 'INTERVALO8'
      DisplayFormat = '0'
    end
    object cdsINTERVALO9: TIntegerField
      FieldName = 'INTERVALO9'
      DisplayFormat = '0'
    end
    object cdsINTERVALO10: TIntegerField
      FieldName = 'INTERVALO10'
      DisplayFormat = '0'
    end
    object cdsPECAS: TIntegerField
      FieldName = 'PECAS'
    end
    object cdsTOTAL_INTERVALOS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL_INTERVALOS'
      DisplayFormat = '0'
    end
    object cdsTOTAL_PECAS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL_PECAS'
      DisplayFormat = '0'
    end
    object cdsTOT_ITVLO1: TAggregateField
      FieldName = 'TOT_ITVLO1'
      Active = True
      DisplayName = ''
      DisplayFormat = '0'
      Expression = 'SUM(INTERVALO1)'
    end
    object cdsTOT_ITVLO2: TAggregateField
      FieldName = 'TOT_ITVLO2'
      Active = True
      DisplayName = ''
      Expression = 'SUM(INTERVALO2)'
    end
    object cdsTOT_ITVLO3: TAggregateField
      FieldName = 'TOT_ITVLO3'
      Active = True
      DisplayName = ''
      Expression = 'SUM(INTERVALO3)'
    end
    object cdsTOT_ITVLO4: TAggregateField
      FieldName = 'TOT_ITVLO4'
      Active = True
      DisplayName = ''
      Expression = 'SUM(INTERVALO4)'
    end
    object cdsTOT_ITVLO5: TAggregateField
      FieldName = 'TOT_ITVLO5'
      Active = True
      DisplayName = ''
      Expression = 'SUM(INTERVALO5)'
    end
    object cdsTOT_ITVLO6: TAggregateField
      FieldName = 'TOT_ITVLO6'
      Active = True
      DisplayName = ''
      Expression = 'SUM(INTERVALO6)'
    end
    object cdsTOT_ITVLO7: TAggregateField
      FieldName = 'TOT_ITVLO7'
      Active = True
      DisplayName = ''
      Expression = 'SUM(INTERVALO7)'
    end
    object cdsTOT_ITVLO8: TAggregateField
      FieldName = 'TOT_ITVLO8'
      Active = True
      DisplayName = ''
      Expression = 'SUM(INTERVALO8)'
    end
    object cdsTOT_ITVLO9: TAggregateField
      FieldName = 'TOT_ITVLO9'
      Active = True
      DisplayName = ''
      Expression = 'SUM(INTERVALO9)'
    end
    object cdsTOT_ITVLO10: TAggregateField
      FieldName = 'TOT_ITVLO10'
      Active = True
      DisplayName = ''
      Expression = 'SUM(INTERVALO10)'
    end
    object cdsTOT_ITVLO_TOTAIS: TAggregateField
      FieldName = 'TOT_ITVLO_TOTAIS'
      Active = True
      DisplayName = ''
      Expression = 'SUM(TOTAL_INTERVALOS)'
    end
    object cdsTOT_PECAS_TOTAIS: TAggregateField
      FieldName = 'TOT_PECAS_TOTAIS'
      Active = True
      DisplayName = ''
      Expression = 'SUM(TOTAL_PECAS)'
    end
  end
  object qry: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select es.data_producao, es.codigo_produto, pro.referencia, pro.' +
        'descricao, es.codigo_intervalo,'
      
        '       Max(es.data_lancamento) dt_lancamento, SUM(es.quantidade)' +
        ' quantidade, MAX(pro.qtd_pecas) pecas'
      ''
      'from entradas_saidas es'
      ''
      'inner join produtos pro on pro.codigo = es.codigo_produto'
      ''
      'where es.tipo = '#39'E'#39
      ''
      
        'group by es.data_producao, es.codigo_produto, pro.referencia, pr' +
        'o.descricao, es.codigo_intervalo'
      ''
      
        'order by es.data_producao, es.codigo_produto, pro.referencia, pr' +
        'o.descricao, es.codigo_intervalo'
      '')
    Left = 16
    Top = 8
    object qryDATA_PRODUCAO: TDateField
      FieldName = 'DATA_PRODUCAO'
      Origin = 'DATA_PRODUCAO'
    end
    object qryCODIGO_PRODUTO: TIntegerField
      FieldName = 'CODIGO_PRODUTO'
      Origin = 'CODIGO_PRODUTO'
    end
    object qryREFERENCIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object qryDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object qryCODIGO_INTERVALO: TIntegerField
      FieldName = 'CODIGO_INTERVALO'
      Origin = 'CODIGO_INTERVALO'
    end
    object qryDT_LANCAMENTO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DT_LANCAMENTO'
      Origin = 'DT_LANCAMENTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryQUANTIDADE: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPECAS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PECAS'
      Origin = 'PECAS'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryIntervalos: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      'select * from intervalos_producao')
    Left = 16
    Top = 56
    object qryIntervalosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryIntervalosHORA_INICIO: TTimeField
      FieldName = 'HORA_INICIO'
      Origin = 'HORA_INICIO'
    end
    object qryIntervalosHORA_FIM: TTimeField
      FieldName = 'HORA_FIM'
      Origin = 'HORA_FIM'
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2015 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 208
    Top = 120
  end
end
