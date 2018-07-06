using DevExpress.XtraCharts;
using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using RemObjects.DataAbstract.Server;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
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
            cargaDataTableGrafica();
        }
        private void cargaSaldos()
        {
            int ClienteID = int.Parse(DataModule.Seguridad.UserID);
            RPSuiteServer.TCliente DatosCliente = new RPSuiteServer.TCliente();
            Session["Grupo"] = DatosCliente.Grupo;
            DatosCliente.ClienteID = Convert.ToInt32(DataModule.Seguridad.UserID);
            DatosCliente = DataModule.DataService.getCliente(ClienteID);
            RPSuiteServer.TUsuarioWeb DatosUsuario = new RPSuiteServer.TUsuarioWeb();          
            Session["Grupo"] = DatosCliente.Grupo;
            double limiteCredito = DatosCliente.LimiteCredito;
            double saldoDeudor = DatosCliente.Saldo;
            double saldoDisponible = DatosCliente.LimiteCredito - saldoDeudor;
            lblLimiteCredito.Text = DatosCliente.LimiteCredito.ToString("C");
            lblSaldoDisponible.Text = saldoDisponible.ToString("C");
            lblSaldoDeudor.Text = saldoDeudor.ToString("C");
            setGasolineroID();
        }

        private void cargaDataTableGrafica()
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
            cargarDataSourceEnChart(dt);
            
        }
        private void cargarDataSourceEnChart(DataTable dt)
        {
            webChartControl.DataSource = dt;
            webChartControl.SeriesDataMember = "Descripcion";
            webChartControl.SeriesTemplate.ArgumentDataMember = "Descripcion";
            webChartControl.SeriesTemplate.ValueDataMembers.AddRange(new string[] { "Importe" });
            webChartControl.SeriesTemplate.View = new SideBySideBarSeriesView();
            webChartControl.SeriesTemplate.CrosshairLabelPattern = "{A} - {V:c}";
            webChartControl.DataBind();
        }
        private void setGasolineroID()
        {
            string line;
            string RutaCistemIni = ConfigurationManager.AppSettings["RutaCistemIni"].ToString();
            string path = @RutaCistemIni;
            if (File.Exists(path))
            {
                // Read the file and display it line by line.
                System.IO.StreamReader file =
                   new System.IO.StreamReader(path);

                while ((line = file.ReadLine()) != null)
                {
                    //Console.WriteLine(line);
                    string strLinea = line;

                    if (strLinea.Contains("GasolineroID="))
                    {
                        string[] linea = strLinea.Split('=');
                        Session["GasolineroID"] = linea[1];
                    }
                }
            file.Close();
        }

        }
    }

}
