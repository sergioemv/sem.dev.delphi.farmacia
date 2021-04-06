unit Uf_productos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, Db, DBTables,
  ComCtrls, ToolWin, Buttons, DBCGrids, IBCustomDataSet, IBQuery, jpeg,
  Menus;

type
  Tf_productos = class(TForm)
    Bevel5: TBevel;
    DBNavigator1: TDBNavigator;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Label1: TLabel;
    ed_stminimo: TDBEdit;
    DBEdit3: TDBEdit;

    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    Image1: TImage;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    Notebook1: TNotebook;
    Bevel1: TBevel;
    Label9: TLabel;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    DBGrid3: TDBGrid;
    Label10: TLabel;
    Bevel6: TBevel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    Panel1: TPanel;
    DBText3: TDBText;
    DBLookupListBox1: TDBLookupListBox;
    DBText2: TDBText;
    DBGrid1: TDBGrid;
    Bevel3: TBevel;
    ToolBar1: TToolBar;
    PopupMenu1: TPopupMenu;
    Guardar2: TMenuItem;
    Nuevo2: TMenuItem;
    Modificar2: TMenuItem;
    DBText1: TDBText;
    Label5: TLabel;
    SpeedButton5: TSpeedButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    M_reportes: TPopupMenu;
    Todoslosproveedoresysusproductos1: TMenuItem;
    Unproveedorytodossusproductos1: TMenuItem;
    TodoslosproveedoresysusproductosEnBolivianos1: TMenuItem;
    UnproveedorytodossusproductosEnBolivianos1: TMenuItem;
    ToolButton10: TToolButton;
    Menu_ajustar: TPopupMenu;
    Cambiarlosprecios1: TMenuItem;
    Cambiarlospreciosdeesteproveedor1: TMenuItem;
    ProductosRegistrados1: TMenuItem;
    Faltantes1: TMenuItem;
    Informedelosproductosfaltantesdeunproveedor1: TMenuItem;
    Informedelosproductosfaltantesdetodosproveedor1: TMenuItem;
    procedure DBGrid2EditButtonClick(Sender: TObject);
    procedure DBGrid3EditButtonClick(Sender: TObject);
    procedure Nuevo1Click(Sender: TObject);
    procedure guardar1Click(Sender: TObject);
    procedure Modificar1Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Salir1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_productos: Tf_productos;

implementation
uses
 U_datos, Uf_prinActivo, Uf_AccTerapeutica,Um_reportes;

{$R *.DFM}
procedure Tf_productos.DBGrid2EditButtonClick(Sender: TObject);
begin
    if m_datos.prin_producto.State<>dsedit  then
         m_datos.prin_producto.Edit ;
    m_datos.Principio_activo.refresh;
     if f_prinactivo.showmodal=mrok then
       m_datos.prin_productoID_PRINACTIVO.value:=m_datos.principio_activoID_PRINACTIVO.value
end;

procedure Tf_productos.DBGrid3EditButtonClick(Sender: TObject);
begin
   if m_datos.Acc_producto.State<>dsedit  then
         m_datos.Acc_producto.Edit ;
         m_datos.Acc_terapeutica.Refresh;
     if f_accterap.showmodal=mrok then
       m_datos.acc_productoID_ACC.value:=m_datos.acc_terapeuticaID_ACC.value
end;
 { DONE 5 : generar la llave del producto }
procedure Tf_productos.Nuevo1Click(Sender: TObject);
begin
    m_datos.Producto.Insert;
    dbedit7.SetFocus;
end;

procedure Tf_productos.guardar1Click(Sender: TObject);
begin
  try
   m_datos.Producto.Post;
  except
  end; 
end;

procedure Tf_productos.Modificar1Click(Sender: TObject);
begin
        m_datos.producto.Edit;
        dbedit7.SetFocus;
end;

procedure Tf_productos.DBEdit2Exit(Sender: TObject);
begin
     if DBedit7.text='' then
        DBedit7.setfocus;
end;

procedure Tf_productos.DBEdit2Enter(Sender: TObject);
begin
     DBedit2.selectall;
end;

procedure Tf_productos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   with m_datos do
   begin
        if producto.State <> dsbrowse then
          if messagedlg('Perder cambios?',Mtwarning,[mbyes,mbno],0)=mryes then
          begin
             producto.cancel;
             producto.close;
             proveedor.close;
             principio_activo.Close;
             acc_terapeutica.close;
             prin_producto.close;
             acc_producto.close;
             Action:=cahide;
          end
          else
            Action:=canone
          else
            begin
             producto.cancel;
             producto.close;
             proveedor.close;
             principio_activo.Close;
             acc_terapeutica.close;
             prin_producto.close;
             acc_producto.close;
             Action:=cahide;
            end;

   end;
end;

procedure Tf_productos.Salir1Click(Sender: TObject);
begin
     f_productos.Close;
end;

procedure Tf_productos.SpeedButton5Click(Sender: TObject);
begin
    if m_datos.productoPRECIO_SUG.AsString<>'' then
    begin
        m_datos.Producto.edit;
        m_datos.productoULTPRECIO.value:=m_datos.productoPRECIO_SUG.value;
    end;
end;

end.
