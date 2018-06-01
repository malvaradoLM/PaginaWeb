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
                        Res.ClienteID = (int)reader["ClienteID"];

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
                    }
                }
            }
            catch (Exception ex)
            {
                Res.ClienteID = -1;
            }
            return Res;
           
           
        }

        public Boolean UpdateVehiculo(TVehiculo Datos)
        {
 

            return true;
        }


    }
}
