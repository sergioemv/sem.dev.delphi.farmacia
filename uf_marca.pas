unit uf_marca;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB, DBGrids, Grids, ExtCtrls, Buttons;

type
  Tf_marcas = class(TForm)
    g_marcas: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;


var
  f_marcas: Tf_marcas;

implementation
uses
 u_datos;
{$R *.DFM}

procedure Tf_marcas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if m_datos.transaccion.InTransaction then
    m_datos.transaccion.CommitRetaining;
end;

procedure Tf_marcas.BitBtn1Click(Sender: TObject);
begin
   try
    m_datos.marca.post;
   except
   end;
end;

procedure Tf_marcas.BitBtn2Click(Sender: TObject);
begin
  try
    m_datos.marca.Cancel;
  except
  end;
end;

end.
