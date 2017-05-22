inherited frmDirecionarEntradas: TfrmDirecionarEntradas
  Caption = 'Direcionar Entradas'
  ClientHeight = 559
  ClientWidth = 915
  OnShow = FormShow
  ExplicitWidth = 931
  ExplicitHeight = 597
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 16
    Top = 19
    Width = 43
    Height = 17
    Caption = 'LOTE >'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5460819
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object RLReport1: TRLReport
    Left = 204
    Top = 439
    Width = 794
    Height = 1123
    Margins.LeftMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = dsDirecionadas
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
      Height = 76
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 224
        Top = 11
        Width = 250
        Height = 26
        Caption = 'Direcionamento de Entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 240
        Top = 48
        Width = 206
        Height = 19
        Caption = 'Entradas referentes ao lote N'#186' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 20
      Top = 209
      Width = 754
      Height = 24
    end
    object RLGroup1: TRLGroup
      Left = 20
      Top = 137
      Width = 754
      Height = 72
      DataFields = 'CODIGO'
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
        Color = 16316649
        ParentColor = False
        Transparent = False
        object RLDBText1: TRLDBText
          Left = 95
          Top = 4
          Width = 306
          Height = 15
          AutoSize = False
          DataField = 'DESCRICAO'
          DataSource = dsDirecionadas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText4: TRLDBText
          Left = 407
          Top = 4
          Width = 226
          Height = 15
          AutoSize = False
          DataField = 'COR'
          DataSource = dsDirecionadas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 654
          Top = 4
          Width = 28
          Height = 15
          Alignment = taCenter
          DataField = 'TAM'
          DataSource = dsDirecionadas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText6: TRLDBText
          Left = 706
          Top = 3
          Width = 44
          Height = 18
          Alignment = taRightJustify
          DataField = 'QTDENTRADA'
          DataSource = dsDirecionadas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText7: TRLDBText
          Left = 1
          Top = 4
          Width = 86
          Height = 15
          AutoSize = False
          DataField = 'REFERENCIA'
          DataSource = dsDirecionadas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
      end
      object RLDetailGrid1: TRLDetailGrid
        Left = 0
        Top = 24
        Width = 754
        Height = 32
        Borders.Style = bsFDiagonal
        ColCount = 3
        object RLDraw1: TRLDraw
          Left = -2
          Top = -1
          Width = 253
          Height = 33
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Borders.Style = bsVertical
          Pen.Style = psDot
        end
        object RLDBText2: TRLDBText
          Left = 24
          Top = 8
          Width = 50
          Height = 15
          DataField = 'DESTINO'
          DataSource = dsDirecionadas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 173
          Top = 8
          Width = 74
          Height = 15
          Alignment = taRightJustify
          DataField = 'QUANTIDADE'
          DataSource = dsDirecionadas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLLabel2: TRLLabel
          Left = 1
          Top = 7
          Width = 20
          Height = 15
          Caption = 'P/:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14381096
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 197
          Top = 7
          Width = 28
          Height = 15
          Caption = 'Qtd:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14381096
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLBand4: TRLBand
      Left = 20
      Top = 115
      Width = 754
      Height = 22
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel4: TRLLabel
        Left = 94
        Top = 3
        Width = 57
        Height = 15
        Caption = 'PRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 404
        Top = 3
        Width = 26
        Height = 15
        Caption = 'COR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 634
        Top = 3
        Width = 62
        Height = 15
        Caption = 'TAMANHO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 706
        Top = 3
        Width = 32
        Height = 15
        Caption = 'QTDE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 6
        Top = 3
        Width = 68
        Height = 15
        Caption = 'REFER'#202'NCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object gridConsulta: TDBGridCBN
    Left = 16
    Top = 56
    Width = 882
    Height = 409
    Hint = 
      'Pressione Ctrl + Alt + F2 para configurar as colunas'#13'Pressione C' +
      'trl + Alt + F3 para configurar as cores'#13'Pressione Ctrl + Alt + F' +
      '4 para configurar o tipo de busca'#13'Pressione Ctrl + Alt + F5 para' +
      ' recarregar o grid'
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = 14803425
    DataSource = dsEntradas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = gridConsultaDrawColumnCell
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
        FieldName = 'PRODUTO'
        Width = 297
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COR'
        Width = 229
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAM'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRECIONADA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBtnFace
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 35
        Visible = True
      end>
  end
  object edtLote: TCurrencyEdit
    Left = 76
    Top = 15
    Width = 55
    Height = 26
    AutoSize = False
    Ctl3D = False
    DisplayFormat = '0'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 512
    Width = 915
    Height = 47
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = -8
    ExplicitTop = 427
    object btnImprimir: TSpeedButton
      Left = 769
      Top = 9
      Width = 129
      Height = 30
      Caption = 'Imprimir'
      OnClick = btnImprimirClick
    end
    object btnDirecionar: TSpeedButton
      Left = 617
      Top = 9
      Width = 129
      Height = 30
      Caption = 'Direcionar'
      OnClick = btnDirecionarClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 471
    Width = 209
    Height = 35
    TabOrder = 4
    object Image1: TImage
      Left = 18
      Top = 9
      Width = 16
      Height = 18
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        0000100000000100180000000000000300000000000000000000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EB1456DC066FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF56B24F1CC63218B9218ECB8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF65B96019C33828E95829E34615B1139CD299
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77BF7117C5
        4025EB6A1FDD4C20DC3F29E03613A709B8DFB5FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF70BD6A16C74823EF791AE05B33E86532E4531FD92E2ADE2C
        0FA004CEE9CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF75BF7015CA5220F3891CE5
        6C27EC6B46D15776E88333E4491FD7222AD8211FA415E0F1DEFFFFFFFFFFFFFF
        FFFF6FC06916CF5D1CF99B17E87A26F07D43D36060B46036A92E87F59425DB2C
        23DA1D27D31F2EA724FAFDF9FFFFFFFFFFFF4FB14829D66A1AF99E2EFA9845D7
        696FBD6AFFFFFFE0F1E02AAA2784F98A26D82325DC1E26CF1D2BA221FFFFFFFF
        FFFFFFFFFF54B04F30D76C4ADD7A77C072FFFFFFFFFFFFFFFFFFBFE2BF40BA3E
        85FC821BD21228DC2021C8194AAF42FFFFFFFFFFFFFFFFFF63BA584DB044FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFADD9AD49C24783FF7E1BD2122AE0231FC41860
        B959FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        98CF985ACB5281FF7C23DC1D1CBF1454B44CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FBC6F6CDC663AC63566BA66FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF60BB5E8ECE89FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
    end
    object Label1: TLabel
      Left = 40
      Top = 9
      Width = 130
      Height = 17
      Caption = 'Entradas direcionadas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5460819
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
  end
  object qryEntradas: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select pro.descricao PRODUTO, iif(cor.desc_producao <> '#39#39', cor.d' +
        'esc_producao, cor.descricao) COR, tam.descricao TAM, es.quantida' +
        'de,'
      '       iif(de.codigo is null, '#39'N'#39', '#39'S'#39') Direcionada'
      ' from entradas_saidas es'
      ' inner join produtos pro on pro.codigo = es.codigo_produto'
      ' inner join cores    cor on cor.codigo = es.codigo_cor'
      ' inner join tamanhos tam on tam.codigo = es.codigo_tamanho'
      
        ' left join  direcionamento_entrada de on de.codigo_entrada = es.' +
        'codigo'
      'where es.lote = :lote'
      
        'group by pro.descricao, cor, tam.descricao, es.quantidade, direc' +
        'ionada')
    Left = 40
    Top = 88
    ParamData = <
      item
        Name = 'LOTE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryEntradasPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Size = 200
    end
    object qryEntradasCOR: TStringField
      FieldName = 'COR'
      Origin = 'COR'
      Size = 60
    end
    object qryEntradasTAM: TStringField
      FieldName = 'TAM'
      Origin = 'TAM'
      Size = 15
    end
    object qryEntradasQUANTIDADE: TSingleField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object qryEntradasDIRECIONADA: TStringField
      FieldName = 'DIRECIONADA'
      Size = 1
    end
  end
  object dsEntradas: TDataSource
    DataSet = qryEntradas
    Left = 104
    Top = 88
  end
  object ImageList1: TImageList
    Left = 352
    Top = 288
    Bitmap = {
      494C010102001C00440010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004EB145006DC066000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004D0000095C02000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000056B24F001CC6320018B921008ECB8A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004E000000620000005500002A67260000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000065B9600019C3380028E9580029E3460015B113009CD29900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000001550000005F000000850000007F0000004D0000386E3500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000077BF
      710017C5400025EB6A001FDD4C0020DC3F0029E0360013A70900B8DFB5000000
      000000000000000000000000000000000000000000000000000000000000135B
      0D0000610000008706000079000000780000007C000000430000547B51000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000070BD6A0016C7
      480023EF79001AE05B0033E8650032E453001FD92E002ADE2C000FA00400CEE9
      CC000000000000000000000000000000000000000000000000000C5906000063
      0000008B1500007C0000008401000080000000750000007A0000003C00006A85
      6800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000075BF700015CA520020F3
      89001CE56C0027EC6B0046D1570076E8830033E449001FD722002AD821001FA4
      1500E0F1DE0000000000000000000000000000000000115B0C0000660000008F
      25000081080000880700006D000012841F000080000000730000007400000040
      00007C8D7A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006FC0690016CF5D001CF99B0017E8
      7A0026F07D0043D3600060B4600036A92E0087F5940025DB2C0023DA1D0027D3
      1F002EA72400FAFDF90000000000000000000B5C0500006B0000009537000084
      1600008C1900006F00000050000000450000239130000077000000760000006F
      0000004300009699950000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004FB1480029D66A001AF99E002EFA
      980045D769006FBD6A0000000000E0F1E0002AAA270084F98A0026D8230025DC
      1E0026CF1D002BA221000000000000000000004D00000072060000953A000096
      3400007305000B590600000000007C8D7C000046000020952600007400000078
      0000006B0000003E000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000054B04F0030D76C004ADD
      7A0077C07200000000000000000000000000BFE2BF0040BA3E0085FC82001BD2
      120028DC200021C819004AAF42000000000000000000004C0000007308000079
      1600135C0E000000000000000000000000005B7E5B000056000021981E00006E
      00000078000000640000004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063BA58004DB0
      44000000000000000000000000000000000000000000ADD9AD0049C2470083FF
      7E001BD212002AE023001FC4180060B95900000000000000000000560000004C
      0000000000000000000000000000000000000000000049754900005E00001F9B
      1A00006E0000007C000000600000005500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000098CF98005ACB
      520081FF7C0023DC1D001CBF140054B44C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000346B34000067
      00001D9B180000780000005B0000005000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006FBC
      6F006CDC66003AC6350066BA6600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000B58
      0B00087802000062000002560200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000060BB5E008ECE890000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000005700002A6A250000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FCFFFCFF00000000F87FF87F00000000
      F03FF03F00000000E01FE01F00000000C00FC00F000000008007800700000000
      000300030000000002030203000000008701870100000000CF80CF8000000000
      FFC0FFC000000000FFE1FFE100000000FFF3FFF300000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object qryDireciona: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      'execute procedure EXECUTA_DIRECIONAMENTO(:lote)')
    Left = 32
    Top = 144
    ParamData = <
      item
        Name = 'LOTE'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryDirecionadas: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select es.codigo, pro.descricao, pro.referencia, iif(cor.desc_pr' +
        'oducao = '#39#39', cor.descricao, cor.desc_producao) cor, tam.descrica' +
        'o tam,'
      
        '       de.quantidade, iif(ped.codigo is null, '#39'ESTOQUE'#39', '#39'MP '#39'||' +
        'mp.numero_mapa||'#39' - Ped('#39'||ped.numpedido||'#39')'#39') destino, es.quant' +
        'idade qtdentrada'
      ''
      ' from entradas_saidas es'
      ''
      
        ' inner join direcionamento_entrada de  on de.codigo_entrada = es' +
        '.codigo'
      
        ' inner join produtos               pro on pro.codigo = es.codigo' +
        '_produto'
      
        ' inner join cores                  cor on cor.codigo = es.codigo' +
        '_cor'
      
        ' inner join tamanhos               tam on tam.codigo = es.codigo' +
        '_tamanho'
      
        ' left  join pedidos                ped on ped.codigo = de.codigo' +
        '_pedido'
      
        ' left  join pedidos_mapa           pm  on pm.codigo_pedido = ped' +
        '.codigo'
      
        ' left  join mapas                  mp  on mp.codigo = pm.codigo_' +
        'mapa'
      ''
      'where es.lote = :lote'
      'order by 1')
    Left = 56
    Top = 304
    ParamData = <
      item
        Name = 'LOTE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryDirecionadasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDirecionadasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object qryDirecionadasCOR: TStringField
      FieldName = 'COR'
      Origin = 'COR'
      Size = 100
    end
    object qryDirecionadasTAM: TStringField
      FieldName = 'TAM'
      Origin = 'TAM'
      Size = 15
    end
    object qryDirecionadasQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object qryDirecionadasDESTINO: TStringField
      FieldName = 'DESTINO'
      Origin = 'DESTINO'
      Size = 27
    end
    object qryDirecionadasQTDENTRADA: TSingleField
      FieldName = 'QTDENTRADA'
      Origin = 'QUANTIDADE'
    end
    object qryDirecionadasREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
  end
  object dsDirecionadas: TDataSource
    DataSet = qryDirecionadas
    Left = 136
    Top = 304
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2015 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 496
    Top = 472
  end
end
