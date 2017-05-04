inherited frmCadastroGrupo: TfrmCadastroGrupo
  Caption = 'Cadastro de Grupos'
  ClientHeight = 271
  ClientWidth = 547
  ExplicitWidth = 563
  ExplicitHeight = 309
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 229
    Width = 547
    ExplicitTop = 229
    ExplicitWidth = 547
  end
  inherited pgGeral: TPageControl
    Width = 547
    Height = 229
    ExplicitWidth = 547
    ExplicitHeight = 229
    inherited tsConsulta: TTabSheet
      ExplicitWidth = 539
      ExplicitHeight = 201
      inherited gridConsulta: TDBGridCBN
        Width = 521
        Height = 175
      end
      inherited lblAjudaSelecionar: TStaticText
        Top = 184
        Width = 539
        ExplicitTop = 184
        ExplicitWidth = 539
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 539
      ExplicitHeight = 201
      inherited pnlDados: TPanel
        Width = 539
        Height = 201
        ExplicitWidth = 539
        ExplicitHeight = 201
        object Label1: TLabel
          Left = 111
          Top = 61
          Width = 101
          Height = 13
          Caption = 'Descri'#231#227'o do grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtCodigo: TEdit
          Left = 23
          Top = 13
          Width = 57
          Height = 21
          ReadOnly = True
          TabOrder = 1
          Visible = False
        end
        object edtDescricao: TEdit
          Left = 111
          Top = 80
          Width = 329
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
      end
    end
  end
  inherited cds: TClientDataSet
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 30
    end
  end
end
