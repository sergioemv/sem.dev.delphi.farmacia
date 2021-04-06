unit Uf_facgeneral;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB, Mask, ExtCtrls;

type
  Tf_facgeneral = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditNRO_RUC: TDBEdit;
    Label2: TLabel;
    EditNOMBRE_EMPRESA: TDBEdit;
    Label3: TLabel;
    EditDIRECCION: TDBEdit;
    Label4: TLabel;
    EditTELEFONO: TDBEdit;
    Label5: TLabel;
    EditNRO_ORDEN: TDBEdit;
    Label6: TLabel;
    EditALFANUMERICO: TDBEdit;
    Label7: TLabel;
    EditNRO_FAC_INICIAL: TDBEdit;
    Label8: TLabel;
    EditNRO_FAC_FINAL: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_facgeneral: Tf_facgeneral;

implementation
    uses
      u_datos;

{$R *.DFM}

end.
