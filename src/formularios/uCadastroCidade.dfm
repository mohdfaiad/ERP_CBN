inherited frmCadastroCidade: TfrmCadastroCidade
  Caption = 'Cadastro de Cidades'
  ClientHeight = 347
  ClientWidth = 549
  ExplicitWidth = 565
  ExplicitHeight = 385
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 305
    Width = 549
    ExplicitTop = 305
    ExplicitWidth = 549
  end
  inherited pgGeral: TPageControl
    Width = 549
    Height = 305
    ExplicitWidth = 549
    ExplicitHeight = 305
    inherited tsConsulta: TTabSheet
      ExplicitWidth = 541
      ExplicitHeight = 277
      inherited gridConsulta: TDBGridCBN
        Top = 7
        Width = 523
        Height = 251
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODIGO_IBGE'
            Title.Caption = 'C'#211'DIGO IBGE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Width = 409
            Visible = True
          end>
      end
      inherited lblAjudaSelecionar: TStaticText
        Top = 260
        Width = 541
        ExplicitTop = 260
        ExplicitWidth = 541
      end
    end
    inherited tsDados: TTabSheet
      ExplicitWidth = 541
      ExplicitHeight = 277
      inherited pnlDados: TPanel
        Width = 541
        Height = 277
        ExplicitWidth = 541
        ExplicitHeight = 277
        object Label1: TLabel
          Left = 71
          Top = 125
          Width = 36
          Height = 13
          Caption = 'Cidade'
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
          Width = 65
          Height = 13
          Caption = 'C'#243'digo IBGE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 236
          Top = 69
          Width = 14
          Height = 13
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtCidade: TEdit
          Left = 71
          Top = 144
          Width = 394
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object edtCodigo: TEdit
          Left = 23
          Top = 13
          Width = 57
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Visible = False
        end
        object cmbUF: TComboBox
          Left = 236
          Top = 88
          Width = 93
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 2
          Text = '<Selecione>'
          Items.Strings = (
            '<Selecione>'
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'RR'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'TO'
            'SC'
            'SP'
            'SE')
        end
        object edtCodigoIBGE: TCurrencyEdit
          Left = 71
          Top = 88
          Width = 121
          Height = 21
          DisplayFormat = '0'
          MaxLength = 7
          TabOrder = 1
        end
      end
    end
  end
  inherited cds: TClientDataSet
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object cdsCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
    end
  end
end
