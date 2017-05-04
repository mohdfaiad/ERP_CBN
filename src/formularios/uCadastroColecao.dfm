inherited frmCadastroColecao: TfrmCadastroColecao
  Left = 405
  Top = 303
  Caption = 'Cadastro de Cole'#231#245'es'
  ClientHeight = 329
  ClientWidth = 520
  ExplicitWidth = 536
  ExplicitHeight = 367
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 287
    Width = 520
    ExplicitTop = 287
    ExplicitWidth = 520
  end
  inherited pgGeral: TPageControl
    Width = 520
    Height = 287
    ExplicitWidth = 520
    ExplicitHeight = 287
    inherited tsConsulta: TTabSheet
      ExplicitWidth = 512
      ExplicitHeight = 259
      inherited gridConsulta: TDBGridCBN
        Width = 494
        Height = 233
      end
      inherited lblAjudaSelecionar: TStaticText
        Top = 242
        Width = 512
        ExplicitTop = 242
        ExplicitWidth = 512
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 512
      ExplicitHeight = 259
      inherited pnlDados: TPanel
        Width = 512
        Height = 259
        ExplicitWidth = 512
        ExplicitHeight = 259
        object Label5: TLabel
          Left = 32
          Top = 65
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
          Left = 33
          Top = 81
          Width = 344
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
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
      Size = 30
    end
  end
end
