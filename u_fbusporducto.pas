unit u_fbusporducto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, ExtCtrls, Buttons,db, IBCustomDataSet, IBSQL,
  IBQuery, AppEvnts, jpeg, Grids, DBGrids, ComCtrls;

type
  Tf_buscarproductos = class(TForm)
    PageControl1: TPageControl;
    tespec: TTabSheet;
    Panel1: TPanel;
    b_cancelar: TBitBtn;
    b_guardar_continuar: TBitBtn;
    g_productos: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    C_opbusq: TComboBox;
    e_dato: TEdit;
    Tgeneral: TTabSheet;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    b_busespec: TSpeedButton;
    e_datoesp: TEdit;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    b_selesp: TBitBtn;
    Label2: TLabel;
    Ch_proveedor: TCheckBox;
    DBLookupListBox1: TDBLookupListBox;
    StatusBar1: TStatusBar;
    Panel5: TPanel;
    CheckBox1: TCheckBox;
    DBLookupListBox2: TDBLookupListBox;
    Label3: TLabel;
    B_buscprincipio: TSpeedButton;
    DBGrid2: TDBGrid;
    e_datoprin: TEdit;
    Panel6: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel7: TPanel;
    BitBtn2: TBitBtn;
    b_selaccion: TBitBtn;
    DBGrid3: TDBGrid;
    Panel8: TPanel;
    Label4: TLabel;
    b_busaccion: TSpeedButton;
    CheckBox2: TCheckBox;
    DBLookupListBox3: TDBLookupListBox;
    e_datoaccion: TEdit;
    procedure ch_avanzadaClick(Sender: TObject);
    procedure Bsel_prinactivoClick(Sender: TObject);
    procedure b_borrarprincipioClick(Sender: TObject);
    procedure b_selaccionClick(Sender: TObject);
    procedure b_borraraccionClick(Sender: TObject);
    procedure b_buscarClick(Sender: TObject);
    procedure b_selprinClick(Sender: TObject);
    procedure C_opbusqChange(Sender: TObject);
    procedure b_busespecClick(Sender: TObject);
    procedure b_selespClick(Sender: TObject);
    procedure Ch_proveedorClick(Sender: TObject);
    procedure e_datoespKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure B_buscprincipioClick(Sender: TObject);
    procedure sel_princlick(Sender: TObject);
    procedure e_datoprinKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure b_busaccionClick(Sender: TObject);
    procedure e_datoaccionKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid3KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_buscarproductos: Tf_buscarproductos;
  hubo_error:boolean;

implementation
uses
   U_datos,UM_venta;
{$R *.DFM}


procedure Tf_buscarproductos.ch_avanzadaClick(Sender: TObject);
begin
 e_dato.text:='';
 e_datoesp.SetFocus;
end;

procedure Tf_buscarproductos.Bsel_prinactivoClick(Sender: TObject);


begin
  { if C_prinactivo.text <>'' then
   begin
    if L_prinactivos.Items.IndexOf(C_prinactivo.text)=-1 then
    begin
        L_prinactivos.Items.Add(C_prinactivo.Text);
    //si es que el id no esta en el dataset
        if (m_datos.Principio_activo.Fields[0].asstring='') then
        begin
//          id_principio:=f_adproductos.obtener_idPrinAC(C_prinactivo.Text);
//          l_id_prinactivo.items.add(inttostr(id_principio));
          m_datos.Principio_activo.Edit;
          m_datos.Principio_activoID_PRINACTIVO.Value:=id_principio;
          m_datos.principio_activo.post;
        end
        else
          l_id_prinactivo.items.add(m_datos.Principio_activo.Fields[0].asstring);
    end;
   end; }
end;

procedure Tf_buscarproductos.b_borrarprincipioClick(Sender: TObject);
begin
  {    l_id_prinactivo.Items.Delete(l_prinactivos.itemindex);
      l_prinactivos.items.delete(l_prinactivos.itemindex);}
end;

procedure Tf_buscarproductos.b_selaccionClick(Sender: TObject);

begin
    m_venta.det_proforma.edit;
    m_venta.det_proformaCOD_PRODUCTO.value:=m_venta.Q_busaccionCOD_PRODUCTO.value;
    f_buscarproductos.close;
    m_venta.det_proforma.post;
    m_venta.det_proforma.Refresh;
end;

procedure Tf_buscarproductos.b_borraraccionClick(Sender: TObject);
begin
   {   l_id_accterap.Items.Delete(l_accterap.itemindex);
      l_accterap.items.delete(l_accterap.itemindex);}
end;

procedure Tf_buscarproductos.b_buscarClick(Sender: TObject);
begin
    if C_opbusq.Text='1- Codigo' then
         m_venta.Producto.Locate('cod_producto',e_dato.text,[lopartialkey])
    else     if C_opbusq.Text='2- Nombre' then
                m_venta.Producto.Locate('nombrecomercial',uppercase(e_dato.text),[lopartialkey])

end;

procedure Tf_buscarproductos.b_selprinClick(Sender: TObject);
begin

    m_venta.det_proforma.edit;
    m_venta.det_proformaCOD_PRODUCTO.value:=m_venta.productoCOD_PRODUCTO.value;
    f_buscarproductos.close;
    m_venta.det_proforma.post;
    m_venta.det_proforma.Refresh;
end;

procedure Tf_buscarproductos.C_opbusqChange(Sender: TObject);
begin
      e_dato.text:='';
end;

procedure Tf_buscarproductos.b_busespecClick(Sender: TObject);
begin
    with m_venta do
    begin
       if Q_busespec.Active=true then
          Q_busespec.Active:=false;
       Q_busespec.ParamByName('pnombrecomercial').asstring:=uppercase(e_datoesp.Text);
       Q_busespec.Prepare;
       Q_busespec.Open;
    end;

end;

procedure Tf_buscarproductos.b_selespClick(Sender: TObject);
begin
    m_venta.det_proforma.edit;
    m_venta.det_proformaCOD_PRODUCTO.value:=m_venta.Q_busespecCOD_PRODUCTO.value;
    f_buscarproductos.close;
    m_venta.det_proforma.post;
    m_venta.det_proforma.Refresh;
end;

procedure Tf_buscarproductos.Ch_proveedorClick(Sender: TObject);
begin
     //ch_proveedor.checked:=not ch_proveedor.checked;
end;

procedure Tf_buscarproductos.e_datoespKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key=chr(13) then
       b_busespecClick(sender);
     if key=^j then
       b_selespClick(sender);

end;

procedure Tf_buscarproductos.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
     if key=chr(13) then
       b_selespClick(sender);
end;

procedure Tf_buscarproductos.FormCreate(Sender: TObject);
begin
    c_opbusq.ItemIndex:=0;
end;

procedure Tf_buscarproductos.B_buscprincipioClick(Sender: TObject);
begin
    with m_venta do
    begin
       if Q_busprincipio.Active=true then
          Q_busprincipio.Active:=false;
       Q_busprincipio.ParamByName('p_nombreprin').asstring:=lowercase(e_datoprin.Text);
       Q_busprincipio.Prepare;
       Q_busprincipio.Open;
    end;
end;

procedure Tf_buscarproductos.sel_princlick(Sender: TObject);
begin
    m_venta.det_proforma.edit;
    m_venta.det_proformaCOD_PRODUCTO.value:=m_venta.Q_busprincipioCOD_PRODUCTO.value;
    f_buscarproductos.close;
    m_venta.det_proforma.post;
    m_venta.det_proforma.Refresh;
end;

procedure Tf_buscarproductos.e_datoprinKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key=chr(13) then
       b_buscprincipioClick(sender);
  

end;

procedure Tf_buscarproductos.DBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
       if key=chr(13) then
       b_selprinClick(sender);
end;

procedure Tf_buscarproductos.b_busaccionClick(Sender: TObject);
begin
      with m_venta do
    begin
       if Q_busaccion.Active=true then
          Q_busaccion.Active:=false;
       Q_busaccion.ParamByName('p_nombreaccion').asstring:=lowercase(e_datoaccion.Text);
       Q_busaccion.Prepare;
       Q_busaccion.Open;
    end;
end;

procedure Tf_buscarproductos.e_datoaccionKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key=chr(13) then
       b_busaccionClick(sender);
end;

procedure Tf_buscarproductos.DBGrid3KeyPress(Sender: TObject;
  var Key: Char);
begin
     if key=chr(13) then
       b_selaccionClick(sender);
end;

end.
