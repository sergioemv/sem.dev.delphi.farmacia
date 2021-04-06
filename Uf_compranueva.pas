unit Uf_compranueva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, Db, DBTables,
  ComCtrls, ToolWin, Buttons, DBCGrids, IBCustomDataSet, IBQuery, jpeg,
  Menus;

type
  Tf_compra = class(TForm)
    G_productos: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    P_id_compra: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label1: TLabel;
    Label4: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label5: TLabel;
    Image1: TImage;
    Bevel6: TBevel;
    Label6: TLabel;
    Label9: TLabel;
    L_id_compra: TDBText;
    rad_moneda: TDBRadioGroup;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    b_fecha_entrega: TSpeedButton;
    e_fecha_pago: TDBEdit;
    ToolBar1: TToolBar;
    Image2: TImage;
    DBNavigator2: TDBNavigator;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    Bevel9: TBevel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBLookupListBox2: TDBLookupListBox;
    Shorcuts: TPopupMenu;
    Nuevo1: TMenuItem;
    Modificar1: TMenuItem;
    Guardar1: TMenuItem;
    Label11: TLabel;
    DBText1: TDBText;
    Label12: TLabel;
    e_fecha_entrega: TDBEdit;
    SpeedButton5: TSpeedButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Men_informes: TPopupMenu;
    InformedeComprasgeneral1: TMenuItem;
    Informedecomprasporproveedor1: TMenuItem;
    StatusBar1: TStatusBar;
    ToolButton2: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure buscar_producto;
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Nuevo1Click(Sender: TObject);
    procedure Modificar1Click(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);
    procedure rad_monedaChange(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure G_productosEditButtonClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_compra: Tf_compra;
  guardado:boolean;

implementation
uses
 U_datos, Uf_fecha, u_fbusporducto,U_compra;

{$R *.DFM}
procedure Tf_compra.buscar_producto;
begin

     if f_buscarproductos.showmodal=mrOk then

end;
procedure Tf_compra.BitBtn1Click(Sender: TObject);
begin
     f_fecha.Calendar1.Date:=m_compra.CompraFECHA_PAGO.value;
     if f_fecha.ShowModal=mrok then
     begin
         m_compra.Compra.Edit;
         m_compra.CompraFECHA_PAGO.value:=f_fecha.Calendar1.Date;
         e_fecha_pago.SelectAll;
     end;
end;

procedure Tf_compra.SpeedButton4Click(Sender: TObject);
begin
    f_compra.close;
end;

procedure Tf_compra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
with m_compra do
   begin
        if compra.State <> dsbrowse then
          if messagedlg('Perder cambios?',Mtwarning,[mbyes,mbno],0)=mryes then
          begin
             compra.cancel;
             det_compra.close;
             proveedor.close;
             Action:=cahide;
          end
          else
            Action:=canone
          else
            begin
             compra.cancel;
             compra.close;
             det_compra.close;
             Action:=cahide;
            end;

   end;
end;

procedure Tf_compra.Nuevo1Click(Sender: TObject);
begin
    m_compra.compra.insert;
    g_productos.setfocus;
end;

procedure Tf_compra.Modificar1Click(Sender: TObject);
begin
     m_compra.compra.edit;
end;

procedure Tf_compra.Guardar1Click(Sender: TObject);
begin
    m_compra.compra.post;
end;

procedure Tf_compra.rad_monedaChange(Sender: TObject);
begin
    { DONE 1 -cpantalla : cambiar automaticamente el formato de presentacion de compra }
end;

procedure Tf_compra.SpeedButton5Click(Sender: TObject);
begin
    f_fecha.Calendar1.Date:=m_compra.CompraFECHA_ENTREGA.value;
     if f_fecha.ShowModal=mrok then
     begin
         m_compra.Compra.Edit;
         m_compra.CompraFECHA_ENTREGA.value:=f_fecha.Calendar1.Date;
         e_fecha_entrega.SelectAll;
     end;
end;

procedure Tf_compra.G_productosEditButtonClick(Sender: TObject);
begin
     if m_compra.Det_compraFECHA_VENCIMIENTO.AsString<>'' then
      f_fecha.Calendar1.Date:=m_compra.det_CompraFECHA_VENCIMIENTO.value
     else
      f_fecha.Calendar1.Date:=date;
     if f_fecha.ShowModal=mrok then
     begin
         m_compra.det_compra.Edit;
         m_compra.det_CompraFECHA_VENCIMIENTO.value:=f_fecha.Calendar1.Date;
     end;
end;

procedure Tf_compra.ToolButton4Click(Sender: TObject);
begin
     f_compra.close;
end;

end.
