//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RPSuiteServer {
    using System;
    using System.Collections.Generic;
    using RemObjects.SDK;
    using RemObjects.SDK.Types;
    using RemObjects.SDK.Server;
    using RemObjects.SDK.Server.ClassFactories;
    using RemObjects.DataAbstract.Server;
    
    [System.Reflection.ObfuscationAttribute(Exclude=true)]
    public class RPLoginService_Invoker : RemObjects.DataAbstract.Server.SimpleLoginService_Invoker {
        public RPLoginService_Invoker() : 
                base() {
        }
    }
    [System.Reflection.ObfuscationAttribute(Exclude=true, ApplyToMembers=false)]
    public class RPLoginService_Activator : object, RemObjects.SDK.Server.IServiceActivator {
        public RPLoginService_Activator() {
        }
        public RemObjects.SDK.IROService CreateInstance() {
            return new RPLoginService();
        }
    }
    [System.Reflection.ObfuscationAttribute(Exclude=true)]
    public class RPDataService_Invoker : RemObjects.DataAbstract.Server.DataAbstractService_Invoker {
        public RPDataService_Invoker() : 
                base() {
        }
        public static void Invoke_GuardaFactura(RemObjects.SDK.IROService @__Instance, RemObjects.SDK.IMessage @__Message, RemObjects.SDK.Server.IServerChannelInfo @__ServerChannelInfo, out RemObjects.SDK.Server.ResponseOptions @__oResponseOptions) {
            RemObjects.SDK.ObjectDisposer @__ObjectDisposer = new RemObjects.SDK.ObjectDisposer(1);
            try {
                TFactura Datos = ((TFactura)(@__Message.Read("Datos", typeof(TFactura), RemObjects.SDK.StreamingFormat.Default)));
                @__ObjectDisposer.Add(Datos);
                bool Result;
                Result = ((IRPDataService)(@__Instance)).GuardaFactura(Datos);
                @__Message.InitializeResponseMessage(@__ServerChannelInfo, "RPSuiteServer", "RPDataService", "GuardaFacturaResponse");
                @__Message.WriteBoolean("Result", Result);
                @__Message.FinalizeMessage();
                @__oResponseOptions = RemObjects.SDK.Server.ResponseOptions.roDefault;
            }
            finally {
                @__ObjectDisposer.Dispose();
            }
        }
        public static void Invoke_Fecha(RemObjects.SDK.IROService @__Instance, RemObjects.SDK.IMessage @__Message, RemObjects.SDK.Server.IServerChannelInfo @__ServerChannelInfo, out RemObjects.SDK.Server.ResponseOptions @__oResponseOptions) {
            System.DateTime Result;
            Result = ((IRPDataService)(@__Instance)).Fecha();
            @__Message.InitializeResponseMessage(@__ServerChannelInfo, "RPSuiteServer", "RPDataService", "FechaResponse");
            @__Message.WriteDateTime("Result", Result);
            @__Message.FinalizeMessage();
            @__oResponseOptions = RemObjects.SDK.Server.ResponseOptions.roDefault;
        }
        public static void Invoke_SPGetFolio(RemObjects.SDK.IROService @__Instance, RemObjects.SDK.IMessage @__Message, RemObjects.SDK.Server.IServerChannelInfo @__ServerChannelInfo, out RemObjects.SDK.Server.ResponseOptions @__oResponseOptions) {
            string Datos = @__Message.ReadAnsiString("Datos");
            int Result;
            Result = ((IRPDataService)(@__Instance)).SPGetFolio(Datos);
            @__Message.InitializeResponseMessage(@__ServerChannelInfo, "RPSuiteServer", "RPDataService", "SPGetFolioResponse");
            @__Message.WriteInt32("Result", Result);
            @__Message.FinalizeMessage();
            @__oResponseOptions = RemObjects.SDK.Server.ResponseOptions.roDefault;
        }
        public static void Invoke_Folio(RemObjects.SDK.IROService @__Instance, RemObjects.SDK.IMessage @__Message, RemObjects.SDK.Server.IServerChannelInfo @__ServerChannelInfo, out RemObjects.SDK.Server.ResponseOptions @__oResponseOptions) {
            string Campo = @__Message.ReadAnsiString("Campo");
            string Serie = @__Message.ReadAnsiString("Serie");
            int Result;
            Result = ((IRPDataService)(@__Instance)).Folio(Campo, Serie);
            @__Message.InitializeResponseMessage(@__ServerChannelInfo, "RPSuiteServer", "RPDataService", "FolioResponse");
            @__Message.WriteInt32("Result", Result);
            @__Message.FinalizeMessage();
            @__oResponseOptions = RemObjects.SDK.Server.ResponseOptions.roDefault;
        }
        public static void Invoke_getGasolinero(RemObjects.SDK.IROService @__Instance, RemObjects.SDK.IMessage @__Message, RemObjects.SDK.Server.IServerChannelInfo @__ServerChannelInfo, out RemObjects.SDK.Server.ResponseOptions @__oResponseOptions) {
            string Result;
            Result = ((IRPDataService)(@__Instance)).getGasolinero();
            @__Message.InitializeResponseMessage(@__ServerChannelInfo, "RPSuiteServer", "RPDataService", "getGasolineroResponse");
            @__Message.WriteAnsiString("Result", Result);
            @__Message.FinalizeMessage();
            @__oResponseOptions = RemObjects.SDK.Server.ResponseOptions.roDefault;
        }
        public static void Invoke_getCliente(RemObjects.SDK.IROService @__Instance, RemObjects.SDK.IMessage @__Message, RemObjects.SDK.Server.IServerChannelInfo @__ServerChannelInfo, out RemObjects.SDK.Server.ResponseOptions @__oResponseOptions) {
            RemObjects.SDK.ObjectDisposer @__ObjectDisposer = new RemObjects.SDK.ObjectDisposer(1);
            try {
                int ClienteID = @__Message.ReadInt32("ClienteID");
                TCliente Result;
                Result = ((IRPDataService)(@__Instance)).getCliente(ClienteID);
                @__ObjectDisposer.Add(Result);
                @__Message.InitializeResponseMessage(@__ServerChannelInfo, "RPSuiteServer", "RPDataService", "getClienteResponse");
                @__Message.Write("Result", Result, typeof(TCliente), RemObjects.SDK.StreamingFormat.Default);
                @__Message.FinalizeMessage();
                @__oResponseOptions = RemObjects.SDK.Server.ResponseOptions.roDefault;
            }
            finally {
                @__ObjectDisposer.Dispose();
            }
        }
        public static void Invoke_UpdateVehiculo(RemObjects.SDK.IROService @__Instance, RemObjects.SDK.IMessage @__Message, RemObjects.SDK.Server.IServerChannelInfo @__ServerChannelInfo, out RemObjects.SDK.Server.ResponseOptions @__oResponseOptions) {
            RemObjects.SDK.ObjectDisposer @__ObjectDisposer = new RemObjects.SDK.ObjectDisposer(1);
            try {
                TVehiculo Datos = ((TVehiculo)(@__Message.Read("Datos", typeof(TVehiculo), RemObjects.SDK.StreamingFormat.Default)));
                @__ObjectDisposer.Add(Datos);
                bool Result;
                Result = ((IRPDataService)(@__Instance)).UpdateVehiculo(Datos);
                @__Message.InitializeResponseMessage(@__ServerChannelInfo, "RPSuiteServer", "RPDataService", "UpdateVehiculoResponse");
                @__Message.WriteBoolean("Result", Result);
                @__Message.FinalizeMessage();
                @__oResponseOptions = RemObjects.SDK.Server.ResponseOptions.roDefault;
            }
            finally {
                @__ObjectDisposer.Dispose();
            }
        }
    }
    [System.Reflection.ObfuscationAttribute(Exclude=true, ApplyToMembers=false)]
    public class RPDataService_Activator : object, RemObjects.SDK.Server.IServiceActivator {
        public RPDataService_Activator() {
        }
        public RemObjects.SDK.IROService CreateInstance() {
            return new RPDataService();
        }
    }
}
