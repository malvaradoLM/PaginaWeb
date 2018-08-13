using DevExpress.Web;
using DevExpress.Web.ASPxRichEdit.Internal;
using DevExpress.Web.Office;
using DevExpress.XtraRichEdit;
using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using Ejemplo.Models;
using RPSuiteServer;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml;

namespace Ejemplo
{
    public partial class DetailsDescargaFactura : System.Web.UI.Page
    {
        private List<RemObjects.DataAbstract.Server.DataParameter> Params = new List<RemObjects.DataAbstract.Server.DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;
            string serie, folio;
            serie = Session["Serie"].ToString();
            folio = Session["Folio"].ToString();
            ticketName.Value = serie + folio;
            if (serie != "" && folio != "") cargarConsumos(serie, folio);
            if (!IsPostBack)
            {
                detallesConsumo.Visible = false;
                panelDetallesConsumo.Visible = false;
                cargarPdfFactura(serie, folio);
            }
            else
            {
                if (Session["Longitud"] != null && Session["Longitud"].ToString() != "") CargarMapa(Session["Latitud"].ToString(), Session["Longitud"].ToString());
            }
        }
        private void cargarConsumos(string serie, string folio)
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "Serie", serie);
            Data.DataModule.ParamByName(Params, "Folio", folio);
            spConsumoDS ds = new spConsumoDS();
            DataModule.FillDataSet(ds, "spListaConsumoByFolio", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spListaConsumoByFolio"];
            bgvConsumo.DataSource = dt;
            bgvConsumo.DataBind();
        }

        protected void button1_Click(object sender, EventArgs e)
        {
            string ID="", EstacionID="", Serie="", Folio="";
            string tipo = sender.GetType().ToString();
            if (bgvConsumo.DetailRows.VisibleCount > 0 || !(sender is ASPxPageControl))
            {
                if (sender is ASPxPageControl)
                {
                    ASPxPageControl nuevo = (ASPxPageControl)sender;
                    GridViewDetailRowTemplateContainer row = (GridViewDetailRowTemplateContainer)nuevo.Parent;
                    ID = bgvConsumo.GetRowValues(row.ItemIndex, "ID").ToString();
                    EstacionID = bgvConsumo.GetRowValues(row.ItemIndex, "EstacionID").ToString();
                    Serie = bgvConsumo.GetRowValues(row.ItemIndex, "Serie").ToString();
                    Folio = bgvConsumo.GetRowValues(row.ItemIndex, "Folio").ToString();
                }
                else
                {
                    ID = bgvConsumo.GetRowValues(int.Parse(bgvConsumo.FocusedRowIndex.ToString()), "ID").ToString();
                    EstacionID = bgvConsumo.GetRowValues(int.Parse(bgvConsumo.FocusedRowIndex.ToString()), "EstacionID").ToString();
                    Serie = bgvConsumo.GetRowValues(int.Parse(bgvConsumo.FocusedRowIndex.ToString()), "Serie").ToString();
                    Folio = bgvConsumo.GetRowValues(int.Parse(bgvConsumo.FocusedRowIndex.ToString()), "Folio").ToString();
                }
                consumoReporte(Convert.ToInt32(ID), Serie, Folio);
                obtenerGeolocalizacion(Convert.ToInt32(EstacionID));
                bgvConsumo.DetailRows.ExpandRow(bgvConsumo.FocusedRowIndex);
            }

        }
        private void CargarMapa(string latitud, string longitud)
        {
            
            carTabPage.ActiveTabIndex = 0;
            //panelDetallesConsumo.Visible = true;
            panelDetallesConsumo.Collapsed = false;
            mapagoogle.Src = @"https://maps.google.com.mx/maps?key=AIzaSyDN_xSn-jF76JH6J_qmU50SpqF_6kNIePU&q=" + latitud + "," + longitud + "&language=es&hl=es;z=14&amp;output=embed";
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
        private void consumoReporte(int _ConsumoID, string Serie, String Folio)
        {

            string _ClienteID = DataModule.Seguridad.UserID;
            string _GasolineroID = @Session["GasolineroID"].ToString();

            string c2 = @"""";
            string TipoMov = @"@TipoMov = """;

            string ParametrosReporte = TipoMov + _ConsumoID + c2;
            string ReporteNombre = "TICKET WEB";
            string TipoArchivo = "PDF";
            Rutinas InfoConsumoFacturaTicket = new Rutinas();
            string path = System.AppDomain.CurrentDomain.BaseDirectory;

            Ejemplo.Models.ComodinModel.BigViewModel.pathConsumoFactura resultado2 = InfoConsumoFacturaTicket.GetInfoConsumoFactura(_GasolineroID, Serie, Folio, ReporteNombre, ParametrosReporte, TipoArchivo);
            ticket.Src = resultado2.pathImpresion + "#zoom=70";
            hiddenURL.Value = resultado2.pathImpresion;
            RPSuiteServer.TAlbum album = new TAlbum();
            album = DataModule.DataService.ListaConsumoFotosByID(_ConsumoID);
            cargarGaleria(album);
        }
        private void obtenerGeolocalizacion(int EstacionID)
        {
            ServiciosLibrary.TDatosEstacion dataEstacion = RPServer.RPServicios.DatosEstacion(EstacionID);
            CargarMapa(dataEstacion.Latitud.ToString(), dataEstacion.Longitud.ToString());
            Session["Latitud"] = dataEstacion.Latitud.ToString();
            Session["Longitud"] = dataEstacion.Longitud.ToString();
        }
        private void cargarPdfFactura(string _Serie, string _Folio)
        {
            //GENERA FACTURA EN PDF y XML
            Rutinas InfoFactura = new Rutinas();
            ComodinModel.BigViewModel.pathFile resultado = InfoFactura.GetInfoFactura(_Serie, int.Parse(_Folio));

            if (resultado.pathPDF == null && resultado.pathXML == null)
            {
                if (resultado.errorFile != "")
                {
                    labelAlerta.Text = resultado.errorFile;
                }
            }
            else
            {
                HiddenUrlPDF.Value = resultado.pathPDF;
                HiddenUrlXML.Value = resultado.pathXML;
                if (resultado.pathPDF != null) iframePDF.Src = resultado.pathPDF + "#page=1&zoom=50";
                if (resultado.pathXML != null) {

                    StringWriter writer = new StringWriter();
                    HttpContext.Current.Server.Execute(resultado.pathXML, writer);
                    string html = writer.ToString();
                    //richEdit.Open(System.AppDomain.CurrentDomain.BaseDirectory + resultado.pathXML);
                    //  ASPxMemo.Text = Server.HtmlEncode(File.ReadAllText(Server.MapPath(resultado.pathXML)));
                    //   xmlDiv.InnerHtml = File.ReadAllText(Server.MapPath(resultado.pathXML));
                    //  lblXml.Text = File.ReadAllText(Server.MapPath(resultado.pathXML));
                    XmlDocument doc = new XmlDocument();
                    doc.LoadXml(html);
                    string xmlfinal = "";
                    foreach(char c in doc.InnerXml)
                    {
                        xmlfinal += c;
                        if (c == '>') xmlfinal += "\n ";
                    }
                    xmlClass.InnerText = xmlfinal;
                }
                else
                {
                    if (resultado.errorFile != "")
                    {
                        labelAlerta.Text = resultado.errorFile;
                    }
                }
            }

            /// data.PathPDF = resultado.pathPDF;
            /// data.PathXML = resultado.pathXML;
          

        }

        protected void btnConsumosPDF_Click(object sender, EventArgs e)
        {
            llamarConsumoDocumento("PDF");
        }
        private void llamarConsumoDocumento(string formato)
        {
            string serie, folio;
            serie = Session["Serie"].ToString();
            folio = Session["Folio"].ToString();
            string _GasolineroID = @Session["GasolineroID"].ToString();
            string c2 = @"""";
            string paramSerie = @"@Serie = """;
            string paramFacturaINI = @""", @FacturaINI = """;
            string paramFacturaFIN = @""", @FacturaFIN = """;

            string ParametrosReporte = paramSerie + serie + paramFacturaINI + folio + paramFacturaFIN + folio + c2;
            string ReporteNombre = "CONSUMOS X FACTURA";
            string TipoArchivo = formato;
            Rutinas InfoConsumoFactura = new Rutinas();
            ComodinModel.BigViewModel.pathConsumoFactura resultado2 = InfoConsumoFactura.GetInfoConsumoFactura(_GasolineroID, serie, folio, ReporteNombre, ParametrosReporte, TipoArchivo);
            if (resultado2.pathImpresion != "")
            {
                Session["path"] = resultado2.pathImpresion;
                Session["formato"] = formato;
                Response.Redirect("Documentos.aspx", false);
            }
        }

        protected void btnConsumosExcel_Click(object sender, EventArgs e)
        {
            llamarConsumoDocumento("XLS");
        }

        protected void ticket_Load(object sender, EventArgs e)
        {
            HtmlIframe nuevo = (HtmlIframe)sender;
            nuevo.Src = ticket.Src;
        }

        protected void imageSlider_Load(object sender, EventArgs e)
        {
            ASPxImageSlider nuevo = (ASPxImageSlider)sender;
            nuevo.Items.AddRange(imageSlider.Items);
        }

        protected void mapagoogle_Load(object sender, EventArgs e)
        {
            HtmlIframe nuevo = (HtmlIframe)sender;
            nuevo.Src = mapagoogle.Src;
        }
    }
}