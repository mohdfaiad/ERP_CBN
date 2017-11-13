inherited frmCadastroMateria: TfrmCadastroMateria
  Left = 260
  Top = 131
  Caption = 'Cadastro de Mat'#233'rias'
  PixelsPerInch = 96
  TextHeight = 15
  inherited pgGeral: TPageControl
    inherited tsConsulta: TTabSheet
      inherited gridConsulta: TDBGridCBN
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 580
            Visible = True
          end>
      end
      inherited lblAjudaSelecionar: TStaticText
        ExplicitWidth = 696
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 26
      ExplicitWidth = 696
      ExplicitHeight = 376
      inherited pnlDados: TPanel
        object Label12: TLabel
          Left = 16
          Top = 81
          Width = 76
          Height = 13
          Caption = 'Pre'#231'o de custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 128
          Top = 81
          Width = 80
          Height = 13
          Caption = 'Pre'#231'o de venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 240
          Top = 81
          Width = 74
          Height = 13
          Caption = 'Estoque F'#237'sico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 352
          Top = 81
          Width = 86
          Height = 13
          Caption = 'Estoque M'#237'nimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 456
          Top = 193
          Width = 44
          Height = 13
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label5: TLabel
          Left = 16
          Top = 25
          Width = 49
          Height = 13
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 376
          Top = 25
          Width = 27
          Height = 13
          Caption = 'NCM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 496
          Top = 81
          Width = 90
          Height = 13
          Caption = 'Controla estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtCodigo: TEdit
          Left = 169
          Top = 16
          Width = 65
          Height = 21
          TabStop = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0'
          Visible = False
        end
        object edtDescricao: TEdit
          Left = 17
          Top = 41
          Width = 344
          Height = 23
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object edtCodNCM: TEdit
          Left = 377
          Top = 41
          Width = 128
          Height = 23
          CharCase = ecUpperCase
          MaxLength = 8
          TabOrder = 2
          OnKeyPress = edtCodNCMKeyPress
        end
        object edtPrecoCusto: TCurrencyEdit
          Left = 16
          Top = 99
          Width = 89
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          TabOrder = 4
        end
        object edtPrecoVenda: TCurrencyEdit
          Left = 128
          Top = 99
          Width = 89
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          TabOrder = 5
        end
        object edtEstoqueFisico: TCurrencyEdit
          Left = 240
          Top = 99
          Width = 89
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          Enabled = False
          TabOrder = 6
        end
        object edtEstoqueMinimo: TCurrencyEdit
          Left = 352
          Top = 99
          Width = 89
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          TabOrder = 7
        end
        object cbUnidade: TComboBox
          Left = 456
          Top = 208
          Width = 97
          Height = 23
          TabOrder = 8
          Visible = False
          Items.Strings = (
            'UN'
            'KG'
            'PCT'
            'L')
        end
        inline ListaUnidade: TListaCampo
          Left = 514
          Top = 22
          Width = 109
          Height = 44
          TabOrder = 3
          ExplicitLeft = 514
          ExplicitTop = 22
          ExplicitWidth = 109
          ExplicitHeight = 44
          inherited staTitulo: TLabel
            Top = 1
            Font.Color = 3355443
            ExplicitTop = 1
          end
          inherited comListaCampo: TComboBox
            Width = 89
            Height = 23
            ExplicitWidth = 89
            ExplicitHeight = 23
          end
        end
        object cbxControlaEstoque: TComboBox
          Left = 496
          Top = 99
          Width = 113
          Height = 23
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 9
          Text = 'N'#195'O'
          Items.Strings = (
            'SIM'
            'N'#195'O')
        end
      end
    end
  end
  inherited cds: TClientDataSet
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
end
