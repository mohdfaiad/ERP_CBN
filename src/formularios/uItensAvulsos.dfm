inherited frmItensAvulsos: TfrmItensAvulsos
  Left = 114
  Top = 110
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Itens Avulsos'
  ClientHeight = 440
  ClientWidth = 965
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 971
  ExplicitHeight = 468
  PixelsPerInch = 96
  TextHeight = 13
  object btnConfirmar: TSpeedButton
    Left = 440
    Top = 408
    Width = 103
    Height = 25
    Caption = '[ F6 ] OK'
    OnClick = btnConfirmarClick
  end
  object lblValorDesconto: TStaticText
    Left = 857
    Top = 193
    Width = 81
    Height = 17
    Caption = 'Vlr. Desconto'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 7
    Transparent = False
  end
  object gbDadosItem: TGroupBox
    Left = 13
    Top = 11
    Width = 671
    Height = 166
    Caption = ' Dados do Item '
    TabOrder = 0
    DesignSize = (
      671
      166)
    object lblPreco: TStaticText
      Left = 578
      Top = 67
      Width = 37
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Pre'#231'o'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 4
    end
    inline BuscaProduto: TBuscaProduto
      Left = 16
      Top = 59
      Width = 556
      Height = 65
      Anchors = [akLeft, akBottom]
      TabOrder = 1
      OnEnter = BuscaProdutoEnter
      OnExit = BuscaProdutoExit
      ExplicitLeft = 16
      ExplicitTop = 59
      ExplicitWidth = 556
      ExplicitHeight = 65
      inherited edtDescricao: TEdit
        Left = 122
        ExplicitLeft = 122
      end
      inherited edtGrade: TEdit
        TabStop = False
      end
    end
    inline BuscaCor: TBuscaCor
      Left = 16
      Top = 107
      Width = 425
      Height = 52
      Anchors = [akLeft, akBottom]
      TabOrder = 2
      TabStop = True
      OnExit = BuscaCorExit
      ExplicitLeft = 16
      ExplicitTop = 107
      ExplicitWidth = 425
      ExplicitHeight = 52
      inherited edtCodigo: TCurrencyEdit
        Top = 8
        ExplicitTop = 8
      end
      inherited StaticText2: TStaticText
        Width = 23
        Caption = 'Cor'
        ExplicitWidth = 23
      end
    end
    object edtPreco: TCurrencyEdit
      Left = 576
      Top = 83
      Width = 89
      Height = 21
      TabStop = False
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      Anchors = [akLeft, akBottom]
      ReadOnly = True
      TabOrder = 3
    end
    inline BuscaTabelaPreco: TBuscaTabelaPreco
      Left = 16
      Top = 13
      Width = 425
      Height = 55
      TabOrder = 0
      ExplicitLeft = 16
      ExplicitTop = 13
    end
  end
  object lblPercentualDesconto: TStaticText
    Left = 763
    Top = 192
    Width = 71
    Height = 17
    Caption = '% Desconto'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    Transparent = False
  end
  object edtPercDesconto: TCurrencyEdit
    Left = 762
    Top = 208
    Width = 89
    Height = 21
    AutoSize = False
    DisplayFormat = '0'
    MaxLength = 3
    MaxValue = 100.000000000000000000
    TabOrder = 2
    OnChange = edtPercDescontoChange
  end
  object edtDesconto: TCurrencyEdit
    Left = 855
    Top = 209
    Width = 89
    Height = 21
    TabStop = False
    AutoSize = False
    DisplayFormat = ',0.00;-,0.00'
    TabOrder = 6
  end
  object lblValorItem: TStaticText
    Left = 764
    Top = 238
    Width = 61
    Height = 17
    Caption = 'Valor Item'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 8
    Transparent = False
  end
  object edtValorItens: TCurrencyEdit
    Left = 762
    Top = 254
    Width = 97
    Height = 21
    TabStop = False
    AutoSize = False
    DisplayFormat = ',0.00;-,0.00'
    TabOrder = 4
  end
  object gbItensAdicionados: TGroupBox
    Left = 12
    Top = 293
    Width = 945
    Height = 105
    Caption = 'Itens Avulsos Adicionados'
    TabOrder = 9
    object gridItens: TDBGridCBN
      Left = 2
      Top = 15
      Width = 941
      Height = 88
      TabStop = False
      Align = alClient
      Color = 14803425
      DataSource = dsItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
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
          FieldName = 'Produto'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RefCor'
          Title.Caption = 'Ref. Cor'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cor'
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TamRN'
          Title.Alignment = taCenter
          Title.Caption = 'RN'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TamP'
          Title.Alignment = taCenter
          Title.Caption = 'P'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TamM'
          Title.Alignment = taCenter
          Title.Caption = 'M'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TamG'
          Title.Alignment = taCenter
          Title.Caption = 'G'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tam1'
          Title.Alignment = taCenter
          Title.Caption = '1'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tam2'
          Title.Alignment = taCenter
          Title.Caption = '2'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tam3'
          Title.Alignment = taCenter
          Title.Caption = '3'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tam4'
          Title.Alignment = taCenter
          Title.Caption = '4'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tam6'
          Title.Alignment = taCenter
          Title.Caption = '6'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tam8'
          Title.Alignment = taCenter
          Title.Caption = '8'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TamUnica'
          Title.Alignment = taCenter
          Title.Caption = #218'nica'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Desconto'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorUnit'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Unit.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorTotalItem'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Total'
          Width = 103
          Visible = True
        end>
    end
  end
  object gbQuantidades: TGroupBox
    Left = 11
    Top = 185
    Width = 744
    Height = 105
    Caption = 'Quantidades do Item'
    TabOrder = 1
    object gridQuantidades: TDBGrid
      Left = 2
      Top = 15
      Width = 740
      Height = 88
      Align = alClient
      Ctl3D = True
      DataSource = ds
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnColExit = gridQuantidadesColExit
      OnDrawColumnCell = gridQuantidadesDrawColumnCell
      OnEnter = gridQuantidadesEnter
      OnKeyPress = gridQuantidadesKeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TamRN'
          Title.Alignment = taCenter
          Title.Caption = 'RN'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TamP'
          Title.Alignment = taCenter
          Title.Caption = 'P'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TamM'
          Title.Alignment = taCenter
          Title.Caption = 'M'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TamG'
          Title.Alignment = taCenter
          Title.Caption = 'G'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Tam1'
          Title.Alignment = taCenter
          Title.Caption = '1'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Tam2'
          Title.Alignment = taCenter
          Title.Caption = '2'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Tam3'
          Title.Alignment = taCenter
          Title.Caption = '3'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Tam4'
          Title.Alignment = taCenter
          Title.Caption = '4'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Tam6'
          Title.Alignment = taCenter
          Title.Caption = '6'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Tam8'
          Title.Alignment = taCenter
          Title.Caption = '8'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TamUNICA'
          Title.Alignment = taCenter
          Title.Caption = 'UNICA'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end>
    end
  end
  object btnAdicionar: TBitBtn
    Left = 861
    Top = 252
    Width = 94
    Height = 25
    Caption = 'Adicionar'
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
    TabOrder = 3
    OnClick = btnAdicionarItemClick
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 514
    Top = 343
    object cdsItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsItensProduto: TStringField
      FieldName = 'Produto'
    end
    object cdsItensCodPro: TIntegerField
      FieldName = 'CodPro'
    end
    object cdsItensCor: TStringField
      FieldName = 'Cor'
    end
    object cdsItensCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object cdsItensRefCor: TStringField
      FieldName = 'RefCor'
      Size = 25
    end
    object cdsItensValorUnit: TFloatField
      FieldName = 'ValorUnit'
      DisplayFormat = 'R$ ,0.00;R$ -,0.00'
      currency = True
    end
    object cdsItensValorTotalItem: TFloatField
      FieldName = 'ValorTotalItem'
      DisplayFormat = 'R$ ,0.00;R$ -,0.00'
      currency = True
    end
    object cdsItensDesconto: TFloatField
      FieldName = 'Desconto'
      currency = True
    end
    object cdsItensTamRN: TIntegerField
      Alignment = taCenter
      FieldName = 'TamRN'
    end
    object cdsItensTamP: TIntegerField
      Alignment = taCenter
      FieldName = 'TamP'
    end
    object cdsItensTamM: TIntegerField
      Alignment = taCenter
      FieldName = 'TamM'
    end
    object cdsItensTamG: TIntegerField
      Alignment = taCenter
      FieldName = 'TamG'
    end
    object cdsItensTam1: TIntegerField
      Alignment = taCenter
      FieldName = 'Tam1'
    end
    object cdsItensTam2: TIntegerField
      Alignment = taCenter
      FieldName = 'Tam2'
    end
    object cdsItensTam3: TIntegerField
      Alignment = taCenter
      FieldName = 'Tam3'
    end
    object cdsItensTam4: TIntegerField
      Alignment = taCenter
      FieldName = 'Tam4'
    end
    object cdsItensTam6: TIntegerField
      Alignment = taCenter
      FieldName = 'Tam6'
    end
    object cdsItensTam8: TIntegerField
      Alignment = taCenter
      FieldName = 'Tam8'
    end
    object cdsItensTamUnica: TIntegerField
      Alignment = taCenter
      FieldName = 'TamUnica'
    end
    object cdsItensTOTAL: TIntegerField
      Alignment = taCenter
      FieldName = 'TOTAL'
    end
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 472
    Top = 343
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 409
    Top = 222
    object cdsTamRN: TIntegerField
      FieldName = 'TamRN'
    end
    object cdsTamP: TIntegerField
      FieldName = 'TamP'
    end
    object cdsTamM: TIntegerField
      FieldName = 'TamM'
    end
    object cdsTamG: TIntegerField
      FieldName = 'TamG'
    end
    object cdsTam1: TIntegerField
      FieldName = 'Tam1'
    end
    object cdsTam2: TIntegerField
      FieldName = 'Tam2'
    end
    object cdsTam3: TIntegerField
      FieldName = 'Tam3'
    end
    object cdsTam4: TIntegerField
      FieldName = 'Tam4'
    end
    object cdsTam6: TIntegerField
      FieldName = 'Tam6'
    end
    object cdsTam8: TIntegerField
      FieldName = 'Tam8'
    end
    object cdsTamUNICA: TIntegerField
      FieldName = 'TamUNICA'
    end
    object cdsTOTAL: TIntegerField
      Alignment = taCenter
      FieldName = 'TOTAL'
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 464
    Top = 223
  end
end
