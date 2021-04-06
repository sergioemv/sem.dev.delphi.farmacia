unit Uf_cliente;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB, Mask, ExtCtrls, Buttons;

type
  Tf_cliente = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditNOMBRE: TDBEdit;
    Label3: TLabel;
    EditTELF: TDBEdit;
    Label4: TLabel;
    MemoDIRECCION: TDBMemo;
    Label5: TLabel;
    EditRUC: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    Label6: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_cliente: Tf_cliente;

implementation
uses
    um_venta;
{$R *.DFM}

procedure Tf_cliente.BitBtn1Click(Sender: TObject);
begin
    m_venta.Cliente.post;
end;

procedure Tf_cliente.BitBtn2Click(Sender: TObject);
begin
    m_venta.Cliente.Cancel;
end;

end.
