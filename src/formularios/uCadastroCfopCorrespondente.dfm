inherited frmCadastroCfopCorrespondente: TfrmCadastroCfopCorrespondente
  Left = 328
  Top = 131
  Caption = 'Cadastro de CFOP'#39's correspondentes'
  ClientWidth = 463
  ExplicitWidth = 479
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotoes: TPanel
    Width = 463
    ExplicitWidth = 463
    inherited btnIncluir: TSpeedButton
      Width = 110
      ExplicitWidth = 110
    end
    inherited btnAlterar: TSpeedButton
      Left = 120
      Width = 110
      ExplicitLeft = 120
      ExplicitWidth = 110
    end
    inherited btnCancelar: TBitBtn
      Left = 232
      Width = 110
      ExplicitLeft = 232
      ExplicitWidth = 110
    end
    inherited btnSalvar: TBitBtn
      Left = 344
      Width = 110
      ExplicitLeft = 344
      ExplicitWidth = 110
    end
  end
  inherited pgGeral: TPageControl
    Width = 463
    ExplicitWidth = 463
    inherited tsConsulta: TTabSheet
      ExplicitWidth = 455
      inherited gridConsulta: TDBGridCBN
        Width = 437
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CFOP_SAIDA'
            Title.Alignment = taCenter
            Title.Caption = 'CFOP Sa'#237'da'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 114
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CFOP_ENTRADA'
            Title.Alignment = taCenter
            Title.Caption = 'CFOP Entrada'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      inherited lblAjudaSelecionar: TStaticText
        Width = 455
        ExplicitWidth = 455
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 26
      ExplicitWidth = 455
      ExplicitHeight = 376
      inherited pnlDados: TPanel
        Width = 455
        ExplicitWidth = 455
        inherited lblCamposObrigatorios: TLabel
          Top = 356
          ExplicitTop = 356
        end
        inherited lblAsterisco: TLabel
          Top = 352
          ExplicitTop = 352
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 24
          Width = 427
          Height = 313
          Caption = ' Selecinone o CFOP de Sa'#237'da e seu respectivo CFOP de Entrada '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          inline ListaCFOPSaida: TListaCampo
            Left = 56
            Top = 40
            Width = 145
            Height = 64
            TabOrder = 0
            ExplicitLeft = 56
            ExplicitTop = 40
            ExplicitWidth = 145
            inherited staTitulo: TLabel
              Width = 74
              Caption = 'CFOP de sa'#237'da'
              ExplicitWidth = 74
            end
            inherited comListaCampo: TComboBox
              Width = 131
              ExplicitWidth = 131
            end
          end
          inline ListaCFOPEntrada: TListaCampo
            Left = 224
            Top = 40
            Width = 137
            Height = 64
            TabOrder = 1
            ExplicitLeft = 224
            ExplicitTop = 40
            ExplicitWidth = 137
            inherited staTitulo: TLabel
              Width = 87
              Caption = 'CFOP de entrada'
              ExplicitWidth = 87
            end
            inherited comListaCampo: TComboBox
              Width = 123
              ExplicitWidth = 123
            end
          end
          object edtCodigo: TEdit
            Left = 9
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
            TabOrder = 2
            Text = '0'
            Visible = False
          end
        end
      end
    end
  end
  inherited cds: TClientDataSet
    object cdsCFOP_SAIDA: TStringField
      FieldName = 'CFOP_SAIDA'
      Size = 4
    end
    object cdsCFOP_ENTRADA: TStringField
      FieldName = 'CFOP_ENTRADA'
    end
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
  end
end
