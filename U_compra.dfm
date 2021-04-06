object M_compra: TM_compra
  OldCreateOrder = False
  Left = 246
  Top = 143
  Height = 396
  Width = 544
  object ds_det_compra: TDataSource
    DataSet = Det_compra
    OnUpdateData = ds_det_compraUpdateData
    Left = 96
    Top = 112
  end
  object ds_compra: TDataSource
    DataSet = Compra
    OnUpdateData = ds_compraUpdateData
    Left = 32
    Top = 112
  end
  object Compra: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    AfterInsert = CompraAfterInsert
    AfterPost = CompraAfterPost
    AfterRefresh = CompraAfterRefresh
    AfterScroll = CompraAfterScroll
    BeforeDelete = CompraBeforeDelete
    BeforePost = CompraBeforePost
    OnCalcFields = CompraCalcFields
    OnDeleteError = CompraDeleteError
    OnNewRecord = CompraNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_COMPRA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COD_PROVEEDOR'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'MONEDA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TC'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'FECHA_ENTREGA'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'DESCUENTO'
        DataType = ftFloat
      end
      item
        Name = 'COSTO_TOTAL'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'MONTO_FINAL'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'MONTO_CANCELADO'
        DataType = ftFloat
      end
      item
        Name = 'FECHA_PAGO'
        DataType = ftDateTime
      end
      item
        Name = 'ESTADO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OBSERVACION'
        DataType = ftString
        Size = 256
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY5'
        Fields = 'ID_COMPRA'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN6'
        Fields = 'COD_PROVEEDOR'
      end>
    IndexFieldNames = 'COD_PROVEEDOR'
    MasterFields = 'COD_PROVEEDOR'
    MasterSource = ds_proveedor
    StoreDefs = True
    TableName = 'COMPRA'
    Left = 32
    Top = 48
    object CompraID_COMPRA: TIntegerField
      FieldName = 'ID_COMPRA'
    end
    object CompraCOD_PROVEEDOR: TIBStringField
      FieldName = 'COD_PROVEEDOR'
      Size = 3
    end
    object CompraMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Required = True
      Size = 1
    end
    object CompraTC: TFloatField
      DisplayWidth = 10
      FieldName = 'TC'
      Required = True
      DisplayFormat = '#.00'
    end
    object CompraFECHA_ENTREGA: TDateTimeField
      FieldName = 'FECHA_ENTREGA'
      OnSetText = CompraFECHA_ENTREGASetText
      OnValidate = CompraFECHA_ENTREGAValidate
    end
    object CompraDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
    end
    object CompraCOSTO_TOTAL: TFloatField
      FieldName = 'COSTO_TOTAL'
      ReadOnly = True
    end
    object CompraMONTO_FINAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'MONTO_FINAL'
      ReadOnly = True
    end
    object CompraMONTO_CANCELADO: TFloatField
      FieldName = 'MONTO_CANCELADO'
    end
    object CompraFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Required = True
      OnSetText = CompraFECHA_PAGOSetText
      OnValidate = CompraFECHA_PAGOValidate
    end
    object CompraESTADO: TIBStringField
      FieldName = 'ESTADO'
      Size = 1
    end
    object CompraOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Size = 256
    end
  end
  object Det_compra: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    AfterDelete = Det_compraAfterPost
    AfterPost = Det_compraAfterPost
    AfterRefresh = Det_compraAfterRefresh
    OnDeleteError = Det_compraDeleteError
    OnNewRecord = Det_compraNewRecord
    OnPostError = Det_compraPostError
    BufferChunks = 1000
    CachedUpdates = False
    DefaultIndex = False
    FieldDefs = <
      item
        Name = 'ID_COMPRA'
        DataType = ftInteger
      end
      item
        Name = 'COD_PRODUCTO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'CANTIDAD'
        DataType = ftSmallint
      end
      item
        Name = 'PRECIO_UNIT'
        DataType = ftFloat
      end
      item
        Name = 'PRECIO_TOTAL'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'CANTIDAD_EXTRA'
        DataType = ftSmallint
      end
      item
        Name = 'FECHA_VENCIMIENTO'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'RDB$FOREIGN21'
        Fields = 'ID_COMPRA'
      end
      item
        Name = 'RDB$FOREIGN22'
        Fields = 'COD_PRODUCTO'
      end
      item
        Name = 'RDB$PRIMARY23'
        Fields = 'ID_COMPRA;COD_PRODUCTO'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'ID_COMPRA;COD_PRODUCTO'
    MasterFields = 'ID_COMPRA'
    MasterSource = ds_compra
    StoreDefs = True
    TableName = 'DET_COMPRA'
    Left = 96
    Top = 48
    object Det_compraID_COMPRA: TIntegerField
      FieldName = 'ID_COMPRA'
      OnValidate = Det_compraID_COMPRAValidate
    end
    object Det_compraCOD_PRODUCTO: TIBStringField
      FieldName = 'COD_PRODUCTO'
      Required = True
      OnValidate = Det_compraCOD_PRODUCTOValidate
      Size = 6
    end
    object Det_compraCANTIDAD: TSmallintField
      FieldName = 'CANTIDAD'
    end
    object Det_compraPRECIO_UNIT: TFloatField
      FieldName = 'PRECIO_UNIT'
    end
    object Det_compraPRECIO_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PRECIO_TOTAL'
      ReadOnly = True
    end
    object Det_compraCANTIDAD_EXTRA: TSmallintField
      FieldName = 'CANTIDAD_EXTRA'
    end
    object Det_compraNOMBREP: TStringField
      DisplayWidth = 200
      FieldKind = fkLookup
      FieldName = 'NOMBREP'
      LookupDataSet = Producto
      LookupKeyFields = 'COD_PRODUCTO'
      LookupResultField = 'NOMBRECOMERCIAL'
      KeyFields = 'COD_PRODUCTO'
      Lookup = True
    end
    object Det_compraFECHA_VENCIMIENTO: TDateTimeField
      DisplayLabel = 'Fecha Venc.'
      FieldName = 'FECHA_VENCIMIENTO'
      OnSetText = Det_compraFECHA_VENCIMIENTOSetText
    end
  end
  object Proveedor: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COD_PROVEEDOR'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NOMBRE'
        Attributes = [faRequired]
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
    ReadOnly = True
    StoreDefs = True
    TableName = 'PROVEEDOR'
    Left = 168
    Top = 48
    object ProveedorCOD_PROVEEDOR: TIBStringField
      FieldName = 'COD_PROVEEDOR'
      Required = True
      Size = 3
    end
    object ProveedorNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Required = True
      Size = 30
    end
    object ProveedorPERSONA_CONTACTO: TIBStringField
      FieldName = 'PERSONA_CONTACTO'
      Size = 60
    end
    object ProveedorTELEF_DOM: TIntegerField
      FieldName = 'TELEF_DOM'
    end
    object ProveedorTELEF_OF: TIntegerField
      FieldName = 'TELEF_OF'
    end
    object ProveedorTELEF_CEL: TIntegerField
      FieldName = 'TELEF_CEL'
    end
    object ProveedorDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Size = 100
    end
    object ProveedorPAIS: TIBStringField
      FieldName = 'PAIS'
    end
    object ProveedorCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
    end
    object ProveedorEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object ProveedorCASILLA: TIBStringField
      FieldName = 'CASILLA'
      Size = 5
    end
    object ProveedorFAX: TIBStringField
      FieldName = 'FAX'
      Size = 17
    end
  end
  object Producto: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    BufferChunks = 1000
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
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NOMBRECOMERCIAL'
        Attributes = [faRequired]
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
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'STOCK_MINIMO'
        DataType = ftInteger
      end
      item
        Name = 'STOCK_TOTAL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PCNT_GANANCIA'
        DataType = ftInteger
      end
      item
        Name = 'ESTADO'
        Attributes = [faRequired]
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
      end>
    IndexFieldNames = 'COD_PROVEEDOR;NOMBRECOMERCIAL'
    MasterFields = 'COD_PROVEEDOR'
    MasterSource = ds_proveedor
    StoreDefs = True
    TableName = 'PRODUCTO'
    Left = 168
    Top = 112
    object ProductoCOD_PRODUCTO: TIBStringField
      FieldName = 'COD_PRODUCTO'
      Required = True
      Size = 6
    end
    object ProductoCOD_SUFIJO_PRODUCTO: TIBStringField
      FieldName = 'COD_SUFIJO_PRODUCTO'
      Required = True
      Size = 3
    end
    object ProductoNOMBRECOMERCIAL: TIBStringField
      FieldName = 'NOMBRECOMERCIAL'
      Required = True
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
      Required = True
    end
    object ProductoSTOCK_MINIMO: TIntegerField
      FieldName = 'STOCK_MINIMO'
    end
    object ProductoSTOCK_TOTAL: TIntegerField
      FieldName = 'STOCK_TOTAL'
      Required = True
    end
    object ProductoPCNT_GANANCIA: TIntegerField
      FieldName = 'PCNT_GANANCIA'
    end
    object ProductoESTADO: TIBStringField
      FieldName = 'ESTADO'
      Required = True
      Size = 1
    end
    object ProductoCOD_PROVEEDOR: TIBStringField
      FieldName = 'COD_PROVEEDOR'
      Size = 3
    end
    object ProductoPRECIO_SUG: TFloatField
      FieldName = 'PRECIO_SUG'
    end
  end
  object ds_proveedor: TDataSource
    DataSet = Proveedor
    Left = 232
    Top = 48
  end
  object parametros: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    BufferChunks = 1000
    CachedUpdates = False
    ReadOnly = True
    TableName = 'PARAMETROS'
    Left = 232
    Top = 112
    object parametrosID: TSmallintField
      FieldName = 'ID'
    end
    object parametrosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
    end
    object parametrosVALOR: TIBStringField
      FieldName = 'VALOR'
      Size = 40
    end
  end
  object ob_totales: TIBSQL
    Database = M_datos.BD_farmacia
    ParamCheck = True
    SQL.Strings = (
      'SELECT costo_total FROM'
      'compra WHERE id_compra=:pid_compra')
    Transaction = M_datos.Transaccion
    Left = 32
    Top = 168
  end
  object Nuevo_id_compra: TIBStoredProc
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    StoredProcName = 'PNUEVA_COMPRA'
    Left = 232
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COMPRA_ID'
        ParamType = ptOutput
      end>
  end
end
