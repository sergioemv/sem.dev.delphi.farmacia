unit Uf_Marcaproveedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, ExtCtrls, Buttons,db, IBCustomDataSet, IBSQL,
  IBQuery, AppEvnts, jpeg, Grids, DBGrids, DBCGrids;

type
  Tf_marcaproveedor = class(TForm)
    Label3: TLabel;
    l_ultcodigo: TLabel;
    Panel1: TPanel;
    b_cancelar: TBitBtn;
    Fondo: TImage;
    Label10: TLabel;
    editprovPAIS: TDBEdit;
    Label2: TLabel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBLookupListBox1: TDBLookupListBox;
    BitBtn1: TBitBtn;
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure b_cancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_marcaproveedor: Tf_marcaproveedor;

implementation
uses
   U_datos, uf_marca;
{$R *.DFM}

procedure Tf_marcaproveedor.DBGrid1EditButtonClick(Sender: TObject);
begin
      if m_datos.Marca_proveedor.State<>dsedit  then
         m_datos.Marca_proveedor.Edit ;
      if f_marcas.showmodal=mrok  then
        m_datos.marca_proveedorCOD_MARCA.value:=m_datos.marcaCOD_MARCA.value
end;

procedure Tf_marcaproveedor.b_cancelarClick(Sender: TObject);
begin
       try
        m_datos.Marca_proveedor.Cancel;
       except
       end;
end;

procedure Tf_marcaproveedor.BitBtn1Click(Sender: TObject);
begin
      try
        m_datos.Marca_proveedor.Post;
      except
      end;
end;

end.
