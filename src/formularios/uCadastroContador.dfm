inherited frmCadastroContador: TfrmCadastroContador
  Left = 410
  Top = 173
  Caption = 'Cadastro de Contadores'
  ClientWidth = 523
  Position = poMainFormCenter
  ExplicitWidth = 539
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Width = 523
    ExplicitWidth = 523
  end
  inherited pgGeral: TPageControl
    Width = 523
    ExplicitWidth = 523
    inherited tsConsulta: TTabSheet
      ExplicitWidth = 515
      inherited gridConsulta: TDBGridCBN
        Width = 497
        Height = 353
      end
      inherited lblAjudaSelecionar: TStaticText
        Width = 515
        ExplicitWidth = 515
      end
      object CheckBox1: TCheckBox
        Left = 32
        Top = 360
        Width = 97
        Height = 17
        Caption = 'CheckBox1'
        TabOrder = 2
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 515
      ExplicitHeight = 378
      inherited pnlDados: TPanel
        Width = 515
        ExplicitWidth = 515
        inherited lblAsterisco: TLabel
          Font.Color = 5916707
        end
        object edtCodigo: TCurrencyEdit
          Left = 8
          Top = -5
          Width = 73
          Height = 21
          AutoSize = False
          DisplayFormat = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = False
        end
        object gpbIdentificacao: TGroupBox
          Left = 12
          Top = 7
          Width = 493
          Height = 109
          Caption = ' Identifica'#231#227'o '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object lblRazao: TLabel
            Left = 13
            Top = 18
            Width = 104
            Height = 13
            Caption = 'Nome / Raz'#227'o Social'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblCPF_CNPJ: TLabel
            Left = 13
            Top = 58
            Width = 19
            Height = 13
            Caption = 'CPF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblRG_IE: TLabel
            Left = 289
            Top = 58
            Width = 21
            Height = 13
            Caption = 'CRC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label1: TLabel
            Left = 149
            Top = 58
            Width = 25
            Height = 13
            Caption = 'CNPJ'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 1
            Top = 49
            Width = 11
            Height = 32
            Caption = '*'
            Font.Charset = ANSI_CHARSET
            Font.Color = 5916707
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 276
            Top = 49
            Width = 11
            Height = 32
            Caption = '*'
            Font.Charset = ANSI_CHARSET
            Font.Color = 5916707
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 1
            Top = 9
            Width = 11
            Height = 32
            Caption = '*'
            Font.Charset = ANSI_CHARSET
            Font.Color = 5916707
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtNome: TEdit
            Left = 13
            Top = 34
            Width = 467
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
          object edtCpf: TMaskEdit
            Left = 13
            Top = 74
            Width = 110
            Height = 21
            EditMask = '999\.999\.999\-99;0; '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 14
            ParentFont = False
            TabOrder = 1
            Text = ''
          end
          object edtCRC: TMaskEdit
            Left = 289
            Top = 74
            Width = 95
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 3
            Text = ''
          end
          object edtcnpj: TMaskEdit
            Left = 149
            Top = 74
            Width = 113
            Height = 21
            EditMask = '99\.999\.999/9999\-99;0; '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 18
            ParentFont = False
            TabOrder = 2
            Text = ''
          end
        end
        object gpbEndereco: TGroupBox
          Left = 12
          Top = 120
          Width = 493
          Height = 154
          Caption = ' Endere'#231'o '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Label2: TLabel
            Left = 13
            Top = 20
            Width = 91
            Height = 13
            Caption = 'Rua / Logradouro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 380
            Top = 20
            Width = 41
            Height = 13
            Caption = 'N'#250'mero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 13
            Top = 59
            Width = 31
            Height = 13
            Caption = 'Bairro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 390
            Top = 103
            Width = 19
            Height = 13
            Caption = 'CEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 1
            Top = 90
            Width = 11
            Height = 32
            Caption = '*'
            Font.Charset = ANSI_CHARSET
            Font.Color = 5916707
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtRua: TEdit
            Left = 13
            Top = 36
            Width = 352
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
          object edtNumero: TMaskEdit
            Left = 380
            Top = 36
            Width = 89
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 12
            ParentFont = False
            TabOrder = 1
            Text = ''
          end
          object edtBairro: TEdit
            Left = 13
            Top = 75
            Width = 352
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
          inline BuscaCidade1: TBuscaCidade
            Left = 13
            Top = 95
            Width = 372
            Height = 54
            TabOrder = 3
            ExplicitLeft = 13
            ExplicitTop = 95
            ExplicitWidth = 372
            inherited StaticText3: TStaticText
              Left = 339
              Width = 18
              Font.Color = clBlack
              Font.Style = []
              ExplicitLeft = 339
              ExplicitWidth = 18
            end
            inherited StaticText2: TStaticText
              Left = 98
              Width = 37
              Font.Color = clBlack
              Font.Style = []
              ExplicitLeft = 98
              ExplicitWidth = 37
            end
            inherited StaticText1: TStaticText
              Width = 37
              Font.Color = clBlack
              Font.Style = []
              ExplicitWidth = 37
            end
            inherited edtCidade: TEdit
              Left = 99
              Width = 230
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 99
              ExplicitWidth = 230
            end
            inherited btnBusca: TBitBtn
              Left = 69
              ExplicitLeft = 69
            end
            inherited edtUF: TEdit
              Left = 338
              Width = 29
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 338
              ExplicitWidth = 29
            end
            inherited edtCodCid: TCurrencyEdit
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object edtCep: TMaskEdit
            Left = 391
            Top = 119
            Width = 85
            Height = 21
            EditMask = '99999\-999;0; '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 9
            ParentFont = False
            TabOrder = 4
            Text = ''
          end
        end
        object gpbContato: TGroupBox
          Left = 12
          Top = 277
          Width = 493
          Height = 66
          Caption = ' Contato '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object lblEmail: TLabel
            Left = 136
            Top = 19
            Width = 31
            Height = 13
            Caption = 'E-mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object edtEmail: TEdit
            Left = 136
            Top = 35
            Width = 342
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
            Left = 8
            Top = 16
            Width = 122
            Height = 47
            TabOrder = 1
            ExplicitLeft = 8
            ExplicitTop = 16
            ExplicitWidth = 122
          end
        end
      end
    end
  end
  inherited cds: TClientDataSet
    Left = 119
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsNOME: TStringField
      FieldName = 'NOME'
    end
  end
  inherited ds: TDataSource
    Left = 162
    Top = 168
  end
end
