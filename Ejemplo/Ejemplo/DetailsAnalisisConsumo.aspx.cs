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
                else{
                    titulo = "CONSUMO POR GRUPO";
                    if (Session["Grupo"] != null && Session["Grupo"].ToString() != string.Empty){ 
                     dt= CargarReportePorGrupo(Session["Grupo"].ToString(), txtFechaInicial.Text, txtFechaFinal.Text);
                    }else ///SI EL CLIENTE NO TIENE GRUPO, SOLO SE CARGARAN LOS REGISTRO DEL CLIENTE
                        ///TempData["Alert"] = "El Usuario que se firmo no tiene asignado ningun grupo. Se mostraran solo los consumos asignados al usuario.";
                        dt = CargarReportePorCliente(Convert.ToInt32(DataModule.Seguridad.UserID), txtFechaInicial.Text, txtFechaFinal.Text);
                    
                }
                cargarReporte(titulo, dt);
               
            }
        }
 

        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {

        }
        private DataTable CargarReportePorCliente(int ClienteID,string FechaIni, string FechaFin)
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
        private void cargarReporte(string titulo,DataTable dt)
        {
            bgvConsumo2.DataSource = dt;
            bgvConsumo2.DataBind();
            bgvConsumo2.SettingsText.Title = titulo;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reportes.aspx", false);
        }
        private void obtenerGeolocalizacion(int EstacionID)
        {
            
            ServiciosLibrary.TDatosEstacion dataEstacion = RPServer.RPServicios.DatosEstacion(13266);

        }
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            LinkButton item = (LinkButton)sender;
            string ID = item.Text;
            object padre = item.Parent;
            GridViewDataItemTemplateContainer row = (GridViewDataItemTemplateContainer)item.NamingContainer;
            int index = row.ItemIndex;
            string EstacionID = bgvConsumo2.GetRowValues(int.Parse(bgvConsumo2.FocusedRowIndex.ToString()), "EstacionID").ToString();
            
        }

    }
}