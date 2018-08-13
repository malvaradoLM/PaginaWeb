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
using System.IO;
using System.Reflection;
using System.Web.UI.HtmlControls;
using DevExpress.Web.Bootstrap;

namespace Ejemplo
{
    public partial class DetailsAnalisisConsumo : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;
            if (!IsPostBack)
            {
                txtFechaInicial.Date = DateTime.Now;
                txtFechaFinal.Date = DateTime.Now;
                chkBoxList.SelectedIndex = 0;
                bgvConsumo2.Visible = false;
                msjAlerta.Visible = false;
                detallesConsumo.Attributes.CssStyle.Add("display", "none");
                panelParametros.Collapsed = false;
                panelConsumos.Collapsed = true;
                panelDetallesConsumo.Collapsed = true;
                panelConsumos.Visible = false;
                panelDetallesConsumo.Visible = false;
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
                if (dt.Rows.Count == 0)
                {
                    msjAlerta.Visible = true;
                    labelAlerta.Text = "No existen registros que mostrar";
                }
                else msjAlerta.Visible = false;
                if(HiddenFocusIndex.Value != null && HiddenFocusIndex.Value != "")
                {
                    bgvConsumo2.FocusedRowIndex = Convert.ToInt32(HiddenFocusIndex.Value);
                }
            }
            if (detallesConsumo.Visible) carTabPage.Focus();
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
            panelConsumos.Visible = true;
            bgvConsumo2.DataSource = dt;
            bgvConsumo2.DataBind();
            bgvConsumo2.SettingsText.Title = titulo;
            panelParametros.Collapsed = true;
            panelConsumos.Collapsed = false;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reportes.aspx", false);
        }
        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            imageSlider.Items.Clear();
            detallesConsumo.Attributes.CssStyle.Add("display", "none");
        }
        private void obtenerGeolocalizacion(int EstacionID)
        {

            ServiciosLibrary.TDatosEstacion dataEstacion = RPServer.RPServicios.DatosEstacion(EstacionID);
            CargarMapa(dataEstacion.Latitud.ToString(), dataEstacion.Longitud.ToString());
        }
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string ID = "", EstacionID = "", Serie = "", Folio = "";
            string tipo = sender.GetType().ToString();
            if (bgvConsumo2.DetailRows.VisibleCount > 0 || !(sender is ASPxPageControl))
            {
                if (sender is ASPxPageControl)
                {
                    ASPxPageControl nuevo = (ASPxPageControl)sender;
                    GridViewDetailRowTemplateContainer row = (GridViewDetailRowTemplateContainer)nuevo.Parent;
                    ID = bgvConsumo2.GetRowValues(row.ItemIndex, "ID").ToString();
                    EstacionID = bgvConsumo2.GetRowValues(row.ItemIndex, "EstacionID").ToString();
                    Serie = bgvConsumo2.GetRowValues(row.ItemIndex, "Serie").ToString();
                    Folio = bgvConsumo2.GetRowValues(row.ItemIndex, "Folio").ToString();
                }
                else
                {
                    ID = bgvConsumo2.GetRowValues(int.Parse(bgvConsumo2.FocusedRowIndex.ToString()), "ID").ToString();
                    EstacionID = bgvConsumo2.GetRowValues(int.Parse(bgvConsumo2.FocusedRowIndex.ToString()), "EstacionID").ToString();
                    Serie = bgvConsumo2.GetRowValues(int.Parse(bgvConsumo2.FocusedRowIndex.ToString()), "Serie").ToString();
                    Folio = bgvConsumo2.GetRowValues(int.Parse(bgvConsumo2.FocusedRowIndex.ToString()), "Folio").ToString();
                }
                consumoReporte(Convert.ToInt32(ID), Serie, Folio);
                obtenerGeolocalizacion(Convert.ToInt32(EstacionID));
                bgvConsumo2.DetailRows.ExpandRow(bgvConsumo2.FocusedRowIndex);
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
            ticketName.Value = Serie+Folio;
            hiddenURL.Value = resultado2.pathImpresion;
            ticket.Src = resultado2.pathImpresion+ "#zoom=70";
            RPSuiteServer.TAlbum album = new TAlbum();
            album = DataModule.DataService.ListaConsumoFotosByID(_ConsumoID);
            cargarGaleria(album);
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
            imageSlider.Items.Owner.IsRendering();
        }

        private void CargarMapa(string latitud, string longitud)
        {
           // panelParametros.Collapsed = true;
           // panelConsumos.Collapsed = true;
           // panelDetallesConsumo.Collapsed = false;
            carTabPage.ActiveTabIndex = 2;

            const string ScriptKey = "ScriptKey";
            /*
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
            */
            carTabPage.ActiveTabIndex = 0;
            mapagoogle.Src = @"https://maps.google.com.mx/maps?key=AIzaSyDN_xSn-jF76JH6J_qmU50SpqF_6kNIePU&q=" + latitud+","+longitud+"&language=es&hl=es;z=14&amp;output=embed";
            
        }

        protected void txtFechaInicial_Validation(object sender, ValidationEventArgs e)
        {
            e.ErrorText = "";
            ASPxDateEdit fecha = (ASPxDateEdit)sender;
            string resultado = "";
           resultado  =  Clases.Validaciones.validarFecha(fecha.Date.ToString());
            if (resultado != "") e.ErrorText = resultado;
            if (txtFechaFinal.Date < txtFechaInicial.Date) e.ErrorText = "Error: La fecha inicial no puede ser mayor a la fecha final";
            if (e.ErrorText != "")
            {
                e.IsValid = false;
            }
            else e.IsValid = true;
        }

        protected void txtFechaFinal_Validation(object sender, ValidationEventArgs e)
        {
            e.ErrorText = "";
            ASPxDateEdit fecha = (ASPxDateEdit)sender;
            string resultado = "";
            resultado = Clases.Validaciones.validarFecha(fecha.Date.ToString());
            if (resultado != "") e.ErrorText = resultado;
            if (txtFechaFinal.Date < txtFechaInicial.Date) e.ErrorText = "Error: La fecha inicial no puede ser mayor a la fecha final";
            if (e.ErrorText != "") e.IsValid = false;
            else e.IsValid = true;
        }

        protected void bgvConsumo2_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
        {
           // BootstrapGridView x = (BootstrapGridView)sender;
           // bgvConsumo2.FocusedRowIndex = x.PageIndex;
        }

        protected void ticketDetail_Load(object sender, EventArgs e)
        {
            HtmlIframe nuevo = (HtmlIframe)sender;
            nuevo.Src = ticket.Src;
            nuevo.Focus();
        }

        protected void mapagoogle_Load(object sender, EventArgs e)
        {
            HtmlIframe nuevo = (HtmlIframe)sender;
            nuevo.Src = mapagoogle.Src;
        }

        protected void imageSlider_Load(object sender, EventArgs e)
        {
            ASPxImageSlider nuevo = (ASPxImageSlider)sender;
            nuevo.Items.AddRange(imageSlider.Items);
        }

        protected void bgvConsumo2_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            int rowIndex = bgvConsumo2.FocusedRowIndex;
            (sender as ASPxGridView).FocusedRowIndex = (rowIndex == ASPxGridView.InvalidRowIndex) ? -1 : rowIndex;
            HiddenFocusIndex.Value = rowIndex.ToString();
            
        }

        protected void bgvConsumo2_BeforeColumnSortingGrouping(object sender, BootstrapGridViewBeforeColumnGroupingSortingEventArgs e)
        {
            bgvConsumo2.DetailRows.CollapseAllRows();
        }
    }
}