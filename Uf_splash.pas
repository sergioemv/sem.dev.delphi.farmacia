unit Uf_splash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, jpeg, Buttons, dxfShapedForm;

type
  Tf_splash = class(TForm)
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    l_progreso: TLabel;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_splash: Tf_splash;

implementation

{$R *.DFM}

procedure Tf_splash.BitBtn1Click(Sender: TObject);
begin
    application.Terminate;
end;

end.
