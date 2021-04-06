object f_venta: Tf_venta
  Left = 236
  Top = 127
  Width = 492
  Height = 370
  BorderStyle = bsSizeToolWin
  Caption = 'Nota de Venta'
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 42
    Width = 37
    Height = 13
    Caption = 'Nombre'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 19
    Top = 74
    Width = 23
    Height = 13
    Caption = 'RUC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 10
    Width = 49
    Height = 16
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 344
    Top = 274
    Width = 57
    Height = 13
    Caption = 'Monto Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 192
    Top = 74
    Width = 74
    Height = 13
    Caption = 'Tipo de Cambio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBText3: TDBText
    Left = 283
    Top = 73
    Width = 65
    Height = 17
    DataField = 'TC'
    DataSource = M_venta.ds_venta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object l_monto: TLabel
    Left = 415
    Top = 274
    Width = 45
    Height = 13
    Caption = 'l_monto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 274
    Width = 51
    Height = 13
    Caption = 'N� Factura'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 96
    Width = 465
    Height = 161
    TabStop = False
    DataSource = M_venta.ds_det_venta
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PRODUCTO'
        Title.Caption = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBREPROD'
        Title.Caption = 'Descripcion'
        Width = 201
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Title.Caption = 'Cantidad'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_UNIT'
        Title.Caption = 'Precio'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_TOTAL'
        Title.Caption = 'Subtotal'
        Width = 72
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 51
    Top = 38
    Width = 238
    Height = 21
    DataField = 'NOMBRE'
    DataSource = M_venta.ds_cliente
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 52
    Top = 67
    Width = 121
    Height = 21
    DataField = 'RUC'
    DataSource = M_venta.ds_cliente
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 360
    Top = 32
    Width = 81
    Height = 49
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    Color = clWhite
    TabOrder = 4
    object DBText1: TDBText
      Left = 8
      Top = 24
      Width = 65
      Height = 17
      Alignment = taCenter
      DataField = 'ID_VENTA'
      DataSource = M_venta.ds_venta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 8
      Width = 43
      Height = 13
      Caption = 'N� Venta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 302
    Width = 484
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    Color = clTeal
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 160
      Top = 8
      Width = 153
      Height = 25
      Caption = 'Guardar sin Facturar'
      ModalResult = 1
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object b_facturar: TBitBtn
      Left = 8
      Top = 8
      Width = 147
      Height = 25
      Caption = '&Facturar'
      Default = True
      ModalResult = 8
      TabOrder = 0
      OnClick = b_facturarClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 320
      Top = 8
      Width = 153
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      Kind = bkCancel
    end
  end
  object e_numfac: TEdit
    Left = 64
    Top = 270
    Width = 97
    Height = 21
    Color = clSilver
    ReadOnly = True
    TabOrder = 5
  end
  object BitBtn2: TBitBtn
    Left = 168
    Top = 268
    Width = 113
    Height = 25
    Caption = '&Cambiar Numero'
    TabOrder = 6
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
      33333333333F8888883F33330000324334222222443333388F3833333388F333
      000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
      F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
      223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
      3338888300003AAAAAAA33333333333888888833333333330000333333333333
      333333333333333333FFFFFF000033333333333344444433FFFF333333888888
      00003A444333333A22222438888F333338F3333800003A2243333333A2222438
      F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
      22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
      33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
end
