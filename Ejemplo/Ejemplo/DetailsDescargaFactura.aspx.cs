using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using RPSuiteServer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class DetailsDescargaFactura : System.Web.UI.Page
    {
        private List<RemObjects.DataAbstract.Server.DataParameter> Params = new List<RemObjects.DataAbstract.Server.DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string serie, folio;
            serie = Session["Serie"].ToString();
            folio = Session["Folio"].ToString();
            if (serie != "" && folio != "") cargarConsumos(serie, folio);
            if (!IsPostBack)
            {
                detallesConsumo.Visible = false;
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
            LinkButton item = (LinkButton)sender;
            string ID = item.Text;
            string EstacionID = bgvConsumo.GetRowValues(int.Parse(bgvConsumo.FocusedRowIndex.ToString()), "EstacionID").ToString();
            string Serie = bgvConsumo.GetRowValues(int.Parse(bgvConsumo.FocusedRowIndex.ToString()), "Serie").ToString();
            string Folio = bgvConsumo.GetRowValues(int.Parse(bgvConsumo.FocusedRowIndex.ToString()), "Folio").ToString();

            consumoReporte(Convert.ToInt32(ID), Serie, Folio);
            obtenerGeolocalizacion(Convert.ToInt32(EstacionID));
        }
        private void CargarMapa(string latitud, string longitud)
        {
            detallesConsumo.Visible = true;
           // pageConsumos.ActiveTabIndex = 0;
           pageDetalles.ActiveTabIndex = 2;
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
                fn.Append("map.setView({ ");
                fn.Append("zoom: 12, center: new Microsoft.Maps.Location(" + latitud + ", " + longitud + ")");
                fn.Append("}); ");
                ///Cambiar Tab
                //fn.Append(" document.getElementById('"+carTabPage.ClientID+"').attr(\"ActiveTabIndex\",\"0\"); ");
                ///
                fn.Append("};");
                ClientScript.RegisterStartupScript(this.GetType(),
        ScriptKey, fn.ToString(), true);
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
        private void cargarPdf(int value)
        {
           // TFacturaCliente data = RPServer.RPSuiteService.FacturaCliente(value);

        }
    }
}