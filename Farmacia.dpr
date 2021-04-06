program Farmacia;

uses
  Forms,
  controls,
  U_Datos in 'U_Datos.pas' {M_datos: TDataModule},
  Uf_AccTerapeutica in 'Uf_AccTerapeutica.pas' {f_accterap},
  Uf_prinActivo in 'Uf_prinActivo.pas' {f_prinActivo},
  Uf_compranueva in 'Uf_compranueva.pas' {f_compra},
  Uf_fecha in 'Uf_fecha.pas' {f_fecha},
  u_fbusporducto in 'u_fbusporducto.pas' {f_buscarproductos},
  Uf_proveedor in 'Uf_proveedor.pas' {f_proveedores},
  Uf_productos in 'Uf_productos.pas' {f_productos},
  Uf_splash in 'Uf_splash.pas' {f_splash},
  U_compra in 'U_compra.pas' {M_compra: TDataModule},
  Uf_principal in 'Uf_principal.pas' {f_principal},
  uf_progreso in 'uf_progreso.pas' {f_progreso},
  f_TC in 'f_TC.pas' {f_tc1},
  Uf_devcompra in 'Uf_devcompra.pas' {f_devcompra},
  Uf_tipoRPT in 'Uf_tipoRPT.pas' {f_tipoRPT},
  Uf_empleados in 'Uf_empleados.pas' {f_empleados},
  Uf_password in 'Uf_password.pas' {f_password},
  Uf_ajustes in 'Uf_ajustes.pas' {f_ajustes},
  Ur_inventario in 'Ur_inventario.pas' {Rpt_inventario: TQuickRep},
  Um_reportes in 'Um_reportes.pas' {M_reportes: TDataModule},
  UM_venta in 'UM_venta.pas' {M_venta: TDataModule},
  Uf_proforma in 'Uf_proforma.pas' {f_proforma},
  Ur_proforma in 'Ur_proforma.pas' {RPT_proforma: TQuickRep},
  Uf_numeroproforma in 'Uf_numeroproforma.pas' {f_numeroventa},
  Uf_facgeneral in 'Uf_facgeneral.pas' {f_facgeneral},
  Uf_cliente in 'Uf_cliente.pas' {f_cliente},
  Uf_venta in 'Uf_venta.pas' {f_venta},
  Ur_factura in 'Ur_factura.pas' {RPT_factura: TQuickRep},
  Ur_inventariobolis in 'Ur_inventariobolis.pas' {Rpt_inventarioBolis: TQuickRep},
  Ur_mesfacturas in 'Ur_mesfacturas.pas' {RPT_mesfacturas: TQuickRep},
  Ur_faltantes in 'Ur_faltantes.pas' {RPT_faltantes: TQuickRep},
  Ur_ventasgen in 'Ur_ventasgen.pas' {RPT_ventasgen: TQuickRep},
  Ur_totproforma in 'Ur_totproforma.pas' {RPT_totProformas: TQuickRep},
  Ufg_proformas in 'Ufg_proformas.pas' {fg_proformas};

{$R *.RES}

begin
  f_splash := Tf_Splash.Create(Application);
  f_splash.Show;
  f_splash.Update;
  Application.Initialize;
  f_splash.ProgressBar1.StepIt;
  Application.Title := 'Farmacia Tres Hermanos';
  Application.CreateForm(Tf_principal, f_principal);
  f_splash.l_progreso.caption:='Cargando formularios';
  f_splash.refresh;
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tfg_proformas, fg_proformas);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_ajustes, f_ajustes);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_numeroventa, f_numeroventa);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_facgeneral, f_facgeneral);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_cliente, f_cliente);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_venta, f_venta);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_compra, f_compra);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_productos, f_productos);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_prinActivo, f_prinActivo);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_progreso, f_progreso);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_tc1, f_tc1);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_devcompra, f_devcompra);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_tipoRPT, f_tipoRPT);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_empleados, f_empleados);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_proveedores, f_proveedores);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_prinActivo, f_prinActivo);
    f_splash.ProgressBar1.StepIt;
  Application.CreateForm(TF_accterap, F_accterap);
    f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_buscarproductos, f_buscarproductos);
    f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_compra, f_compra);
    f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_fecha, f_fecha);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(Tf_proforma, f_proforma);
  f_splash.ProgressBar1.StepIt;
  f_splash.l_progreso.caption:='Cargando Reportes';
  f_splash.refresh;
  Application.CreateForm(TRpt_inventarioBolis, Rpt_inventarioBolis);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(TRPT_mesfacturas, RPT_mesfacturas);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(TRPT_faltantes, RPT_faltantes);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(TRPT_ventasgen, RPT_ventasgen);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(TRPT_totProformas, RPT_totProformas);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(TRPT_factura, RPT_factura);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(TRpt_inventario, Rpt_inventario);
  f_splash.ProgressBar1.StepIt;
  Application.CreateForm(TRPT_proforma, RPT_proforma);
  f_splash.ProgressBar1.StepIt;


    f_splash.l_progreso.caption:='Cargando módulos';
    f_splash.refresh;
  Application.CreateForm(TM_datos, M_datos);
    f_splash.ProgressBar1.StepIt;
  Application.CreateForm(TM_compra, M_compra);
      f_splash.ProgressBar1.StepIt;
  Application.CreateForm(TM_venta, M_venta);
       f_splash.ProgressBar1.StepIt;
  Application.CreateForm(TM_reportes, M_reportes);
       f_splash.ProgressBar1.StepIt;
  try
     f_splash.l_progreso.caption:='Conectando a Base de Datos';
     f_splash.refresh;
     m_datos.BD_farmacia.Connected:=true;
     f_splash.ProgressBar1.StepIt;
     m_datos.Transaccion.Active:=true;
     f_splash.ProgressBar1.StepIt;
     f_splash.hide;
     f_splash.free;
      Application.CreateForm(Tf_password, f_password);
      if f_password.ShowModal=mrok then
     //abrir la base de datos
     application.run
  except
     f_splash.l_progreso.caption:='ERROR : Base de datos no encontrada';
     f_splash.refresh;
     Application.MessageBox(
        'No se puede iniciar la base de datos',
        'ERROR de apertura',
        0);
     application.terminate;
  end;


end.
