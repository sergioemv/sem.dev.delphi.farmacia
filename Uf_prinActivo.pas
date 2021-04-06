unit Uf_prinActivo;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB, DBGrids, Grids, ExtCtrls, Buttons, IBSQL;

type
  Tf_prinActivo = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    b_cancelar: TBitBtn;
    b_ok: TBitBtn;
    procedure b_okClick(Sender: TObject);
    procedure b_cancelarClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
var
  f_prinActivo: Tf_prinActivo;

implementation
uses
  U_Datos;

{$R *.DFM}

procedure Tf_prinActivo.b_okClick(Sender: TObject);
begin
    try
     m_datos.Principio_activo.post;
    except
    end;
end;

procedure Tf_prinActivo.b_cancelarClick(Sender: TObject);
begin
    try
    m_datos.Principio_activo.Cancel;
    except
    end;
end;

end.




