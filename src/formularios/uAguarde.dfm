object frmAguarde: TfrmAguarde
  Left = 400
  Top = 288
  BorderStyle = bsNone
  Caption = 'frmAguarde'
  ClientHeight = 113
  ClientWidth = 515
  Color = clBtnHighlight
  TransparentColorValue = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape3: TShape
    Left = 0
    Top = 0
    Width = 515
    Height = 113
    Brush.Color = 2136956
    Pen.Color = 10197915
  end
  object Shape1: TShape
    Left = 107
    Top = 1
    Width = 408
    Height = 112
    Brush.Color = 13035741
    Pen.Color = 13035741
    Pen.Style = psClear
  end
  object memoAguarde: TMemo
    Left = 119
    Top = 19
    Width = 385
    Height = 82
    TabStop = False
    BevelInner = bvNone
    BorderStyle = bsNone
    Color = 13035741
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3245674
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Lines.Strings = (
      'Aguarde um momento por favor')
    ParentFont = False
    TabOrder = 0
  end
  object Indicator: TActivityIndicator
    Left = 24
    Top = 20
    IndicatorColor = aicWhite
    IndicatorSize = aisXLarge
  end
end
