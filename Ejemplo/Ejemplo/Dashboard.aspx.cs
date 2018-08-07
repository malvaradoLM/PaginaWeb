using DevExpress.XtraCharts;
using Ejemplo.Clases;
using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using RemObjects.DataAbstract.Server;
using RPSuiteServer;
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
using static Ejemplo.Models.ComodinModel.BigViewModel;

namespace Ejemplo
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            cargaSaldos();
            cargarGraficas();
        }
        private void cargarGraficas()
        {
            List<resultChartConsumosMes> objData = new List<resultChartConsumosMes>();

            // OBTENER CONSUMOS POR FECHAS
            var lastmonth = DateTime.Today.AddMonths(-2);
            var firstDayOfMonth = new DateTime(lastmonth.Year, lastmonth.Month, 1);
            var fechaFinal = DateTime.Now.Date;
            string DescProducto;
            int GasolineroID = int.Parse(Session["GasolineroID"].ToString());

            string dateFecIni = firstDayOfMonth.ToString("yyyy/MM/dd");
            string dateFecFin = fechaFinal.ToString("yyyy/MM/dd");


            Params.Clear();
            Data.DataModule.ParamByName(Params, "GasolineroID", GasolineroID);
            Data.DataModule.ParamByName(Params, "ClienteID", DataModule.Seguridad.UserID);
            Data.DataModule.ParamByName(Params, "FechaInicial", dateFecIni);
            Data.DataModule.ParamByName(Params, "FechaFinal", dateFecFin);
            spConsumoByFecha ds = new spConsumoByFecha();
            spConsumoByProducto dsp = new spConsumoByProducto();
            DataModule.FillDataSet(ds, "dbConsumoByFecha", Params.ToArray());
            DataModule.FillDataSet(dsp, "dbConsumoByProducto", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["dbConsumoByFecha"];
            IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
            foreach (DataRow dr in query)
            {
                if(dr.Field<int>("ProductoID") > 3)
                {
                    dr.BeginEdit();
                    dr["Producto"] = "OTROS";
                    dr["ProductoID"] = "4";
                    dr.EndEdit();
                }

            }

            cargarDataSourceEnChartPorMeses(dt);
            DataTable dtp = new DataTable();
            dtp = dsp.Tables["dbConsumoByProducto"];
            cargarDataSourceEnChartPorProducto(dtp);
            if(dtp.Rows.Count == 0)
            {
                mensaje("No se ha podido carga la informacion", labelCssClases.Advertencia, "Advertencia!");
            }

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
            if(DatosCliente == null || DatosCliente.LimiteCredito.ToString() == "")
            {
                mensaje("No se pudo cargar la información de Saldos", labelCssClases.Advertencia, "Advertencia!");
            }
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
        private void cargarDataSourceEnChartPorMeses(DataTable dt)
        {
            webChartControl.DataSource = dt;
            webChartControl.SeriesDataMember = "Producto";
            webChartControl.SeriesTemplate.ArgumentDataMember = "Mes";
            webChartControl.SeriesTemplate.ValueDataMembers.AddRange(new string[] { "Importe" });
            webChartControl.SeriesTemplate.View = new SideBySideBarSeriesView();
            webChartControl.SeriesTemplate.CrosshairLabelPattern = "{A} - {V:c}";
            webChartControl.DataBind();

            webChartControl3.DataSource = dt;
            webChartControl3.SeriesDataMember = "Producto";
            webChartControl3.SeriesTemplate.ArgumentDataMember = "Mes";
            webChartControl3.SeriesTemplate.ValueDataMembers.AddRange(new string[] { "Importe" });
            webChartControl3.SeriesTemplate.View = new RadarAreaSeriesView();
            webChartControl3.SeriesTemplate.CrosshairLabelPattern = "{A} - {V:c}";
            webChartControl3.DataBind();


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
        private void cargarDataSourceEnChartPorProducto(DataTable dt)
        {
            Series series1 = new Series("A Pie Series", ViewType.Pie);
           
            webChartControlPie.DataMember = "dbConsumoByProducto";
           // series1.ArgumentDataMember = "Producto";
            series1.CrosshairLabelVisibility = DevExpress.Utils.DefaultBoolean.True;
            series1.ValueDataMembers.AddRange(new string[] { "TotConsumo" });

            series1.ArgumentDataMember = "TotConsumo";
            series1.Name = "Producto";
            series1.ValueScaleType = ScaleType.Numerical;
            PointSeriesView x = new PointSeriesView();
                //  series1.LegendTextPattern = "Producto";
            //    series1.ValueDataMembers.AddRange(new string[] { "TotConsumo"});

            webChartControlPie.Series.Add(series1);
            webChartControlPie.DataSource = dt;
            webChartControlPie.DataBind();




           Series series2 = new Series("Stacked Area", ViewType.StackedSplineArea);
            webChartControl4.DataSource = dt;
            webChartControl4.DataMember = "dbConsumoByProducto";
            // series1.ArgumentDataMember = "Producto";
            series2.CrosshairLabelVisibility = DevExpress.Utils.DefaultBoolean.True;
            series2.ValueDataMembers[0] = "TotConsumo";
            series2.ArgumentDataMember = "Producto";
            series2.Name = "Producto";
            series2.ValueScaleType = ScaleType.Numerical;
            //  series1.LegendTextPattern = "Producto";
            series2.ValueDataMembers.AddRange(new string[] { "TotConsumo"});

            webChartControl4.Series.Add(series2);
            webChartControl4.DataBind();


        }
        private void mensaje(string contenido, string tipo, string titulo)
        {
            msjAlerta.Attributes["class"] = tipo;
            labelAlerta.Text = contenido;
            lblTitleMensaje.Text = titulo;
            msjAlerta.Visible = true;
        }
    }

}
