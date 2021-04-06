object M_reportes: TM_reportes
  OldCreateOrder = False
  Left = 211
  Top = 132
  Height = 375
  Width = 544
  object proveedor: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COD_PROVEEDOR'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PERSONA_CONTACTO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TELEF_DOM'
        DataType = ftInteger
      end
      item
        Name = 'TELEF_OF'
        DataType = ftInteger
      end
      item
        Name = 'TELEF_CEL'
        DataType = ftInteger
      end
      item
        Name = 'DIRECCION'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PAIS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CIUDAD'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CASILLA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'FAX'
        DataType = ftString
        Size = 17
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'COD_PROVEEDOR'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'NOMBRE_PROVEEDOR'
        Fields = 'NOMBRE'
      end>
    IndexFieldNames = 'NOMBRE'
    StoreDefs = True
    TableName = 'PROVEEDOR'
    Left = 32
    Top = 24
    object proveedorCOD_PROVEEDOR: TIBStringField
      FieldName = 'COD_PROVEEDOR'
      Required = True
      Size = 3
    end
    object proveedorNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Required = True
      Size = 30
    end
    object proveedorPERSONA_CONTACTO: TIBStringField
      FieldName = 'PERSONA_CONTACTO'
      Size = 60
    end
    object proveedorTELEF_DOM: TIntegerField
      FieldName = 'TELEF_DOM'
    end
    object proveedorTELEF_OF: TIntegerField
      FieldName = 'TELEF_OF'
    end
    object proveedorTELEF_CEL: TIntegerField
      FieldName = 'TELEF_CEL'
    end
    object proveedorDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Size = 100
    end
    object proveedorPAIS: TIBStringField
      FieldName = 'PAIS'
    end
    object proveedorCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
    end
    object proveedorEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object proveedorCASILLA: TIBStringField
      FieldName = 'CASILLA'
      Size = 5
    end
    object proveedorFAX: TIBStringField
      FieldName = 'FAX'
      Size = 17
    end
  end
  object Q_productos: TIBQuery
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    CachedUpdates = False
    DataSource = ds_proveedor
    SQL.Strings = (
      'select * from producto')
    Left = 176
    Top = 80
  end
  object ds_proveedor: TDataSource
    DataSet = proveedor
    Left = 32
    Top = 80
  end
  object Producto: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    AfterOpen = ProductoAfterOpen
    OnCalcFields = ProductoCalcFields
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COD_PRODUCTO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'COD_SUFIJO_PRODUCTO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NOMBRECOMERCIAL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'FECHA_PRIM_VENTA'
        DataType = ftDateTime
      end
      item
        Name = 'FECHA_ULT_VENTA'
        DataType = ftDateTime
      end
      item
        Name = 'ULTPRECIO'
        DataType = ftFloat
      end
      item
        Name = 'STOCK_MINIMO'
        DataType = ftInteger
      end
      item
        Name = 'STOCK_MAXIMO'
        DataType = ftInteger
      end
      item
        Name = 'STOCK_TOTAL'
        DataType = ftInteger
      end
      item
        Name = 'PCNT_GANANCIA'
        DataType = ftInteger
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'COD_PROVEEDOR'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PRECIO_SUG'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY3'
        Fields = 'COD_PRODUCTO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN4'
        Fields = 'COD_PROVEEDOR'
      end
      item
        Name = 'NOMBRECOMERCIAL_PRODUCTO'
        Fields = 'NOMBRECOMERCIAL'
      end
      item
        Name = 'COD_PROV_PROD'
        Fields = 'COD_PROVEEDOR;COD_PRODUCTO'
      end
      item
        Name = 'COD_PROV_NOMBREPROD'
        Fields = 'COD_PROVEEDOR;NOMBRECOMERCIAL'
      end>
    IndexFieldNames = 'COD_PROVEEDOR'
    MasterFields = 'COD_PROVEEDOR'
    MasterSource = ds_proveedor
    StoreDefs = True
    TableName = 'PRODUCTO'
    Left = 104
    Top = 24
    object ProductoCOD_PRODUCTO: TIBStringField
      FieldName = 'COD_PRODUCTO'
      Required = True
      Size = 6
    end
    object ProductoCOD_SUFIJO_PRODUCTO: TIBStringField
      FieldName = 'COD_SUFIJO_PRODUCTO'
      Size = 3
    end
    object ProductoNOMBRECOMERCIAL: TIBStringField
      FieldName = 'NOMBRECOMERCIAL'
      Size = 100
    end
    object ProductoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 256
    end
    object ProductoFECHA_PRIM_VENTA: TDateTimeField
      FieldName = 'FECHA_PRIM_VENTA'
    end
    object ProductoFECHA_ULT_VENTA: TDateTimeField
      FieldName = 'FECHA_ULT_VENTA'
    end
    object ProductoULTPRECIO: TFloatField
      FieldName = 'ULTPRECIO'
    end
    object ProductoSTOCK_MINIMO: TIntegerField
      FieldName = 'STOCK_MINIMO'
    end
    object ProductoSTOCK_TOTAL: TIntegerField
      FieldName = 'STOCK_TOTAL'
    end
    object ProductoPCNT_GANANCIA: TIntegerField
      FieldName = 'PCNT_GANANCIA'
    end
    object ProductoESTADO: TIBStringField
      FieldName = 'ESTADO'
      Size = 1
    end
    object ProductoCOD_PROVEEDOR: TIBStringField
      FieldName = 'COD_PROVEEDOR'
      Size = 3
    end
    object ProductoPRECIO_SUG: TFloatField
      FieldName = 'PRECIO_SUG'
    end
    object ProductoPRECIOBOL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRECIOBOL'
      Calculated = True
    end
  end
  object ds_productos: TDataSource
    DataSet = Producto
    Left = 104
    Top = 80
  end
  object Ac_reportes: TActionList
    Images = M_datos.Imagenes
    Left = 32
    Top = 128
    object ac_todprovprod: TAction
      Caption = 'Todos los proveedores y sus productos'
      Hint = 'Ver el informe de todos los proveedores y todos los productos'
      OnExecute = ac_todprovprodExecute
    end
    object ac_unprovprod: TAction
      Caption = 'Un proveedor y todos sus productos'
      Hint = 'Elegir un proveedor para el informe de productos'
      OnExecute = ac_unprovprodExecute
    end
    object Ac_todprovprodbol: TAction
      Caption = 'Todos los proveedores y sus productos (En Bolivianos)'
      OnExecute = Ac_todprovprodbolExecute
    end
    object ac_unprodprovbol: TAction
      Caption = 'Un proveedor y todos sus productos(En Bolivianos)'
      OnExecute = ac_unprodprovbolExecute
    end
    object ac_repmensfacturas: TAction
      Caption = 'Reporte Mensual de Facturas'
      OnExecute = ac_repmensfacturasExecute
    end
    object ac_repfaltantesTODO: TAction
      Caption = 'Informe de los productos faltantes de todos proveedores'
      Hint = 'Informe de los productos que estan por debajo del stock mínimo'
      OnExecute = ac_repfaltantesTODOExecute
    end
    object ac_repfaltantesUNO: TAction
      Caption = 'Informe de los productos faltantes de un proveedor'
      Hint = 'Informe de los productos que estan por debajo del stock mínimo'
      OnExecute = ac_repfaltantesUNOExecute
    end
    object ac_repproforma: TAction
      Caption = 'Info. de Proformas'
      ImageIndex = 11
      OnExecute = ac_repproformaExecute
    end
  end
  object Parametros: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    CachedUpdates = False
    TableName = 'PARAMETROS'
    Left = 176
    Top = 24
    object ParametrosID: TSmallintField
      FieldName = 'ID'
    end
    object ParametrosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
    end
    object ParametrosVALOR: TIBStringField
      FieldName = 'VALOR'
      Size = 40
    end
  end
  object Facturas: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOMBRE_CLIENTE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NRO_RUC_CLIENTE'
        DataType = ftFloat
      end
      item
        Name = 'ESTADO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NRO_RUC'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'NOMBRE_EMPRESA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DIRECCION'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TELEFONO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NRO_ORDEN'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'ALFANUMERICO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'NRO_FAC_INICIAL'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'NRO_FAC_FINAL'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'NRO_FACTURA'
        DataType = ftFloat
      end
      item
        Name = 'FECHA_FACT'
        DataType = ftDateTime
      end>
    Filtered = True
    IndexDefs = <
      item
        Name = 'IDX_NOREP_FAC'
        Fields = 'ALFANUMERICO;NRO_FACTURA'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY57'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'FACTURAS'
    Left = 248
    Top = 24
    object FacturasID: TIntegerField
      FieldName = 'ID'
    end
    object FacturasNOMBRE_CLIENTE: TIBStringField
      FieldName = 'NOMBRE_CLIENTE'
      Size = 30
    end
    object FacturasNRO_RUC_CLIENTE: TFloatField
      FieldName = 'NRO_RUC_CLIENTE'
    end
    object FacturasESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object FacturasNRO_RUC: TFloatField
      FieldName = 'NRO_RUC'
    end
    object FacturasNOMBRE_EMPRESA: TIBStringField
      FieldName = 'NOMBRE_EMPRESA'
      Size = 30
    end
    object FacturasDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Size = 30
    end
    object FacturasTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Size = 10
    end
    object FacturasNRO_ORDEN: TFloatField
      FieldName = 'NRO_ORDEN'
    end
    object FacturasALFANUMERICO: TIBStringField
      FieldName = 'ALFANUMERICO'
      Size = 12
    end
    object FacturasNRO_FAC_INICIAL: TFloatField
      FieldName = 'NRO_FAC_INICIAL'
    end
    object FacturasNRO_FAC_FINAL: TFloatField
      FieldName = 'NRO_FAC_FINAL'
    end
    object FacturasMONTO: TFloatField
      FieldName = 'MONTO'
    end
    object FacturasNRO_FACTURA: TFloatField
      FieldName = 'NRO_FACTURA'
    end
    object FacturasFECHA_FACT: TDateTimeField
      FieldName = 'FECHA_FACT'
    end
  end
  object Q_faltantes: TIBQuery
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    CachedUpdates = False
    SQL.Strings = (
      
        'select cod_producto, NOMBRECOMERCIAL, STOCK_TOTAL,COD_PROVEEDOR,' +
        '(STOCK_MINIMO - STOCK_TOTAL) as Tot from producto where cod_prov' +
        'eedor LIKE :p_prov and STOCK_MINIMO > STOCK_TOTAL'
      'ORDER by cod_proveedor')
    Left = 104
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_prov'
        ParamType = ptUnknown
      end>
    object Q_faltantesCOD_PRODUCTO: TIBStringField
      FieldName = 'COD_PRODUCTO'
      Required = True
      Size = 6
    end
    object Q_faltantesNOMBRECOMERCIAL: TIBStringField
      FieldName = 'NOMBRECOMERCIAL'
      Required = True
      Size = 100
    end
    object Q_faltantesCOD_PROVEEDOR: TIBStringField
      FieldName = 'COD_PROVEEDOR'
      Size = 3
    end
    object Q_faltantesTOT: TIntegerField
      FieldName = 'TOT'
    end
    object Q_faltantesNOMBREPROV: TStringField
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'NOMBREPROV'
      LookupDataSet = proveedor
      LookupKeyFields = 'COD_PROVEEDOR'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COD_PROVEEDOR'
      Lookup = True
    end
    object Q_faltantesSTOCK_TOTAL: TIntegerField
      FieldName = 'STOCK_TOTAL'
      Required = True
    end
  end
  object Ventas: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    CachedUpdates = False
    TableName = 'VENTA'
    Left = 176
    Top = 136
    object VentasID_VENTA: TIntegerField
      FieldName = 'ID_VENTA'
    end
    object VentasID_PROFORMA: TIntegerField
      FieldName = 'ID_PROFORMA'
    end
    object VentasID_CLIENTE: TSmallintField
      FieldName = 'ID_CLIENTE'
    end
    object VentasMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Size = 1
    end
    object VentasTC: TFloatField
      FieldName = 'TC'
    end
    object VentasMONTO: TFloatField
      FieldName = 'MONTO'
    end
    object VentasESTADO: TIBStringField
      FieldName = 'ESTADO'
      Size = 1
    end
    object VentasCOD_EMPLEADO: TIBStringField
      FieldName = 'COD_EMPLEADO'
      Size = 3
    end
    object VentasOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Size = 256
    end
    object VentasFECHA_VENTA: TDateTimeField
      FieldName = 'FECHA_VENTA'
    end
    object VentasNOMBREEMP: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMBREEMP'
      LookupDataSet = Empleado
      LookupKeyFields = 'COD_EMPLEADO'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COD_EMPLEADO'
      Lookup = True
    end
  end
  object Det_venta: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    CachedUpdates = False
    IndexFieldNames = 'ID_VENTA'
    MasterFields = 'ID_VENTA'
    MasterSource = ds_ventas
    TableName = 'DET_VENTA'
    Left = 248
    Top = 136
  end
  object ds_ventas: TDataSource
    DataSet = Ventas
    Left = 176
    Top = 192
  end
  object Empleado: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COD_EMPLEADO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PRIVILEGIO'
        DataType = ftString
        Size = 30
      end>
    StoreDefs = True
    TableName = 'EMPLEADO'
    Left = 248
    Top = 192
    object EmpleadoCOD_EMPLEADO: TIBStringField
      FieldName = 'COD_EMPLEADO'
      Size = 3
    end
    object EmpleadoNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 60
    end
    object EmpleadoPRIVILEGIO: TIBStringField
      FieldName = 'PRIVILEGIO'
      Size = 30
    end
  end
  object q_proformas: TIBQuery
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    OnCalcFields = q_proformasCalcFields
    CachedUpdates = False
    SQL.Strings = (
      'select sum(cantidad) , cod_producto,nombrecomercial'
      'from proforma,producto,det_proforma '
      'where proforma.FECHA_HORA between :fecha1 and  :fecha2  '
      'and proforma.id_proforma = det_proforma.id_proforma'
      'and det_proforma.cod_producto=producto.cod_producto  '
      'group by cod_producto,nombrecomercial'
      'having sum(cantidad)>:minimo'
      'order by 1 desc , 2')
    Left = 104
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'fecha1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'fecha2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'minimo'
        ParamType = ptInput
        Value = '0'
      end>
    object q_proformasSUM: TIntegerField
      FieldName = 'SUM'
    end
    object q_proformasCOD_PRODUCTO: TIBStringField
      FieldName = 'COD_PRODUCTO'
      Size = 6
    end
    object q_proformasNOMBRECOMERCIAL: TIBStringField
      DisplayWidth = 50
      FieldName = 'NOMBRECOMERCIAL'
      Size = 100
    end
    object q_proformasCOD_ENTERO: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'COD_entero'
      Calculated = True
    end
  end
  object ds_proformas: TDataSource
    DataSet = q_proformas
    Left = 40
    Top = 200
  end
end
