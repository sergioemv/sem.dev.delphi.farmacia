object f_buscarproductos: Tf_buscarproductos
  Left = 191
  Top = 125
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Buscar productos '
  ClientHeight = 473
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = ch_avanzadaClick
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 513
    Height = 457
    ActivePage = Tgeneral
    Style = tsFlatButtons
    TabOrder = 0
    object Tgeneral: TTabSheet
      Caption = 'General'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 7
        Width = 505
        Height = 81
        Align = alBottom
        BorderWidth = 4
        BorderStyle = bsSingle
        Color = clTeal
        TabOrder = 0
        object b_busespec: TSpeedButton
          Left = 301
          Top = 44
          Width = 180
          Height = 22
          Caption = 'Buscar'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
            055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
            88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
            F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
            F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
            0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
            00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
            0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
            05555575FF777777755555500055555555555557775555555555}
          NumGlyphs = 2
          ParentFont = False
          OnClick = b_busespecClick
        end
        object Label2: TLabel
          Left = 8
          Top = 46
          Width = 122
          Height = 16
          Caption = 'Nombre del Producto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object e_datoesp: TEdit
          Left = 8
          Top = 8
          Width = 481
          Height = 24
          TabOrder = 0
          OnChange = b_buscarClick
          OnKeyPress = e_datoespKeyPress
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 88
        Width = 505
        Height = 290
        Align = alBottom
        DataSource = M_venta.ds_Q_busespec
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Century Gothic'
        TitleFont.Style = []
        OnKeyPress = DBGrid1KeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_PRODUCTO'
            Title.Caption = 'Codigo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial Black'
            Title.Font.Style = []
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRECOMERCIAL'
            Title.Caption = 'Nombre'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial Black'
            Title.Font.Style = []
            Width = 218
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Proveedor'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial Black'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIOBOL'
            Title.Caption = 'Precio'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial Black'
            Title.Font.Style = []
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 0
        Top = 378
        Width = 505
        Height = 45
        Align = alBottom
        BevelInner = bvLowered
        Color = clTeal
        TabOrder = 2
        object BitBtn1: TBitBtn
          Left = 264
          Top = 8
          Width = 225
          Height = 25
          Hint = 'Salir de la Busqueda'
          Caption = 'Cancelar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TabStop = False
          Kind = bkCancel
        end
        object b_selesp: TBitBtn
          Left = 24
          Top = 8
          Width = 210
          Height = 25
          Hint = 'Seleccionar el producto '
          Caption = '&Seleccionar'
          ModalResult = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TabStop = False
          OnClick = b_selespClick
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
      end
    end
    object tespec: TTabSheet
      Caption = 'Especifica'
      object Panel1: TPanel
        Left = 0
        Top = 378
        Width = 505
        Height = 45
        Align = alBottom
        BevelInner = bvLowered
        Color = clTeal
        TabOrder = 0
        object b_cancelar: TBitBtn
          Left = 264
          Top = 8
          Width = 225
          Height = 25
          Hint = 'Salir de la Busqueda'
          Caption = 'Cancelar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TabStop = False
          Kind = bkCancel
        end
        object b_guardar_continuar: TBitBtn
          Left = 16
          Top = 8
          Width = 210
          Height = 25
          Hint = 'Seleccionar el producto '
          Caption = '&Seleccionar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TabStop = False
          OnClick = b_selprinClick
          Kind = bkYes
        end
      end
      object g_productos: TDBGrid
        Left = 0
        Top = 88
        Width = 505
        Height = 290
        TabStop = False
        Align = alBottom
        DataSource = M_venta.ds_producto
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Century Gothic'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Century Gothic'
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
            FieldName = 'NOMBRECOMERCIAL'
            Title.Caption = 'Nombre'
            Width = 350
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 7
        Width = 505
        Height = 81
        Align = alBottom
        BorderWidth = 4
        BorderStyle = bsSingle
        Color = clTeal
        TabOrder = 2
        object Label1: TLabel
          Left = 16
          Top = 44
          Width = 82
          Height = 16
          Caption = 'Busqueda Por'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object C_opbusq: TComboBox
          Left = 117
          Top = 41
          Width = 145
          Height = 24
          ItemHeight = 16
          Sorted = True
          TabOrder = 1
          Text = '2- Nombre'
          OnChange = C_opbusqChange
          Items.Strings = (
            '1- Codigo'
            '2- Nombre')
        end
        object e_dato: TEdit
          Left = 16
          Top = 8
          Width = 473
          Height = 24
          TabOrder = 0
          OnChange = b_buscarClick
        end
        object Ch_proveedor: TCheckBox
          Left = 24
          Top = 128
          Width = 145
          Height = 17
          Caption = 'Proveedor especifico'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Ch_proveedorClick
        end
        object DBLookupListBox1: TDBLookupListBox
          Left = 168
          Top = 125
          Width = 160
          Height = 20
          KeyField = 'COD_PROVEEDOR'
          ListField = 'NOMBRE'
          ListSource = M_venta.ds_proveedor
          TabOrder = 3
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Principio Activo'
      ImageIndex = 2
      object Panel5: TPanel
        Left = 0
        Top = 8
        Width = 505
        Height = 73
        Align = alBottom
        BorderWidth = 4
        BorderStyle = bsSingle
        Color = clTeal
        TabOrder = 0
        object Label3: TLabel
          Left = 8
          Top = 37
          Width = 164
          Height = 16
          Caption = 'Principio Activo del producto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object B_buscprincipio: TSpeedButton
          Left = 302
          Top = 36
          Width = 180
          Height = 22
          Caption = 'Buscar'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
            055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
            88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
            F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
            F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
            0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
            00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
            0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
            05555575FF777777755555500055555555555557775555555555}
          NumGlyphs = 2
          ParentFont = False
          OnClick = B_buscprincipioClick
        end
        object CheckBox1: TCheckBox
          Left = 24
          Top = 128
          Width = 145
          Height = 17
          Caption = 'Proveedor especifico'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Ch_proveedorClick
        end
        object DBLookupListBox2: TDBLookupListBox
          Left = 168
          Top = 125
          Width = 160
          Height = 20
          KeyField = 'COD_PROVEEDOR'
          ListField = 'NOMBRE'
          ListSource = M_venta.ds_proveedor
          TabOrder = 1
        end
        object e_datoprin: TEdit
          Left = 8
          Top = 8
          Width = 481
          Height = 24
          TabOrder = 2
          OnKeyPress = e_datoprinKeyPress
        end
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 81
        Width = 505
        Height = 297
        Align = alBottom
        DataSource = M_venta.bs_busprincipio
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Century Gothic'
        TitleFont.Style = []
        OnKeyPress = DBGrid2KeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Principio Activo'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRECOMERCIAL'
            Title.Caption = 'Producto'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBREPROV'
            Title.Caption = 'Proveedor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIOBOL'
            Title.Caption = 'Precio'
            Visible = True
          end>
      end
      object Panel6: TPanel
        Left = 0
        Top = 378
        Width = 505
        Height = 45
        Align = alBottom
        BevelInner = bvLowered
        Color = clTeal
        TabOrder = 2
        object BitBtn3: TBitBtn
          Left = 264
          Top = 8
          Width = 225
          Height = 25
          Hint = 'Salir de la Busqueda'
          Caption = 'Cancelar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TabStop = False
          Kind = bkCancel
        end
        object BitBtn4: TBitBtn
          Left = 16
          Top = 8
          Width = 210
          Height = 25
          Hint = 'Seleccionar el producto '
          Caption = '&Seleccionar'
          ModalResult = 6
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TabStop = False
          OnClick = sel_princlick
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
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Accion Terapeutica'
      ImageIndex = 3
      object Panel7: TPanel
        Left = 0
        Top = 378
        Width = 505
        Height = 45
        Align = alBottom
        BevelInner = bvLowered
        Color = clTeal
        TabOrder = 0
        object BitBtn2: TBitBtn
          Left = 264
          Top = 8
          Width = 225
          Height = 25
          Hint = 'Salir de la Busqueda'
          Caption = 'Cancelar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TabStop = False
          Kind = bkCancel
        end
        object b_selaccion: TBitBtn
          Left = 16
          Top = 8
          Width = 210
          Height = 25
          Hint = 'Seleccionar el producto '
          Caption = '&Seleccionar'
          ModalResult = 6
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TabStop = False
          OnClick = b_selaccionClick
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
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 81
        Width = 505
        Height = 297
        Align = alBottom
        DataSource = M_venta.ds_busaccion
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Century Gothic'
        TitleFont.Style = []
        OnKeyPress = DBGrid3KeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Accion Terapeutica'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRECOMERCIAL'
            Title.Caption = 'Producto'
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBREPROV'
            Title.Caption = 'Proveedor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIOBOL'
            Title.Caption = 'Precio'
            Visible = True
          end>
      end
      object Panel8: TPanel
        Left = 0
        Top = 8
        Width = 505
        Height = 73
        Align = alBottom
        BorderWidth = 4
        BorderStyle = bsSingle
        Color = clTeal
        TabOrder = 2
        object Label4: TLabel
          Left = 8
          Top = 37
          Width = 188
          Height = 16
          Caption = 'Accion Terapeutica del Producto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object b_busaccion: TSpeedButton
          Left = 302
          Top = 36
          Width = 180
          Height = 22
          Caption = 'Buscar'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
            055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
            88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
            F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
            F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
            0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
            00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
            0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
            05555575FF777777755555500055555555555557775555555555}
          NumGlyphs = 2
          ParentFont = False
          OnClick = b_busaccionClick
        end
        object CheckBox2: TCheckBox
          Left = 24
          Top = 128
          Width = 145
          Height = 17
          Caption = 'Proveedor especifico'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Ch_proveedorClick
        end
        object DBLookupListBox3: TDBLookupListBox
          Left = 168
          Top = 125
          Width = 160
          Height = 20
          KeyField = 'COD_PROVEEDOR'
          ListField = 'NOMBRE'
          ListSource = M_venta.ds_proveedor
          TabOrder = 1
        end
        object e_datoaccion: TEdit
          Left = 8
          Top = 8
          Width = 481
          Height = 24
          TabOrder = 2
          OnKeyPress = e_datoaccionKeyPress
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 454
    Width = 516
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 
      'Buscar=Enter     Seleccionar=Enter   Para moverse TAB + flechas ' +
      '  Cancelar=ESC'
  end
end
