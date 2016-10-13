inherited frmCadastroNCM: TfrmCadastroNCM
  Caption = 'Cadastro de NCM'#39's'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgGeral: TPageControl
    ActivePage = tsConsulta
    inherited tsConsulta: TTabSheet
      inherited gridConsulta: TDBGridCBN
        SalvaConfiguracoes = False
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NCM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 576
            Visible = True
          end>
      end
      inherited lblAjudaSelecionar: TStaticText
        ExplicitWidth = 696
      end
    end
    inherited tsDados: TTabSheet
      inherited pnlDados: TPanel
        object Label1: TLabel
          Left = 71
          Top = 125
          Width = 49
          Height = 13
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 71
          Top = 69
          Width = 27
          Height = 13
          Caption = 'NCM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 222
          Top = 71
          Width = 103
          Height = 13
          Caption = 'Unidade de Medida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtDescricao: TEdit
          Left = 71
          Top = 144
          Width = 394
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
        end
        object edtNCM: TCurrencyEdit
          Left = 71
          Top = 88
          Width = 121
          Height = 21
          DisplayFormat = '0'
          MaxLength = 8
          TabOrder = 0
        end
        object cmbUnidadeMedida: TComboBox
          Left = 222
          Top = 88
          Width = 108
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 1
          Text = '<selecione>'
          Items.Strings = (
            '<selecione>'
            'UN'
            'KG')
        end
        object edtCodigo: TEdit
          Left = 23
          Top = 13
          Width = 57
          Height = 21
          ReadOnly = True
          TabOrder = 3
          Visible = False
        end
      end
    end
  end
  inherited cds: TClientDataSet
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsNCM: TIntegerField
      FieldName = 'NCM'
    end
    object cdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
end
