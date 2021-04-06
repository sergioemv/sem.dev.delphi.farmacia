unit Uf_numeroproforma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,IBTable, ExtCtrls;

type
  Tf_numeroventa = class(TForm)
    Notebook1: TNotebook;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    function chequear_stocks:boolean;
    function actualizar_venta:boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_numeroventa: Tf_numeroventa;

implementation
    uses
         um_venta;
{$R *.DFM}
function Tf_numeroventa.chequear_stocks:boolean;
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
                   messagedlg('La cantidad actual del producto '+m_venta.det_proformaNOMBREPROD.value+
                              ' es '+fields[0].asstring,mterror,[mbok],0);
                   res:=false;
                   m_venta.det_proforma.Last;
               end;
               close;
               m_venta.det_proforma.Next;
          end;

    end;
  chequear_stocks:=res;
end;
function Tf_numeroventa.actualizar_venta:boolean;
begin
//actualizar la existencia de stock
   m_venta.tran_venta.StartTransaction;
   try
       with m_venta.nueva_venta do
           execproc;
       with m_venta.ins_venta do
       begin
       params[0].asinteger:=m_venta.proformaID_PROFORMA.value;
       params[1].AsDouble:=m_venta.proformaTC.value;
       params[2].AsString:=m_venta.ProformaCOD_EMPLEADO.AsString;
       params[3].asinteger:=m_venta.nueva_venta.Params[0].asinteger;
       prepare;
       execquery;
       close;
       end;
       m_venta.det_proforma.first;
       while not m_venta.det_proforma.eof do
       begin
           with m_venta.ins_det_venta do
           begin
                 params[0].asstring:=m_venta.det_proformaCOD_PRODUCTO.value;
                 params[1].Asinteger:=m_venta.det_proformaCANTIDAD.value;
                 params[2].Asdouble:=m_venta.det_ProformaPRECIO_UNIT.Asfloat;
                 params[3].asinteger:=m_venta.nueva_venta.Params[0].asinteger;
                 prepare;
                 execquery;
                 close;
           end;
           m_venta.Disminuir_existencia.ParamByName('cod_producto').asstring:=m_venta.det_proformaCOD_PRODUCTO.value;
           m_venta.Disminuir_existencia.Params[1].asinteger:=m_venta.det_proformaCANTIDAD.value;
           m_venta.Disminuir_existencia.ExecProc;
           m_venta.det_proforma.Next;
       end;
       m_venta.tran_venta.commit;
       actualizar_venta:=true;
   except
       showmessage('Hubo un error al hacer la venta --- no se guardaron los datos');
       m_venta.tran_venta.rollback;
       actualizar_venta:=false;
   end;
end;

procedure Tf_numeroventa.BitBtn1Click(Sender: TObject);
begin
   if not m_venta.Proforma.Locate('id_proforma',strtoint(edit1.text),[]) then
     messagedlg('Proforma no encontrada',Mterror,[mbok],0)
   else
     if chequear_stocks then
     begin
        if actualizar_venta then
        begin
           showmessage('Venta realizada con exito');
           m_venta.det_Proforma.Close;
           m_venta.Producto.close;
           m_venta.Producto.open;
           m_venta.det_Proforma.open;
         end;
     end;
end;

procedure Tf_numeroventa.BitBtn3Click(Sender: TObject);
begin

 if not m_venta.Proforma.Locate('id_proforma',strtoint(edit1.text),[]) then
     messagedlg('Proforma no encontrada',Mterror,[mbok],0)

end;

end.
