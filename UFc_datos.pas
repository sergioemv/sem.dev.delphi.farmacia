unit UFc_datos;

interface

uses
  SysUtils, Classes, ActnList, DB, ADODB,variants,dialogs,controls;

type
  Tmc_datos = class(TDataModule)
    ConecLocal: TADOConnection;
    Productos: TADOTable;
    AC_prod: TActionList;
    Ac_Mproductos: TAction;
    AC_ingresar: TAction;
    Empleado: TADOTable;
    EmpleadoCodigo: TWideStringField;
    EmpleadoNombre: TWideStringField;
    EmpleadoPrivilegio: TWideStringField;
    procedure Ac_MproductosExecute(Sender: TObject);
    procedure AC_ingresarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mc_datos: Tmc_datos;

implementation

uses Uf_password;

{$R *.dfm}

procedure Tmc_datos.Ac_MproductosExecute(Sender: TObject);
begin
     //abrir formulario de actulaizacion de productos
     
end;

procedure Tmc_datos.AC_ingresarExecute(Sender: TObject);
begin
     //ingresa al sistema
     if not Empleado.Locate('codigo;Nombre',vararrayof([empleadoNombre.Value,f_password.edit1.text]),[]) then
     begin
         showmessage(' Codigo Incorrecto');
         f_password.modalresult := mrnone
     end
     else
        f_password.modalresult := mrok;

end;

end.
