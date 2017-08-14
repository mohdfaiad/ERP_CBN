inherited frmRelatorioTotalizarEstoque: TfrmRelatorioTotalizarEstoque
  Left = 477
  Top = 233
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Totalizar Estoque'
  ClientHeight = 353
  ClientWidth = 619
  OldCreateOrder = True
  PrintScale = poNone
  Scaled = False
  OnCreate = nil
  OnShow = FormShow
  ExplicitWidth = 625
  ExplicitHeight = 381
  PixelsPerInch = 96
  TextHeight = 15
  object RLReport1: TRLReport
    Left = -40
    Top = 380
    Width = 794
    Height = 1123
    DataSource = dsTotalizarEstoque
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Visible = False
    object RLBand7: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 16
      BandType = btHeader
      object RLSystemInfo4: TRLSystemInfo
        Left = 673
        Top = 3
        Width = 22
        Height = 10
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = ''
      end
      object RLSystemInfo5: TRLSystemInfo
        Left = 701
        Top = 3
        Width = 17
        Height = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Info = itLastPageNumber
        ParentFont = False
        Text = ''
      end
      object RLLabel17: TRLLabel
        Left = 696
        Top = 3
        Width = 4
        Height = 10
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand8: TRLBand
      Left = 38
      Top = 54
      Width = 718
      Height = 59
      BandType = btTitle
      object RLLabel43: TRLLabel
        Left = 264
        Top = 8
        Width = 172
        Height = 24
        Caption = 'Totalizar Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel44: TRLLabel
        Left = 529
        Top = 36
        Width = 63
        Height = 14
        Caption = 'Data / Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo6: TRLSystemInfo
        Left = 596
        Top = 36
        Width = 34
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Info = itNow
        ParentFont = False
        Text = ''
      end
    end
    object RLGroup2: TRLGroup
      Left = 38
      Top = 113
      Width = 718
      Height = 148
      DataFields = 'PRODUTO'
      object RLBand9: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 33
        BandType = btColumnHeader
        object RLDBText21: TRLDBText
          Left = -1
          Top = 2
          Width = 68
          Height = 16
          DataField = 'PRODUTO'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLLabel45: TRLLabel
          Left = 1
          Top = 20
          Width = 21
          Height = 11
          Caption = 'Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel46: TRLLabel
          Left = 39
          Top = 20
          Width = 20
          Height = 11
          Caption = 'Cor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel47: TRLLabel
          Left = 260
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = 'RN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel48: TRLLabel
          Left = 292
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = 'P'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel49: TRLLabel
          Left = 324
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = 'M'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel50: TRLLabel
          Left = 356
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = 'G'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel51: TRLLabel
          Left = 387
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel52: TRLLabel
          Left = 419
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel53: TRLLabel
          Left = 451
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel54: TRLLabel
          Left = 483
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel55: TRLLabel
          Left = 514
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '6'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel56: TRLLabel
          Left = 546
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel57: TRLLabel
          Left = 672
          Top = 20
          Width = 36
          Height = 11
          Alignment = taCenter
          Caption = 'UNICA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel58: TRLLabel
          Left = 723
          Top = 20
          Width = 31
          Height = 11
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw7: TRLDraw
          Left = -4
          Top = 31
          Width = 722
          Height = 1
          DrawKind = dkLine
        end
        object RLLabel59: TRLLabel
          Left = 578
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel60: TRLLabel
          Left = 609
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '12'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel61: TRLLabel
          Left = 641
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '14'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel62: TRLLabel
          Left = 236
          Top = 20
          Width = 16
          Height = 11
          Alignment = taCenter
          Caption = 'PM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand10: TRLBand
        Left = 0
        Top = 51
        Width = 718
        Height = 67
        BandType = btSummary
        BeforePrint = RLBand4BeforePrint
        object RLDBResult1: TRLDBResult
          Left = 650
          Top = 6
          Width = 104
          Height = 14
          Alignment = taRightJustify
          DataField = 'QTD_TOTAL'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDraw8: TRLDraw
          Left = 587
          Top = 22
          Width = 168
          Height = 43
          Borders.Color = cl3DLight
          Borders.Style = bsClear
          Brush.Color = cl3DLight
          Pen.Style = psClear
        end
        object RLDraw9: TRLDraw
          Left = -4
          Top = 1
          Width = 722
          Height = 1
          DrawKind = dkLine
        end
        object RLDBResult36: TRLDBResult
          Left = 687
          Top = 24
          Width = 68
          Height = 14
          Alignment = taRightJustify
          DataField = 'PRECOTABELA'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLLabel63: TRLLabel
          Left = 587
          Top = 24
          Width = 83
          Height = 14
          Caption = 'Pre'#231'o   Tabela:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel64: TRLLabel
          Left = 587
          Top = 47
          Width = 83
          Height = 14
          Caption = 'Valor Estoque:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw10: TRLDraw
          Left = 587
          Top = 40
          Width = 167
          Height = 3
          DrawKind = dkLine
        end
        object RLDBResult37: TRLDBResult
          Left = 680
          Top = 47
          Width = 75
          Height = 14
          Alignment = taRightJustify
          DataFormula = 'RLDBResult1.Value*PRECOTABELA'
          DataSource = dsTotalizarEstoque
          DisplayMask = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          BeforePrint = RLDBResult4BeforePrint
        end
        object RLDBResult38: TRLDBResult
          Left = 260
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_RN'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel47
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult39: TRLDBResult
          Left = 292
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_P'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel48
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult40: TRLDBResult
          Left = 324
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_M'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel49
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult41: TRLDBResult
          Left = 356
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_G'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel50
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult42: TRLDBResult
          Left = 387
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_1'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel51
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult43: TRLDBResult
          Left = 419
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_2'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel52
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult44: TRLDBResult
          Left = 451
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_3'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel53
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult45: TRLDBResult
          Left = 483
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_4'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel54
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult46: TRLDBResult
          Left = 514
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_6'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel55
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult47: TRLDBResult
          Left = 546
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_8'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel56
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult48: TRLDBResult
          Left = 672
          Top = 5
          Width = 36
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_UNICA'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel57
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult49: TRLDBResult
          Left = 578
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_10'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel59
          Info = riSum
          ParentFont = False
          Text = ''
          BeforePrint = RLDBResult31BeforePrint
        end
        object RLDBResult50: TRLDBResult
          Left = 609
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_12'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel60
          Info = riSum
          ParentFont = False
          Text = ''
          BeforePrint = RLDBResult31BeforePrint
        end
        object RLDBResult51: TRLDBResult
          Left = 641
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_14'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel61
          Info = riSum
          ParentFont = False
          Text = ''
          BeforePrint = RLDBResult31BeforePrint
        end
        object RLDBResult52: TRLDBResult
          Left = 236
          Top = 5
          Width = 16
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_PM'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel62
          Info = riSum
          ParentFont = False
          Text = ''
        end
      end
      object RLBand11: TRLBand
        Left = 0
        Top = 33
        Width = 718
        Height = 18
        GreenBarPrint = True
        object RLDBText22: TRLDBText
          Left = 686
          Top = 2
          Width = 68
          Height = 14
          Alignment = taRightJustify
          DataField = 'QTD_TOTAL'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Holder = RLLabel58
          ParentFont = False
          Text = ''
        end
        object RLDBText23: TRLDBText
          Left = 2
          Top = 2
          Width = 56
          Height = 13
          DataField = 'REFERENCIA'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText24: TRLDBText
          Left = 39
          Top = 2
          Width = 194
          Height = 14
          AutoSize = False
          DataField = 'COR'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText25: TRLDBText
          Left = 257
          Top = 2
          Width = 40
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_RN'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel47
          ParentFont = False
          Text = ''
        end
        object RLDBText26: TRLDBText
          Left = 292
          Top = 2
          Width = 32
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_P'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel48
          ParentFont = False
          Text = ''
        end
        object RLDBText27: TRLDBText
          Left = 323
          Top = 2
          Width = 36
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_M'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel49
          ParentFont = False
          Text = ''
        end
        object RLDBText28: TRLDBText
          Left = 356
          Top = 2
          Width = 34
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_G'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel50
          ParentFont = False
          Text = ''
        end
        object RLDBText29: TRLDBText
          Left = 387
          Top = 2
          Width = 32
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_1'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel51
          ParentFont = False
          Text = ''
        end
        object RLDBText30: TRLDBText
          Left = 419
          Top = 2
          Width = 32
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_2'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel52
          ParentFont = False
          Text = ''
        end
        object RLDBText31: TRLDBText
          Left = 451
          Top = 2
          Width = 32
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_3'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel53
          ParentFont = False
          Text = ''
        end
        object RLDBText32: TRLDBText
          Left = 483
          Top = 2
          Width = 32
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_4'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel54
          ParentFont = False
          Text = ''
        end
        object RLDBText33: TRLDBText
          Left = 514
          Top = 2
          Width = 32
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_6'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel55
          ParentFont = False
          Text = ''
        end
        object RLDBText34: TRLDBText
          Left = 546
          Top = 2
          Width = 32
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_8'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel56
          ParentFont = False
          Text = ''
        end
        object RLDBText35: TRLDBText
          Left = 659
          Top = 2
          Width = 62
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_UNICA'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel57
          ParentFont = False
          Text = ''
        end
        object RLDBText36: TRLDBText
          Left = 576
          Top = 2
          Width = 38
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_10'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel59
          ParentFont = False
          Text = ''
        end
        object RLDBText37: TRLDBText
          Left = 607
          Top = 2
          Width = 38
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_12'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel60
          ParentFont = False
          Text = ''
        end
        object RLDBText38: TRLDBText
          Left = 639
          Top = 2
          Width = 38
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_14'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel61
          ParentFont = False
          Text = ''
        end
        object RLDBText39: TRLDBText
          Left = 223
          Top = 2
          Width = 42
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_PM'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel62
          ParentFont = False
          Text = ''
        end
      end
    end
  end
  object RLTotalizarEstoque: TRLReport
    Left = -53
    Top = 286
    Width = 794
    Height = 1123
    Margins.LeftMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    DataSource = dsTotalizarEstoque
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PrintEmpty = False
    ExpressionParser = RLExpressionParser1
    Visible = False
    object RLBand1: TRLBand
      Left = 19
      Top = 54
      Width = 756
      Height = 59
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 264
        Top = 8
        Width = 172
        Height = 24
        Caption = 'Totalizar Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 529
        Top = 36
        Width = 63
        Height = 14
        Caption = 'Data / Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 596
        Top = 36
        Width = 34
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Info = itNow
        ParentFont = False
        Text = ''
      end
    end
    object RLGroup1: TRLGroup
      Left = 19
      Top = 113
      Width = 756
      Height = 148
      DataFields = 'PRODUTO'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 756
        Height = 33
        BandType = btColumnHeader
        object RLDBText1: TRLDBText
          Left = -1
          Top = 2
          Width = 68
          Height = 16
          DataField = 'PRODUTO'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLLabel11: TRLLabel
          Left = 1
          Top = 20
          Width = 21
          Height = 11
          Caption = 'Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel12: TRLLabel
          Left = 39
          Top = 20
          Width = 20
          Height = 11
          Caption = 'Cor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 260
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = 'RN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 292
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = 'P'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 324
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = 'M'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 356
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = 'G'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 387
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 419
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel9: TRLLabel
          Left = 451
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel10: TRLLabel
          Left = 483
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 514
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '6'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel14: TRLLabel
          Left = 546
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel15: TRLLabel
          Left = 672
          Top = 20
          Width = 36
          Height = 11
          Alignment = taCenter
          Caption = 'UNICA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel16: TRLLabel
          Left = 723
          Top = 20
          Width = 31
          Height = 11
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw1: TRLDraw
          Left = -4
          Top = 31
          Width = 722
          Height = 1
          DrawKind = dkLine
        end
        object RLLabel23: TRLLabel
          Left = 578
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel24: TRLLabel
          Left = 609
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '12'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel25: TRLLabel
          Left = 641
          Top = 20
          Width = 33
          Height = 11
          Alignment = taCenter
          Caption = '14'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel26: TRLLabel
          Left = 236
          Top = 20
          Width = 16
          Height = 11
          Alignment = taCenter
          Caption = 'PM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 51
        Width = 756
        Height = 67
        BandType = btSummary
        BeforePrint = RLBand4BeforePrint
        object RLDBResult27: TRLDBResult
          Left = 650
          Top = 6
          Width = 104
          Height = 14
          Alignment = taRightJustify
          DataField = 'QTD_TOTAL'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDraw4: TRLDraw
          Left = 587
          Top = 22
          Width = 168
          Height = 43
          Borders.Color = cl3DLight
          Borders.Style = bsClear
          Brush.Color = cl3DLight
          Pen.Style = psClear
        end
        object RLDraw2: TRLDraw
          Left = -4
          Top = 1
          Width = 722
          Height = 1
          DrawKind = dkLine
        end
        object RLDBResult3: TRLDBResult
          Left = 687
          Top = 24
          Width = 68
          Height = 14
          Alignment = taRightJustify
          DataField = 'PRECOTABELA'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLLabel20: TRLLabel
          Left = 587
          Top = 24
          Width = 83
          Height = 14
          Caption = 'Pre'#231'o   Tabela:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel21: TRLLabel
          Left = 587
          Top = 47
          Width = 83
          Height = 14
          Caption = 'Valor Estoque:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw5: TRLDraw
          Left = 587
          Top = 40
          Width = 167
          Height = 3
          DrawKind = dkLine
        end
        object RLDBResult4: TRLDBResult
          Left = 680
          Top = 47
          Width = 75
          Height = 14
          Alignment = taRightJustify
          DataFormula = 'RLDBResult1.Value*PRECOTABELA'
          DataSource = dsTotalizarEstoque
          DisplayMask = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          BeforePrint = RLDBResult4BeforePrint
        end
        object RLDBResult16: TRLDBResult
          Left = 260
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_RN'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel3
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult17: TRLDBResult
          Left = 292
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_P'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel4
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult18: TRLDBResult
          Left = 324
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_M'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel5
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult19: TRLDBResult
          Left = 356
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_G'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel6
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult20: TRLDBResult
          Left = 387
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_1'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel7
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult21: TRLDBResult
          Left = 419
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_2'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel8
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult22: TRLDBResult
          Left = 451
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_3'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel9
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult23: TRLDBResult
          Left = 483
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_4'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel10
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult24: TRLDBResult
          Left = 514
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_6'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel13
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult25: TRLDBResult
          Left = 546
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_8'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel14
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult26: TRLDBResult
          Left = 672
          Top = 5
          Width = 36
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_UNICA'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel15
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult31: TRLDBResult
          Left = 578
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_10'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel23
          Info = riSum
          ParentFont = False
          Text = ''
          BeforePrint = RLDBResult31BeforePrint
        end
        object RLDBResult32: TRLDBResult
          Left = 609
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_12'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel24
          Info = riSum
          ParentFont = False
          Text = ''
          BeforePrint = RLDBResult31BeforePrint
        end
        object RLDBResult33: TRLDBResult
          Left = 641
          Top = 5
          Width = 33
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_14'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel25
          Info = riSum
          ParentFont = False
          Text = ''
          BeforePrint = RLDBResult31BeforePrint
        end
        object RLDBResult34: TRLDBResult
          Left = 236
          Top = 5
          Width = 16
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'QTD_PM'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel26
          Info = riSum
          ParentFont = False
          Text = ''
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 33
        Width = 756
        Height = 18
        GreenBarPrint = True
        object RLDBText6: TRLDBText
          Left = 686
          Top = 2
          Width = 68
          Height = 14
          Alignment = taRightJustify
          DataField = 'QTD_TOTAL'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Holder = RLLabel16
          ParentFont = False
          Text = ''
        end
        object RLDBText15: TRLDBText
          Left = 2
          Top = 2
          Width = 56
          Height = 13
          DataField = 'REFERENCIA'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText14: TRLDBText
          Left = 39
          Top = 2
          Width = 194
          Height = 14
          AutoSize = False
          DataField = 'COR'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 257
          Top = 2
          Width = 40
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_RN'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel3
          ParentFont = False
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 292
          Top = 2
          Width = 32
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_P'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel4
          ParentFont = False
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 323
          Top = 2
          Width = 36
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_M'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel5
          ParentFont = False
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 356
          Top = 2
          Width = 34
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_G'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel6
          ParentFont = False
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 387
          Top = 2
          Width = 32
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_1'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel7
          ParentFont = False
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 419
          Top = 2
          Width = 32
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_2'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel8
          ParentFont = False
          Text = ''
        end
        object RLDBText9: TRLDBText
          Left = 451
          Top = 2
          Width = 32
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_3'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel9
          ParentFont = False
          Text = ''
        end
        object RLDBText10: TRLDBText
          Left = 483
          Top = 2
          Width = 32
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_4'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel10
          ParentFont = False
          Text = ''
        end
        object RLDBText11: TRLDBText
          Left = 514
          Top = 2
          Width = 32
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_6'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel13
          ParentFont = False
          Text = ''
        end
        object RLDBText12: TRLDBText
          Left = 546
          Top = 2
          Width = 32
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_8'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel14
          ParentFont = False
          Text = ''
        end
        object RLDBText13: TRLDBText
          Left = 659
          Top = 2
          Width = 62
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_UNICA'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel15
          ParentFont = False
          Text = ''
        end
        object RLDBText17: TRLDBText
          Left = 576
          Top = 2
          Width = 38
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_10'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel23
          ParentFont = False
          Text = ''
        end
        object RLDBText18: TRLDBText
          Left = 607
          Top = 2
          Width = 38
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_12'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel24
          ParentFont = False
          Text = ''
        end
        object RLDBText19: TRLDBText
          Left = 639
          Top = 2
          Width = 38
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_14'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel25
          ParentFont = False
          Text = ''
        end
        object RLDBText20: TRLDBText
          Left = 223
          Top = 2
          Width = 42
          Height = 13
          Alignment = taCenter
          DataField = 'QTD_PM'
          DataSource = dsTotalizarEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Holder = RLLabel26
          ParentFont = False
          Text = ''
        end
      end
    end
    object RLBand5: TRLBand
      Left = 19
      Top = 261
      Width = 756
      Height = 62
      BandType = btSummary
      BeforePrint = RLBand5BeforePrint
      object RLDraw6: TRLDraw
        Left = 0
        Top = 0
        Width = 756
        Height = 22
        Brush.Color = 15461355
        Pen.Style = psClear
      end
      object RLDBResult35: TRLDBResult
        Left = 76
        Top = 24
        Width = 76
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_PM'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel42
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDraw3: TRLDraw
        Left = -4
        Top = 1
        Width = 722
        Height = 1
        DrawKind = dkLine
      end
      object RLLabel18: TRLLabel
        Left = 2
        Top = 24
        Width = 74
        Height = 14
        Caption = 'TOTAL GERAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult2: TRLDBResult
        Left = 650
        Top = 24
        Width = 104
        Height = 14
        Alignment = taRightJustify
        DataField = 'QTD_TOTAL'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel22: TRLLabel
        Left = 519
        Top = 44
        Width = 104
        Height = 15
        Caption = 'VALOR ESTOQUE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText16: TRLDBText
        Left = 707
        Top = 44
        Width = 43
        Height = 15
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = dsTotal
        DisplayMask = 'R$ ###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBResult5: TRLDBResult
        Left = 117
        Top = 24
        Width = 76
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_RN'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel27
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult6: TRLDBResult
        Left = 161
        Top = 24
        Width = 68
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_P'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel28
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult7: TRLDBResult
        Left = 200
        Top = 24
        Width = 70
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_M'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel29
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult8: TRLDBResult
        Left = 240
        Top = 24
        Width = 70
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_G'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel30
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult9: TRLDBResult
        Left = 280
        Top = 24
        Width = 68
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_1'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel31
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult10: TRLDBResult
        Left = 320
        Top = 24
        Width = 68
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_2'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel32
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult11: TRLDBResult
        Left = 360
        Top = 24
        Width = 68
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_3'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel33
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult12: TRLDBResult
        Left = 400
        Top = 24
        Width = 68
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_4'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel34
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult13: TRLDBResult
        Left = 439
        Top = 24
        Width = 68
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_6'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel35
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult14: TRLDBResult
        Left = 479
        Top = 24
        Width = 68
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_8'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel36
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult15: TRLDBResult
        Left = 625
        Top = 24
        Width = 94
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_UNICA'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel37
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult28: TRLDBResult
        Left = 516
        Top = 24
        Width = 74
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_10'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel39
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult29: TRLDBResult
        Left = 555
        Top = 24
        Width = 74
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_12'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel40
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult30: TRLDBResult
        Left = 595
        Top = 24
        Width = 74
        Height = 14
        Alignment = taCenter
        DataField = 'QTD_14'
        DataSource = dsTotalizarEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel41
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel27: TRLLabel
        Left = 138
        Top = 7
        Width = 33
        Height = 11
        Alignment = taCenter
        Caption = 'RN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel28: TRLLabel
        Left = 178
        Top = 7
        Width = 33
        Height = 11
        Alignment = taCenter
        Caption = 'P'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel29: TRLLabel
        Left = 218
        Top = 7
        Width = 33
        Height = 11
        Alignment = taCenter
        Caption = 'M'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel30: TRLLabel
        Left = 258
        Top = 7
        Width = 33
        Height = 11
        Alignment = taCenter
        Caption = 'G'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel31: TRLLabel
        Left = 297
        Top = 7
        Width = 33
        Height = 11
        Alignment = taCenter
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel32: TRLLabel
        Left = 337
        Top = 7
        Width = 33
        Height = 11
        Alignment = taCenter
        Caption = '2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel33: TRLLabel
        Left = 377
        Top = 7
        Width = 33
        Height = 11
        Alignment = taCenter
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel34: TRLLabel
        Left = 417
        Top = 7
        Width = 33
        Height = 11
        Alignment = taCenter
        Caption = '4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel35: TRLLabel
        Left = 456
        Top = 7
        Width = 33
        Height = 11
        Alignment = taCenter
        Caption = '6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel36: TRLLabel
        Left = 496
        Top = 7
        Width = 33
        Height = 11
        Alignment = taCenter
        Caption = '8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel37: TRLLabel
        Left = 654
        Top = 7
        Width = 36
        Height = 11
        Alignment = taCenter
        Caption = 'UNICA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel38: TRLLabel
        Left = 723
        Top = 7
        Width = 31
        Height = 11
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel39: TRLLabel
        Left = 536
        Top = 7
        Width = 33
        Height = 11
        Alignment = taCenter
        Caption = '10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel40: TRLLabel
        Left = 575
        Top = 7
        Width = 33
        Height = 11
        Alignment = taCenter
        Caption = '12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel41: TRLLabel
        Left = 615
        Top = 7
        Width = 33
        Height = 11
        Alignment = taCenter
        Caption = '14'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel42: TRLLabel
        Left = 106
        Top = 7
        Width = 16
        Height = 11
        Alignment = taCenter
        Caption = 'PM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand6: TRLBand
      Left = 19
      Top = 38
      Width = 756
      Height = 16
      BandType = btHeader
      object RLSystemInfo2: TRLSystemInfo
        Left = 673
        Top = 3
        Width = 22
        Height = 10
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 701
        Top = 3
        Width = 17
        Height = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Info = itLastPageNumber
        ParentFont = False
        Text = ''
      end
      object RLLabel19: TRLLabel
        Left = 696
        Top = 3
        Width = 4
        Height = 10
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 312
    Width = 619
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 619
    ExplicitWidth = 901
    object btnImprimir: TBitBtn
      Left = 435
      Top = 6
      Width = 150
      Height = 30
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
    object btnSalvarExcel: TBitBtn
      Left = 268
      Top = 6
      Width = 150
      Height = 30
      Caption = 'Salvar em Excel'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000CDCACC007A72
        76007A7276007A7276007A7276007A7276007A7276007A7276007A7276007A72
        76007A7276007A7276007A7276007A7276007A727600AAA6A80069666800160E
        1200160E1200160E1200160E1200160E1200160E1200160E1200160E1200160E
        1200160E1200160E1200160E1200160E1200160E120046424400AAA4A700BFBC
        BB00AFABAB00B1B1B700B4A79600BD914500B1AFB600B1ADAE00B1ADAE00B1AF
        B600BD914500B4A79600B1B1B700B1ABAC00C0BDBC0091898C00464043005B58
        57004B4747004D4D530050433200592D00004D4B52004D494A004D494A004D4B
        5200592D0000504332004D4D53004D4748005C5958002D252800AEA8AB00EAEC
        EA00D9D8D700DBDEE600DBD2BE00DFB15800DADEE500DBDBDB00DBD9DB00DADE
        E500DEB15800DBD2BE00DBDEE600DAD7D600EEEFED0091898C004A4447008688
        860075747300777A8200776E5A007B4D0000767A81007777770077757700767A
        81007A4D0000776E5A00777A8200767372008A8B89002D252800ABA3A600E1DF
        DB00D0CCCA00D2D2D800D4C8B700D8AE6100D2D3D700D3D0D000D4D1CF00D3D3
        D800D8AE6200D5CAB800D3D4D800D2CFCC00E5E3E00091898B00473F42007D7B
        77006C6866006E6E740070645300744A00006E6F73006F6C6C00706D6B006F6F
        7400744A0000716654006F7074006E6B6800817F7C002D252700A9A9BB00E0B4
        5E00D6AA5B00DBB16D00DEB16900E0A84A00DEBF8300E2C18300E4C38800E5C7
        9300E9BA6600E8CB9100E9D3A000E7D19D00FBE5AE00938E9A00454557007C50
        000072460000774D09007A4D05007C4400007A5B1F007E5D1F00805F24008163
        2F008556020084672D00856F3C00836D390097814A002F2A3600AEAEBF00E9F3
        FF00D9E1F000D9E6FD00DBD9D800DEBC8100D9E3F500D9E0ED00D9DEEB00D9DF
        F200DCB87B00D9D3CF00D7DFF000D6D8E100E9EEF80099949F004A4A5B00858F
        9B00757D8C0075829900777574007A581D00757F9100757C8900757A8700757B
        8E0078541700756F6B00737B8C0072747D00858A940035303B00B5AEB100ECEC
        EA00DCDBD900DEE0E500DFD7CA00E3C08000DDE0E500DEDDDB00DEDDDB00DDE0
        E500E3C08100DFD7CA00DEE0E500DDDBD900EFEFEE00A49D9F00514A4D008888
        8600787775007A7C81007B7366007F5C1C00797C81007A7977007A797700797C
        81007F5C1D007B7366007A7C8100797775008B8B8A0040393B00BAB4BA00EEEF
        EE00E0DFE000E2E4EA00E3DACF00E6C68E00E2E3E900E2E1E100E2E0E100E1E3
        E800E4C68E00E1DBCE00E1E4E800E1DDDD00F1F1F000A9A2A600565056008A8B
        8A007C7B7C007E8086007F766B0082622A007E7F85007E7D7D007E7C7D007D7F
        840080622A007D776A007D8084007D7979008D8D8C00453E4200BDBAC100E1AE
        4D00DBA94F00DEB05F00E0B26100E3AD4F00E4C07900E8C07900E8C38200EBC9
        8C00EEC36F00EECC8E00EED39B00EED49A00FFE5A700ADA6AD0059565D007D4A
        0000774500007A4C00007C4E00007F490000805C1500845C1500845F1E008765
        28008A5F0B008A682A008A6F37008A7036009B81430049424900C1BEC400F5F8
        FB00E8E9EE00E9EDF600E8E4DC00EBD09F00E8EBF400E8EAED00E8E9ED00E8EB
        F200EACF9F00E9E3DA00E8ECF300E7E7E800F5F8FA00B1ABB1005D5A60009194
        970084858A008589920084807800876C3B008487900084868900848589008487
        8E00866B3B00857F760084888F0083838400919496004D474D00C3C1C300FAF9
        FB00EBE9EB00ECEDF400EDE7DF00EED7A500ECEDF400ECEBEE00ECEBEE00ECEB
        F400EED6A400EDE6DE00ECECF300EBE8EA00FBFBFD00B8B0B4005F5D5F009695
        9700878587008889900089837B008A7341008889900088878A0088878A008887
        90008A72400089827A0088888F008784860097979900544C5000D2C5CB00FFFE
        FF00FFEEF900FFF2FF00FFEBEA00FFDCB100FFF2FF00FFF0FB00FFF0FB00FFF2
        FF00FFDCB200FFECEA00FFF3FF00FFF0FA00FFFFFF00C9B6C1006E6167009B9A
        9B009B8A95009B8E9B009B8786009B784D009B8E9B009B8C97009B8C97009B8E
        9B009B784E009B8886009B8F9B009B8C96009B9B9B0065525D00CFC2C80033D5
        71001EC045001FC44E002AC6530099C9640022C4500024C44F0025C44F0020C4
        500068C65E0034C654001EC44D0025C34F001CCB4C00C6B2BD006B5E64000071
        0D00005C00000060000000620000356500000060000000600000006000000060
        0000046200000062000000600000005F000000670000624E5900CFC2C8002CDE
        83001BCA66001ECD6D0024CE6D0094D377001FCE6D0020CD6C0022CD6C001CCD
        6C0063D3730030CE6D001BCD6C0022CD6C0017D56900C6B2BD006B5E6400007A
        1F000066020000690900006A0900306F1300006A090000690800006908000069
        0800006F0F00006A0900006908000069080000710500624E5900CFC2C8008EE3
        C20092DDC10092DDC1008FDDC2008FDDC1008FDDC20091DDC10091DDC10091DD
        C10090DDC20090DDC20092DDC10092DDC10090E2C600C6B2BD006B5E64002A7F
        5E002E795D002E795D002B795E002B795D002B795E002D795D002D795D002D79
        5D002C795E002C795E002E795D002E795D002C7E6200624E5900E5E2E300D8D5
        D800D9D3D600D9D3D500D6D3D500CCD1D600D7D3D500D9D3D500D9D3D500D9D3
        D500D0D3D500D7D3D500D9D3D500D9D3D500DBD7DC00E1DCDD00817E7F007471
        7400756F7200756F7100726F7100686D7200736F7100756F7100756F7100756F
        71006C6F7100736F7100756F7100756F7100777378007D787900}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btnSalvarExcelClick
    end
  end
  inline BuscaProduto2: TBuscaProduto2
    Left = 0
    Top = 0
    Width = 606
    Height = 194
    TabOrder = 1
    ExplicitWidth = 606
    inherited edtReferencia: TEdit
      Height = 23
      ExplicitHeight = 23
    end
    inherited lblReferencia: TStaticText
      Color = clBtnFace
    end
    inherited lblProduto: TStaticText
      Color = clBtnFace
    end
    inherited edtDescricao: TEdit
      Width = 475
      Height = 23
      ExplicitWidth = 475
      ExplicitHeight = 23
    end
    inherited edtRefCor: TEdit
      Height = 23
      ExplicitHeight = 23
    end
    inherited lblCor: TStaticText
      Color = clBtnFace
    end
    inherited edtDescricaoCor: TEdit
      Width = 475
      Height = 23
      ExplicitWidth = 475
      ExplicitHeight = 23
    end
    inherited edtCodTamanho: TEdit
      Height = 23
      ExplicitHeight = 23
    end
    inherited lblTamanho: TStaticText
      Color = clBtnFace
    end
    inherited edtDescricaoTamanho: TEdit
      Width = 475
      Height = 23
      ExplicitWidth = 475
      ExplicitHeight = 23
    end
    inherited edtColecao: TEdit
      Width = 475
      Height = 23
      ExplicitWidth = 475
      ExplicitHeight = 23
    end
  end
  inline BuscaTabelaPreco1: TBuscaTabelaPreco
    Left = 0
    Top = 201
    Width = 601
    Height = 55
    TabOrder = 3
    ExplicitTop = 201
    ExplicitWidth = 601
    inherited StaticText1: TStaticText [0]
      Visible = False
    end
    inherited edtCodigo: TCurrencyEdit [1]
      Width = 80
      ExplicitWidth = 80
    end
    inherited btnBusca: TBitBtn [2]
      Left = 92
      ExplicitLeft = 92
    end
    inherited edtDescricao: TEdit [3]
      Width = 473
      Height = 23
      Color = clWhite
      ExplicitWidth = 473
      ExplicitHeight = 23
    end
    inherited StaticText2: TStaticText [4]
      Left = 8
      Top = 6
      Color = clBtnFace
      ExplicitLeft = 8
      ExplicitTop = 6
    end
  end
  object chkEstoqueReservado: TCheckBox
    Left = 10
    Top = 265
    Width = 160
    Height = 17
    Caption = 'Subtrai estoque reservado'
    TabOrder = 4
  end
  object chkSomenteLoja: TCheckBox
    Left = 186
    Top = 265
    Width = 153
    Height = 17
    Caption = 'Somente Loja'
    TabOrder = 5
    OnClick = chkSomenteLojaClick
  end
  object rgpSetor: TRadioGroup
    Left = 312
    Top = 252
    Width = 284
    Height = 41
    Caption = ' Setor '
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'F'#225'brica'
      'E-commerce'
      'Geral')
    TabOrder = 6
  end
  object dsTotalizarEstoque: TDataSource
    DataSet = cdsEstoque
    Left = 496
    Top = 40
  end
  object cdsEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 497
    Top = 83
    object cdsEstoqueREFPRODUTO: TStringField
      FieldName = 'REFPRODUTO'
    end
    object cdsEstoquePRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 200
    end
    object cdsEstoquePRECOTABELA: TFloatField
      FieldName = 'PRECOTABELA'
      DisplayFormat = '0.00'
    end
    object cdsEstoqueREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
    object cdsEstoqueCOR: TStringField
      FieldName = 'COR'
      Size = 40
    end
    object cdsEstoqueQTD_RN: TFloatField
      FieldName = 'QTD_RN'
    end
    object cdsEstoqueQTD_P: TFloatField
      FieldName = 'QTD_P'
    end
    object cdsEstoqueQTD_M: TFloatField
      FieldName = 'QTD_M'
    end
    object cdsEstoqueQTD_G: TFloatField
      FieldName = 'QTD_G'
    end
    object cdsEstoqueQTD_1: TFloatField
      FieldName = 'QTD_1'
    end
    object cdsEstoqueQTD_2: TFloatField
      FieldName = 'QTD_2'
    end
    object cdsEstoqueQTD_3: TFloatField
      FieldName = 'QTD_3'
    end
    object cdsEstoqueQTD_4: TFloatField
      FieldName = 'QTD_4'
    end
    object cdsEstoqueQTD_6: TFloatField
      FieldName = 'QTD_6'
    end
    object cdsEstoqueQTD_8: TFloatField
      FieldName = 'QTD_8'
    end
    object cdsEstoqueQTD_10: TIntegerField
      FieldName = 'QTD_10'
    end
    object cdsEstoqueQTD_12: TIntegerField
      FieldName = 'QTD_12'
    end
    object cdsEstoqueQTD_14: TIntegerField
      FieldName = 'QTD_14'
    end
    object cdsEstoqueQTD_UNICA: TFloatField
      FieldName = 'QTD_UNICA'
    end
    object cdsEstoqueQTD_TOTAL: TFloatField
      FieldName = 'QTD_TOTAL'
    end
    object cdsEstoqueVALORESTOQUE: TFloatField
      FieldName = 'VALORESTOQUE'
      DisplayFormat = '0.00'
    end
    object cdsEstoqueQTD_GG: TIntegerField
      FieldName = 'QTD_GG'
    end
    object cdsEstoqueQTD_PM: TIntegerField
      FieldName = 'QTD_PM'
    end
  end
  object RLExpressionParser1: TRLExpressionParser
    Left = 680
    Top = 24
  end
  object cdsValorTotal: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 64
    object cdsValorTotalVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = 'R$ ###,###,##0.00'
    end
  end
  object dsTotal: TDataSource
    DataSet = cdsValorTotal
    Left = 680
    Top = 72
  end
  object qry: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'SELECT PRODUTOS.REFERENCIA AS REFPRODUTO, PRODUTOS.REFERENCIA||'#39 +
        ' - '#39'||PRODUTOS.DESCRICAO AS PRODUTO, '
      
        'CORES.REFERENCIA AS REFERENCIA, iif((cores.desc_producao is null' +
        ') or (TRIM(cores.desc_producao) = '#39#39'), cores.descricao, cores.de' +
        'sc_producao) cor,                                               ' +
        ' '
      
        'TAMANHOS.DESCRICAO AS TAM, ESTOQUE.QUANTIDADE                   ' +
        '                                       '
      
        'FROM ESTOQUE                                                    ' +
        '                                       '
      
        'LEFT OUTER JOIN PRODUTOS ON (PRODUTOS.CODIGO = ESTOQUE.CODIGO_PR' +
        'ODUTO)                                 '
      
        'LEFT OUTER JOIN TAMANHOS ON (TAMANHOS.CODIGO = ESTOQUE.CODIGO_TA' +
        'MANHO)                                 '
      
        'LEFT OUTER JOIN CORES ON (CORES.CODIGO = ESTOQUE.CODIGO_COR)    ' +
        '                                       ')
    Left = 400
    Top = 40
    object qryREFPRODUTO: TStringField
      FieldName = 'REFPRODUTO'
      Origin = 'REFPRODUTO'
      Size = 18
    end
    object qryPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Size = 221
    end
    object qryREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
    end
    object qryCOR: TStringField
      FieldName = 'COR'
      Origin = 'COR'
      Size = 100
    end
    object qryTAM: TStringField
      FieldName = 'TAM'
      Origin = 'TAM'
      Size = 15
    end
    object qryQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
  end
  object QryF: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'SELECT PRODUTO_TABELA_PRECO.PRECO                               ' +
        '                '
      
        'FROM PRODUTO_TABELA_PRECO                                       ' +
        '                '
      
        'LEFT OUTER JOIN PRODUTOS ON (PRODUTOS.CODIGO = PRODUTO_TABELA_PR' +
        'ECO.CODPRODUTO) ')
    Left = 400
    Top = 88
    object QryFPRECO: TBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Precision = 18
      Size = 2
    end
  end
  object qryEstoqueReservado: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select sum(ci.qtd_rn) QTD_RN, sum(ci.qtd_p) QTD_P, sum(ci.qtd_m)' +
        ' QTD_M, sum(ci.qtd_g) QTD_G,'
      
        '       sum(ci.qtd_1) QTD_1, sum(ci.qtd_2) QTD_2, sum(ci.qtd_3) Q' +
        'TD_3, sum(ci.qtd_4) QTD_4,'
      
        '       sum(ci.qtd_6) QTD_6, sum(ci.qtd_8) QTD_8, sum(ci.qtd_10) ' +
        'QTD_10, sum(ci.qtd_12) QTD_12, '
      '       sum(ci.qtd_14) QTD_14, sum(ci.qtd_unica) QTD_unica,'
      
        '       pro.referencia REFPRODUTO , cor.referencia REFCOR from it' +
        'ens i'
      ''
      'left join conferencia_itens  ci  on ci.codigo_item = i.codigo'
      
        'left join conferencia_pedido cp  on cp.codigo = ci.codigo_confer' +
        'encia'
      'left join cores              cor on cor.codigo = i.cod_cor'
      'left join produtos           pro on pro.codigo = i.cod_produto'
      ''
      'where cp.fim < '#39'01.01.1900'#39' and i.cod_produto = :codpro'
      ''
      'group by pro.referencia, cor.referencia'
      'order by pro.referencia, cor.referencia'
      '')
    Left = 400
    Top = 136
    ParamData = <
      item
        Name = 'CODPRO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryEstoqueReservadoQTD_RN: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_RN'
      Origin = 'QTD_RN'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstoqueReservadoQTD_P: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_P'
      Origin = 'QTD_P'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstoqueReservadoQTD_M: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_M'
      Origin = 'QTD_M'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstoqueReservadoQTD_G: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_G'
      Origin = 'QTD_G'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstoqueReservadoQTD_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_1'
      Origin = 'QTD_1'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstoqueReservadoQTD_2: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_2'
      Origin = 'QTD_2'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstoqueReservadoQTD_3: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_3'
      Origin = 'QTD_3'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstoqueReservadoQTD_4: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_4'
      Origin = 'QTD_4'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstoqueReservadoQTD_6: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_6'
      Origin = 'QTD_6'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstoqueReservadoQTD_8: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_8'
      Origin = 'QTD_8'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstoqueReservadoQTD_10: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_10'
      Origin = 'QTD_10'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstoqueReservadoQTD_12: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_12'
      Origin = 'QTD_12'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstoqueReservadoQTD_14: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_14'
      Origin = 'QTD_14'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstoqueReservadoQTD_UNICA: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_UNICA'
      Origin = 'QTD_UNICA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstoqueReservadoREFPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFPRODUTO'
      Origin = 'REFPRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object qryEstoqueReservadoREFCOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFCOR'
      Origin = 'REFCOR'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
