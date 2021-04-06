object f_tc1: Tf_tc1
  Left = 307
  Top = 172
  Width = 217
  Height = 124
  BorderStyle = bsSizeToolWin
  Caption = 'Tasa de Cambio global'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBText1: TDBText
    Left = 8
    Top = 24
    Width = 97
    Height = 17
    DataField = 'DESCRIPCION'
    DataSource = M_datos.ds_parametros
  end
  object DBEdit1: TDBEdit
    Left = 120
    Top = 24
    Width = 49
    Height = 21
    Color = clWhite
    DataField = 'VALOR'
    DataSource = M_datos.ds_parametros
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 64
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 112
    Top = 64
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
