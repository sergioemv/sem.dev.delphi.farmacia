unit U_compra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IB, IBCustomDataSet, IBTable, IBSQL, IBStoredProc;

type
  TM_compra = class(TDataModule)
    ds_det_compra: TDataSource;
    ds_compra: TDataSource;
    Compra: TIBTable;
    Det_compra: TIBTable;
    CompraID_COMPRA: TIntegerField;
    CompraCOD_PROVEEDOR: TIBStringField;
    CompraMONEDA: TIBStringField;
    CompraTC: TFloatField;
    CompraFECHA_ENTREGA: TDateTimeField;
    CompraDESCUENTO: TFloatField;
    CompraCOSTO_TOTAL: TFloatField;
    CompraMONTO_FINAL: TFloatField;
    CompraMONTO_CANCELADO: TFloatField;
    CompraFECHA_PAGO: TDateTimeField;
    CompraESTADO: TIBStringField;
    CompraOBSERVACION: TIBStringField;
    Det_compraID_COMPRA: TIntegerField;
    Det_compraCOD_PRODUCTO: TIBStringField;
    Det_compraCANTIDAD: TSmallintField;
    Det_compraPRECIO_UNIT: TFloatField;
    Det_compraPRECIO_TOTAL: TFloatField;
    Det_compraCANTIDAD_EXTRA: TSmallintField;
    Proveedor: TIBTable;
    Producto: TIBTable;
    ds_proveedor: TDataSource;
    parametros: TIBTable;
    parametrosID: TSmallintField;
    parametrosDESCRIPCION: TIBStringField;
    parametrosVALOR: TIBStringField;
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
    ob_totales: TIBSQL;
    Nuevo_id_compra: TIBStoredProc;
    Det_compraNOMBREP: TStringField;
    Det_compraFECHA_VENCIMIENTO: TDateTimeField;
    procedure Act_totales;
    procedure CompraNewRecord(DataSet: TDataSet);
    procedure CompraBeforePost(DataSet: TDataSet);
    procedure CompraAfterPost(DataSet: TDataSet);
    procedure Det_compraCOD_PRODUCTOValidate(Sender: TField);
    procedure CompraFECHA_PAGOSetText(Sender: TField; const Text: String);
    procedure ds_compraUpdateData(Sender: TObject);
    procedure CompraAfterScroll(DataSet: TDataSet);
    procedure Det_compraAfterPost(DataSet: TDataSet);
    procedure Det_compraNewRecord(DataSet: TDataSet);
    procedure ds_det_compraUpdateData(Sender: TObject);
    procedure CompraAfterRefresh(DataSet: TDataSet);
    procedure Det_compraAfterRefresh(DataSet: TDataSet);
    procedure CompraCalcFields(DataSet: TDataSet);
    procedure CompraFECHA_PAGOValidate(Sender: TField);
    procedure CompraFECHA_ENTREGASetText(Sender: TField;
      const Text: String);
    procedure CompraFECHA_ENTREGAValidate(Sender: TField);
    procedure Det_compraPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CompraAfterInsert(DataSet: TDataSet);
    procedure Det_compraFECHA_VENCIMIENTOSetText(Sender: TField;
      const Text: String);
    procedure CompraBeforeDelete(DataSet: TDataSet);
    procedure Det_compraID_COMPRAValidate(Sender: TField);
    procedure CompraDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure Det_compraDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  M_compra: TM_compra;
  guardado:boolean;

implementation
uses
  U_datos;
{$R *.DFM}
procedure TM_compra.Act_totales;
var
   l_total:extended;
   lugar:Tbookmark;
begin
   lugar:=det_compra.GetBookmark;
   try
    det_compra.DisableControls;
    det_compra.First;
    l_Total := 0;
    while not det_compra.EOF do
    begin
      l_total := l_total + det_compraPRECIO_TOTAL.Value;
      det_compra.Next;
    end;
    CompraCOSTO_TOTAL.Value := l_total;
  finally
     det_compra.EnableControls;
     if lugar <> nil then
     begin
       det_compra.GoToBookmark(lugar);
       det_compra.FreeBookmark(lugar);
     end;
  end;
end;
procedure TM_compra.CompraNewRecord(DataSet: TDataSet);
begin
    CompraDESCUENTO.Value:=0;
    compraMONTO_CANCELADO.value:=0;
    compraESTADO.value:='1';
    compraFECHA_PAGO.value:=DATE;
    compraFECHA_ENTREGA.value:=DATE;
    parametros.open;
    parametros.locate('id',1,[]);
    compraTC.value:=strtofloat(parametrosVALOR.value);
    parametros.close;
    compraMONEDA.value:='1';
    compraMONTO_FINAL.value:=0;
    compraCOSTO_TOTAL.value:=0;
    //para obtener un id nuevo de compra
    nuevo_id_compra.ExecProc;
    compraID_COMPRA.value:=nuevo_id_compra.Params[0].asinteger;
    guardado:=false;
end;

procedure TM_compra.CompraBeforePost(DataSet: TDataSet);
begin
    if CompraDESCUENTO.AsString='' then
         CompraDESCUENTO.Value:=0;
    if compraMONTO_CANCELADO.Asstring='' then
         compraMONTO_CANCELADO.value:=0;
end;

procedure TM_compra.CompraAfterPost(DataSet: TDataSet);
begin
  m_datos.BD_farmacia.ApplyUpdates([compra]);
  m_datos.transaccion.CommitRetaining;
  guardado:=true;
end;

procedure TM_compra.Det_compraCOD_PRODUCTOValidate(Sender: TField);
begin
    if not producto.Locate('cod_producto', det_compraCOD_PRODUCTO.Value, [locaseinsensitive]) then
    begin
      messagedlg('Debe ingresar un codigo de producto registrado',mterror,[mbok],0);
      abort;
    end
    else
    begin
       producto.Locate('cod_producto',det_compraCOD_PRODUCTO.value,[Locaseinsensitive]);
       det_compraNOMBREP.Value:=productoNOMBRECOMERCIAL.VALUE;
    end;

end;

procedure TM_compra.CompraFECHA_PAGOSetText(Sender: TField;
  const Text: String);
begin
    try
       compraFECHA_PAGO.value:=strtodate(Text);
    except
       messagedlg('La fecha no es valida',mterror,[mbok],0);
    end;

end;

procedure TM_compra.ds_compraUpdateData(Sender: TObject);
var
   errores:string;
begin
    errores:='';
    if compraFECHA_PAGO.AsString='' then
      errores:=errores+'- Debe ingresar una fecha de Pago'+chr(13);
    if compraTC.asstring='' then
      errores:=errores+'- Debe asignarse un tipo de cambio a la compra'+chr(13);
    if compraDESCUENTO.value>compraCOSTO_TOTAL.value then
       errores:=errores+'- El descuento no puede ser mayor al monto total'+chr(13);
    if compraMONTO_CANCELADO.value>compraMONTO_FINAL.value then
       errores:=errores+'- El monto cancelado no puede ser mayor al monto final'+chr(13);

    if errores<>'' then
    begin
     errores:='Ocurrieron los siguientes errores:'+chr(13)+errores;
     messagedlg(errores,mterror,[mbok],0);
     abort;
    end;

end;

procedure TM_compra.CompraAfterScroll(DataSet: TDataSet);
begin
     if compraMONEDA.value='1' then
     begin
         compraCOSTO_TOTAL.DisplayFormat:='Bs #.000';
         compraMONTO_CANCELADO.DisplayFormat:='Bs #.000';
         compraDESCUENTO.DisplayFormat:='Bs #.000';
         compraMONTO_FINAL.DisplayFormat:='Bs #.000';
         det_compraPRECIO_UNIT.DisplayFormat:='Bs #.000';
         det_compraPRECIO_TOTAL.DisplayFormat:='Bs #.000'
     end
     else
     begin
        compraCOSTO_TOTAL.DisplayFormat:='$u$ #.000';
         compraMONTO_CANCELADO.DisplayFormat:='$u$ #.000';
         compraDESCUENTO.DisplayFormat:='$u$ #.000';
         compraMONTO_FINAL.DisplayFormat:='$u$ #.000';
          det_compraPRECIO_UNIT.DisplayFormat:='$u$ #.000';
         det_compraPRECIO_TOTAL.DisplayFormat:='$u$ #.000';
     end;

end;

procedure TM_compra.Det_compraAfterPost(DataSet: TDataSet);
begin
     m_datos.bd_farmacia.ApplyUpdates([det_compra]);
     m_datos.Transaccion.CommitRetaining;
     ob_totales.Params[0].asinteger:=det_compraID_COMPRA.Value;
     ob_totales.Prepare;
     ob_totales.ExecQuery;
     compraCOSTO_TOTAL.value:=ob_totales.FieldByName('COSTO_TOTAL').value;
     ob_totales.close;
     if compraCOSTO_TOTAL.value<compraDESCUENTO.value then
       compraDESCUENTO.value:=0;
     compraMONTO_FINAL.Value := compraCOSTO_TOTAL.value-compraDESCUENTO.value;
     if compraFECHA_PAGO.value=date then
        compraMONTO_CANCELADO.Value:=compraMONTO_FINAL.Value;
 
end;

procedure TM_compra.Det_compraNewRecord(DataSet: TDataSet);
begin
     det_compraCANTIDAD.value:=1;
     det_compraPRECIO_UNIT.Value:=0.00;
     det_compraCANTIDAD_EXTRA.value:=0;

end;

procedure TM_compra.ds_det_compraUpdateData(Sender: TObject);
var
   errores:string;
begin
    errores:='';
    if (det_compraCANTIDAD.AsString='') or (det_compraCANTIDAD.value<1) then
      errores:='- Debe ingresar Cantidad de producto mayor a cero'+chr(13);
    if det_compraCOD_PRODUCTO.asstring='' then
      errores:='- Debe ingresar un codigo de producto'+chr(13);
    if (det_compraPRECIO_UNIT.asstring='') or (det_compraPRECIO_UNIT.value<=0) then
       errores:='- Debe ingresar un precio unitario por producto mayor a cero'+chr(13);

    if errores<>'' then
    begin
     errores:='Ocurrieron los siguientes errores:'+chr(13)+errores;
     messagedlg(errores,mterror,[mbok],0);
     abort;
    end;

end;

procedure TM_compra.CompraAfterRefresh(DataSet: TDataSet);
begin
      compra.close;
      compra.open;
end;

procedure TM_compra.Det_compraAfterRefresh(DataSet: TDataSet);
begin
      det_compra.close;
      det_compra.open;
end;

procedure TM_compra.CompraCalcFields(DataSet: TDataSet);
begin
    compraMONTO_FINAL.value:=compraCOSTO_TOTAL.value-compraDESCUENTO.value;
end;

procedure TM_compra.CompraFECHA_PAGOValidate(Sender: TField);
begin
    if compraFECHA_PAGO.value<compraFECHA_ENTREGA.value then
    begin
        messagedlg('No puede pagar antes de la fecha de ingreso',mterror,[mbok],0);
        abort;
    end;
end;

procedure TM_compra.CompraFECHA_ENTREGASetText(Sender: TField;
  const Text: String);
begin
       try
       compraFECHA_ENTREGA.value:=strtodate(Text);
    except
       messagedlg('La fecha no es valida',mterror,[mbok],0);
    end;
end;

procedure TM_compra.CompraFECHA_ENTREGAValidate(Sender: TField);
begin
     if compraFECHA_ENTREGA.value>date then
    begin
        messagedlg('No se pueden ingresar fechas futuras',mterror,[mbok],0);
        abort;
    end;
    CompraFECHA_PAGOValidate(compraFECHA_PAGO);

end;

procedure TM_compra.Det_compraPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
   lcod_producto:string[6];
begin
      if (E is EibInterbaseerror) then
      begin
       if (E as Eiberror).sqlcode=key_repetido then
       begin
          messagedlg('Ya eligio ese producto',mtwarning,[mbok],0);
          lcod_producto:=det_compraCOD_PRODUCTO.value;
          det_compra.Cancel;
          det_compra.Locate('cod_producto',lcod_producto,[locaseinsensitive]);
       end;
       if (E as Eiberror).sqlcode=error_en_otra_tabla then
       begin
          messagedlg('La cantidad asignada es menor a la posible (ya se vendio o devolvio)',mtwarning,[mbok],0);
          det_compra.Cancel;
       end;
       end;

end;

procedure TM_compra.CompraAfterInsert(DataSet: TDataSet);
begin
//*********posible fuente de errors
    compra.post;
    compra.edit;
end;

procedure TM_compra.Det_compraFECHA_VENCIMIENTOSetText(Sender: TField;
  const Text: String);
begin
    try
       det_compraFECHA_VENCIMIENTO.value:=strtodate(Text);
    except
       messagedlg('La fecha no es valida',mterror,[mbok],0);
    end;
end;

procedure TM_compra.CompraBeforeDelete(DataSet: TDataSet);
begin
     if messagedlg('Seguro de borrar? (tambien se borraran los detalles)',mtwarning,[mbyes,mbno],0) = mrno then
       abort;
       

end;

procedure TM_compra.Det_compraID_COMPRAValidate(Sender: TField);
begin
    if det_compraID_COMPRA.asstring='' then
    begin
      showmessage('Primero presione CRTL-N para una nueva compra');
      abort;
    end;

end;

procedure TM_compra.CompraDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
     if (E is EibInterbaseerror) then
       if (E as Eiberror).sqlcode=propia_error then
       begin
          messagedlg('No Puede Borrar la compra (ya se hizo al menos una venta)',mterror,[mbok],0);
       end;
end;

procedure TM_compra.Det_compraDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
      if (E is EibInterbaseerror) then
       if (E as Eiberror).sqlcode=propia_error then
       begin
          messagedlg('No Puede Borrar el detalle (ya se hizo al menos una venta o devolucion)',mterror,[mbok],0);
       end;
end;

end.
