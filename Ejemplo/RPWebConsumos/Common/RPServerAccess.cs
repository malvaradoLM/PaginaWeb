using System;
using RemObjects.SDK;
using RPSuiteServer;
using LibraryWEB;
using ServiciosLibrary;
using System.IO;
using System.Configuration;
//using LibraryAdministracion;

using System.Diagnostics;
using RemObjects.DataAbstract.Server;
using System.Windows.Forms;

namespace RPSuiteServer
{
    public sealed class RPServer
    {
        private IRPLoginService servLogin = null;
        private IRPDataService servRPSuite = null;
        private IServiceWEB servCistemWEB = null;
        private IServiciosService servServicios = null;
        private LibraryAdministracion.IServiceAdministracion servAdmin = null;

        //private IAbstractConnection cnn = null;

        //public ConnectionDefinition AddDefinition(string name, string connectionString, bool isDefault);

        //public string readonly RPSuiteServer = !String.IsNullOrEmpty(ConfigurationManager.AppSettings["RPSuiteServer"]) ?
        //                                               ConfigurationManager.AppSettings["RPSuiteServer"] : "http://127.0.0.1:9101/BIN";

        //public string readonly CistemWeb = !String.IsNullOrEmpty(ConfigurationManager.AppSettings["CistemWeb"]) ?
        //                                          ConfigurationManager.AppSettings["CistemWeb"] : "http://127.0.0.1:9005/BIN";

        //public string readonly CistemServicios = !String.IsNullOrEmpty(ConfigurationManager.AppSettings["CistemServicios"]) ?
        //                                                ConfigurationManager.AppSettings["CistemServicios"] : "http://servicios.redpacifico.com:9090/BIN";

        //public string readonly CistemAdministracion = !String.IsNullOrEmpty(ConfigurationManager.AppSettings["CistemAdministracion"]) ?
        //                                          ConfigurationManager.AppSettings["CistemAdministracion"] : "http://127.0.0.1:9003/BIN";


        private static readonly RPServer instance = new RPServer();

        // Explicit static constructor to tell C# compiler
        // not to mark type as beforefieldinit
        static RPServer()
        {

        }

        private RPServer()
        {
            try
            {
                bool bandera = false;
                int ren = 0;

                string SrvFlotillas, DatabaseFlotillas, UserFlotillas, PasswordFlotillas;

                string strRPSuiteService, strPortRPSuiteService, strCistemWebService, strPortCistemWebService,
                       strCistemServiciosService, strPortCistemServiciosService, strCistemAdminService, strPortCistemAdminService;

                string RPSuiteService, CistemWebService, CistemServiciosService, CistemAdminService,
                       PortRPSuiteService, PortCistemWebService, PortCistemServiciosService, PortCistemAdminService;

                string TargetUrl_RPSuiteService, TargetUrl_CistemWebService, TargetUrl_CistemServiciosService, TargetUrl_CistemAdminService;

                SrvFlotillas = string.Empty; DatabaseFlotillas = string.Empty; UserFlotillas = string.Empty; PasswordFlotillas = string.Empty;
                RPSuiteService = string.Empty; CistemWebService = string.Empty; CistemServiciosService = string.Empty; CistemAdminService = string.Empty;
                PortRPSuiteService = string.Empty; PortCistemWebService = string.Empty; PortCistemServiciosService = string.Empty; PortCistemAdminService = string.Empty;

                TargetUrl_RPSuiteService = string.Empty; TargetUrl_CistemWebService = string.Empty; TargetUrl_CistemServiciosService = string.Empty; TargetUrl_CistemAdminService = string.Empty;

                int counter = 0;
                string line;

                string RutaCistemIni = ConfigurationManager.AppSettings["RutaCistemIni"].ToString();
                string path = @RutaCistemIni;

                if (File.Exists(path))
                {
                    // Read the file and display it line by line.
                    System.IO.StreamReader file =
                       new System.IO.StreamReader(path);

                    while ((line = file.ReadLine()) != null)
                    {
                        //Console.WriteLine(line);
                        string strLinea = line;

                        if (strLinea == "[RPSuite]")
                        {
                            bandera = true;
                            ren++;
                        }

                        if (bandera == true)
                        {
                            //GET INFO. DE SERVICIOS WEB
                            if (ren == 13)
                            {
                                strRPSuiteService = strLinea.Substring(0, 7);

                                if (strRPSuiteService == "RPSuite")
                                {
                                    RPSuiteService = strLinea.Substring(8, strLinea.Length - 8);
                                    RPSuiteService = RPSuiteService.Trim();
                                }
                            }
                            if (ren == 14)
                            {
                                strPortRPSuiteService = strLinea.Substring(0, 11);

                                if (strPortRPSuiteService == "PortRPSuite")
                                {
                                    PortRPSuiteService = strLinea.Substring(12, strLinea.Length - 12);
                                    PortRPSuiteService = PortRPSuiteService.Trim();
                                }
                            }
                            if (ren == 15)
                            {
                                strCistemWebService = strLinea.Substring(0, 9);

                                if (strCistemWebService == "CistemWeb")
                                {
                                    CistemWebService = strLinea.Substring(10, strLinea.Length - 10);
                                    CistemWebService = CistemWebService.Trim();
                                }
                            }
                            if (ren == 16)
                            {
                                strPortCistemWebService = strLinea.Substring(0, 13);

                                if (strPortCistemWebService == "PortCistemWeb")
                                {
                                    PortCistemWebService = strLinea.Substring(14, strLinea.Length - 14);
                                    PortCistemWebService = PortCistemWebService.Trim();
                                }
                            }
                            if (ren == 17)
                            {
                                strCistemServiciosService = strLinea.Substring(0, 15);

                                if (strCistemServiciosService == "CistemServicios")
                                {
                                    CistemServiciosService = strLinea.Substring(16, strLinea.Length - 16);
                                    CistemServiciosService = CistemServiciosService.Trim();
                                }
                            }
                            if (ren == 18)
                            {
                                strPortCistemServiciosService = strLinea.Substring(0, 19);

                                if (strPortCistemServiciosService == "PortCistemServicios")
                                {
                                    PortCistemServiciosService = strLinea.Substring(20, strLinea.Length - 20);
                                    PortCistemServiciosService = PortCistemServiciosService.Trim();
                                }
                            }
                            if (ren == 19)
                            {
                                strCistemAdminService = strLinea.Substring(0, 20);

                                if (strCistemAdminService == "CistemAdministracion")
                                {
                                    CistemAdminService = strLinea.Substring(21, strLinea.Length - 21);
                                    CistemAdminService = CistemAdminService.Trim();
                                }
                            }
                            if (ren == 20)
                            {
                                strPortCistemAdminService = strLinea.Substring(0, 24);

                                if (strPortCistemAdminService == "PortCistemAdministracion")
                                {
                                    PortCistemAdminService = strLinea.Substring(25, strLinea.Length - 25);
                                    PortCistemAdminService = PortCistemAdminService.Trim();
                                }
                            }
                            ren++;
                        }
                        counter++;
                    }

                    file.Close();

                    //ARMA TARGETURL DE SERVICIOS WEB
                    TargetUrl_RPSuiteService = "http://" + RPSuiteService + ":" + PortRPSuiteService + "/BIN";
                    TargetUrl_CistemWebService = "http://" + CistemWebService + ":" + PortCistemWebService + "/BIN";
                    TargetUrl_CistemServiciosService = "http://" + CistemServiciosService + ":" + PortCistemServiciosService + "/BIN";
                    TargetUrl_CistemAdminService = "http://" + CistemAdminService + ":" + PortCistemAdminService + "/BIN";
                }
                else
                {
                    //Console.WriteLine("No existe el archivo CISTEM.INI en la ruta: ", RutaCistemIni);
                    //Suspend the screen.
                    //Console.ReadLine();

                    //MessageBox.Show("No existe el archivo CISTEM.INI en la ruta: " + RutaCistemIni,
                    //            "Error",
                    //            MessageBoxButtons.OK,
                    //            //MessageBoxIcon.Warning // for Warning  
                    //            MessageBoxIcon.Error // for Error 

                    //            //MessageBoxIcon.Information  // for Information
                    //            //MessageBoxIcon.Question // for Question
                    //            //MessageBoxIcon.Asterisk //For Info Asterisk
                    //            //MessageBoxIcon.Exclamation //For triangle Warning 
                    //            );

                }

                //Debug.WriteLine("TargetUrl_RPSuiteService-const: " + Url_RPSuiteService);

                //IpSuperHttpClientChannel channel = new IpSuperHttpClientChannel();
                IpHttpClientChannel channel = new IpHttpClientChannel();
                BinMessage message = new BinMessage();
                channel.TargetUrl = TargetUrl_RPSuiteService;
                servLogin = CoRPLoginService.Create(message, channel);
                servRPSuite = CoRPDataService.Create(message, channel);

                IpHttpClientChannel channelWEB = new IpHttpClientChannel();
                BinMessage messageWEB = new BinMessage();
                channelWEB.TargetUrl = TargetUrl_CistemWebService;
                servCistemWEB = CoServiceWEB.Create(messageWEB, channelWEB);

                IpHttpClientChannel channelServicios = new IpHttpClientChannel();
                BinMessage messageServicios = new BinMessage();
                channelServicios.TargetUrl = TargetUrl_CistemServiciosService;
                servServicios = CoServiciosService.Create(messageServicios, channelServicios);

                IpHttpClientChannel channelAdmin = new IpHttpClientChannel();
                BinMessage messageAdmin = new BinMessage();
                channelAdmin.TargetUrl = TargetUrl_CistemAdminService;
                servAdmin = LibraryAdministracion.CoServiceAdministracion.Create(messageAdmin, channelAdmin);
            }
            catch (Exception e)
            {
                //Console.WriteLine(e.ToString());
                //Console.ReadLine();

                //MessageBox.Show(e.ToString(),
                //           "Error",
                //           MessageBoxButtons.OK,
                //           //MessageBoxIcon.Warning // for Warning  
                //           MessageBoxIcon.Error // for Error 

                //           //MessageBoxIcon.Information  // for Information
                //           //MessageBoxIcon.Question // for Question
                //           //MessageBoxIcon.Asterisk //For Info Asterisk
                //           //MessageBoxIcon.Exclamation //For triangle Warning 
                //           );
            }
        }

        public static IRPLoginService loginService
        {
            get
            {
                return instance.servLogin;
            }
        }
        public static IRPDataService RPSuiteService
        {
            get
            {
                return instance.servRPSuite;
            }
        }

        public static IServiceWEB RPCistemWEB
        {
            get
            {
                return instance.servCistemWEB;
            }
        }

        public static IServiciosService RPServicios
        {
            get
            {
                return instance.servServicios;
            }
        }

        public static LibraryAdministracion.IServiceAdministracion RPAdmin
        {
            get
            {
                return instance.servAdmin;
            }
        }
    }
}
