object frmImpressaoEtiquetasPicorrucho: TfrmImpressaoEtiquetasPicorrucho
  Left = 272
  Top = 90
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o Etiquetas - Layout Picorrucho'
  ClientHeight = 548
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 6
    Top = 325
    Width = 409
    Height = 89
    Lines.Strings = (
      '^XA'
      '^LH000,000')
    TabOrder = 3
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 13
    Top = 8
    Width = 648
    Height = 497
    TabOrder = 0
    DesignSize = (
      648
      497)
    object Label1: TLabel
      Left = 152
      Top = 53
      Width = 66
      Height = 13
      Caption = 'Pre'#231'o parcela'
    end
    object Label2: TLabel
      Left = 24
      Top = 13
      Width = 75
      Height = 13
      Caption = 'C'#243'dig de Barras'
    end
    object Label4: TLabel
      Left = 21
      Top = 53
      Width = 79
      Height = 13
      Caption = 'C'#243'd. Fornecedor'
    end
    object Label6: TLabel
      Left = 200
      Top = 12
      Width = 37
      Height = 13
      Caption = 'Produto'
    end
    object Label3: TLabel
      Left = 259
      Top = 53
      Width = 71
      Height = 13
      Caption = 'Qtde parcelas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3355443
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 360
      Top = 53
      Width = 61
      Height = 13
      Caption = 'Pre'#231'o venda'
    end
    object lab: TLabel
      Left = 15
      Top = 99
      Width = 492
      Height = 13
      Caption = 
        '________________________________________________________________' +
        '__________________'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 11842740
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 476
      Top = 53
      Width = 70
      Height = 13
      Caption = 'Qtde Etiquetas'
    end
    object edtPrecoParc: TCurrencyEdit
      Left = 152
      Top = 68
      Width = 89
      Height = 20
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
      TabOrder = 3
    end
    object edtCodBar: TEdit
      Left = 24
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
      TabOrder = 0
    end
    object edtCodFornecedor: TEdit
      Left = 24
      Top = 68
      Width = 113
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
      TabOrder = 2
    end
    object edtProduto: TEdit
      Left = 200
      Top = 27
      Width = 353
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
      TabOrder = 1
    end
    object edtQtdParc: TCurrencyEdit
      Left = 260
      Top = 68
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
      TabOrder = 4
      OnChange = edtQtdParcChange
    end
    object edtPrecoVenda: TCurrencyEdit
      Left = 360
      Top = 68
      Width = 89
      Height = 20
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
      TabOrder = 5
    end
    object GridCor: TDBGridCBN
      Left = 15
      Top = 130
      Width = 617
      Height = 298
      Hint = 
        'Pressione Ctrl + Alt + F2 para configurar as colunas'#13'Pressione C' +
        'trl + Alt + F3 para configurar as cores'#13'Pressione Ctrl + Alt + F' +
        '4 para configurar o tipo de busca'#13'Pressione Ctrl + Alt + F5 para' +
        ' recarregar o grid'
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'qtd_etiquetas'
          Title.Caption = 'Qtde'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codbar'
          Title.Caption = 'C'#243'd. Barras'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'produto'
          Title.Caption = 'Produto'
          Width = 248
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cod_forn'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'preco_parc'
          Visible = False
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'qtd_parc'
          Title.Caption = 'Qtd. Parc.'
          Width = 51
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'preco_venda'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o Venda'
          Width = 73
          Visible = True
        end>
    end
    object btnAdicionar: TBitBtn
      Left = 517
      Top = 95
      Width = 113
      Height = 28
      Caption = ' Adicionar'
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
      OnClick = btnAdicionarClick
    end
    object edtQtdEtiquetas: TCurrencyEdit
      Left = 476
      Top = 68
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
      MinValue = 1.000000000000000000
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
      Value = 1.000000000000000000
      OnChange = edtQtdParcChange
    end
    object rgTipoEtiqueta: TRadioGroup
      Left = 8
      Top = 430
      Width = 145
      Height = 60
      ItemIndex = 0
      Items.Strings = (
        'Etiqueta pr'#233'-impressa'
        'Etiqueta em branco')
      TabOrder = 9
      OnClick = rgTipoEtiquetaClick
    end
    object gpbCaminhoLogo: TGroupBox
      Left = 159
      Top = 430
      Width = 481
      Height = 60
      Caption = ' Nome da Logomarca '
      TabOrder = 10
      Visible = False
      object btnSeleciona: TSpeedButton
        Left = 312
        Top = 24
        Width = 153
        Height = 24
        Caption = 'Selecione a Logo'
        Glyph.Data = {
          36080000424D3608000000000000360000002800000020000000100000000100
          2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00667BB7003370
          C200206DC9001E69C6001B67C6001A65C6001864C6001663C6001460C400125E
          C600105CC400105BC400105BC400105EC8001059C1005E77B60002175300000C
          5E00000965000005620000036200000162000000620000006200000060000000
          62000000600000006000000060000000640000005D0000135200284AA10080DF
          FF0041BCFF0043B8FF003FB4FF003BB1FF0036AEFF0032A9FF002EA6FF0029A1
          FF00259EFF00219AFF002097FF00209AFF00229FFF00063AA00000003D001C7B
          9B0000589B0000549B0000509B00004D9B00004A9B0000459B0000429B00003D
          9B00003A9B0000369B0000339B0000369B00003B9B0000003C002447A30079D3
          FF0040B1FE0041AEFC003FABFC0039A7FA0037A3F90033A0F9002F9CF9002C99
          F9002896F8002393F8001E8EF8001D8DF9001F92FF00053CA20000003F00156F
          9B00004D9A00004A98000047980000439600003F9500003C9500003895000035
          950000329400002F9400002A940000299500002E9B0000003E00254CA8007ED7
          FF0045B7FE0048B3FC0044B0FC0040ACFC003CA9FB0039A6FA0035A2FA00319F
          FA002D9BFA002998F9002594F9002292FB002095FF00063FA600000044001A73
          9B0000539A00004F9800004C9800004898000045970000429600003E9600003B
          9600003796000034950000309500002E970000319B0000004200254CA80084DB
          FF004CBBFE004DB8FD004AB5FD0045B1FC0041AEFC003EAAFC003AA7FA0036A4
          FA0032A0FA002D9DFA002B99FA002998FA002499FF000642AC00000044002077
          9B0000579A000054990000519900004D9800004A980000469800004396000040
          9600003C960000399600003596000034960000359B00000048002554B30080DD
          FF004EBFFE0050BDFD004FBAFD004CB6FC0046B3FC0043AFFC003FABFC003DA7
          FB0037A4FA0033A1FA002D9CFA002396FB00259BFF000642AC0000004F001C79
          9B00005B9A00005999000056990000529800004F9800004B9800004798000043
          970000409600003D9600003896000032970000379B00000048002554B300AAEC
          FF0061C9FE0053C2FD004EBDFD004AB9FD0046B5FD0042B1FC003EAEFC003AAA
          FC0036A6FB0031A3FA0036A2FB004DADFD006FC0FF001450B70000004F004688
          9B0000659A00005E9900005999000055990000519900004D9800004A98000046
          980000429700003F9600003E9700004999000B5C9B0000005300295ABC00BEF4
          FF0095DEFF0093D9FE0082D3FE0071C9FD0069C6FD0067C4FD0062C0FD005FBC
          FD006ABFFD0072C2FD007EC6FD007CC5FE0080CBFF001452BB00000058005A90
          9B00317A9B002F759A001E6F9A000D6599000562990003609900005C99000058
          9900065B99000E5E99001A62990018619A001C679B0000005700285DC200BDF5
          FF0093DFFF0094DCFE0093DAFE0091DAFE0090D8FF008DD6FF008BD4FF0087D1
          FF0083CDFF007EC8FF0076C5FF0076C4FF007BCBFF001456C20000005E005991
          9B002F7B9B0030789A002F769A002D769A002C749B0029729B0027709B00236D
          9B001F699B001A649B0012619B0012609B0017679B0000005E00285DC200C0F8
          FF0097E1FF0095DFFE0093DFFF00B4EFFF00B2EDFF00B0EBFF00AFE9FF00ACE6
          FF00A9E4FF00A7E2FF00A5E0FF00A7E1FF00A9E5FF001B5FCA0000005E005C94
          9B00337D9B00317B9A002F7B9B00508B9B004E899B004C879B004B859B004882
          9B0045809B00437E9B00417C9B00437D9B0045819B0000006600285DC200BFFB
          FF0099E5FF0098E2FF009DE9FF004881D9002B60CD002D6CD2002D6BD1002D6B
          D1002C6AD1002B6AD0002D6BD0002D6CD1002E6DD30085A9E20000005E005B97
          9B0035819B00347E9B0039859B00001D75000000690000086E0000076D000007
          6D0000066D0000066C0000076C0000086D0000096F0021457E002E6ED500D4FF
          FF00A8F1FF00A6EFFF00B1F9FF001462D200FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000A7100709B
          9B00448D9B00428B9B004D959B0000006E009B9B9B009B9B9B009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B001866D800B6E5
          FA00B3E8FB00B2E5FC00A8DEF8001667D900FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000274005281
          96004F8497004E819800447A9400000375009B9B9B009B9B9B009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00ACC8F2001F6C
          DE002B72DE002B70DE00206CDE00A2C1F000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0048648E000008
          7A00000E7A00000C7A0000087A003E5D8C009B9B9B009B9B9B009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00}
        NumGlyphs = 2
        OnClick = btnSelecionaClick
      end
      object edtCaminho: TEdit
        Left = 8
        Top = 25
        Width = 289
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object BitBtn2: TBitBtn
    Left = 400
    Top = 511
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
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn1: TBitBtn
    Left = 536
    Top = 511
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
  object ds: TDataSource
    DataSet = cds
    Left = 133
    Top = 200
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 181
    Top = 200
    object cdscodbar: TStringField
      FieldName = 'codbar'
    end
    object cdsproduto: TStringField
      FieldName = 'produto'
      Size = 200
    end
    object cdsproduto2: TStringField
      FieldName = 'produto2'
    end
    object cdscod_forn: TStringField
      FieldName = 'cod_forn'
      Size = 40
    end
    object cdspreco_parc: TStringField
      FieldName = 'preco_parc'
      Size = 15
    end
    object cdsqtd_parc: TStringField
      FieldName = 'qtd_parc'
      Size = 3
    end
    object cdspreco_venda: TStringField
      FieldName = 'preco_venda'
      Size = 15
    end
    object cdsqtd_etiquetas: TIntegerField
      FieldName = 'qtd_etiquetas'
    end
  end
end
