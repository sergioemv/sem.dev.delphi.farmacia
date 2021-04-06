unit Um_reportes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBQuery, IBCustomDataSet, IBTable, ActnList;

type
  TM_reportes = class(TDataModule)
    proveedor: TIBTable;
    Q_productos: TIBQuery;
    ds_proveedor: TDataSource;
    Producto: TIBTable;
    ds_productos: TDataSource;
    Ac_reportes: TActionList;
    ac_todprovprod: TAction;
    ac_unprovprod: TAction;
    proveedorCOD_PROVEEDOR: TIBStringField;
    proveedorNOMBRE: TIBStringField;
    proveedorPERSONA_CONTACTO: TIBStringField;
    proveedorTELEF_DOM: TIntegerField;
    proveedorTELEF_OF: TIntegerField;
    proveedorTELEF_CEL: TIntegerField;
    proveedorDIRECCION: TIBStringField;
    proveedorPAIS: TIBStringField;
    proveedorCIUDAD: TIBStringField;
    proveedorEMAIL: TIBStringField;
    proveedorCASILLA: TIBStringField;
    proveedorFAX: TIBStringField;
    Ac_todprovprodbol: TAction;
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
    ProductoPRECIOBOL: TFloatField;
    ac_unprodprovbol: TAction;
    Parametros: TIBTable;
    ParametrosID: TSmallintField;
    ParametrosDESCRIPCION: TIBStringField;
    ParametrosVALOR: TIBStringField;
    ac_repmensfacturas: TAction;
    Facturas: TIBTable;
    FacturasID: TIntegerField;
    FacturasNOMBRE_CLIENTE: TIBStringField;
    FacturasNRO_RUC_CLIENTE: TFloatField;
    FacturasESTADO: TIntegerField;
    FacturasNRO_RUC: TFloatField;
    FacturasNOMBRE_EMPRESA: TIBStringField;
    FacturasDIRECCION: TIBStringField;
    FacturasTELEFONO: TIBStringField;
    FacturasNRO_ORDEN: TFloatField;
    FacturasALFANUMERICO: TIBStringField;
    FacturasNRO_FAC_INICIAL: TFloatField;
    FacturasNRO_FAC_FINAL: TFloatField;
    FacturasMONTO: TFloatField;
    FacturasNRO_FACTURA: TFloatField;
    FacturasFECHA_FACT: TDateTimeField;
    ac_repfaltantesUNO: TAction;
    Q_faltantes: TIBQuery;
    Q_faltantesCOD_PRODUCTO: TIBStringField;
    Q_faltantesNOMBRECOMERCIAL: TIBStringField;
    Q_faltantesCOD_PROVEEDOR: TIBStringField;
    Q_faltantesTOT: TIntegerField;
    Q_faltantesNOMBREPROV: TStringField;
    ac_repfaltantesTODO: TAction;
    Q_faltantesSTOCK_TOTAL: TIntegerField;
    Ventas: TIBTable;
    Det_venta: TIBTable;
    ds_ventas: TDataSource;
    VentasID_VENTA: TIntegerField;
    VentasID_PROFORMA: TIntegerField;
    VentasID_CLIENTE: TSmallintField;
    VentasMONEDA: TIBStringField;
    VentasTC: TFloatField;
    VentasMONTO: TFloatField;
    VentasESTADO: TIBStringField;
    VentasCOD_EMPLEADO: TIBStringField;
    VentasOBSERVACION: TIBStringField;
    VentasFECHA_VENTA: TDateTimeField;
    Empleado: TIBTable;
    EmpleadoCOD_EMPLEADO: TIBStringField;
    EmpleadoNOMBRE: TIBStringField;
    EmpleadoPRIVILEGIO: TIBStringField;
    VentasNOMBREEMP: TStringField;
    ac_repproforma: TAction;
    q_proformas: TIBQuery;
    ds_proformas: TDataSource;
    q_proformasSUM: TIntegerField;
    q_proformasCOD_PRODUCTO: TIBStringField;
    q_proformasNOMBRECOMERCIAL: TIBStringField;
    q_proformasCOD_ENTERO: TIntegerField;
    procedure ac_todprovprodExecute(Sender: TObject);
    procedure ac_unprovprodExecute(Sender: TObject);
    procedure Ac_todprovprodbolExecute(Sender: TObject);
    procedure ProductoAfterOpen(DataSet: TDataSet);
    procedure ProductoCalcFields(DataSet: TDataSet);
    procedure ac_unprodprovbolExecute(Sender: TObject);
    procedure ac_repmensfacturasExecute(Sender: TObject);
    procedure ac_repfaltantesUNOExecute(Sender: TObject);
    procedure ac_repfaltantesTODOExecute(Sender: TObject);
    procedure ac_repproformaExecute(Sender: TObject);
    procedure q_proformasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  M_reportes: TM_reportes;
  g_ltc:real;

implementation
uses
    u_datos,Ur_inventario, Uf_tipoRPT, UM_venta, Ur_inventariobolis,
  Ur_mesfacturas, Ur_faltantes, Ufg_proformas;
{$R *.DFM}

procedure TM_reportes.ac_todprovprodExecute(Sender: TObject);
begin
    proveedor.Open;
    producto.Open;
    producto.FetchAll;
    rpt_inventario.PreviewModal;
    proveedor.close;
    producto.close;

end;

procedure TM_reportes.ac_unprovprodExecute(Sender: TObject);
begin
     proveedor.Open;
     producto.open ;
     f_tipoRPT.Notebook1.PageIndex:=0;
      if f_tipoRPT.showmodal=mrOk then
      begin
         proveedor.Filtered:=true;
         proveedor.Filter:='Nombre='+'"'+proveedorNOMBRE.asstring+'"';
         RPT_inventario.PreviewModal;
      end;
      proveedor.Filtered:=false;
      proveedor.Close;
      producto.Close;
end;

procedure TM_reportes.Ac_todprovprodbolExecute(Sender: TObject);
begin
    proveedor.Open;
    producto.Open;
    parametros.open;
    producto.FetchAll;
    rpt_inventariobolis.previewmodal;
    parametros.close;
    proveedor.close;
    producto.close;

end;

procedure TM_reportes.ProductoAfterOpen(DataSet: TDataSet);
begin
     m_venta.obt_tc.Prepare;
     m_venta.obt_TC.ExecQuery;
     g_ltc:=m_venta.obt_tc.fields[0].asdouble;
     m_venta.obt_TC.close;
end;

procedure TM_reportes.ProductoCalcFields(DataSet: TDataSet);
begin
     productoPRECIOBOL.value:=productoULTPRECIO.value*g_ltc;
end;

procedure TM_reportes.ac_unprodprovbolExecute(Sender: TObject);
begin
     proveedor.Open;
     producto.open ;
     parametros.open;
     f_tipoRPT.Notebook1.PageIndex:=0;
      if f_tipoRPT.showmodal=mrOk then
      begin
         proveedor.Filtered:=true;
         proveedor.Filter:='Nombre='+'"'+proveedorNOMBRE.asstring+'"';
         RPT_inventariobolis.PreviewModal;
      end;
      proveedor.Filtered:=false;
      parametros.close;
      proveedor.Close;
      producto.Close;
end;

procedure TM_reportes.ac_repmensfacturasExecute(Sender: TObject);
var
  mes,anno:word;
begin
     { DONE : hay solucionar el probela de mostrar el  mes en el reporte }
 //   f_tipoRPT.obtener_fecha_actual;
    if f_tipoRPT.ShowModal=MrOk then
    begin
         mes:=f_tipoRPT.c_mes.itemindex+1;
         anno:=strtoint(f_tipoRPT.e_anno.text);
         facturas.open;
         facturas.Filter:='FECHA_FACT>="'+formatdatetime('mm/dd/yy',Encodedate(anno,mes,1))
                         +'" And FECHA_FACT<"'+ formatdatetime('mm/dd/yy',Incmonth(Encodedate(anno,mes,1),1))+'"';
         facturas.filtered:=true;
         if facturas.Eof then
         RPT_mesfacturas.Lab_mes.Caption:='No hay facturas este mes'
         else
         RPT_mesfacturas.Lab_mes.Caption:=formatdatetime('mmmm, yyyy',facturasFECHA_FACT.Value);
         RPT_mesfacturas.previewmodal;
         { DONE : problema con el rango de las fechas }
       facturas.close;
    end;
end;

procedure TM_reportes.ac_repfaltantesUNOExecute(Sender: TObject);
begin
      proveedor.open;
      f_tipoRPT.Notebook1.PageIndex:=0;
      if f_tipoRPT.showmodal=mrOk then
      begin
         q_faltantes.ParamByName('p_prov').asstring:=proveedorCOD_PROVEEDOR.asstring;
         q_faltantes.Prepare;
         q_faltantes.Open;
         if q_faltantes.Eof then
           RPT_faltantes.L_nohay.caption:='NO existen Faltantes'
         else
           RPT_faltantes.L_nohay.caption:='';
         //motrar el reporte
         RPT_faltantes.previewmodal;
      end;
      q_faltantes.Close;
      proveedor.Close;

end;

procedure TM_reportes.ac_repfaltantesTODOExecute(Sender: TObject);
begin
     { DONE : corregir el reporte no esta mostrando el detalle corectamente }
     proveedor.open;
     q_faltantes.ParamByName('p_prov').asstring:='%';
     q_faltantes.Prepare;
     q_faltantes.Open;
     if q_faltantes.Eof then
        RPT_faltantes.L_nohay.caption:='NO existen Faltantes'
     else
        RPT_faltantes.L_nohay.caption:='';
         //motrar el reporte
     RPT_faltantes.previewmodal;
      q_faltantes.Close;
      proveedor.Close;

end;

procedure TM_reportes.ac_repproformaExecute(Sender: TObject);
var
   formato_anterior:string;
begin

    f_tiporpt.Notebook1.ActivePage:='fecha_comp';
    f_tiporpt.fecha1:=date;
    f_tiporpt.fecha2:=date+1;

    if f_tiporpt.ShowModal=mrok then
    begin
      //paso necesario para mandar parametros de fecha;
       formato_anterior:=ShortDateFormat;
        ShortDateFormat:='mm/dd/yy';
        q_proformas.ParamByName('fecha1').asstring:=FormatDateTime('mm/dd/yy',f_tiporpt.fecha1);
        q_proformas.ParamByName('fecha2').asstring:=FormatDateTime('mm/dd/yy',f_tiporpt.fecha2);
        q_proformas.ParamByName('minimo').value:=f_tiporpt.ignoradas;
        q_proformas.prepare;
        q_proformas.open;
       // poner el titulo del grafico
       if q_proformas.RecordCount=0 then
       begin
          showmessage('No existe ninguna proforma entre las fechas dadas');
          q_proformas.close;
       end
       else
       begin
        fg_proformas.DBChart1.Title.Text.Clear;
        fg_proformas.DBChart1.Title.Text.add('Consulta de Proformas');
        fg_proformas.DBChart1.Title.Text.add('Mostrando entre fechas '+FormatDateTime('mm/dd/yy',f_tiporpt.fecha1)+' y '+FormatDateTime('mm/dd/yy',f_tiporpt.fecha2));
        fg_proformas.DBChart1.Title.Text.add('No se ven los que tienen igual o menos de '+inttostr(f_tiporpt.ignoradas));
        fg_proformas.showmodal;
        q_proformas.close;
        ShortDateFormat:=formato_anterior;
       end;
    end;
   { TODO : Realizar este reporte si lo pide }
end;

procedure TM_reportes.q_proformasCalcFields(DataSet: TDataSet);
begin
       q_proformasCOD_ENTERO.Value:=q_proformasCOD_PRODUCTO.asinteger;
end;

end.
