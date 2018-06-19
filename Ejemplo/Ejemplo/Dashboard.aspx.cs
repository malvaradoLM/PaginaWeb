using DevExpress.XtraCharts;
using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using RemObjects.DataAbstract.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            cargaSaldos();
            cargaGrafica();
        }
        private void cargaSaldos()
        {
            int ClienteID = int.Parse(DataModule.Seguridad.UserID);
            RPSuiteServer.TCliente DatosCliente = new RPSuiteServer.TCliente();
            DatosCliente = DataModule.DataService.getCliente(ClienteID);
            double limiteCredito = DatosCliente.LimiteCredito;
            double saldoDisponible = DatosCliente.Saldo;
            double saldoDeudor = limiteCredito - saldoDisponible;
            lblLimiteCredito.Text = DatosCliente.LimiteCredito.ToString("C");
            lblSaldoDisponible.Text = saldoDisponible.ToString("C");
            lblSaldoDeudor.Text = saldoDeudor.ToString("C");
        }
        private void cargaGrafica()
        {
            Params.Clear();
            int anio = DateTime.Now.Year;
            ChartTitle tituloGrafica = new ChartTitle();
            tituloGrafica.Text = "Consumo por Producto Año " + anio;
            webChartControl.Titles.Add(tituloGrafica);
            Data.DataModule.ParamByName(Params, "ClienteID", DataModule.Seguridad.UserID);
            Data.DataModule.ParamByName(Params, "anio", anio);
            spRptConsumoCliente ds = new spRptConsumoCliente();
            DataModule.FillDataSet(ds, "spRptConsumoCliente", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spRptConsumoCliente"];
            IEnumerable<DataRow> queryenum = from dts in dt.AsEnumerable() select dts;
            webChartControl.DataSource = dt;
            // Specify data members to bind the chart's series template.
            webChartControl.SeriesDataMember = "Descripcion";
            webChartControl.SeriesTemplate.ArgumentDataMember = "Descripcion";
            webChartControl.SeriesTemplate.ValueDataMembers.AddRange(new string[] { "Importe" });
            webChartControl.SeriesTemplate.View = new SideBySideBarSeriesView();
            webChartControl.SeriesTemplate.CrosshairLabelPattern = "{A} - {V:c}"; 
            webChartControl.DataBind();
        }
    }
}