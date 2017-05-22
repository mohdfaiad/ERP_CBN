inherited frmImpressaoEtiquetaCaixa: TfrmImpressaoEtiquetaCaixa
  Left = 371
  Top = 178
  BorderStyle = bsSingle
  Caption = 'Impressao das etiquetas dos volumes'
  ClientHeight = 432
  ClientWidth = 409
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 415
  ExplicitHeight = 460
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = 299
    Width = 794
    Height = 1123
    Margins.TopMargin = 35.000000000000000000
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Visible = False
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 132
      Width = 718
      Height = 755
      object RLDBText1: TRLDBText
        Left = 77
        Top = 21
        Width = 67
        Height = 26
        DataField = 'RAZAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 77
        Top = -2
        Width = 66
        Height = 23
        Caption = 'Cliente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 77
        Top = 98
        Width = 38
        Height = 23
        Caption = 'CEP:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlbNF: TRLLabel
        Left = 77
        Top = 152
        Width = 41
        Height = 23
        Caption = 'N.F.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlbBarra: TRLLabel
        Left = 359
        Top = 152
        Width = 90
        Height = 23
        Caption = 'CX.:            /'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 77
        Top = 46
        Width = 118
        Height = 23
        DataField = 'LOGRADOURO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 103
        Top = 73
        Width = 76
        Height = 23
        DataField = 'NUMERO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel5: TRLLabel
        Left = 77
        Top = 73
        Width = 25
        Height = 23
        Caption = 'N'#186
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 205
        Top = 73
        Width = 58
        Height = 23
        Caption = 'Bairro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText4: TRLDBText
        Left = 264
        Top = 73
        Width = 64
        Height = 23
        DataField = 'BAIRRO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 117
        Top = 98
        Width = 33
        Height = 23
        DataField = 'CEP'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 265
        Top = 98
        Width = 64
        Height = 23
        DataField = 'CIDADE'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbNumNota: TRLDBText
        Left = 120
        Top = 152
        Width = 192
        Height = 23
        DataField = 'NUMERO_NOTA_FISCAL'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rlbValorNota: TRLLabel
        Left = 222
        Top = 150
        Width = 99
        Height = 26
        Caption = 'VLR_NOTA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rldbVolumes: TRLDBText
        Left = 452
        Top = 152
        Width = 198
        Height = 23
        DataField = 'QUANTIDADE_VOLUMES'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbNCaixa: TRLDBText
        Left = 333
        Top = 152
        Width = 105
        Height = 23
        Alignment = taRightJustify
        DataField = 'NUMERO_CX'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 519
        Top = 153
        Width = 54
        Height = 18
        Caption = 'PEDIDO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText7: TRLDBText
        Left = 575
        Top = 153
        Width = 88
        Height = 18
        DataField = 'NUM_PEDIDO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object imgPAC: TRLImage
        Left = 464
        Top = 1
        Width = 177
        Height = 86
      end
      object RLLabel4: TRLLabel
        Left = 77
        Top = 123
        Width = 64
        Height = 23
        Caption = 'COMP.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText8: TRLDBText
        Left = 144
        Top = 123
        Width = 129
        Height = 23
        DataField = 'COMPLEMENTO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbFantasia: TRLDBText
        Left = 546
        Top = 9
        Width = 104
        Height = 15
        Alignment = taRightJustify
        DataField = 'TRANSPORTADORA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
  end
  object rgLayout: TRadioGroup
    Left = 0
    Top = 0
    Width = 409
    Height = 97
    Align = alTop
    Caption = ' Selecione o Layout da etiqueta: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Items.Strings = (
      'Transportadora'
      'Correios'
      'Correios sem n'#186' e valor da nota')
    ParentFont = False
    TabOrder = 1
    Visible = False
    ExplicitWidth = 1151
  end
  object rgDados: TGroupBox
    Left = 0
    Top = 97
    Width = 409
    Height = 280
    Align = alTop
    Caption = ' Dados da Etiqueta '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
    ExplicitWidth = 1041
    object Label2: TLabel
      Left = 10
      Top = 24
      Width = 36
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3552822
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 10
      Top = 64
      Width = 62
      Height = 13
      Caption = 'Logradouro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3552822
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 10
      Top = 104
      Width = 43
      Height = 13
      Caption = 'N'#250'mero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3552822
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 106
      Top = 104
      Width = 31
      Height = 13
      Caption = 'Bairro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3552822
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 10
      Top = 144
      Width = 20
      Height = 13
      Caption = 'CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3552822
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 106
      Top = 144
      Width = 36
      Height = 13
      Caption = 'Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3552822
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 10
      Top = 224
      Width = 67
      Height = 13
      Caption = 'N'#250'mero N.F.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3552822
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 106
      Top = 224
      Width = 51
      Height = 13
      Caption = 'Valor N.F.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3552822
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 248
      Top = 224
      Width = 113
      Height = 13
      Caption = 'Quantidade de Caixas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3552822
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 11
      Top = 184
      Width = 74
      Height = 13
      Caption = 'Complemento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3552822
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCliente: TEdit
      Left = 10
      Top = 40
      Width = 353
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtCep: TMaskEdit
      Left = 10
      Top = 160
      Width = 76
      Height = 21
      EditMask = '99999\-999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 4
      Text = '     -   '
    end
    object edtLogradouro: TEdit
      Left = 10
      Top = 80
      Width = 353
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtBairro: TEdit
      Left = 106
      Top = 120
      Width = 257
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtCidade: TEdit
      Left = 106
      Top = 160
      Width = 257
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edtNrNf: TCurrencyEdit
      Left = 10
      Top = 240
      Width = 79
      Height = 20
      AutoSize = False
      Color = clWhite
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object edtVlrNf: TCurrencyEdit
      Left = 106
      Top = 240
      Width = 111
      Height = 21
      AutoSize = False
      Color = clWhite
      DisplayFormat = ',0.00;-,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object edtQtd: TCurrencyEdit
      Left = 284
      Top = 240
      Width = 79
      Height = 20
      AutoSize = False
      Color = clWhite
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MinValue = 1.000000000000000000
      ParentFont = False
      TabOrder = 9
      Value = 1.000000000000000000
    end
    object edtNumero: TEdit
      Left = 10
      Top = 120
      Width = 76
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtComplemento: TEdit
      Left = 10
      Top = 200
      Width = 352
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 391
    Width = 409
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 611
    ExplicitWidth = 1151
    DesignSize = (
      409
      41)
    object btnImprimir: TSpeedButton
      Left = 204
      Top = 5
      Width = 193
      Height = 30
      Anchors = [akTop, akRight]
      Caption = ' <Ctrl + P> Imprimir'
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
      ExplicitLeft = 179
    end
    object Label1: TLabel
      Left = -2
      Top = -12
      Width = 410
      Height = 13
      Caption = 
        '________________________________________________________________' +
        '__________________'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object cbLimpar: TCheckBox
      Left = 9
      Top = 13
      Width = 120
      Height = 17
      Caption = 'Limpar ao imprimir'
      Checked = True
      State = cbChecked
      TabOrder = 0
      Visible = False
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 296
    Top = 64
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 296
    Top = 32
    object cdsNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      Required = True
    end
    object cdsRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 80
    end
    object cdsNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object cdsBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 75
    end
    object cdsQUANTIDADE_VOLUMES: TFloatField
      FieldName = 'QUANTIDADE_VOLUMES'
      Required = True
    end
    object cdsNUMERO_CX: TIntegerField
      FieldName = 'NUMERO_CX'
    end
    object cdsNUM_PEDIDO: TStringField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 200
    end
    object cdsTRANSPORTADORA: TStringField
      FieldName = 'TRANSPORTADORA'
      Size = 60
    end
  end
  object cdsVolumes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVolumes'
    Left = 280
    object cdsVolumesNUMPEDIDO: TStringField
      FieldName = 'NUMPEDIDO'
      Size = 22
    end
    object cdsVolumesCOUNT: TIntegerField
      FieldName = 'COUNT'
      ReadOnly = True
    end
  end
  object dspVolumes: TDataSetProvider
    DataSet = qryVolumes
    Left = 248
  end
  object qry: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select nf.codigo, nf.numero_nota_fiscal, p.razao, t.nome_fantasi' +
        'a transportadora, e.logradouro, e.numero, e.bairro, e.cep, e.com' +
        'plemento ,(c.nome ||'#39'/'#39'|| est.sigla) cidade, vn.quantidade_volum' +
        'es'
      'from notas_fiscais nf'
      
        'left join pessoas               p   on p.codigo              =  ' +
        'nf.codigo_destinatario'
      
        'left join pessoas               t   on t.codigo              =  ' +
        'nf.codigo_transportadora'
      
        'left join enderecos             e   on e.codpessoa           =  ' +
        'p.codigo'
      
        'left join cidades               c   on c.codibge             =  ' +
        'e.codcidade'
      
        'left join estados               est on est.codigo            =  ' +
        'c.codest'
      
        'left join volumes_notas_fiscais vn  on vn.codigo_nota_fiscal =  ' +
        'nf.codigo'
      
        'where nf.numero_nota_fiscal = :nr_nota and nf.codigo_emitente = ' +
        ':cod_emit')
    Left = 152
    Top = 48
    ParamData = <
      item
        Name = 'NR_NOTA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'COD_EMIT'
        ParamType = ptInput
      end>
    object qryCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      Origin = 'NUMERO_NOTA_FISCAL'
      Required = True
    end
    object qryRAZAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryLOGRADOURO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryNUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryBAIRRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryCEP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEP'
      Origin = 'CEP'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryCOMPLEMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 75
    end
    object qryQUANTIDADE_VOLUMES: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QUANTIDADE_VOLUMES'
      Origin = 'QUANTIDADE_VOLUMES'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qryTRANSPORTADORA: TStringField
      FieldName = 'TRANSPORTADORA'
      Size = 60
    end
  end
  object qryVolumes: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select ped.numpedido, count( distinct(cx.numero_caixa)) from ped' +
        'idos ped'
      
        'left join pedidos_faturados  pf  on pf.codigo_pedido = ped.codig' +
        'o'
      
        'left join conferencia_pedido cp  on cp.codigo_pedido = ped.codig' +
        'o'
      
        'inner join caixas             cx  on cx.codigo_conferencia = cp.' +
        'codigo'
      ''
      'where pf.codigo_nota_fiscal = :cod_nota'
      ''
      'group by ped.numpedido'
      'order by 2')
    Left = 208
    ParamData = <
      item
        Name = 'COD_NOTA'
        ParamType = ptInput
      end>
  end
end
