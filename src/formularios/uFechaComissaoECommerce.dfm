inherited frmFechaComissaoECommerce: TfrmFechaComissaoECommerce
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fecha comiss'#227'o e-commerce'
  ClientHeight = 456
  ClientWidth = 789
  OnShow = FormShow
  ExplicitWidth = 795
  ExplicitHeight = 484
  PixelsPerInch = 96
  TextHeight = 15
  object Label17: TLabel
    Left = 472
    Top = 73
    Width = 159
    Height = 20
    Caption = 'Venda Bruta                 >'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 472
    Top = 113
    Width = 159
    Height = 20
    Caption = 'Devolu'#231#245'es                  >'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 472
    Top = 155
    Width = 161
    Height = 20
    Caption = 'Venda L'#237'quida              >'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 472
    Top = 195
    Width = 162
    Height = 20
    Caption = '(-) Comiss'#227'o                 >'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 472
    Top = 235
    Width = 162
    Height = 20
    Caption = 'IRRF Sobre Comiss'#227'o   >'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 472
    Top = 274
    Width = 164
    Height = 20
    Caption = 'Frete Site                       >'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 472
    Top = 314
    Width = 162
    Height = 20
    Caption = 'Frete Reversa                >'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 472
    Top = 354
    Width = 164
    Height = 20
    Caption = 'Repasse                        >'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 472
    Top = 33
    Width = 161
    Height = 20
    Caption = 'Comiss'#227'o parceiro       >'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object RLReport1: TRLReport
    Left = -25
    Top = 397
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
    Visible = False
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 39
      Top = 39
      Width = 716
      Height = 99
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel2: TRLLabel
        Left = -2
        Top = 38
        Width = 725
        Height = 16
        Caption = 
          '________________________________________________________________' +
          '_______________________________________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel1: TRLLabel
        Left = 249
        Top = 14
        Width = 220
        Height = 24
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 3
        Top = 56
        Width = 100
        Height = 16
        Caption = 'Representante:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlPeriodo: TRLLabel
        Left = 143
        Top = 77
        Width = 74
        Height = 16
        Caption = 'Referente a:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rlRepresentante: TRLLabel
        Left = 107
        Top = 56
        Width = 22
        Height = 16
        Caption = 'rep'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel27: TRLLabel
        Left = 3
        Top = 77
        Width = 136
        Height = 16
        Caption = 'Per'#237'odo do relat'#243'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 39
      Top = 138
      Width = 716
      Height = 112
      object RLBand4: TRLBand
        Left = 0
        Top = 65
        Width = 716
        Height = 25
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = 15987699
        ParentColor = False
        Transparent = False
        object RLDBResult1: TRLDBResult
          Left = 395
          Top = 5
          Width = 134
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR_TOTAL'
          DataSource = ds
          Info = riSum
          Text = ''
          Transparent = False
        end
        object RLLabel10: TRLLabel
          Left = 331
          Top = 5
          Width = 95
          Height = 16
          Caption = 'Total Pedidos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 44
        Width = 716
        Height = 21
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBText1: TRLDBText
          Left = 3
          Top = 2
          Width = 62
          Height = 15
          DataField = 'DT_ENVIO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 69
          Top = 2
          Width = 76
          Height = 15
          DataField = 'NUMPEDIDO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 139
          Top = 2
          Width = 54
          Height = 15
          DataField = 'CLIENTE'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 443
          Top = 2
          Width = 86
          Height = 15
          Alignment = taRightJustify
          DataField = 'VALOR_TOTAL'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 548
          Top = 2
          Width = 66
          Height = 15
          Alignment = taCenter
          DataField = 'COMISSAO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 626
          Top = 2
          Width = 88
          Height = 15
          Alignment = taRightJustify
          DataField = 'VLRCOMISSAO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 22
        Width = 716
        Height = 22
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel4: TRLLabel
          Left = 3
          Top = 3
          Width = 33
          Height = 16
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 67
          Top = 3
          Width = 67
          Height = 16
          Caption = 'N'#186' Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 139
          Top = 3
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
          Left = 475
          Top = 3
          Width = 38
          Height = 16
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 540
          Top = 3
          Width = 79
          Height = 16
          Caption = '% Comiss'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel9: TRLLabel
          Left = 624
          Top = 3
          Width = 91
          Height = 16
          Caption = 'Vlr. Comiss'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand9: TRLBand
        Left = 0
        Top = 0
        Width = 716
        Height = 22
        BandType = btTitle
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = 15461355
        ParentColor = False
        Transparent = False
        object RLLabel16: TRLLabel
          Left = 287
          Top = 0
          Width = 144
          Height = 16
          Alignment = taCenter
          Caption = 'PEDIDOS ENTREGUES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
    object RLBand5: TRLBand
      Left = 39
      Top = 250
      Width = 716
      Height = 279
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel33: TRLLabel
        Left = 378
        Top = 241
        Width = 324
        Height = 16
        Caption = 
          '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
          '- - - - - - - - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel32: TRLLabel
        Left = 378
        Top = 113
        Width = 324
        Height = 16
        Caption = 
          '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
          '- - - - - - - - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel11: TRLLabel
        Left = 378
        Top = 27
        Width = 68
        Height = 16
        Alignment = taCenter
        Caption = 'BALAN'#199'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel12: TRLLabel
        Left = 378
        Top = 51
        Width = 112
        Height = 16
        Caption = 'Comiss'#227'o parceiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel13: TRLLabel
        Left = 378
        Top = 75
        Width = 74
        Height = 16
        Caption = 'Venda bruta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel14: TRLLabel
        Left = 378
        Top = 99
        Width = 70
        Height = 16
        Caption = 'Devolu'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel15: TRLLabel
        Left = 378
        Top = 131
        Width = 82
        Height = 16
        Caption = 'Venda l'#237'quida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel17: TRLLabel
        Left = 378
        Top = 155
        Width = 86
        Height = 16
        Caption = '( - ) Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel18: TRLLabel
        Left = 378
        Top = 179
        Width = 131
        Height = 16
        Caption = 'IRRF Sobre comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel19: TRLLabel
        Left = 378
        Top = 203
        Width = 59
        Height = 16
        Caption = 'Frete site'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel20: TRLLabel
        Left = 378
        Top = 227
        Width = 103
        Height = 16
        Caption = '( - ) Frete reversa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel21: TRLLabel
        Left = 378
        Top = 259
        Width = 57
        Height = 16
        Caption = 'Repasse'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel22: TRLLabel
        Left = 530
        Top = 51
        Width = 20
        Height = 16
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel23: TRLLabel
        Left = 530
        Top = 75
        Width = 20
        Height = 16
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel24: TRLLabel
        Left = 530
        Top = 99
        Width = 20
        Height = 16
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel25: TRLLabel
        Left = 530
        Top = 131
        Width = 20
        Height = 16
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel26: TRLLabel
        Left = 530
        Top = 155
        Width = 20
        Height = 16
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel28: TRLLabel
        Left = 530
        Top = 179
        Width = 20
        Height = 16
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel29: TRLLabel
        Left = 530
        Top = 203
        Width = 20
        Height = 16
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel30: TRLLabel
        Left = 530
        Top = 227
        Width = 20
        Height = 16
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel31: TRLLabel
        Left = 530
        Top = 259
        Width = 20
        Height = 16
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlbComissaoParceiro: TRLLabel
        Left = 659
        Top = 51
        Width = 35
        Height = 18
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object rlbVendaBruta: TRLLabel
        Left = 659
        Top = 75
        Width = 35
        Height = 18
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object rlbDevolucoes: TRLLabel
        Left = 659
        Top = 99
        Width = 35
        Height = 18
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object rlbVendaLiquida: TRLLabel
        Left = 659
        Top = 131
        Width = 35
        Height = 18
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object rlbComissao: TRLLabel
        Left = 659
        Top = 155
        Width = 35
        Height = 18
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object rlbIRRF: TRLLabel
        Left = 659
        Top = 179
        Width = 35
        Height = 18
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object rlbFreteSite: TRLLabel
        Left = 659
        Top = 203
        Width = 35
        Height = 18
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object rlbFreteReversa: TRLLabel
        Left = 659
        Top = 227
        Width = 35
        Height = 18
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object rlbRepasse: TRLLabel
        Left = 659
        Top = 259
        Width = 35
        Height = 19
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 456
    Align = alLeft
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 667
    object Label32: TLabel
      Left = 18
      Top = 94
      Width = 79
      Height = 16
      Caption = 'Data Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label33: TLabel
      Left = 139
      Top = 94
      Width = 72
      Height = 16
      Caption = 'Data Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtpInicio: TDateTimePicker
      Left = 18
      Top = 113
      Width = 105
      Height = 28
      Date = 41523.559567326390000000
      Time = 41523.559567326390000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object dtpFim: TDateTimePicker
      Left = 139
      Top = 113
      Width = 105
      Height = 28
      Date = 41523.559567326390000000
      Time = 41523.559567326390000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    inline BuscaPessoa1: TBuscaPessoa
      Left = 18
      Top = 25
      Width = 377
      Height = 47
      AutoSize = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 18
      ExplicitTop = 25
      ExplicitWidth = 377
      ExplicitHeight = 47
      inherited StaticText1: TStaticText
        Width = 92
        Height = 21
        Caption = 'Representante'
        Font.Height = -13
        ExplicitWidth = 92
        ExplicitHeight = 21
      end
      inherited edtCodigo: TCurrencyEdit
        Top = 19
        Width = 52
        Height = 28
        AutoSize = True
        ExplicitTop = 19
        ExplicitWidth = 52
        ExplicitHeight = 28
      end
      inherited StaticText2: TStaticText
        Left = 83
        Width = 92
        Height = 21
        Caption = 'Representante'
        Font.Height = -13
        Visible = False
        ExplicitLeft = 83
        ExplicitWidth = 92
        ExplicitHeight = 21
      end
      inherited btnBuscar: TBitBtn
        Left = 53
        Top = 17
        Width = 30
        Height = 30
        ExplicitLeft = 53
        ExplicitTop = 17
        ExplicitWidth = 30
        ExplicitHeight = 30
      end
      inherited edtRazao: TEdit
        Left = 82
        Top = 19
        Width = 295
        Height = 28
        ExplicitLeft = 82
        ExplicitTop = 19
        ExplicitWidth = 295
        ExplicitHeight = 28
      end
    end
    object btnBuscar: TBitBtn
      Left = 287
      Top = 112
      Width = 108
      Height = 30
      Caption = ' Buscar'
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF0094713B0094713B0094713B0096713B0096713B0096713B0096713B009671
        3B0096713B0094713B0094713B005D3E24002F5B91002F5B91009B9B9B009B9B
        9B00300D0000300D0000300D0000320D0000320D0000320D0000320D0000320D
        0000320D0000300D0000300D00000000000000002D0000002D00FFFFFF00FFFF
        FF0094713B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C2D1F6002F5B9100C1FFFF00005FDE009B9B9B009B9B
        9B00300D00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B005E6D920000002D005D9B9B0000007A00FFFFFF00FFFF
        FF00A3845300FAEEEE00B9836100B8816000BC876700C5916F00C8967400BE8B
        6B00CC8F6400714B4B002F5B9100B6FFFF00005FDE00FFFFFF009B9B9B009B9B
        9B003F200000968A8A00551F0000541D000058230300612D0B00643210005A27
        0700682B00000D00000000002D00529B9B0000007A009B9B9B00FFFFFF00FFFF
        FF00A3845300FFFFFF00F8F8F500FFFFFF00ECF1F7009877710098777100925B
        4C00D9E4EB002F5B9100AEFBFF00005FDE00543B2100FFFFFF009B9B9B009B9B
        9B003F2000009B9B9B00949491009B9B9B00888D930034130D0034130D002E00
        00007580870000002D004A979B0000007A00000000009B9B9B00FFFFFF00FFFF
        FF00A3845300F3E3DE00C8906E008F513A0072453500DCD09F00F6F5C500FFFF
        FD00925B4C0059709700005FDE00B8C0C60075460500FFFFFF009B9B9B009B9B
        9B003F2000008F7F7A00642C0A002B0000000E000000786C3B00929161009B9B
        99002E000000000C330000007A00545C6200110000009B9B9B00FFFFFF00FFFF
        FF00AD906000FFFFFF00F3F9F90098777100F8D69E00FBEBC000FFFAD900FFFF
        FD00FFFFFF00A9614B00D2DFEB00FFFBE70075460500FFFFFF009B9B9B009B9B
        9B00492C00009B9B9B008F95950034130D0094723A0097875C009B9675009B9B
        99009B9B9B00450000006E7B87009B978300110000009B9B9B00FFFFFF00FFFF
        FF00AD906000F9E9E1008D5B4A00C4896200F2C69A00ECD2B000FEF8DA00FAF5
        DE00FFFFFF00DBD0CE00BF887500F8F9F20078470600FFFFFF009B9B9B009B9B
        9B00492C000095857D0029000000602500008E623600886E4C009A9476009691
        7A009B9B9B00776C6A005B24110094958E00140000009B9B9B00FFFFFF00FFFF
        FF00AC916700FFFFFF00C3B6B800C4835A00F6D8AC00F0DABE00F8EAD000FEF8
        DE00FFFDE300E9E4D100BEB0B100FAF6EE00784A0800FFFFFF009B9B9B009B9B
        9B00482D03009B9B9B005F525400601F0000927448008C765A0094866C009A94
        7A009B997F0085806D005A4C4D0096928A00140000009B9B9B00FFFFFF00FFFF
        FF00B19F7C00FCEDE700A77D6C00BA745500FCDEAB00FFFFFF00F1DEBF00F2E0
        BB00FFFDD300CCBC9800AC877D00EDE5D7007A4C0B00FFFFFF009B9B9B009B9B
        9B004D3B1800988983004319080056100000987A47009B9B9B008D7A5B008E7C
        57009B996F00685834004823190089817300160000009B9B9B00FFFFFF00FFFF
        FF00BAA18000FFFFFF00FFFFFF00A5766800D6895200FBE0A900F2DAAE00F6D9
        A100F6D9A1008E6A6200DCD1CD00D9CDB5007D501000FFFFFF009B9B9B009B9B
        9B00563D1C009B9B9B009B9B9B004112040072250000977C45008E764A009275
        3D0092753D002A060000786D690075695100190000009B9B9B00FFFFFF00FFFF
        FF00C6B19100F5E8E300C28A6900B98E7B00B0897F00B8714F00CC8C6300D09D
        7700A0786C00874B2D00AD7A5100C0AC880081551800FFFFFF009B9B9B009B9B
        9B00624D2D0091847F005E260500552A17004C251B00540D0000682800006C39
        13003C14080023000000491600005C4824001D0000009B9B9B00FFFFFF00FFFF
        FF00C4B19200FFFFFF00FCFFFF00FFFFFF00F8FBFA00CFC6C200C6B5B600B3A1
        9A00CCBA9E00F9F8F000E5E1D000B3976D00865A1D00FFFFFF009B9B9B009B9B
        9B00604D2E009B9B9B00989B9B009B9B9B00949796006B625E00625152004F3D
        360068563A0095948C00817D6C004F330900220000009B9B9B00FFFFFF00FFFF
        FF00C8B89A00F2E6DF00BD856300BE866400BC856300BB856300BF8463009C62
        3D00CDBA9900E5E1D000CCB69B009C774100FFFFFF00FFFFFF009B9B9B009B9B
        9B00645436008E827B00592100005A22000058210000572100005B2000003800
        000069563500817D6C0068523700381300009B9B9B009B9B9B00FFFFFF00FFFF
        FF00C8B89A00FFFFFF00FFFFFF00FFFFFF00FCFCFA00EDEDEA00EBE5D900D3C0
        A100B9A88300D4C5AF00946D3100FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B00645436009B9B9B009B9B9B009B9B9B009898960089898600878175006F5C
        3D0055441F0070614B00300900009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00C8BA9D00FFFFFF00FFFFFF00F8F6F500F0E5DE00DED5C400D5C2AA00BEA5
        7E009A7B44009D774100FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B00645639009B9B9B009B9B9B00949291008C817A007A716000715E46005A41
        1A0036170000391300009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00C8B89A00CCB89C00C6B49700C3AF9000C2AE9000BFA78000BBA07700A991
        60008D652D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B006454360068543800625033005F4B2C005E4A2C005B431C00573C1300452D
        0000290100009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00}
      NumGlyphs = 2
      TabOrder = 3
      OnClick = btnBuscarClick
    end
    object Panel2: TPanel
      Left = 0
      Top = 400
      Width = 429
      Height = 52
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 4
      ExplicitTop = 611
      object BitBtn1: TBitBtn
        Left = 148
        Top = 7
        Width = 125
        Height = 32
        Caption = ' Imprimir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
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
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 12
        Top = 7
        Width = 125
        Height = 32
        Caption = ' Voltar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
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
        ParentFont = False
        TabOrder = 1
      end
      object btnSalvarExcel: TBitBtn
        Left = 284
        Top = 7
        Width = 125
        Height = 32
        Caption = 'Salvar em Excel'
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
        TabOrder = 2
        OnClick = btnSalvarExcelClick
      end
    end
  end
  object edtVendaBruta: TCurrencyEdit
    Left = 653
    Top = 70
    Width = 115
    Height = 27
    Color = clWhite
    Ctl3D = False
    DisplayFormat = ' ,0.00; -,0.00'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object edtDevolucoes: TCurrencyEdit
    Left = 654
    Top = 110
    Width = 115
    Height = 27
    Color = clWhite
    Ctl3D = False
    DisplayFormat = ' ,0.00; -,0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    OnChange = edtDevolucoesChange
  end
  object edtVendaLiquida: TCurrencyEdit
    Left = 653
    Top = 150
    Width = 115
    Height = 27
    Color = clWhite
    Ctl3D = False
    DisplayFormat = ' ,0.00; -,0.00'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object edtComissao: TCurrencyEdit
    Left = 653
    Top = 191
    Width = 115
    Height = 27
    Color = clWhite
    Ctl3D = False
    DisplayFormat = ' ,0.00; -,0.00'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object edtIRRF: TCurrencyEdit
    Left = 653
    Top = 231
    Width = 115
    Height = 27
    Color = clWhite
    Ctl3D = False
    DisplayFormat = ' ,0.00; -,0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 5
    OnChange = edtIRRFChange
  end
  object edtFreteSite: TCurrencyEdit
    Left = 653
    Top = 271
    Width = 115
    Height = 27
    Color = clWhite
    Ctl3D = False
    DisplayFormat = ' ,0.00; -,0.00'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object edtFreteReversa: TCurrencyEdit
    Left = 653
    Top = 311
    Width = 115
    Height = 27
    Color = clWhite
    Ctl3D = False
    DisplayFormat = ' ,0.00; -,0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 7
    OnChange = edtFreteReversaChange
  end
  object edtRepasse: TCurrencyEdit
    Left = 653
    Top = 351
    Width = 115
    Height = 27
    Color = clWhite
    Ctl3D = False
    DisplayFormat = ' ,0.00; -,0.00'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object edtComissaoParceiro: TCurrencyEdit
    Left = 653
    Top = 30
    Width = 115
    Height = 27
    Color = clWhite
    Ctl3D = False
    DisplayFormat = ' ,0.00; -,0.00'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
  end
  object qry: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      'select   nf.data_saida, p.cod_repres, p.cancelado,  tnf.frete,'
      '       iif(nfr.status = '#39'100'#39','
      '       CAST(nf.data_saida as Date),'
      '       CAST(p.dt_despacho as Date)) dt_envio,'
      ''
      
        ' iif(nfr.status = '#39'100'#39', EXTRACT(DAY FROM nf.data_saida), EXTRAC' +
        'T(DAY FROM p.dt_despacho) )dia_pedido, c.razao cliente,'
      ''
      
        ' fp.descricao FPGTO, p.numpedido, p.comissao, (p.valor_total-tnf' +
        '.desconto+tnf.frete+tnf.seguro+tnf.outras_despesas) valor_total,'
      
        ' CAST( ( (p.valor_total-tnf.desconto+tnf.frete+tnf.seguro+tnf.ou' +
        'tras_despesas) * p.comissao / 100) as numeric(15,2))vlrComissao'
      
        ' from pedidos P                                                 ' +
        '                                                       '
      
        '       LEFT JOIN pedidos_faturados         PF  ON PF.CODIGO_PEDI' +
        'DO = P.CODIGO                                          '
      
        '       LEFT JOIN NOTAS_FISCAIS             NF  ON NF.codigo = PF' +
        '.codigo_nota_fiscal '
      
        '       LEFT JOIN notas_fiscais_nfe_retorno nfr ON nfr.codigo_not' +
        'a_fiscal = nf.codigo                                   '
      
        '       LEFT JOIN pessoas                   c   on p.cod_cliente ' +
        '= c.codigo                                             '
      
        '       LEFT JOIN formas_pgto               FP  on fp.codigo = p.' +
        'cod_forma_pag                                          '
      
        '       LEFT JOIN totais_notas_fiscais      tnf on tnf.codigo_not' +
        'a_fiscal = nf.codigo'
      ''
      
        ' where (( nfr.status = '#39'100'#39' and (CAST(nf.data_saida as Date) be' +
        'tween :dt_ini and :dt_fim) and p.cod_repres = :codRep)'
      '        OR'
      
        '             ( p.despachado = '#39'S'#39' and (CAST(p.dt_despacho as Dat' +
        'e) between :dt_ini and :dt_fim) and p.cod_repres = :codRep))'
      ''
      '        and not (p.cancelado = '#39'S'#39')'
      ''
      ' ORDER BY p.comissao')
    Left = 40
    Top = 192
    ParamData = <
      item
        Name = 'DT_INI'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Name = 'DT_FIM'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Name = 'CODREP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryDATA_SAIDA: TSQLTimeStampField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
    end
    object qryCOD_REPRES: TIntegerField
      FieldName = 'COD_REPRES'
      Origin = 'COD_REPRES'
    end
    object qryCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Origin = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qryDT_ENVIO: TDateField
      FieldName = 'DT_ENVIO'
      Origin = 'DT_ENVIO'
    end
    object qryDIA_PEDIDO: TSmallintField
      FieldName = 'DIA_PEDIDO'
      Origin = 'DIA_PEDIDO'
    end
    object qryCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 60
    end
    object qryFPGTO: TStringField
      FieldName = 'FPGTO'
      Origin = 'FPGTO'
      Size = 100
    end
    object qryNUMPEDIDO: TStringField
      FieldName = 'NUMPEDIDO'
      Origin = 'NUMPEDIDO'
      Size = 22
    end
    object qryCOMISSAO: TBCDField
      FieldName = 'COMISSAO'
      Origin = 'COMISSAO'
      DisplayFormat = ' ,0.00; -,0.00'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      DisplayFormat = ' ,0.00; -,0.00'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryVLRCOMISSAO: TBCDField
      FieldName = 'VLRCOMISSAO'
      Origin = 'VLRCOMISSAO'
      Precision = 18
      Size = 2
    end
    object qryFRETE: TBCDField
      FieldName = 'FRETE'
      Size = 2
    end
  end
  object ds: TDataSource
    DataSet = qry
    Left = 144
    Top = 192
  end
end
