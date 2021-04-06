unit Uf_proveedor;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB, Mask, ExtCtrls, IBSQL, Buttons;

type
  Tf_proveedores = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditCOD_PROVEEDOR: TDBEdit;
    Label2: TLabel;
    EditNOMBRE: TDBEdit;
    Label3: TLabel;
    EditPERSONA_CONTACTO: TDBEdit;
    Label4: TLabel;
    EditTELEF_DOM: TDBEdit;
    Label5: TLabel;
    EditTELEF_OF: TDBEdit;
    Label6: TLabel;
    EditTELEF_CEL: TDBEdit;
    Label7: TLabel;
    EditDIRECCION: TDBEdit;
    Label8: TLabel;
    EditPAIS: TDBEdit;
    Label9: TLabel;
    EditCIUDAD: TDBEdit;
    Label10: TLabel;
    EditEMAIL: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
  end;
var
  f_proveedores: Tf_proveedores;


implementation

uses U_Datos;

{$R *.DFM}

procedure Tf_proveedores.BitBtn1Click(Sender: TObject);
begin
    try
      m_datos.Proveedor.post;
    except
    end;
end;

procedure Tf_proveedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   try
     m_datos.Proveedor.Cancel;
    except
    end;
end;

end.
