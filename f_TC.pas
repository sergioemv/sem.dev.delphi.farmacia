unit f_TC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls;

type
  Tf_tc1 = class(TForm)
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_tc1: Tf_tc1;

implementation
uses u_datos;
{$R *.DFM}

end.
