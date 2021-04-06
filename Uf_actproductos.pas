unit Uf_actproductos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, ExtCtrls, Buttons,db, IBCustomDataSet, IBSQL,
  IBQuery, AppEvnts, jpeg;

type
  Tf_adproductos = class(TForm)
    l_sublinea: TLabel;
    l_linea: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    l_ultcodigo: TLabel;
    Ed_id: TMaskEdit;
    e_nombrecom: TEdit;
    Label7: TLabel;
    M_descripcion: TMemo;
    Label8: TLabel;
    Label9: TLabel;
    List_Principio: TListBox;
    Button1: TButton;
    list_ind_principios: TListBox;
    B_sel_prin: TButton;
    b_eliminar: TButton;
    Label10: TLabel;
    List_Acciones: TListBox;
    List_ind_acciones: TListBox;
    B_sel_ter: TButton;
    b_elim_ter: TButton;
    B_Acc_ter: TButton;
    Bevel1: TBevel;
    Cl_principios: TDBLookupComboBox;
    Cl_acciones: TDBLookupComboBox;
    ob_idsPRIN: TIBSQL;
    Panel1: TPanel;
    ob_idsACC: TIBSQL;
    SQL_IDrepetido: TIBSQL;
    b_cancelar: TBitBtn;
    b_guardarcerrar: TBitBtn;
    b_guardar_continuar: TBitBtn;
    SQLIns_prod: TIBSQL;
    SQLIns_prinAc: TIBSQL;
    SQLins_accter: TIBSQL;
    Fondo: TImage;
    function formulario_valido:boolean;
    function obtener_idPrinAc(p_nombre:string):integer;
    function obtener_idACC(p_nombre:string):string;
    function Escod_productoUnico(cod:string):boolean;
    procedure B_sel_prinClick(Sender: TObject);
    procedure b_eliminarClick(Sender: TObject);
    procedure List_PrincipioEnter(Sender: TObject);
    procedure B_sel_terClick(Sender: TObject);
    procedure b_elim_terClick(Sender: TObject);
    procedure limpiar_formulario;
    procedure FormShow(Sender: TObject);
    procedure b_cancelarClick(Sender: TObject);
    procedure guardar_formulario;
    procedure b_guardar_continuarClick(Sender: TObject);
    procedure b_guardarcerrarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_adproductos: Tf_adproductos;
  hubo_error:boolean;

implementation
uses
   U_datos, Uf_Productos;
{$R *.DFM}

function Tf_adproductos.Escod_productoUnico(cod:string):boolean;
var
   res:boolean  ;
begin
  with SQL_Idrepetido do
    begin
      Params[0].AsString:=cod;
      Prepare;
      ExecQuery;
      if eof then
         res:=true
      else
         res:=false;
      Close;
      Escod_productoUnico:=res;
    end
end;
function Tf_adproductos.formulario_valido:boolean;
var
   errores:string;
begin
     errores:='';
     if ed_id.text='   ' then
      errores:='- El Identificador del Producto es necesario '+Chr(13);
     if e_nombrecom.Text = '' then
      errores:=errores+'- El nombre Comercial del producto es necesario ' +Chr(13);
     if not Escod_productoUnico(l_linea.caption+l_sublinea.caption+ed_id.text) then
      errores:=errores+'- El codigo elegido ya fue asignado ' +Chr(13);
     if errores='' then
       formulario_valido:=true
     else
     begin
       formulario_valido:=false;
     errores:='Ocurrieron los siguientes Errores '+CHR(13)+errores;
      messagedlg(errores,Mterror,[Mbok],0);
     end;
end;
function Tf_adproductos.obtener_idPrinAC(p_nombre:string):integer;
begin
    with ob_idsPRIN do
    begin
      Params[0].AsString:=p_nombre;
      Prepare;
      ExecQuery;
      obtener_idPrinAC:=Fields[0].AsInteger;
      Close;
    end
end;
function Tf_adproductos.obtener_idACC(p_nombre:string):string;
begin
    with ob_idsACC do
    begin
      Params[0].AsString:=p_nombre;
      Prepare;
      ExecQuery;
      obtener_idACC:=Fields[0].Asstring;
      Close;
    end
end;
procedure Tf_adproductos.guardar_formulario;
var
   k:integer;
   lcod_producto:string;
begin
    lcod_producto:=l_linea.caption+l_sublinea.caption+ed_id.text;
    with SQLins_prod do
    begin
      Params[0].AsString:=lcod_producto;
      Params[1].AsString:=ed_id.text;
      Params[2].AsString:=l_linea.caption;
      Params[3].AsString:=l_Sublinea.caption;
      Params[4].AsString:=e_nombrecom.text;
      Params[5].AsString:=m_descripcion.text;
      Prepare;
      ExecQuery;
      Close;
    end;
    for k:=1 to list_ind_principios.Items.Count do
    with SQLins_prinAc do
    begin
      Params[0].AsString:=list_ind_principios.Items.Strings[k-1];
   //   showmessage(list_ind_principios.Items.Strings[k-1]);
      Params[1].AsString:=lcod_producto;
      Prepare;
      ExecQuery;
      Close;
    end;
    for k:=1 to list_ind_acciones.Items.Count do
    with SQLins_Accter do
    begin
      Params[0].AsString:=list_ind_acciones.Items.Strings[k-1];
      Params[1].AsString:=lcod_producto;
      Prepare;
      ExecQuery;
      Close;
    end;

end;
procedure Tf_adproductos.limpiar_formulario;
begin
    CL_principios.CloseUp(true);
//    CL_acciones.text:='';
    list_principio.Clear;
    list_acciones.Clear;
    list_ind_principios.Clear;
    list_ind_acciones.Clear;
    ed_id.Text:='';
    e_nombrecom.Text:='';
    m_descripcion.Text:='';


end;
procedure Tf_adproductos.B_sel_prinClick(Sender: TObject);
var
  id_accion:integer;
begin
   if CL_principios.text <>'' then
   begin
    if List_principio.Items.IndexOf(Cl_principios.text)=-1 then
    begin
        List_principio.Items.Add(CL_principios.Text);
        id_accion:=obtener_idPrinAC(CL_principios.Text) ;
        list_ind_principios.items.add(inttostr(id_accion));
    end;
   end;
end;

procedure Tf_adproductos.b_eliminarClick(Sender: TObject);
begin
         list_ind_principios.items.delete(List_principio.ItemIndex);
         List_principio.Items.Delete(List_principio.ItemIndex);

end;

procedure Tf_adproductos.List_PrincipioEnter(Sender: TObject);
begin
    if list_principio.SelCount>0 then
              b_eliminar.enabled:=false
    else
              b_eliminar.enabled:=true;
end;

procedure Tf_adproductos.B_sel_terClick(Sender: TObject);
var
  lid_acc:string;
begin
        if CL_acciones.text <> '' then
        begin
            if List_acciones.Items.IndexOf(Cl_acciones.text)=-1 then
             begin
                List_acciones.Items.Add(CL_acciones.text);
                lid_acc:=obtener_idACC(CL_acciones.text);
                list_ind_acciones.items.add(lid_acc);
             end;
        end

end;

procedure Tf_adproductos.b_elim_terClick(Sender: TObject);
begin
        list_ind_acciones.items.delete(List_acciones.ItemIndex);
        List_acciones.Items.Delete(List_acciones.ItemIndex);

end;

procedure Tf_adproductos.FormShow(Sender: TObject);
begin
    ed_id.SetFocus;
end;

procedure Tf_adproductos.b_cancelarClick(Sender: TObject);
begin
     //si hay alguna transaccion activa se deshace
     limpiar_formulario;
     close;
end;

procedure Tf_adproductos.b_guardar_continuarClick(Sender: TObject);
begin
hubo_error:=true;
   if formulario_valido then
    begin
//    m_datos.Transaccion.StartTransaction;
    try
     guardar_formulario;
     m_datos.Transaccion.CommitRetaining;
     l_ultcodigo.caption:=l_linea.Caption+'-'+l_sublinea.Caption+'-'+ed_id.text;
     limpiar_formulario;

    except
    //en caso de algun error inesperado
    hubo_error:=false;
      if m_datos.Transaccion.InTransaction then
      begin
          messagedlg('ha ocurrido un error inesperado'+chr(13)+'Espere un momento ....',mterror,[mbok],0);
          m_datos.Transaccion.Rollback;
          m_datos.reactivar_transaccion;
      end
      else
      begin
         messagedlg('ha ocurrido un error',Mterror,[mbok],0);
         m_datos.Productos.CancelUpdates;
         m_datos.prin_producto.CancelUpdates;
         m_datos.Acc_producto.CancelUpdates;
      end;
   end;
      f_productos.C_lineaCloseUp(sender);
  end;
end;

procedure Tf_adproductos.b_guardarcerrarClick(Sender: TObject);
begin
     b_guardar_continuarClick(sender);
     if not hubo_error then
       close;
end;

end.
