unit Uf_empleados;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB, Buttons, Mask, ExtCtrls;

type
  Tf_empleados = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditCOD_EMPLEADO: TDBEdit;
    Label2: TLabel;
    EditNOMBRE: TDBEdit;
    Label3: TLabel;
    Panel2: TPanel;
    DBNavigator: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBComboBox1: TDBComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_empleados: Tf_empleados;

implementation
uses
   u_datos;

{$R *.DFM}

procedure Tf_empleados.BitBtn1Click(Sender: TObject);
begin
     try
        m_datos.empleado.Post;
     except
     end;
end;

procedure Tf_empleados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      m_datos.empleado.Close;
end;

end.