object frmRelatorioExpedicao: TfrmRelatorioExpedicao
  Left = 268
  Top = 228
  Caption = 'frmRelatorioExpedicao'
  ClientHeight = 517
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
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
    Borders.FixedLeft = True
    Borders.FixedTop = True
    Borders.FixedRight = True
    Borders.FixedBottom = True
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 20
      Top = 39
      Width = 754
      Height = 99
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel13: TRLLabel
        Left = -3
        Top = 59
        Width = 760
        Height = 16
        Caption = 
          '________________________________________________________________' +
          '____________________________________________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5592405
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rlbCancelado: TRLLabel
        Left = 200
        Top = 30
        Width = 348
        Height = 38
        Caption = 'PEDIDO CANCELADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 234
        Font.Height = -33
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblTitulo: TRLLabel
        Left = 318
        Top = 2
        Width = 118
        Height = 22
        Caption = 'EXPEDI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 72
        Top = 34
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
      object RLLabel3: TRLLabel
        Left = 236
        Top = 79
        Width = 63
        Height = 15
        Caption = 'ENTREGA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblaprovado: TRLLabel
        Left = 496
        Top = 79
        Width = 70
        Height = 14
        Caption = 'APROV. POR '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblperiodo: TRLLabel
        Left = 303
        Top = 79
        Width = 63
        Height = 15
        Caption = 'ENTREGA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLImage1: TRLImage
        Left = 1
        Top = 3
        Width = 67
        Height = 59
      end
      object lblDtRepres: TRLLabel
        Left = 479
        Top = 56
        Width = 41
        Height = 15
        Caption = 'pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 390
        Top = 56
        Width = 88
        Height = 15
        Caption = 'Representante:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblDtCad: TRLLabel
        Left = 655
        Top = 56
        Width = 54
        Height = 15
        Caption = 'Cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel14: TRLLabel
        Left = 562
        Top = 56
        Width = 92
        Height = 15
        Caption = 'Cadastramento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 616
        Top = 6
        Width = 87
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 704
        Top = 6
        Width = 8
        Height = 16
        Caption = '/'
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 714
        Top = 6
        Width = 112
        Height = 16
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel31: TRLLabel
        Left = 637
        Top = 6
        Width = 35
        Height = 16
        Caption = 'P'#225'g.:'
      end
      object RLLabel19: TRLLabel
        Left = 565
        Top = 28
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
        Left = 637
        Top = 27
        Width = 37
        Height = 16
        Info = itNow
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 20
      Top = 138
      Width = 754
      Height = 54
      AutoSize = True
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel5: TRLLabel
        Left = 3
        Top = 6
        Width = 60
        Height = 15
        Caption = 'Pedido N'#186' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 3
        Top = 22
        Width = 45
        Height = 15
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 3
        Top = 38
        Width = 90
        Height = 15
        Caption = 'Representante:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCidade: TRLLabel
        Left = 517
        Top = 22
        Width = 79
        Height = 15
        Alignment = taRightJustify
        Caption = 'cidade cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object RLLabel9: TRLLabel
        Left = 611
        Top = 14
        Width = 137
        Height = 15
        Caption = 'Recebimento do Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCliente: TRLLabel
        Left = 50
        Top = 22
        Width = 39
        Height = 15
        Caption = 'cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblRepresentante: TRLLabel
        Left = 97
        Top = 38
        Width = 85
        Height = 15
        Caption = 'Representante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblpedido: TRLLabel
        Left = 67
        Top = 6
        Width = 41
        Height = 15
        Caption = 'pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblrecebimento: TRLLabel
        Left = 637
        Top = 32
        Width = 85
        Height = 15
        Caption = 'dt recebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel16: TRLLabel
        Left = 219
        Top = 6
        Width = 104
        Height = 15
        Caption = 'CNPJ/CPF Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCnpj: TRLLabel
        Left = 326
        Top = 6
        Width = 26
        Height = 15
        Caption = 'cnpj'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 20
      Top = 251
      Width = 754
      Height = 84
      DataFields = 'COD_PRODUTO'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 754
        Height = 24
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.FixedTop = True
        Borders.FixedBottom = True
        object RLDBText1: TRLDBText
          Left = 3
          Top = 6
          Width = 57
          Height = 15
          DataField = 'REFPROD'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLDBText16: TRLDBText
          Left = 70
          Top = 5
          Width = 68
          Height = 16
          DataField = 'PRODUTO'
          DataSource = DataSource2
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
      object RLBand5: TRLBand
        Left = 0
        Top = 24
        Width = 754
        Height = 24
        BeforePrint = RLBand5BeforePrint
        object RLDraw15: TRLDraw
          Left = 602
          Top = -7
          Width = 28
          Height = 31
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw6: TRLDraw
          Left = 546
          Top = -7
          Width = 28
          Height = 31
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw5: TRLDraw
          Left = 488
          Top = -7
          Width = 28
          Height = 31
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw4: TRLDraw
          Left = 435
          Top = -7
          Width = 28
          Height = 31
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw3: TRLDraw
          Left = 378
          Top = -7
          Width = 28
          Height = 31
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw2: TRLDraw
          Left = 321
          Top = -7
          Width = 28
          Height = 31
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw1: TRLDraw
          Left = 260
          Top = -7
          Width = 28
          Height = 31
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDBText2: TRLDBText
          Left = 1
          Top = 3
          Width = 45
          Height = 15
          DataField = 'REFCOR'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 282
          Top = 3
          Width = 46
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_P'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 311
          Top = 3
          Width = 48
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_M'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 342
          Top = 3
          Width = 48
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_G'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 372
          Top = 3
          Width = 44
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_1'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 398
          Top = 3
          Width = 44
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_2'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText9: TRLDBText
          Left = 427
          Top = 3
          Width = 44
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_3'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText10: TRLDBText
          Left = 454
          Top = 3
          Width = 44
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_4'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText11: TRLDBText
          Left = 480
          Top = 3
          Width = 44
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_6'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText12: TRLDBText
          Left = 507
          Top = 3
          Width = 44
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_8'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText13: TRLDBText
          Left = 614
          Top = 3
          Width = 76
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_UNICA'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText14: TRLDBText
          Left = 656
          Top = 3
          Width = 78
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_TOTAL'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText15: TRLDBText
          Left = 702
          Top = 3
          Width = 50
          Height = 16
          Alignment = taRightJustify
          DataField = 'PECAS'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText17: TRLDBText
          Left = 52
          Top = 3
          Width = 204
          Height = 15
          AutoSize = False
          DataField = 'COR'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 246
          Top = 3
          Width = 56
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_RN'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText18: TRLDBText
          Left = 534
          Top = 3
          Width = 52
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_10'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText19: TRLDBText
          Left = 563
          Top = 3
          Width = 52
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_12'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText20: TRLDBText
          Left = 592
          Top = 3
          Width = 52
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_14'
          DataSource = DataSource2
          Text = ''
        end
      end
      object RLBand8: TRLBand
        Left = 0
        Top = 48
        Width = 754
        Height = 24
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.FixedTop = True
        object RLDBResult3: TRLDBResult
          Left = 592
          Top = 3
          Width = 116
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_TOTAL'
          DataSource = DataSource2
          Info = riSum
          Text = ''
        end
        object RLDBResult4: TRLDBResult
          Left = 678
          Top = 4
          Width = 88
          Height = 16
          Alignment = taCenter
          DataField = 'PECAS'
          DataSource = DataSource2
          Info = riSum
          Text = ''
        end
      end
    end
    object RLBand4: TRLBand
      Left = 20
      Top = 227
      Width = 754
      Height = 24
      BandType = btColumnHeader
      object RLDraw14: TRLDraw
        Left = 602
        Top = -7
        Width = 28
        Height = 31
        Brush.Style = bsClear
        Color = 15132390
        ParentColor = False
        Pen.Color = 12895428
        Pen.Style = psClear
        Transparent = False
      end
      object RLLabel11: TRLLabel
        Left = 681
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
        Left = 713
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
        Left = 260
        Top = -7
        Width = 28
        Height = 31
        Brush.Style = bsClear
        Color = 15132390
        ParentColor = False
        Pen.Color = 12895428
        Pen.Style = psClear
        Transparent = False
      end
      object RLDraw8: TRLDraw
        Left = 321
        Top = -7
        Width = 28
        Height = 31
        Brush.Style = bsClear
        Color = 15132390
        ParentColor = False
        Pen.Color = 12895428
        Pen.Style = psClear
        Transparent = False
      end
      object RLDraw9: TRLDraw
        Left = 378
        Top = -7
        Width = 28
        Height = 31
        Brush.Style = bsClear
        Color = 15132390
        ParentColor = False
        Pen.Color = 12895428
        Pen.Style = psClear
        Transparent = False
      end
      object RLDraw10: TRLDraw
        Left = 435
        Top = -7
        Width = 28
        Height = 31
        Brush.Style = bsClear
        Color = 15132390
        ParentColor = False
        Pen.Color = 12895428
        Pen.Style = psClear
        Transparent = False
      end
      object RLDraw11: TRLDraw
        Left = 488
        Top = -7
        Width = 28
        Height = 31
        Brush.Style = bsClear
        Color = 15132390
        ParentColor = False
        Pen.Color = 12895428
        Pen.Style = psClear
        Transparent = False
      end
      object RLDraw12: TRLDraw
        Left = 546
        Top = -7
        Width = 28
        Height = 31
        Brush.Style = bsClear
        Color = 15132390
        ParentColor = False
        Pen.Color = 12895428
        Pen.Style = psClear
        Transparent = False
      end
      object RLLabel10: TRLLabel
        Left = 264
        Top = 5
        Width = 405
        Height = 14
        Caption = 
          'RN       P       M       G       1       2       3       4      ' +
          ' 6        8      10      12      14    UNICA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand6: TRLBand
      Left = 20
      Top = 390
      Width = 754
      Height = 43
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.FixedTop = True
      Degrade.OppositeColor = 10724259
    end
    object RLBand7: TRLBand
      Left = 20
      Top = 335
      Width = 754
      Height = 55
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.FixedTop = True
      object RLDraw13: TRLDraw
        Left = 464
        Top = 1
        Width = 289
        Height = 24
        Brush.Style = bsClear
        Color = 15132390
        ParentColor = False
        Pen.Color = 12895428
        Pen.Style = psClear
        Transparent = False
      end
      object RLDBResult1: TRLDBResult
        Left = 592
        Top = 3
        Width = 116
        Height = 16
        Alignment = taCenter
        DataField = 'QTD_TOTAL'
        DataSource = DataSource2
        Info = riSum
        Text = ''
      end
      object RLDBResult2: TRLDBResult
        Left = 678
        Top = 4
        Width = 88
        Height = 16
        Alignment = taCenter
        DataField = 'PECAS'
        DataSource = DataSource2
        Info = riSum
        Text = ''
      end
      object RLLabel15: TRLLabel
        Left = 478
        Top = 5
        Width = 90
        Height = 14
        Alignment = taCenter
        Caption = 'Total Geral > > >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand9: TRLBand
      Left = 20
      Top = 192
      Width = 754
      Height = 35
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel4: TRLLabel
        Left = 3
        Top = 2
        Width = 143
        Height = 15
        Caption = 'Observa'#231#245'es adicionais:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLMemo1: TRLMemo
        Left = 4
        Top = 18
        Width = 741
        Height = 15
        Behavior = [beSiteExpander]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BeforePrint = RLMemo1BeforePrint
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = qryPedido
    Left = 88
  end
  object DataSource2: TDataSource
    DataSet = qryItens
    Left = 304
  end
  object qryPedido: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select p.*, c.razao cliente, c.cpf_cnpj, r.razao representante, ' +
        'cid.nome cidade, est.sigla UF from pedidos p'
      'left join pessoas c on c.codigo = p.cod_cliente'
      'left join pessoas r on r.codigo = p.cod_repres'
      'left join enderecos e on e.codpessoa = c.codigo'
      'left join cidades cid on cid.codibge = e.codcidade'
      'left join estados est on est.codigo = cid.codest'
      'where p.codigo = :codped')
    Left = 16
    ParamData = <
      item
        Name = 'CODPED'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryPedidoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidoNUMPEDIDO: TStringField
      FieldName = 'NUMPEDIDO'
      Origin = 'NUMPEDIDO'
      Size = 22
    end
    object qryPedidoCOD_TAB_PRECO: TIntegerField
      FieldName = 'COD_TAB_PRECO'
      Origin = 'COD_TAB_PRECO'
    end
    object qryPedidoCOD_FORMA_PAG: TIntegerField
      FieldName = 'COD_FORMA_PAG'
      Origin = 'COD_FORMA_PAG'
    end
    object qryPedidoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Origin = 'COD_FILIAL'
    end
    object qryPedidoCOD_FILIAL_DIGI: TIntegerField
      FieldName = 'COD_FILIAL_DIGI'
      Origin = 'COD_FILIAL_DIGI'
    end
    object qryPedidoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'COD_CLIENTE'
    end
    object qryPedidoCOD_TRANSP: TIntegerField
      FieldName = 'COD_TRANSP'
      Origin = 'COD_TRANSP'
    end
    object qryPedidoCOD_REPRES: TIntegerField
      FieldName = 'COD_REPRES'
      Origin = 'COD_REPRES'
    end
    object qryPedidoDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object qryPedidoDT_REPRESENTANTE: TDateField
      FieldName = 'DT_REPRESENTANTE'
      Origin = 'DT_REPRESENTANTE'
    end
    object qryPedidoDT_RECEBIMENTO: TDateField
      FieldName = 'DT_RECEBIMENTO'
      Origin = 'DT_RECEBIMENTO'
    end
    object qryPedidoDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryPedidoACRESCIMO: TBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryPedidoCOMISSAO: TBCDField
      FieldName = 'COMISSAO'
      Origin = 'COMISSAO'
      Precision = 18
      Size = 2
    end
    object qryPedidoVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryPedidoAPROVACAO: TStringField
      FieldName = 'APROVACAO'
      Origin = 'APROVACAO'
      FixedChar = True
      Size = 1
    end
    object qryPedidoAPROVADO_POR: TStringField
      FieldName = 'APROVADO_POR'
      Origin = 'APROVADO_POR'
      Size = 40
    end
    object qryPedidoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 500
    end
    object qryPedidoTIPO_FRETE: TIntegerField
      FieldName = 'TIPO_FRETE'
      Origin = 'TIPO_FRETE'
    end
    object qryPedidoDT_ENTREGA: TDateField
      FieldName = 'DT_ENTREGA'
      Origin = 'DT_ENTREGA'
    end
    object qryPedidoDT_LIMITE_ENTREGA: TDateField
      FieldName = 'DT_LIMITE_ENTREGA'
      Origin = 'DT_LIMITE_ENTREGA'
    end
    object qryPedidoDT_APROVACAO: TDateField
      FieldName = 'DT_APROVACAO'
      Origin = 'DT_APROVACAO'
    end
    object qryPedidoDESCONTO_FPGTO: TBCDField
      FieldName = 'DESCONTO_FPGTO'
      Origin = 'DESCONTO_FPGTO'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryPedidoDESPACHADO: TStringField
      FieldName = 'DESPACHADO'
      Origin = 'DESPACHADO'
      FixedChar = True
      Size = 1
    end
    object qryPedidoDT_DESPACHO: TDateField
      FieldName = 'DT_DESPACHO'
      Origin = 'DT_DESPACHO'
    end
    object qryPedidoDESCONTO_ITENS: TBCDField
      FieldName = 'DESCONTO_ITENS'
      Origin = 'DESCONTO_ITENS'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryPedidoCOD_PEDIDO_MATRIZ: TIntegerField
      FieldName = 'COD_PEDIDO_MATRIZ'
      Origin = 'COD_PEDIDO_MATRIZ'
    end
    object qryPedidoDESCONTO_COMISS: TBCDField
      FieldName = 'DESCONTO_COMISS'
      Origin = 'DESCONTO_COMISS'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryPedidoCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Origin = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qryPedidoCLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLIENTE'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryPedidoCPF_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object qryPedidoREPRESENTANTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REPRESENTANTE'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryPedidoCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 72
    end
    object qryPedidoUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'SIGLA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
  end
  object qryItens: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select i.*, (p.qtd_pecas * i.qtd_total) pecas, p.descricao || ii' +
        'f(p.ativo = '#39'S'#39', '#39#39', '#39' - Eliminado'#39') produto, '
      'c.referencia refcor,  p.referencia refprod,'
      
        'iif(c.cor <> '#39#39', c.desc_producao || '#39' '#39' || c.cor, c.descricao) c' +
        'or   from itens i'
      'left join produtos p on p.codigo = i.cod_produto'
      'left join cores c on c.codigo = i.cod_cor'
      'where i.cod_pedido = :codped'
      'order by i.cod_produto')
    Left = 232
    ParamData = <
      item
        Name = 'CODPED'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItensCOD_PEDIDO: TIntegerField
      FieldName = 'COD_PEDIDO'
      Origin = 'COD_PEDIDO'
    end
    object qryItensCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
    end
    object qryItensCOD_COR: TIntegerField
      FieldName = 'COD_COR'
      Origin = 'COD_COR'
    end
    object qryItensPRECO: TBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryItensDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryItensVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryItensQTD_RN: TIntegerField
      FieldName = 'QTD_RN'
      Origin = 'QTD_RN'
      DisplayFormat = '0'
    end
    object qryItensQTD_P: TIntegerField
      FieldName = 'QTD_P'
      Origin = 'QTD_P'
      DisplayFormat = '0'
    end
    object qryItensQTD_M: TIntegerField
      FieldName = 'QTD_M'
      Origin = 'QTD_M'
      DisplayFormat = '0'
    end
    object qryItensQTD_G: TIntegerField
      FieldName = 'QTD_G'
      Origin = 'QTD_G'
      DisplayFormat = '0'
    end
    object qryItensQTD_1: TIntegerField
      FieldName = 'QTD_1'
      Origin = 'QTD_1'
      DisplayFormat = '0'
    end
    object qryItensQTD_2: TIntegerField
      FieldName = 'QTD_2'
      Origin = 'QTD_2'
      DisplayFormat = '0'
    end
    object qryItensQTD_3: TIntegerField
      FieldName = 'QTD_3'
      Origin = 'QTD_3'
      DisplayFormat = '0'
    end
    object qryItensQTD_4: TIntegerField
      FieldName = 'QTD_4'
      Origin = 'QTD_4'
      DisplayFormat = '0'
    end
    object qryItensQTD_6: TIntegerField
      FieldName = 'QTD_6'
      Origin = 'QTD_6'
      DisplayFormat = '0'
    end
    object qryItensQTD_8: TIntegerField
      FieldName = 'QTD_8'
      Origin = 'QTD_8'
      DisplayFormat = '0'
    end
    object qryItensQTD_10: TIntegerField
      FieldName = 'QTD_10'
      Origin = 'QTD_10'
    end
    object qryItensQTD_12: TIntegerField
      FieldName = 'QTD_12'
      Origin = 'QTD_12'
    end
    object qryItensQTD_14: TIntegerField
      FieldName = 'QTD_14'
      Origin = 'QTD_14'
    end
    object qryItensQTD_UNICA: TBCDField
      FieldName = 'QTD_UNICA'
      Origin = 'QTD_UNICA'
      DisplayFormat = '0'
      Precision = 18
      Size = 2
    end
    object qryItensQTD_TOTAL: TBCDField
      FieldName = 'QTD_TOTAL'
      Origin = 'QTD_TOTAL'
      DisplayFormat = '0'
      Precision = 18
      Size = 2
    end
    object qryItensOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 200
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
    object qryItensPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 212
    end
    object qryItensREFCOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFCOR'
      Origin = 'REFERENCIA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensREFPROD: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFPROD'
      Origin = 'REFERENCIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object qryItensCOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COR'
      Origin = 'COR'
      ProviderFlags = []
      ReadOnly = True
      Size = 101
    end
  end
end
