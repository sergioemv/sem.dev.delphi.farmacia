object f_numeroventa: Tf_numeroventa
  Left = 297
  Top = 224
  Width = 317
  Height = 124
  BorderStyle = bsSizeToolWin
  Caption = 'Ingrese el numero de proforma'
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Notebook1: TNotebook
    Left = 0
    Top = 0
    Width = 309
    Height = 97
    Align = alClient
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Numero_prof'
      object Label1: TLabel
        Left = 26
        Top = 26
        Width = 37
        Height = 13
        Caption = 'Numero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 85
        Top = 24
        Width = 177
        Height = 21
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 4
        Top = 67
        Width = 110
        Height = 25
        Caption = 'Realizar venta'
        TabOrder = 1
        OnClick = BitBtn1Click
        Kind = bkOK
      end
      object BitBtn3: TBitBtn
        Left = 113
        Top = 67
        Width = 110
        Height = 25
        Caption = 'Ver proforma'
        TabOrder = 2
        OnClick = BitBtn3Click
        Kind = bkHelp
      end
      object BitBtn2: TBitBtn
        Left = 223
        Top = 67
        Width = 83
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 3
        Kind = bkCancel
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Nombre_ruc_cli'
    end
  end
end
