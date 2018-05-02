inherited frmCadastroPlanoContasContabeis: TfrmCadastroPlanoContasContabeis
  Caption = 'Cadastro de Plano de Contas Cont'#225'beis'
  ClientHeight = 381
  ClientWidth = 647
  ExplicitWidth = 663
  ExplicitHeight = 419
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotoes: TPanel
    Top = 339
    Width = 647
    ExplicitTop = 339
    ExplicitWidth = 647
  end
  inherited pgGeral: TPageControl
    Width = 647
    Height = 339
    ActivePage = tsDados
    ExplicitWidth = 647
    ExplicitHeight = 339
    inherited tsConsulta: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inherited gridConsulta: TDBGridCBN
        Width = 621
        Height = 281
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'COD_CTA'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CTA'
            Width = 537
            Visible = True
          end>
      end
      inherited lblAjudaSelecionar: TStaticText
        Top = 290
        Width = 240
        ExplicitTop = 290
        ExplicitWidth = 240
      end
    end
    inherited tsDados: TTabSheet
      inherited pnlDados: TPanel
        Width = 639
        Height = 309
        ExplicitWidth = 639
        ExplicitHeight = 309
        object lblRazao: TLabel
          Left = 61
          Top = 53
          Width = 95
          Height = 13
          Caption = 'Inclus'#227'o/Altera'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 205
          Top = 53
          Width = 94
          Height = 13
          Caption = 'Natureza da conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 405
          Top = 53
          Width = 70
          Height = 13
          Caption = 'Tipo da conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 205
          Top = 109
          Width = 86
          Height = 13
          Caption = 'C'#243'digo da conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 320
          Top = 109
          Width = 78
          Height = 13
          Caption = 'Nome da conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 61
          Top = 109
          Width = 25
          Height = 13
          Caption = 'N'#237'vel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtCodigo: TCurrencyEdit
          Left = 8
          Top = 3
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
        object edtCodigoConta: TEdit
          Left = 205
          Top = 128
          Width = 94
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
        object cbxNaturezaConta: TComboBox
          Left = 205
          Top = 72
          Width = 172
          Height = 23
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 2
          Text = '< Selecione >'
          Items.Strings = (
            '< Selecione >'
            '01 - Contas de ativo'
            '02 - Contas de passivo'
            '03 - Patrim'#244'nio l'#237'quido'
            '04 - Contas de resultado'
            '05 - Contas de compensa'#231#227'o'
            '09 - Outras')
        end
        object dtpAlteracao: TDateTimePicker
          Left = 61
          Top = 72
          Width = 113
          Height = 23
          Date = 43146.653794664350000000
          Time = 43146.653794664350000000
          TabOrder = 1
        end
        object edtNomeConta: TEdit
          Left = 320
          Top = 128
          Width = 257
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
        object cbxTipoConta: TComboBox
          Left = 405
          Top = 72
          Width = 172
          Height = 23
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 3
          Text = '< Selecione >'
          Items.Strings = (
            '< Selecione >'
            'S - Sint'#233'tica (grupo de contas)'
            'A - Anal'#237'tica (conta)')
        end
        object edtNivelConta: TCurrencyEdit
          Left = 61
          Top = 127
          Width = 113
          Height = 23
          DisplayFormat = '0'
          TabOrder = 4
        end
      end
    end
  end
  inherited cds: TClientDataSet
    Left = 23
    Top = 248
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsCOD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 60
    end
    object cdsNOME_CTA: TStringField
      FieldName = 'NOME_CTA'
      Size = 60
    end
  end
  inherited ds: TDataSource
    Left = 98
    Top = 238
  end
end
