unit Uf_password;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, IBSQL, Buttons,
   dxTL, dxDBCtrl, dxDBGrid, dxCntner, DB;

type
  Tf_password = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    ds_empleado: TDataSource;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1Nombre: TdxDBGridColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_password: Tf_password;

implementation
uses
   u_datos, Uf_principal, UFc_datos;
{$R *.DFM}

end.
