unit U_Datos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, IBTable, IBDatabase, ActnList, ImgList, StdActns,
  IBUpdateSQL, IBQuery,IB, IBSQL, IBEvents, IBStoredProc;
type
   reg_empleado = record
        cod_empleado:string[3];
        nombre:string;
        privilegio:string;
    end;
type
  TM_datos = class(TDataModule)
    BD_farmacia: TIBDatabase;
    Transaccion: TIBTransaction;
    Acc_terapeutica: TIBTable;
    ds_AccTerap: TDataSource;
    Principio_activo: TIBTable;
    ds_prin_activo: TDataSource;
    Imagenes: TImageList;
    Acciones: TActionList;
    ac_prinAc: TAction;
    ac_acTerap: TAction;
    prin_producto: TIBTable;
    ds_prin_producto: TDataSource;
    Acc_producto: TIBTable;
    Acc_productoID_ACC: TSmallintField;
    ds_acc_producto: TDataSource;
    prin_productoID_PRINACTIVO: TSmallintField;
    prin_productoCOD_PRODUCTO: TIBStringField;
    Proveedor: TIBTable;
    Acc_productoCOD_PRODUCTO: TIBStringField;
    ds_proveedor: TDataSource;
    ac_proveedores: TAction;
    ds_productos: TDataSource;
    AT_nuevoID: TIBSQL;
    PA_nuevoID: TIBSQL;
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
    Principio_activoID_PRINACTIVO: TSmallintField;
    Principio_activoNOMBRE: TIBStringField;
    Principio_activoDESCRIPCION: TIBStringField;
    Acc_terapeuticaID_ACC: TSmallintField;
    Acc_terapeuticaNOMBRE: TIBStringField;
    Acc_terapeuticaDESCRIPCION: TIBStringField;
    CH_borrarproducto: TIBSQL;
    prin_productoNOMBREPRINCIPIO: TStringField;
    Acc_productoNOMBREACCION: TStringField;
    ProveedorCOD_PROVEEDOR: TIBStringField;
    ProveedorNOMBRE: TIBStringField;
    ProveedorPERSONA_CONTACTO: TIBStringField;
    ProveedorTELEF_DOM: TIntegerField;
    ProveedorTELEF_OF: TIntegerField;
    ProveedorTELEF_CEL: TIntegerField;
    ProveedorDIRECCION: TIBStringField;
    ProveedorPAIS: TIBStringField;
    ProveedorCIUDAD: TIBStringField;
    ProveedorEMAIL: TIBStringField;
    ProveedorCASILLA: TIBStringField;
    ProveedorFAX: TIBStringField;
    ac_salirdeapp: TAction;
    ac_abinventario: TAction;
    ac_abcompra: TAction;
    ProductoPRECIO_SUG: TFloatField;
    PARAMETROS: TIBTable;
    PARAMETROSID: TSmallintField;
    PARAMETROSDESCRIPCION: TIBStringField;
    PARAMETROSVALOR: TIBStringField;
    ds_parametros: TDataSource;
    ac_TC: TAction;
    ac_ajuste: TAction;
    ac_devcompra: TAction;
    ac_abventa: TAction;
    ac_abusuarios: TAction;
    empleado: TIBTable;
    ds_empleado: TDataSource;
    empleadoCOD_EMPLEADO: TIBStringField;
    empleadoNOMBRE: TIBStringField;
    empleadoPRIVILEGIO: TIBStringField;
    accambious: TAction;
    ac_abproforma: TAction;
    ac_iraproforma: TAction;
    Fac_general: TIBTable;
    ds_fac_general: TDataSource;
    Fac_generalNRO_RUC: TFloatField;
    Fac_generalNOMBRE_EMPRESA: TIBStringField;
    Fac_generalDIRECCION: TIBStringField;
    Fac_generalTELEFONO: TIBStringField;
    Fac_generalNRO_ORDEN: TFloatField;
    Fac_generalALFANUMERICO: TIBStringField;
    Fac_generalNRO_FAC_INICIAL: TFloatField;
    Fac_generalNRO_FAC_FINAL: TFloatField;
    ac_param_factura: TAction;
    ac_vender: TAction;
    CambiarPrecioTODO: TIBStoredProc;
    CambiarPrecioUNO: TIBStoredProc;
    Ac_ajustarpreciostodos: TAction;
    Ac_ajustarprecios: TAction;
    Transaccion_Precio: TIBTransaction;
    function  chequear_stocks:boolean;
    procedure disminuir_exist;
    procedure verprivilegios;
    procedure ac_prinAcExecute(Sender: TObject);
    procedure ac_acTerapExecute(Sender: TObject);
    procedure Ac_selprinactExecute(Sender: TObject);
    procedure LineaCOD_LINEASetText(Sender: TField; const Text: String);
    procedure Principio_activoAfterPost(DataSet: TDataSet);
    procedure ds_prin_activoUpdateData(Sender: TObject);
    procedure Acc_terapeuticaAfterPost(DataSet: TDataSet);
    procedure ds_AccTerapUpdateData(Sender: TObject);
    procedure Acc_terapeuticaBeforeDelete(DataSet: TDataSet);
    procedure ds_proveedorUpdateData(Sender: TObject);
    procedure ProveedorBeforeDelete(DataSet: TDataSet);
    procedure ProveedorPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ac_proveedoresExecute(Sender: TObject);
    procedure ProveedorAfterPost(DataSet: TDataSet);
    procedure Principio_activoBeforeDelete(DataSet: TDataSet);
    procedure prin_productoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure Acc_productoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure productoAfterPost(DataSet: TDataSet);
    procedure ds_acc_productoStateChange(Sender: TObject);
    procedure productoBeforePost(DataSet: TDataSet);
    procedure ds_productosUpdateData(Sender: TObject);
    procedure productoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ds_acc_productoUpdateData(Sender: TObject);
    procedure ds_prin_productoUpdateData(Sender: TObject);
    procedure Acc_productoAfterPost(DataSet: TDataSet);
    procedure prin_productoAfterPost(DataSet: TDataSet);
    procedure ProductoNewRecord(DataSet: TDataSet);
    procedure ProductoNOMBRECOMERCIALSetText(Sender: TField;
      const Text: String);
    procedure ProveedorBeforeRefresh(DataSet: TDataSet);
    procedure Acc_terapeuticaBeforeRefresh(DataSet: TDataSet);
    procedure ProductoAfterClose(DataSet: TDataSet);
    procedure ProductoAfterOpen(DataSet: TDataSet);
    procedure ProductoAfterRefresh(DataSet: TDataSet);
    procedure Principio_activoBeforeRefresh(DataSet: TDataSet);
    procedure Principio_activoNOMBRESetText(Sender: TField;
      const Text: String);
    procedure ProveedorPAISSetText(Sender: TField; const Text: String);
    procedure ProveedorNOMBRESetText(Sender: TField; const Text: String);
    procedure ProductoCOD_SUFIJO_PRODUCTOSetText(Sender: TField;
      const Text: String);
    procedure Acc_productoNOMBREACCIONSetText(Sender: TField;
      const Text: String);
    procedure prin_productoBeforeEdit(DataSet: TDataSet);
    procedure Principio_activoPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure Acc_terapeuticaPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure ProveedorNewRecord(DataSet: TDataSet);
    procedure ac_salirdeappExecute(Sender: TObject);
    procedure ac_abinventarioExecute(Sender: TObject);
    procedure ProductoBeforeDelete(DataSet: TDataSet);
    procedure ac_abcompraExecute(Sender: TObject);
    procedure ac_TCExecute(Sender: TObject);
    procedure PARAMETROSVALORValidate(Sender: TField);
    procedure ac_abusuariosExecute(Sender: TObject);
    procedure ac_abventaExecute(Sender: TObject);
    procedure empleadoAfterRefresh(DataSet: TDataSet);
    procedure ds_empleadoUpdateData(Sender: TObject);
    procedure empleadoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure accambiousExecute(Sender: TObject);
    procedure ac_devcompraExecute(Sender: TObject);
    procedure ac_ajusteExecute(Sender: TObject);
    procedure empleadoAfterPost(DataSet: TDataSet);
    procedure ac_abproformaExecute(Sender: TObject);
    procedure ac_iraproformaExecute(Sender: TObject);
    procedure ds_fac_generalUpdateData(Sender: TObject);
    procedure Fac_generalALFANUMERICOSetText(Sender: TField;
      const Text: String);
    procedure ac_param_facturaExecute(Sender: TObject);
    procedure Fac_generalAfterPost(DataSet: TDataSet);
    procedure ac_venderExecute(Sender: TObject);
    procedure ac_ajustarExecute(Sender: TObject);
    procedure EventosEventAlert(Sender: TObject; EventName: String;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure ProductoAfterEdit(DataSet: TDataSet);
    procedure Ac_ajustarpreciostodosExecute(Sender: TObject);
    procedure Ac_ajustarpreciosExecute(Sender: TObject);
//   procedure ds_AccTerapDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  key_repetido=-803;
  Fkey_noencontrado=-530;
  val_error=-625;
  propia_error=-836;
  error_en_otra_tabla=-297;

var
  M_datos: TM_datos;
  ul_cod_producto : string[3];
  ul_cod_marca : string[3];
  g_empleado :reg_empleado;
  mande_evento:boolean;

implementation

uses  Uf_prinActivo,Uf_AccTerapeutica,
   Uf_proveedor, Uf_productos, uf_progreso, Uf_principal, U_compra,
  Uf_compranueva, f_TC, Uf_empleados, Uf_password, Uf_devcompra, Uf_ajustes,
  UM_venta, Uf_proforma, Uf_numeroproforma, Uf_facgeneral, Uf_venta,
  Um_reportes;

{$R *.DFM}

procedure TM_DATOS.disminuir_exist;
begin
     with m_venta do
     begin
          det_venta.first;
          while not det_venta.eof do
          begin
               disminuir_existencia.params[0].asstring:=det_ventaCOD_PRODUCTO.value;
               disminuir_existencia.params[1].asinteger:=det_ventaCANTIDAD.value;
               disminuir_existencia.execproc;
               det_venta.next;
          end;
     end;
end;
procedure TM_DATOS.verprivilegios;
begin
     if g_empleado.privilegio='Administrador' then
      begin
          ac_abventa.enabled:=true;
          ac_abcompra.enabled:=true;
          ac_param_factura.enabled:=true;
          ac_abinventario.enabled:=true;
          ac_TC.Enabled:=true;
          ac_abusuarios.Enabled:=true;
          m_reportes.ac_repmensfacturas.enabled:=true;
      end
      else
      begin
          ac_abventa.enabled:=true;
          ac_abcompra.enabled:=false;
          ac_abinventario.enabled:=false;
          ac_param_factura.enabled:=false;
          ac_TC.Enabled:=false;
          ac_abusuarios.Enabled:=false;
          m_reportes.ac_repmensfacturas.enabled:=true;
      end;
    if g_empleado.privilegio='empleado - proformas' then
    begin
          ac_iraproforma.Enabled:=false;
          ac_vender.enabled:=false;
    end
    else
    begin
          ac_vender.Enabled:=true;
          ac_iraproforma.enabled:=true;
    end;
end;

procedure TM_datos.ac_prinAcExecute(Sender: TObject);
begin
     if principio_activo.state<>dsinactive then
        principio_activo.close;
     principio_activo.open;
     f_prinActivo.showmodal;

end;

procedure TM_datos.ac_acTerapExecute(Sender: TObject);
begin
    if acc_terapeutica.state<>dsinactive then
        acc_terapeutica.close;
    acc_terapeutica.open;
    F_accterap.showmodal;
end;

procedure TM_datos.Ac_selprinactExecute(Sender: TObject);
begin
        transaccion.commitretaining;
        f_prinActivo.showmodal;

end;


procedure TM_datos.LineaCOD_LINEASetText(Sender: TField;
  const Text: String);
begin
{if (lineaCod_linea.CurValue <>NULL)  then
     begin
       showmessage('No puede cambiar el codigo de linea');
     end;}
end;

procedure TM_datos.Principio_activoAfterPost(DataSet: TDataSet);
begin
     bd_farmacia.ApplyUpdates([principio_activo]);
     transaccion.CommitRetaining;
     if principio_activo.Fields.FieldByName('id_prinactivo').asstring ='' then
      begin
          PA_nuevoID.Prepare;
          PA_nuevoID.ExecQuery;
          principio_activoID_PRINACTIVO.value:=PA_nuevoID.Fields[0].AsInteger;
          PA_nuevoID.Close;
      end;
end;

procedure TM_datos.ds_prin_activoUpdateData(Sender: TObject);
begin
      if Principio_activoNOMBRE.value='' then
      begin
          messagedlg('Debe ingesar un nombre de Principio activo',Mterror,[mbok],0);
      end;
end;

procedure TM_datos.Acc_terapeuticaAfterPost(DataSet: TDataSet);
begin
    bd_farmacia.ApplyUpdates([Acc_terapeutica]);
    if transaccion.InTransaction then
       transaccion.CommitRetaining;
 //   si es que no se tiene el id
    if acc_terapeutica.Fields.FieldByName('id_acc').asstring ='' then
      begin
          AT_nuevoID.Prepare;
          AT_nuevoID.ExecQuery;
          acc_terapeuticaID_ACC.value:=AT_nuevoID.Fields[0].AsInteger;
          AT_nuevoID.Close;
      end;
end;

procedure TM_datos.ds_AccTerapUpdateData(Sender: TObject);
begin
    if acc_terapeuticaNOMBRE.value='' then
      begin
          messagedlg('Debe ingesar un nombre de Accion terapeutica',Mterror,[mbok],0);
      end;
end;

procedure TM_datos.Acc_terapeuticaBeforeDelete(DataSet: TDataSet);
begin
     if Acc_producto.Locate('id_acc',Acc_terapeuticaID_ACC.value,[loCaseInsensitive]) then
     begin
        messagedlg('No puede borrar acciones terapeuticas que tengan productos relacionados',Mterror,[mbok],0);
        abort;
     end;
end;

procedure TM_datos.ds_proveedorUpdateData(Sender: TObject);
var
errores:string;
begin
     errores:='';
     if proveedorCOD_PROVEEDOR.value='' then
       errores:=errores+'-Debe asignar un código al proveedor'+chr(13);
     if (proveedorNOMBRE.value='') or (proveedorNOMBRE.value<>uppercase(proveedorNOMBRE.value)) then
     errores:=errores+'-Debe asignar un Nombre (con mayusculas) al proveedor'+chr(13);
     if errores<>'' then
     begin
       errores:='Ocurrieron los siguientes errores:'+chr(13)+errores;
       messagedlg(errores,mterror,[mbok],0);
       abort;
     end;
end;

procedure TM_datos.ProveedorBeforeDelete(DataSet: TDataSet);
begin
      if producto.Locate('cod_proveedor',proveedorCOD_PROVEEDOR.value,[loCaseInsensitive]) then
      begin
         messagedlg('No puede borrar un proveedor con productos registrados',Mterror,[mbok],0);
         abort;
      end;

end;

procedure TM_datos.ProveedorPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin

     if (E is EibInterbaseerror) then
       if (E as Eiberror).sqlcode=key_repetido then
       begin
          messagedlg('El Codigo ya fue asignado a otro proveedor',mterror,[mbok],0);
          action:=daabort;
       end;
       if (E as Eiberror).sqlcode=propia_error then
       begin
          messagedlg('No puede cambiar el codigo si ya tiene productos',mterror,[mbok],0);
          proveedor.cancel;
          action:=dafail;
       end;

end;

procedure TM_datos.ac_proveedoresExecute(Sender: TObject);
begin
    if proveedor.state<>dsinactive then
        proveedor.close;
    proveedor.open;
    f_proveedores.showmodal;
end;

procedure TM_datos.ProveedorAfterPost(DataSet: TDataSet);
begin
    bd_farmacia.ApplyUpdates([proveedor]);
    if transaccion.InTransaction then
       transaccion.CommitRetaining;
end;

procedure TM_datos.Principio_activoBeforeDelete(DataSet: TDataSet);
begin
     if Prin_producto.Locate('id_prinactivo',principio_activoID_PRINACTIVO.value,[loCaseInsensitive]) then
     begin
        messagedlg('No puede borrar principios activos que tengan productos relacionados',Mterror,[mbok],0);
        abort;
     end;
end;

procedure TM_datos.prin_productoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
      if (E is EibInterbaseerror) then
       if (E as Eiberror).sqlcode=key_repetido then
       begin
          messagedlg('Ese principio ya fue elegido',mtwarning,[mbok],0);
          prin_producto.Cancel;

       end;
       if (E as Eiberror).sqlcode=Fkey_noencontrado then
       begin
             action:=daabort;
             prin_producto.cancel;
             producto.Post;
        end;


end;

procedure TM_datos.Acc_productoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
       if (E is EibInterbaseerror) then
       if (E as Eiberror).sqlcode=key_repetido then
       begin
          messagedlg('Esa accion ya fue elegida',mtwarning,[mbok],0);
          Acc_producto.Cancel;
          action:=daabort;
       end;
       if (E as Eiberror).sqlcode=Fkey_noencontrado then
       begin
            messagedlg('Se deben guardar los cambios antes de continuar',mterror,[mbok],0);
             Acc_producto.Cancel;
             action:=daabort;
       end;
end;

procedure TM_datos.productoAfterPost(DataSet: TDataSet);
begin
   bd_farmacia.ApplyUpdates([producto,prin_producto,Acc_producto]);
    if transaccion.InTransaction then
      transaccion.CommitRetaining;
     { TODO : se debe llamar al procedimiento de actualizar precio con existencia }
  ul_cod_producto:=productoCOD_SUFIJO_PRODUCTO.value;
  
end;

procedure TM_datos.ds_acc_productoStateChange(Sender: TObject);
begin
   if ((acc_producto.state=dsedit) or (prin_producto.state=dsEdit)) and (producto.State <> dsedit) then
       producto.Edit ;
end;

procedure TM_datos.productoBeforePost(DataSet: TDataSet);
begin
    if length(productoCOD_PRODUCTO.Value) < 6 then
     productoCOD_PRODUCTO.value:=proveedorCOD_PROVEEDOR.value+productoCOD_SUFIJO_PRODUCTO.value;

    if producto.Fields.FieldByName('STOCK_MINIMO').asstring='' then
        productoSTOCK_MINIMO.value:=0;
    if (productoESTADO.value<>'0') or (productoESTADO.Value<>'1') then
        productoESTADO.value:='1';
    if producto.Fields.FieldByName('PCNT_GANANCIA').asstring='' then
        productoPCNT_GANANCIA.value:=20;

end;

procedure TM_datos.ds_productosUpdateData(Sender: TObject);
var
 errores:string;
begin
    errores:='';
    if productoNOMBRECOMERCIAL.Value='' then
      errores:=errores+'- Debe especificar un nombre de producto'+chr(13);
    if productoCOD_PROVEEDOR.value='' then
      errores:=errores+'- Debe especificar un proveedor del producto'+chr(13);
    if productoCOD_SUFIJO_PRODUCTO.value='' then
      errores:=errores+'- El codigo del producto no esta completo'+chr(13);
    if errores<>'' then
    begin
       errores:='Ocurrieron los siguientes errores:'+chr(13)+errores;
       messagedlg(errores,mterror,[mbok],0);
    end;

end;

procedure TM_datos.productoPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
     if (E is EibInterbaseerror) then
       if (E as Eiberror).sqlcode=key_repetido then
       begin
          messagedlg('El codigo del producto esta repetido',mtwarning,[mbok],0);
          action:=daabort;
       end;
       if (E as Eiberror).sqlcode=Fkey_noencontrado then
       begin
          messagedlg('El proveedor y la marca no estan registrados',mterror,[mbok],0);
          action:=daabort;
       end;
end;

procedure TM_datos.ds_acc_productoUpdateData(Sender: TObject);
begin
    if acc_producto.fields.FieldByName('id_acc').asstring='' then
           acc_producto.Cancel;
        if length(prin_productoCOD_PRODUCTO.value)<6 then
        begin
           acc_producto.Cancel;
           producto.Post ;
        end;  
end;

procedure TM_datos.ds_prin_productoUpdateData(Sender: TObject);
begin
        if prin_producto.fields.FieldByName('id_prinactivo').asstring='' then
           prin_producto.Cancel;
       if length(prin_productoCOD_PRODUCTO.value)<6 then
        begin
           prin_producto.Cancel;
           producto.Post ;
        end; 


end;

procedure TM_datos.Acc_productoAfterPost(DataSet: TDataSet);
begin
   bd_farmacia.ApplyUpdates([acc_producto]);
    if transaccion.InTransaction then
      transaccion.CommitRetaining;
end;

procedure TM_datos.prin_productoAfterPost(DataSet: TDataSet);
begin
     bd_farmacia.ApplyUpdates([prin_producto]);
    if transaccion.InTransaction then
      transaccion.CommitRetaining;
end;

procedure TM_datos.ProductoNewRecord(DataSet: TDataSet);
var
   lcod_pro:integer;
begin
    productoPCNT_GANANCIA.value:=20;
    productoSTOCK_TOTAL.value:=0;
    productoSTOCK_MINIMO.value:=0;
    productoULTPRECIO.value:=0.00;
    productoESTADO.value:='1';
    if ul_cod_producto<>'' then
    begin
        lcod_pro:=strtoint(ul_cod_producto);
        lcod_pro:=lcod_pro+1;
        if lcod_pro<10 then
          ul_cod_producto:='00'+inttostr(lcod_pro)
        else if lcod_pro<100 then
            ul_cod_producto:='0'+inttostr(lcod_pro)
            else
               ul_cod_producto:=inttostr(lcod_pro);
        productoCOD_SUFIJO_PRODUCTO.value:=ul_cod_producto;


    end;

end;

procedure TM_datos.ProductoNOMBRECOMERCIALSetText(Sender: TField;
  const Text: String);
begin
      productoNOMBRECOMERCIAL.Value := uppercase(text);
end;

procedure TM_datos.ProveedorBeforeRefresh(DataSet: TDataSet);
begin
      proveedor.Close;
      proveedor.Open;
end;

procedure TM_datos.Acc_terapeuticaBeforeRefresh(DataSet: TDataSet);
begin
      acc_terapeutica.Close;
      acc_terapeutica.Open;
end;

procedure TM_datos.ProductoAfterClose(DataSet: TDataSet);
begin
//      acc_producto.close;
//      prin_producto.Close;
end;

procedure TM_datos.ProductoAfterOpen(DataSet: TDataSet);
begin
 //  acc_producto.Open;
 //   prin_producto.Open;
end;

procedure TM_datos.ProductoAfterRefresh(DataSet: TDataSet);
begin
     producto.close;
     producto.Open;
end;

procedure TM_datos.Principio_activoBeforeRefresh(DataSet: TDataSet);
begin
     principio_activo.Close;
     principio_activo.Open;
end;

procedure TM_datos.Principio_activoNOMBRESetText(Sender: TField;
  const Text: String);
begin
     Principio_activoNOMBRE.value:=lowercase(text);
end;

procedure TM_datos.ProveedorPAISSetText(Sender: TField;
  const Text: String);
begin
     ProveedorPAIS.value:=uppercase(text);
end;

procedure TM_datos.ProveedorNOMBRESetText(Sender: TField;
  const Text: String);
begin
    proveedorNOMBRE.value:=uppercase(text);
end;

procedure TM_datos.ProductoCOD_SUFIJO_PRODUCTOSetText(Sender: TField;
  const Text: String);
begin
     productoCOD_SUFIJO_PRODUCTO.value:=text;
     productoCOD_PRODUCTO.value:=proveedorCOD_PROVEEDOR.value+productoCOD_SUFIJO_PRODUCTO.value;
end;

procedure TM_datos.Acc_productoNOMBREACCIONSetText(Sender: TField;
  const Text: String);
begin
    acc_productoNOMBREACCION.value:=lowercase(text);
end;

procedure TM_datos.prin_productoBeforeEdit(DataSet: TDataSet);
begin
      producto.edit;
end;

procedure TM_datos.Principio_activoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
 if (E is EibInterbaseerror) then
       if (E as Eiberror).sqlcode=key_repetido then
       begin
          messagedlg('El nombre del principio ya fue ingresado (presione refresh)',mtwarning,[mbok],0);
          action:=daabort;
       end;
end;

procedure TM_datos.Acc_terapeuticaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
 if (E is EibInterbaseerror) then
       if (E as Eiberror).sqlcode=key_repetido then
       begin
          messagedlg('El nombre de la accion terapeutica ya fue ingresado',mtwarning,[mbok],0);
          action:=daabort;
       end;

end;

procedure TM_datos.ProveedorNewRecord(DataSet: TDataSet);
begin
     proveedorPAIS.value:='BOLIVIA';
end;

procedure TM_datos.ac_salirdeappExecute(Sender: TObject);
begin
   if messagedlg('Esta seguro que desea salir del programa de Farmacia?',mtwarning,[mbyes,mbno],0)=mryes then
    application.terminate;
end;

procedure TM_datos.ac_abinventarioExecute(Sender: TObject);
begin
    f_progreso.show;
    f_progreso.gauge1.Max:=7;
    f_principal.refresh;
        f_progreso.gauge1.position:=1;
    try
       f_progreso.l_prog.caption:='Cerrando abiertos';
       f_progreso.Refresh;
       producto.close;
       proveedor.close;
       principio_activo.close;
       prin_producto.close;
       acc_terapeutica.close;
       acc_producto.close;
       f_progreso.Gauge1.stepit;
    except
    end;
    try

       f_progreso.l_prog.caption:='Cargando: Productos';
       f_progreso.Refresh;
       producto.Open;
       f_progreso.Gauge1.stepit;
       f_progreso.l_prog.caption:='Cargando: Proveedores';
       f_progreso.Refresh;
       proveedor.Open;
       f_progreso.Gauge1.stepit;
       f_progreso.l_prog.caption:='Cargando: Principios Activos';
       f_progreso.Refresh;
       principio_activo.Open;
       f_progreso.Gauge1.stepit;
       prin_producto.Open;
       f_progreso.Gauge1.stepit;
       f_progreso.l_prog.caption:='Cargando: Acciones terapeuticas';
       f_progreso.Refresh;
       acc_terapeutica.Open;
       f_progreso.Gauge1.stepit;
       acc_producto.Open;
       f_progreso.l_prog.caption:='terminado';
       f_progreso.Refresh;
       f_progreso.Gauge1.stepit;

    except
       showmessage('Ha ocurrido un error de apertura ');
    end;
    f_progreso.hide;
    f_productos.ShowModal;
end;

procedure TM_datos.ProductoBeforeDelete(DataSet: TDataSet);
begin
     with CH_borrarproducto do
     begin
         params[0].asstring:=productoCOD_PRODUCTO.value;
         prepare;
         execquery;

         if not EOF then
             begin
                 messagedlg('No puede borrar este Producto (existe inventario)',mterror,[mbok],0);
                 close;
                 abort;
             end;
         close;
     end;
end;

procedure TM_datos.ac_abcompraExecute(Sender: TObject);
begin
    f_progreso.show;
    f_principal.refresh;
    f_progreso.gauge1.max:=6;
    f_progreso.gauge1.position:=1;
    with m_compra do
    begin
    try


       f_progreso.l_prog.caption:='Cerrando abiertos';
       f_progreso.Refresh;
       producto.close;
       proveedor.close;
       compra.close;
       det_compra.close;
       f_progreso.Gauge1.stepit;
    except
    end;
    try

       f_progreso.l_prog.caption:='Cargando: Productos';
       f_progreso.Refresh;
       producto.Open;
       f_progreso.Gauge1.stepit;
       f_progreso.l_prog.caption:='Cargando: Proveedores';
       f_progreso.Refresh;
       proveedor.Open;
       f_progreso.Gauge1.stepit;
       f_progreso.l_prog.caption:='Cargando: Compras';
       f_progreso.Refresh;
       compra.Open;
       f_progreso.Gauge1.stepit;
       f_progreso.l_prog.caption:='Cargando: Detalles';
       f_progreso.Refresh;
       det_compra.Open;
       f_progreso.Gauge1.stepit;
       f_progreso.l_prog.caption:='terminado';
       f_progreso.Refresh;
       f_progreso.Gauge1.stepit;

    except
       showmessage('Ha ocurrido un error de apertura ');
    end;
    f_progreso.hide;
    f_compra.ShowModal;
   end;
end;

procedure TM_datos.ac_TCExecute(Sender: TObject);
begin
    parametros.Open;
    parametros.Locate('id',1,[loCaseinsensitive]);
    parametros.Edit;
    if f_TC1.showmodal=mrOK then
       parametros.post
    else
       parametros.cancel;
    parametros.close;
end;

procedure TM_datos.PARAMETROSVALORValidate(Sender: TField);

begin
     if parametrosID.value=1 then
        try
           strtofloat(PARAMETROSVALOR.value);
        except
           messagedlg('Debe ingresar un valor numerico',mterror,[mbok],0);
           abort;
        end;
end;

procedure TM_datos.ac_abusuariosExecute(Sender: TObject);
begin
  if empleado.state<>dsinactive then
        empleado.close;
    empleado.open;
    f_empleados.showmodal;
end;

procedure TM_datos.ac_abventaExecute(Sender: TObject);
begin
   //ventas
end;

procedure TM_datos.empleadoAfterRefresh(DataSet: TDataSet);
begin
      empleado.Close;
      empleado.Open;
end;

procedure TM_datos.ds_empleadoUpdateData(Sender: TObject);
    var
 errores:string;
begin
    errores:='';
    if empleadoCOD_EMPLEADO.Value='' then
      errores:=errores+'- Debe poner un codigo de empleado'+chr(13);
    if empleadoNOMBRE.value='' then
      errores:=errores+'- Debe poner el nombre del empleado'+chr(13);
    if empleadoPRIVILEGIO.value='' then
      errores:=errores+'- Debe especificar un privilegio para el empleado'+chr(13);
    if errores<>'' then
    begin
       errores:='Ocurrieron los siguientes errores:'+chr(13)+errores;
       messagedlg(errores,mterror,[mbok],0);
    end;
end;

procedure TM_datos.empleadoPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
      if (E is EibInterbaseerror) then
       if (E as Eiberror).sqlcode=key_repetido then
       begin
          messagedlg('El codigo del empleado esta repetido',mtwarning,[mbok],0);
          action:=daabort;
       end;
end;

procedure TM_datos.accambiousExecute(Sender: TObject);
begin
    f_password.showmodal;
end;

procedure TM_datos.ac_devcompraExecute(Sender: TObject);
begin
     f_devcompra.showmodal;
end;

procedure TM_datos.ac_ajusteExecute(Sender: TObject);
begin
      f_ajustes.showmodal;
end;

procedure TM_datos.empleadoAfterPost(DataSet: TDataSet);
begin
    bd_farmacia.ApplyUpdates([empleado]);
    transaccion.CommitRetaining;
    verprivilegios;
end;

procedure TM_datos.ac_abproformaExecute(Sender: TObject);
begin
    f_progreso.show;
    f_principal.refresh;
    f_progreso.gauge1.max:=7 ;
    f_progreso.gauge1.position:=1;
    with m_venta do
    begin
    try


       f_progreso.l_prog.caption:='Cerrando abiertos';
       f_progreso.Refresh;
       producto.close;
       det_proforma.close;
       proforma.close;
       empleado.close;
       proveedor.close;
       f_progreso.Gauge1.stepit;
    except
    end;
    try
       f_progreso.l_prog.caption:='Cargando: Empleado';
       f_progreso.Refresh;
       empleado.Open;
       f_progreso.Gauge1.stepit;
       f_progreso.l_prog.caption:='Cargando: Productos';
       f_progreso.Refresh;
       producto.Open;
       f_progreso.Gauge1.stepit;
       f_progreso.l_prog.caption:='Cargando: Proformas';
       f_progreso.Refresh;
       proforma.Open;
       f_progreso.Gauge1.stepit;
       f_progreso.l_prog.caption:='Cargando: Detalles';
       f_progreso.Refresh;
       det_proforma.Open;
       f_progreso.Gauge1.stepit;
       f_progreso.l_prog.caption:='Cargando: Proveedores';
       f_progreso.Refresh;
       proveedor.Open;
       f_progreso.Gauge1.stepit;
       f_progreso.l_prog.caption:='terminado';
       f_progreso.Refresh;
       f_progreso.Gauge1.stepit;

    except
       showmessage('Ha ocurrido un error de apertura (cierre la ventana e intentelo de nuevo)');
    end;
    f_progreso.hide;
    m_venta.Proforma.insert;
    f_proforma.ShowModal;
   end;
end;

procedure TM_datos.ac_iraproformaExecute(Sender: TObject);
var
   lcod_proforma:integer;
begin
//     f_numeroventa.showmodal;
     lcod_proforma:=strtoint(inputbox('Ir a la Proforma Nº','Número:',''));
     if not m_venta.proforma.locate('id_proforma',lcod_proforma,[locaseinsensitive]) then
        Showmessage('Proforma no encontrada!');
end;

procedure TM_datos.ds_fac_generalUpdateData(Sender: TObject);
   var
 errores:string;
begin
    errores:='';
    if fac_generalNRO_RUC.AsString ='' then
      errores:=errores+'- Debe poner un número de RUC'+chr(13);
    if fac_generalNOMBRE_EMPRESA.value='' then
      errores:=errores+'- Debe poner un nombre de empresa'+chr(13);
    if fac_generalDIRECCION.value='' then
      errores:=errores+'- Debe poner la dirección de la empresa'+chr(13);
    if fac_generalNRO_ORDEN.asstring='' then
      errores:=errores+'- Debe ingresar el Número de orden provisto por la renta'+chr(13);
    if fac_generalALFANUMERICO.value='' then
      errores:=errores+'- Debe ingresar el Alfanumérico provisto por la renta'+chr(13);
    if fac_generalNRO_FAC_INICIAL.asstring='' then
      errores:=errores+'- Debe ingresar el numero inicial de facturación'+chr(13);
    if fac_generalNRO_FAC_FINAL.asstring='' then
      errores:=errores+'- Debe ingresar el numero final de facturación'+chr(13);
    if fac_generalNRO_FAC_FINAL.value > fac_generalNRO_FAC_INICIAL.value then
      errores:=errores+'- El número final debe ser mayor que el inicial'+chr(13);
    if errores<>'' then
    begin
       errores:='Ocurrieron los siguientes errores:'+chr(13)+errores;
       messagedlg(errores,mterror,[mbok],0);
    end;
end;

procedure TM_datos.Fac_generalALFANUMERICOSetText(Sender: TField;
  const Text: String);
begin
        Fac_generalALFANUMERICO.Value := uppercase(text);
end;

procedure TM_datos.ac_param_facturaExecute(Sender: TObject);
begin
        Fac_General.open;
        F_FacGeneral.showmodal;
        Fac_General.close;
end;

procedure TM_datos.Fac_generalAfterPost(DataSet: TDataSet);
begin
    bd_farmacia.ApplyUpdates([fac_general]);
    transaccion.CommitRetaining;
end;

procedure TM_datos.ac_venderExecute(Sender: TObject);
var
   l_tc:string;
   l_monto:double;
begin
//ejecutar la venta
//primero se verifica que los precios hubieran sido los mismos
     m_venta.obt_TC.close;
     m_venta.obt_TC.Prepare;
     m_venta.obt_TC.ExecQuery;
     l_tc:=floattostrF(m_venta.ProformaTC.value,fffixed,15,2);
     if (abs(m_venta.obt_TC.fields[0].asdouble-m_venta.ProformaTC.value)>0.001) then
        showmessage('El tipo de cambio de la proforma es de '+l_tc+
                    ' pero el tipo de cambio actual es de '+m_venta.obt_TC.Fields[0].asstring+chr(13)+
                    'Los precios de los productos cambiarán para la venta');
     m_venta.obt_TC.close;
//se verifica previamente que haya cantidad suficiente en stock
    if chequear_stocks then
      begin
//se comienza la transaccion , se abren las tablas necesarias y se inserta;
{ DONE : Aqui se cuelga averiguar }
         f_progreso.show;
         f_progreso.gauge1.max:=4;
         f_progreso.gauge1.position:=1;

          m_venta.tran_venta.StartTransaction;
          f_progreso.Gauge1.stepit;
          f_progreso.l_prog.caption:='Comenzando...';
          f_progreso.Refresh;

          m_venta.Cliente.open;
          m_venta.Venta.open;
          m_venta.det_venta.Open;
          f_progreso.Gauge1.stepit;
          f_progreso.l_prog.caption:='Obteniendo Datos...';
          f_progreso.Refresh;
          m_venta.Cliente.Insert;
          m_venta.ClienteNOMBRE.value:=M_venta.proformaNOMBRE_CLI.value;
          m_venta.Venta.Insert;
          m_venta.det_proforma.First;
          f_progreso.Gauge1.stepit;
          f_progreso.l_prog.caption:='Llenando los Datos...';
          f_progreso.Refresh;

//se insertan todos los detalles de venta y se recalculan los montos
         l_monto:=0;
          while not m_venta.det_proforma.Eof do
          begin
              m_venta.det_venta.Insert;
              m_venta.det_ventaCOD_PRODUCTO.value:=m_venta.det_proformaCOD_PRODUCTO.Value;
              m_venta.det_ventaCANTIDAD.value:=m_venta.det_proformaCANTIDAD.Value;
              m_venta.obt_precioprod.Params[0].AsString:=m_venta.det_ventaCOD_PRODUCTO.value;
              //recalculado
              m_venta.obt_precioprod.Prepare;
              m_venta.obt_precioprod.ExecQuery;
              m_venta.det_ventaPRECIO_UNIT.Value:=m_venta.obt_precioprod.Fields[0].AsDouble*m_venta.VentaTC.value;
              m_venta.obt_precioprod.close;
              m_venta.det_venta.Post;
              l_monto:=l_monto+m_venta.det_ventaPRECIO_TOTAL.value;
              m_venta.det_proforma.Next;
          end;
          f_venta.l_monto.caption:='Bs '+floattostrF(l_monto,fffixed,15,3);
          m_venta.Venta.edit;
          m_venta.VentaMONTO.value:=l_monto;
          m_venta.Venta.post;
          m_venta.numero_factura.ExecProc;
          f_venta.e_numfac.text:=m_venta.numero_factura.params[0].asstring;
          f_progreso.Gauge1.stepit;
          f_progreso.l_prog.caption:='Terminando...';
          f_progreso.Refresh;
          f_progreso.hide;
          f_venta.showmodal;
      end;
end;
function TM_datos.chequear_stocks:boolean;
var
   res:boolean;
begin
//verificar la existencia de stock
    res:=true;
    m_venta.det_proforma.First;
    while not m_venta.det_proforma.Eof do
    begin

        with m_venta.chk_stock do
          begin
               params[0].asstring:=m_venta.det_proformaCOD_PRODUCTO.value;
               prepare;
               execquery;
               if m_venta.det_proformaCANTIDAD.value>fields[0].asinteger then
               begin
                   messagedlg('La cantidad en inventario del producto '+m_venta.det_proformaNOMBREPROD.value+
                              ' es '+fields[0].asstring+chr(13)+'Por favor arregle la cantidad',mterror,[mbok],0);
                   res:=false;
                   m_venta.det_proforma.Last;
               end;
               close;
               m_venta.det_proforma.Next;
          end;

    end;
  chequear_stocks:=res;
end;
procedure TM_datos.ac_ajustarExecute(Sender: TObject);
begin
//ajustar la cantidad del producto actual
end;

procedure TM_datos.EventosEventAlert(Sender: TObject; EventName: String;
  EventCount: Integer; var CancelAlerts: Boolean);
begin
   if eventname='mod_prod' then
    if producto.State <> dsinactive then
      if not mande_evento then
      begin
        showmessage('se modificaron los datos');
        producto.refresh;
      end
      else
         mande_evento:=false;
end;

procedure TM_datos.ProductoAfterEdit(DataSet: TDataSet);
begin
    mande_evento:=true;
end;

procedure TM_datos.Ac_ajustarpreciostodosExecute(Sender: TObject);
var
   l_porcentaje:integer;
   lugar_prov:Tbookmark;
   lugar_prod:Tbookmark;
begin
    { DONE : Problema del procedimiento almacenado y mostrar progreso }
   if messagedlg('Este aumento Afectará a todos los precios de todos los productos ¿Desea continuar?',
                  Mtwarning,[mbyes,mbno],0) = mryes then
      begin
          try
             l_porcentaje:=strtoint(inputbox('Ingrese el Porcentaje',
             'Puede ser un porcentaje positivo o negativo'
             ,'0'));
             if (l_porcentaje>=-100) and (l_porcentaje<=100) then
             begin
                 lugar_prov:=proveedor.GetBookmark;
                 lugar_prod:=producto.GetBookmark;
                 f_progreso.show;
                 f_progreso.l_prog.Caption:='Este proceso puede durar de 20 a 30 minutos por favor espere';
                 transaccion_precio.StartTransaction;
                 cambiarPrecioTODO.Params[0].asinteger:=l_porcentaje;
                 f_progreso.Refresh;
                 cambiarPrecioTODO.ExecProc;
                 transaccion_precio.Commit;
                 f_progreso.Hide;
             end
             else
               showmessage('Debe ingresar un valor entre -100 y 100');
          producto.Refresh;
          if lugar_prov<>nil then
            begin
             proveedor.GotoBookmark(lugar_prov);
             proveedor.FreeBookmark(lugar_prov);
             if lugar_prod<>nil then
             begin
                producto.GotoBookmark(lugar_prod);
                producto.FreeBookmark(lugar_prod);
             end;
            end;

          except
             f_progreso.Hide;
             showmessage('Este no es un número válido');
             transaccion_precio.Rollback;
          end;
      end;
end;

procedure TM_datos.Ac_ajustarpreciosExecute(Sender: TObject);
var
   l_porcentaje:integer;
   lugar_prov:Tbookmark;
   lugar_prod:Tbookmark;
begin
    { DONE : Problema del procedimiento almacenado y mostrar progreso }

          try
             l_porcentaje:=strtoint(inputbox('Ingrese el Porcentaje',
             'Puede ser un porcentaje positivo o negativo'
             ,'0'));
             if (l_porcentaje>=-100) and (l_porcentaje<=100) then
             begin
                 lugar_prov:=proveedor.GetBookmark;
                 lugar_prod:=producto.GetBookmark;
                 transaccion_precio.StartTransaction;
                 cambiarPrecioUNO.Parambyname('porcentaje').asinteger:=l_porcentaje;
                 cambiarPrecioUNO.Params[1].asstring:=productoCOD_PROVEEDOR.value;
                 cambiarPrecioUNO.ExecProc;
                 transaccion_precio.Commit;
             end
             else
               showmessage('Debe ingresar un valor entre -100 y 100');
          producto.Refresh;
          if lugar_prov<>nil then
            begin
             proveedor.GotoBookmark(lugar_prov);
             proveedor.FreeBookmark(lugar_prov);
             if lugar_prod<>nil then
             begin
                producto.GotoBookmark(lugar_prod);
                producto.FreeBookmark(lugar_prod);
             end;
            end;

          except
             showmessage('Este no es un número válido');
             transaccion_precio.Rollback;
          end;
end;


end.
