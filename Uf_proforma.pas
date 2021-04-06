unit Uf_proforma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls, Grids, DBGrids, ToolWin, ComCtrls, StdCtrls, DBCtrls,
  Mask, Menus,db;

type
  Tf_proforma = class(TForm)
    Image2: TImage;
    ScrollBox1: TScrollBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    DBNavigator2: TDBNavigator;
    Shorcuts: TPopupMenu;
    Nuevo1: TMenuItem;
    DBText4: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    DBText3: TDBText;
    Label3: TLabel;
    Bevel1: TBevel;
    ToolBar2: TToolBar;
    ToolButton10: TToolButton;
    DBText5: TDBText;
    Label6: TLabel;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    StatusBar1: TStatusBar;
    Borrar1: TMenuItem;
    Ir1: TMenuItem;
    Realizarlaventa1: TMenuItem;
    Men_informes: TPopupMenu;
    ReporteMensualdeFacturas1: TMenuItem;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    ToolButton6: TToolButton;
    procedure Nuevo1Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Borrar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_proforma: Tf_proforma;

implementation
 uses
     um_venta,u_datos, u_fbusporducto, Ur_proforma,Um_reportes;
{$R *.DFM}

procedure Tf_proforma.Nuevo1Click(Sender: TObject);
begin
    m_venta.proforma.Insert;
end;

procedure Tf_proforma.ToolButton10Click(Sender: TObject);
begin
    f_proforma.close;
end;

procedure Tf_proforma.DBGrid1EditButtonClick(Sender: TObject);
begin
    f_buscarproductos.showmodal;
end;

procedure Tf_proforma.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=^j then
      f_buscarproductos.showmodal;
end;

procedure Tf_proforma.ToolButton1Click(Sender: TObject);
begin
     if m_venta.Proforma.State=dsedit then
        m_venta.proforma.post;
     if m_venta.ProformaNOMBRE_CLI.value='' then
        RPT_proforma.l_cliente.visible:=false
     else
        RPT_proforma.l_cliente.visible:=true;
     m_venta.proforma.DisableControls;
     m_venta.Proforma.Filtered:=true;
     m_venta.Proforma.Filter:='id_proforma='+inttostr(m_venta.proformaID_PROFORMA.value);
     RPT_proforma.preview;
     m_venta.Proforma.Filtered:=false;
     m_venta.Proforma.Filter:='';
     m_venta.Proforma.EnableControls;
end;

procedure Tf_proforma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        with m_venta do
        begin
             proforma.cancel;
             proforma.close;
             det_proforma.close;
             producto.close;
             empleado.close;
             proveedor.Close;
             Action:=cahide;
        end;



end;

procedure Tf_proforma.Borrar1Click(Sender: TObject);
begin
    m_venta.Proforma.delete;
end;

end.
