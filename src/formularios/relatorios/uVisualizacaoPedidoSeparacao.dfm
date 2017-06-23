object frmVisualizacaoPedidoSeparacao: TfrmVisualizacaoPedidoSeparacao
  Left = 233
  Top = 171
  Caption = 'frmVisualizacaoPedidoSeparacao'
  ClientHeight = 649
  ClientWidth = 963
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
    Left = 80
    Top = 18
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
    DataSource = dsItens
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 20
      Top = 39
      Width = 754
      Height = 98
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel13: TRLLabel
        Left = -3
        Top = 58
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
      object lblTitulo: TRLLabel
        Left = 238
        Top = 2
        Width = 261
        Height = 22
        Caption = 'PEDIDO PARA SEPARA'#199#195'O'
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
        Top = 78
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
        Top = 78
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
        Top = 78
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
        Top = 55
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
        Top = 55
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
        Top = 55
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
        Top = 55
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
        Left = 636
        Top = 27
        Width = 37
        Height = 16
        Info = itNow
        Text = ''
      end
      object rlbCancelado: TRLLabel
        Left = 200
        Top = 23
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
    end
    object RLBand2: TRLBand
      Left = 20
      Top = 137
      Width = 754
      Height = 57
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
        Width = 93
        Height = 15
        Caption = 'Representante :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCidade: TRLLabel
        Left = 331
        Top = 22
        Width = 79
        Height = 15
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
        Left = 52
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
        Left = 99
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
    end
    object RLBand4: TRLBand
      Left = 20
      Top = 194
      Width = 754
      Height = 24
      BandType = btColumnHeader
      object RLDraw13: TRLDraw
        Left = 589
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
      object RLDraw7: TRLDraw
        Left = 252
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
        Left = 313
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
        Left = 370
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
        Left = 427
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
        Left = 481
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
        Left = 535
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
        Left = 256
        Top = 5
        Width = 399
        Height = 14
        Caption = 
          'RN       P       M       G       1       2        3       4     ' +
          '  6       8      10     12      14   UNICA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 661
        Top = 4
        Width = 90
        Height = 15
        Caption = 'Est. suficiente?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 20
      Top = 218
      Width = 754
      Height = 71
      DataFields = 'CodPro'
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
          Width = 42
          Height = 15
          DataField = 'RefPro'
          DataSource = dsItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLDBText16: TRLDBText
          Left = 54
          Top = 5
          Width = 54
          Height = 16
          DataField = 'Produto'
          DataSource = dsItens
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
        object RLDraw14: TRLDraw
          Left = 590
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
          Left = 252
          Top = -5
          Width = 28
          Height = 31
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDBText3: TRLDBText
          Left = 230
          Top = 3
          Width = 72
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_RN_O'
          DataSource = dsItens
          Text = ''
        end
        object RLDraw6: TRLDraw
          Left = 538
          Top = -5
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
          Left = 480
          Top = -5
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
          Left = 427
          Top = -5
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
          Left = 370
          Top = -6
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
          Left = 313
          Top = -6
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
          Width = 38
          Height = 14
          DataField = 'RefCor'
          DataSource = dsItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 265
          Top = 3
          Width = 64
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_P_O'
          DataSource = dsItens
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 294
          Top = 3
          Width = 66
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_M_O'
          DataSource = dsItens
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 326
          Top = 3
          Width = 64
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_G_O'
          DataSource = dsItens
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 355
          Top = 3
          Width = 62
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_1_O'
          DataSource = dsItens
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 381
          Top = 3
          Width = 62
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_2_O'
          DataSource = dsItens
          Text = ''
        end
        object RLDBText9: TRLDBText
          Left = 410
          Top = 3
          Width = 62
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_3_O'
          DataSource = dsItens
          Text = ''
        end
        object RLDBText10: TRLDBText
          Left = 437
          Top = 3
          Width = 62
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_4_O'
          DataSource = dsItens
          Text = ''
        end
        object RLDBText11: TRLDBText
          Left = 463
          Top = 3
          Width = 62
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_6_O'
          DataSource = dsItens
          Text = ''
        end
        object RLDBText12: TRLDBText
          Left = 491
          Top = 3
          Width = 62
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_8_O'
          DataSource = dsItens
          Text = ''
        end
        object RLDBText13: TRLDBText
          Left = 590
          Top = 3
          Width = 94
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_UNICA_O'
          DataSource = dsItens
          Text = ''
        end
        object RLDBText17: TRLDBText
          Left = 51
          Top = 3
          Width = 190
          Height = 15
          AutoSize = False
          DataField = 'Cor'
          DataSource = dsItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText14: TRLDBText
          Left = 714
          Top = 3
          Width = 24
          Height = 16
          Alignment = taCenter
          DataField = 'C_I'
          DataSource = dsItens
          Text = ''
          BeforePrint = RLDBText14BeforePrint
        end
        object lbindica: TRLLabel
          Left = 663
          Top = 3
          Width = 33
          Height = 14
          Caption = '<------------------'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Britannic Bold'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText15: TRLDBText
          Left = 516
          Top = 3
          Width = 68
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_10_O'
          DataSource = dsItens
          Text = ''
        end
        object RLDBText18: TRLDBText
          Left = 544
          Top = 3
          Width = 68
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_12_O'
          DataSource = dsItens
          Text = ''
        end
        object RLDBText19: TRLDBText
          Left = 571
          Top = 3
          Width = 68
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_14_O'
          DataSource = dsItens
          Text = ''
        end
      end
    end
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 17
    Top = 130
    object cdsItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsItensProduto: TStringField
      DisplayWidth = 60
      FieldName = 'Produto'
      Size = 60
    end
    object cdsItensCodPro: TIntegerField
      FieldName = 'CodPro'
      KeyFields = 'CodPro'
    end
    object cdsItensCor: TStringField
      DisplayWidth = 40
      FieldName = 'Cor'
      Size = 40
    end
    object cdsItensCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object cdsItensRefPro: TStringField
      Alignment = taCenter
      DisplayWidth = 30
      FieldName = 'RefPro'
      Size = 30
    end
    object cdsItensQTD_RN: TIntegerField
      FieldName = 'QTD_RN'
    end
    object cdsItensQTD_P: TIntegerField
      FieldName = 'QTD_P'
    end
    object cdsItensQTD_M: TIntegerField
      FieldName = 'QTD_M'
    end
    object cdsItensQTD_G: TIntegerField
      FieldName = 'QTD_G'
    end
    object cdsItensQTD_1: TIntegerField
      FieldName = 'QTD_1'
    end
    object cdsItensQTD_2: TIntegerField
      FieldName = 'QTD_2'
    end
    object cdsItensQTD_3: TIntegerField
      FieldName = 'QTD_3'
    end
    object cdsItensQTD_4: TIntegerField
      FieldName = 'QTD_4'
    end
    object cdsItensQTD_6: TIntegerField
      FieldName = 'QTD_6'
    end
    object cdsItensQTD_8: TIntegerField
      FieldName = 'QTD_8'
    end
    object cdsItensQTD_10: TIntegerField
      FieldName = 'QTD_10'
    end
    object cdsItensQTD_12: TIntegerField
      FieldName = 'QTD_12'
    end
    object cdsItensQTD_14: TIntegerField
      FieldName = 'QTD_14'
    end
    object cdsItensQTD_UNICA: TIntegerField
      FieldName = 'QTD_UNICA'
    end
    object cdsItensQTD_RN_O: TIntegerField
      FieldName = 'QTD_RN_O'
    end
    object cdsItensQTD_P_O: TIntegerField
      FieldName = 'QTD_P_O'
    end
    object cdsItensQTD_M_O: TIntegerField
      FieldName = 'QTD_M_O'
    end
    object cdsItensQTD_G_O: TIntegerField
      FieldName = 'QTD_G_O'
    end
    object cdsItensQTD_1_O: TIntegerField
      FieldName = 'QTD_1_O'
    end
    object cdsItensQTD_2_O: TIntegerField
      FieldName = 'QTD_2_O'
    end
    object cdsItensQTD_3_O: TIntegerField
      FieldName = 'QTD_3_O'
    end
    object cdsItensQTD_4_O: TIntegerField
      FieldName = 'QTD_4_O'
    end
    object cdsItensQTD_6_O: TIntegerField
      FieldName = 'QTD_6_O'
    end
    object cdsItensQTD_8_O: TIntegerField
      FieldName = 'QTD_8_O'
    end
    object cdsItensQTD_10_O: TIntegerField
      FieldName = 'QTD_10_O'
    end
    object cdsItensQTD_12_O: TIntegerField
      FieldName = 'QTD_12_O'
    end
    object cdsItensQTD_14_O: TIntegerField
      FieldName = 'QTD_14_O'
    end
    object cdsItensQTD_UNICA_O: TBCDField
      FieldName = 'QTD_UNICA_O'
      Precision = 18
      Size = 2
    end
    object cdsItensCONFERIDO: TStringField
      FieldName = 'CONFERIDO'
      Size = 1
    end
    object cdsItensRefCor: TStringField
      FieldName = 'RefCor'
    end
    object cdsItensNUM_CAIXA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'NUM_CAIXA'
    end
    object cdsItensC_I: TStringField
      FieldName = 'C_I'
      Size = 1
    end
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 49
    Top = 130
  end
end
