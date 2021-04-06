unit UM_venta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, IBTable, IBEvents, IBStoredProc, IBSQL,Ib,
  IBDatabase, IBQuery;

type
  TM_venta = class(TDataModule)
    Proforma: TIBTable;
    det_proforma: TIBTable;
    ProformaID_PROFORMA: TIntegerField;
    ProformaFECHA_HORA: TDateTimeField;
    ProformaMONEDA: TIBStringField;
    ProformaTC: TFloatField;
    ProformaMONTO: TFloatField;
    ProformaCOD_EMPLEADO: TIBStringField;
    ProformaESTADO: TIBStringField;
    ds_proforma: TDataSource;
    ds_det_proforma: TDataSource;
    det_proformaID_PROFORMA: TIntegerField;
    det_proformaCOD_PRODUCTO: TIBStringField;
    det_proformaCANTIDAD: TSmallintField;
    det_proformaPRECIO_UNIT: TFloatField;
    det_proformaDESCUENTO: TFloatField;
    det_proformaPRECIO_TOTAL: TFloatField;
    Producto: TIBTable;
    ProductoCOD_PRODUCTO: TIBStringField;
    ProductoCOD_SUFIJO_PRODUCTO: TIBStringField;
    ProductoNOMBRECOMERCIAL: TIBStringField;
    ProductoDESCRIPCION: TIBStringField;
    ProductoFECHA_PRIM_VENTA: TDateTimeField;
    ProductoFECHA_ULT_VENTA: TDateTimeField;
    ProductoULTPRECIO: TFloatField;
    ProductoSTOCK_MINIMO: TIntegerField;
    ProductoSTOCK_TOTAL: TIntegerField;
    ProductoPCNT_GANANCIA: TIntegerField;
    ProductoESTADO: TIBStringField;
    ProductoCOD_PROVEEDOR: TIBStringField;
    ProductoPRECIO_SUG: TFloatField;
    det_proformaNOMBREPROD: TStringField;
    Empleado: TIBTable;
    ProformaNOMBREEMP: TStringField;
    ds_empleado: TDataSource;
    Nueva_proforma: TIBStoredProc;
    obt_TC: TIBSQL;
    EmpleadoCOD_EMPLEADO: TIBStringField;
    EmpleadoNOMBRE: TIBStringField;
    EmpleadoPRIVILEGIO: TIBStringField;
    ob_totales: TIBSQL;
    obt_precioprod: TIBSQL;
    ds_producto: TDataSource;
    Disminuir_existencia: TIBStoredProc;
    chk_stock: TIBSQL;
    tran_venta: TIBTransaction;
    ins_venta: TIBSQL;
    ins_det_venta: TIBSQL;
    det_proformaSTOCK: TIntegerField;
    nueva_venta: TIBStoredProc;
    Proveedor: TIBTable;
    ds_proveedor: TDataSource;
    Q_busespec: TIBQuery;
    Q_busespecCOD_PRODUCTO: TIBStringField;
    Q_busespecNOMBRECOMERCIAL: TIBStringField;
    Q_busespecNOMBRE: TIBStringField;
    ds_Q_busespec: TDataSource;
    Ver_cliente: TIBSQL;
    insert_cliente: TIBSQL;
    nuevo_cliente: TIBStoredProc;
    Cliente: TIBTable;
    ds_cliente: TDataSource;
    ClienteID_CLIENTE: TSmallintField;
    ClienteID_TIPO_CLIENTE: TSmallintField;
    ClienteNOMBRE: TIBStringField;
    ClienteTELF: TIntegerField;
    ClienteDIRECCION: TIBStringField;
    ClienteRUC: TIBStringField;
    ClienteESTADO: TIBStringField;
    Venta: TIBTable;
    VentaID_VENTA: TIntegerField;
    VentaID_PROFORMA: TIntegerField;
    VentaMONEDA: TIBStringField;
    VentaTC: TFloatField;
    VentaMONTO: TFloatField;
    VentaESTADO: TIBStringField;
    VentaCOD_EMPLEADO: TIBStringField;
    VentaOBSERVACION: TIBStringField;
    ds_venta: TDataSource;
    VentaFECHA_VENTA: TDateTimeField;
    VentaID_CLIENTE: TSmallintField;
    det_venta: TIBTable;
    ds_det_venta: TDataSource;
    det_ventaID_VENTA: TIntegerField;
    det_ventaCOD_PRODUCTO: TIBStringField;
    det_ventaCANTIDAD: TSmallintField;
    det_ventaPRECIO_UNIT: TFloatField;
    det_ventaDESCUENTO: TFloatField;
    det_ventaPRECIO_TOTAL: TFloatField;
    det_ventaNOMBREPROD: TStringField;
    Factura: TIBTable;
    ds_factura: TDataSource;
    Nueva_factura: TIBStoredProc;
    det_ventaID_FACTURA: TIntegerField;
    numero_factura: TIBStoredProc;
    Q_busespecULTPRECIO: TFloatField;
    Q_busespecPRECIOBOL: TFloatField;
    FacturaID: TIntegerField;
    FacturaNOMBRE_CLIENTE: TIBStringField;
    FacturaNRO_RUC_CLIENTE: TFloatField;
    FacturaESTADO: TIntegerField;
    FacturaNRO_RUC: TFloatField;
    FacturaNOMBRE_EMPRESA: TIBStringField;
    FacturaDIRECCION: TIBStringField;
    FacturaTELEFONO: TIBStringField;
    FacturaNRO_ORDEN: TFloatField;
    FacturaALFANUMERICO: TIBStringField;
    FacturaNRO_FAC_INICIAL: TFloatField;
    FacturaNRO_FAC_FINAL: TFloatField;
    FacturaMONTO: TFloatField;
    FacturaNRO_FACTURA: TFloatField;
    FacturaFECHA_FACT: TDateTimeField;
    ProformaNOMBRE_CLI: TIBStringField;
    Q_busprincipio: TIBQuery;
    bs_busprincipio: TDataSource;
    Q_busprincipioCOD_PRODUCTO: TIBStringField;
    Q_busprincipioNOMBRECOMERCIAL: TIBStringField;
    Q_busprincipioNOMBRE: TIBStringField;
    Q_busprincipioULTPRECIO: TFloatField;
    Q_busprincipioCOD_PROVEEDOR: TIBStringField;
    Q_busprincipioNOMBREPROV: TIBStringField;
    Q_busprincipioPRECIOBOL: TFloatField;
    Q_busaccion: TIBQuery;

    ds_busaccion: TDataSource;
    Q_busaccionCOD_PRODUCTO: TIBStringField;
    Q_busaccionNOMBRECOMERCIAL: TIBStringField;
    Q_busaccionNOMBRE: TIBStringField;
    Q_busaccionULTPRECIO: TFloatField;
    Q_busaccionCOD_PROVEEDOR: TIBStringField;
    Q_busaccionNOMBREPROV: TIBStringField;
    Q_busaccionPRECIOBOL: TFloatField;
    procedure EmpleadoAfterOpen(DataSet: TDataSet);
    procedure ProformaNewRecord(DataSet: TDataSet);
    procedure ProformaMONEDAValidate(Sender: TField);
    procedure ProformaAfterInsert(DataSet: TDataSet);
    procedure det_proformaNewRecord(DataSet: TDataSet);
    procedure ProformaAfterPost(DataSet: TDataSet);
    procedure det_proformaAfterPost(DataSet: TDataSet);
    procedure det_proformaCOD_PRODUCTOValidate(Sender: TField);
    procedure det_proformaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure VentaNewRecord(DataSet: TDataSet);
    procedure ClienteNewRecord(DataSet: TDataSet);
    procedure VentaAfterInsert(DataSet: TDataSet);
    procedure FacturaNewRecord(DataSet: TDataSet);
    procedure FacturaAfterInsert(DataSet: TDataSet);
    procedure FacturaNRO_FACTURAValidate(Sender: TField);
    procedure FacturaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure Q_busespecBeforeOpen(DataSet: TDataSet);
    procedure Q_busespecCalcFields(DataSet: TDataSet);
    procedure ProductoAfterOpen(DataSet: TDataSet);
    procedure Q_busprincipioCalcFields(DataSet: TDataSet);
    procedure Q_busaccionCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  M_venta: TM_venta;
  Gtc_busqueda:double;

implementation
 uses
     u_datos, Uf_venta;
{$R *.DFM}

procedure TM_venta.EmpleadoAfterOpen(DataSet: TDataSet);
begin
    empleado.Locate('cod_empleado',g_empleado.cod_empleado,[locaseinsensitive]);
end;

procedure TM_venta.ProformaNewRecord(DataSet: TDataSet);
var
lid_proforma:integer;
begin
    nueva_proforma.ExecProc;
    lid_proforma:=nueva_proforma.params[0].AsInteger;
    proformaID_PROFORMA.Value:=lid_proforma;
    proformaMONEDA.value:='0';
    proformaESTADO.value:='1';
    proformaCOD_EMPLEADO.value:=empleadoCOD_EMPLEADO.value;
    obt_TC.Prepare;
    obt_TC.ExecQuery;
    proformaTC.value:=StrToFloat(obt_TC.FieldByName('valor').asstring);
    obt_TC.close;
    proformaFECHA_HORA.Value:=now;

end;

procedure TM_venta.ProformaMONEDAValidate(Sender: TField);
begin
    // if proformaMONEDA.Value='' then
    //    proformaMONEDA.Value:='1'
end;

procedure TM_venta.ProformaAfterInsert(DataSet: TDataSet);
begin
     proforma.Post;
end;

procedure TM_venta.det_proformaNewRecord(DataSet: TDataSet);
begin
     det_proformaCANTIDAD.value:=1;
     det_proformaDESCUENTO.value:=0;
end;

procedure TM_venta.ProformaAfterPost(DataSet: TDataSet);
begin
     m_datos.BD_farmacia.ApplyUpdates([proforma]);
     m_datos.Transaccion.CommitRetaining;
end;

procedure TM_venta.det_proformaAfterPost(DataSet: TDataSet);
begin
     m_datos.bd_farmacia.ApplyUpdates([det_proforma]);
     m_datos.Transaccion.CommitRetaining;
     ob_totales.Params[0].asinteger:=det_proformaID_PROFORMA.Value;
     ob_totales.Prepare;
     ob_totales.ExecQuery;
     proformaMONTO.value:=ob_totales.FieldByName('monto').value;
     ob_totales.close;

end;

procedure TM_venta.det_proformaCOD_PRODUCTOValidate(Sender: TField);
begin
  if not producto.Locate('cod_producto', det_proformaCOD_PRODUCTO.Value, [locaseinsensitive]) then
    begin
      messagedlg('Debe ingresar un codigo de producto registrado',mterror,[mbok],0);
      abort;
    end
    else
    begin
       producto.Locate('cod_producto',det_proformaCOD_PRODUCTO.value,[Locaseinsensitive]);
       det_proformaNOMBREPROD.Value:=productoNOMBRECOMERCIAL.VALUE;
        //se lo hace de esta manera por si se cambian los precios
       obt_precioprod.Params[0].AsString:=det_proformaCOD_PRODUCTO.value;
       obt_precioprod.prepare;
       obt_precioprod.ExecQuery;
       if obt_precioprod.FieldByName('ultprecio').asdouble<=0.000 then
       begin
       messagedlg('Error: el producto '+productoNOMBRECOMERCIAL.VALUE+chr(13)+
                 'No tiene precio de venta (es necesario para calcular el precio)',mtwarning,[mbok],0);
       obt_precioprod.close;
       abort;

      end;
       det_proformaPRECIO_UNIT.Value:=obt_precioprod.FieldByName('ultprecio').asdouble*proformaTC.Value;
       obt_precioprod.close;
    end;
end;

procedure TM_venta.det_proformaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
   lcod_producto:string[6];
begin
     if (E is EibInterbaseerror) then
       if (E as Eiberror).sqlcode=key_repetido then
       begin
          messagedlg('Ya eligio ese producto',mtwarning,[mbok],0);
          lcod_producto:=det_proformaCOD_PRODUCTO.value;
          det_proforma.Cancel;
          det_proforma.Locate('cod_producto',lcod_producto,[locaseinsensitive]);
       end;
end;

procedure TM_venta.VentaNewRecord(DataSet: TDataSet);
begin
    ventaID_PROFORMA.value:=ProformaID_PROFORMA.value;
    ventaMONEDA.value:='1';
     obt_TC.Prepare;
     obt_TC.ExecQuery;
    ventaTC.value:=obt_TC.Fields[0].asdouble;
     obt_TC.close;
    ventaMONTO.value:=0;
    ventaCOD_EMPLEADO.value:=g_empleado.cod_empleado;
    ventaFECHA_VENTA.value:=now;
    ventaESTADO.value:='1';
    nueva_venta.ExecProc;
    ventaID_VENTA.value:=nueva_venta.Params[0].asinteger;
end;

procedure TM_venta.ClienteNewRecord(DataSet: TDataSet);
begin
        clienteESTADO.Value:='1';
        nuevo_cliente.ExecProc;
        clienteID_CLIENTE.value:=nuevo_cliente.params[0].asinteger;
end;

procedure TM_venta.VentaAfterInsert(DataSet: TDataSet);
begin
    venta.post;
end;

procedure TM_venta.FacturaNewRecord(DataSet: TDataSet);

begin
     m_datos.Fac_general.open;
     nueva_factura.ExecProc;
     FacturaID.Value:=nueva_factura.params[0].asinteger;
     FacturaFECHA_FACT.value:=date;
     FacturaESTADO.value:=1;
     FacturaNRO_RUC.value:=m_datos.Fac_generalNRO_RUC.value;
     FacturaNOMBRE_EMPRESA.value:=m_datos.Fac_generalNOMBRE_EMPRESA.value;
     FacturaDIRECCION.value:=m_datos.Fac_generalDIRECCION.value;
     FacturaTELEFONO.value:=m_datos.Fac_generalTELEFONO.value;
     FacturaNRO_ORDEN.value:=m_datos.Fac_generalNRO_ORDEN.value;
     FacturaALFANUMERICO.value:=m_datos.Fac_generalALFANUMERICO.value;
     FacturaNRO_FAC_INICIAL.Value:=m_datos.Fac_generalNRO_FAC_INICIAL.value;
     FacturaNRO_FAC_FINAL.Value:=m_datos.Fac_generalNRO_FAC_FINAL.value;
     FacturaNRO_FACTURA.value:=strtoint(f_venta.e_numfac.text);
     FacturaMONTO.value:=ventaMONTO.Value;



end;

procedure TM_venta.FacturaAfterInsert(DataSet: TDataSet);
begin
     factura.post;
end;

procedure TM_venta.FacturaNRO_FACTURAValidate(Sender: TField);
begin
    if (facturaNRO_FACTURA.value<facturaNRO_FAC_INICIAL.value) or
       (facturaNRO_FACTURA.value>facturaNRO_FAC_FINAL.value) then
    begin
         showmessage('El numero de la factura debe estar entre '+facturaNRO_FAC_INICIAL.asstring+
                      ' y '+ facturaNRO_FAC_FINAL.AsString);
          abort;
    end
end;

procedure TM_venta.FacturaPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
      if (E is EibInterbaseerror) then
       if (E as Eiberror).sqlcode=key_repetido then
       begin
          messagedlg('El numero de factura esta repetido',mtwarning,[mbok],0);
          action:=daabort;
       end;
end;

procedure TM_venta.Q_busespecBeforeOpen(DataSet: TDataSet);
begin
    obt_tc.ExecQuery;
     Gtc_busqueda:=obt_tc.fields[0].asdouble;
     obt_tc.Close;
end;

procedure TM_venta.Q_busespecCalcFields(DataSet: TDataSet);
begin
     Q_busespecPRECIOBOL.value:=Q_busespecULTPRECIO.value*gtc_busqueda;

end;

procedure TM_venta.ProductoAfterOpen(DataSet: TDataSet);
begin
      producto.FetchAll;
end;

procedure TM_venta.Q_busprincipioCalcFields(DataSet: TDataSet);
begin
      Q_busprincipioPRECIOBOL.value:=Q_busprincipioULTPRECIO.value*gtc_busqueda;
end;

procedure TM_venta.Q_busaccionCalcFields(DataSet: TDataSet);
begin
    Q_busaccionPRECIOBOL.value:=Q_busaccionULTPRECIO.value*gtc_busqueda;
end;

end.
