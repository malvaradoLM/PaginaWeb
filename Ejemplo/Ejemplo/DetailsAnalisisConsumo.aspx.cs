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
                bgvConsumo.Visible = false;
 
            }
            else
            {
                bgvConsumo.Visible = true;
                CargarReportePorCliente(Convert.ToInt32(DataModule.Seguridad.UserID), txtFechaInicial.Text, txtFechaFinal.Text);   
            }
            
            bgvConsumo.BeginUpdate();
            bgvConsumo.GroupSummary.Add(SummaryItemType.Count, "CANTIDAD");
            bgvConsumo.GroupSummary.Add(SummaryItemType.Sum, "IMPORTE");
            bgvConsumo.CustomColumnDisplayText += BgvConsumo_CustomColumnDisplayText;
            bgvConsumo.EndUpdate();

        }

        public void BgvConsumo_CustomColumnDisplayText(object sender, DevExpress.Web.Bootstrap.BootstrapGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName == "PRICE" || e.Column.FieldName == "IMPORTE")
            {
                decimal currencyValue;

                if (Decimal.TryParse(e.Value.ToString(), out currencyValue))
                {
                    e.DisplayText = string.Format("{0:c}", currencyValue);
                }
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
            bgvConsumo.DataSource = dt;
            bgvConsumo.DataBind();

        }

        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            
        }
    }
}