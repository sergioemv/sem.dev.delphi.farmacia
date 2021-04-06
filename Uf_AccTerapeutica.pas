unit Uf_AccTerapeutica;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB, DBGrids, Grids, ExtCtrls, Buttons;

type
  Tf_accterap = class(TForm)
    DBGrid1: TDBGrid;
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
  f_accterap: Tf_accterap;

implementation
uses
 u_datos;
{$R *.DFM}

procedure Tf_accterap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if m_datos.transaccion.InTransaction then
    m_datos.transaccion.CommitRetaining;
end;

procedure Tf_accterap.BitBtn1Click(Sender: TObject);
begin
  try
    m_datos.Acc_terapeutica.post;
  except
  end;
end;

procedure Tf_accterap.BitBtn2Click(Sender: TObject);
begin
   try
    m_datos.Acc_terapeutica.Cancel;
   except
   end;
end;

end.
