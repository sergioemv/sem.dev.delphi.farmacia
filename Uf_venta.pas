unit Uf_venta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, Buttons, Grids, DBGrids;

type
  Tf_venta = class(TForm)
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel1: TPanel;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBText3: TDBText;
    l_monto: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    b_facturar: TBitBtn;
    BitBtn3: TBitBtn;
    e_numfac: TEdit;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure b_facturarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_venta: Tf_venta;

implementation
 uses
    um_venta,u_datos, Ur_factura, uf_progreso;
{$R *.DFM}

procedure Tf_venta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if m_venta.tran_venta.intransaction then
       m_venta.tran_venta.Rollback;
end;

procedure Tf_venta.BitBtn1Click(Sender: TObject);
begin
    if m_venta.ClienteNOMBRE.Value='' then
        m_venta.cliente.cancel
    else
      begin
          m_venta.nuevo_cliente.ExecProc;
          m_venta.ClienteID_CLIENTE.value:=m_venta.nuevo_cliente.params[0].asinteger;
          m_venta.cliente.post;
          m_venta.Venta.Edit;
          m_venta.VentaID_CLIENTE.value:=m_venta.ClienteID_CLIENTE.value;
          m_venta.Venta.Post;
      end;
      try
         m_datos.disminuir_exist;
         m_datos.BD_farmacia.ApplyUpdates([m_venta.cliente,m_venta.venta,m_venta.det_venta]);
         m_venta.tran_venta.Commit;
      except
         showmessage('Hubo un error al guardar repita la operacion');
         m_venta.tran_venta.rollback;
      end;
end;

procedure Tf_venta.FormShow(Sender: TObject);
begin
      dbedit1.SetFocus;
end;

procedure Tf_venta.b_facturarClick(Sender: TObject);
begin
     { DONE : Aumentar la panatlla de progeso }
     f_progreso.show;
     f_progreso.gauge1.max:=3;
     f_progreso.gauge1.position:=1;
     m_venta.Factura.open;
     m_venta.Factura.Insert;
     f_progreso.Gauge1.stepit;
     f_progreso.l_prog.caption:='Comenzando...';
     f_progreso.Refresh;
      if m_venta.ClienteNOMBRE.Value='' then
      begin
        m_venta.cliente.cancel;
        m_venta.facturaNOMBRE_CLIENTE.value:='SN'
      end
    else
      begin
          m_venta.nuevo_cliente.ExecProc;
          m_venta.ClienteID_CLIENTE.value:=m_venta.nuevo_cliente.params[0].asinteger;
          m_venta.cliente.post;
          m_venta.Venta.Edit;
          m_venta.Factura.edit;
          m_venta.FacturaNOMBRE_CLIENTE.value:= m_venta.ClienteNOMBRE.Value;
          m_venta.FacturaNRO_RUC_CLIENTE.Value:=m_venta.ClienteRUC.asinteger;
          m_venta.VentaID_CLIENTE.value:=m_venta.ClienteID_CLIENTE.value;
          m_venta.Factura.post;
          m_venta.Venta.Post;
      end;
     f_progreso.Gauge1.stepit;
     f_progreso.l_prog.caption:='Guardando...';
     f_progreso.Refresh;

      m_venta.det_venta.First;
      while not m_venta.det_venta.Eof do
      begin
         m_venta.det_ventaID_FACTURA.value:=m_venta.FacturaID.value;
         m_venta.det_venta.next;
      end;
      try
         m_datos.disminuir_exist;
         m_datos.BD_farmacia.ApplyUpdates([m_venta.cliente,m_venta.venta,m_venta.factura,m_venta.det_venta]);
         f_progreso.Gauge1.stepit;
        f_progreso.l_prog.caption:='Listo (imprimiendo)...';
        f_progreso.Refresh;

         RPT_factura.print;
         m_venta.tran_venta.Commit;
         f_progreso.hide;
      except
         showmessage('Hubo un error al guardar repita la operacion');
         m_venta.tran_venta.rollback;
         f_progreso.hide;
      end;
end;

procedure Tf_venta.BitBtn2Click(Sender: TObject);
var
l_numero:int64;
begin
    try
        l_numero:=strtoint(inputbox('Ingrese el nuevo Numero de factura','Numero: ',''));
        e_numfac.text:=inttostr(l_numero);
    except
        showmessage('debe ingresar un número valido');
    end;
end;

end.
