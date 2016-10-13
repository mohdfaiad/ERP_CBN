inherited frmCadastroTransportadora: TfrmCadastroTransportadora
  Left = 194
  Top = 66
  Caption = 'Cadastro de Transportadoras'
  ClientHeight = 509
  ClientWidth = 858
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 874
  ExplicitHeight = 547
  PixelsPerInch = 96
  TextHeight = 13
  object pagTransportadoras: TPageControl
    Left = 0
    Top = 0
    Width = 858
    Height = 466
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'F1 - Transportadoras'
      OnExit = TabSheet1Exit
      DesignSize = (
        850
        438)
      object gridTransportadoras: TDBGridCBN
        Left = 8
        Top = 8
        Width = 832
        Height = 422
        Hint = 
          'Pressione Ctrl + Alt + F2 para configurar as colunas'#13'Pressione C' +
          'trl + Alt + F3 para configurar as cores'#13'Pressione Ctrl + Alt + F' +
          '4 para configurar o tipo de busca'#13'Pressione Ctrl + Alt + F5 para' +
          ' recarregar o grid'
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = 14803425
        DataSource = ds
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
        OnTitleClick = gridTransportadorasTitleClick
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
            FieldName = 'RAZAO'
            Title.Caption = 'Nome / Raz'#227'o Social'
            Width = 282
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF_CNPJ'
            Title.Caption = 'CPF / CNPJ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RG_IE'
            Title.Caption = 'RG / IE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTCADASTRO'
            Title.Caption = 'Data Cadastro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE1'
            Title.Caption = 'Fone 1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE2'
            Title.Caption = 'Fone 2'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAX'
            Title.Caption = 'Fax'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Title.Caption = 'E-mail'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BLOQUEADO'
            Title.Caption = 'Bloqueado?'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'F2 - Dados da Transportadora'
      ImageIndex = 1
      OnEnter = TabSheet2Enter
      object Label1: TLabel
        Left = 24
        Top = 17
        Width = 107
        Height = 13
        Caption = 'Nome / Raz'#227'o Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3355443
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 400
        Top = 17
        Width = 22
        Height = 13
        Caption = 'CGC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3355443
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 552
        Top = 17
        Width = 9
        Height = 13
        Caption = 'IE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3355443
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 744
        Top = 17
        Width = 73
        Height = 13
        Caption = 'Data Cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3355443
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 25
        Top = 331
        Width = 65
        Height = 13
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblAsterisco: TLabel
        Left = 7
        Top = 415
        Width = 11
        Height = 32
        Caption = '*'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9010488
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCamposObrigatorios: TLabel
        Left = 21
        Top = 419
        Width = 127
        Height = 17
        Caption = 'Campos Obrigat'#243'rios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 12
        Top = 7
        Width = 11
        Height = 32
        Caption = '*'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9010488
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 387
        Top = 7
        Width = 11
        Height = 32
        Caption = '*'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9010488
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtRazao: TEdit
        Left = 24
        Top = 33
        Width = 339
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object edtRg: TMaskEdit
        Left = 552
        Top = 33
        Width = 100
        Height = 21
        MaxLength = 12
        TabOrder = 2
        Text = ''
      end
      object edtDtCad: TMaskEdit
        Left = 744
        Top = 33
        Width = 88
        Height = 21
        Enabled = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
      end
      object GroupBox1: TGroupBox
        Left = 24
        Top = 65
        Width = 809
        Height = 164
        Caption = ' Endere'#231'o '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object Label6: TLabel
          Left = 16
          Top = 24
          Width = 62
          Height = 13
          Caption = 'Logradouro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 376
          Top = 24
          Width = 14
          Height = 13
          Caption = 'N'#186
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 456
          Top = 24
          Width = 31
          Height = 13
          Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 456
          Top = 67
          Width = 20
          Height = 13
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 600
          Top = 67
          Width = 21
          Height = 13
          Caption = 'Pa'#237's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 16
          Top = 112
          Width = 74
          Height = 13
          Caption = 'Complemento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 364
          Top = 15
          Width = 11
          Height = 32
          Caption = '*'
          Font.Charset = ANSI_CHARSET
          Font.Color = 9010488
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 444
          Top = 15
          Width = 11
          Height = 32
          Caption = '*'
          Font.Charset = ANSI_CHARSET
          Font.Color = 9010488
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 4
          Top = 15
          Width = 11
          Height = 32
          Caption = '*'
          Font.Charset = ANSI_CHARSET
          Font.Color = 9010488
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 4
          Top = 57
          Width = 11
          Height = 32
          Caption = '*'
          Font.Charset = ANSI_CHARSET
          Font.Color = 9010488
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inline Cidade: TBuscaCidade
          Left = 16
          Top = 59
          Width = 435
          Height = 51
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          ExplicitLeft = 16
          ExplicitTop = 59
          ExplicitWidth = 435
          ExplicitHeight = 51
          inherited StaticText3: TStaticText
            Width = 18
            Font.Color = 3355443
            Font.Name = 'Segoe UI'
            ExplicitWidth = 18
          end
          inherited StaticText2: TStaticText
            Width = 40
            Font.Color = 3355443
            Font.Name = 'Segoe UI'
            ExplicitWidth = 40
          end
          inherited StaticText1: TStaticText
            Width = 42
            Font.Color = 3355443
            Font.Name = 'Segoe UI'
            ExplicitWidth = 42
          end
          inherited edtCidade: TEdit
            Left = 92
            Width = 294
            Font.Color = clBlack
            Font.Name = 'Segoe UI'
            ParentFont = False
            ExplicitLeft = 92
            ExplicitWidth = 294
          end
          inherited edtUF: TEdit
            Left = 391
            Font.Color = clBlack
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 391
          end
          inherited edtCodCid: TCurrencyEdit
            Font.Color = clBlack
            Font.Name = 'Segoe UI'
            ParentFont = False
          end
        end
        object edtLogradouro: TEdit
          Left = 16
          Top = 40
          Width = 345
          Height = 21
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtNumero: TEdit
          Left = 376
          Top = 40
          Width = 65
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtBairro: TEdit
          Left = 455
          Top = 40
          Width = 330
          Height = 21
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtPais: TEdit
          Left = 599
          Top = 83
          Width = 130
          Height = 21
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Text = 'BRASIL'
        end
        object edtCep: TMaskEdit
          Left = 455
          Top = 83
          Width = 118
          Height = 21
          EditMask = '99999\-999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxLength = 9
          ParentFont = False
          TabOrder = 4
          Text = ''
        end
        object edtComplemento: TEdit
          Left = 16
          Top = 128
          Width = 389
          Height = 21
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
      end
      object GroupBox2: TGroupBox
        Left = 24
        Top = 241
        Width = 809
        Height = 81
        Caption = '   Telefone / Contato '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object Label15: TLabel
          Left = 400
          Top = 27
          Width = 32
          Height = 13
          Caption = 'E-mail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 7
          Top = 17
          Width = 11
          Height = 32
          Caption = '*'
          Font.Charset = ANSI_CHARSET
          Font.Color = 9010488
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtEmail: TEdit
          Left = 400
          Top = 43
          Width = 385
          Height = 21
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        inline Fone2: TFone
          Left = 141
          Top = 24
          Width = 125
          Height = 47
          TabOrder = 1
          ExplicitLeft = 141
          ExplicitTop = 24
          ExplicitWidth = 125
          inherited Label12: TLabel
            Width = 35
            Caption = 'Fone 2'
            ExplicitWidth = 35
          end
          inherited edtFone: TMaskEdit
            Width = 99
            ExplicitWidth = 99
          end
        end
        inline Fone1: TFone
          Left = 15
          Top = 24
          Width = 123
          Height = 47
          TabOrder = 2
          ExplicitLeft = 15
          ExplicitTop = 24
          ExplicitWidth = 123
          inherited Label12: TLabel
            Width = 35
            Caption = 'Fone 1'
            ExplicitWidth = 35
          end
          inherited edtFone: TMaskEdit
            Width = 99
            ExplicitWidth = 99
          end
        end
        inline FoneFax: TFone
          Left = 267
          Top = 24
          Width = 118
          Height = 47
          TabOrder = 3
          ExplicitLeft = 267
          ExplicitTop = 24
          ExplicitWidth = 118
          inherited Label12: TLabel
            Width = 18
            Caption = 'Fax'
            ExplicitWidth = 18
          end
          inherited edtFone: TMaskEdit
            Width = 99
            ExplicitWidth = 99
          end
        end
      end
      object memObs: TMemo
        Left = 24
        Top = 348
        Width = 809
        Height = 49
        TabOrder = 6
      end
      object edtCodigo: TEdit
        Left = 176
        Top = 8
        Width = 65
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Text = '0'
        Visible = False
      end
      object edtCpf: TEdit
        Left = 397
        Top = 33
        Width = 119
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object panBotoes: TPanel
    Left = 0
    Top = 466
    Width = 858
    Height = 43
    Align = alBottom
    TabOrder = 1
    object btnIncluir: TSpeedButton
      Left = 8
      Top = 6
      Width = 120
      Height = 30
      Caption = 'F3 - Incluir'
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
      OnClick = btnIncluirClick
    end
    object btnAlterar: TSpeedButton
      Left = 136
      Top = 6
      Width = 120
      Height = 30
      Caption = 'F4 - Alterar'
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
      OnClick = btnAlterarClick
    end
    object btnCancelar: TBitBtn
      Left = 264
      Top = 6
      Width = 120
      Height = 30
      Caption = 'Cancelar'
      Enabled = False
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00140E
        AE001711B800100BA100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00100BA1001711B800140EAE00FFFFFF009B9B9B000000
        4A000000540000003D009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B0000003D000000540000004A009B9B9B001F1AB5002522
        E9002723F1001F1BD100130EA600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00130EA6001F1BD1002723F1002522E9001F1AB500000051000000
        850000008D0000006D00000042009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B000000420000006D0000008D0000008500000051003D3AC8004648
        F6002425F1002A2BF3002121D400140FAD00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00140FAD002121D4002A2BF3002425F1004648F6003D3AC800000064000000
        920000008D0000008F0000007000000049009B9B9B009B9B9B009B9B9B009B9B
        9B00000049000000700000008F0000008D000000920000006400221CB6006262
        E100444BF300262DEF002C33F2002326D7001812B300FFFFFF00FFFFFF001812
        B3002326D7002C33F200262DEF00474DF4006262E100221CB600000052000000
        7D0000008F0000008B0000008E000000730000004F009B9B9B009B9B9B000000
        4F000000730000008E0000008B000000900000007D0000005200FFFFFF00241D
        BB006566E3004853F3002934EF002F3BF200262BD9001A13BA001A13BA00262B
        D9002F3BF2002834EF004752F3005F61DF00241DBA00FFFFFF009B9B9B000000
        570001027F0000008F0000008B0000008E000000750000005600000056000000
        750000008E0000008B0000008F0000007B00000056009B9B9B00FFFFFF00FFFF
        FF002621C200656AE5004756F3002C3DF0003041F1002B36E4002B36E4003041
        F1002D3DF0004A59F3005D5FE0002119BF00FFFFFF00FFFFFF009B9B9B009B9B
        9B0000005E000106810000008F0000008C0000008D0000008000000080000000
        8D0000008C0000008F0000007C0000005B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF002721C6006267E6004356F2003044F0003448F2003448F2003044
        EF004255F2006166E500221AC400FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B00000062000003820000008E0000008C0000008E0000008E000000
        8B0000008E0000028100000060009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF002C23CC004551E900354DF100364CEF00364CEF00354D
        F0004251EA002B23CD00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00000068000000850000008D0000008B0000008B000000
        8C0000008600000069009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF001D14CE003240E6003C54F2003850F000384FF0003B54
        F2003445E9001D15CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B0000006A000000820000008E0000008C0000008C000000
        8E000000850000006A009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF001F17D400313EE4003E58F1003953F000455EF200455FF2003A53
        F0003E57F000303AE3001F15D300FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B00000070000000800000008D0000008C0000008E0000008E000000
        8C0000008C0000007F0000006F009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF002018D9003542E700425FF3003D59F100556EF300737FF200737EF200566E
        F3003D59F100425EF300313AE4001F16D900FFFFFF00FFFFFF009B9B9B009B9B
        9B00000075000000830000008F0000008D00000A8F000F1B8E000F1A8E00000A
        8F0000008D0000008F0000008000000075009B9B9B009B9B9B00FFFFFF002018
        DE003744E9004663F200405DF1005C77F3006E76EF003028DF002E25DF007078
        F0005D77F400405DF1004562F200333DE8002117DD00FFFFFF009B9B9B000000
        7A000000850000008E0000008D0000138F000A128B0000007B0000007B000C14
        8C000013900000008D0000008E0000008400000079009B9B9B00221BE2003947
        EC004A69F3004462F2005F7AF300686EF000271FE200FFFFFF00FFFFFF002C23
        E200717AF100607BF4004362F2004A69F3003846EB002019E20000007E000000
        880000058F0000008E0000168F00040A8C0000007E009B9B9B009B9B9B000000
        7E000D168D000017900000008E0000058F000000870000007E004144EC005372
        F4004464F2006481F4006E76F200271EE600FFFFFF00FFFFFF00FFFFFF00FFFF
        FF002D25E700747CF2006480F4004564F2005270F3003D41EB0000008800000E
        900000008E00001D90000A128E00000082009B9B9B009B9B9B009B9B9B009B9B
        9B000000830010188E00001C900000008E00000C8F00000087004441ED007B8F
        F5007A94F600737BF3002D24EA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF002D24EA00737CF3007A93F6007A8FF6004441ED0000008900172B
        9100163092000F178F00000086009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B00000086000F188F00162F9200162B920000008900FFFFFF004845
        F0005A59F2002D24ED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF002D24ED005959F2004844F000FFFFFF009B9B9B000000
        8C0000008E00000089009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B000000890000008E0000008C009B9B9B00}
      NumGlyphs = 2
      TabOrder = 0
      TabStop = False
      OnClick = btnCancelarClick
    end
    object btnSalvar: TBitBtn
      Left = 394
      Top = 6
      Width = 120
      Height = 30
      Caption = 'Salvar'
      Enabled = False
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
      TabOrder = 1
      TabStop = False
      OnClick = btnSalvarClick
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 708
    Top = 8
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    AfterScroll = cdsAfterScroll
    Left = 748
    Top = 8
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Size = 14
    end
    object cdsRG_IE: TStringField
      FieldName = 'RG_IE'
      Size = 15
    end
    object cdsDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object cdsFONE1: TStringField
      FieldName = 'FONE1'
      Size = 15
    end
    object cdsFONE2: TStringField
      FieldName = 'FONE2'
      Size = 15
    end
    object cdsFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object cdsOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object cdsBLOQUEADO: TStringField
      FieldName = 'BLOQUEADO'
      Size = 1
    end
    object cdsMOTIVO_BLOQ: TStringField
      FieldName = 'MOTIVO_BLOQ'
      Size = 500
    end
    object cdsTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsCODIGO_1: TIntegerField
      FieldName = 'CODIGO_1'
      Required = True
    end
    object cdsCODPESSOA: TIntegerField
      FieldName = 'CODPESSOA'
      Required = True
    end
    object cdsLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 80
    end
    object cdsBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object cdsCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsPAIS: TStringField
      FieldName = 'PAIS'
      Size = 25
    end
    object cdsCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object cdsRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsPESSOA: TStringField
      FieldName = 'PESSOA'
      Size = 1
    end
    object cdsEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object cdsNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
  end
  object dsp: TDataSetProvider
    DataSet = qry
    Left = 788
    Top = 8
  end
  object qry: TFDQuery
    SQL.Strings = (
      'SELECT * FROM pessoas p                           '
      ' left join enderecos en on en.codpessoa = p.codigo'
      ' where p.tipo = '#39'T'#39'                            ')
    Left = 672
    Top = 8
  end
end
