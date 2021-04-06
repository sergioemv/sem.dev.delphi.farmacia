object f_progreso: Tf_progreso
  Left = 253
  Top = 286
  BorderStyle = bsNone
  Caption = 'f_progreso'
  ClientHeight = 51
  ClientWidth = 290
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object l_prog: TLabel
    Left = 9
    Top = 0
    Width = 29
    Height = 13
    Caption = 'l_prog'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object gauge1: TProgressBar
    Left = 16
    Top = 24
    Width = 265
    Height = 16
    Min = 0
    Max = 14
    Smooth = True
    Step = 1
    TabOrder = 0
  end
end
