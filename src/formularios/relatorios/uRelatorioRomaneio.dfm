object frmRelatorioRomaneio: TfrmRelatorioRomaneio
  Left = 248
  Top = 176
  Caption = 'frmRelatorioRomaneio'
  ClientHeight = 517
  ClientWidth = 837
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
    Left = 8
    Top = 8
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
      object lblTitulo: TRLLabel
        Left = 318
        Top = 2
        Width = 109
        Height = 22
        Caption = 'ROMANEIO'
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
      object RLLabel4: TRLLabel
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
    object RLBand4: TRLBand
      Left = 20
      Top = 194
      Width = 754
      Height = 24
      BandType = btColumnHeader
      object RLLabel11: TRLLabel
        Left = 617
        Top = 5
        Width = 69
        Height = 14
        Caption = 'Refer'#234'ncias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 705
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
        Width = 312
        Height = 14
        Caption = 
          'RN       P       M       G       1       2       3       4      ' +
          ' 6       8    UNICA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLGroup2: TRLGroup
      Left = 20
      Top = 218
      Width = 754
      Height = 92
      DataFields = 'NUMERO_CAIXA'
      object RLBand8: TRLBand
        Left = 0
        Top = 0
        Width = 754
        Height = 24
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.FixedTop = True
        Color = clWhite
        ParentColor = False
        Transparent = False
        object RLLabel15: TRLLabel
          Left = 336
          Top = 5
          Width = 56
          Height = 16
          Caption = 'CAIXA - '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText19: TRLDBText
          Left = 390
          Top = 5
          Width = 107
          Height = 16
          DataField = 'NUMERO_CAIXA'
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
        object RLDraw14: TRLDraw
          Left = -1
          Top = 1
          Width = 298
          Height = 22
          Brush.Color = clSilver
          Brush.Style = bsBDiagonal
          Color = clWhite
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw15: TRLDraw
          Left = 458
          Top = 1
          Width = 298
          Height = 22
          Brush.Color = clSilver
          Brush.Style = bsBDiagonal
          Color = clWhite
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
      end
      object RLGroup1: TRLGroup
        Left = 0
        Top = 24
        Width = 754
        Height = 55
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
          object RLDraw6: TRLDraw
            Left = 546
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
            Left = 488
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
            Left = 435
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
            Left = 378
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
            Left = 321
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
            Left = 522
            Top = 3
            Width = 76
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_UNICA'
            DataSource = DataSource2
            Text = ''
          end
          object RLDBText14: TRLDBText
            Left = 608
            Top = 3
            Width = 86
            Height = 16
            Alignment = taCenter
            DataField = 'QTDE_TOTAL'
            DataSource = DataSource2
            Text = ''
          end
          object RLDBText15: TRLDBText
            Left = 698
            Top = 3
            Width = 50
            Height = 16
            Alignment = taCenter
            DataField = 'PECAS'
            DataSource = DataSource2
            Text = ''
          end
          object RLDBText17: TRLDBText
            Left = 51
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
          object RLDraw2: TRLDraw
            Left = 260
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
            Left = 246
            Top = 3
            Width = 56
            Height = 16
            Alignment = taCenter
            DataField = 'QTD_RN'
            DataSource = DataSource2
            Text = ''
          end
        end
      end
    end
    object RLBand7: TRLBand
      Left = 20
      Top = 310
      Width = 754
      Height = 41
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.FixedTop = True
      object RLDBResult1: TRLDBResult
        Left = 552
        Top = 20
        Width = 97
        Height = 17
        Alignment = taCenter
        DataField = 'QTDE_TOTAL'
        DataSource = DataSource2
        DisplayMask = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel16: TRLLabel
        Left = 504
        Top = 3
        Width = 247
        Height = 16
        Caption = 'TOTAL [   Refer'#234'ncias  |     Pe'#231'as        ]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult2: TRLDBResult
        Left = 656
        Top = 20
        Width = 100
        Height = 17
        Alignment = taCenter
        DataField = 'PECAS'
        DataSource = DataSource2
        DisplayMask = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDraw13: TRLDraw
        Left = 1
        Top = 1
        Width = 496
        Height = 39
        Brush.Color = clSilver
        Brush.Style = bsBDiagonal
        Color = clWhite
        ParentColor = False
        Pen.Color = 12895428
        Pen.Style = psClear
        Transparent = False
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = qryPedido
    Left = 80
  end
  object DataSource2: TDataSource
    DataSet = qryItens
    Left = 304
  end
  object qryPedido: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select p.*, c.razao cliente, c.cpf_cnpj, r.razao representante, ' +
        'cid.nome cidade, '
      'est.sigla UF '
      'from pedidos p'
      'left join pessoas c on c.codigo = p.cod_cliente'
      'left join pessoas r on r.codigo = p.cod_repres'
      'left join enderecos e on e.codpessoa = c.codigo'
      'left join cidades cid on cid.codibge = e.codcidade'
      'left join estados est on est.codigo = cid.codest'
      'where p.codigo = :codped'
      '')
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
      Precision = 18
      Size = 2
    end
    object qryPedidoACRESCIMO: TBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
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
      
        'select CAST(cx.numero_caixa as integer) numero_caixa, i.codigo, ' +
        'i.cod_pedido, i.cod_produto, i.cod_cor, '
      
        'cx.qtd_rn, cx.qtd_p, cx.qtd_m, cx.qtd_g, cx.qtd_1, cx.qtd_2, cx.' +
        'qtd_3, cx.qtd_4, cx.qtd_6, cx.qtd_8, cx.qtd_unica,'
      
        'cast((cx.qtd_rn + cx.qtd_p + cx.qtd_m + cx.qtd_g + cx.qtd_1 + cx' +
        '.qtd_2 + cx.qtd_3 + cx.qtd_4 + cx.qtd_6 + cx.qtd_8 + cx.qtd_unic' +
        'a) as integer) QTDE_TOTAL,'
      
        'CAST(((cx.qtd_rn + cx.qtd_p + cx.qtd_m + cx.qtd_g + cx.qtd_1 + c' +
        'x.qtd_2 + cx.qtd_3 + cx.qtd_4 + cx.qtd_6 + cx.qtd_8 + cx.qtd_uni' +
        'ca) * p.qtd_pecas)  as NUMERIC(15,0)) pecas,'
      
        'p.descricao produto, c.referencia refcor, p.referencia refprod, ' +
        'iif(c.cor <> '#39#39', c.desc_producao || '#39' '#39' || c.cor, c.descricao) c' +
        'or'
      '   from itens i'
      'left join produtos p  on p.codigo = i.cod_produto'
      'left join cores    c  on c.codigo = i.cod_cor'
      'left join caixas   cx on cx.codigo_item = i.codigo'
      'where i.cod_pedido = :codped'
      'order by cx.numero_caixa, i.cod_produto'
      '')
    Left = 232
    ParamData = <
      item
        Name = 'CODPED'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryItensNUMERO_CAIXA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO_CAIXA'
      Origin = 'NUMERO_CAIXA'
      ProviderFlags = []
      ReadOnly = True
    end
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
    object qryItensQTD_RN: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_RN'
      Origin = 'QTD_RN'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTD_P: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_P'
      Origin = 'QTD_P'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTD_M: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_M'
      Origin = 'QTD_M'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTD_G: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_G'
      Origin = 'QTD_G'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTD_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_1'
      Origin = 'QTD_1'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTD_2: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_2'
      Origin = 'QTD_2'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTD_3: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_3'
      Origin = 'QTD_3'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTD_4: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_4'
      Origin = 'QTD_4'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTD_6: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_6'
      Origin = 'QTD_6'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTD_8: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_8'
      Origin = 'QTD_8'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTD_UNICA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_UNICA'
      Origin = 'QTD_UNICA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensQTDE_TOTAL: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE_TOTAL'
      Origin = 'QTDE_TOTAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensPECAS: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'PECAS'
      Origin = 'PECAS'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
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
