unit Uf_principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ToolWin, ComCtrls, ImgList, Buttons, ExtCtrls, jpeg, StdCtrls;

type
  Tf_principal = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel1: TPanel;
    Label2: TLabel;
    l_nombreus: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton8: TSpeedButton;
    procedure ac_salirExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_principal: Tf_principal;

implementation

uses U_Datos;

{$R *.DFM}

procedure Tf_principal.ac_salirExecute(Sender: TObject);
begin
    application.Terminate;
end;

procedure Tf_principal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    m_datos.ac_salirdeapp.Execute;
    action:= canone;
end;

procedure Tf_principal.FormShow(Sender: TObject);
begin
     l_nombreus.Caption:=g_empleado.nombre;
end;

procedure Tf_principal.FormCreate(Sender: TObject);
begin
    mande_evento:=false;
end;

end.
