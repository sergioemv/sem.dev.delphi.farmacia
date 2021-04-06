unit Uf_tipoRPT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, ComCtrls;

type
  Tf_tipoRPT = class(TForm)
    Notebook1: TNotebook;
    Image2: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    DBLookupListBox1: TDBLookupListBox;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    c_mes: TComboBox;
    Label4: TLabel;
    e_anno: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    mask_fecha1: TEdit;
    mask_fecha2: TEdit;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    e_ignoradas: TEdit;
    Label6: TLabel;
    UpDown1: TUpDown;
    Label7: TLabel;
    procedure obtener_fecha_actual;
    function validar_mes_Anno:boolean;
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure aceptar_validar(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);

  private
    { Private declarations }
  public
    ignoradas:integer;
    fecha1:tdatetime;
    fecha2:tdatetime;
    function  validar_asignar_fechas:boolean;
    { Public declarations }
  end;

var
  f_tipoRPT: Tf_tipoRPT;

implementation
  uses
     Um_reportes, Uf_fecha;
{$R *.DFM}
function tf_tipoRPT.validar_asignar_fechas:boolean;
begin
   try
      fecha1:=strtodate(mask_fecha1.text);
      fecha2:=strtodate(mask_fecha2.text);
      ignoradas:=strtoint(e_ignoradas.text);
      validar_asignar_fechas:=true;
      if (fecha2<=fecha1) or (ignoradas<0) then
      begin
          validar_asignar_fechas:=false;
          showmessage('La Primera fecha debe sera MAYOR a la segunda');
      end;
   except
       validar_asignar_fechas:=false;
       showmessage('las fechas estan mal escritas o el numero esta mal escrito');
   end;
end;
function Tf_tipoRPT.validar_mes_Anno:boolean;
var
   anno:word;
begin
    try
       anno:=strtoint(e_anno.text);
         validar_mes_Anno:=true;
    except
       showmessage('Debe ingresar un año válido');
       validar_mes_Anno:=false;
    end;
end;
procedure Tf_tipoRPT.obtener_fecha_actual;
var
    dia,ano,mes:word;
begin

    decodeDate(now,ano,mes,dia);
    e_anno.text:=inttostr(ano);
    c_mes.ItemIndex:=mes-1;

end;
procedure Tf_tipoRPT.BitBtn3Click(Sender: TObject);
begin
     if validar_mes_anno then
       f_tipoRPT.modalResult:=mrok;
end;

procedure Tf_tipoRPT.SpeedButton1Click(Sender: TObject);
begin
    f_fecha.Calendar1.Date:=date;
     if f_fecha.ShowModal=mrok then
     begin
         fecha1:=f_fecha.calendar1.date;
         mask_fecha1.Text:=datetostr(fecha1);
     end;
end;

procedure Tf_tipoRPT.aceptar_validar(Sender: TObject);

begin
     if validar_asignar_fechas then
        f_tipoRPt.modalresult:=mrok;
end;

procedure Tf_tipoRPT.FormActivate(Sender: TObject);
begin
     mask_fecha1.text:=datetostr(fecha1);
     mask_fecha2.text:=datetostr(fecha2);
     e_ignoradas.text:=inttostr(ignoradas);
end;

procedure Tf_tipoRPT.SpeedButton2Click(Sender: TObject);
begin
    f_fecha.Calendar1.Date:=date;
     if f_fecha.ShowModal=mrok then
     begin
         fecha2:=f_fecha.calendar1.date;
         mask_fecha2.Text:=datetostr(fecha2);
     end;
end;

end.
