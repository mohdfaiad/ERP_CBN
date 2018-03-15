inherited frmFechaComissaoRepresentante: TfrmFechaComissaoRepresentante
  Left = 0
  Top = 11
  Align = alClient
  BorderStyle = bsSingle
  Caption = 'Fechamento de Comiss'#227'o do Representante'
  ClientHeight = 683
  ClientWidth = 1148
  OldCreateOrder = True
  Position = poDefault
  OnShow = FormShow
  ExplicitTop = -1
  ExplicitWidth = 1154
  ExplicitHeight = 711
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 1293
    Top = 9
    Width = 89
    Height = 13
    Caption = 'M'#234's da comiss'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label6: TLabel
    Left = 1198
    Top = 9
    Width = 89
    Height = 13
    Caption = 'Ano da comiss'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label27: TLabel
    Left = 462
    Top = 9
    Width = 124
    Height = 13
    Caption = 'E-mail do representante'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label32: TLabel
    Left = 717
    Top = 8
    Width = 57
    Height = 13
    Caption = 'Data Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label33: TLabel
    Left = 838
    Top = 8
    Width = 52
    Height = 13
    Caption = 'Data Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RLReport1: TRLReport
    Left = 57
    Top = -37
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = dsQuinzena1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Visible = False
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
      Borders.Color = 13218951
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
      object rlMesAno: TRLLabel
        Left = 148
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
        Width = 140
        Height = 16
        Caption = 'Relat'#243'rio referente a:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 39
      Top = 247
      Width = 716
      Height = 109
      DataSource = dsComissoes1
      object RLBand5: TRLBand
        Left = 0
        Top = 22
        Width = 716
        Height = 23
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel11: TRLLabel
          Left = 4
          Top = 4
          Width = 87
          Height = 16
          Caption = 'Valor Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel12: TRLLabel
          Left = 100
          Top = 4
          Width = 65
          Height = 16
          Caption = 'Comiss'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 172
          Top = 4
          Width = 103
          Height = 16
          Caption = 'Valor Comiss'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 45
        Width = 716
        Height = 20
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.Color = 9211020
        object RLDBText8: TRLDBText
          Left = 81
          Top = 2
          Width = 106
          Height = 15
          Alignment = taCenter
          DataField = 'PERC_COMISSAO'
          DataSource = dsComissoes1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = -1
          Top = 2
          Width = 93
          Height = 15
          Alignment = taRightJustify
          DataField = 'TOTAL_PEDIDO'
          DataSource = dsComissoes1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText9: TRLDBText
          Left = 135
          Top = 2
          Width = 138
          Height = 15
          Alignment = taRightJustify
          DataField = 'TOTAL_PERCENTAGEM'
          DataSource = dsComissoes1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 65
        Width = 716
        Height = 37
        BandType = btColumnFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDraw5: TRLDraw
          Left = -2
          Top = -1
          Width = 718
          Height = 22
          Brush.Style = bsClear
          Pen.Color = 10197915
          Pen.Style = psDot
        end
        object RLDBResult2: TRLDBResult
          Left = 83
          Top = 2
          Width = 190
          Height = 16
          Alignment = taRightJustify
          DataField = 'TOTAL_PERCENTAGEM'
          DataSource = dsComissoes1
          Info = riSum
          Text = ''
        end
        object RLLabel14: TRLLabel
          Left = 61
          Top = 2
          Width = 105
          Height = 16
          Caption = 'Total Comiss'#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand8: TRLBand
        Left = 0
        Top = 0
        Width = 716
        Height = 22
        BandType = btTitle
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.Color = 13218951
        Color = 16116696
        ParentColor = False
        Transparent = False
        object RLLabel15: TRLLabel
          Left = 226
          Top = 1
          Width = 264
          Height = 18
          Alignment = taCenter
          Caption = 'TOTAIS DE COMISS'#195'O POR PERCENTAGEM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
    object RLGroup1: TRLGroup
      Left = 39
      Top = 138
      Width = 716
      Height = 109
      object RLBand4: TRLBand
        Left = 0
        Top = 65
        Width = 716
        Height = 35
        BandType = btColumnFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDraw3: TRLDraw
          Left = -1
          Top = -1
          Width = 718
          Height = 22
          Brush.Style = bsClear
          Pen.Color = 10197915
          Pen.Style = psDot
        end
        object RLDBResult1: TRLDBResult
          Left = 389
          Top = 3
          Width = 140
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR_TOTAL'
          DataSource = dsQuinzena1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4934475
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLLabel10: TRLLabel
          Left = 331
          Top = 3
          Width = 95
          Height = 16
          Caption = 'Total Pedidos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
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
        Borders.Color = 9211020
        object RLDBText1: TRLDBText
          Left = 3
          Top = 2
          Width = 62
          Height = 15
          DataField = 'DT_ENVIO'
          DataSource = dsQuinzena1
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
          DataSource = dsQuinzena1
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
          DataSource = dsQuinzena1
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
          DataSource = dsQuinzena1
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
          DataSource = dsQuinzena1
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
          DataSource = dsQuinzena1
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
        Borders.Color = 13218951
        Color = 16116696
        ParentColor = False
        Transparent = False
        object RLLabel16: TRLLabel
          Left = 291
          Top = 0
          Width = 134
          Height = 18
          Alignment = taCenter
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'PEDIDOS ENTREGUES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
    object RLSubDetail2: TRLSubDetail
      Left = 39
      Top = 356
      Width = 716
      Height = 113
      DataSource = dsDebCred1
      object RLBand10: TRLBand
        Left = 0
        Top = 22
        Width = 716
        Height = 23
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel17: TRLLabel
          Left = 5
          Top = 4
          Width = 32
          Height = 16
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel18: TRLLabel
          Left = 124
          Top = 4
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
        object RLLabel19: TRLLabel
          Left = 184
          Top = 4
          Width = 66
          Height = 16
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel29: TRLLabel
          Left = 45
          Top = 4
          Width = 53
          Height = 16
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand11: TRLBand
        Left = 0
        Top = 45
        Width = 716
        Height = 21
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.Color = 4737096
        object RLDBText12: TRLDBText
          Left = 57
          Top = 2
          Width = 92
          Height = 15
          DataField = 'NUM_PARCELA'
          DataSource = dsDebCred1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText10: TRLDBText
          Left = 130
          Top = 2
          Width = 42
          Height = 15
          Alignment = taRightJustify
          DataField = 'VALOR'
          DataSource = dsDebCred1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText11: TRLDBText
          Left = 1
          Top = 2
          Width = 30
          Height = 15
          Alignment = taJustify
          DataField = 'TIPO'
          DataSource = dsDebCred1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBMemo1: TRLDBMemo
          Left = 184
          Top = 2
          Width = 529
          Height = 14
          Behavior = [beSiteExpander]
          DataField = 'DESCRICAO'
          DataSource = dsDebCred1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand12: TRLBand
        Left = 0
        Top = 66
        Width = 716
        Height = 37
        BandType = btColumnFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDraw7: TRLDraw
          Left = -2
          Top = -1
          Width = 718
          Height = 24
          Brush.Style = bsClear
          Pen.Color = 10197915
          Pen.Style = psDot
        end
        object RLLabel20: TRLLabel
          Left = 5
          Top = 4
          Width = 109
          Height = 16
          Caption = 'Saldo Parcela 1:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel32: TRLLabel
          Left = 237
          Top = 4
          Width = 109
          Height = 16
          Caption = 'Saldo Parcela 2:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbSaldoP2: TRLLabel
          Left = 349
          Top = 4
          Width = 29
          Height = 16
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lbSaldoP1: TRLLabel
          Left = 117
          Top = 4
          Width = 29
          Height = 16
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand13: TRLBand
        Left = 0
        Top = 0
        Width = 716
        Height = 22
        BandType = btTitle
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.Color = 13218951
        Color = 16116696
        ParentColor = False
        Transparent = False
        object RLLabel21: TRLLabel
          Left = 217
          Top = 1
          Width = 282
          Height = 18
          Alignment = taCenter
          Caption = 'D'#201'BITOS E/OU CR'#201'DITOS DO REPRESENTANTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
    object RLBand14: TRLBand
      Left = 39
      Top = 469
      Width = 716
      Height = 111
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.Color = 12570301
      object RLDraw6: TRLDraw
        Left = 361
        Top = 78
        Width = 97
        Height = 33
        Brush.Color = 14539739
        Color = clWhite
        ParentColor = False
        Pen.Style = psClear
        Transparent = False
      end
      object RLDraw4: TRLDraw
        Left = -1
        Top = 78
        Width = 97
        Height = 33
        Brush.Color = 14539739
        Color = clWhite
        ParentColor = False
        Pen.Style = psClear
        Transparent = False
      end
      object RLLabel28: TRLLabel
        Left = -8
        Top = 67
        Width = 732
        Height = 16
        Alignment = taCenter
        Caption = 
          '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
          '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
          '- - - - - - - - - - - - - - - - - - - - - - - - - - - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw2: TRLDraw
        Left = -1
        Top = 22
        Width = 721
        Height = 24
        Brush.Style = bsClear
        Color = clWhite
        ParentColor = False
        Pen.Color = 10790052
        Transparent = False
      end
      object RLDraw1: TRLDraw
        Left = -4
        Top = 3
        Width = 721
        Height = 23
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.Color = 12570301
        Brush.Color = 15266276
        Color = clWhite
        ParentColor = False
        Pen.Color = 11124134
        Transparent = False
      end
      object RLLabel22: TRLLabel
        Left = 334
        Top = 6
        Width = 50
        Height = 16
        Alignment = taCenter
        Caption = 'SALDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel23: TRLLabel
        Left = 87
        Top = 27
        Width = 101
        Height = 16
        Caption = 'Total Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel24: TRLLabel
        Left = 244
        Top = 27
        Width = 81
        Height = 16
        Caption = 'Total D'#233'bito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel25: TRLLabel
        Left = 381
        Top = 27
        Width = 86
        Height = 16
        Caption = 'Total Cr'#233'dito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel26: TRLLabel
        Left = 525
        Top = 27
        Width = 90
        Height = 16
        Caption = 'Total a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTotComissao: TRLLabel
        Left = 151
        Top = 51
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTotDebito: TRLLabel
        Left = 288
        Top = 51
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTotCredito: TRLLabel
        Left = 432
        Top = 51
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTotPagar: TRLLabel
        Left = 581
        Top = 51
        Width = 32
        Height = 18
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel30: TRLLabel
        Left = 3
        Top = 87
        Width = 85
        Height = 16
        Caption = '1'#170' PARCELA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel31: TRLLabel
        Left = 364
        Top = 87
        Width = 85
        Height = 16
        Caption = '2'#170' PARCELA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDataParcela1: TRLLabel
        Left = 141
        Top = 87
        Width = 68
        Height = 16
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object lbDataParcela2: TRLLabel
        Left = 501
        Top = 87
        Width = 68
        Height = 16
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel33: TRLLabel
        Left = 220
        Top = 87
        Width = 42
        Height = 16
        Caption = 'Valor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lbValorParcela1: TRLLabel
        Left = 264
        Top = 87
        Width = 29
        Height = 16
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object lbValorParcela2: TRLLabel
        Left = 624
        Top = 87
        Width = 29
        Height = 16
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel34: TRLLabel
        Left = 102
        Top = 87
        Width = 37
        Height = 16
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel35: TRLLabel
        Left = 580
        Top = 87
        Width = 42
        Height = 16
        Caption = 'Valor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel36: TRLLabel
        Left = 462
        Top = 87
        Width = 37
        Height = 16
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand30: TRLBand
      Left = 39
      Top = 580
      Width = 716
      Height = 39
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel58: TRLLabel
        Left = 7
        Top = 2
        Width = 89
        Height = 16
        Caption = 'Observa'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlObservacoes1: TRLMemo
        Left = 5
        Top = 18
        Width = 676
        Height = 16
        Behavior = [beSiteExpander]
      end
    end
  end
  inline BuscaPessoa1: TBuscaPessoa
    Left = 18
    Top = 9
    Width = 432
    Height = 38
    AutoSize = True
    TabOrder = 0
    OnExit = BuscaPessoa1Exit
    ExplicitLeft = 18
    ExplicitTop = 9
    ExplicitWidth = 432
    inherited edtCodigo: TCurrencyEdit
      Width = 52
      ExplicitWidth = 52
    end
    inherited StaticText2: TStaticText
      Left = 83
      Width = 79
      Caption = 'Representante'
      Visible = False
      ExplicitLeft = 83
      ExplicitWidth = 79
    end
    inherited btnBuscar: TBitBtn
      Left = 53
      ExplicitLeft = 53
    end
    inherited edtRazao: TEdit
      Left = 82
      Width = 350
      Height = 23
      ExplicitLeft = 82
      ExplicitWidth = 350
      ExplicitHeight = 23
    end
  end
  object cbMes: TComboBox
    Left = 1293
    Top = 24
    Width = 145
    Height = 23
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 2
    Text = '<SELECIONE O M'#202'S>'
    Visible = False
    Items.Strings = (
      '<SELECIONE O M'#202'S>'
      'JANEIRO'
      'FEVEREIRO'
      'MAR'#199'O'
      'ABRIL'
      'MAIO'
      'JUNHO'
      'JULHO'
      'AGOSTO'
      'SETEMBRO'
      'OUTUBRO'
      'NOVEMBRO'
      'DEZEMBRO')
  end
  object PageControl1: TPageControl
    Left = 10
    Top = 59
    Width = 1128
    Height = 581
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    object TabSheet1: TTabSheet
      Caption = 'Dados para o c'#225'lculo da comiss'#227'o'
      DesignSize = (
        1120
        551)
      object Label26: TLabel
        Left = 914
        Top = 308
        Width = 79
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Total Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object gridQuinzena1: TDBGridCBN
        Left = 7
        Top = 8
        Width = 1106
        Height = 294
        Hint = 'Duplo clique abre visualiza'#231#227'o do pedido'
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = 14803425
        DataSource = dsQuinzena1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = gridQuinzena1DblClick
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
        TipoBusca.ListarApenasEncontrados = True
        TipoBusca.QualquerParte = True
        SalvaConfiguracoes = False
        Columns = <
          item
            Expanded = False
            FieldName = 'DT_ENVIO'
            Title.Caption = 'Faturado em:'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMPEDIDO'
            Title.Caption = 'N'#186' Pedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE'
            Title.Caption = 'Cliente'
            Width = 358
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FPGTO'
            Title.Caption = 'Forma de Pagamento'
            Width = 256
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Alignment = taCenter
            Title.Caption = 'Valor L'#237'q. do Pedido'
            Width = 107
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'COMISSAO'
            Title.Alignment = taCenter
            Title.Caption = 'Comiss'#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLRCOMISSAO'
            Title.Alignment = taCenter
            Title.Caption = 'Valor Comiss'#227'o'
            Width = 91
            Visible = True
          end>
      end
      object gpbDebCred: TGroupBox
        Left = 330
        Top = 308
        Width = 505
        Height = 241
        Anchors = [akRight, akBottom]
        Caption = ' D'#233'bito / Cr'#233'dito (Representante) '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label12: TLabel
          Left = 10
          Top = 104
          Width = 480
          Height = 14
          Caption = 
            '________________________________________________________________' +
            '________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12895940
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnRemover: TSpeedButton
          Left = 397
          Top = 208
          Width = 97
          Height = 25
          Caption = ' Remover'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Glyph.Data = {
            36080000424D3608000000000000360000002800000020000000100000000100
            2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00B6B5DF006563C7001C19B500130EBB00130EBB001C19
            B5006563C700B6B5DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B0052517B00010063000000510000005700000057000000
            51000100630052517B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
            FF00F7F6FC004845B9000F0BD500130FF4001611FF001611FF001611FF001611
            FF00130FF4000F0BD5004845B900F7F6FC00FFFFFF00FFFFFF009B9B9B009B9B
            9B009392980000005500000071000000900000009B0000009B0000009B000000
            9B00000090000000710000005500939298009B9B9B009B9B9B00FFFFFF00F8F8
            FD00221FB9001512F2001816FE001615F4001614EF001514EF001514EF001614
            EF001615F4001816FE001512F200221FB900F8F8FD00FFFFFF009B9B9B009494
            99000000550000008E0000009A000000900000008B0000008B0000008B000000
            8B000000900000009A0000008E0000005500949499009B9B9B00FFFFFF004D49
            C8001719F2001A1DF900181BF000181BF100181BF100181BF100181BF100181B
            F100181BF100181BF0001A1DF9001719F2004D49C800FFFFFF009B9B9B000000
            640000008E000000950000008C0000008D0000008D0000008D0000008D000000
            8D0000008D0000008C000000950000008E00000064009B9B9B00BAB8EB001417
            DF001C26FB001A22F0001B22F1001B22F1001B22F1001B22F1001B22F1001B22
            F1001B22F1001B22F1001A22F0001C26FB001417DF00BAB8EC00565487000000
            7B000000970000008C0000008D0000008D0000008D0000008D0000008D000000
            8D0000008D0000008D0000008C000000970000007B00565488006865DD001E2A
            F5001827F5000512F0000412F0000412F0000412F0000412F0000412F0000412
            F0000412F0000412F0000512F0001827F5001E2AF5006B67DD00040179000000
            91000000910000008C0000008C0000008C0000008C0000008C0000008C000000
            8C0000008C0000008C0000008C000000910000009100070379003331DC001328
            FB002125D0007573D9007171DA006F6FDA006F6FDA006F6FDA006F6FDA006F6F
            DA006F6FDA007171DA007573D9002225D0001930FC002826D700000078000000
            970000006C00110F75000D0D76000B0B76000B0B76000B0B76000B0B76000B0B
            76000B0B76000D0D7600110F750000006C0000009800000073005858E7001937
            F7003E3FE100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF004848E1000F2FF900191AD900000083000000
            930000007D009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B0000007D0000009500000075005452EC005473
            F9005C5CEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF004041EC00092AF8002021D60000008800000F
            950000008B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B000000880000009400000072005D58ED005A77
            F9006E71F700D8D6FD00D4D6FB00C4C3FB00B3B4FA00B3B5FB00B4B5FB00B4B5
            FB00B4B5FB00B6B7FB00BEBCFC004347F7004460F1005D58E000000089000013
            95000A0D93007472990070729700605F97004F5096004F519700505197005051
            970050519700525397005A5898000000930000008D0000007C008C84F3007084
            FA005B7DF700516EF600526EF600536EF6004E6AF5003E5CF4003756F4003755
            F4003757F4004160F400516CF7006283FC007287EC008A83EA0028208F000C20
            960000199300000A9200000A9200000A92000006910000009000000090000000
            9000000090000000900000089300001F98000E238800261F8600C9C6F9005E5D
            F40080A1FA005D7BF7006480F7006682F7006682F7006985F7006B87F7006B87
            F7006B87F7006884F7005E7CF70081A2FF005456D500C9C6F900656295000000
            90001C3D960000179300001C9300021E9300021E930005219300072393000723
            93000723930004209300001893001D3E9B000000710065629500FFFFFF007169
            F3007D86F80087A6FA00617FF7006783F7006B85F7006A86F7006985F7006985
            F7006683F600617FF60089A7FF00707ADE006E66E900FFFFFF009B9B9B000D05
            8F001922940023429600001B9300031F93000721930006229300052193000521
            9300021F9200001B920025439B000C167A000A0285009B9B9B00FFFFFF00FAF9
            FF004F42F2008087F6009DBCFB007F9FFB006D8BF8006D89F8006D89F8006D8B
            FA00809FFC00A0BEFD007984E300473EDC00FAF9FF00FFFFFF009B9B9B009695
            9B0000008E001C239200395897001B3B97000927940009259400092594000927
            96001C3B98003C5A990015207F000000780096959B009B9B9B00FFFFFF00FFFF
            FF00F9F9FF006F67F5006160F10094A3F400A2B9F900A2BBFA00A2BCFA00A2B8
            F70092A2EF005C5BDF006C65EC00F9F9FF00FFFFFF00FFFFFF009B9B9B009B9B
            9B0095959B000B03910000008D00303F90003E5595003E5796003E5896003E54
            93002E3E8B0000007B000801880095959B009B9B9B009B9B9B00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00C7C4FC008680F5005F5AEF005B58EC005A58EB005C57
            EB00857EF100C7C4FB00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B0063609800221C910000008B0000008800000087000000
            8700211A8D00636097009B9B9B009B9B9B009B9B9B009B9B9B00}
          NumGlyphs = 2
          ParentFont = False
          OnClick = btnRemoverClick
        end
        object btnAlterar: TSpeedButton
          Left = 397
          Top = 156
          Width = 97
          Height = 25
          Caption = ' Alterar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Glyph.Data = {
            36080000424D3608000000000000360000002800000020000000100000000100
            2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00102F
            940026368C00C2D8F400BDD6F600E6E9F700FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B000000
            3000000028005E74900059729200828593009B9B9B009B9B9B009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF008A92
            C300273984006BCEF90046AEF100215FC900B8BEE400FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B00262E
            5F0000002000076A9500004A8D0000006500545A80009B9B9B009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00C0C9
            E700B4D8F300E0FFFF0074E3FF001591E600054EC400B1BCE400FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B005C65
            830050748F007C9B9B00107F9B00002D8200000060004D5880009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00D0DB
            F100A7BAE500E1FFFF0014C3FB000189E4001279DC000E64CF00B7C2E800FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B006C77
            8D00435681007D9B9B00005F9700002580000015780000006B00535E84009B9B
            9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FBFB
            FB004966C50054FAFC0000EBFE0004C4FC001292E6001176DB00156AD200B0BB
            E600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009797
            9700000261000096980000879A0000609800002E82000012770000066E004C57
            82009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FCFC
            FD00B1B7E300177BCE0024FFFF0000EAFC0002C5FC001192E6001077D900186E
            D200B3BFE800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009898
            99004D537F0000176A00009B9B000086980000619800002E820000137500000A
            6E004F5B84009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
            FF00FFFFFF00AEAFE1002D84D30024FCFD0000E8FC0001C5FB001193E6001076
            D800196FD700B1BFEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
            9B009B9B9B004A4B7D0000206F00009899000084980000619700002F82000012
            7400000B73004D5B86009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00AAA8E1003386D40024FAFB0000E7FB0002C5FB001191
            E6001073D8001771D600AFC6F100FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B0046447D0000227000009697000083970000619700002D
            8200000F7400000D72004B628D009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00ABABE2004B9EDD002CFFFC0000E5F90002C4
            FB001394E7000978E2000350BF00BBCBEA00FFFFFF00FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B0047477E00003A7900009B9800008195000060
            97000030830000147E0000005B00576786009B9B9B009B9B9B00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AFADE50057A8E1002CFFFD0000E8
            FA0002D3FF000065C5008F95A0008EA1C300AFC1E900FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B009B9B9B004B49810000447D00009B99000084
            9600006F9B00000161002B313C002A3D5F004B5D85009B9B9B00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BAB7E90056ABE30029FF
            FF0000BFD50087ABBC00F7EBD2005751C5000527DC00FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B005653850000477F00009B
            9B00005B71002347580093876E0000006100000078009B9B9B00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9BCEE003C9A
            D50097E2CA00F4E7DA00423EBD000000EE000B21F100FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B0055588A000036
            7100337E6600908376000000590000008A0000008D009B9B9B00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B7C1
            EF008DA4D400649CCA000044F0000A21F800A7AFF600FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00535D
            8B00294070000038660000008C0000009400434B92009B9B9B00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00B0BDEB002988E3003096F600B3C7F800FFFFFF00FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
            9B004C59870000247F00003292004F6394009B9B9B009B9B9B00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00}
          NumGlyphs = 2
          ParentFont = False
          OnClick = btnAlterarClick
        end
        object gridDebCred1: TDBGridCBN
          Left = 11
          Top = 131
          Width = 374
          Height = 100
          Color = 14803425
          DataSource = dsDebCred1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
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
          OnEnter = gridDebCred1Enter
          OnExit = gridDebCred1Exit
          BuscaHabilitada = False
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
              FieldName = 'TIPO'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_PARCELA'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' PARCELA'
              Width = 73
              Visible = True
            end>
        end
        object btnIncluir: TBitBtn
          Left = 397
          Top = 130
          Width = 97
          Height = 25
          Caption = ' Incluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Glyph.Data = {
            36080000424D3608000000000000360000002800000020000000100000000100
            2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00BBE4C20070CF850027B747001EBA40001EBA400027B7
            470070CF8500BBE4C200FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B0057805E000C6B21000053000000560000005600000053
            00000C6B210057805E009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
            FF00FAFDFA004FB9620019C140001FCE4C0024DC580027DD5C0027DD5C0024DC
            58001FCE4C0019C140004FB96200FAFDFA00FFFFFF00FFFFFF009B9B9B009B9B
            9B009699960000550000005D0000006A00000078000000790000007900000078
            0000006A0000005D000000550000969996009B9B9B009B9B9B00FFFFFF00FBFD
            FB0021A93A001ED04E0022D5550021D3550003B82C0000A7120000A7120003B8
            2C0021D3550022D555001ED04E0021A93A00FBFDFB00FFFFFF009B9B9B009799
            970000450000006C000000710000006F00000054000000430000004300000054
            0000006F000000710000006C000000450000979997009B9B9B00FFFFFF004EB1
            5B001ECE4D0021D354001FCC4D000FCC450000AD1300FFFFFF00FFFFFF0000AD
            13000FCC45001FCC4D0021D354001ECE4D004EB15B00FFFFFF009B9B9B00004D
            0000006A0000006F00000068000000680000004900009B9B9B009B9B9B000049
            00000068000000680000006F0000006A0000004D00009B9B9B00BDDEBE0017BA
            3F0021DA5A001ECC510020D053000DC7420000BE2500FFFFFF00FFFFFF0000BE
            25000DC7420020D053001ECC510021DA5A0017BA3F00BDDEBE00597A5A000056
            00000076000000680000006C000000630000005A00009B9B9B009B9B9B00005A
            000000630000006C0000006800000076000000560000597A5A006ABC740017D1
            510020D45F000BCC4A0004CA430000C1330000BC2200FFFFFF00FFFFFF0000BD
            270000C23B0010CA4B000ECC4C0020D45F0017D151006ABC740006581000006D
            0000007000000068000000660000005D0000005800009B9B9B009B9B9B000059
            0000005E0000006600000068000000700000006D00000658100030A03F0033E6
            7A0000B62D0000AD130000AD130000AD130000AD1300FFFFFF00FFFFFF0000AD
            130000BD270000BD230000AD130000B62D0033E67A0030A14100003C00000082
            160000520000004900000049000000490000004900009B9B9B009B9B9B000049
            00000059000000590000004900000052000000821600003D000030A3430081FC
            C30000AF2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000AF210081FCC40030A14200003F00001D98
            5F00004B00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B00004B00001D986000003D00002395370085FD
            CC002AC26200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF002AC2620085FDCC0023953500003100002199
            6800005E00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B00005E0000219968000031000033933D007BFA
            C3003CD07D0071C780001EBF590021C05B000ABA4D00FFFFFF00FFFFFF0010BC
            510022C05C001EBF590071C780003CD07D007BFAC30033933D00002F00001796
            5F00006C19000D631C00005B0000005C0000005600009B9B9B009B9B9B000058
            0000005C0000005B00000D631C00006C190017965F00002F000067AB66008AE5
            B90065EAB00050DF970056DF9C0041DB8D0022C05C00FFFFFF00FFFFFF0022C0
            5C0049DC930056DF9C0050DF970065EAB0008AE5B90067AB6600034702002681
            550001864C00007B3300007B380000772900005C00009B9B9B009B9B9B00005C
            000000782F00007B3800007B330001864C002681550003470200B9D4B9004EB0
            6800AFFFEA005EE0A10056E19F0045DE970066D58900FFFFFF00FFFFFF0023C0
            5B0050E09E0056E19F005EE0A100AFFFEA004EB06800B9D4B90055705500004C
            04004B9B8600007C3D00007D3B00007A3300027125009B9B9B009B9B9B00005C
            0000007C3A00007D3B00007C3D004B9B8600004C040055705500FFFFFF004589
            45007BDCA800B6FFEF0076E5B50051DFA30066D58900FFFFFF00FFFFFF0024BF
            590056E2A80076E5B500B6FFEF007BDCA80045894500FFFFFF009B9B9B000025
            000017784400529B8B0012815100007B3F00027125009B9B9B009B9B9B00005B
            0000007E440012815100529B8B0017784400002500009B9B9B00FFFFFF00FAFD
            FA00157215006DD6A300B7FFF500AAF7E30070E0B00022C05C0022C05C0074E2
            B300ABF7E400B7FFF5006DD6A30015721500FAFDFA00FFFFFF009B9B9B009699
            9600000E000009723F00539B910046937F000C7C4C00005C0000005C0000107E
            4F0047938000539B910009723F00000E0000969996009B9B9B00FFFFFF00FFFF
            FF00F9FCF9004586450038A75E007FE1B800A9FFEC00B9FFFB00B9FFFB00A9FF
            EC007FE1B80038A75E0045864500F9FCF900FFFFFF00FFFFFF009B9B9B009B9B
            9B009598950000220000004300001B7D5400459B8800559B9700559B9700459B
            88001B7D54000043000000220000959895009B9B9B009B9B9B00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00B7CEB70067A56700247D33002887380028873800247D
            330067A56700B7CEB700FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B00536A5300034103000019000000230000002300000019
            000003410300536A53009B9B9B009B9B9B009B9B9B009B9B9B00}
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 1
          OnClick = btnIncluirClick
        end
        object btnCancelar: TBitBtn
          Left = 397
          Top = 182
          Width = 97
          Height = 25
          Caption = ' Cancelar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Glyph.Data = {
            36080000424D3608000000000000360000002800000020000000100000000100
            2000000000000008000000000000000000000000000000000000FFFFFF00DFDF
            F0009594CB00C6C6E000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF002322BE007F7EBA00FFFFFF009B9B9B007B7B
            8C003130670062627C009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
            9B009B9B9B009B9B9B009B9B9B0000005A001B1A56009B9B9B00ECECF4001410
            C100110EFF000B09DD00A5A5C300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF006665B100110CFC007D7CAF00FFFFFF00888890000000
            5D0000009B000000790041415F009B9B9B009B9B9B009B9B9B009B9B9B009B9B
            9B009B9B9B009B9B9B0002014D000000980019184B009B9B9B00B7B6DB00110F
            DF000E0CFC00100EFF00110FB600F4F4F700FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00D2D2E2000D0CDC000D0BD600D6D6E600FFFFFF00535277000000
            7B000000980000009B0000005200909093009B9B9B009B9B9B009B9B9B009B9B
            9B009B9B9B006E6E7E000000780000007200727282009B9B9B00C7C7E0002524
            D7000F0EFB000E0EEF000F0FFA007271BB00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00F7F7FB001B19BF001313FF00201EA600FFFFFF00FFFFFF0063637C000000
            73000000970000008B00000096000E0D57009B9B9B009B9B9B009B9B9B009B9B
            9B009393970000005B0000009B00000042009B9B9B009B9B9B00FFFFFF003C3B
            B3002627FF00090AEE001214FA000F10DB00DDDDEE00FFFFFF00FFFFFF00FFFF
            FF004F4EC5001416FF001112E5009F9FCE00FFFFFF00FFFFFF009B9B9B000000
            4F0000009B0000008A00000096000000770079798A009B9B9B009B9B9B009B9B
            9B000000610000009B00000081003B3B6A009B9B9B009B9B9B00FFFFFF00E0E0
            F000272BC600252CFE000D0EEE00161CFE003232CC00FFFFFF00FFFFFF006969
            D600181DF900191EFE002121C000FFFFFF00FFFFFF00FFFFFF009B9B9B007C7C
            8C000000620000009A0000008A0000009A00000068009B9B9B009B9B9B000505
            72000000950000009A0000005C009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
            FF00ABAAE100393FE0002531FA00121CF6001B25F6009492E1008988E3001D26
            F7001E2BFF00151BE200C3C2E900FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
            9B0047467D0000007C00000096000000920000009200302E7D0025247F000000
            930000009B0000007E005F5E85009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
            FF00FFFFFF00726FD8004C57F6002839F8001B2DF7001F29EE002131F6002236
            F9001F2FF2006B68DD00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
            9B009B9B9B000E0B740000009200000094000000930000008A00000092000000
            950000008E00070479009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00615FDC005261F500293CF600253AF800263AF7002638
            F6003C3ADE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B0000007800000091000000920000009400000093000000
            920000007A009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF008B8BEC002939F1002F45F8002338F600253EF8001F28
            EA00E3E1FB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
            9B009B9B9B009B9B9B002727880000008D000000940000009200000094000000
            86007F7D97009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
            FF00C1C0FA00353FF000314CF9002B46F800253FF6004E69F900536EF9002341
            F6004A4FF000F3F3FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
            9B005D5C960000008C0000009500000094000000920000059500000A95000000
            920000008C008F8F9A009B9B9B009B9B9B009B9B9B009B9B9B00F9F9FF005D60
            F400314CF6003656F8002F4AF600304FF600516EF9003D3FF200555CF4006B8A
            FA00385EF8002833F300D5D3FC00FFFFFF00FFFFFF00FFFFFF0095959B000000
            900000009200000094000000920000009200000A950000008E00000090000726
            96000000940000008F00716F98009B9B9B009B9B9B009B9B9B005A5FF5003B61
            F8003A5AF7003150F7003D5FF700637DFA004042F600E9E8FD00CAC8FB003F40
            F500778EFA006389FA002D45F5009696FA00FFFFFF00FFFFFF00000091000000
            9400000093000000930000009300001996000000920085849900666497000000
            9100132A96000025960000009100323296009B9B9B009B9B9B004755F8004F76
            F8003E61F8005679F8006279F9005955F700F7F6FF00FFFFFF00FFFFFF00F0EF
            FF00726DF700525AF8007F9CFA006B89FA005661F700D4D3FD00000094000012
            94000000940000159400001595000000930093929B009B9B9B009B9B9B008C8B
            9B000E099300000094001B3896000725960000009300706F99006462F600697B
            F9006C82F9005055F6008984F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00DBDAFD006561F6005455F7006B7EF8004A4FF700000092000517
            9500081E950000009200252095009B9B9B009B9B9B009B9B9B009B9B9B009B9B
            9B009B9B9B00777699000100920000009300071A940000009300B9B7FB005353
            F6005C5FF7006763F600F5F5FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00E4E3FE009E9BF9006566F6006D6CF700555397000000
            9200000093000300920091919B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
            9B009B9B9B009B9B9B00807F9A003A3795000102920009089300}
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
          OnClick = btnCancelarClick
        end
        object pnlDados: TPanel
          Left = 8
          Top = 16
          Width = 489
          Height = 97
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 3
          object Label10: TLabel
            Left = 2
            Top = 50
            Width = 49
            Height = 13
            Caption = 'Descri'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 113
            Top = 7
            Width = 87
            Height = 13
            Caption = 'Tipo Lan'#231'amento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 2
            Top = 7
            Width = 27
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 225
            Top = 7
            Width = 90
            Height = 13
            Caption = 'Parcela destinada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object memoDescricao: TMemo
            Left = 57
            Top = 49
            Width = 376
            Height = 43
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnKeyPress = memoDescricaoKeyPress
          end
          object cbTipo: TComboBox
            Left = 113
            Top = 22
            Width = 92
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            TabOrder = 1
            Text = '<selecione>'
            Items.Strings = (
              '<selecione>'
              'D'#233'bito'
              'Cr'#233'dito')
          end
          object edtValor: TCurrencyEdit
            Left = 2
            Top = 22
            Width = 91
            Height = 21
            AutoSize = False
            Color = clWhite
            Ctl3D = True
            DisplayFormat = ' ,0.00; -,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
          end
          object btnOK: TBitBtn
            Left = 441
            Top = 25
            Width = 47
            Height = 49
            Caption = 'OK'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            Glyph.Data = {
              36080000424D3608000000000000360000002800000020000000100000000100
              2000000000000008000000000000000000000000000000000000C1761B00C275
              1900BD6B1300B9650400B9650400B9650400BA650400BA650400BA650400BA65
              0400BA650400BA650400BA650400BC690A00B96A1500C3791F005D1200005E11
              0000590700005501000055010000550100005601000056010000560100005601
              000056010000560100005601000058050000550600005F150000D5933D00EFB7
              3600CDC6C000E9F8FF00DBE5F600DBE8F800DBE8F800DBE8F900DBE8F800DAE7
              F800DBE7F800D8E4F500E9F6FF00CDC6C000EAA71400C0761D00712F00008B53
              000069625C0085949B0077819200778494007784940077849500778494007683
              9400778394007480910085929B0069625C00864300005C120000CD955100E8AE
              3C00DCD7D400ECE8E900ADA0A200A79B9E009E93950094898C008A8185008379
              7C007B727600685F6400ECE8E900DCD7D400E59E2000C77B250069310000844A
              00007873700088848500493C3E0043373A003A2F310030252800261D21001F15
              1800170E1200040000008884850078737000813A000063170000D0965300EAB4
              4700DCD7D400EFF0EF00DFDEDC00E1E0DF00E0DFDE00DFE0DD00E0DFDD00DFDE
              DD00DFE0DE00DBD9D900EDEDED00DCD7D400E7A62B00C9802B006C3200008650
              0000787370008B8C8B007B7A78007D7C7B007C7B7A007B7C79007C7B79007B7A
              79007B7C7A0077757500898989007873700083420000651C0000D49B5800EBB9
              5000DCD7D400ECE8E900A99D9F00A4999E009A91940092888B00897F85008279
              7C007A717700655C6200ECE8E900DCD7D400E8AC3700CC853100703700008755
              0000787370008884850045393B0040353A00362D30002E242700251B21001E15
              1800160D13000100000088848500787370008448000068210000D69E5B00EDBD
              5A00DCD7D400FFFFFF00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00DCD7D400EAB34000D08B3400723A00008959
              0000787370009B9B9B009B9A9A009B9B9B009B9B9B009B9B9B009B9B9B009B9B
              9B009B9B9B009B9B9B009B9B9B0078737000864F00006C270000D9A45E00F0C2
              6300DCD7D400ECE8E900A99D9F00A4999E009A91940092888B00897F85008279
              7C007A717700655C6200ECE8E900DCD7D400EDB74900D2903A00754000008C5E
              0000787370008884850045393B0040353A00362D30002E242700251B21001E15
              1800160D1300010000008884850078737000895300006E2C0000D8A35C00F0C6
              6D00DCD7D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00DCD7D400EEBD5400D7963E00743F00008C62
              0900787370009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
              9B009B9B9B009B9B9B009B9B9B00787370008A59000073320000DEAC6900F9D2
              8100C1975C009A7B600095775E0097795D0097795D0097795D0097795D009779
              5C0097795C0095775E009A7A5E00C19A6400F7CA6B00D99B44007A480500956E
              1D005D3300003617000031130000331500003315000033150000331500003315
              00003315000031130000361600005D3600009366070075370000DDAB6700F6D5
              8B00FFD05600C0A88700C8C5C900CEC6BF00CDC6C000CDC6C000CDC6BF00D6D0
              CA00D6D3D000CFCED400C0A88800FFD25D00F3CC7500DCA14800794703009271
              27009B6C00005C442300646165006A625B0069625C0069625C0069625B00726C
              6600726F6C006B6A70005C4424009B6E00008F681100783D0000DCA96600F6D9
              9300FBC85D00C2B4A200D7DEEB00DDDDDD00DCDDDE00DCDBDD00E7E8EA00C8BA
              A700A2969200C2B4A200C6BCA900FBCB6300F3D07E00E0A74C00784502009275
              2F00976400005E503E00737A87007979790078797A0078777900838486006456
              43003E322E005E503E0062584500976700008F6C1A007C430000E5B97300F6DA
              9700FBCC6200C8BAA700DDE0E900E1DFDD00E0DFDE00DFDDDC00EFF3F9009F88
              6F00E5AF47009E918900C7BDB200FDCF6A00F5D48400E3AC510081550F009276
              33009768000064564300797C85007D7B79007C7B7A007B7978008B8F95003B24
              0B00814B00003A2D250063594E00996B0600917020007F480000E9BC7500F8DD
              9E00FDCF6900CEC0AF00E3E7EF00E7E5E300E6E5E400E5E4E200F1F6FF00BAA3
              8600FFE87300B5AB9E00CAC0B800FFD26E00F9DA8E00E7B25B00855811009479
              3A00996B05006A5C4B007F838B0083817F008281800081807E008D929B00563F
              22009B840F0051473A00665C54009B6E0A0095762A00834E0000EAC07900F8E0
              9B00FBD16500D3C4AF00EAEEF600ECEBE800ECEBE900EBE9E600FBFFFF00A28E
              7800DEAF4F00A89C9500D1C7B900FFDA7800F5D88900E2A44200865C1500947C
              3700976D01006F604B00868A9200888784008887850087858200979B9B003E2A
              14007A4B0000443831006D6355009B761400917425007E400000ECC47E00FEF4
              D500FFE29000DCD7D400F5FFFF00F6FEFF00F6FEFF00F6FDFF00FFFFFF00DFDD
              DC00C8BAA700DFDDDC00E5E4E200FFDE8800E4AA4500FCF5EC0088601A009A90
              71009B7E2C0078737000919B9B00929A9B00929A9B0092999B009B9B9B007B79
              7800645643007B79780081807E009B7A24008046000098918800ECC68100F0CA
              8200F4CA7D00E8C78800EFCF9400EFD49800EDCF9200EED09200EED09300F2D3
              9600F7D79B00F6D69B00E6C48A00EBB55200FDF9F200FFFFFF0088621D008C66
              1E0090661900846324008B6B30008B703400896B2E008A6C2E008A6C2F008E6F
              32009373370092723700826026008751000099958E009B9B9B00}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 3
            OnClick = btnOKClick
          end
          object cbParcelaDestino: TComboBox
            Left = 225
            Top = 22
            Width = 92
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            TabOrder = 4
            Text = '<selecione>'
            Items.Strings = (
              '<selecione>'
              '1'#170' Parcela'
              '2'#170' Parcela')
          end
        end
      end
      object GroupBox7: TGroupBox
        Left = 843
        Top = 308
        Width = 270
        Height = 241
        Anchors = [akRight, akBottom]
        Caption = ' S A L D O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label17: TLabel
          Left = 24
          Top = 28
          Width = 88
          Height = 13
          Caption = 'Total Comiss'#227'o >'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 24
          Top = 60
          Width = 89
          Height = 13
          Caption = 'Total D'#233'bito      >'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 24
          Top = 92
          Width = 89
          Height = 13
          Caption = 'Total Cr'#233'dito     >'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 24
          Top = 127
          Width = 89
          Height = 13
          Caption = 'Saldo Total        >'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 4
          Top = 164
          Width = 261
          Height = 13
          Caption = '-- Datas previstas para pagamento --------------------'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6049328
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 8
          Top = 191
          Width = 34
          Height = 13
          Caption = 'Parc 1:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4144959
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 8
          Top = 218
          Width = 34
          Height = 13
          Caption = 'Parc 2:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4144959
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 148
          Top = 191
          Width = 33
          Height = 13
          Caption = 'Vlr P1:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4144959
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 148
          Top = 218
          Width = 33
          Height = 13
          Caption = 'Vlr P2:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4144959
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtComissaoSaldo1: TCurrencyEdit
          Left = 125
          Top = 24
          Width = 115
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = False
          DisplayFormat = ' ,0.00; -,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtDebitoSaldo1: TCurrencyEdit
          Left = 125
          Top = 56
          Width = 115
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = False
          DisplayFormat = ' ,0.00; -,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edtCreditoSaldo1: TCurrencyEdit
          Left = 125
          Top = 88
          Width = 115
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = False
          DisplayFormat = ' ,0.00; -,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edtSaldoTotal1: TCurrencyEdit
          Left = 125
          Top = 122
          Width = 115
          Height = 22
          AutoSize = False
          Color = clWhite
          Ctl3D = False
          DisplayFormat = ' ,0.00; -,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          OnChange = edtSaldoTotal1Change
        end
        object dtpDataPrevista: TDateTimePicker
          Left = 48
          Top = 186
          Width = 89
          Height = 21
          Date = 41715.574898217590000000
          Time = 41715.574898217590000000
          TabOrder = 4
        end
        object dtpDataPrevista2: TDateTimePicker
          Left = 49
          Top = 213
          Width = 89
          Height = 21
          Date = 41715.574898217590000000
          Time = 41715.574898217590000000
          TabOrder = 5
        end
        object edtVlrParcela1: TCurrencyEdit
          Left = 185
          Top = 186
          Width = 72
          Height = 22
          AutoSize = False
          Color = clWhite
          Ctl3D = False
          DisplayFormat = ' ,0.00; -,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11241031
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object edtVlrParcela2: TCurrencyEdit
          Left = 185
          Top = 213
          Width = 72
          Height = 22
          AutoSize = False
          Color = clWhite
          Ctl3D = False
          DisplayFormat = ' ,0.00; -,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11241031
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
      end
      object DBEdit2: TDBEdit
        Left = 1006
        Top = 306
        Width = 105
        Height = 21
        Anchors = [akRight, akBottom]
        Ctl3D = False
        DataField = 'TOT_VLRCOMISS'
        DataSource = dsQuinzena1
        ParentCtl3D = False
        TabOrder = 3
        Visible = False
      end
      object PageControl2: TPageControl
        Left = 2
        Top = 316
        Width = 316
        Height = 224
        ActivePage = TabSheet4
        Anchors = [akLeft, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Style = tsFlatButtons
        TabOrder = 4
        object TabSheet3: TTabSheet
          Caption = ' Totais por porcentagem '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          DesignSize = (
            308
            193)
          object GroupBox1: TGroupBox
            Left = 0
            Top = 1
            Width = 307
            Height = 190
            Anchors = [akLeft, akRight, akBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              307
              190)
            object Label7: TLabel
              Left = 54
              Top = 138
              Width = 77
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'TOTAL PEDIDO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 190
              Top = 138
              Width = 94
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'TOTAL COMISS'#195'O'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBGridCBN2: TDBGridCBN
              Left = 11
              Top = 13
              Width = 282
              Height = 117
              Anchors = [akLeft, akTop, akRight]
              Color = 14803425
              DataSource = dsComissoes1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
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
              BuscaHabilitada = False
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
                  FieldName = 'TOTAL_PEDIDO'
                  Title.Caption = 'Valor Pedido'
                  Width = 86
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_COMISSAO'
                  Title.Caption = 'Comiss'#227'o'
                  Width = 51
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TOTAL_PERCENTAGEM'
                  Title.Caption = 'Valor Comiss'#227'o'
                  Width = 83
                  Visible = True
                end>
            end
            object edtTotPedidos1: TCurrencyEdit
              Left = 58
              Top = 154
              Width = 99
              Height = 22
              AutoSize = False
              Color = clWhite
              Ctl3D = False
              DisplayFormat = ' ,0.00; -,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              Anchors = [akTop, akRight]
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object edtTotComissoes1: TCurrencyEdit
              Left = 194
              Top = 154
              Width = 99
              Height = 22
              AutoSize = False
              Color = clWhite
              Ctl3D = False
              DisplayFormat = ' ,0.00; -,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              Anchors = [akTop, akRight]
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object edtCodComissao1: TCurrencyEdit
              Left = 170
              Top = 154
              Width = 23
              Height = 22
              AutoSize = False
              Color = clWhite
              Ctl3D = False
              DisplayFormat = '0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              Anchors = [akTop, akRight]
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              Visible = False
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Observa'#231#245'es'
          ImageIndex = 1
          DesignSize = (
            308
            193)
          object GroupBox3: TGroupBox
            Left = 1
            Top = 1
            Width = 306
            Height = 189
            Anchors = [akLeft, akRight, akBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              306
              189)
            object obsQuinzena1: TMemo
              Left = 15
              Top = 22
              Width = 275
              Height = 138
              Anchors = [akLeft, akRight, akBottom]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyPress = memoDescricaoKeyPress
            end
          end
        end
      end
    end
  end
  object edtAno: TEdit
    Left = 1198
    Top = 24
    Width = 94
    Height = 23
    Ctl3D = True
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    Text = '2014'
    Visible = False
  end
  object UpDown1: TUpDown
    Left = 1292
    Top = 24
    Width = 16
    Height = 23
    Associate = edtAno
    Min = 2000
    Max = 3000
    Position = 2014
    TabOrder = 5
    Thousands = False
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 647
    Width = 1148
    Height = 36
    Align = alBottom
    TabOrder = 6
    DesignSize = (
      1148
      36)
    object lbEnvio: TLabel
      Left = 842
      Top = 9
      Width = 73
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Enviando...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9726290
      Font.Height = -13
      Font.Name = 'Segoe UI Symbol'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btnconfigEmail: TSpeedButton
      Left = 806
      Top = 3
      Width = 22
      Height = 28
      Anchors = [akTop, akRight]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFEBDCC7A8773B905B1DEBE0CFEBE0CF915C1E955D1DE4D2B7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA77944DF9E51DE9C4B77
        4B16754916DE9B4BDF9E51A47740FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DFCE
        92734A917A5A5D3911E0A255E0A255DC9949DB9746E1A357E0A05258360F9780
        6194754DE9DECDFFFFFFFDFCFA8E6533E9AF68DE9C4BDA9543F3C382FFDEAAFF
        EFC0FFEFC2FFE0ADF5C586DA9544DE9B4BE9AF688E6533FDFCFAEFE9E08A571B
        FAD197FAD197FED79DFFE6B4F6C688E4A85FE4A85FF7CA8DFFE9BAFFD8A2FCD2
        98FAD1978A571BEFE9E0FFFFFFD8CDBECB812AFED79EFFD8A2DF9E50643D119B
        611E9B611E684112E0A255FFDEAAFFD8A2CB812AD8CDBEFFFFFFC7AE89836640
        E2A65AFCD298E7AD64673F12A46720FFFFFFFFFFFFA46720754916E8AE67FCD3
        99E2A65A836640C7AE89D1842CFFDEABFFDAA4F1BE7BD28730905B1DFFFFFFFF
        FFFFFFFFFFFFFFFFA46720D1852DEEB975FFD9A3FFDEABD1842CD58D39FFE4B1
        FFE2AEE8AE67D0842BAB6C23FFFFFFFFFFFFFFFFFFFFFFFFAD6E23C07A27E6AB
        61FFE0ADFFE4B1D58D39D4B78DAB7F4AF3C384EDB671D58D37A568209B611EFF
        FFFFFFFFFF9B611E9B611ECB812AE9B26AF5C586AB7F4AD4B78DFFFFFFEBDBC4
        E6AB61FFDEA7D0842BC47D28C47D289B611E9B611EB77525B47225C07A27FFDE
        A7E6AB61EBDBC4FFFFFFFBF1E3DC9949FFEFC2FFF9D0F7CA8DB27024A66921A2
        661F9E631F9D631FA76A21F6C98AFFF9D0FFEFC2DC9949FBF1E3FFFDFBE0A459
        FFE4B4FDD49CFFE0ACFFE2AFD58D37C67E2AC47D28D48C35FFE2AEFFE0ACFDD4
        9CFFE4B4E0A459FFFDFBFFFFFFFAEBD6E2A963EACB9FE1A75FFFF9D0FFF9D0FF
        F3C6FFF3C6FFF9D0FFF9D0E1A75FEACB9FE2A963FAEBD6FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFEEC186FFF9D0FFF9CFE5AC66E5AC66FFF9CFFFF9D0EEC187FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE7CBEBB875E9AF68FE
        F8EFFEF8EFE9AF68EDBB7BFAE8CDFFFFFFFFFFFFFFFFFFFFFFFF}
      Visible = False
      OnClick = btnconfigEmailClick
    end
    object btnSalvar: TBitBtn
      Left = 288
      Top = 3
      Width = 171
      Height = 28
      Anchors = [akTop, akRight]
      Caption = ' Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000C1761B00C275
        1900BD6B1300B9650400B9650400B9650400BA650400BA650400BA650400BA65
        0400BA650400BA650400BA650400BC690A00B96A1500C3791F005D1200005E11
        0000590700005501000055010000550100005601000056010000560100005601
        000056010000560100005601000058050000550600005F150000D5933D00EFB7
        3600CDC6C000E9F8FF00DBE5F600DBE8F800DBE8F800DBE8F900DBE8F800DAE7
        F800DBE7F800D8E4F500E9F6FF00CDC6C000EAA71400C0761D00712F00008B53
        000069625C0085949B0077819200778494007784940077849500778494007683
        9400778394007480910085929B0069625C00864300005C120000CD955100E8AE
        3C00DCD7D400ECE8E900ADA0A200A79B9E009E93950094898C008A8185008379
        7C007B727600685F6400ECE8E900DCD7D400E59E2000C77B250069310000844A
        00007873700088848500493C3E0043373A003A2F310030252800261D21001F15
        1800170E1200040000008884850078737000813A000063170000D0965300EAB4
        4700DCD7D400EFF0EF00DFDEDC00E1E0DF00E0DFDE00DFE0DD00E0DFDD00DFDE
        DD00DFE0DE00DBD9D900EDEDED00DCD7D400E7A62B00C9802B006C3200008650
        0000787370008B8C8B007B7A78007D7C7B007C7B7A007B7C79007C7B79007B7A
        79007B7C7A0077757500898989007873700083420000651C0000D49B5800EBB9
        5000DCD7D400ECE8E900A99D9F00A4999E009A91940092888B00897F85008279
        7C007A717700655C6200ECE8E900DCD7D400E8AC3700CC853100703700008755
        0000787370008884850045393B0040353A00362D30002E242700251B21001E15
        1800160D13000100000088848500787370008448000068210000D69E5B00EDBD
        5A00DCD7D400FFFFFF00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00DCD7D400EAB34000D08B3400723A00008959
        0000787370009B9B9B009B9A9A009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B0078737000864F00006C270000D9A45E00F0C2
        6300DCD7D400ECE8E900A99D9F00A4999E009A91940092888B00897F85008279
        7C007A717700655C6200ECE8E900DCD7D400EDB74900D2903A00754000008C5E
        0000787370008884850045393B0040353A00362D30002E242700251B21001E15
        1800160D1300010000008884850078737000895300006E2C0000D8A35C00F0C6
        6D00DCD7D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00DCD7D400EEBD5400D7963E00743F00008C62
        0900787370009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B00787370008A59000073320000DEAC6900F9D2
        8100C1975C009A7B600095775E0097795D0097795D0097795D0097795D009779
        5C0097795C0095775E009A7A5E00C19A6400F7CA6B00D99B44007A480500956E
        1D005D3300003617000031130000331500003315000033150000331500003315
        00003315000031130000361600005D3600009366070075370000DDAB6700F6D5
        8B00FFD05600C0A88700C8C5C900CEC6BF00CDC6C000CDC6C000CDC6BF00D6D0
        CA00D6D3D000CFCED400C0A88800FFD25D00F3CC7500DCA14800794703009271
        27009B6C00005C442300646165006A625B0069625C0069625C0069625B00726C
        6600726F6C006B6A70005C4424009B6E00008F681100783D0000DCA96600F6D9
        9300FBC85D00C2B4A200D7DEEB00DDDDDD00DCDDDE00DCDBDD00E7E8EA00C8BA
        A700A2969200C2B4A200C6BCA900FBCB6300F3D07E00E0A74C00784502009275
        2F00976400005E503E00737A87007979790078797A0078777900838486006456
        43003E322E005E503E0062584500976700008F6C1A007C430000E5B97300F6DA
        9700FBCC6200C8BAA700DDE0E900E1DFDD00E0DFDE00DFDDDC00EFF3F9009F88
        6F00E5AF47009E918900C7BDB200FDCF6A00F5D48400E3AC510081550F009276
        33009768000064564300797C85007D7B79007C7B7A007B7978008B8F95003B24
        0B00814B00003A2D250063594E00996B0600917020007F480000E9BC7500F8DD
        9E00FDCF6900CEC0AF00E3E7EF00E7E5E300E6E5E400E5E4E200F1F6FF00BAA3
        8600FFE87300B5AB9E00CAC0B800FFD26E00F9DA8E00E7B25B00855811009479
        3A00996B05006A5C4B007F838B0083817F008281800081807E008D929B00563F
        22009B840F0051473A00665C54009B6E0A0095762A00834E0000EAC07900F8E0
        9B00FBD16500D3C4AF00EAEEF600ECEBE800ECEBE900EBE9E600FBFFFF00A28E
        7800DEAF4F00A89C9500D1C7B900FFDA7800F5D88900E2A44200865C1500947C
        3700976D01006F604B00868A9200888784008887850087858200979B9B003E2A
        14007A4B0000443831006D6355009B761400917425007E400000ECC47E00FEF4
        D500FFE29000DCD7D400F5FFFF00F6FEFF00F6FEFF00F6FDFF00FFFFFF00DFDD
        DC00C8BAA700DFDDDC00E5E4E200FFDE8800E4AA4500FCF5EC0088601A009A90
        71009B7E2C0078737000919B9B00929A9B00929A9B0092999B009B9B9B007B79
        7800645643007B79780081807E009B7A24008046000098918800ECC68100F0CA
        8200F4CA7D00E8C78800EFCF9400EFD49800EDCF9200EED09200EED09300F2D3
        9600F7D79B00F6D69B00E6C48A00EBB55200FDF9F200FFFFFF0088621D008C66
        1E0090661900846324008B6B30008B703400896B2E008A6C2E008A6C2F008E6F
        32009373370092723700826026008751000099958E009B9B9B00}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnImprimir: TBitBtn
      Left = 461
      Top = 3
      Width = 171
      Height = 28
      Anchors = [akTop, akRight]
      Caption = ' Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
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
      TabOrder = 1
      OnClick = btnImprimirClick
    end
    object BitBtn1: TBitBtn
      Left = 634
      Top = 3
      Width = 171
      Height = 28
      Anchors = [akTop, akRight]
      Caption = ' Enviar relat'#243'rio por E-mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFCF9F7DFC4B0C28C57BA7221C1781DC1771BC0761ABB7C38CDA179F0E3
        D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC3B0BB7221D6901DD38B1EC67E1CBA
        701DBB7329BE741CCC831DD38B1DB87B4AFFFFFFFFFFFFFFFFFFFFFFFFDFC3AF
        CB8726D99426C38A59FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF6EDE7C57F2BDB9932D8B69CFFFFFFCDA179CB935FD7
        B395FFFFFFCC9E77C8925FD5B194F6EEE8FFFFFFFFFFFFFFFFFFDAB494E2A63C
        D09F75F4EAE2CC8933E4A73EDD9E3AD99A39BC7229DB9B3AE2A23CE2A43CCE8A
        34D6AF8FFFFFFFFFFFFFCB9050DD9F40F2E5DCD0975EE9B04AC88B4EFFFFFFC9
        9059E0A443E9B14BCA935FDAB696DB9D3ED99B3EE0C3AAFEFDFCD4953FD3933A
        FDFAF8D9A04EE0A949EDD9C7FFFFFFFFFFFFCB9153EBB753D3A16EFFFFFFDCB9
        9BE4AC4CD39A57E8CFB8DCAA60DA9D4AFCF7F4DDA354E3AE52EEDAC4FFFFFFFF
        FFFFEAD4BDE4AE52D7A051FFFFFFFFFFFFD49A4EE0A749D1995AE1B472E1B570
        FFFFFFD9A35CE8B557E1BF9BFFFFFFFFFFFFFFFFFFE0AA54E1AC55EFDCCBFFFF
        FFDCAC74E6B867DFAF6FDEAD6DEDCB8FFCF8F3DFB586F8D992D49343FFFFFFFF
        FFFFFFFFFFDCA45AEAB85FEBD1B4FFFFFFE4BE8AECC88BE2BA80E6C39AFAE1AB
        E2B985FFFFFFDFB270FBE6B0DDAF73F7ECDFEDD7B6E2B472F9E2A8E4BE8DFFFF
        FFE4BA83EFCD8FE3B97DF5E6D4EDCC8EEBC789FAF3EBF6EBDDE5BA76FAE5B1EF
        CB8EF4D79DEDC98CF8E1AEE2B574FFFFFFEAC484ECC687E3BA87FFFFFFE4B981
        FAE8B4E5B66EFFFEFCFCF6F0E2B97EEAC68AE7BF86E9C8A0ECCE9FFFFFFFF6E7
        D2FCEAB7E3B879EDD1AEFFFFFFFFFEFDE4B56CFCECBDEBC280EDCFA5FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF4E0C0FBE8B9E8BE76ECCEA9FFFFFFFFFFFFFFFFFF
        FEFCF9E9BE7EF6D9A1FAE6B5F2D594EABF77EBC078EFCC87F8E1ADFBE4B1E8BD
        75F5E4CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E3C8EFCD96F1C883F3
        CF8BF3CD89F2CB88EDC584F3DCB6F6E5CCFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object edtCodigo: TCurrencyEdit
    Left = 909
    Top = 3
    Width = 73
    Height = 21
    AutoSize = False
    Color = clWhite
    Ctl3D = False
    DisplayFormat = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    Visible = False
  end
  object edtEmail: TEdit
    Left = 461
    Top = 24
    Width = 245
    Height = 23
    ReadOnly = True
    TabOrder = 8
  end
  object pnlconfigEmail: TPanel
    Left = 80
    Top = 801
    Width = 1115
    Height = 110
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'pnlconfigEmail'
    TabOrder = 9
    Visible = False
    OnExit = pnlConfigEmailExit
    object Label28: TLabel
      Left = 9
      Top = 6
      Width = 88
      Height = 13
      Caption = 'Nome remetente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label29: TLabel
      Left = 142
      Top = 6
      Width = 43
      Height = 13
      Caption = 'Assunto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label30: TLabel
      Left = 361
      Top = 6
      Width = 29
      Height = 13
      Caption = 'Texto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label31: TLabel
      Left = 9
      Top = 54
      Width = 109
      Height = 13
      Caption = 'E-mail ( envio c'#243'pia )'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNome: TEdit
      Left = 9
      Top = 21
      Width = 121
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Text = 'Cristiano'
    end
    object edtAssunto: TEdit
      Left = 142
      Top = 21
      Width = 203
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Text = 'Relat'#243'rio de Comiss'#227'o'
    end
    object memoTexto: TMemo
      Left = 361
      Top = 21
      Width = 736
      Height = 84
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object edtEmailCopia: TEdit
      Left = 9
      Top = 69
      Width = 336
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Text = 'cristiano@babyduck.com.br'
    end
  end
  object btnBuscar: TBitBtn
    Left = 965
    Top = 20
    Width = 108
    Height = 26
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
  object dtpInicio: TDateTimePicker
    Left = 717
    Top = 24
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
    TabOrder = 10
  end
  object dtpFim: TDateTimePicker
    Left = 838
    Top = 24
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
    TabOrder = 11
  end
  object dspQuinzena1: TDataSetProvider
    DataSet = qryQuinzena1
    Left = 80
    Top = 192
  end
  object cdsQuinzena1: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspQuinzena1'
    Left = 112
    Top = 192
    object cdsQuinzena1DT_ENVIO: TDateField
      FieldName = 'DT_ENVIO'
      ReadOnly = True
    end
    object cdsQuinzena1DIA_PEDIDO: TSmallintField
      FieldName = 'DIA_PEDIDO'
      ReadOnly = True
    end
    object cdsQuinzena1CLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 60
    end
    object cdsQuinzena1FPGTO: TStringField
      FieldName = 'FPGTO'
      Size = 100
    end
    object cdsQuinzena1NUMPEDIDO: TStringField
      FieldName = 'NUMPEDIDO'
      Size = 22
    end
    object cdsQuinzena1COMISSAO: TBCDField
      FieldName = 'COMISSAO'
      Precision = 18
      Size = 2
    end
    object cdsQuinzena1VALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object cdsQuinzena1VLRCOMISSAO: TBCDField
      FieldName = 'VLRCOMISSAO'
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object cdsQuinzena1TOT_PEDIDO: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOT_PEDIDO'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'SUM(VALOR_TOTAL)'
    end
    object cdsQuinzena1TOT_VLRCOMISS: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOT_VLRCOMISS'
      Active = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'SUM(VLRCOMISSAO)'
    end
  end
  object dsQuinzena1: TDataSource
    DataSet = cdsQuinzena1
    Left = 144
    Top = 192
  end
  object cdsComissoes1: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspQuinzena2'
    Left = 48
    Top = 488
    object cdsComissoes1PERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      DisplayFormat = '0.00%'
    end
    object cdsComissoes1TOTAL_PERCENTAGEM: TFloatField
      FieldName = 'TOTAL_PERCENTAGEM'
      DisplayFormat = ' ,0.00; -,0.00'
    end
    object cdsComissoes1TOTAL_PEDIDO: TFloatField
      FieldName = 'TOTAL_PEDIDO'
      DisplayFormat = ' ,0.00; -,0.00'
    end
  end
  object dsComissoes1: TDataSource
    DataSet = cdsComissoes1
    Left = 80
    Top = 488
  end
  object dsComissoes2: TDataSource
    DataSet = cdsComissoes2
    Left = 184
    Top = 488
  end
  object cdsComissoes2: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspQuinzena2'
    Left = 152
    Top = 488
    object FloatField7: TFloatField
      FieldName = 'PERC_COMISSAO'
      DisplayFormat = '0.00%'
    end
    object FloatField8: TFloatField
      FieldName = 'TOTAL_PERCENTAGEM'
      DisplayFormat = ' ,0.00; -,0.00'
    end
    object cdsComissoes2TOTAL_PEDIDO: TFloatField
      FieldName = 'TOTAL_PEDIDO'
      DisplayFormat = ' ,0.00; -,0.00'
    end
  end
  object cdsDebCred1: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspQuinzena2'
    Left = 368
    Top = 552
    object cdsDebCred1VALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = ' ,0.00; -,0.00'
    end
    object cdsDebCred1TIPO: TStringField
      FieldName = 'TIPO'
    end
    object cdsDebCred1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 400
    end
    object cdsDebCred1CODIGO: TFloatField
      FieldName = 'CODIGO'
    end
    object cdsDebCred1NUM_PARCELA: TStringField
      Alignment = taCenter
      FieldName = 'NUM_PARCELA'
      Size = 1
    end
  end
  object dsDebCred1: TDataSource
    DataSet = cdsDebCred1
    Left = 400
    Top = 552
  end
  object cdsRemovidos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspQuinzena2'
    Left = 767
    Top = 460
    object cdsRemovidosCODIGO_LANCAMENTO: TIntegerField
      FieldName = 'CODIGO_LANCAMENTO'
    end
  end
  object qryQuinzena1: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      'select   nf.data_saida, p.cod_repres, p.cancelado,'
      ' CAST( iif(nfr.status = '#39'100'#39','
      
        '       lpad(EXTRACT(DAY FROM nf.data_saida), 2, '#39'0'#39') || '#39'.'#39' || l' +
        'pad(EXTRACT(MONTH FROM nf.data_saida), 2, '#39'0'#39') || '#39'.'#39' || EXTRACT' +
        '(YEAR FROM nf.data_saida),'
      
        '       lpad(EXTRACT(DAY FROM p.dt_despacho), 2, '#39'0'#39') || '#39'.'#39' || l' +
        'pad(EXTRACT(MONTH FROM p.dt_despacho), 2, '#39'0'#39') || '#39'.'#39' || EXTRACT' +
        '(YEAR FROM p.dt_despacho)) as Date) dt_envio,'
      
        ' iif(nfr.status = '#39'100'#39', EXTRACT(DAY FROM nf.data_saida), EXTRAC' +
        'T(DAY FROM p.dt_despacho) )dia_pedido, c.razao cliente,'
      
        ' fp.descricao FPGTO, p.numpedido, p.comissao, CAST((p.valor_tota' +
        'l-((p.valor_total*p.desconto_comiss)/100)) as numeric(15,2)) val' +
        'or_total,'
      
        ' CAST( ( (p.valor_total-((p.valor_total*p.desconto_comiss)/100))' +
        ' * p.comissao / 100) as numeric(15,2))vlrComissao'
      
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
      ''
      
        ' where (( nfr.status = '#39'100'#39' and ((nf.data_saida >= :dt_ini) and' +
        ' (nf.data_saida <= :dt_fim)) and p.cod_repres = :codRep)'
      '        OR'
      
        '       ( p.despachado = '#39'S'#39' and ((p.dt_despacho >= :dt_ini) and ' +
        '(p.dt_despacho <= :dt_fim)) and p.cod_repres = :codRep) )'
      ''
      '        and not (p.cancelado = '#39'S'#39')'
      ''
      ' ORDER BY p.comissao'
      '')
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
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 936
    Top = 641
  end
end
