inherited frmRelatorioTotalizarEstoque: TfrmRelatorioTotalizarEstoque
  Left = 477
  Top = 233
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Totalizar Estoque'
  ClientHeight = 352
  ClientWidth = 613
  OldCreateOrder = True
  PrintScale = poNone
  Scaled = False
  OnCreate = nil
  OnShow = FormShow
  ExplicitWidth = 619
  ExplicitHeight = 380
  PixelsPerInch = 96
  TextHeight = 13
  object RLTotalizarEstoque: TRLReport
    Left = 42
    Top = 262
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
          Left = 232
          Top = 20
          Width = 35
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
          Left = 266
          Top = 20
          Width = 35
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
          Left = 300
          Top = 20
          Width = 35
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
          Left = 334
          Top = 20
          Width = 35
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
          Left = 367
          Top = 20
          Width = 35
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
          Left = 401
          Top = 20
          Width = 35
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
          Left = 435
          Top = 20
          Width = 35
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
          Left = 469
          Top = 20
          Width = 35
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
          Left = 502
          Top = 20
          Width = 35
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
          Left = 536
          Top = 20
          Width = 35
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
          Left = 670
          Top = 20
          Width = 39
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
          Left = 570
          Top = 20
          Width = 35
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
          Left = 603
          Top = 20
          Width = 35
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
          Left = 637
          Top = 20
          Width = 35
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
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 51
        Width = 756
        Height = 90
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
          Top = 46
          Width = 168
          Height = 43
          Borders.Color = cl3DLight
          Borders.Style = bsClear
          Brush.Color = cl3DLight
          Pen.Style = psClear
        end
        object RLDBResult1: TRLDBResult
          Left = 687
          Top = 30
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
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLLabel17: TRLLabel
          Left = 621
          Top = 30
          Width = 43
          Height = 14
          Caption = 'TOTAL:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
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
          Top = 48
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
          Top = 48
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
          Top = 71
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
          Top = 64
          Width = 167
          Height = 3
          DrawKind = dkLine
        end
        object RLDBResult4: TRLDBResult
          Left = 680
          Top = 71
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
          Left = 230
          Top = 5
          Width = 40
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
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult17: TRLDBResult
          Left = 267
          Top = 5
          Width = 32
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
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult18: TRLDBResult
          Left = 300
          Top = 5
          Width = 36
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
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult19: TRLDBResult
          Left = 334
          Top = 5
          Width = 34
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
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult20: TRLDBResult
          Left = 368
          Top = 5
          Width = 32
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
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult21: TRLDBResult
          Left = 402
          Top = 5
          Width = 32
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
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult22: TRLDBResult
          Left = 436
          Top = 5
          Width = 32
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
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult23: TRLDBResult
          Left = 470
          Top = 5
          Width = 32
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
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult24: TRLDBResult
          Left = 503
          Top = 5
          Width = 32
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
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult25: TRLDBResult
          Left = 537
          Top = 5
          Width = 32
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
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult26: TRLDBResult
          Left = 670
          Top = 5
          Width = 40
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
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult31: TRLDBResult
          Left = 569
          Top = 5
          Width = 38
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
          Info = riSum
          ParentFont = False
          Text = ''
          BeforePrint = RLDBResult31BeforePrint
        end
        object RLDBResult32: TRLDBResult
          Left = 602
          Top = 5
          Width = 38
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
          Info = riSum
          ParentFont = False
          Text = ''
          BeforePrint = RLDBResult31BeforePrint
        end
        object RLDBResult33: TRLDBResult
          Left = 636
          Top = 5
          Width = 38
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
          Info = riSum
          ParentFont = False
          Text = ''
          BeforePrint = RLDBResult31BeforePrint
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
          Left = 230
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
          Left = 267
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
          Left = 300
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
          Left = 334
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
          Left = 368
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
          Left = 402
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
          Left = 436
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
          Left = 470
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
          Left = 503
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
          Left = 537
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
          Left = 569
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
          Left = 602
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
          Left = 636
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
      end
    end
    object RLBand5: TRLBand
      Left = 19
      Top = 261
      Width = 756
      Height = 56
      BandType = btSummary
      BeforePrint = RLBand5BeforePrint
      object RLDraw3: TRLDraw
        Left = -4
        Top = 1
        Width = 722
        Height = 1
        DrawKind = dkLine
      end
      object RLLabel18: TRLLabel
        Left = 138
        Top = 5
        Width = 85
        Height = 15
        Caption = 'TOTAL GERAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult2: TRLDBResult
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
      object RLLabel22: TRLLabel
        Left = 519
        Top = 25
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
        Left = 632
        Top = 25
        Width = 118
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
        Left = 212
        Top = 5
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
        Holder = RLDBText2
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult6: TRLDBResult
        Left = 249
        Top = 5
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
        Holder = RLDBText3
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult7: TRLDBResult
        Left = 283
        Top = 5
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
        Holder = RLDBText4
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult8: TRLDBResult
        Left = 316
        Top = 5
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
        Holder = RLDBText5
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult9: TRLDBResult
        Left = 350
        Top = 5
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
        Holder = RLDBText7
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult10: TRLDBResult
        Left = 384
        Top = 5
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
        Holder = RLDBText8
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult11: TRLDBResult
        Left = 418
        Top = 5
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
        Holder = RLDBText9
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult12: TRLDBResult
        Left = 452
        Top = 5
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
        Holder = RLDBText10
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult13: TRLDBResult
        Left = 485
        Top = 5
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
        Holder = RLDBText11
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult14: TRLDBResult
        Left = 519
        Top = 5
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
        Holder = RLDBText12
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult15: TRLDBResult
        Left = 643
        Top = 5
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
        Holder = RLDBText13
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult28: TRLDBResult
        Left = 551
        Top = 5
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
        Holder = RLDBText17
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult29: TRLDBResult
        Left = 584
        Top = 5
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
        Holder = RLDBText18
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult30: TRLDBResult
        Left = 618
        Top = 5
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
        Holder = RLDBText19
        Info = riSum
        ParentFont = False
        Text = ''
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
    Top = 311
    Width = 613
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 307
    ExplicitWidth = 609
    object btnImprimir: TBitBtn
      Left = 219
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
  inline BuscaProduto2: TBuscaProduto2
    Left = 0
    Top = 0
    Width = 606
    Height = 194
    TabOrder = 1
    ExplicitWidth = 606
    inherited lblReferencia: TStaticText
      Color = clBtnFace
    end
    inherited lblProduto: TStaticText
      Color = clBtnFace
    end
    inherited edtDescricao: TEdit
      Width = 475
      ExplicitWidth = 475
    end
    inherited lblCor: TStaticText
      Color = clBtnFace
    end
    inherited edtDescricaoCor: TEdit
      Width = 475
      ExplicitWidth = 475
    end
    inherited lblTamanho: TStaticText
      Color = clBtnFace
    end
    inherited edtDescricaoTamanho: TEdit
      Width = 475
      ExplicitWidth = 475
    end
    inherited edtColecao: TEdit
      Width = 475
      ExplicitWidth = 475
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
      ExplicitWidth = 473
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
    Width = 153
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
  end
  object RLExpressionParser1: TRLExpressionParser
    Left = 680
    Top = 24
  end
  object cdsValorTotal: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 624
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
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2015 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 296
    Top = 168
  end
end
