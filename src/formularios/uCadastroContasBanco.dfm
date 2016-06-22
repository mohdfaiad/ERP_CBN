inherited frmCadastroContasBanco: TfrmCadastroContasBanco
  Caption = 'Cadastro de contas banc'#225'rias'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgGeral: TPageControl
    ActivePage = tsConsulta
    inherited tsConsulta: TTabSheet
      inherited gridConsulta: TDBGridCBN
        Columns = <
          item
            Expanded = False
            FieldName = 'BANCO'
            Width = 290
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULAR'
            Width = 352
            Visible = True
          end>
      end
      inherited lblAjudaSelecionar: TStaticText
        ExplicitWidth = 696
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 696
      ExplicitHeight = 378
      inherited pnlDados: TPanel
        object Label1: TLabel
          Left = 31
          Top = 34
          Width = 88
          Height = 13
          Caption = 'Ag'#234'ncia banc'#225'ria'
        end
        object Label2: TLabel
          Left = 31
          Top = 82
          Width = 80
          Height = 13
          Caption = 'T'#237'tular da conta'
        end
        object Label3: TLabel
          Left = 31
          Top = 130
          Width = 57
          Height = 13
          Caption = 'N'#186' Ag'#234'ncia'
        end
        object Label4: TLabel
          Left = 127
          Top = 130
          Width = 47
          Height = 13
          Caption = 'N'#186' Conta'
        end
        object edtCodigo: TCurrencyEdit
          Left = 4
          Top = 0
          Width = 45
          Height = 21
          DisplayFormat = '0'
          TabOrder = 0
          Visible = False
        end
        object edtBanco: TEdit
          Left = 31
          Top = 51
          Width = 306
          Height = 21
          TabOrder = 1
        end
        object edtTitular: TEdit
          Left = 31
          Top = 99
          Width = 306
          Height = 21
          TabOrder = 2
        end
        object edtNumAgencia: TEdit
          Left = 31
          Top = 147
          Width = 80
          Height = 21
          TabOrder = 3
        end
        object edtNumConta: TEdit
          Left = 127
          Top = 147
          Width = 114
          Height = 21
          TabOrder = 4
        end
      end
    end
  end
  inherited cds: TClientDataSet
    Left = 31
    Top = 224
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsBANCO: TStringField
      FieldName = 'BANCO'
      Size = 60
    end
    object cdsTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
  end
  inherited ds: TDataSource
    Left = 66
    Top = 224
  end
end
