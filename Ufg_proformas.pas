unit Ufg_proformas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeEngine, Series, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls,
  TeeProcs, Chart, DBChart;

type
  Tfg_proformas = class(TForm)
    DBChart1: TDBChart;
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    Series1: TBarSeries;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Bit2(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fg_proformas: Tfg_proformas;

implementation

uses
    um_reportes;
{$R *.DFM}

procedure Tfg_proformas.BitBtn5Click(Sender: TObject);
begin
       DBChart1.Page:=0;
       DBchart1.Legend.FirstValue:=0;
end;

procedure Tfg_proformas.BitBtn4Click(Sender: TObject);
begin
       DBChart1.previouspage;
       DBchart1.Legend.FirstValue:=DBChart1.Page*10-10;
end;

procedure Tfg_proformas.Bit2(Sender: TObject);
begin
     DBChart1.Page:=DBChart1.NumPages;
     DBchart1.Legend.FirstValue:=DBChart1.Page*10-10;
end;

procedure Tfg_proformas.BitBtn2Click(Sender: TObject);
begin
     DBChart1.nextpage;
     DBchart1.Legend.FirstValue:=DBChart1.Page*10-10;
end;

procedure Tfg_proformas.BitBtn3Click(Sender: TObject);
begin
    Dbchart1.PrintLandscape;
end;

end.
