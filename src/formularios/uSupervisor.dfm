object frmSupervisor: TfrmSupervisor
  Left = 412
  Top = 331
  BorderStyle = bsNone
  Caption = 'frmSupervisor'
  ClientHeight = 202
  ClientWidth = 443
  Color = 14408667
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 55
    Align = alTop
    TabOrder = 0
    object Shape3: TShape
      Left = -2
      Top = -67
      Width = 445
      Height = 125
      Brush.Color = 12246203
      Pen.Style = psClear
    end
    object Label5: TLabel
      Left = 16
      Top = 24
      Width = 245
      Height = 17
      Caption = 'Contate seu supervisor para prosseguir.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3618615
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 16
      Top = 8
      Width = 248
      Height = 17
      Caption = 'Voc'#234' n'#227'o tem permiss'#227'o para esta a'#231#227'o.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3618615
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 168
    Width = 443
    Height = 34
    Align = alBottom
    TabOrder = 1
    object Shape2: TShape
      Left = -2
      Top = -91
      Width = 445
      Height = 125
      Brush.Color = 12246203
      Pen.Style = psClear
    end
    object panInformacao: TPanel
      Left = 1
      Top = 5
      Width = 441
      Height = 28
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Favor, informe seu Login e senha...'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1917954
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 55
    Width = 443
    Height = 113
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 2
    object Shape1: TShape
      Left = 0
      Top = -7
      Width = 445
      Height = 125
      Brush.Color = 13099720
      Pen.Style = psClear
    end
    object Label1: TLabel
      Left = 72
      Top = 28
      Width = 69
      Height = 17
      Alignment = taRightJustify
      Caption = 'Supervisor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 394758
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 100
      Top = 63
      Width = 41
      Height = 17
      Caption = 'Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 394758
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtLogin: TEdit
      Left = 153
      Top = 27
      Width = 161
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object edtSenha: TEdit
      Left = 153
      Top = 63
      Width = 161
      Height = 22
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
    end
  end
end
