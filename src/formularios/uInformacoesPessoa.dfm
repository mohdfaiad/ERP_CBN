inherited frmInformacoesPessoa: TfrmInformacoesPessoa
  Left = 357
  Top = 226
  BorderStyle = bsDialog
  Caption = 'Informa'#231#245'es do Cliente'
  ClientHeight = 261
  ClientWidth = 591
  OnShow = FormShow
  ExplicitWidth = 597
  ExplicitHeight = 289
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 576
    Height = 241
    TabOrder = 0
    object Label1: TLabel
      Left = 148
      Top = 14
      Width = 35
      Height = 13
      Caption = 'RG / IE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 62
      Height = 13
      Caption = 'Logradouro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 96
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
    object Label4: TLabel
      Left = 296
      Top = 56
      Width = 14
      Height = 13
      Caption = 'N'#186
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 384
      Top = 56
      Width = 31
      Height = 13
      Caption = 'Bairro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 136
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
    object Label7: TLabel
      Left = 56
      Top = 136
      Width = 20
      Height = 13
      Caption = 'CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 176
      Top = 136
      Width = 21
      Height = 13
      Caption = 'Pa'#237's'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtRg: TEdit
      Left = 148
      Top = 30
      Width = 130
      Height = 23
      ReadOnly = True
      TabOrder = 1
    end
    object edtLogradouro: TEdit
      Left = 8
      Top = 72
      Width = 270
      Height = 23
      ReadOnly = True
      TabOrder = 2
    end
    object edtNumero: TEdit
      Left = 296
      Top = 72
      Width = 71
      Height = 23
      ReadOnly = True
      TabOrder = 3
    end
    object edtBairro: TEdit
      Left = 384
      Top = 72
      Width = 174
      Height = 23
      ReadOnly = True
      TabOrder = 4
    end
    object edtCidade: TEdit
      Left = 8
      Top = 112
      Width = 270
      Height = 23
      ReadOnly = True
      TabOrder = 5
    end
    object edtUf: TEdit
      Left = 8
      Top = 152
      Width = 30
      Height = 23
      ReadOnly = True
      TabOrder = 6
    end
    object edtCEP: TMaskEdit
      Left = 55
      Top = 152
      Width = 104
      Height = 21
      EditMask = '99999\-999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Text = ''
    end
    object edtPais: TEdit
      Left = 176
      Top = 152
      Width = 103
      Height = 23
      ReadOnly = True
      TabOrder = 8
    end
    object GridEmail: TDBGrid
      Left = 296
      Top = 111
      Width = 271
      Height = 97
      Ctl3D = False
      DataSource = dsEmails
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 9
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Calibri'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'email'
          Title.Caption = ' E-mail'
          Visible = True
        end>
    end
    inline CpfCnpj: TMaskCpfCnpj
      Left = 0
      Top = 5
      Width = 138
      Height = 50
      TabOrder = 0
      ExplicitTop = 5
      ExplicitWidth = 138
      ExplicitHeight = 50
      inherited Label19: TLabel
        Visible = False
      end
      inherited comPessoa: TComboBox [1]
        Height = 23
        Visible = False
        ExplicitHeight = 23
      end
      inherited StaticText1: TStaticText [2]
        Visible = False
      end
      inherited StaticText2: TStaticText [3]
        Left = 9
        ExplicitLeft = 9
      end
      inherited edtCpf: TMaskEdit [4]
        Left = 8
        Height = 23
        ExplicitLeft = 8
        ExplicitHeight = 23
      end
    end
    inline Fone1: TFone
      Left = 6
      Top = 176
      Width = 132
      Height = 47
      TabOrder = 10
      ExplicitLeft = 6
      ExplicitTop = 176
      inherited edtFone: TMaskEdit
        Height = 23
        ExplicitHeight = 23
      end
    end
  end
  object cdsEmails: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 152
    object cdsEmailsemail: TStringField
      FieldName = 'email'
      Size = 150
    end
  end
  object dsEmails: TDataSource
    DataSet = cdsEmails
    Left = 432
    Top = 152
  end
end
