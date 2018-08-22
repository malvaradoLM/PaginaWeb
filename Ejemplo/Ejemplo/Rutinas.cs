using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.IO;
using RPSuiteServer;
using Ejemplo.Models;

namespace Ejemplo
{
    public class Rutinas
    {

        public Ejemplo.Models.ComodinModel.BigViewModel.pathConsumoFactura GetInfoConsumoFactura(string GasolineroID, string Serie, string Folio, string ReporteNombre, string ParametrosReporte, string TipoArchivo)
        {
            Ejemplo.Models.ComodinModel.BigViewModel.pathConsumoFactura result = new Ejemplo.Models.ComodinModel.BigViewModel.pathConsumoFactura();
            string root = System.AppDomain.CurrentDomain.BaseDirectory+ "Reportes\\"+ReporteNombre+ "\\";
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
                    result.pathImpresion = "Reportes\\" + ReporteNombre+ "\\"+ System.IO.Path.GetFileName(Impresion.Ruta);
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
        //METODO QUE REGRESA EL PATH DEL REPORTE A CONSULTAR
        public Ejemplo.Models.ComodinModel.FormatReport GetInfoReportes(string ReporteNombre, string GasolineroID, string ParametrosReporte, string TipoArchivo)
        {
            ComodinModel.FormatReport result = new ComodinModel.FormatReport();
            string root = System.AppDomain.CurrentDomain.BaseDirectory + "Reportes\\"+ReporteNombre+ "\\";
            //string root = "C:\\Reportes";
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
                    result.pathFile = "Reportes\\" + ReporteNombre+ "\\"+ System.IO.Path.GetFileName(Impresion.Ruta);
                    result.errorFile = null;
                }
                else
                {
                    result.pathFile = null;
                    result.errorFile = Impresion.Error;
                }

                return result;
            }
            catch (Exception ex)
            {
                //ModelState.AddModelError(string.Empty, ex.Message.ToString());
              //  TempData["Error"] = "Ocurrio un error en la conexión al sistema, favor de contactar al administrador! " +
                //                    "Descripción del Error: " + ex.Message.ToString();

                //TempData["Warning2"] = "El servicio web se encuentra detenido, favor de contactar al administrador! ";

                result.pathFile = null;
                result.errorFile = "Ocurrio un error en la conexión al sistema, favor de contactar al administrador!";

                return result;
            }
        }


        public ComodinModel.BigViewModel.pathFile GetInfoFactura(string Serie, int Folio)
        {
            ComodinModel.BigViewModel.pathFile result = new ComodinModel.BigViewModel.pathFile();
            string root = System.AppDomain.CurrentDomain.BaseDirectory + "Reportes\\" + "Facturas"+ "\\";

            try
            {
                // If directory does not exist, don't even try 
                if (!Directory.Exists(root))
                {
                    //Directory.Delete(root);
                    System.IO.Directory.CreateDirectory(root);
                }

                if (System.IO.File.Exists(root + Serie + "-" + Folio + ".pdf"))
                {
                    result.pathPDF = "Reportes\\" + "Facturas" + "\\" + System.IO.Path.GetFileName(root + Serie + "-" + Folio + ".pdf");
                    result.pathXML = "Reportes\\" + "Facturas" + "\\" + System.IO.Path.GetFileName(root + Serie + "-" + Folio + ".xml");
                }
                else
                {
                    LibraryWEB.TWebFacturaE Aux = new LibraryWEB.TWebFacturaE();

                    Aux = RPServer.RPCistemWEB.XML(Serie, Folio, "", "", root);

                    if (Aux.RutaPDF != "")
                    {
                        //TempData["FacPDF"] = "./reportes/" + System.IO.Path.GetFileName(Aux.RutaPDF);
                        //ViewBag.FacPDF = "./reportes/" + System.IO.Path.GetFileName(Aux.RutaPDF);
                        result.pathPDF = root + System.IO.Path.GetFileName(Aux.RutaPDF);
                        result.pathPDF = "Reportes\\" + "Facturas" + "\\" + System.IO.Path.GetFileName(Aux.RutaPDF);
                    }

                    if (Aux.RutaXML != "")
                    {
                        //TempData["FacXML"] = "./reportes/" + System.IO.Path.GetFileName(Aux.RutaXML);
                        //ViewBag.FacXML = "./reportes/" + System.IO.Path.GetFileName(Aux.RutaXML);
                        result.pathXML = root + System.IO.Path.GetFileName(Aux.RutaXML);
                        result.pathXML = "Reportes\\" + "Facturas" + "\\" + System.IO.Path.GetFileName(Aux.RutaXML);
                    }

                }

                return result;
            }
            catch (Exception ex)
            {
                //ModelState.AddModelError(string.Empty, ex.Message.ToString());
                result.errorFile = "Ocurrio un error en la conexión al sistema, favor de contactar al administrador! " +
                                    "Descripción del Error: " + ex.Message.ToString();

                result.pathPDF = null;
                result.pathXML = null;

                return result;
            }
        }


    }
}