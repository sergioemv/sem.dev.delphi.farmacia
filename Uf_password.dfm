object f_password: Tf_password
  Left = 314
  Top = 179
  Width = 213
  Height = 224
  BorderIcons = []
  BorderStyle = bsSizeToolWin
  Caption = 'Seguridad'
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 8
    Top = 40
    Width = 185
    Height = 121
    Color = clSkyBlue
    TabOrder = 0
    object Label1: TLabel
      Left = 103
      Top = 99
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Edit1: TEdit
      Left = 144
      Top = 96
      Width = 36
      Height = 21
      MaxLength = 3
      PasswordChar = '*'
      TabOrder = 1
    end
    object dxDBGrid1: TdxDBGrid
      Left = 5
      Top = 5
      Width = 174
      Height = 87
      Bands = <
        item
          Caption = 'Usuario'
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'Codigo'
      SummaryGroups = <>
      SummarySeparator = ', '
      TabOrder = 0
      DataSource = ds_empleado
      Filter.Criteria = {00000000}
      LookAndFeel = lfUltraFlat
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      PreviewFieldName = 'Nombre'
      ScrollBars = ssNone
      ShowGrid = False
      ShowHeader = False
      ShowPreviewGrid = False
      object dxDBGrid1Nombre: TdxDBGridColumn
        Sorted = csUp
        Width = 170
        BandIndex = 0
        RowIndex = 0
        FieldName = 'Nombre'
      end
    end
  end
  object ds_empleado: TDataSource
    DataSet = mc_datos.Empleado
    Left = 8
  end
end
