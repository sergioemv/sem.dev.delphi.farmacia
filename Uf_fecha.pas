unit Uf_fecha;

interface

uses Windows, Classes, Graphics, Forms, Controls, Buttons,
  SysUtils, StdCtrls, Grids, Calendar, ExtCtrls, ComCtrls;

type
  Tf_fecha = class(TForm)
    Bevel1: TBevel;
    Calendar1: TMonthCalendar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    procedure SetDate(Date: TDateTime);
    function GetDate: TDateTime;
  public
    property Date: TDateTime read GetDate write SetDate;
  end;

var
  f_fecha: Tf_fecha;

implementation

{$R *.DFM}

procedure Tf_fecha.SetDate(Date: TDateTime);
begin
 Calendar1.Date := Date;
end;

function Tf_fecha.GetDate: TDateTime;
begin
  Result := Calendar1.Date;
end;
         
end.
