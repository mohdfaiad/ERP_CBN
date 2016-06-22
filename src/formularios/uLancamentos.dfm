inherited frmLancamentos: TfrmLancamentos
  Left = 380
  Top = 131
  Caption = 'Lan'#231'amentos'
  ClientWidth = 524
  ExplicitWidth = 540
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Width = 524
    ExplicitWidth = 524
  end
  inherited pgGeral: TPageControl
    Width = 524
    ExplicitWidth = 524
    inherited tsConsulta: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inherited gridConsulta: TDBGridCBN
        Top = 16
        Width = 498
        Height = 354
      end
      inherited lblAjudaSelecionar: TStaticText
        Width = 222
      end
    end
    inherited tsDados: TTabSheet
      inherited pnlDados: TPanel
        Width = 516
        ExplicitWidth = 516
        object Label1: TLabel
          Left = 16
          Top = 120
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
          Left = 16
          Top = 64
          Width = 110
          Height = 13
          Caption = 'Total do Lan'#231'amento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 144
          Top = 64
          Width = 62
          Height = 13
          Caption = 'Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 265
          Top = 64
          Width = 38
          Height = 13
          Caption = 'Cria'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2434341
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 386
          Top = 64
          Width = 23
          Height = 13
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2434341
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtCodigo: TCurrencyEdit
          Left = 17
          Top = 19
          Width = 88
          Height = 21
          AutoSize = False
          DisplayFormat = '0'
          TabOrder = 0
          Visible = False
        end
        object memDescricao: TMemo
          Left = 16
          Top = 136
          Width = 481
          Height = 49
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
        end
        object edtTotalLancamento: TCurrencyEdit
          Left = 16
          Top = 80
          Width = 111
          Height = 21
          AutoSize = False
          DisplayFormat = ' ,0.00;- ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 28416
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object dtpDataVencimento: TDateTimePicker
          Left = 144
          Top = 80
          Width = 105
          Height = 23
          Date = 41695.389086631940000000
          Time = 41695.389086631940000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dtpDataCadastro: TDateTimePicker
          Left = 265
          Top = 80
          Width = 105
          Height = 23
          Date = 41695.389086631940000000
          Time = 41695.389086631940000000
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object gpbValores: TGroupBox
          Left = 10
          Top = 200
          Width = 493
          Height = 89
          Caption = ' Valores '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object Label3: TLabel
            Left = 368
            Top = 29
            Width = 51
            Height = 15
            Caption = 'V A L O R'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 9777436
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 16
            Top = 28
            Width = 57
            Height = 13
            Caption = 'Valor pago'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 3223857
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 120
            Top = 28
            Width = 80
            Height = 13
            Caption = 'Valor pendente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 3223857
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtValor: TCurrencyEdit
            Left = 368
            Top = 44
            Width = 113
            Height = 29
            AutoSize = False
            DisplayFormat = ' ,0.00;- ,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object edtValorAcertado: TCurrencyEdit
            Left = 16
            Top = 44
            Width = 89
            Height = 21
            AutoSize = False
            DisplayFormat = ' ,0.00;- ,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 7559221
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object edtValorPendente: TCurrencyEdit
            Left = 120
            Top = 44
            Width = 89
            Height = 21
            AutoSize = False
            DisplayFormat = ' ,0.00;- ,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 94
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
        object cbTipo: TComboBox
          Left = 387
          Top = 80
          Width = 112
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 6
          Text = '<Selecione>'
          Items.Strings = (
            '<Selecione>'
            'A Pagar'
            'A Receber')
        end
      end
    end
  end
  inherited cds: TClientDataSet
    object cdsCODIGO: TFloatField
      FieldName = 'CODIGO'
    end
    object cdsVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
    end
    object cdsVALOR_PAGO: TFloatField
      FieldName = 'VALOR_PAGO'
    end
    object cdsVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
  end
end
