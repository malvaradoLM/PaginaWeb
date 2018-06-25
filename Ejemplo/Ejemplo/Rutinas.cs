using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.IO;
using RPSuiteServer;

namespace Ejemplo
{
    public class Rutinas
    {

        public Ejemplo.Models.ComodinModel.BigViewModel.pathConsumoFactura GetInfoConsumoFactura(string GasolineroID, string Serie, string Folio, string ReporteNombre, string ParametrosReporte, string TipoArchivo)
        {
            Ejemplo.Models.ComodinModel.BigViewModel.pathConsumoFactura result = new Ejemplo.Models.ComodinModel.BigViewModel.pathConsumoFactura();
            string root = ConfigurationManager.AppSettings["RutaReportes"].ToString();
            try
            {
                // If directory does not exist, don't even try 
                if (!Directory.Exists(root))
                {
                    //Directory.Delete(root);
                    System.IO.Directory.CreateDirectory(root);
                }

                LibraryWEB.Impresion Impresion = new LibraryWEB.Impresion();

                Impresion = RPServer.RPCistemWEB.Imprimir(ReporteNombre, int.Parse(GasolineroID), ParametrosReporte, root, TipoArchivo);

                if (Impresion.Ruta != "")
                {
                    result.pathImpresion = root + System.IO.Path.GetFileName(Impresion.Ruta);
                    result.ImpresionError = null;
                }
                else
                {
                    result.pathImpresion = null;
                    result.ImpresionError = Impresion.Error;
                }

                return result;
            }
            catch (Exception ex)
            {
                //ModelState.AddModelError(string.Empty, ex.Message.ToString());
              //  TempData["Error"] = "Ocurrio un error en la conexión al sistema, favor de contactar al administrador! " +
                //                    "Descripción del Error: " + ex.Message.ToString();

                //TempData["Warning2"] = "El servicio web se encuentra detenido, favor de contactar al administrador! ";

                result.pathImpresion = null;
                result.ImpresionError = null;

                return result;
            }
        }
    }
}