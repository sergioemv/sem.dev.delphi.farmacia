object mc_datos: Tmc_datos
  OldCreateOrder = False
  Left = 195
  Top = 151
  Height = 322
  Width = 408
  object ConecLocal: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\bd_farmacia\FarA' +
      'ccess.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 8
  end
  object Productos: TADOTable
    Left = 96
    Top = 8
  end
  object AC_prod: TActionList
    Left = 32
    Top = 72
    object Ac_Mproductos: TAction
      Caption = 'Manejo de Productos'
      Hint = 'Manejo de productos (registro y actualizacion)'
      OnExecute = Ac_MproductosExecute
    end
    object AC_ingresar: TAction
      Caption = 'Ingresar'
      OnExecute = AC_ingresarExecute
    end
  end
  object Empleado: TADOTable
    Active = True
    Connection = ConecLocal
    CursorType = ctStatic
    TableName = 'EMPLEADO'
    Left = 176
    Top = 8
    object EmpleadoCodigo: TWideStringField
      FieldName = 'Codigo'
      FixedChar = True
      Size = 3
    end
    object EmpleadoNombre: TWideStringField
      FieldName = 'Nombre'
      FixedChar = True
      Size = 60
    end
    object EmpleadoPrivilegio: TWideStringField
      FieldName = 'Privilegio'
      FixedChar = True
      Size = 30
    end
  end
end
