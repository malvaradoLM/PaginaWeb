﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RPSuiteServer
{
    using System;
    using System.Collections.Generic;
    using RemObjects.SDK;
    using RemObjects.SDK.Types;
    using RemObjects.SDK.Server;
    using RemObjects.SDK.Server.ClassFactories;
    using RemObjects.DataAbstract.Server;
    using System.Data;

    [RemObjects.SDK.Server.ClassFactories.StandardClassFactory()]
    [RemObjects.SDK.Server.Service(Name = "RPDataService", InvokerClass = typeof(RPDataService_Invoker), ActivatorClass = typeof(RPDataService_Activator))]
    public class RPDataService : RemObjects.DataAbstract.Server.DataAbstractService, IRPDataService
    {
        private RemObjects.DataAbstract.Bin2DataStreamer dataStreamer;
        private System.ComponentModel.IContainer components;

        public RPDataService() :
                this(null, null)
        {
        }
        public RPDataService(ISessionManager sessionManager, IEventSinkManager eventManager) :
                base(sessionManager, eventManager)
        {
            this.InitializeComponent();
        }




        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.dataStreamer = new RemObjects.DataAbstract.Bin2DataStreamer(this.components);
            // 
            // dataStreamer
            // 
            this.dataStreamer.SendReducedDelta = false;
            // 
            // RPDataService
            // 
            this.AcquireConnection = true;
            this.RequireSession = true;
            this.ServiceDataStreamer = this.dataStreamer;
            this.ServiceSchemaName = "RPSuiteServer";

        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if ((this.components != null))
                {
                    this.components.Dispose();
                }
            }
            base.Dispose(disposing);
        }

        public System.DateTime Fecha()
        {
            return System.DateTime.Now;
        }

        public bool GuardaFactura(TFactura Datos)
        {
            return true;
        }

        public int SPGetFolio(string Datos)
        {
            IDbCommand command;
            using (IDataReader reader = this.ServiceSchema.GetDataReader(this.Connection, "UpdateFolio", new string[] { "Datos" }, new object[] { Datos }, out command))
            {
                while (reader.Read())
                {
                    // do something
                }
            }
            return 0;
        }

        public int Folio(string Campo, string Serie)
        {
            int Res = -1;
            IDbCommand command;
            using (IDataReader reader = this.ServiceSchema.GetDataReader(this.Connection, "spFolio", new string[] { "Campo", "Serie" }, new object[] { Campo, Serie }, out command))
            {
                while (reader.Read())
                {
                    Res = (int)reader["Folio"];
                }
            }
            return Res;
        }


        public string getGasolinero()
        {
            string Res = "";
            IDbCommand command;
            using (IDataReader reader = this.ServiceSchema.GetDataReader(this.Connection, "cmdGasolinero", new string[] { }, new object[] { }, out command))
            {
                while (reader.Read())
                {
                    Res = (string)reader["Nombre"];
                }
            }
            return Res;
        }
         
        public TCliente getCliente(int ClienteID)
        {
            TCliente Res = new TCliente();
            try
            {
                IDbCommand command;

                  using (IDataReader reader = this.ServiceSchema.GetDataReader(this.Connection, "BuscaCliente", new string[] { "ClienteID" }, new object[] { ClienteID }, out command))
               // using (IDataReader reader = this.ServiceSchema.GetDataReader(this.Connection, "BuscaCliente", new string[] { "ClienteID" }, new object[] { ClienteID }, out command))

                {
                    while (reader.Read())
                    {
                        Res.ClienteID = ClienteID;

                        if (reader["Nombre"] != DBNull.Value)
                        {
                            Res.Nombre = (string)reader["Nombre"];
                        }
                        if (reader["RazonSocial"] != DBNull.Value)
                        {
                            Res.RazonSocial = (string)reader["RazonSocial"];
                        }
                        if (reader["Domicilio"] != DBNull.Value)
                        { Res.Domicilio = (string)reader["Domicilio"]; }

                        if (reader["Colonia"] != DBNull.Value)
                        { Res.Colonia = (string)reader["Colonia"]; }

                        if (reader["Ciudad"] != DBNull.Value)
                        { Res.Ciudad = (string)reader["Ciudad"]; }

                        if (reader["Telefono"] != DBNull.Value)
                        { Res.Telefono = (string)reader["Telefono"]; }

                        if (reader["CodigoPostal"] != DBNull.Value)
                        { Res.CodigoPostal = (string) reader["CodigoPostal"]; }

                        if (reader["RFC"] != DBNull.Value)
                        { Res.RFC = (string)reader["RFC"]; }


                        if (reader["Estado"] != DBNull.Value)
                        { Res.Estado = (string)reader["Estado"]; }

                        if (reader["estatus"] != DBNull.Value)
                        { Res.Estatus = (string)reader["estatus"]; }
                        if (reader["LimiteCredito"] != DBNull.Value)
                        { Res.LimiteCredito = (double)reader["LimiteCredito"]; }
                        if (reader["Grupo"] != DBNull.Value)
                        { Res.Grupo = (string)reader["Grupo"]; }
                        if (reader["Saldo"] != DBNull.Value)
                        { Res.Saldo = (double)reader["Saldo"]; }
                    }
                }
            }
            catch (Exception ex)
            {
                Session["Caducada"] = "Si";
                Res.ClienteID = -1;
            }
            return Res;
           
           
        }

        public Boolean UpdateVehiculo(TVehiculo Datos)
        {
            try
            {
                using (IDbCommand lcommand = this.ServiceSchema.NewCommand(this.Connection, "UpdateVehiculo", new string[] {
                    "Nip", "Status", "CargasMaximas","LimiteLTDia","LimiteLTSemana","LimiteLTMes","LimiteMNDia","LimiteMNSemana","LimiteMNMes",
                    "Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo","ProductoAutorizado","VehiculoID","Estacion"
                }
                    , new object[] { Datos.Nip,Datos.Status,Datos.CargasMaximas,Datos.LimiteLTDia,Datos.LimiteLTSemana,Datos.LimiteLTMes,
                        Datos.LimiteMNDia,Datos.LimiteMNSemana,Datos.LimiteMNMes,Datos.Lunes,
                        Datos.Martes,Datos.Miercoles,Datos.Jueves,Datos.Viernes,Datos.Sabado,Datos.Domingo,Datos.ProductoAutorizado,Datos.VehiculoID,Datos.Estacion
                            }))
                {
                    lcommand.ExecuteNonQuery();
                    return true;
                }
                    
            }
            catch (Exception ex)
            {
                return false;
            }     
        }

        public Boolean UpdateUsuarioWeb(TUsuarioWeb Datos)
        {
            try
            {
                using (IDbCommand lcommand = this.ServiceSchema.NewCommand(this.Connection, "UpdateUsuarioWeb", new string[] {
                    "UsuarioWebID", "Nombre", "Usuario","Clave","Administrador","ClienteID"
                }
                    , new object[] { Datos.UsuarioWebID, Datos.Nombre,Datos.Usuario, Datos.Clave, Datos.Administrador, Datos.ClienteID
                            }))
                {
                    lcommand.ExecuteNonQuery();
                    return true;
                }

            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Boolean setUsuarioWeb(TUsuarioWeb Datos)
        {
            try
            {
                using (IDbCommand lcommand = this.ServiceSchema.NewCommand(this.Connection, "setUsuarioWeb", new string[] {
                    "UsuarioWebID", "Nombre", "Usuario","Clave","Administrador","ClienteID"
                }
                    , new object[] { Datos.UsuarioWebID, Datos.Nombre,Datos.Usuario, Datos.Clave, Datos.Administrador, Datos.ClienteID
                            }))
                {
                    lcommand.ExecuteNonQuery();
                    return true;
                }

            }
            catch (Exception ex)
            {
                return false;
            }
        }
        //METODO QUE MUESTRA INFORMACION DE CONSUMOS DE FACTURAS por fecha
        public virtual TConsumo ListaConsumoByFecha(int ClienteID, string FechaInicial, string FechaFinal)
        {
            TConsumo result = new TConsumo();
            List<TConsumo> info = new List<TConsumo>();
            TCliente Res = new TCliente();
            try
            {
                IDbCommand command;

                using (IDataReader rDataset = this.ServiceSchema.GetDataReader(this.Connection, "spListaConsumoByFecha", new string[] { "ClienteID","FechaInicial","FechaFinal" }, new object[] { ClienteID,FechaInicial,FechaFinal }, out command))
                // using (IDataReader reader = this.ServiceSchema.GetDataReader(this.Connection, "BuscaCliente", new string[] { "ClienteID" }, new object[] { ClienteID }, out command))

                {
                    while (rDataset.Read())
                    {
                        info.Add(new TConsumo()
                        {
                            ID = (string.IsNullOrEmpty(rDataset["ID"].ToString()) ? 0 : (int)(rDataset["ID"])),
                            Estacion = (string.IsNullOrEmpty(rDataset["Estacion"].ToString()) ? "" : (string)(rDataset["Estacion"])),
                            EstacionID = (string.IsNullOrEmpty(rDataset["EstacionID"].ToString()) ? 0 : (int)(rDataset["EstacionID"])),
                            Ticket = (string.IsNullOrEmpty(rDataset["Ticket"].ToString()) ? 0 : (int)(rDataset["Ticket"])),
                            Serie = (string.IsNullOrEmpty(rDataset["Serie"].ToString()) ? "" : (string)(rDataset["Serie"])),
                            FechaCarga = (string.IsNullOrEmpty(rDataset["FechaCarga"].ToString()) ? DateTime.Parse("01/01/1900") : (DateTime)(rDataset["FechaCarga"])),
                            Bomba = (string.IsNullOrEmpty(rDataset["Bomba"].ToString()) ? 0 : (int)(rDataset["Bomba"])),
                            Producto = (string.IsNullOrEmpty(rDataset["Producto"].ToString()) ? "" : (string)(rDataset["Producto"])),

                            Cantidad = Convert.ToDecimal(rDataset["Cantidad"] ?? 0.0).ToString(),
                            Precio = (string.IsNullOrEmpty(rDataset["Precio"].ToString()) ? "" : "$" + Convert.ToDecimal(rDataset["Precio"] ?? 0.0).ToString("#,##0.00")),
                            Importe = Convert.ToDecimal(rDataset["Importe"] ?? 0.0).ToString(),

                            ClienteID = (string.IsNullOrEmpty(rDataset["ClienteID"].ToString()) ? 0 : (int)(rDataset["ClienteID"])),
                            VehiculoID = (string.IsNullOrEmpty(rDataset["VehiculoID"].ToString()) ? 0 : (int)(rDataset["VehiculoID"])),
                            Tarjeta = (string.IsNullOrEmpty(rDataset["Tarjeta"].ToString()) ? "" : (string)(rDataset["Tarjeta"])),
                            Nombre = (string.IsNullOrEmpty(rDataset["Nombre"].ToString()) ? "" : (string)(rDataset["Nombre"])),
                            Identificacion = (string.IsNullOrEmpty(rDataset["Identificacion"].ToString()) ? "" : (string)(rDataset["Identificacion"])),
                            Facturado = (bool)rDataset["Facturado"],
                            Kilometraje = (string.IsNullOrEmpty(rDataset["Kilometraje"].ToString()) ? 0 : (int)(rDataset["Kilometraje"])),
                            Turno = (string.IsNullOrEmpty(rDataset["Turno"].ToString()) ? 0 : (int)(rDataset["Turno"])),
                            FechaMovimiento = (string.IsNullOrEmpty(rDataset["FechaMovimiento"].ToString()) ? DateTime.Parse("01/01/1900") : (DateTime)(rDataset["FechaMovimiento"])),
                            PathConsumoFacturaTicket = (string.IsNullOrEmpty(rDataset["PathConsumoFacturaTicket"].ToString()) ? "" : (string)(rDataset["PathConsumoFacturaTicket"])),
                            ErrorConsumoFacturaTicket = (string.IsNullOrEmpty(rDataset["ErrorConsumoFacturaTicket"].ToString()) ? "" : (string)(rDataset["ErrorConsumoFacturaTicket"])),
                            typeDevices = (string.IsNullOrEmpty(rDataset["typeDevices"].ToString()) ? "" : (string)(rDataset["typeDevices"])),
                            LatitudEstacion = (string.IsNullOrEmpty(rDataset["LatitudEstacion"].ToString()) ? 0 : (int)(rDataset["LatitudEstacion"])),
                            LongitudEstacion = (string.IsNullOrEmpty(rDataset["LongitudEstacion"].ToString()) ? 0 : (int)(rDataset["LongitudEstacion"])),
                            Folio = (string.IsNullOrEmpty(rDataset["Folio"].ToString()) ? 0 : (int)(rDataset["Folio"])),
                            FecIni = Convert.ToDateTime(FechaInicial),
                            FecFin = Convert.ToDateTime(FechaFinal),
                            Datos = null
                        });

                        result.Error = false;
                    }
                    if (result.Error)
                    {
                        // No se encontro informacion del cliente, destruimos la session.
                        result.MensajeError = "No se encontro informacion de facturas del cliente.";
                        DestroySession();
                        GetSession();
                    }

                    result.Datos = info.ToArray();
                    return result;
                }
            }
            catch (Exception ex)
            {
                result.MensajeError = "Ocurrio un error en la conexión al sistema, favor de contactar al administrador! " +
                                    "Descripción del Error: " + ex.Message.ToString().ToString();
                return result;
            }
        }
        public virtual TConsumo ListaConsumoByFechaAutoAbasto(string Grupo, string FechaInicial, string FechaFinal)
        {
            TConsumo result = new TConsumo();
            List<TConsumo> info = new List<TConsumo>();
            try
            {
                IDbCommand command;

                using (IDataReader rDataset = this.ServiceSchema.GetDataReader(this.Connection, "spListaConsumoByFechaAutoAbasto", new string[] { "Grupo", "FechaInicial", "FechaFinal" }, new object[] { Grupo, FechaInicial, FechaFinal }, out command))

                {
                    while (rDataset.Read())
                    {
                        info.Add(new TConsumo()
                        {
                            ID = (string.IsNullOrEmpty(rDataset["ID"].ToString()) ? 0 : (int)(rDataset["ID"])),
                            Estacion = (string.IsNullOrEmpty(rDataset["Estacion"].ToString()) ? "" : (string)(rDataset["Estacion"])),
                            EstacionID = (string.IsNullOrEmpty(rDataset["EstacionID"].ToString()) ? 0 : (int)(rDataset["EstacionID"])),
                            Ticket = (string.IsNullOrEmpty(rDataset["Ticket"].ToString()) ? 0 : (int)(rDataset["Ticket"])),
                            Serie = (string.IsNullOrEmpty(rDataset["Serie"].ToString()) ? "" : (string)(rDataset["Serie"])),
                            FechaCarga = (string.IsNullOrEmpty(rDataset["FechaCarga"].ToString()) ? DateTime.Parse("01/01/1900") : (DateTime)(rDataset["FechaCarga"])),
                            Bomba = (string.IsNullOrEmpty(rDataset["Bomba"].ToString()) ? 0 : (int)(rDataset["Bomba"])),
                            Producto = (string.IsNullOrEmpty(rDataset["Producto"].ToString()) ? "" : (string)(rDataset["Producto"])),

                            Cantidad = Convert.ToDecimal(rDataset["Cantidad"] ?? 0.0).ToString(),
                            Precio = (string.IsNullOrEmpty(rDataset["Precio"].ToString()) ? "" : "$" + Convert.ToDecimal(rDataset["Precio"] ?? 0.0).ToString("#,##0.00")),
                            Importe = Convert.ToDecimal(rDataset["Importe"] ?? 0.0).ToString(),

                            ClienteID = (string.IsNullOrEmpty(rDataset["ClienteID"].ToString()) ? 0 : (int)(rDataset["ClienteID"])),
                            VehiculoID = (string.IsNullOrEmpty(rDataset["VehiculoID"].ToString()) ? 0 : (int)(rDataset["VehiculoID"])),
                            Tarjeta = (string.IsNullOrEmpty(rDataset["Tarjeta"].ToString()) ? "" : (string)(rDataset["Tarjeta"])),
                            Nombre = (string.IsNullOrEmpty(rDataset["Nombre"].ToString()) ? "" : (string)(rDataset["Nombre"])),
                            Identificacion = (string.IsNullOrEmpty(rDataset["Identificacion"].ToString()) ? "" : (string)(rDataset["Identificacion"])),
                            Facturado = (bool)rDataset["Facturado"],
                            Kilometraje = (string.IsNullOrEmpty(rDataset["Kilometraje"].ToString()) ? 0 : (int)(rDataset["Kilometraje"])),
                            Turno = (string.IsNullOrEmpty(rDataset["Turno"].ToString()) ? 0 : (int)(rDataset["Turno"])),
                            FechaMovimiento = (string.IsNullOrEmpty(rDataset["FechaMovimiento"].ToString()) ? DateTime.Parse("01/01/1900") : (DateTime)(rDataset["FechaMovimiento"])),
                            PathConsumoFacturaTicket = (string.IsNullOrEmpty(rDataset["PathConsumoFacturaTicket"].ToString()) ? "" : (string)(rDataset["PathConsumoFacturaTicket"])),
                            ErrorConsumoFacturaTicket = (string.IsNullOrEmpty(rDataset["ErrorConsumoFacturaTicket"].ToString()) ? "" : (string)(rDataset["ErrorConsumoFacturaTicket"])),
                            typeDevices = (string.IsNullOrEmpty(rDataset["typeDevices"].ToString()) ? "" : (string)(rDataset["typeDevices"])),
                            LatitudEstacion = (string.IsNullOrEmpty(rDataset["LatitudEstacion"].ToString()) ? 0 : (int)(rDataset["LatitudEstacion"])),
                            LongitudEstacion = (string.IsNullOrEmpty(rDataset["LongitudEstacion"].ToString()) ? 0 : (int)(rDataset["LongitudEstacion"])),
                            Folio = (string.IsNullOrEmpty(rDataset["Folio"].ToString()) ? 0 : (int)(rDataset["Folio"])),
                            FecIni = Convert.ToDateTime(FechaInicial),
                            FecFin = Convert.ToDateTime(FechaFinal),
                            Datos = null
                        });

                        result.Error = false;
                    }
                    if (result.Error)
                    {
                        // No se encontro informacion del cliente, destruimos la session.
                        result.MensajeError = "No se encontro informacion";
                        DestroySession();
                        GetSession();
                    }
                    ServiciosLibrary.TDatosEstacion dataEstacion = RPServer.RPServicios.DatosEstacion(1269);
                    result.Datos = info.ToArray();
                    return result;
                }
            }
            catch (Exception ex)
            {
                result.MensajeError = "Ocurrio un error en la conexión al sistema, favor de contactar al administrador! " +
                                    "Descripción del Error: " + ex.Message.ToString().ToString();
                return result;
            }
        }
        public virtual TConsumo ListaConsumoByID(int ConsumoID)
        {
            TConsumo info = new TConsumo();

            try
            {
                info.Error = true;
                IDbCommand command;

                using (IDataReader rDataset = this.ServiceSchema.GetDataReader(this.Connection, "spListaConsumoByID", new string[] { "ConsumoID", "FechaInicial", "FechaFinal" }, new object[] { ConsumoID }, out command))
                    // Alimentamos la sesion con datos adicionales
                    while (rDataset.Read())
                {
                    info.ID = (string.IsNullOrEmpty(rDataset["ID"].ToString()) ? 0 : (int)(rDataset["ID"]));
                    info.EstacionID = (string.IsNullOrEmpty(rDataset["EstacionID"].ToString()) ? 0 : (int)(rDataset["EstacionID"]));
                    info.Ticket = (string.IsNullOrEmpty(rDataset["Ticket"].ToString()) ? 0 : (int)(rDataset["Ticket"]));
                    info.Serie = (string.IsNullOrEmpty(rDataset["Serie"].ToString()) ? "" : (string)(rDataset["Serie"]));
                    info.FechaCarga = (string.IsNullOrEmpty(rDataset["FechaCarga"].ToString()) ? DateTime.Parse("01/01/1900") : (DateTime)(rDataset["FechaCarga"]));
                    info.Bomba = (string.IsNullOrEmpty(rDataset["Bomba"].ToString()) ? 0 : (int)(rDataset["Bomba"]));

                    info.Cantidad = Convert.ToDecimal(rDataset["Cantidad"] ?? 0.0).ToString();
                    info.Precio = (string.IsNullOrEmpty(rDataset["Precio"].ToString()) ? "" : "$" + Convert.ToDecimal(rDataset["Precio"] ?? 0.0).ToString("#,##0.00"));
                    info.Importe = Convert.ToDecimal(rDataset["Importe"] ?? 0.0).ToString();

                    info.ClienteID = (string.IsNullOrEmpty(rDataset["ClienteID"].ToString()) ? 0 : (int)(rDataset["ClienteID"]));
                    info.VehiculoID = (string.IsNullOrEmpty(rDataset["VehiculoID"].ToString()) ? 0 : (int)(rDataset["VehiculoID"]));
                    info.Tarjeta = (string.IsNullOrEmpty(rDataset["Tarjeta"].ToString()) ? "" : (string)(rDataset["Tarjeta"]));
                    info.Facturado = (bool)rDataset["Facturado"];
                    info.Kilometraje = (string.IsNullOrEmpty(rDataset["Kilometraje"].ToString()) ? 0 : (int)(rDataset["Kilometraje"]));
                    info.Turno = (string.IsNullOrEmpty(rDataset["Turno"].ToString()) ? 0 : (int)(rDataset["Turno"]));
                    info.FechaMovimiento = (string.IsNullOrEmpty(rDataset["FechaMovimiento"].ToString()) ? DateTime.Parse("01/01/1900") : (DateTime)(rDataset["FechaMovimiento"]));
                    info.PathConsumoFacturaTicket = null;
                    info.ErrorConsumoFacturaTicket = null;
                    info.typeDevices = null;
                    info.Datos = null;

                    info.Error = false;
                }

                if (info.Error)
                {
                    // No se encontro informacion del cliente, destruimos la session.
                    info.MensajeError = "No se encontro informacion del detalle de factura del cliente.";
                    DestroySession();
                    GetSession();
                }

                //result.Datos = info.ToArray();
                return info;
            }
            catch (Exception ex)
            {
                info.MensajeError = "Ocurrio un error en la conexión al sistema, favor de contactar al administrador! " +
                                    "Descripción del Error: " + ex.Message.ToString().ToString();
                return info;
            }
        }

        public virtual TAlbum ListaConsumoFotosByID(int ConsumoID)
        {
            List<TAlbum> info = new List<TAlbum>();
            TAlbum result = new TAlbum();
            byte[] obj;
            int Cont = 0;

            try
            {

                IDbCommand command;

                using (IDataReader rDataset = this.ServiceSchema.GetDataReader(this.Connection, "spListaConsumoFotosByID", new string[] { "ConsumoID" }, new object[] { ConsumoID }, out command))

                    // Alimentamos la sesion con datos adicionales
                    while (rDataset.Read())
                {
                    if (rDataset["Foto"] != null)
                    {
                        obj = (byte[])(rDataset["Foto"]);
                    }
                    else
                    {
                        obj = null;
                    }

                    info.Add(new TAlbum()
                    {
                        ConsumoID = (string.IsNullOrEmpty(rDataset["ID"].ToString()) ? 0 : (int)(rDataset["ID"])),
                        EstacionID = (string.IsNullOrEmpty(rDataset["EstacionID"].ToString()) ? 0 : (int)(rDataset["EstacionID"])),
                        Nombre = (string.IsNullOrEmpty(rDataset["Nombre"].ToString()) ? "" : (string)(rDataset["Nombre"])),
                        FechaCarga = (string.IsNullOrEmpty(rDataset["FechaCarga"].ToString()) ? DateTime.Parse("01/01/1900") : (DateTime)(rDataset["FechaCarga"])),
                        Identificacion = (string.IsNullOrEmpty(rDataset["Identificacion"].ToString()) ? "" : (string)(rDataset["Identificacion"])),
                        Foto = obj,
                        Contador = Cont + 1,
                        Datos = null
                    });

                    Cont++;
                }

                result.Datos = info.ToArray();
                return result;
            }
            catch (Exception ex)
            {

                return result;
            }
        }
        public virtual bool cmdActualizaVehiculo(TVehiculo Datos)
        {


            try
            {
                using (IDbCommand lcommand = this.ServiceSchema.NewCommand(this.Connection, "cmdActualizaVehiculo", new string[] {
                    "ClienteID", "VehiculoID", "GasolineroID", "UsuarioID", "NIP", "Estatus", "ProductoAutorizado", "CargasMaximas", "Estacion",
                                                                                    "LimiteLTDia", "LimiteMNDia", "LimiteLTSemana", "LimiteMNSemana",
                                                                                    "LimiteLTMes", "LimiteMNMes", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo", "Mensaje"
                }
                    , new object[] { Datos.ClienteID, Datos.VehiculoID, Datos.GasolineroID, Datos.UsuarioID, Datos.Nip, Datos.Status, Datos.ProductoAutorizado, Datos.CargasMaximas, Datos.Estacion, Datos.LimiteLTDia,
                                                                                    Datos.LimiteMNDia, Datos.LimiteLTSemana, Datos.LimiteMNSemana, Datos.LimiteLTMes, Datos.LimiteMNMes, Datos.Lunes,
                                                                                    Datos.Martes, Datos.Miercoles, Datos.Jueves, Datos.Viernes, Datos.Sabado, Datos.Domingo, Datos.Mensaje
                            }))
                {
                    lcommand.ExecuteNonQuery();
                    return true;
                }

            }
            catch (Exception ex)
            {
                return false;
            }

        }
        public Boolean cmdInsertUsuarioWeb(TUsuarioWeb Datos)
        {
            try
            {

                using (IDbCommand lcommand = this.ServiceSchema.NewCommand(this.Connection, "cmdInsertUsuarioWeb", new string[] {
                    "Nombre", "Usuario","Clave","Administrador","ClienteID","GasolineroID","Mensaje"
                }
                    , new object[] { Datos.Nombre,Datos.Usuario, Datos.Clave, Datos.Administrador, Datos.ClienteID,Datos.GasolineroID,Datos.Mensaje
                            }))
                {
                    var result = lcommand.ExecuteNonQuery();
                    if (result == -1) throw new Exception("Se ha excedido el numero de usuarios registrados en Bitacora Web");
                    return true;
                }

            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public Boolean cmdActualizaUsuarioWeb(TUsuarioWeb Datos)
        {
            try
            {

                using (IDbCommand lcommand = this.ServiceSchema.NewCommand(this.Connection, "cmdActualizaUsuarioWeb", new string[] {
                    "Nombre", "Usuario","Clave","Administrador","ClienteID","Mensaje","UsuarioWebID"
                }
                    , new object[] { Datos.Nombre,Datos.Usuario, Datos.Clave, Datos.Administrador, Datos.ClienteID,Datos.Mensaje,Datos.UsuarioWebID
                            }))
                {
                    var result = lcommand.ExecuteNonQuery();
                    return true;
                }

            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public string spSendInformation(int ClienteID,string MailConsumo,string MailFactura,string MailRecibido,string mensaje)
        {
            string error = "";
            try
            {

                using (IDbCommand lcommand = this.ServiceSchema.NewCommand(this.Connection, "spSendInformation", new string[] {
                    "ClienteID", "MailConsumo","MailFactura","MailRecibo","Mensaje"
                }
                    , new object[] { ClienteID,MailConsumo, MailFactura, MailRecibido, mensaje
                            }))
                {
                    var result = lcommand.ExecuteNonQuery();
                   
                }

            }
            catch (Exception ex)
            {
                error = ex.ToString();
            }
            return error;
        }


        public virtual DConsumo dbConsumoByFecha(int GasolineroID, int ClienteID, string FechaInicial, string FechaFinal)
        {
            List<DConsumo> info = new List<DConsumo>();
            DConsumo result = new DConsumo();
            IDbCommand command;
            try
            {
                using (IDataReader rDataset = this.ServiceSchema.GetDataReader(this.Connection, "dbConsumoByFecha", new string[] { "GasolineroID", "ClienteID", "FechaInicial", "FechaFinal" }, new object[] { GasolineroID, ClienteID, FechaInicial, FechaFinal }, out command))
                    // Alimentamos la sesion con datos adicionales
                    while (rDataset.Read())
                    {
                        info.Add(new DConsumo()
                        {
                            EstacionID = (string.IsNullOrEmpty(rDataset["EstacionID"].ToString()) ? 0 : (int)(rDataset["EstacionID"])),
                            MesCarga = (string.IsNullOrEmpty(rDataset["MesCarga"].ToString()) ? 0 : (int)(rDataset["MesCarga"])),
                            Mes = (string.IsNullOrEmpty(rDataset["Mes"].ToString()) ? "" : (string)(rDataset["Mes"])),
                            ProductoID = (string.IsNullOrEmpty(rDataset["ProductoID"].ToString()) ? 0 : (int)(rDataset["ProductoID"])),
                            Producto = (string.IsNullOrEmpty(rDataset["Producto"].ToString()) ? "" : (string)(rDataset["Producto"])),
                            TotConsumo = (string.IsNullOrEmpty(rDataset["TotConsumo"].ToString()) ? 0 : (int)(rDataset["TotConsumo"])),
                            Importe = Convert.ToDecimal(rDataset["Importe"] ?? 0),
                        });
                    }

                result.Datos = info.ToArray();
                return result;
            }
            catch(Exception e)
            {
                return null;
            }
        }


    }
}
