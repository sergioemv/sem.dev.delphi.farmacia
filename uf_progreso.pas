unit uf_progreso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Gauges, ComCtrls;

type
  Tf_progreso = class(TForm)
    l_prog: TLabel;
    gauge1: TProgressBar;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_progreso: Tf_progreso;

implementation

{$R *.DFM}

procedure Tf_progreso.FormShow(Sender: TObject);
begin
     gauge1.Position:=0;
end;

end.
