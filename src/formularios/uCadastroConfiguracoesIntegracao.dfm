inherited frmCadastroConfiguracoesIntegracao: TfrmCadastroConfiguracoesIntegracao
  Caption = 'Configura'#231#245'es de Integra'#231#227'o'
  ClientWidth = 569
  ExplicitWidth = 585
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotoes: TPanel
    Width = 569
    ExplicitWidth = 569
  end
  inherited pgGeral: TPageControl
    Width = 569
    ExplicitWidth = 569
    inherited tsConsulta: TTabSheet
      ExplicitWidth = 561
      inherited gridConsulta: TDBGridCBN
        Width = 543
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'URL_BASE'
            Width = 455
            Visible = True
          end>
      end
      inherited lblAjudaSelecionar: TStaticText
        Width = 561
        ExplicitWidth = 561
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 26
      ExplicitWidth = 561
      ExplicitHeight = 376
      inherited pnlDados: TPanel
        Width = 561
        ExplicitWidth = 561
        object Label1: TLabel
          Left = 93
          Top = 40
          Width = 106
          Height = 15
          Caption = 'Token da aplica'#231#227'o'
        end
        object Label2: TLabel
          Left = 93
          Top = 136
          Width = 50
          Height = 14
          Caption = 'URL Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 93
          Top = 88
          Width = 98
          Height = 15
          Caption = 'Token da empresa'
        end
        object edtApplicationToken: TEdit
          Left = 93
          Top = 56
          Width = 393
          Height = 23
          TabOrder = 0
        end
        object edtUrlBase: TEdit
          Left = 93
          Top = 150
          Width = 393
          Height = 23
          TabOrder = 1
        end
        object edtCompanyToken: TEdit
          Left = 93
          Top = 104
          Width = 393
          Height = 23
          TabOrder = 2
        end
        object edtCodigo: TEdit
          Left = 37
          Top = 0
          Width = 65
          Height = 21
          TabStop = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = '0'
          Visible = False
        end
      end
    end
  end
  inherited cds: TClientDataSet
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsURL_BASE: TStringField
      FieldName = 'URL_BASE'
      Size = 100
    end
  end
  inherited ds: TDataSource
    Left = 162
    Top = 168
  end
end
