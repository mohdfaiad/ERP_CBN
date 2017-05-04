inherited frmCadastroIntervaloProducao: TfrmCadastroIntervaloProducao
  Left = 408
  Top = 199
  Caption = 'Cadastro de intervalos de produ'#231#227'o'
  ClientHeight = 354
  ClientWidth = 525
  ExplicitWidth = 541
  ExplicitHeight = 392
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 312
    Width = 525
    ExplicitTop = 312
    ExplicitWidth = 525
  end
  inherited pgGeral: TPageControl
    Width = 525
    Height = 312
    ExplicitWidth = 525
    ExplicitHeight = 312
    inherited tsConsulta: TTabSheet
      ExplicitWidth = 517
      ExplicitHeight = 284
      inherited gridConsulta: TDBGridCBN
        Width = 499
        Height = 258
      end
      inherited lblAjudaSelecionar: TStaticText
        Top = 267
        Width = 517
        ExplicitTop = 267
        ExplicitWidth = 517
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 517
      ExplicitHeight = 284
      inherited pnlDados: TPanel
        Width = 517
        Height = 284
        ExplicitWidth = 517
        ExplicitHeight = 284
        object Label1: TLabel
          Left = 24
          Top = 40
          Width = 276
          Height = 17
          Caption = 'Informe os hor'#225'rios de in'#237'cio e fim do intervalo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 96
          Top = 84
          Width = 30
          Height = 17
          Caption = 'In'#237'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 208
          Top = 84
          Width = 20
          Height = 17
          Caption = 'Fim'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtHoraInicio: TMaskEdit
          Left = 96
          Top = 104
          Width = 63
          Height = 21
          EditMask = '!99:99;1; '
          MaxLength = 5
          TabOrder = 0
          Text = '  :  '
          OnExit = edtHoraInicioExit
        end
        object edtHoraFim: TMaskEdit
          Left = 208
          Top = 104
          Width = 63
          Height = 21
          EditMask = '!99:99;1; '
          MaxLength = 5
          TabOrder = 1
          Text = '  :  '
          OnExit = edtHoraFimExit
        end
        object edtCodigo: TEdit
          Left = 81
          Top = 8
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
  inherited cds: TClientDataSet
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsHORA_INICIO: TTimeField
      FieldName = 'HORA_INICIO'
    end
    object cdsHORA_FIM: TTimeField
      FieldName = 'HORA_FIM'
    end
  end
end
