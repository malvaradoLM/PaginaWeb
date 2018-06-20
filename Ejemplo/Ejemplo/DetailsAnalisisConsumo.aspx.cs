using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using RemObjects.DataAbstract.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress;
using DevExpress.Data;

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
                if (Convert.ToInt32(chkBoxList.Value) == 0)
                    CargarReportePorCliente(Convert.ToInt32(DataModule.Seguridad.UserID), txtFechaInicial.Text, txtFechaFinal.Text);
                else CargarReportePorGrupo(Convert.ToInt32(DataModule.Seguridad.UserID), txtFechaInicial.Text, txtFechaFinal.Text);
                
            }
        }
 

        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {

        }
        private void CargarReportePorCliente(int ClienteID,string FechaIni, string FechaFin)
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "ClienteID", ClienteID);
            Data.DataModule.ParamByName(Params, "FechaInicial", FechaIni);
            Data.DataModule.ParamByName(Params, "FechaFinal", FechaFin);

            spConsumoDS ds = new spConsumoDS();
            DataModule.FillDataSet(ds, "spListaConsumoByFecha", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spListaConsumoByFecha"];
            IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
            bgvConsumo2.DataSource = dt;
            bgvConsumo2.DataBind();
            bgvConsumo2.SettingsText.Title = "CONSUMOS DEL CLIENTE";
        }

        private void CargarReportePorGrupo(int ClienteID, string FechaIni, string FechaFin)
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "ClienteID", ClienteID);
            Data.DataModule.ParamByName(Params, "FechaInicial", FechaIni);
            Data.DataModule.ParamByName(Params, "FechaFinal", FechaFin);

            spConsumoDS ds = new spConsumoDS();
            DataModule.FillDataSet(ds, "spListaConsumoByFecha", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spListaConsumoByFecha"];
            IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
            bgvConsumo2.DataSource = dt;
            bgvConsumo2.DataBind();
            bgvConsumo2.SettingsText.Title = "CONSUMOS DEL CLIENTE";
        }
    }
}