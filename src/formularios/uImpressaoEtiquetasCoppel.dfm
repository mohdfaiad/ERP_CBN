inherited frmImpressaoEtiquetasCoppel: TfrmImpressaoEtiquetasCoppel
  Left = 350
  Top = 157
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o Etiquetas - Layout Coopel'
  ClientHeight = 354
  ClientWidth = 607
  Color = 15066597
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 3
    Top = 304
    Width = 409
    Height = 41
    TabOrder = 0
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 590
    Height = 324
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 13
      Width = 28
      Height = 13
      Caption = 'Pre'#231'o'
    end
    object Label2: TLabel
      Left = 128
      Top = 13
      Width = 82
      Height = 13
      Caption = 'C'#243'dig de Barras'
    end
    object Label3: TLabel
      Left = 304
      Top = 13
      Width = 95
      Height = 13
      Caption = 'C'#243'digo - Tamanho'
    end
    object Label4: TLabel
      Left = 435
      Top = 13
      Width = 78
      Height = 13
      Caption = 'Classe - Fam'#237'lia'
    end
    object Label5: TLabel
      Left = 24
      Top = 54
      Width = 47
      Height = 13
      Caption = 'Tamanho'
    end
    object Label6: TLabel
      Left = 112
      Top = 54
      Width = 42
      Height = 13
      Caption = 'Produto'
    end
    object Label7: TLabel
      Left = 435
      Top = 54
      Width = 62
      Height = 13
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3355443
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Shape2: TShape
      Left = 8
      Top = 267
      Width = 571
      Height = 22
      Brush.Color = 13750737
      Pen.Color = 11842740
      Shape = stRoundRect
    end
    object labTotRef: TLabel
      Left = 368
      Top = 271
      Width = 104
      Height = 13
      Caption = 'Total de etiquetas >'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 16
      Top = 271
      Width = 104
      Height = 13
      Caption = 'Total de produtos >'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtPreco: TCurrencyEdit
      Left = 24
      Top = 28
      Width = 89
      Height = 19
      AutoSize = False
      Ctl3D = True
      DisplayFormat = ',0.00;-,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object edtCodBar: TEdit
      Left = 128
      Top = 28
      Width = 161
      Height = 21
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object edtcodTam: TEdit
      Left = 304
      Top = 28
      Width = 116
      Height = 21
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object edtClasseFam: TEdit
      Left = 435
      Top = 28
      Width = 126
      Height = 21
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object edtTamanho: TEdit
      Left = 24
      Top = 69
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
    object edtProduto: TEdit
      Left = 112
      Top = 69
      Width = 309
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    object edtQuantidade: TCurrencyEdit
      Left = 436
      Top = 69
      Width = 77
      Height = 19
      AutoSize = False
      Ctl3D = True
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
    end
    object GridCor: TDBGridCBN
      Left = 7
      Top = 115
      Width = 574
      Height = 149
      Hint = 
        'Pressione Ctrl + Alt + F2 para configurar as colunas'#13'Pressione C' +
        'trl + Alt + F3 para configurar as cores'#13'Pressione Ctrl + Alt + F' +
        '4 para configurar o tipo de busca'#13'Pressione Ctrl + Alt + F5 para' +
        ' recarregar o grid'
      Color = 14803425
      Ctl3D = True
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 8
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = GridCorKeyDown
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
          FieldName = 'preco'
          Title.Caption = 'Pre'#231'o'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codbar'
          Title.Caption = 'C'#243'd. Barras'
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codTam'
          Title.Caption = 'C'#243'd. Tamanho'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'familia'
          Title.Caption = 'Fam'#237'lia'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tamanho'
          Title.Caption = 'Tam.'
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'produto'
          Title.Caption = 'Produto'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'Qtde'
          Width = 34
          Visible = True
        end>
    end
    object edtTotEtiquetas: TCurrencyEdit
      Left = 476
      Top = 268
      Width = 90
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      Color = 13750737
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object edtTotProdutos: TCurrencyEdit
      Left = 124
      Top = 268
      Width = 61
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      Color = 13750737
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object btnAdd: TBitBtn
      Left = 520
      Top = 66
      Width = 41
      Height = 23
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
      TabOrder = 7
      OnClick = btnAddClick
    end
  end
  object BitBtn1: TBitBtn
    Left = 472
    Top = 313
    Width = 113
    Height = 30
    Caption = ' Imprimir'
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
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 352
    Top = 313
    Width = 113
    Height = 30
    Caption = ' Cancelar'
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
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object btnImportar: TBitBtn
    Left = 16
    Top = 313
    Width = 121
    Height = 30
    Caption = ' Importar ( .xls )'
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
    TabOrder = 4
    OnClick = btnImportarClick
  end
  object cds: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'quantidade'
    Params = <>
    Left = 32
    Top = 176
    object cdspreco: TStringField
      FieldName = 'preco'
    end
    object cdscodbar: TStringField
      FieldName = 'codbar'
    end
    object cdscodTam: TStringField
      FieldName = 'codTam'
    end
    object cdsfamilia: TStringField
      FieldName = 'familia'
    end
    object cdstamanho: TStringField
      FieldName = 'tamanho'
    end
    object cdsproduto: TStringField
      FieldName = 'produto'
      Size = 50
    end
    object cdsquantidade: TIntegerField
      FieldName = 'quantidade'
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 80
    Top = 176
  end
end
