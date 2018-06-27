using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using RemObjects.DataAbstract.Server;
using RPSuiteServer;
using System;
using System.Collections.Generic;
using System.Data;
using ServiciosLibrary;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using DevExpress.Web;
using Ejemplo.Models;
using System.Web.UI;
using System.Drawing;
using System.Text;

namespace Ejemplo
{
    public partial class DetailsAnalisisConsumo : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFechaInicial.Date = DateTime.Now;
                txtFechaFinal.Date = DateTime.Now;
                chkBoxList.SelectedIndex = 0;
                bgvConsumo2.Visible = false;
               // detallesConsumo.Visible = false;
                detallesConsumo.Attributes.CssStyle.Add("display", "none");
            }
            else
            {
                bgvConsumo2.Visible = true;
                string titulo = "";
                DataTable dt = new DataTable();
                if (Convert.ToInt32(chkBoxList.Value) == 1)
                {
                    dt = CargarReportePorCliente(Convert.ToInt32(DataModule.Seguridad.UserID), txtFechaInicial.Text, txtFechaFinal.Text);
                    titulo = "CONSUMO POR CLIENTE";
                }
                else {
                    titulo = "CONSUMO POR GRUPO";
                    if (Session["Grupo"] != null && Session["Grupo"].ToString() != string.Empty) {
                        dt = CargarReportePorGrupo(Session["Grupo"].ToString(), txtFechaInicial.Text, txtFechaFinal.Text);
                    } else ///SI EL CLIENTE NO TIENE GRUPO, SOLO SE CARGARAN LOS REGISTRO DEL CLIENTE
                           ///TempData["Alert"] = "El Usuario que se firmo no tiene asignado ningun grupo. Se mostraran solo los consumos asignados al usuario.";
                        dt = CargarReportePorCliente(Convert.ToInt32(DataModule.Seguridad.UserID), txtFechaInicial.Text, txtFechaFinal.Text);

                }
                cargarReporte(titulo, dt);
            }
        }


        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {

        }
        private DataTable CargarReportePorCliente(int ClienteID, string FechaIni, string FechaFin)
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "ClienteID", ClienteID);
            Data.DataModule.ParamByName(Params, "FechaInicial", FechaIni);
            Data.DataModule.ParamByName(Params, "FechaFinal", FechaFin);

            spConsumoDS ds = new spConsumoDS();
            DataModule.FillDataSet(ds, "spListaConsumoByFecha", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spListaConsumoByFecha"];
            return dt;
        }

        private DataTable CargarReportePorGrupo(string Grupo, string FechaIni, string FechaFin)
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "Grupo", Grupo);
            Data.DataModule.ParamByName(Params, "FechaInicial", FechaIni);
            Data.DataModule.ParamByName(Params, "FechaFinal", FechaFin);

            spConsumoDS ds = new spConsumoDS();
            DataModule.FillDataSet(ds, "spListaConsumoByFechaAutoAbasto", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spListaConsumoByFechaAutoAbasto"];
            return dt;
        }
        private void cargarReporte(string titulo, DataTable dt)
        {
            bgvConsumo2.DataSource = dt;
            bgvConsumo2.DataBind();
            bgvConsumo2.SettingsText.Title = titulo;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reportes.aspx", false);
        }
        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            imageSlider.Items.Clear();
            //detallesConsumo.Visible = false;
            detallesConsumo.Attributes.CssStyle.Add("display", "none");
        }
        private void obtenerGeolocalizacion(int EstacionID)
        {

            ServiciosLibrary.TDatosEstacion dataEstacion = RPServer.RPServicios.DatosEstacion(EstacionID);
            CargarMapa(dataEstacion.Latitud.ToString(), dataEstacion.Longitud.ToString());
        }
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            //detallesConsumo.Visible = true;
            detallesConsumo.Attributes.CssStyle.Add("display", "inline");
            LinkButton item = (LinkButton)sender;
            string ID = item.Text;
            string EstacionID = bgvConsumo2.GetRowValues(int.Parse(bgvConsumo2.FocusedRowIndex.ToString()), "EstacionID").ToString();
            string Serie = bgvConsumo2.GetRowValues(int.Parse(bgvConsumo2.FocusedRowIndex.ToString()), "Serie").ToString();
            string Folio = bgvConsumo2.GetRowValues(int.Parse(bgvConsumo2.FocusedRowIndex.ToString()), "Folio").ToString();

            consumoReporte(Convert.ToInt32(ID), Serie, Folio);
            obtenerGeolocalizacion(Convert.ToInt32(EstacionID));
        }
        private void consumoReporte(int _ConsumoID, string Serie, String Folio)
        {

            string _ClienteID = DataModule.Seguridad.UserID;
            string _GasolineroID = @Session["GasolineroID"].ToString();

            string c2 = @"""";
            string TipoMov = @"@TipoMov = """;

            string ParametrosReporte = TipoMov + _ConsumoID + c2;
            string ReporteNombre = "TICKET WEB";
            string TipoArchivo = "PDF";
            //Rutinas InfoConsumoFacturaTicket = new Rutinas();

            //Ejemplo.Models.ComodinModel.BigViewModel.pathConsumoFactura resultado2 = InfoConsumoFacturaTicket.GetInfoConsumoFactura(_GasolineroID, Serie, Folio, ReporteNombre, ParametrosReporte, TipoArchivo);

            RPSuiteServer.TAlbum album = new TAlbum();
            album = DataModule.DataService.ListaConsumoFotosByID(_ConsumoID);
            cargarGaleria(album);

            if (_ConsumoID != null)
            {
                //Buscar detalle del consumo de la factura
                //   TConsumo data3 = RPServer.RPSuiteService.ListaConsumoByID(_ConsumoID);
                /*
                ViewBag.ConsumoFactID = _ConsumoID;

                string _ClienteID = Encryption.decrypt(ClienteID);
                string _GasolineroID = @Session["GasolineroID"].ToString();

                string _Serie = Encryption.decrypt(Serie);
                string _Folio = Encryption.decrypt(Folio);

                string c2 = @"""";
                string TipoMov = @"@TipoMov = """;

                string ParametrosReporte = TipoMov + _ConsumoID + c2;
                string ReporteNombre = "TICKET WEB";
                string TipoArchivo = "PDF";

                if (data3.Error == false)
                {
                    if (data3 == null)
                    {
                        return HttpNotFound();
                    }
                    else
                    {
                        if (data3.EstacionID.ToString() != "")
                        {
                            // OBTENER LATITUD, LONGITUD DE ESTACION
                            ServiciosLibrary.TDatosEstacion dataEstacion = RPServer.RPServicios.DatosEstacion(data3.EstacionID);

                            double Latitud = dataEstacion.Latitud;
                            double Longitud = dataEstacion.Longitud;

                            data3.LatitudEstacion = Latitud;
                            data3.LongitudEstacion = Longitud;

                            TempData["Longitud"] = Longitud.ToString();
                            TempData["Latitud"] = Latitud.ToString();
                        }
                        else
                        {
                            data3.LatitudEstacion = 0;
                            data3.LongitudEstacion = 0;

                            TempData["Longitud"] = "";
                            TempData["Latitud"] = "";
                        }

                        TempData["TipoArchivo"] = "PDF";

                        //GENERA CONSUMO DE LA FACTURA EN TICKET (PDF)
                        WebRedPacifico.Models.BigViewModel.pathConsumoFactura resultado2 = InfoConsumoFacturaTicket.GetInfoConsumoFactura(_GasolineroID, _Serie, _Folio, ReporteNombre, ParametrosReporte, TipoArchivo);

                        if (resultado2.pathImpresion == null && resultado2.ImpresionError == null)
                        {
                            TempData["Warning2"] = "El servicio web se encuentra detenido, favor de contactar al administrador! ";
                        }

                        if (resultado2.pathImpresion != null)
                        {
                            data3.PathConsumoFacturaTicket = resultado2.pathImpresion;
                            data3.ErrorConsumoFacturaTicket = null;

                            TempData["resultPathReporte"] = resultado2.pathImpresion;

                            // EL REPORTE SE DESCARGA EN FORMATO PDF = SOLO  MOBILE DEVICES
                            if (data3.typeDevices == "mobile")
                            {
                                string fileName = fileName = "Ticket_" + _ClienteID + "_" + _Serie + "_" + _Folio;

                                FileStream fs = new FileStream(resultado2.pathImpresion, FileMode.Open, FileAccess.Read);
                                //return new FileStreamResult(fs, "application/pdf");

                                return File(fs, "application/pdf", fileName + ".pdf");
                            }
                        }
                        else
                        {
                            data3.PathConsumoFacturaTicket = null;
                            data3.ErrorConsumoFacturaTicket = resultado2.ImpresionError;

                            if (resultado2.ImpresionError != "")
                            {
                                TempData["Error"] = resultado2.ImpresionError;
                            }
                            else
                            {
                                ViewData["Warning"] = "No existen datos para mostrar en el ticket.";
                            }
                        }

                        //OBTENER FOTOGRAFIAS DEL CONSUMO DE LA FACTURA
                        TAlbum data4 = RPServer.RPSuiteService.ListaConsumoFotosByID(Int32.Parse(_ConsumoID));

                        if (data4.Error == false)
                        {
                            if (data4 == null)
                            {
                                return HttpNotFound();
                            }
                            else
                            {
                                viewModel.DetailsConsumoFotografias = data4.Datos;
                            }
                        }
                        else
                        {
                            //NO EXISTEN DATOS PARA MOSTRAR LA FOTOGRAFIA O TRAE UN ERROR.
                            TempData["Warning"] = data4.MensajeError;
                        }

                        viewModel.DetailsConsumo = data3;
                    }
                }
                else
                {
                    TempData["TipoArchivo"] = "";
                    TempData["Error"] = data3.MensajeError;

                    TempData["Longitud"] = "";
                    TempData["Latitud"] = "";
                }
                */
            }

        }

        private void cargarGaleria(TAlbum album)
        {
            imageSlider.Items.Clear();
            foreach (TAlbum item in album.Datos)
            {
                imageSlider.Items.Add(
        "data:image/png;base64," + Convert.ToBase64String((Byte[])item.Foto),
        "data:image/png;base64," + Convert.ToBase64String((Byte[])item.Foto),
        "", "Estacion: " + item.Nombre + " Identificacion: " + item.Identificacion + " Fecha de Carga: " + item.FechaCarga
    );
            }
        }

        private void CargarMapa(string latitud, string longitud)
        {
             carTabPage.ActiveTabIndex = 2;
            const string ScriptKey = "ScriptKey";
            if (!ClientScript.IsStartupScriptRegistered(this.GetType(), ScriptKey))
            {
              //  carTabPage.ActiveTabIndex = 2;
                StringBuilder fn = new StringBuilder();
                fn.Append("var map = null; ");
                fn.Append("function LoadMap() { ");
                fn.Append("map = new Microsoft.Maps.Map('#myMap', { ");
                fn.Append("credentials: \"Amj5vm4UWJ5FGig8NYp7xQLVV5RJEXMz0KGIl5BFnCVT2B1GHKsjnQ1MYZFy5_pw\" ");
                fn.Append("}); ");
                ////Pushpins
                fn.Append("var pins = [];");
                fn.Append("var pushpin = new Microsoft.Maps.Pushpin(new Microsoft.Maps.Location(" + latitud + "," + longitud + ")); ");
                fn.Append("pins.push(pushpin); ");
                fn.Append("map.entities.push(pins); ");
                ///Events
                fn.Append("Microsoft.Maps.Events.addHandler(map, 'viewchange', function (e) { ");
                fn.Append("document.getElementById('ContentPlaceHolder1_carTabPage').activePage = 0");
                fn.Append("}); ");
                ///
                fn.Append("map.setView({ ");
                fn.Append("zoom: 12, center: new Microsoft.Maps.Location(" + latitud + ", " + longitud + ")");
                fn.Append("});");
                fn.Append("};");
                ClientScript.RegisterStartupScript(this.GetType(),
        ScriptKey, fn.ToString(), true);
            }
            
        }

    }
}