object frmFortesNotasFiscaisVenda: TfrmFortesNotasFiscaisVenda
  Left = 233
  Top = 191
  Width = 870
  Height = 480
  Caption = 'frmFortesNotasFiscaisVenda'
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
    Left = 16
    Top = 32
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    object RLBand1: TRLBand
      Left = 20
      Top = 39
      Width = 754
      Height = 91
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel1: TRLLabel
        Left = 165
        Top = 1
        Width = 404
        Height = 32
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Notas Fiscais de Sa'#237'da'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 368
        Top = 71
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
      object lbPeriodo: TRLLabel
        Left = 432
        Top = 71
        Width = 48
        Height = 16
        Caption = 'Per'#237'odo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 1
        Top = 71
        Width = 63
        Height = 16
        Caption = 'Empresa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbEmpresa: TRLLabel
        Left = 66
        Top = 71
        Width = 60
        Height = 16
        Caption = 'Empresa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel19: TRLLabel
        Left = 553
        Top = 71
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
        Left = 624
        Top = 70
        Width = 37
        Height = 16
        Info = itNow
      end
    end
    object RLBand2: TRLBand
      Left = 20
      Top = 130
      Width = 754
      Height = 23
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel2: TRLLabel
        Left = 0
        Top = 4
        Width = 51
        Height = 16
        Caption = 'N'#186' Nota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 72
        Top = 4
        Width = 56
        Height = 16
        Caption = 'Emiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 144
        Top = 4
        Width = 40
        Height = 16
        Caption = 'CFOP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 192
        Top = 4
        Width = 49
        Height = 16
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 504
        Top = 4
        Width = 60
        Height = 16
        Caption = 'Vlr. Prod'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 600
        Top = 4
        Width = 58
        Height = 16
        Caption = 'Tot. B.C.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 688
        Top = 4
        Width = 65
        Height = 16
        Caption = 'Tot. ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 20
      Top = 153
      Width = 754
      Height = 23
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      Color = clWhite
      ParentColor = False
      Transparent = False
      object RLDBText1: TRLDBText
        Left = 1
        Top = 3
        Width = 103
        Height = 16
        DataField = 'NUMERO_NOTA'
        DataSource = ds
        Transparent = False
      end
      object RLDBText2: TRLDBText
        Left = 69
        Top = 3
        Width = 64
        Height = 16
        Alignment = taCenter
        DataField = 'EMISSAO'
        DataSource = ds
        Transparent = False
      end
      object RLDBText3: TRLDBText
        Left = 144
        Top = 3
        Width = 40
        Height = 16
        Alignment = taCenter
        DataField = 'CFOP'
        DataSource = ds
        Transparent = False
      end
      object RLDBText4: TRLDBText
        Left = 193
        Top = 3
        Width = 57
        Height = 16
        DataField = 'CLIENTE'
        DataSource = ds
        Transparent = False
      end
      object RLDBText5: TRLDBText
        Left = 526
        Top = 3
        Width = 52
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOT_NF'
        DataSource = ds
        Transparent = False
      end
      object RLDBText6: TRLDBText
        Left = 613
        Top = 3
        Width = 53
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOT_BC'
        DataSource = ds
        Transparent = False
      end
      object RLDBText7: TRLDBText
        Left = 687
        Top = 3
        Width = 67
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOT_ICMS'
        DataSource = ds
        Transparent = False
      end
      object RLDraw7: TRLDraw
        Left = 63
        Top = -1
        Width = 2
        Height = 23
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.Color = 7960953
        Borders.Style = bsClear
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7303023
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Pen.Style = psClear
      end
      object RLDraw8: TRLDraw
        Left = 137
        Top = -1
        Width = 2
        Height = 23
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.Color = 7960953
        Borders.Style = bsClear
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7303023
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Pen.Style = psClear
      end
      object RLDraw9: TRLDraw
        Left = 189
        Top = -1
        Width = 2
        Height = 23
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.Color = 7960953
        Borders.Style = bsClear
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7303023
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Pen.Style = psClear
      end
      object RLDraw10: TRLDraw
        Left = 485
        Top = -1
        Width = 2
        Height = 23
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.Color = 7960953
        Borders.Style = bsClear
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7303023
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Pen.Style = psClear
      end
      object RLDraw11: TRLDraw
        Left = 580
        Top = -1
        Width = 2
        Height = 23
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.Color = 7960953
        Borders.Style = bsClear
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7303023
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Pen.Style = psClear
      end
      object RLDraw12: TRLDraw
        Left = 668
        Top = -1
        Width = 2
        Height = 23
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.Color = 7960953
        Borders.Style = bsClear
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7303023
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Pen.Style = psClear
      end
    end
    object RLBand4: TRLBand
      Left = 20
      Top = 176
      Width = 754
      Height = 22
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLDBResult1: TRLDBResult
        Left = 484
        Top = 3
        Width = 95
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOT_NF'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
      end
      object RLDBResult2: TRLDBResult
        Left = 570
        Top = 2
        Width = 96
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOT_BC'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
      end
      object RLDBResult3: TRLDBResult
        Left = 643
        Top = 2
        Width = 111
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOT_ICMS'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
      end
    end
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 8
    object cdsNUMERO_NOTA: TStringField
      FieldName = 'NUMERO_NOTA'
    end
    object cdsEMISSAO: TDateField
      FieldName = 'EMISSAO'
    end
    object cdsCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object cdsCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 30
    end
    object cdsTOT_BC: TFloatField
      FieldName = 'TOT_BC'
      DisplayFormat = ',0.00;-,0.00'
    end
    object cdsTOT_ICMS: TFloatField
      FieldName = 'TOT_ICMS'
      DisplayFormat = ',0.00;-,0.00'
    end
    object cdsTOT_NF: TFloatField
      FieldName = 'TOT_NF'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 64
    Top = 8
  end
end
