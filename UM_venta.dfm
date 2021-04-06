object M_venta: TM_venta
  OldCreateOrder = False
  Left = 250
  Top = 90
  Height = 472
  Width = 508
  object Proforma: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    AfterInsert = ProformaAfterInsert
    AfterPost = ProformaAfterPost
    OnNewRecord = ProformaNewRecord
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_PROFORMA'
        DataType = ftInteger
      end
      item
        Name = 'FECHA_HORA'
        DataType = ftDateTime
      end
      item
        Name = 'MONEDA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TC'
        DataType = ftFloat
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'COD_EMPLEADO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NOMBRE_CLI'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY32'
        Fields = 'ID_PROFORMA'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN33'
        Fields = 'COD_EMPLEADO'
      end>
    IndexFieldNames = 'ID_PROFORMA'
    StoreDefs = True
    TableName = 'PROFORMA'
    Left = 24
    Top = 16
    object ProformaID_PROFORMA: TIntegerField
      FieldName = 'ID_PROFORMA'
    end
    object ProformaFECHA_HORA: TDateTimeField
      FieldName = 'FECHA_HORA'
    end
    object ProformaMONEDA: TIBStringField
      DefaultExpression = #39'1'#39
      FieldName = 'MONEDA'
      OnValidate = ProformaMONEDAValidate
      Size = 1
    end
    object ProformaTC: TFloatField
      FieldName = 'TC'
      Precision = 5
    end
    object ProformaMONTO: TFloatField
      FieldName = 'MONTO'
      DisplayFormat = 'Bs. #.00'
      Precision = 4
    end
    object ProformaCOD_EMPLEADO: TIBStringField
      FieldName = 'COD_EMPLEADO'
      Size = 3
    end
    object ProformaESTADO: TIBStringField
      FieldName = 'ESTADO'
      Size = 1
    end
    object ProformaNOMBREEMP: TStringField
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'NOMBREEMP'
      LookupDataSet = Empleado
      LookupKeyFields = 'COD_EMPLEADO'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COD_EMPLEADO'
      Lookup = True
    end
    object ProformaNOMBRE_CLI: TIBStringField
      DisplayWidth = 100
      FieldName = 'NOMBRE_CLI'
      Size = 50
    end
  end
  object det_proforma: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    AfterDelete = det_proformaAfterPost
    AfterPost = det_proformaAfterPost
    OnNewRecord = det_proformaNewRecord
    OnPostError = det_proformaPostError
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_PROFORMA'
        Attributes = [faRequired]
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
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'PRECIO_UNIT'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'DESCUENTO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'PRECIO_TOTAL'
        Attributes = [faReadonly]
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'RDB$FOREIGN53'
        Fields = 'ID_PROFORMA'
      end
      item
        Name = 'RDB$FOREIGN54'
        Fields = 'COD_PRODUCTO'
      end
      item
        Name = 'RDB$PRIMARY55'
        Fields = 'ID_PROFORMA;COD_PRODUCTO'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'ID_PROFORMA;COD_PRODUCTO'
    MasterFields = 'ID_PROFORMA'
    MasterSource = ds_proforma
    StoreDefs = True
    TableName = 'DET_PROFORMA'
    Left = 96
    Top = 16
    object det_proformaID_PROFORMA: TIntegerField
      FieldName = 'ID_PROFORMA'
    end
    object det_proformaCOD_PRODUCTO: TIBStringField
      FieldName = 'COD_PRODUCTO'
      Required = True
      OnValidate = det_proformaCOD_PRODUCTOValidate
      Size = 6
    end
    object det_proformaCANTIDAD: TSmallintField
      FieldName = 'CANTIDAD'
    end
    object det_proformaPRECIO_UNIT: TFloatField
      FieldName = 'PRECIO_UNIT'
      ReadOnly = True
      Required = True
      DisplayFormat = 'Bs. #,00'
      Precision = 6
    end
    object det_proformaDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
    end
    object det_proformaPRECIO_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PRECIO_TOTAL'
      ReadOnly = True
      DisplayFormat = 'Bs. #.00'
    end
    object det_proformaNOMBREPROD: TStringField
      DisplayWidth = 100
      FieldKind = fkLookup
      FieldName = 'NOMBREPROD'
      LookupDataSet = Producto
      LookupKeyFields = 'COD_PRODUCTO'
      LookupResultField = 'NOMBRECOMERCIAL'
      KeyFields = 'COD_PRODUCTO'
      Lookup = True
    end
    object det_proformaSTOCK: TIntegerField
      FieldKind = fkLookup
      FieldName = 'STOCK'
      LookupDataSet = Producto
      LookupKeyFields = 'COD_PRODUCTO'
      LookupResultField = 'STOCK_TOTAL'
      KeyFields = 'COD_PRODUCTO'
      Lookup = True
    end
  end
  object ds_proforma: TDataSource
    DataSet = Proforma
    Left = 24
    Top = 72
  end
  object ds_det_proforma: TDataSource
    DataSet = det_proforma
    Left = 96
    Top = 72
  end
  object Producto: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    AfterOpen = ProductoAfterOpen
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
    Filter = 'ULTPRECIO>0.0000'
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
    IndexName = 'NOMBRECOMERCIAL_PRODUCTO'
    StoreDefs = True
    TableName = 'PRODUCTO'
    Left = 168
    Top = 16
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
      DisplayLabel = 'Precio dolares'
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
  end
  object Empleado: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    AfterOpen = EmpleadoAfterOpen
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COD_EMPLEADO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NOMBRE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PRIVILEGIO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY2'
        Fields = 'COD_EMPLEADO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'INDX_NOMBREEMPLEAD'
        Fields = 'NOMBRE'
      end>
    IndexName = 'INDX_NOMBREEMPLEAD'
    StoreDefs = True
    TableName = 'EMPLEADO'
    Left = 232
    Top = 16
    object EmpleadoCOD_EMPLEADO: TIBStringField
      FieldName = 'COD_EMPLEADO'
      Required = True
      Size = 3
    end
    object EmpleadoNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Required = True
      Size = 60
    end
    object EmpleadoPRIVILEGIO: TIBStringField
      FieldName = 'PRIVILEGIO'
      Size = 30
    end
  end
  object ds_empleado: TDataSource
    DataSet = Empleado
    Left = 232
    Top = 72
  end
  object Nueva_proforma: TIBStoredProc
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    StoredProcName = 'PNUEVA_PROFORMA'
    Params = <
      item
        DataType = ftInteger
        Name = 'PROFORMA_ID'
        ParamType = ptOutput
      end>
    Left = 32
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PROFORMA_ID'
        ParamType = ptOutput
      end>
  end
  object obt_TC: TIBSQL
    Database = M_datos.BD_farmacia
    ParamCheck = True
    SQL.Strings = (
      'select valor from parametros where id=1')
    Transaction = M_datos.Transaccion
    Left = 104
    Top = 128
  end
  object ob_totales: TIBSQL
    Database = M_datos.BD_farmacia
    ParamCheck = True
    SQL.Strings = (
      'SELECT monto FROM'
      'proforma WHERE id_proforma=:pid_proforma')
    Transaction = M_datos.Transaccion
    Left = 168
    Top = 128
  end
  object obt_precioprod: TIBSQL
    Database = M_datos.BD_farmacia
    ParamCheck = True
    SQL.Strings = (
      'select ULTPRECIO from producto where cod_producto=:pcod_producto')
    Transaction = M_datos.Transaccion
    Left = 232
    Top = 128
  end
  object ds_producto: TDataSource
    DataSet = Producto
    Left = 168
    Top = 72
  end
  object Disminuir_existencia: TIBStoredProc
    Database = M_datos.BD_farmacia
    Transaction = tran_venta
    StoredProcName = 'QUITAR_EXISTENCIA'
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_PRODUCTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CANTIDAD_VENTA'
        ParamType = ptInput
      end>
    Left = 24
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_PRODUCTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CANTIDAD_VENTA'
        ParamType = ptInput
      end>
  end
  object chk_stock: TIBSQL
    Database = M_datos.BD_farmacia
    ParamCheck = True
    SQL.Strings = (
      
        'select stock_total from producto where cod_producto=:pcod_produc' +
        'to')
    Transaction = M_datos.Transaccion
    Left = 104
    Top = 184
  end
  object tran_venta: TIBTransaction
    Active = False
    DefaultDatabase = M_datos.BD_farmacia
    DefaultAction = TACommitRetaining
    Left = 32
    Top = 248
  end
  object ins_venta: TIBSQL
    Database = M_datos.BD_farmacia
    ParamCheck = True
    SQL.Strings = (
      
        'insert into venta (id_cliente,id_proforma,moneda,TC,monto,estado' +
        ',cod_empleado,id_venta) values '
      
        '(:pid_cliente,:pid_proforma,'#39'1'#39',:pTC,0,'#39'1'#39',:pcod_empleado,:pid_v' +
        'enta)'
      ' ')
    Transaction = tran_venta
    Left = 104
    Top = 248
  end
  object ins_det_venta: TIBSQL
    Database = M_datos.BD_farmacia
    ParamCheck = True
    SQL.Strings = (
      
        'insert into det_venta (cod_producto,cantidad,precio_unit,descuen' +
        'to,id_venta) values'
      '(:pcod_producto,:pcod_cantidad,:pprecio_unit,0,:pid_venta)'
      ' ')
    Transaction = tran_venta
    Left = 152
    Top = 248
  end
  object nueva_venta: TIBStoredProc
    Database = M_datos.BD_farmacia
    Transaction = tran_venta
    StoredProcName = 'PNUEVA_VENTA'
    Params = <
      item
        DataType = ftInteger
        Name = 'VENTA_ID'
        ParamType = ptOutput
      end>
    Left = 184
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'VENTA_ID'
        ParamType = ptOutput
      end>
  end
  object Proveedor: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    Active = True
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
    StoreDefs = True
    TableName = 'PROVEEDOR'
    Left = 304
    Top = 16
  end
  object ds_proveedor: TDataSource
    DataSet = Proveedor
    Left = 296
    Top = 72
  end
  object Q_busespec: TIBQuery
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    BeforeOpen = Q_busespecBeforeOpen
    OnCalcFields = Q_busespecCalcFields
    CachedUpdates = False
    SQL.Strings = (
      
        'select COD_PRODUCTO, NOMBRECOMERCIAL,NOMBRE, ULTPRECIO  from PRO' +
        'DUCTO,PROVEEDOR where PRODUCTO.cod_proveedor=PROVEEDOR.cod_prove' +
        'edor'
      'and PRODUCTO.NOMBRECOMERCIAL like :pnombrecomercial'
      'order by NOMBRECOMERCIAL')
    Left = 264
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'pnombrecomercial'
        ParamType = ptInput
        Value = '%'
      end>
    object Q_busespecCOD_PRODUCTO: TIBStringField
      FieldName = 'COD_PRODUCTO'
      Required = True
      Size = 6
    end
    object Q_busespecNOMBRECOMERCIAL: TIBStringField
      FieldName = 'NOMBRECOMERCIAL'
      Required = True
      Size = 100
    end
    object Q_busespecNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Required = True
      Size = 30
    end
    object Q_busespecULTPRECIO: TFloatField
      FieldName = 'ULTPRECIO'
      Required = True
      DisplayFormat = 'Bs. #.00'
    end
    object Q_busespecPRECIOBOL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRECIOBOL'
      DisplayFormat = 'Bs. #.00'
      Calculated = True
    end
  end
  object ds_Q_busespec: TDataSource
    DataSet = Q_busespec
    Left = 264
    Top = 248
  end
  object Ver_cliente: TIBSQL
    Database = M_datos.BD_farmacia
    ParamCheck = True
    SQL.Strings = (
      'select id_cliente from cliente where nombre=:pnombre')
    Transaction = M_datos.Transaccion
    Left = 208
    Top = 248
  end
  object insert_cliente: TIBSQL
    Database = M_datos.BD_farmacia
    ParamCheck = True
    SQL.Strings = (
      
        'insert into cliente (id_cliente,nombre,RUC) values (:pid_cliente' +
        ',:pnombre,:pRUC) ')
    Transaction = tran_venta
    Left = 184
    Top = 304
  end
  object nuevo_cliente: TIBStoredProc
    Database = M_datos.BD_farmacia
    Transaction = tran_venta
    StoredProcName = 'PNUEVO_CLIENTA'
    Params = <>
    Left = 264
    Top = 304
  end
  object Cliente: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = tran_venta
    OnNewRecord = ClienteNewRecord
    CachedUpdates = False
    IndexName = 'IDX_NOMBRECLIENTE'
    TableName = 'CLIENTE'
    Left = 320
    Top = 128
    object ClienteID_CLIENTE: TSmallintField
      FieldName = 'ID_CLIENTE'
    end
    object ClienteID_TIPO_CLIENTE: TSmallintField
      FieldName = 'ID_TIPO_CLIENTE'
    end
    object ClienteNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 50
    end
    object ClienteTELF: TIntegerField
      FieldName = 'TELF'
    end
    object ClienteDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Size = 256
    end
    object ClienteRUC: TIBStringField
      FieldName = 'RUC'
      Size = 15
    end
    object ClienteESTADO: TIBStringField
      FieldName = 'ESTADO'
      Size = 1
    end
  end
  object ds_cliente: TDataSource
    DataSet = Cliente
    Left = 320
    Top = 184
  end
  object Venta: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = tran_venta
    AfterInsert = VentaAfterInsert
    OnNewRecord = VentaNewRecord
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_VENTA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_PROFORMA'
        DataType = ftInteger
      end
      item
        Name = 'ID_CLIENTE'
        DataType = ftSmallint
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
        Name = 'MONTO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'ESTADO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'COD_EMPLEADO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'OBSERVACION'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'FECHA_VENTA'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY34'
        Fields = 'ID_VENTA'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN35'
        Fields = 'ID_PROFORMA'
      end
      item
        Name = 'RDB$FOREIGN36'
        Fields = 'ID_CLIENTE'
      end
      item
        Name = 'RDB$FOREIGN37'
        Fields = 'COD_EMPLEADO'
      end>
    StoreDefs = True
    TableName = 'VENTA'
    Left = 336
    Top = 248
    object VentaID_VENTA: TIntegerField
      FieldName = 'ID_VENTA'
    end
    object VentaID_PROFORMA: TIntegerField
      FieldName = 'ID_PROFORMA'
    end
    object VentaMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Size = 1
    end
    object VentaTC: TFloatField
      FieldName = 'TC'
      Precision = 5
    end
    object VentaMONTO: TFloatField
      FieldName = 'MONTO'
      DisplayFormat = 'Bs. #,00'
    end
    object VentaESTADO: TIBStringField
      FieldName = 'ESTADO'
      Size = 1
    end
    object VentaCOD_EMPLEADO: TIBStringField
      FieldName = 'COD_EMPLEADO'
      Size = 3
    end
    object VentaOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Size = 256
    end
    object VentaFECHA_VENTA: TDateTimeField
      FieldName = 'FECHA_VENTA'
    end
    object VentaID_CLIENTE: TSmallintField
      FieldName = 'ID_CLIENTE'
    end
  end
  object ds_venta: TDataSource
    AutoEdit = False
    DataSet = Venta
    Left = 328
    Top = 304
  end
  object det_venta: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = tran_venta
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_VENTA'
        Attributes = [faRequired]
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
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'PRECIO_UNIT'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'DESCUENTO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'PRECIO_TOTAL'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'ID_FACTURA'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$FOREIGN58'
        Fields = 'ID_VENTA'
      end
      item
        Name = 'RDB$FOREIGN59'
        Fields = 'COD_PRODUCTO'
      end
      item
        Name = 'RDB$PRIMARY60'
        Fields = 'ID_VENTA;COD_PRODUCTO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN73'
        Fields = 'ID_FACTURA'
      end>
    IndexFieldNames = 'ID_VENTA;COD_PRODUCTO'
    MasterFields = 'ID_VENTA'
    MasterSource = ds_venta
    StoreDefs = True
    TableName = 'DET_VENTA'
    Left = 32
    Top = 296
    object det_ventaID_VENTA: TIntegerField
      FieldName = 'ID_VENTA'
    end
    object det_ventaCOD_PRODUCTO: TIBStringField
      FieldName = 'COD_PRODUCTO'
      Required = True
      Size = 6
    end
    object det_ventaCANTIDAD: TSmallintField
      FieldName = 'CANTIDAD'
    end
    object det_ventaPRECIO_UNIT: TFloatField
      FieldName = 'PRECIO_UNIT'
      DisplayFormat = 'Bs. #,00'
    end
    object det_ventaDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
      DisplayFormat = 'Bs. #,00'
    end
    object det_ventaPRECIO_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PRECIO_TOTAL'
      ReadOnly = True
      DisplayFormat = 'Bs. #,00'
    end
    object det_ventaNOMBREPROD: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMBREPROD'
      LookupDataSet = Producto
      LookupKeyFields = 'COD_PRODUCTO'
      LookupResultField = 'NOMBRECOMERCIAL'
      KeyFields = 'COD_PRODUCTO'
      Size = 100
      Lookup = True
    end
    object det_ventaID_FACTURA: TIntegerField
      FieldName = 'ID_FACTURA'
    end
  end
  object ds_det_venta: TDataSource
    AutoEdit = False
    DataSet = det_venta
    Left = 104
    Top = 304
  end
  object Factura: TIBTable
    Database = M_datos.BD_farmacia
    Transaction = tran_venta
    AfterInsert = FacturaAfterInsert
    OnNewRecord = FacturaNewRecord
    OnPostError = FacturaPostError
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID'
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
        DataType = ftInteger
      end
      item
        Name = 'NRO_RUC'
        DataType = ftFloat
      end
      item
        Name = 'NOMBRE_EMPRESA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DIRECCION'
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
        DataType = ftFloat
      end
      item
        Name = 'ALFANUMERICO'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'NRO_FAC_INICIAL'
        DataType = ftFloat
      end
      item
        Name = 'NRO_FAC_FINAL'
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
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY70'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN71'
        Fields = 'ID_GESTION'
      end
      item
        Name = 'IDX_NROFAC'
        Fields = 'NRO_FACTURA'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'FACTURAS'
    Left = 384
    Top = 16
    object FacturaID: TIntegerField
      FieldName = 'ID'
    end
    object FacturaNOMBRE_CLIENTE: TIBStringField
      FieldName = 'NOMBRE_CLIENTE'
      Size = 30
    end
    object FacturaNRO_RUC_CLIENTE: TFloatField
      FieldName = 'NRO_RUC_CLIENTE'
    end
    object FacturaESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object FacturaNRO_RUC: TFloatField
      FieldName = 'NRO_RUC'
    end
    object FacturaNOMBRE_EMPRESA: TIBStringField
      FieldName = 'NOMBRE_EMPRESA'
      Size = 30
    end
    object FacturaDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Size = 30
    end
    object FacturaTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Size = 10
    end
    object FacturaNRO_ORDEN: TFloatField
      FieldName = 'NRO_ORDEN'
    end
    object FacturaALFANUMERICO: TIBStringField
      FieldName = 'ALFANUMERICO'
      Size = 12
    end
    object FacturaNRO_FAC_INICIAL: TFloatField
      FieldName = 'NRO_FAC_INICIAL'
    end
    object FacturaNRO_FAC_FINAL: TFloatField
      FieldName = 'NRO_FAC_FINAL'
    end
    object FacturaMONTO: TFloatField
      FieldName = 'MONTO'
    end
    object FacturaNRO_FACTURA: TFloatField
      FieldName = 'NRO_FACTURA'
    end
    object FacturaFECHA_FACT: TDateTimeField
      FieldName = 'FECHA_FACT'
    end
  end
  object ds_factura: TDataSource
    AutoEdit = False
    DataSet = Factura
    Left = 384
    Top = 80
  end
  object Nueva_factura: TIBStoredProc
    Database = M_datos.BD_farmacia
    Transaction = tran_venta
    StoredProcName = 'PNUEVA_FACTURA'
    Params = <>
    Left = 384
    Top = 136
  end
  object numero_factura: TIBStoredProc
    Database = M_datos.BD_farmacia
    Transaction = tran_venta
    StoredProcName = 'NUEVO_NUMFACTURA'
    Params = <>
    Left = 384
    Top = 192
  end
  object Q_busprincipio: TIBQuery
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    Active = True
    BeforeOpen = Q_busespecBeforeOpen
    OnCalcFields = Q_busprincipioCalcFields
    CachedUpdates = False
    SQL.Strings = (
      
        'Select COD_PRODUCTO, NOMBRECOMERCIAL,NOMBRE, ULTPRECIO, COD_PROV' +
        'EEDOR'
      'From PRODUCTO,PRODUCTO_PRINCIPIO, PRINCIPIO_ACTIVO '
      'Where '
      'producto_principio.cod_producto=producto.cod_producto and'
      
        'producto_principio.id_prinactivo=principio_activo.id_prinactivo ' +
        'and'
      'principio_activo.nombre like :p_nombreprin')
    Left = 32
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'p_nombreprin'
        ParamType = ptInput
      end>
    object Q_busprincipioCOD_PRODUCTO: TIBStringField
      FieldName = 'COD_PRODUCTO'
      Required = True
      Size = 6
    end
    object Q_busprincipioNOMBRECOMERCIAL: TIBStringField
      FieldName = 'NOMBRECOMERCIAL'
      Required = True
      Size = 100
    end
    object Q_busprincipioNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Required = True
      Size = 100
    end
    object Q_busprincipioULTPRECIO: TFloatField
      FieldName = 'ULTPRECIO'
      Required = True
    end
    object Q_busprincipioCOD_PROVEEDOR: TIBStringField
      FieldName = 'COD_PROVEEDOR'
      Size = 3
    end
    object Q_busprincipioNOMBREPROV: TIBStringField
      FieldKind = fkLookup
      FieldName = 'NOMBREPROV'
      LookupDataSet = Proveedor
      LookupKeyFields = 'COD_PROVEEDOR'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COD_PROVEEDOR'
      Lookup = True
    end
    object Q_busprincipioPRECIOBOL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRECIOBOL'
      DisplayFormat = 'Bs. #.00'
      Calculated = True
    end
  end
  object bs_busprincipio: TDataSource
    DataSet = Q_busprincipio
    Left = 120
    Top = 344
  end
  object Q_busaccion: TIBQuery
    Database = M_datos.BD_farmacia
    Transaction = M_datos.Transaccion
    BeforeOpen = Q_busespecBeforeOpen
    OnCalcFields = Q_busaccionCalcFields
    CachedUpdates = False
    SQL.Strings = (
      
        'Select COD_PRODUCTO, NOMBRECOMERCIAL,NOMBRE, ULTPRECIO, COD_PROV' +
        'EEDOR'
      'From PRODUCTO,ACC_PRODUCTO,ACC_TERAPEUTICA'
      'Where '
      'acc_producto.cod_producto=producto.cod_producto and'
      'acc_producto.id_acc=acc_terapeutica.id_acc and'
      'acc_terapeutica.nombre like :p_nombreaccion')
    Left = 224
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_nombreaccion'
        ParamType = ptUnknown
      end>
    object Q_busaccionCOD_PRODUCTO: TIBStringField
      FieldName = 'COD_PRODUCTO'
      Required = True
      Size = 6
    end
    object Q_busaccionNOMBRECOMERCIAL: TIBStringField
      FieldName = 'NOMBRECOMERCIAL'
      Required = True
      Size = 100
    end
    object Q_busaccionNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Required = True
      Size = 100
    end
    object Q_busaccionULTPRECIO: TFloatField
      FieldName = 'ULTPRECIO'
      Required = True
    end
    object Q_busaccionCOD_PROVEEDOR: TIBStringField
      FieldName = 'COD_PROVEEDOR'
      Size = 3
    end
    object Q_busaccionNOMBREPROV: TIBStringField
      FieldKind = fkLookup
      FieldName = 'NOMBREPROV'
      LookupDataSet = Proveedor
      LookupKeyFields = 'COD_PROVEEDOR'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COD_PROVEEDOR'
      LookupCache = True
      Lookup = True
    end
    object Q_busaccionPRECIOBOL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRECIOBOL'
      DisplayFormat = 'Bs. #.00'
      Calculated = True
    end
  end
  object ds_busaccion: TDataSource
    DataSet = Q_busaccion
    Left = 336
    Top = 72
  end
end
