inherited frmRelatorioPedidosProducao: TfrmRelatorioPedidosProducao
  Left = 272
  Top = 156
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Pedidos p/ Produ'#231#227'o'
  ClientHeight = 592
  ClientWidth = 996
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 1002
  ExplicitHeight = 620
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport2: TRLReport
    Left = 0
    Top = 544
    Width = 1123
    Height = 794
    Margins.LeftMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 15.000000000000000000
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    Borders.FixedLeft = True
    Borders.FixedTop = True
    Borders.FixedRight = True
    Borders.FixedBottom = True
    DataSource = dsItens2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    Visible = False
    BeforePrint = RLReport2BeforePrint
    object RLBand8: TRLBand
      Left = 20
      Top = 39
      Width = 1083
      Height = 90
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel14: TRLLabel
        Left = -9
        Top = 51
        Width = 1095
        Height = 15
        Caption = 
          '________________________________________________________________' +
          '________________________________________________________________' +
          '____________________________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel15: TRLLabel
        Left = 72
        Top = 18
        Width = 119
        Height = 22
        Caption = 'BABY DUCK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLImage2: TRLImage
        Left = 1
        Top = 3
        Width = 67
        Height = 59
      end
      object RLLabel16: TRLLabel
        Left = 74
        Top = 44
        Width = 114
        Height = 15
        Caption = 'Ordem de Produ'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 706
        Top = 11
        Width = 112
        Height = 16
        Info = itLastPageNumber
        Text = ''
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 609
        Top = 11
        Width = 87
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLLabel17: TRLLabel
        Left = 697
        Top = 11
        Width = 8
        Height = 16
        Caption = '/'
      end
      object rlDtIni2: TRLLabel
        Left = 417
        Top = 12
        Width = 48
        Height = 15
        Alignment = taRightJustify
        Caption = 'DtInicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlDtFim2: TRLLabel
        Left = 481
        Top = 12
        Width = 41
        Height = 15
        Caption = 'DtFinal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel20: TRLLabel
        Left = 468
        Top = 12
        Width = 10
        Height = 15
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 332
        Top = 12
        Width = 49
        Height = 15
        Caption = 'Per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rlMemoPedidos2: TRLMemo
        Left = 131
        Top = 70
        Width = 942
        Height = 16
        Behavior = [beSiteExpander]
      end
      object RLLabel22: TRLLabel
        Left = 6
        Top = 70
        Width = 122
        Height = 15
        Caption = 'Pedidos do Relat'#243'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel23: TRLLabel
        Left = 624
        Top = 12
        Width = 31
        Height = 15
        Caption = 'P'#225'g.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rlbGeral2: TRLLabel
        Left = 399
        Top = 12
        Width = 170
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Desde o in'#237'cio at'#233' hoje'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        Visible = False
      end
      object RLSystemInfo7: TRLSystemInfo
        Left = 939
        Top = 11
        Width = 37
        Height = 16
        Info = itNow
        Text = ''
      end
      object RLLabel18: TRLLabel
        Left = 868
        Top = 12
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
    end
    object RLBand10: TRLBand
      Left = 20
      Top = 281
      Width = 1083
      Height = 24
      AlignToBottom = True
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel27: TRLLabel
        Left = 73
        Top = 4
        Width = 164
        Height = 15
        Caption = 'SALDO TOTAL GERAL        > > >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult21: TRLDBResult
        Left = 623
        Top = 3
        Width = 45
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOT_2'
        DataSource = dsItens2
        DisplayMask = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult16: TRLDBResult
        Left = 381
        Top = 3
        Width = 45
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOT_RN'
        DataSource = dsItens2
        DisplayMask = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult17: TRLDBResult
        Left = 429
        Top = 3
        Width = 45
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOT_P'
        DataSource = dsItens2
        DisplayMask = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult18: TRLDBResult
        Left = 478
        Top = 3
        Width = 45
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOT_M'
        DataSource = dsItens2
        DisplayMask = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult19: TRLDBResult
        Left = 526
        Top = 3
        Width = 45
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOT_G'
        DataSource = dsItens2
        DisplayMask = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult20: TRLDBResult
        Left = 575
        Top = 3
        Width = 45
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOT_1'
        DataSource = dsItens2
        DisplayMask = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult22: TRLDBResult
        Left = 671
        Top = 3
        Width = 45
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOT_3'
        DataSource = dsItens2
        DisplayMask = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult23: TRLDBResult
        Left = 719
        Top = 3
        Width = 45
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOT_4'
        DataSource = dsItens2
        DisplayMask = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult24: TRLDBResult
        Left = 767
        Top = 3
        Width = 45
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOT_6'
        DataSource = dsItens2
        DisplayMask = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult25: TRLDBResult
        Left = 815
        Top = 3
        Width = 45
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOT_8'
        DataSource = dsItens2
        DisplayMask = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult26: TRLDBResult
        Left = 1025
        Top = 4
        Width = 45
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOT_UNICA'
        DataSource = dsItens2
        DisplayMask = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult30: TRLDBResult
        Left = 865
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOT_10'
        DataSource = dsItens2
        DisplayMask = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult31: TRLDBResult
        Left = 913
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOT_12'
        DataSource = dsItens2
        DisplayMask = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult32: TRLDBResult
        Left = 961
        Top = 3
        Width = 46
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TOT_14'
        DataSource = dsItens2
        DisplayMask = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
    end
    object RLBand14: TRLBand
      Left = 20
      Top = 129
      Width = 1083
      Height = 28
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Visible = False
      object rlMemoReferencias2: TRLMemo
        Left = 131
        Top = 6
        Width = 942
        Height = 16
        Behavior = [beSiteExpander]
      end
      object RLLabel28: TRLLabel
        Left = 6
        Top = 7
        Width = 120
        Height = 15
        Caption = 'Refer'#234'ncias do Filtro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup3: TRLGroup
      Left = 20
      Top = 157
      Width = 1083
      Height = 124
      object RLBand9: TRLBand
        Left = 0
        Top = 0
        Width = 1083
        Height = 24
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDraw29: TRLDraw
          Left = 863
          Top = -8
          Width = 45
          Height = 31
          Brush.Style = bsClear
          Color = 15395562
          ParentColor = False
          Pen.Color = 13882323
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw15: TRLDraw
          Left = 381
          Top = -8
          Width = 45
          Height = 31
          Brush.Style = bsClear
          Color = 15395562
          ParentColor = False
          Pen.Color = 13882323
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw16: TRLDraw
          Left = 479
          Top = -8
          Width = 45
          Height = 31
          Brush.Style = bsClear
          Color = 15395562
          ParentColor = False
          Pen.Color = 13882323
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw17: TRLDraw
          Left = 575
          Top = -8
          Width = 45
          Height = 31
          Brush.Style = bsClear
          Color = 15395562
          ParentColor = False
          Pen.Color = 13882323
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw18: TRLDraw
          Left = 671
          Top = -8
          Width = 45
          Height = 31
          Brush.Style = bsClear
          Color = 15395562
          ParentColor = False
          Pen.Color = 13882323
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw19: TRLDraw
          Left = 767
          Top = -8
          Width = 45
          Height = 31
          Brush.Style = bsClear
          Color = 15395562
          ParentColor = False
          Pen.Color = 13882323
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw20: TRLDraw
          Left = 958
          Top = -8
          Width = 45
          Height = 31
          Brush.Style = bsClear
          Color = 15395562
          ParentColor = False
          Pen.Color = 13882323
          Pen.Style = psClear
          Transparent = False
        end
        object RLLabel26: TRLLabel
          Left = 396
          Top = 5
          Width = 666
          Height = 14
          Caption = 
            'RN             P             M             G              1     ' +
            '         2              3              4              6         ' +
            '     8             10           12            14              UN' +
            'ICA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLGroup1: TRLGroup
        Left = 0
        Top = 24
        Width = 1083
        Height = 84
        DataFields = 'REFPRO'
        object RLBand11: TRLBand
          Left = 0
          Top = 47
          Width = 1083
          Height = 24
          BandType = btColumnFooter
          BeforePrint = RLBand11BeforePrint
          object RLDraw21: TRLDraw
            Left = -2
            Top = 0
            Width = 1088
            Height = 24
            Brush.Style = bsClear
            Color = clWhite
            ParentColor = False
            Transparent = False
          end
          object RLDraw22: TRLDraw
            Left = 0
            Top = 1
            Width = 1084
            Height = 22
            Brush.Color = 15132390
            Pen.Style = psClear
          end
          object RLLabel24: TRLLabel
            Left = 73
            Top = 4
            Width = 158
            Height = 15
            Caption = 'SALDO TOTAL PRODUTO > > >'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
          end
          object RLDBResult5: TRLDBResult
            Left = 381
            Top = 3
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'TOT_RN'
            DataSource = dsItens2
            DisplayMask = '0'
            Info = riSum
            Text = ''
          end
          object RLDBResult6: TRLDBResult
            Left = 429
            Top = 3
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'TOT_P'
            DataSource = dsItens2
            DisplayMask = '0'
            Info = riSum
            Text = ''
          end
          object RLDBResult7: TRLDBResult
            Left = 479
            Top = 3
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'TOT_M'
            DataSource = dsItens2
            DisplayMask = '0'
            Info = riSum
            Text = ''
          end
          object RLDBResult8: TRLDBResult
            Left = 527
            Top = 3
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'TOT_G'
            DataSource = dsItens2
            DisplayMask = '0'
            Info = riSum
            Text = ''
          end
          object RLDBResult9: TRLDBResult
            Left = 575
            Top = 3
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'TOT_1'
            DataSource = dsItens2
            DisplayMask = '0'
            Info = riSum
            Text = ''
          end
          object RLDBResult10: TRLDBResult
            Left = 623
            Top = 3
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'TOT_2'
            DataSource = dsItens2
            DisplayMask = '0'
            Info = riSum
            Text = ''
          end
          object RLDBResult11: TRLDBResult
            Left = 671
            Top = 3
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'TOT_3'
            DataSource = dsItens2
            DisplayMask = '0'
            Info = riSum
            Text = ''
          end
          object RLDBResult12: TRLDBResult
            Left = 719
            Top = 3
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'TOT_4'
            DataSource = dsItens2
            DisplayMask = '0'
            Info = riSum
            Text = ''
          end
          object RLDBResult13: TRLDBResult
            Left = 767
            Top = 3
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'TOT_6'
            DataSource = dsItens2
            DisplayMask = '0'
            Info = riSum
            Text = ''
          end
          object RLDBResult14: TRLDBResult
            Left = 815
            Top = 3
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'TOT_8'
            DataSource = dsItens2
            DisplayMask = '0'
            Info = riSum
            Text = ''
          end
          object RLDBResult15: TRLDBResult
            Left = 1024
            Top = 3
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'TOT_UNICA'
            DataSource = dsItens2
            DisplayMask = '0'
            Info = riSum
            Text = ''
          end
          object RLDBResult27: TRLDBResult
            Left = 960
            Top = 3
            Width = 46
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'TOT_14'
            DataSource = dsItens2
            DisplayMask = '0'
            Info = riSum
            Text = ''
          end
          object RLDBResult28: TRLDBResult
            Left = 914
            Top = 3
            Width = 46
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'TOT_12'
            DataSource = dsItens2
            DisplayMask = '0'
            Info = riSum
            Text = ''
          end
          object RLDBResult29: TRLDBResult
            Left = 864
            Top = 3
            Width = 46
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'TOT_10'
            DataSource = dsItens2
            DisplayMask = '0'
            Info = riSum
            Text = ''
          end
        end
        object RLBand12: TRLBand
          Left = 0
          Top = 24
          Width = 1083
          Height = 23
          BeforePrint = RLBand12BeforePrint
          object RLDraw30: TRLDraw
            Left = 863
            Top = -8
            Width = 45
            Height = 31
            Brush.Style = bsClear
            Color = 15395562
            ParentColor = False
            Pen.Color = 13882323
            Pen.Style = psClear
            Transparent = False
          end
          object RLDraw28: TRLDraw
            Left = 958
            Top = -8
            Width = 45
            Height = 31
            Brush.Style = bsClear
            Color = 15395562
            ParentColor = False
            Pen.Color = 13882323
            Pen.Style = psClear
            Transparent = False
          end
          object RLDraw27: TRLDraw
            Left = 767
            Top = -8
            Width = 45
            Height = 31
            Brush.Style = bsClear
            Color = 15395562
            ParentColor = False
            Pen.Color = 13882323
            Pen.Style = psClear
            Transparent = False
          end
          object RLDraw26: TRLDraw
            Left = 671
            Top = -8
            Width = 45
            Height = 31
            Brush.Style = bsClear
            Color = 15395562
            ParentColor = False
            Pen.Color = 13882323
            Pen.Style = psClear
            Transparent = False
          end
          object RLDraw25: TRLDraw
            Left = 575
            Top = -8
            Width = 45
            Height = 31
            Brush.Style = bsClear
            Color = 15395562
            ParentColor = False
            Pen.Color = 13882323
            Pen.Style = psClear
            Transparent = False
          end
          object RLDraw24: TRLDraw
            Left = 479
            Top = -8
            Width = 45
            Height = 31
            Brush.Style = bsClear
            Color = 15395562
            ParentColor = False
            Pen.Color = 13882323
            Pen.Style = psClear
            Transparent = False
          end
          object RLDraw23: TRLDraw
            Left = 381
            Top = -8
            Width = 45
            Height = 31
            Brush.Style = bsClear
            Color = 15395562
            ParentColor = False
            Pen.Color = 13882323
            Pen.Style = psClear
            Transparent = False
          end
          object RLDBText1: TRLDBText
            Left = 1
            Top = 3
            Width = 45
            Height = 15
            DataField = 'REFCOR'
            DataSource = dsItens2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText31: TRLDBText
            Left = 75
            Top = 3
            Width = 301
            Height = 15
            AutoSize = False
            DataField = 'COR'
            DataSource = dsItens2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText16: TRLDBText
            Left = 381
            Top = 4
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'SALDO_RN'
            DataSource = dsItens2
            Text = ''
          end
          object RLDBText20: TRLDBText
            Left = 430
            Top = 4
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'SALDO_P'
            DataSource = dsItens2
            Text = ''
          end
          object RLDBText21: TRLDBText
            Left = 479
            Top = 4
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'SALDO_M'
            DataSource = dsItens2
            Text = ''
          end
          object RLDBText22: TRLDBText
            Left = 527
            Top = 4
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'SALDO_G'
            DataSource = dsItens2
            Text = ''
          end
          object RLDBText23: TRLDBText
            Left = 575
            Top = 4
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'SALDO_1'
            DataSource = dsItens2
            Text = ''
          end
          object RLDBText24: TRLDBText
            Left = 623
            Top = 4
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'SALDO_2'
            DataSource = dsItens2
            Text = ''
          end
          object RLDBText25: TRLDBText
            Left = 671
            Top = 4
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'SALDO_3'
            DataSource = dsItens2
            Text = ''
          end
          object RLDBText26: TRLDBText
            Left = 719
            Top = 4
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'SALDO_4'
            DataSource = dsItens2
            Text = ''
          end
          object RLDBText27: TRLDBText
            Left = 767
            Top = 4
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'SALDO_6'
            DataSource = dsItens2
            Text = ''
          end
          object RLDBText28: TRLDBText
            Left = 815
            Top = 4
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'SALDO_8'
            DataSource = dsItens2
            Text = ''
          end
          object RLDBText29: TRLDBText
            Left = 1024
            Top = 4
            Width = 45
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'SALDO_UNICA'
            DataSource = dsItens2
            DisplayMask = '0'
            Text = ''
          end
          object RLDBText30: TRLDBText
            Left = 863
            Top = 4
            Width = 46
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'SALDO_10'
            DataSource = dsItens2
            Text = ''
          end
          object RLDBText32: TRLDBText
            Left = 911
            Top = 4
            Width = 46
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'SALDO_12'
            DataSource = dsItens2
            Text = ''
          end
          object RLDBText35: TRLDBText
            Left = 959
            Top = 4
            Width = 46
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'SALDO_14'
            DataSource = dsItens2
            Text = ''
          end
        end
        object RLBand13: TRLBand
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
          Borders.FixedBottom = True
          object RLDBText33: TRLDBText
            Left = 3
            Top = 6
            Width = 50
            Height = 15
            DataField = 'REFPRO'
            DataSource = dsItens2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
          object RLDBText34: TRLDBText
            Left = 74
            Top = 5
            Width = 68
            Height = 16
            DataField = 'PRODUTO'
            DataSource = dsItens2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
            Transparent = False
          end
        end
      end
    end
  end
  object rgCores: TRadioGroup
    Left = 347
    Top = 438
    Width = 322
    Height = 72
    ItemIndex = 2
    Items.Strings = (
      'Mais refer'#234'ncias selecionadas'
      'Menos refer'#234'ncias selecionadas'
      'Somente com refer'#234'ncias selecionadas')
    TabOrder = 9
    OnClick = rgCoresClick
  end
  object rgReferencias: TRadioGroup
    Left = 16
    Top = 438
    Width = 322
    Height = 72
    ItemIndex = 2
    Items.Strings = (
      'Mais refer'#234'ncias selecionadas'
      'Menos refer'#234'ncias selecionadas'
      'Somente com refer'#234'ncias selecionadas')
    TabOrder = 7
    OnClick = rgReferenciasClick
  end
  object gbPeriodo: TGroupBox
    Left = 678
    Top = 8
    Width = 303
    Height = 113
    Caption = ' Per'#237'odo: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label6: TLabel
      Left = 25
      Top = 22
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
      Left = 161
      Top = 22
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
    object Label3: TLabel
      Left = 1
      Top = 63
      Width = 300
      Height = 13
      AutoSize = False
      Caption = '_____________________________________________________________'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 11908533
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object dtpInicio: TDateTimePicker
      Left = 25
      Top = 38
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
      Left = 161
      Top = 38
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
    object cbPeriodo: TCheckBox
      Left = 63
      Top = 85
      Width = 170
      Height = 17
      Caption = 'Considerar per'#237'odo geral'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = cbPeriodoClick
    end
  end
  object rgData: TRadioGroup
    Left = 16
    Top = 8
    Width = 322
    Height = 113
    Caption = ' Filtrar por data de: '
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ItemIndex = 1
    Items.Strings = (
      'Cadastro'
      'Representante'
      'Recebimento'
      'Entrega')
    ParentFont = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 551
    Width = 996
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    DesignSize = (
      996
      41)
    object btnImprimir: TSpeedButton
      Left = 811
      Top = 6
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
      ExplicitLeft = 812
    end
    object SpeedButton1: TSpeedButton
      Left = 631
      Top = 6
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
      ExplicitLeft = 632
    end
  end
  object rgPedidos: TRadioGroup
    Left = 678
    Top = 438
    Width = 303
    Height = 72
    ItemIndex = 2
    Items.Strings = (
      'Mais pedidos selecionados'
      'Menos pedidos selecionados'
      'Somente com pedidos selecionados')
    TabOrder = 4
    OnClick = rgPedidosClick
  end
  object GroupBox1: TGroupBox
    Left = 678
    Top = 130
    Width = 303
    Height = 318
    Caption = ' Filtro Pedidos '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 294
      Width = 245
      Height = 13
      Caption = 'Delete - Remove selecionado   |   F3 - Limpa grid'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3487029
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object gridPedidos: TDBGridCBN
      Left = 11
      Top = 85
      Width = 279
      Height = 202
      Color = 14803425
      DataSource = dsPedidos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = gridPedidosKeyDown
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
      TipoBusca.ListarApenasEncontrados = False
      TipoBusca.QualquerParte = False
      SalvaConfiguracoes = False
      Columns = <
        item
          Expanded = False
          FieldName = 'PEDIDO'
          Title.Caption = 'N'#186' do Pedido'
          Width = 226
          Visible = True
        end>
    end
    inline BuscaPedido1: TBuscaPedido
      Left = 9
      Top = 14
      Width = 285
      Height = 67
      TabOrder = 1
      ExplicitLeft = 9
      ExplicitTop = 14
      ExplicitWidth = 285
      ExplicitHeight = 67
      inherited btnBuscar: TBitBtn
        Left = 162
        Top = 32
        OnClick = BuscaPedido1btnBuscarClick
        ExplicitLeft = 162
        ExplicitTop = 32
      end
      inherited rgTipoBusca: TRadioGroup
        Left = 0
        Top = -2
        Width = 282
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ItemIndex = 2
        ParentFont = False
        ExplicitLeft = 0
        ExplicitTop = -2
        ExplicitWidth = 282
      end
      inherited edtNumPedido: TEdit
        Left = 82
        Top = 34
        Width = 77
        ExplicitLeft = 82
        ExplicitTop = 34
        ExplicitWidth = 77
      end
      inherited stNumPed: TStaticText
        Left = 0
        Top = 38
        ExplicitLeft = 0
        ExplicitTop = 38
      end
    end
    object btnAddPedido: TBitBtn
      Left = 212
      Top = 46
      Width = 77
      Height = 29
      Caption = 'Add'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5600D00C9651100FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B0061000000650100009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C45D0B00DD963B00EDBD6500C763
        1200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B006000000079320000895901006300
        00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00C45D0D00DE922C00F5D67500F6BF2900D27C
        1600C9681700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B00600000007A2E000091721100925B00006E18
        0000650400009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C2580900E3931F00FCDC6E00F2B62B00E68A0000EF9B
        0000CE720C00C9681800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B005E0000007F2F000098780A008E520000822600008B37
        00006A0E0000650400009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00C1570700E59F2E00FEE68C00F2BD3800EFA71B00EDA41800E68F
        0200ED9E0200D0730A00C9681900FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B005D000000813B00009A8228008E5900008B43000089400000822B
        0000893A00006C0F0000650400009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00C1560500E5A54000FFF3B100F7D47400F5BD3600F3B53400EFA92100EC9C
        0E00E48C0000F0A90E00D4760800C9681A00FFFFFF00FFFFFF009B9B9B009B9B
        9B005D000000814100009B8F4D0093701000915900008F5100008B4500008838
        0000802800008C45000070120000650400009B9B9B009B9B9B00FFFFFF00C155
        0500E5A63F00FFFCCC00FDE9A200F8C94700F6C95100F4BD3C00F1B02C00EEA4
        1A00E9950500E18B0000F0AD1500D5770800C0550000FFFFFF009B9B9B005D00
        0000814200009B98680099853E009465000092650000905900008D4C00008A40
        0000853100007D2700008C490000711300005C0000009B9B9B00C1570800E4A5
        4100FFFEC800FFFBC800FDDE6700FBD46300F7CD5500F5C54700F3B63500EFA8
        2400ED9F1200E9930000E6910100F4BA2300D47A0B00C05500005D0000008041
        00009B9A64009B976400997A03009770000093690000916100008F5200008B44
        0000893B0000852F0000822D000090560000701600005C000000DA8A2600F8BE
        3300F3B83B00ECA01A00E7A33B00FFF7C700FAD26100F7C84E00F5BF4000F2B3
        2F00F3AB1C00CA670900BE510000BE510000BF540000C055000076260000945A
        00008F540000883C0000833F00009B936300966E000093640000915B00008E4F
        00008F470000660300005A0000005A0000005B0000005C000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E8A03700FFFDD900FBD76900F8CB5500F6C74900F4BD
        3900F5B42700C5610B00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00843C00009B9975009773050094670000926300009059
        000091500000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EAA83D00FFFCD800FBDC7100F9D26000F7C95200F6C4
        4300F8BC3300C5600A00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00864400009B98740097780D00956E0000936500009260
        000094580000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EBA83C00FFFEDD00FDE07A00FBD76900F9CF5C00F7CA
        4D00FCC63E00C5600900FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00874400009B9A7900997C160097730500956B00009366
        000098620000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00ECAA3D00FFFFE000FEE38000FCDC7200F9D36500F8CD
        5600FDCD4700C55F0800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00884600009B9B7C009A7F1C0098780E00956F01009469
        000099690000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EDAB3E00FFFFE300FEE78900FDE17A00FBDA6F00FAD0
        6300FFD55500C45E0700FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00894700009B9B7F009A832500997D160097760B00966C
        00009B710000600000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EEB14400FFFFFA00FFF49D00FFF08E00FFEB8300FFE6
        7600FFE76700C45E0600FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B008A4D00009B9B96009B9039009B8C2A009B871F009B82
        12009B830300600000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EEA42A00F1BC5A00EDAC3800E9A23100E3982E00DE91
        2800DC8C2500CA671300FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B008A4000008D58000089480000853E00007F3400007A2D
        000078280000660300009B9B9B009B9B9B009B9B9B009B9B9B00}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
      OnClick = btnAddPedidoClick
      OnEnter = btnAddPedidoEnter
    end
  end
  object rgTipo: TRadioGroup
    Left = 347
    Top = 8
    Width = 157
    Height = 113
    Caption = ' Tipo Relat'#243'rio: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Normal'
      'Saldo'
      'N'#227'o Conferido(s)')
    ParentFont = False
    TabOrder = 5
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 130
    Width = 322
    Height = 318
    Caption = ' Filtro Refer'#234'ncias '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object Label2: TLabel
      Left = 12
      Top = 292
      Width = 245
      Height = 13
      Caption = 'Delete - Remove selecionado   |   F3 - Limpa grid'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3487029
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object gridReferencias: TDBGridCBN
      Left = 11
      Top = 86
      Width = 286
      Height = 202
      TabStop = False
      Color = 14803425
      DataSource = dsReferencias
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = gridReferenciasKeyDown
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
      TipoBusca.ListarApenasEncontrados = False
      TipoBusca.QualquerParte = False
      SalvaConfiguracoes = False
      Columns = <
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Title.Caption = 'Refer'#234'ncia'
          Width = 255
          Visible = True
        end>
    end
    inline BuscaProduto1: TBuscaProduto
      Left = 6
      Top = 37
      Width = 206
      Height = 30
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      OnExit = BuscaProduto1Exit
      ExplicitLeft = 6
      ExplicitTop = 37
      ExplicitWidth = 206
      ExplicitHeight = 30
      inherited StaticText1: TStaticText
        Width = 64
        Caption = 'Ref. Produto'
        Font.Style = []
        ExplicitWidth = 64
      end
      inherited StaticText2: TStaticText
        Left = 226
        ExplicitLeft = 226
      end
      inherited edtReferencia: TEdit
        Left = 77
        Top = 4
        Width = 89
        ExplicitLeft = 77
        ExplicitTop = 4
        ExplicitWidth = 89
      end
      inherited btnBusca: TBitBtn
        Left = 172
        Top = 2
        ExplicitLeft = 172
        ExplicitTop = 2
      end
      inherited edtDescricao: TEdit
        Left = 227
        Width = 157
        ExplicitLeft = 227
        ExplicitWidth = 157
      end
    end
    object btnAddReferencia: TBitBtn
      Left = 218
      Top = 36
      Width = 78
      Height = 29
      Caption = 'Add'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5600D00C9651100FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B0061000000650100009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C45D0B00DD963B00EDBD6500C763
        1200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B006000000079320000895901006300
        00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00C45D0D00DE922C00F5D67500F6BF2900D27C
        1600C9681700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B00600000007A2E000091721100925B00006E18
        0000650400009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C2580900E3931F00FCDC6E00F2B62B00E68A0000EF9B
        0000CE720C00C9681800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B005E0000007F2F000098780A008E520000822600008B37
        00006A0E0000650400009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00C1570700E59F2E00FEE68C00F2BD3800EFA71B00EDA41800E68F
        0200ED9E0200D0730A00C9681900FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B005D000000813B00009A8228008E5900008B43000089400000822B
        0000893A00006C0F0000650400009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00C1560500E5A54000FFF3B100F7D47400F5BD3600F3B53400EFA92100EC9C
        0E00E48C0000F0A90E00D4760800C9681A00FFFFFF00FFFFFF009B9B9B009B9B
        9B005D000000814100009B8F4D0093701000915900008F5100008B4500008838
        0000802800008C45000070120000650400009B9B9B009B9B9B00FFFFFF00C155
        0500E5A63F00FFFCCC00FDE9A200F8C94700F6C95100F4BD3C00F1B02C00EEA4
        1A00E9950500E18B0000F0AD1500D5770800C0550000FFFFFF009B9B9B005D00
        0000814200009B98680099853E009465000092650000905900008D4C00008A40
        0000853100007D2700008C490000711300005C0000009B9B9B00C1570800E4A5
        4100FFFEC800FFFBC800FDDE6700FBD46300F7CD5500F5C54700F3B63500EFA8
        2400ED9F1200E9930000E6910100F4BA2300D47A0B00C05500005D0000008041
        00009B9A64009B976400997A03009770000093690000916100008F5200008B44
        0000893B0000852F0000822D000090560000701600005C000000DA8A2600F8BE
        3300F3B83B00ECA01A00E7A33B00FFF7C700FAD26100F7C84E00F5BF4000F2B3
        2F00F3AB1C00CA670900BE510000BE510000BF540000C055000076260000945A
        00008F540000883C0000833F00009B936300966E000093640000915B00008E4F
        00008F470000660300005A0000005A0000005B0000005C000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E8A03700FFFDD900FBD76900F8CB5500F6C74900F4BD
        3900F5B42700C5610B00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00843C00009B9975009773050094670000926300009059
        000091500000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EAA83D00FFFCD800FBDC7100F9D26000F7C95200F6C4
        4300F8BC3300C5600A00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00864400009B98740097780D00956E0000936500009260
        000094580000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EBA83C00FFFEDD00FDE07A00FBD76900F9CF5C00F7CA
        4D00FCC63E00C5600900FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00874400009B9A7900997C160097730500956B00009366
        000098620000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00ECAA3D00FFFFE000FEE38000FCDC7200F9D36500F8CD
        5600FDCD4700C55F0800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00884600009B9B7C009A7F1C0098780E00956F01009469
        000099690000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EDAB3E00FFFFE300FEE78900FDE17A00FBDA6F00FAD0
        6300FFD55500C45E0700FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00894700009B9B7F009A832500997D160097760B00966C
        00009B710000600000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EEB14400FFFFFA00FFF49D00FFF08E00FFEB8300FFE6
        7600FFE76700C45E0600FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B008A4D00009B9B96009B9039009B8C2A009B871F009B82
        12009B830300600000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EEA42A00F1BC5A00EDAC3800E9A23100E3982E00DE91
        2800DC8C2500CA671300FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B008A4000008D58000089480000853E00007F3400007A2D
        000078280000660300009B9B9B009B9B9B009B9B9B009B9B9B00}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
      OnClick = btnAddReferenciaClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 347
    Top = 130
    Width = 322
    Height = 318
    Caption = ' Filtro Cores '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object Label4: TLabel
      Left = 12
      Top = 293
      Width = 245
      Height = 13
      Caption = 'Delete - Remove selecionado   |   F3 - Limpa grid'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3487029
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnAddCor: TBitBtn
      Left = 226
      Top = 34
      Width = 78
      Height = 29
      Caption = 'Add'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5600D00C9651100FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B0061000000650100009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C45D0B00DD963B00EDBD6500C763
        1200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B006000000079320000895901006300
        00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00C45D0D00DE922C00F5D67500F6BF2900D27C
        1600C9681700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B00600000007A2E000091721100925B00006E18
        0000650400009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C2580900E3931F00FCDC6E00F2B62B00E68A0000EF9B
        0000CE720C00C9681800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B005E0000007F2F000098780A008E520000822600008B37
        00006A0E0000650400009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00C1570700E59F2E00FEE68C00F2BD3800EFA71B00EDA41800E68F
        0200ED9E0200D0730A00C9681900FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B005D000000813B00009A8228008E5900008B43000089400000822B
        0000893A00006C0F0000650400009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00C1560500E5A54000FFF3B100F7D47400F5BD3600F3B53400EFA92100EC9C
        0E00E48C0000F0A90E00D4760800C9681A00FFFFFF00FFFFFF009B9B9B009B9B
        9B005D000000814100009B8F4D0093701000915900008F5100008B4500008838
        0000802800008C45000070120000650400009B9B9B009B9B9B00FFFFFF00C155
        0500E5A63F00FFFCCC00FDE9A200F8C94700F6C95100F4BD3C00F1B02C00EEA4
        1A00E9950500E18B0000F0AD1500D5770800C0550000FFFFFF009B9B9B005D00
        0000814200009B98680099853E009465000092650000905900008D4C00008A40
        0000853100007D2700008C490000711300005C0000009B9B9B00C1570800E4A5
        4100FFFEC800FFFBC800FDDE6700FBD46300F7CD5500F5C54700F3B63500EFA8
        2400ED9F1200E9930000E6910100F4BA2300D47A0B00C05500005D0000008041
        00009B9A64009B976400997A03009770000093690000916100008F5200008B44
        0000893B0000852F0000822D000090560000701600005C000000DA8A2600F8BE
        3300F3B83B00ECA01A00E7A33B00FFF7C700FAD26100F7C84E00F5BF4000F2B3
        2F00F3AB1C00CA670900BE510000BE510000BF540000C055000076260000945A
        00008F540000883C0000833F00009B936300966E000093640000915B00008E4F
        00008F470000660300005A0000005A0000005B0000005C000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E8A03700FFFDD900FBD76900F8CB5500F6C74900F4BD
        3900F5B42700C5610B00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00843C00009B9975009773050094670000926300009059
        000091500000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EAA83D00FFFCD800FBDC7100F9D26000F7C95200F6C4
        4300F8BC3300C5600A00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00864400009B98740097780D00956E0000936500009260
        000094580000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EBA83C00FFFEDD00FDE07A00FBD76900F9CF5C00F7CA
        4D00FCC63E00C5600900FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00874400009B9A7900997C160097730500956B00009366
        000098620000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00ECAA3D00FFFFE000FEE38000FCDC7200F9D36500F8CD
        5600FDCD4700C55F0800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00884600009B9B7C009A7F1C0098780E00956F01009469
        000099690000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EDAB3E00FFFFE300FEE78900FDE17A00FBDA6F00FAD0
        6300FFD55500C45E0700FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00894700009B9B7F009A832500997D160097760B00966C
        00009B710000600000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EEB14400FFFFFA00FFF49D00FFF08E00FFEB8300FFE6
        7600FFE76700C45E0600FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B008A4D00009B9B96009B9039009B8C2A009B871F009B82
        12009B830300600000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EEA42A00F1BC5A00EDAC3800E9A23100E3982E00DE91
        2800DC8C2500CA671300FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B008A4000008D58000089480000853E00007F3400007A2D
        000078280000660300009B9B9B009B9B9B009B9B9B009B9B9B00}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnAddCorClick
    end
    inline BuscaCor1: TBuscaCor
      Left = 19
      Top = 15
      Width = 198
      Height = 54
      TabOrder = 1
      OnExit = BuscaCor1Exit
      ExplicitLeft = 19
      ExplicitTop = 15
      ExplicitWidth = 198
      inherited edtCodigo: TCurrencyEdit
        Left = 16
        Top = 47
        ExplicitLeft = 16
        ExplicitTop = 47
      end
      inherited StaticText2: TStaticText
        Left = 18
        Top = 56
        ExplicitLeft = 18
        ExplicitTop = 56
      end
      inherited StaticText1: TStaticText
        Top = 27
        Width = 43
        Caption = 'Ref. Cor'
        Font.Style = []
        ExplicitTop = 27
        ExplicitWidth = 43
      end
      inherited btnBusca: TBitBtn
        Left = 167
        Width = 26
        ExplicitLeft = 167
        ExplicitWidth = 26
      end
      inherited edtDescricao: TEdit
        Left = 19
        Top = 56
        ExplicitLeft = 19
        ExplicitTop = 56
      end
      inherited edtReferencia: TEdit
        Left = 72
        Top = 24
        Width = 89
        ExplicitLeft = 72
        ExplicitTop = 24
        ExplicitWidth = 89
      end
    end
    object gridCores: TDBGridCBN
      Left = 11
      Top = 87
      Width = 286
      Height = 202
      TabStop = False
      Color = 14803425
      DataSource = dsCores
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = gridCoresKeyDown
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
      TipoBusca.ListarApenasEncontrados = False
      TipoBusca.QualquerParte = False
      SalvaConfiguracoes = False
      Columns = <
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Title.Caption = 'Refer'#234'ncia'
          Width = 255
          Visible = True
        end>
    end
  end
  object rgAgrupamento: TRadioGroup
    Left = 512
    Top = 8
    Width = 157
    Height = 113
    Caption = ' Agrupado por: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Produtos'
      'Cores')
    ParentFont = False
    TabOrder = 12
    OnClick = rgAgrupamentoClick
  end
  object RLReport1: TRLReport
    Left = -83
    Top = 516
    Width = 794
    Height = 1123
    Margins.LeftMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 15.000000000000000000
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    Borders.FixedLeft = True
    Borders.FixedTop = True
    Borders.FixedRight = True
    Borders.FixedBottom = True
    DataSource = dsItens
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
      Height = 90
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel5: TRLLabel
        Left = -9
        Top = 51
        Width = 801
        Height = 15
        Caption = 
          '________________________________________________________________' +
          '__________________________________________________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 72
        Top = 18
        Width = 119
        Height = 22
        Caption = 'BABY DUCK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLImage1: TRLImage
        Left = 1
        Top = 3
        Width = 67
        Height = 59
      end
      object RLLabel1: TRLLabel
        Left = 74
        Top = 44
        Width = 114
        Height = 15
        Caption = 'Ordem de Produ'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 706
        Top = 11
        Width = 112
        Height = 16
        Info = itLastPageNumber
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 609
        Top = 11
        Width = 87
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 697
        Top = 11
        Width = 8
        Height = 16
        Caption = '/'
      end
      object rlDtIni: TRLLabel
        Left = 417
        Top = 12
        Width = 48
        Height = 15
        Alignment = taRightJustify
        Caption = 'DtInicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RlDtFim: TRLLabel
        Left = 481
        Top = 12
        Width = 41
        Height = 15
        Caption = 'DtFinal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 468
        Top = 12
        Width = 10
        Height = 15
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 332
        Top = 12
        Width = 49
        Height = 15
        Caption = 'Per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rlMemoPedidos: TRLMemo
        Left = 131
        Top = 70
        Width = 607
        Height = 16
        Behavior = [beSiteExpander]
      end
      object RLLabel6: TRLLabel
        Left = 6
        Top = 70
        Width = 122
        Height = 15
        Caption = 'Pedidos do Relat'#243'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 624
        Top = 12
        Width = 31
        Height = 15
        Caption = 'P'#225'g.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rlbGeral: TRLLabel
        Left = 399
        Top = 12
        Width = 170
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Desde o in'#237'cio at'#233' hoje'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        Visible = False
      end
      object RLLabel19: TRLLabel
        Left = 537
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
        Left = 608
        Top = 35
        Width = 37
        Height = 16
        Info = itNow
        Text = ''
      end
    end
    object RLBand7: TRLBand
      Left = 20
      Top = 273
      Width = 754
      Height = 24
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLDBResult1: TRLDBResult
        Left = 581
        Top = 3
        Width = 122
        Height = 16
        Alignment = taRightJustify
        DataField = 'QTD_TOTAL'
        DataSource = dsItens
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
        Left = 661
        Top = 4
        Width = 90
        Height = 16
        Alignment = taRightJustify
        DataField = 'PECAS'
        DataSource = dsItens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel4: TRLLabel
        Left = 321
        Top = 4
        Width = 240
        Height = 15
        Caption = 'Quantidade total de refer'#234'ncias e pe'#231'as  >>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 20
      Top = 129
      Width = 754
      Height = 28
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Visible = False
      object rlMemoReferencias: TRLMemo
        Left = 131
        Top = 6
        Width = 607
        Height = 16
        Behavior = [beSiteExpander]
      end
      object RLLabel13: TRLLabel
        Left = 6
        Top = 7
        Width = 120
        Height = 15
        Caption = 'Refer'#234'ncias do Filtro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup4: TRLGroup
      Left = 20
      Top = 157
      Width = 754
      Height = 116
      object RLGroup2: TRLGroup
        Left = 0
        Top = 24
        Width = 754
        Height = 80
        DataFields = 'REF_PRODUTO'
        object RLBand2: TRLBand
          Left = 0
          Top = 48
          Width = 754
          Height = 24
          BandType = btColumnFooter
          object RLDraw13: TRLDraw
            Left = -3
            Top = 0
            Width = 760
            Height = 24
            Brush.Style = bsClear
            Color = clWhite
            ParentColor = False
            Transparent = False
          end
          object RLDraw14: TRLDraw
            Left = 570
            Top = 1
            Width = 188
            Height = 22
            Brush.Color = 15132390
            Pen.Style = psClear
          end
          object RLDBResult3: TRLDBResult
            Left = 662
            Top = 3
            Width = 89
            Height = 16
            Alignment = taRightJustify
            DataField = 'PECAS'
            DataSource = dsItens
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
            Left = 582
            Top = 3
            Width = 122
            Height = 16
            Alignment = taRightJustify
            DataField = 'QTD_TOTAL'
            DataSource = dsItens
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            Text = ''
          end
        end
        object RLBand5: TRLBand
          Left = 0
          Top = 24
          Width = 754
          Height = 24
          BeforePrint = RLBand5BeforePrint
          object RLDraw6: TRLDraw
            Left = 548
            Top = -5
            Width = 28
            Height = 31
            Brush.Style = bsClear
            Color = 15395562
            ParentColor = False
            Pen.Color = 13882323
            Pen.Style = psClear
            Transparent = False
          end
          object RLDraw5: TRLDraw
            Left = 494
            Top = -5
            Width = 28
            Height = 31
            Brush.Style = bsClear
            Color = 15395562
            ParentColor = False
            Pen.Color = 13882323
            Pen.Style = psClear
            Transparent = False
          end
          object RLDraw4: TRLDraw
            Left = 441
            Top = -5
            Width = 28
            Height = 31
            Brush.Style = bsClear
            Color = 15395562
            ParentColor = False
            Pen.Color = 13882323
            Pen.Style = psClear
            Transparent = False
          end
          object RLDraw3: TRLDraw
            Left = 384
            Top = -6
            Width = 28
            Height = 31
            Brush.Style = bsClear
            Color = 15395562
            ParentColor = False
            Pen.Color = 13882323
            Pen.Style = psClear
            Transparent = False
          end
          object RLDraw1: TRLDraw
            Left = 327
            Top = -6
            Width = 28
            Height = 31
            Brush.Style = bsClear
            Color = 15395562
            ParentColor = False
            Pen.Color = 13882323
            Pen.Style = psClear
            Transparent = False
          end
          object RLDBText2: TRLDBText
            Left = 1
            Top = 3
            Width = 68
            Height = 15
            DataField = 'REF_COR'
            DataSource = dsItens
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText4: TRLDBText
            Left = 288
            Top = 3
            Width = 46
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_P'
            DataSource = dsItens
            Text = ''
          end
          object RLDBText5: TRLDBText
            Left = 317
            Top = 3
            Width = 48
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_M'
            DataSource = dsItens
            Text = ''
          end
          object RLDBText6: TRLDBText
            Left = 348
            Top = 3
            Width = 48
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_G'
            DataSource = dsItens
            Text = ''
          end
          object RLDBText7: TRLDBText
            Left = 378
            Top = 3
            Width = 44
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_1'
            DataSource = dsItens
            Text = ''
          end
          object RLDBText8: TRLDBText
            Left = 404
            Top = 3
            Width = 44
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_2'
            DataSource = dsItens
            Text = ''
          end
          object RLDBText9: TRLDBText
            Left = 433
            Top = 3
            Width = 44
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_3'
            DataSource = dsItens
            Text = ''
          end
          object RLDBText10: TRLDBText
            Left = 460
            Top = 3
            Width = 44
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_4'
            DataSource = dsItens
            Text = ''
          end
          object RLDBText11: TRLDBText
            Left = 486
            Top = 3
            Width = 44
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_6'
            DataSource = dsItens
            Text = ''
          end
          object RLDBText12: TRLDBText
            Left = 513
            Top = 3
            Width = 44
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_8'
            DataSource = dsItens
            Text = ''
          end
          object RLDBText14: TRLDBText
            Left = 674
            Top = 3
            Width = 30
            Height = 16
            Alignment = taRightJustify
            DataField = 'QTD_TOTAL'
            DataSource = dsItens
            Text = ''
          end
          object RLDBText15: TRLDBText
            Left = 702
            Top = 3
            Width = 49
            Height = 16
            Alignment = taRightJustify
            DataField = 'PECAS'
            DataSource = dsItens
            Text = ''
          end
          object RLDBText17: TRLDBText
            Left = 70
            Top = 3
            Width = 192
            Height = 15
            AutoSize = False
            DataField = 'COR'
            DataSource = dsItens
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDraw2: TRLDraw
            Left = 266
            Top = -5
            Width = 28
            Height = 31
            Brush.Style = bsClear
            Color = 15395562
            ParentColor = False
            Pen.Color = 13882323
            Pen.Style = psClear
            Transparent = False
          end
          object RLDBText3: TRLDBText
            Left = 252
            Top = 3
            Width = 56
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_RN'
            DataSource = dsItens
            Text = ''
          end
          object RLDraw32: TRLDraw
            Left = 608
            Top = -6
            Width = 28
            Height = 30
            Brush.Style = bsClear
            Color = 15132390
            ParentColor = False
            Pen.Color = 12895428
            Pen.Style = psClear
            Transparent = False
          end
          object RLDBText36: TRLDBText
            Left = 540
            Top = 3
            Width = 52
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_10'
            DataSource = dsItens
            Text = ''
          end
          object RLDBText37: TRLDBText
            Left = 567
            Top = 3
            Width = 52
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_12'
            DataSource = dsItens
            Text = ''
          end
          object RLDBText38: TRLDBText
            Left = 596
            Top = 3
            Width = 52
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_14'
            DataSource = dsItens
            Text = ''
          end
          object RLDBText13: TRLDBText
            Left = 615
            Top = 3
            Width = 76
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_UNICA'
            DataSource = dsItens
            Text = ''
          end
        end
        object RLBand6: TRLBand
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
          Borders.FixedBottom = True
          object RLDBText18: TRLDBText
            Left = 3
            Top = 6
            Width = 82
            Height = 15
            DataField = 'REF_PRODUTO'
            DataSource = dsItens
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
          object RLDBText19: TRLDBText
            Left = 70
            Top = 5
            Width = 57
            Height = 15
            DataField = 'PRODUTO'
            DataSource = dsItens
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
            Transparent = False
          end
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 754
        Height = 24
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDraw31: TRLDraw
          Left = 608
          Top = -7
          Width = 28
          Height = 30
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLLabel11: TRLLabel
          Left = 679
          Top = 5
          Width = 24
          Height = 14
          Caption = 'Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel12: TRLLabel
          Left = 714
          Top = 5
          Width = 36
          Height = 14
          Caption = 'Pe'#231'as'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw7: TRLDraw
          Left = 266
          Top = -7
          Width = 28
          Height = 30
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw8: TRLDraw
          Left = 327
          Top = -7
          Width = 28
          Height = 30
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw9: TRLDraw
          Left = 384
          Top = -7
          Width = 28
          Height = 30
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw10: TRLDraw
          Left = 441
          Top = -7
          Width = 28
          Height = 30
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw11: TRLDraw
          Left = 494
          Top = -7
          Width = 28
          Height = 30
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw12: TRLDraw
          Left = 552
          Top = -7
          Width = 28
          Height = 30
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLLabel10: TRLLabel
          Left = 270
          Top = 5
          Width = 399
          Height = 14
          Caption = 
            'RN       P       M       G       1       2       3       4      ' +
            ' 6       8      10      12      14   UNICA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  object cdsPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = cdsPedidosAfterPost
    Left = 695
    Top = 252
    object cdsPedidosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsPedidosPEDIDO: TStringField
      FieldName = 'PEDIDO'
    end
  end
  object dsPedidos: TDataSource
    DataSet = cdsPedidos
    Left = 735
    Top = 252
  end
  object cdsReferencias: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = cdsReferenciasAfterPost
    Left = 39
    Top = 252
    object cdsReferenciasCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsReferenciasREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
  end
  object dsReferencias: TDataSource
    DataSet = cdsReferencias
    Left = 79
    Top = 252
  end
  object dsItens: TDataSource
    DataSet = qryItens
    Left = 872
    Top = 32
  end
  object dsItens2: TDataSource
    DataSet = cdsItens2
    Left = 984
    Top = 304
  end
  object dspItens2: TDataSetProvider
    DataSet = qryItens2
    Left = 907
    Top = 304
  end
  object cdsItens2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItens2'
    OnCalcFields = cdsItens2CalcFields
    Left = 947
    Top = 304
    object cdsItens2REFPRO: TStringField
      FieldName = 'REFPRO'
      Size = 18
    end
    object cdsItens2PRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 200
    end
    object cdsItens2REFCOR: TStringField
      FieldName = 'REFCOR'
      Size = 10
    end
    object cdsItens2COR: TStringField
      FieldName = 'COR'
      Size = 101
    end
    object cdsItens2SALDO_RN: TLargeintField
      FieldName = 'SALDO_RN'
      DisplayFormat = '0'
    end
    object cdsItens2SALDO_P: TLargeintField
      FieldName = 'SALDO_P'
      DisplayFormat = '0'
    end
    object cdsItens2SALDO_M: TLargeintField
      FieldName = 'SALDO_M'
      DisplayFormat = '0'
    end
    object cdsItens2SALDO_G: TLargeintField
      FieldName = 'SALDO_G'
      DisplayFormat = '0'
    end
    object cdsItens2SALDO_1: TLargeintField
      FieldName = 'SALDO_1'
      DisplayFormat = '0'
    end
    object cdsItens2SALDO_2: TLargeintField
      FieldName = 'SALDO_2'
      DisplayFormat = '0'
    end
    object cdsItens2SALDO_3: TLargeintField
      FieldName = 'SALDO_3'
      DisplayFormat = '0'
    end
    object cdsItens2SALDO_4: TLargeintField
      FieldName = 'SALDO_4'
      DisplayFormat = '0'
    end
    object cdsItens2SALDO_6: TLargeintField
      FieldName = 'SALDO_6'
      DisplayFormat = '0'
    end
    object cdsItens2SALDO_8: TLargeintField
      FieldName = 'SALDO_8'
      DisplayFormat = '0'
    end
    object cdsItens2SALDO_10: TLargeintField
      FieldName = 'SALDO_10'
      ReadOnly = True
    end
    object cdsItens2SALDO_12: TLargeintField
      FieldName = 'SALDO_12'
      ReadOnly = True
    end
    object cdsItens2SALDO_14: TLargeintField
      FieldName = 'SALDO_14'
      ReadOnly = True
    end
    object cdsItens2SALDO_UNICA: TLargeintField
      FieldName = 'SALDO_UNICA'
      DisplayFormat = '0'
    end
    object cdsItens2TOT_RN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_RN'
      DisplayFormat = '0'
      Calculated = True
    end
    object cdsItens2TOT_P: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_P'
      DisplayFormat = '0'
      Calculated = True
    end
    object cdsItens2TOT_M: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_M'
      DisplayFormat = '0'
      Calculated = True
    end
    object cdsItens2TOT_G: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_G'
      DisplayFormat = '0'
      Calculated = True
    end
    object cdsItens2TOT_1: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_1'
      DisplayFormat = '0'
      Calculated = True
    end
    object cdsItens2TOT_2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_2'
      DisplayFormat = '0'
      Calculated = True
    end
    object cdsItens2TOT_3: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_3'
      DisplayFormat = '0'
      Calculated = True
    end
    object cdsItens2TOT_4: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_4'
      DisplayFormat = '0'
      Calculated = True
    end
    object cdsItens2TOT_6: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_6'
      DisplayFormat = '0'
      Calculated = True
    end
    object cdsItens2TOT_8: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_8'
      DisplayFormat = '0'
      Calculated = True
    end
    object cdsItens2TOT_12: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_12'
      DisplayFormat = '0'
      Calculated = True
    end
    object cdsItens2TOT_14: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_14'
      DisplayFormat = '0'
      Calculated = True
    end
    object cdsItens2TOT_10: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_10'
      DisplayFormat = '0'
      Calculated = True
    end
    object cdsItens2TOT_UNICA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_UNICA'
      DisplayFormat = '0'
      Calculated = True
    end
  end
  object cdsCores: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = cdsCoresAfterPost
    Left = 367
    Top = 252
    object cdsCoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsCoresREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
  end
  object dsCores: TDataSource
    DataSet = cdsCores
    Left = 407
    Top = 252
  end
  object qryItens2: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select pro.referencia REFPRO, pro.descricao produto, cor.referen' +
        'cia refcor,'
      
        'iif(cor.desc_producao <> '#39#39',(cor.desc_producao || '#39' '#39' || cor.cor' +
        '),max(cor.descricao)) cor,'
      
        '(sum(i.qtd_rn - iif(not ci.qtd_rn is null,ci.qtd_rn,0))- MAX(er.' +
        'q_rn)) saldo_rn,'
      
        '(sum(i.qtd_p - iif(not ci.qtd_p is null,ci.qtd_p,0))- MAX(er.q_p' +
        ')) saldo_p,'
      
        '(sum(i.qtd_m - iif(not ci.qtd_m is null,ci.qtd_m,0))- MAX(er.q_m' +
        ')) saldo_m,'
      
        '(sum(i.qtd_g - iif(not ci.qtd_g is null,ci.qtd_g,0))- MAX(er.q_g' +
        ')) saldo_g,'
      
        '(sum(i.qtd_1 - iif(not ci.qtd_1 is null,ci.qtd_1,0))- MAX(er.q_1' +
        ')) saldo_1,'
      
        '(sum(i.qtd_2 - iif(not ci.qtd_2 is null,ci.qtd_2,0))- MAX(er.q_2' +
        ')) saldo_2,'
      
        '(sum(i.qtd_3 - iif(not ci.qtd_3 is null,ci.qtd_3,0))- MAX(er.q_3' +
        ')) saldo_3,'
      
        '(sum(i.qtd_4 - iif(not ci.qtd_4 is null,ci.qtd_4,0))- MAX(er.q_4' +
        ')) saldo_4,'
      
        '(sum(i.qtd_6 - iif(not ci.qtd_6 is null,ci.qtd_6,0))- MAX(er.q_6' +
        ')) saldo_6,'
      
        '(sum(i.qtd_8 - iif(not ci.qtd_8 is null,ci.qtd_8,0))- MAX(er.q_8' +
        ')) saldo_8,'
      
        '(sum(i.qtd_10 - iif(not ci.qtd_10 is null,ci.qtd_10,0))- MAX(er.' +
        'q_10)) saldo_10,'
      
        '(sum(i.qtd_12 - iif(not ci.qtd_12 is null,ci.qtd_12,0))- MAX(er.' +
        'q_12)) saldo_12,'
      
        '(sum(i.qtd_14 - iif(not ci.qtd_14 is null,ci.qtd_14,0))- MAX(er.' +
        'q_14)) saldo_14,'
      
        '(sum(trunc(i.qtd_unica - iif(not ci.qtd_unica is null,ci.qtd_uni' +
        'ca,0)))- MAX(er.q_unica)) saldo_unica   from itens i'
      ''
      'left join conferencia_itens  ci  on ci.codigo_item = i.codigo'
      
        'left join conferencia_pedido cp  on (cp.codigo = ci.codigo_confe' +
        'rencia)'
      'left join produtos           pro on pro.codigo = i.cod_produto'
      'left join cores              cor on cor.codigo = i.cod_cor'
      'left join pedidos            ped on ped.codigo = i.cod_pedido'
      
        'LEFT JOIN pedidos_faturados  PF  ON PF.CODIGO_PEDIDO = Ped.CODIG' +
        'O'
      
        'left join ESTOQUE_POR_REFERENCIA(i.cod_produto, i.cod_cor, cor.c' +
        'or_pai) ER on (1=1)'
      
        'where ((CP.fim is null ) or NOT (CP.fim > '#39'01.01.2013'#39')) and not' +
        '(ped.cancelado = '#39'S'#39')'
      
        'and i.cod_pedido in     ( 107)  and iif((not (PF.codigo is null)' +
        ' or (Ped.despachado = '#39'S'#39')), '#39'SIM'#39', '#39'N'#195'O'#39') = '#39'N'#195'O'#39
      
        'group by pro.referencia, pro.descricao, cor.referencia, cor.desc' +
        'ricao,cor.desc_producao,cor.cor'
      
        ' having ((sum(i.qtd_rn - iif(not ci.qtd_rn is null,ci.qtd_rn,0))' +
        ' +'
      ' sum(i.qtd_p - iif(not ci.qtd_p is null,ci.qtd_p,0)) +'
      ' sum(i.qtd_m - iif(not ci.qtd_m is null,ci.qtd_m,0)) +'
      ' sum(i.qtd_g - iif(not ci.qtd_g is null,ci.qtd_g,0)) +'
      ' sum(i.qtd_1 - iif(not ci.qtd_1 is null,ci.qtd_1,0)) +'
      ' sum(i.qtd_2 - iif(not ci.qtd_2 is null,ci.qtd_2,0)) +'
      ' sum(i.qtd_3 - iif(not ci.qtd_3 is null,ci.qtd_3,0)) +'
      ' sum(i.qtd_4 - iif(not ci.qtd_4 is null,ci.qtd_4,0)) +'
      ' sum(i.qtd_6 - iif(not ci.qtd_6 is null,ci.qtd_6,0)) +'
      ' sum(i.qtd_8 - iif(not ci.qtd_8 is null,ci.qtd_8,0)) +'
      ' sum(i.qtd_10 - iif(not ci.qtd_10 is null,ci.qtd_10 ,0)) +'
      ' sum(i.qtd_12 - iif(not ci.qtd_12 is null,ci.qtd_12 ,0)) +'
      ' sum(i.qtd_14 - iif(not ci.qtd_14 is null,ci.qtd_14 ,0)) +'
      
        ' sum(trunc(i.qtd_unica - iif(not ci.qtd_unica is null,ci.qtd_uni' +
        'ca,0)))) > 0)'
      ' order by refpro, cor'
      '')
    Left = 864
    Top = 304
  end
  object qryItens: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select p.referencia Ref_produto,c.referencia Ref_cor, sum(i.qtd_' +
        'rn) qtd_rn, sum(i.qtd_p) qtd_p, sum(i.qtd_m) qtd_m,      '
      
        'sum(i.qtd_g) qtd_g, sum(i.qtd_1) qtd_1, sum(i.qtd_2) qtd_2, sum(' +
        'i.qtd_3) qtd_3, sum(i.qtd_4) qtd_4, sum(i.qtd_6) qtd_6,  '
      
        'sum(i.qtd_8) qtd_8, sum(i.qtd_10) qtd_10, sum(i.qtd_12) qtd_12, ' +
        'sum(i.qtd_14) qtd_14 , sum(i.qtd_unica) qtd_unica, sum(i.qtd_tot' +
        'al) qtd_total, sum( (p.qtd_pecas * i.qtd_total) ) pecas,    '
      
        'iif(c.desc_producao <> '#39#39',(c.desc_producao || '#39#39' || c.cor),max(c' +
        '.descricao)) cor, max(p.descricao) produto,         '
      
        'max(ped.numpedido) pedido                                 from i' +
        'tens i       '
      
        'left join produtos p           on ( p.codigo   = i.cod_produto )' +
        '  '
      
        'left join cores c              on ( c.codigo   = i.cod_cor     )' +
        '  '
      
        'left join pedidos ped          on ( ped.codigo = i.cod_pedido  )' +
        '  '
      
        'left join pedidos_faturados pf on (pf.codigo_pedido = ped.codigo' +
        ') '
      '                                            '
      
        'group by p.referencia, c.desc_producao, c.referencia, c.cor, pf.' +
        'codigo'
      '')
    Left = 792
    Top = 32
    object qryItensREF_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REF_PRODUTO'
      Origin = 'REF_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object qryItensREF_COR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REF_COR'
      Origin = 'REF_COR'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTD_RN: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_RN'
      Origin = 'QTD_RN'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryItensQTD_P: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_P'
      Origin = 'QTD_P'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryItensQTD_M: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_M'
      Origin = 'QTD_M'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryItensQTD_G: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_G'
      Origin = 'QTD_G'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryItensQTD_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_1'
      Origin = 'QTD_1'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryItensQTD_2: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_2'
      Origin = 'QTD_2'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryItensQTD_3: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_3'
      Origin = 'QTD_3'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryItensQTD_4: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_4'
      Origin = 'QTD_4'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryItensQTD_6: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_6'
      Origin = 'QTD_6'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryItensQTD_8: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_8'
      Origin = 'QTD_8'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryItensQTD_10: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_10'
      Origin = 'QTD_10'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTD_12: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_12'
      Origin = 'QTD_12'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTD_14: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_14'
      Origin = 'QTD_14'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTD_UNICA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_UNICA'
      Origin = 'QTD_UNICA'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0'
      Precision = 18
      Size = 2
    end
    object qryItensQTD_TOTAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_TOTAL'
      Origin = 'QTD_TOTAL'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0'
      Precision = 18
      Size = 2
    end
    object qryItensPECAS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PECAS'
      Origin = 'PECAS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0'
      Precision = 18
      Size = 2
    end
    object qryItensCOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COR'
      Origin = 'COR'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryItensPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object qryItensPEDIDO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      ProviderFlags = []
      ReadOnly = True
      Size = 22
    end
  end
end
