object frmRelatorioPedidoVenda: TfrmRelatorioPedidoVenda
  Left = 182
  Top = 110
  Caption = 'frmRelatorioPedidoVenda'
  ClientHeight = 662
  ClientWidth = 949
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
    Left = 48
    Top = 82
    Width = 794
    Height = 1123
    Margins.LeftMargin = 2.000000000000000000
    Margins.RightMargin = 2.000000000000000000
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
    ExpressionParser = RLExpressionParser1
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 9
      Top = 39
      Width = 776
      Height = 63
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object rlbCancelado: TRLLabel
        Left = 208
        Top = 15
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
        Left = 85
        Top = 38
        Width = 98
        Height = 15
        Caption = 'Pedido de Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 83
        Top = 10
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
      object lblaprovado: TRLLabel
        Left = 567
        Top = 32
        Width = 67
        Height = 14
        Caption = 'Data e Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 637
        Top = 30
        Width = 37
        Height = 16
        Info = itNow
        Text = ''
      end
      object RLImage1: TRLImage
        Left = 12
        Top = 2
        Width = 67
        Height = 60
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 673
        Top = 6
        Width = 46
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Info = itPageNumber
        Text = ''
      end
      object RLLabel21: TRLLabel
        Left = 720
        Top = 6
        Width = 8
        Height = 16
        Caption = '/'
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 728
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
    end
    object RLBand2: TRLBand
      Left = 9
      Top = 102
      Width = 776
      Height = 109
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel8: TRLLabel
        Left = -3
        Top = 9
        Width = 787
        Height = 15
        Caption = 
          '________________________________________________________________' +
          '________________________________________________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7631988
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 6
        Top = 5
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
        Left = 6
        Top = 26
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
        Left = 462
        Top = 90
        Width = 81
        Height = 14
        Caption = 'Representante :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCidade: TRLLabel
        Left = 54
        Top = 58
        Width = 81
        Height = 14
        Caption = 'cidade cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object lblCliente: TRLLabel
        Left = 55
        Top = 26
        Width = 41
        Height = 14
        Caption = 'cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object lblRepres: TRLLabel
        Left = 544
        Top = 91
        Width = 73
        Height = 13
        Caption = 'Representante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object lblpedido: TRLLabel
        Left = 67
        Top = 5
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
      object RLLabel1: TRLLabel
        Left = 163
        Top = 5
        Width = 126
        Height = 15
        Caption = 'Cond. de Pagamento: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 603
        Top = 5
        Width = 55
        Height = 15
        Caption = 'Emiss'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 6
        Top = 42
        Width = 60
        Height = 15
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel13: TRLLabel
        Left = 6
        Top = 58
        Width = 45
        Height = 15
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel14: TRLLabel
        Left = 302
        Top = 58
        Width = 29
        Height = 15
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel15: TRLLabel
        Left = 462
        Top = 58
        Width = 33
        Height = 15
        Caption = 'Fone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel16: TRLLabel
        Left = 6
        Top = 74
        Width = 62
        Height = 15
        Caption = 'CPF/CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel17: TRLLabel
        Left = 235
        Top = 74
        Width = 22
        Height = 15
        Caption = 'I.E.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel18: TRLLabel
        Left = 6
        Top = 90
        Width = 30
        Height = 14
        Caption = 'Filial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel19: TRLLabel
        Left = 175
        Top = 90
        Width = 81
        Height = 14
        Caption = 'Transportadora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTransp: TRLLabel
        Left = 259
        Top = 91
        Width = 75
        Height = 13
        Caption = 'transportadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object lblFilial: TRLLabel
        Left = 38
        Top = 91
        Width = 23
        Height = 13
        Caption = 'filial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object lblEndereco: TRLLabel
        Left = 69
        Top = 42
        Width = 54
        Height = 14
        Caption = 'endereco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object lblCpfCnpj: TRLLabel
        Left = 71
        Top = 74
        Width = 19
        Height = 14
        Caption = 'cpf'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object lblIE: TRLLabel
        Left = 260
        Top = 74
        Width = 13
        Height = 15
        Caption = 'ie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblCep: TRLLabel
        Left = 334
        Top = 58
        Width = 22
        Height = 14
        Caption = 'cep'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object lblFone: TRLLabel
        Left = 498
        Top = 58
        Width = 28
        Height = 14
        Caption = 'fone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object lblFPag: TRLLabel
        Left = 291
        Top = 5
        Width = 57
        Height = 15
        Caption = 'formaPag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblDtEmis: TRLLabel
        Left = 660
        Top = 5
        Width = 42
        Height = 15
        Caption = 'dtEmis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 9
      Top = 235
      Width = 776
      Height = 83
      DataFields = 'GRUPO'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 776
        Height = 24
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.FixedTop = True
        Borders.FixedBottom = True
        object RLDBText16: TRLDBText
          Left = 47
          Top = 5
          Width = 47
          Height = 15
          DataField = 'GRUPO'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLLabel22: TRLLabel
          Left = 5
          Top = 5
          Width = 40
          Height = 15
          Caption = 'Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel10: TRLLabel
          Left = 319
          Top = 5
          Width = 315
          Height = 14
          Caption = 
            'RN       P       M       G       1       2       3       4      ' +
            ' 6       8     UNICA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 24
        Width = 776
        Height = 25
        BeforePrint = RLBand5BeforePrint
        object RLDBText19: TRLDBText
          Left = 679
          Top = 3
          Width = 44
          Height = 14
          Alignment = taCenter
          DataField = 'DESCONTO'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Visible = False
        end
        object RLDraw6: TRLDraw
          Left = 609
          Top = -5
          Width = 28
          Height = 31
          Brush.Style = bsClear
          Color = 14869218
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw5: TRLDraw
          Left = 547
          Top = -5
          Width = 28
          Height = 31
          Brush.Style = bsClear
          Color = 14869218
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw4: TRLDraw
          Left = 493
          Top = -5
          Width = 28
          Height = 31
          Brush.Style = bsClear
          Color = 14869218
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw3: TRLDraw
          Left = 438
          Top = -6
          Width = 28
          Height = 31
          Brush.Style = bsClear
          Color = 14869218
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw1: TRLDraw
          Left = 381
          Top = -6
          Width = 28
          Height = 31
          Brush.Style = bsClear
          Color = 14869218
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDBText2: TRLDBText
          Left = 5
          Top = 3
          Width = 37
          Height = 13
          DataField = 'REFPRO'
          DataSource = DataSource2
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 347
          Top = 3
          Width = 38
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_P'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 374
          Top = 3
          Width = 42
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_M'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 405
          Top = 3
          Width = 40
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_G'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 434
          Top = 3
          Width = 38
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_1'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 461
          Top = 3
          Width = 38
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_2'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText9: TRLDBText
          Left = 489
          Top = 3
          Width = 38
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_3'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText10: TRLDBText
          Left = 517
          Top = 3
          Width = 38
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_4'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText11: TRLDBText
          Left = 544
          Top = 3
          Width = 38
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_6'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText12: TRLDBText
          Left = 571
          Top = 3
          Width = 38
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_8'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText13: TRLDBText
          Left = 603
          Top = 3
          Width = 41
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_UNICA'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText14: TRLDBText
          Left = 641
          Top = 3
          Width = 44
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_TOTAL'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText15: TRLDBText
          Left = 728
          Top = 3
          Width = 47
          Height = 14
          Alignment = taRightJustify
          DataField = 'VALOR_TOTAL'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText17: TRLDBText
          Left = 49
          Top = 3
          Width = 26
          Height = 13
          Alignment = taCenter
          DataField = 'REFCOR'
          DataSource = DataSource2
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDraw2: TRLDraw
          Left = 320
          Top = -5
          Width = 28
          Height = 31
          Brush.Style = bsClear
          Color = 14869218
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDBText3: TRLDBText
          Left = 311
          Top = 3
          Width = 46
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_RN'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText1: TRLDBText
          Left = 76
          Top = 3
          Width = 241
          Height = 13
          AutoSize = False
          DataField = 'PRODUTO'
          DataSource = DataSource2
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText18: TRLDBText
          Left = 682
          Top = 3
          Width = 44
          Height = 14
          Alignment = taCenter
          DataField = 'PRECO'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 49
        Width = 776
        Height = 27
        BandType = btSummary
        object RLDraw7: TRLDraw
          Left = -5
          Top = -10
          Width = 785
          Height = 36
          Brush.Style = bsClear
          Color = 14342874
          ParentColor = False
          Pen.Color = 7895160
          Pen.Style = psClear
          Transparent = False
        end
        object RLLabel20: TRLLabel
          Left = -8
          Top = -13
          Width = 787
          Height = 15
          Caption = 
            '________________________________________________________________' +
            '________________________________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7631988
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 266
          Top = 4
          Width = 136
          Height = 14
          Alignment = taCenter
          DataFormula = 'SUM(QTD_RN)'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBResult2: TRLDBResult
          Left = 304
          Top = 4
          Width = 126
          Height = 14
          Alignment = taCenter
          DataFormula = 'SUM(QTD_P)'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBResult3: TRLDBResult
          Left = 330
          Top = 4
          Width = 130
          Height = 14
          Alignment = taCenter
          DataFormula = 'SUM(QTD_M)'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBResult4: TRLDBResult
          Left = 361
          Top = 4
          Width = 128
          Height = 14
          Alignment = taCenter
          DataFormula = 'SUM(QTD_G)'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBResult5: TRLDBResult
          Left = 390
          Top = 4
          Width = 126
          Height = 14
          Alignment = taCenter
          DataFormula = 'SUM(QTD_1)'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBResult6: TRLDBResult
          Left = 417
          Top = 4
          Width = 126
          Height = 14
          Alignment = taCenter
          DataFormula = 'SUM(QTD_2)'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBResult7: TRLDBResult
          Left = 444
          Top = 4
          Width = 126
          Height = 14
          Alignment = taCenter
          DataFormula = 'SUM(QTD_3)'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBResult8: TRLDBResult
          Left = 473
          Top = 4
          Width = 126
          Height = 14
          Alignment = taCenter
          DataFormula = 'SUM(QTD_4)'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLLabel28: TRLLabel
          Left = 103
          Top = 4
          Width = 94
          Height = 14
          Caption = 'Total da Grade  >>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult9: TRLDBResult
          Left = 500
          Top = 4
          Width = 126
          Height = 14
          Alignment = taCenter
          DataFormula = 'SUM(QTD_6)'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBResult10: TRLDBResult
          Left = 527
          Top = 4
          Width = 126
          Height = 14
          Alignment = taCenter
          DataFormula = 'SUM(QTD_8)'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBResult11: TRLDBResult
          Left = 546
          Top = 4
          Width = 154
          Height = 14
          Alignment = taCenter
          DataFormula = 'SUM(QTD_UNICA)'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBResult12: TRLDBResult
          Left = 641
          Top = 4
          Width = 44
          Height = 14
          Alignment = taCenter
          DataField = 'QTD_TOTAL'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult13: TRLDBResult
          Left = 714
          Top = 4
          Width = 61
          Height = 14
          Alignment = taRightJustify
          DataField = 'VALOR_TOTAL'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult16: TRLDBResult
          Left = 679
          Top = 4
          Width = 44
          Height = 14
          Alignment = taCenter
          DataField = 'DESCONTO'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Info = riSum
          ParentFont = False
          Text = ''
          Visible = False
        end
      end
    end
    object RLBand4: TRLBand
      Left = 9
      Top = 211
      Width = 776
      Height = 24
      BandType = btHeader
      object RLLabel32: TRLLabel
        Left = 679
        Top = 5
        Width = 44
        Height = 14
        Alignment = taCenter
        Caption = 'Desc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object RLLabel11: TRLLabel
        Left = 682
        Top = 5
        Width = 44
        Height = 14
        Alignment = taCenter
        Caption = 'Pre'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 743
        Top = 5
        Width = 32
        Height = 14
        Alignment = taRightJustify
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel23: TRLLabel
        Left = 5
        Top = 5
        Width = 25
        Height = 15
        Caption = 'Ref.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel24: TRLLabel
        Left = 43
        Top = 5
        Width = 23
        Height = 15
        Caption = 'Cor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel25: TRLLabel
        Left = 69
        Top = 5
        Width = 125
        Height = 15
        Caption = 'Descri'#231#227'o do produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel26: TRLLabel
        Left = 272
        Top = 5
        Width = 37
        Height = 15
        Caption = 'Grade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel27: TRLLabel
        Left = 636
        Top = 5
        Width = 44
        Height = 14
        Alignment = taCenter
        Caption = 'Qtd.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand6: TRLBand
      Left = 9
      Top = 409
      Width = 776
      Height = 119
      AlignToBottom = True
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.FixedTop = True
      object RLLabel4: TRLLabel
        Left = 7
        Top = 4
        Width = 140
        Height = 15
        Caption = 'Observa'#231#245'es adicionais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLMemo1: TRLMemo
        Left = 8
        Top = 22
        Width = 761
        Height = 15
        Behavior = [beSiteExpander]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand8: TRLBand
      Left = 9
      Top = 318
      Width = 776
      Height = 91
      BandType = btSummary
      object RLDBResult14: TRLDBResult
        Left = 736
        Top = 43
        Width = 38
        Height = 14
        DataField = 'QTD_TOTAL'
        DataSource = DataSource2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel30: TRLLabel
        Left = 330
        Top = 43
        Width = 95
        Height = 14
        Caption = 'Desconto F. Pgto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel29: TRLLabel
        Left = 6
        Top = 43
        Width = 98
        Height = 14
        Caption = 'Desconto Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText20: TRLDBText
        Left = 584
        Top = 43
        Width = 44
        Height = 14
        DataField = 'DESCONTO_ITENS'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBText21: TRLDBText
        Left = 491
        Top = 65
        Width = 91
        Height = 18
        DataField = 'VALOR_TOTAL'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBText22: TRLDBText
        Left = 427
        Top = 43
        Width = 50
        Height = 14
        DataField = 'DESCONTO_FPGTO'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBText23: TRLDBText
        Left = 105
        Top = 43
        Width = 50
        Height = 14
        DataField = 'DESCONTO'
        DataSource = DataSource1
        DisplayMask = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel33: TRLLabel
        Left = 166
        Top = 43
        Width = 102
        Height = 14
        Caption = 'Acr'#233'scimo Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText24: TRLDBText
        Left = 270
        Top = 43
        Width = 50
        Height = 14
        DataField = 'ACRESCIMO'
        DataSource = DataSource1
        DisplayMask = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel34: TRLLabel
        Left = 644
        Top = 43
        Width = 90
        Height = 14
        Caption = 'Qtd. Total Itens:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel35: TRLLabel
        Left = 493
        Top = 43
        Width = 88
        Height = 14
        Caption = 'Desconto Itens:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw8: TRLDraw
        Left = -2
        Top = 3
        Width = 779
        Height = 1
        DrawKind = dkLine
      end
      object RLLabel36: TRLLabel
        Left = 335
        Top = 11
        Width = 106
        Height = 15
        Alignment = taCenter
        Caption = 'TOTAIS DO PEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel37: TRLLabel
        Left = 413
        Top = 69
        Width = 77
        Height = 14
        Caption = 'Total L'#237'quido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel38: TRLLabel
        Left = 258
        Top = 69
        Width = 66
        Height = 14
        Caption = 'Total Bruto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLDBResult15: TRLDBResult
        Left = 325
        Top = 65
        Width = 84
        Height = 18
        DataFormula = 
          '(DESCONTO + DESCONTO_FPGTO + DESCONTO_ITENS + VALOR_TOTAL) - ACR' +
          'ESCIMO'
        DataSource = DataSource1
        DisplayMask = 'R$ ###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDraw9: TRLDraw
        Left = -2
        Top = 89
        Width = 779
        Height = 1
        DrawKind = dkLine
      end
    end
  end
  object RLReport2: TRLReport
    Left = 608
    Top = 80
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand9: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 211
      BandType = btHeader
      object RLLabel39: TRLLabel
        Left = 16
        Top = 16
        Width = 145
        Height = 19
        Caption = 'Foi                           >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel40: TRLLabel
        Left = 16
        Top = 40
        Width = 144
        Height = 19
        Caption = 'Total bruto            >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel41: TRLLabel
        Left = 16
        Top = 64
        Width = 143
        Height = 19
        Caption = 'Total l'#237'quido         >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel42: TRLLabel
        Left = 16
        Top = 88
        Width = 145
        Height = 19
        Caption = 'Total pe'#231'as           >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel43: TRLLabel
        Left = 16
        Top = 112
        Width = 144
        Height = 19
        Caption = 'Total refer'#234'ncias >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlbFoi: TRLLabel
        Left = 168
        Top = 16
        Width = 31
        Height = 18
        Caption = 'Foi:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rlbtotalbruto: TRLLabel
        Left = 168
        Top = 40
        Width = 81
        Height = 18
        Caption = 'Total bruto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rlbTotalLiquido: TRLLabel
        Left = 168
        Top = 64
        Width = 91
        Height = 18
        Caption = 'Total l'#237'quido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rlbTotalPecas: TRLLabel
        Left = 168
        Top = 88
        Width = 89
        Height = 18
        Caption = 'Total pe'#231'as:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rlbTotalReferencias: TRLLabel
        Left = 168
        Top = 112
        Width = 124
        Height = 18
        Caption = 'Total refer'#234'ncias:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object DataSource2: TDataSource
    DataSet = qryItens
    Left = 152
  end
  object DataSource1: TDataSource
    DataSet = qryPedido
    Left = 56
  end
  object RLExpressionParser1: TRLExpressionParser
    Left = 281
    Top = 2
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2015 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 376
    Top = 32
  end
  object qryPedido: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select p.*,c.razao cliente, c.fone1, c.cpf_cnpj, c.rg_ie, r.raza' +
        'o representante, cid.nome cidade,'
      
        'est.sigla UF, fp.descricao FPGTO, e.logradouro, e.numero, e.bair' +
        'ro, e.cep, emp.razao empresa,'
      't.razao transportadora'
      'from pedidos p'
      'left join pessoas c on c.codigo = p.cod_cliente'
      'left join pessoas r on r.codigo = p.cod_repres'
      'left join pessoas t on t.codigo = p.cod_transp'
      'left join empresas em on em.codigo = p.cod_filial'
      'left join pessoas emp on emp.codigo = em.codigo_pessoa'
      'left join enderecos e on e.codpessoa = c.codigo'
      'left join cidades cid on cid.codibge = e.codcidade'
      'left join estados est on est.codigo = cid.codest'
      'left join formas_pgto fp on fp.codigo = p.cod_forma_pag'
      'where p.numpedido = :codped')
    Left = 16
    Top = 48
    ParamData = <
      item
        Name = 'CODPED'
        DataType = ftString
        ParamType = ptInput
        Size = 22
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
    object qryPedidoFONE1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FONE1'
      Origin = 'FONE1'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qryPedidoCPF_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object qryPedidoRG_IE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RG_IE'
      Origin = 'RG_IE'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
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
    object qryPedidoFPGTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FPGTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryPedidoLOGRADOURO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryPedidoNUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryPedidoBAIRRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryPedidoCEP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEP'
      Origin = 'CEP'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryPedidoEMPRESA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMPRESA'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryPedidoTRANSPORTADORA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSPORTADORA'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object qryItens: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select i.*, c.referencia refcor, p.referencia refpro ,p.descrica' +
        'o produto, g.descricao grupo  from itens i'
      'left join produtos p on p.codigo = i.cod_produto'
      'left join cores c on c.codigo = i.cod_cor'
      'left join grupo g on g.codigo = p.cod_grupo'
      'where i.cod_pedido = :codped'
      'order by p.cod_grupo, p.referencia, i.cod_cor')
    Left = 112
    Top = 48
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
    object qryItensREFCOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFCOR'
      Origin = 'REFERENCIA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensREFPRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFPRO'
      Origin = 'REFERENCIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object qryItensPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object qryItensGRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GRUPO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
end
