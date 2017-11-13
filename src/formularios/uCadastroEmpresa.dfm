inherited frmCadastroEmpresa: TfrmCadastroEmpresa
  Left = 87
  Top = 67
  Caption = 'Cadastro de Empresas'
  ClientHeight = 562
  ClientWidth = 1168
  ExplicitWidth = 1184
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotoes: TPanel
    Top = 520
    Width = 1168
    ExplicitTop = 520
    ExplicitWidth = 1168
  end
  inherited pgGeral: TPageControl
    Width = 1168
    Height = 520
    ActivePage = tsDados
    ExplicitWidth = 1168
    ExplicitHeight = 520
    inherited tsConsulta: TTabSheet
      ExplicitWidth = 1160
      ExplicitHeight = 490
      inherited gridConsulta: TDBGridCBN
        Left = 15
        Top = 13
        Width = 1142
        Height = 458
      end
      inherited lblAjudaSelecionar: TStaticText
        Top = 471
        Width = 1160
        ExplicitTop = 471
        ExplicitWidth = 1160
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 26
      ExplicitWidth = 1160
      ExplicitHeight = 490
      inherited pnlDados: TPanel
        Width = 1160
        Height = 490
        ExplicitWidth = 1160
        ExplicitHeight = 490
        object lblRazao: TLabel [0]
          Left = 17
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
        object lblCPF_CNPJ: TLabel [1]
          Left = 473
          Top = 17
          Width = 59
          Height = 13
          Caption = 'CPF / CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblRG_IE: TLabel [2]
          Left = 609
          Top = 17
          Width = 35
          Height = 13
          Caption = 'RG / IE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDtCadastro: TLabel [3]
          Left = 720
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
        object lblObservacoes: TLabel [4]
          Left = 16
          Top = 373
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
        inherited lblCamposObrigatorios: TLabel
          Left = 28
          Top = 462
          ExplicitLeft = 28
          ExplicitTop = 462
        end
        inherited lblAsterisco: TLabel
          Left = 14
          Top = 458
          Font.Color = 9010488
          ExplicitLeft = 14
          ExplicitTop = 458
        end
        object lblAsteriscoRazao: TLabel
          Left = 4
          Top = 9
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
        object lblAsteriscoCPF: TLabel
          Left = 459
          Top = 9
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
        object lblAsteriscoRegimeTributario: TLabel
          Left = 3
          Top = 56
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
          Left = 17
          Top = 33
          Width = 449
          Height = 23
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object edtCpf: TMaskEdit
          Left = 473
          Top = 33
          Width = 113
          Height = 23
          EditMask = '99\.999\.999/9999\-99;0; '
          MaxLength = 18
          TabOrder = 1
          Text = ''
        end
        object edtRg: TMaskEdit
          Left = 609
          Top = 33
          Width = 99
          Height = 23
          MaxLength = 12
          TabOrder = 2
          Text = ''
        end
        object edtDtCad: TMaskEdit
          Left = 720
          Top = 33
          Width = 88
          Height = 23
          Enabled = False
          EditMask = '!99/99/9999;1; '
          MaxLength = 10
          TabOrder = 4
          Text = '  /  /    '
        end
        object gpbEndereco: TGroupBox
          Left = 14
          Top = 113
          Width = 809
          Height = 164
          Caption = ' Endere'#231'o '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object lblLogradouro: TLabel
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
          object lblNumero: TLabel
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
          object lblBairro: TLabel
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
          object lblCEP: TLabel
            Left = 480
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
          object lblPais: TLabel
            Left = 624
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
          object lblComplemento: TLabel
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
          object lblAsteriscoLogradouro: TLabel
            Left = 4
            Top = 16
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
          object lblAsteriscoNumero: TLabel
            Left = 363
            Top = 16
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
          object lblAsteriscoBairro: TLabel
            Left = 443
            Top = 16
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
          object lblAsteriscoCidade: TLabel
            Left = 5
            Top = 59
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
            Left = 17
            Top = 59
            Width = 434
            Height = 51
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            ExplicitLeft = 17
            ExplicitTop = 59
            ExplicitWidth = 434
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
              Left = 100
              Width = 294
              Font.Color = clBlack
              Font.Name = 'Segoe UI'
              ParentFont = False
              ExplicitLeft = 100
              ExplicitWidth = 294
            end
            inherited edtUF: TEdit
              Left = 399
              Font.Color = clBlack
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 399
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
            Left = 456
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
            Left = 623
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
            Left = 479
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
        object gpbContato: TGroupBox
          Left = 14
          Top = 289
          Width = 809
          Height = 81
          Caption = ' Telefone / Contato '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          object lblEmail: TLabel
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
          object Label1: TLabel
            Left = 4
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
            CharCase = ecLowerCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          inline Fone1: TFone
            Left = 15
            Top = 24
            Width = 132
            Height = 47
            TabOrder = 1
            ExplicitLeft = 15
            ExplicitTop = 24
            inherited Label12: TLabel
              Width = 35
              Caption = 'Fone 1'
              ExplicitWidth = 35
            end
          end
          inline Fone2: TFone
            Left = 141
            Top = 24
            Width = 132
            Height = 47
            TabOrder = 2
            ExplicitLeft = 141
            ExplicitTop = 24
            inherited Label12: TLabel
              Width = 35
              Caption = 'Fone 2'
              ExplicitWidth = 35
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
          end
        end
        object memObs: TMemo
          Left = 14
          Top = 390
          Width = 809
          Height = 69
          TabOrder = 7
        end
        object edtCodigo: TEdit
          Left = 169
          Top = 8
          Width = 65
          Height = 21
          TabStop = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Text = '0'
          Visible = False
        end
        object rgrpRegimeTributario: TRadioGroup
          Left = 17
          Top = 61
          Width = 375
          Height = 46
          Caption = 'Regime Tribut'#225'rio'
          Columns = 3
          Items.Strings = (
            'Simples Nacional'
            'Lucro Presumido'
            'Lucro Real')
          TabOrder = 3
          TabStop = True
        end
        object pgcConfiguracoes: TPageControl
          Left = 830
          Top = 1
          Width = 329
          Height = 488
          ActivePage = tabPrincipal
          Align = alRight
          TabOrder = 9
          TabStop = False
          object tabPrincipal: TTabSheet
            Caption = 'Configura'#231'oes Gerais'
            object GroupBox1: TGroupBox
              Left = 0
              Top = 0
              Width = 321
              Height = 209
              Align = alTop
              Caption = ' NF-e '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object Label4: TLabel
                Left = 14
                Top = 22
                Width = 56
                Height = 13
                Caption = 'Certificado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 3815994
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label5: TLabel
                Left = 17
                Top = 153
                Width = 51
                Height = 13
                Caption = 'Ambiente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 3815994
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblSequenciaNotaFiscal: TLabel
                Left = 17
                Top = 110
                Width = 113
                Height = 13
                Caption = 'Sequ'#234'ncia Nota Fiscal'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 3815994
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblSenhaCertificado: TLabel
                Left = 14
                Top = 68
                Width = 108
                Height = 13
                Caption = 'Senha do Certificado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 3815994
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label7: TLabel
                Left = 169
                Top = 153
                Width = 84
                Height = 13
                Caption = 'Tipo de emiss'#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 3815994
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object cbAmb: TComboBox
                Left = 14
                Top = 168
                Width = 129
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ItemIndex = 0
                ParentFont = False
                TabOrder = 4
                Text = 'Produ'#231#227'o'
                Items.Strings = (
                  'Produ'#231#227'o'
                  'Homologa'#231#227'o')
              end
              object BitBtn1: TBitBtn
                Left = 218
                Top = 35
                Width = 99
                Height = 25
                Caption = 'Selecionar'
                Glyph.Data = {
                  36080000424D3608000000000000360000002800000020000000100000000100
                  2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF004D74AB0023417900C5ABA7009B9B9B009B9B
                  9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
                  9B009B9B9B009B9B9B009B9B9B00001047000000150061474300FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF004173AF00008EEC00009AF4001F4B80009B9B9B009B9B
                  9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
                  9B009B9B9B009B9B9B00000F4B00002A88000036900000001C00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FEFFFF002F6EB2002BA7F50016C0FF0000A0F300568BC3009B9B9B009B9B
                  9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
                  9B009A9B9B00000A4E0000439100005C9B00003C8F0000275F00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFF
                  FF002974BB0068C4F8006BD4FF00279CE6006696C800FFFFFF009B9B9B009B9B
                  9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009A9B
                  9B00001057000460940007709B0000388200023264009B9B9B00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003D8F
                  D500A4E3FE00B5EEFF004CAAE700669DD200FFFFFF00FFFFFF009B9B9B009B9B
                  9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00002B
                  7100407F9A00518A9B000046830002396E009B9B9B009B9B9B00FFFFFF00FFFF
                  FF00FEFEFE00A18889008A6A6A0093736E0086656700B0959500BAA8B100359E
                  E800BDF5FF0077C4EF0063A1DA00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
                  9B009A9A9A003D242500260606002F0F0A00220103004C31310056444D00003A
                  840059919B0013608B00003D76009B9B9B009B9B9B009B9B9B00FFFFFF00D7CD
                  CD007E585700DFD3CB00FFFFF700FFFFE700FFFEDB00D6BB9E0090584D00817B
                  8E001794E4006BB5E900FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B007369
                  69001A0000007B6F67009B9B93009B9B83009B9A770072573A002C0000001D17
                  2A0000308000075185009B9B9B009B9B9B009B9B9B009B9B9B00EDE9E9008865
                  6500FFFFFF00FFFFFF00FDF8E800FAF2DC00F8EDCF00FFF1CF00F6DEBA009F59
                  4500C0C7D500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00898585002401
                  01009B9B9B009B9B9B0099948400968E780094896B009B8D6B00927A56003B00
                  00005C6371009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00A3888900F6EF
                  EA00FFFFFF00FEFBF500FBF7E800F9F4DA00F5EBCC00E6CEAC00F3DAB800E2BD
                  9900AB8B8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003F242500928B
                  86009B9B9B009A979100979384009590760091876800826A48008F7654007E59
                  350047272A009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B0093767400FFFF
                  FF00FDFBF100FCF8EE00FAF3E100FCF5E300F7F0D700F0DFC100E7C9A900F0D1
                  AB00A87E7500F8F6F600FFFFFF00FFFFFF00FFFFFF00FFFFFF002F1210009B9B
                  9B0099978D0098948A00968F7D0098917F00938C73008C7B5D00836545008C6D
                  4700441A1100949292009B9B9B009B9B9B009B9B9B009B9B9B00997D7A00FFFF
                  FC00F9F2E100FAF3DE00FAF7E500FAF1DC00F1DFC000EDD9BA00ECD8B900EDCA
                  A500AF867900EDE8E900FFFFFF00FFFFFF00FFFFFF00FFFFFF00351916009B9B
                  9800958E7D00968F7A0096938100968D78008D7B5C0089755600887455008966
                  41004B221500898485009B9B9B009B9B9B009B9B9B009B9B9B009C807B00FFFF
                  EB00F9EED500FAF1D700F9F2DA00F2E3C600FEFBF900FFFFF000EFDFC000E9C6
                  9E00B0857B00F5F2F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00381C17009B9B
                  8700958A7100968D7300958E76008E7F62009A9795009B9B8C008B7B5C008562
                  3A004C211700918E8F009B9B9B009B9B9B009B9B9B009B9B9B00AF959600F7EA
                  C800F9EBCC00EFDCBE00F4E4C700F0E1C500FDFCEC00FAF5DD00EFDCBC00DFB0
                  8700B59A9A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004B3132009386
                  6400958768008B785A00908063008C7D610099988800969179008B7858007B4C
                  2300513636009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00DED4D700BA99
                  8C00FDECC400EDD4B000E5CAA800EFDBBF00F2E3C400F2DEBC00EABF9300BB8E
                  7D00E7DFE200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007A7073005635
                  28009988600089704C00816644008B775B008E7F60008E7A5800865B2F00572A
                  1900837B7E009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00CEBF
                  C500BE9A8D00E6C7A500EFCBA300ECC8A200E8BE9400DCAA8600BE958500DFD6
                  D700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B006A5B
                  61005A362900826341008B673F0088643E00845A3000784622005A3121007B72
                  73009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
                  FF00E9E4E600C9B3B400B99C9300C3A09700BF9F9600CCB9B700F1EEEF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
                  9B0085808200654F500055382F005F3C33005B3B3200685553008D8A8B009B9B
                  9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00}
                NumGlyphs = 2
                TabOrder = 1
                OnClick = BitBtn1Click
              end
              object edtSequenciaNotaFiscal: TCurrencyEdit
                Left = 14
                Top = 126
                Width = 114
                Height = 21
                AutoSize = False
                DisplayFormat = ',0;-,0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object edtCertificado: TEdit
                Left = 14
                Top = 40
                Width = 195
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
              object edtSenhaDoCertificado: TEdit
                Left = 14
                Top = 85
                Width = 195
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                PasswordChar = '*'
                TabOrder = 2
              end
              object cbTipoEmissao: TComboBox
                Left = 166
                Top = 168
                Width = 129
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ItemIndex = 0
                ParentFont = False
                TabOrder = 5
                Text = 'Normal'
                Items.Strings = (
                  'Normal'
                  'Conting'#234'ncia'
                  'SCAN'
                  'DPEC'
                  'FSDA'
                  'SVCAN'
                  'SVCRS')
              end
            end
            object GroupBox2: TGroupBox
              Left = 0
              Top = 209
              Width = 321
              Height = 114
              Align = alTop
              Caption = ' Al'#237'quotas '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object Label12: TLabel
                Left = 8
                Top = 25
                Width = 65
                Height = 13
                Caption = 'Cr'#233'dito S. N.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 3815994
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label2: TLabel
                Left = 88
                Top = 25
                Width = 16
                Height = 13
                Caption = 'PIS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 3815994
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label3: TLabel
                Left = 88
                Top = 67
                Width = 39
                Height = 13
                Caption = 'COFINS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 3815994
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label6: TLabel
                Left = 8
                Top = 67
                Width = 27
                Height = 13
                Caption = 'ICMS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 3815994
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edtCredSN: TCurrencyEdit
                Left = 8
                Top = 43
                Width = 73
                Height = 21
                AutoSize = False
                DisplayFormat = ',0.00;-,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object edtIcms: TCurrencyEdit
                Left = 7
                Top = 85
                Width = 73
                Height = 21
                AutoSize = False
                DisplayFormat = ',0.00;-,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object edtPis: TCurrencyEdit
                Left = 88
                Top = 43
                Width = 73
                Height = 21
                AutoSize = False
                DisplayFormat = ',0.00;-,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object edtCofins: TCurrencyEdit
                Left = 88
                Top = 85
                Width = 73
                Height = 21
                AutoSize = False
                DisplayFormat = ',0.00;-,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
            end
          end
          object tabConfiguracoesEmail: TTabSheet
            Caption = 'Configura'#231#245'es E-mail'
            ImageIndex = 1
            object lblSMTPHost: TLabel
              Left = 14
              Top = 14
              Width = 57
              Height = 13
              Hint = 'Exemplo: smtp.gmail.com'
              Caption = 'SMTP Host'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 3815994
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object lblSMTPPort: TLabel
              Left = 16
              Top = 54
              Width = 55
              Height = 13
              Hint = 'Exemplo: 465'
              Caption = 'SMTP Port'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 3815994
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object lblSMTPUser: TLabel
              Left = 14
              Top = 94
              Width = 56
              Height = 13
              Hint = 'Exemplo: seu_email@gmail.com'
              Caption = 'SMTP User'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 3815994
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object lblSMTPPassword: TLabel
              Left = 16
              Top = 139
              Width = 83
              Height = 13
              Hint = 'Digite a senha do e-mail'
              Caption = 'SMTP Password'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 3815994
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object lblAssunto: TLabel
              Left = 17
              Top = 192
              Width = 49
              Height = 13
              Hint = 'Assunto do e-mail enviado. Exemplo: ENVIO DE NF-E'
              Caption = 'Assunto: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 3815994
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object edtSMTPPort: TCurrencyEdit
              Left = 17
              Top = 70
              Width = 114
              Height = 21
              Hint = 'Exemplo: 465'
              AutoSize = False
              DisplayFormat = ',0;-,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
            object chkUsaSSL: TCheckBox
              Left = 183
              Top = 31
              Width = 97
              Height = 17
              Hint = 'Marque se o servidor utiliza  autentica'#231#227'o segura'
              Caption = 'Usa SSL?'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object gbMensagem: TGroupBox
              Left = 12
              Top = 218
              Width = 304
              Height = 196
              Hint = 'Mensagem do e-mail enviado. Exemplo: SEGUE EM ANEXO NF-E.'
              Caption = 'Mensagem'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              object memoMensagem: TMemo
                Left = 2
                Top = 17
                Width = 300
                Height = 177
                Hint = 'Mensagem do e-mail enviado. Exemplo: SEGUE EM ANEXO NF-E.'
                Align = alClient
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
            end
            object edtAssunto: TEdit
              Left = 69
              Top = 188
              Width = 245
              Height = 21
              Hint = 'Exemplo: Envio de NF-e'
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
            end
            object edtSMTPPassword: TEdit
              Left = 16
              Top = 155
              Width = 171
              Height = 21
              Hint = 'Digite a senha do e-mail'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 50
              ParentFont = False
              ParentShowHint = False
              PasswordChar = '*'
              ShowHint = True
              TabOrder = 4
            end
            object edtSMTPUser: TEdit
              Left = 16
              Top = 112
              Width = 282
              Height = 21
              Hint = 'Exemplo: seu_email@gmail.com'
              CharCase = ecLowerCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 50
              ParentFont = False
              TabOrder = 3
            end
            object edtSMTPHost: TEdit
              Left = 16
              Top = 30
              Width = 162
              Height = 21
              Hint = 'Exemplo: smtp.gmail.com'
              CharCase = ecLowerCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 50
              ParentFont = False
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  inherited cds: TClientDataSet
    object cdsCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object cdsRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o'
      FieldName = 'RAZAO'
      Size = 40
    end
  end
end
