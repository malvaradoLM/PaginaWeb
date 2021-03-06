﻿using DevExpress.XtraPivotGrid;
using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using HtmlAgilityPack;
using Newtonsoft.Json;
using RemObjects.DataAbstract.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using RPSuiteServer;

namespace Ejemplo
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        RPSuiteServer.TVehiculo vehiculo = new TVehiculo();
        protected void Page_Load(object sender, EventArgs e)
        {

            Params.Clear();
            Data.DataModule.ParamByName(Params, "Datos",Session["VehiculoID"]);
            spCatVehiculoDS ds = new spCatVehiculoDS();
            DataModule.FillDataSet(ds, "spCatVehiculo", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spCatVehiculo"];
            FillDataFirstTab(dt);
            FillCombos();
            FillComboEstacion();
            FillDataSecondTab(dt);
            FillDataThirdTab(dt);
            FillDataFourthTab(dt);
            FillDataFifthTab(dt);
            FillDataSixthTab(dt);

        }

        #region Combo
        public class ValuesCombo
        {
            public string id { get; set; }
            public string nombre { get; set; }
        }
        private void FillCombos()
        {
            List<ValuesCombo> listaEstatus = new List<ValuesCombo>();
            ValuesCombo vc = new ValuesCombo();
            listaEstatus.Add(new ValuesCombo { id = "C", nombre = "INACTIVA" });
            listaEstatus.Add(new ValuesCombo { id = "A", nombre = "ACTIVA" });

            cmbEstatusActual.DataSource = listaEstatus;
            cmbEstatusActual.ValueField = "id";
            cmbEstatusActual.TextField = "nombre";
            cmbEstatusActual.DataBind();
        }
        private void FillComboEstacion()
        {
            List<ValuesCombo> lista = new List<ValuesCombo>();
            spCatEstacionDS ds = new spCatEstacionDS();
            DataModule.FillDataSet(ds, "spCatEstacion", null);
            DataTable dt = new DataTable();
            dt = ds.Tables["spCatEstacion"];

            IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;

            foreach (DataRow dr in query)
            {
                lista.Add(new ValuesCombo() { id = dr.Field<int>("EstacionID").ToString(), nombre = dr.Field<int>("EstacionID").ToString() +"-"+ dr.Field<string>("Nombre") });
            }

            cmbLimitarEstacion.DataSource = lista;
            cmbLimitarEstacion.ValueField = "id";
            cmbLimitarEstacion.TextField = "nombre";
            cmbLimitarEstacion.DataBind();
            chProductos.Items.Add("PREMIUM");
            chProductos.Items.Add("MAGNA");
            chProductos.Items.Add("DIESEL");
            chProductos.Items.Add("OTRO");

        }
        #endregion


        private void FillDataFirstTab(DataTable dt)
        {
            IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
            foreach (DataRow dr in query)
            {
                txtVehiculoID.Text = dr.Field<int>("VehiculoID").ToString();
                txtIdentificacion.Text = dr.Field<string>("Identificacion");
                txtCentrodeCosto.Text= dr.Field<string>("CentroCostos");
                txtDepartamento.Text= dr.Field<string>("Departamento");
                txtNombreUsuario.Text= dr.Field<string>("Nombre");
                chkPlacas.Value= dr.Field<bool>("Placas");
            }
        }
        private void FillDataSecondTab(DataTable dt)
        {
            IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
            foreach (DataRow dr in query)
            {
                txtNIP.Text = dr.Field<string>("NIP").ToString();
                cmbEstatusActual.Value= dr.Field<string>("Estatus");
                txtCargasMaximas.Text = dr.Field<int>("CargasMaximas").ToString();
                cmbLimitarEstacion.Value= dr.Field<string>("Estacion");
                //txtNombreUsuario.Text = dr.Field<string>("Nombre");
                //chkPlacas.Value = dr.Field<bool>("Placas");
            }
        }
        private void FillDataThirdTab(DataTable dt)
        {
            IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
            foreach (DataRow dr in query)
            {
                txtFechaAlta.Text = dr.Field<DateTime?>("FechaAlta").ToString();
                txtFechaBaja.Text = dr.Field<DateTime?>("FechaBaja").ToString();
                txtFechaBloqueo.Text = dr.Field<DateTime?>("FechaBloqueada").ToString();
                txtFechaCancelacion.Text = dr.Field<DateTime?>("FechaCancelacion").ToString();
                txtFechaExpiracion.Text = dr.Field<DateTime?>("FechaExpira").ToString();
                txtFechaInactivacion.Text = dr.Field<DateTime?>("FechaInactiva").ToString();
            
            }
        }
        private void FillDataFourthTab(DataTable dt)
        {
            IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
            foreach (DataRow dr in query)
            {
                
                txtLAVAcumulado.Text = dr.Field<double>("LimiteLTTurno").ToString();
                txtLAVDiario.Text = dr.Field<double>("LimiteLTDia").ToString();
                txtLAVSemanal.Text = dr.Field<double>("LimiteLTSemana").ToString();
                txtLAVMensual.Text = dr.Field<double>("LimiteLTMes").ToString();

                txtLAIAcumulado.Text = dr.Field<double>("LimiteMNTurno").ToString();
                txtLAIDiario.Text = dr.Field<double>("LimiteMNDia").ToString();
                txtLAISemanal.Text = dr.Field<double>("LimiteMNSemana").ToString();
                txtLAIMensual.Text = dr.Field<double>("LimiteMNMes").ToString();

                txtLDVAcumulado.Text = dr.Field<double>("LimiteLTTurno") == 0 ? "SIN LIMITES" : GetValueLimite(dr.Field<double>("LimiteLTTurno"), dr.Field<double>("ActualLTTurno")).ToString();
                txtLDVDiario.Text = dr.Field<double>("LimiteLTDia") == 0 ? "SIN LIMITES" : GetValueLimite(dr.Field<double>("LimiteLTDia"), dr.Field<double>("ActualLTDia")).ToString();
                txtLDVSemanal.Text = dr.Field<double>("LimiteLTSemana") == 0 ? "SIN LIMITES" : GetValueLimite(dr.Field<double>("LimiteLTSemana"), dr.Field<double>("ActualLTSemana")).ToString();
                txtLDVMensual.Text = dr.Field<double>("LimiteLTMes") == 0 ? "SIN LIMITES" : GetValueLimite(dr.Field<double>("LimiteLTMes"), dr.Field<double>("ActualLTMes")).ToString();

                txtLDIAcumulado.Text = dr.Field<double>("LimiteMNTurno") == 0 ? "SIN LIMITES" : GetValueLimite(dr.Field<double>("LimiteMNTurno"), dr.Field<double>("ActualMNTurno")).ToString();
                txtLDIDiario.Text = dr.Field<double>("LimiteMNDia") == 0 ? "SIN LIMITES" : GetValueLimite(dr.Field<double>("LimiteMNDia"), dr.Field<double>("ActualMNDia")).ToString();
                txtLDISemanal.Text = dr.Field<double>("LimiteMNSemana") == 0 ? "SIN LIMITES" : GetValueLimite(dr.Field<double>("LimiteMNSemana"), dr.Field<double>("ActualMNSemana")).ToString();
                txtLDIMensual.Text = dr.Field<double>("LimiteMNMes") == 0 ? "SIN LIMITES" : GetValueLimite(dr.Field<double>("LimiteMNMes"), dr.Field<double>("ActualMNMes")).ToString();
            }
        }
        private void FillDataFifthTab(DataTable dt)
        {
            IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
            foreach (DataRow dr in query)
            {
                txtVACDiario.Text = dr.Field<double>("ActualLTDia").ToString();
                txtVACSemanal.Text = dr.Field<double>("ActualLTSemana").ToString();
                txtVACMensual.Text = dr.Field<double>("ActualLTMes").ToString();
                

                txtVANDiario.Text = dr.Field<double>("AnteriorLTDia").ToString();
                txtVANSemanal.Text = dr.Field<double>("AnteriorLTSemana").ToString();
                txtVANMensual.Text = dr.Field<double>("AnteriorLTMes").ToString();
                txtVANAcumulado.Text = dr.Field<double>("ActualLTTurno").ToString();

                txtIACDiario.Text = dr.Field<double>("ActualMNDia").ToString();
                txtIACSemanal.Text = dr.Field<double>("ActualMNSemana").ToString();
                txtIACMensual.Text = dr.Field<double>("ActualMNMes").ToString();


                txtIANDiario.Text = dr.Field<double>("AnteriorMNDia").ToString();
                txtIANSemanal.Text = dr.Field<double>("AnteriorMNSemana").ToString();
                txtIANMensual.Text = dr.Field<double>("AnteriorMNMes").ToString();
                txtIANAcumulado.Text = dr.Field<double>("ActualMNTurno").ToString();
            }
        }
        private double GetValueLimite(double limitedisponible, double limiteactual)
        {
            double resultado;
            resultado = limitedisponible - limiteactual;
            return resultado;
        }
        private void FillDataSixthTab(DataTable dt)
        {
            ConstruirTabla();
            IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
            foreach (DataRow dr in query)
            {
                ConstruirChecks(dr.Field<string>("Lunes"),1);
                ConstruirChecks(dr.Field<string>("Martes"),2);
                ConstruirChecks(dr.Field<string>("Miercoles"),3);
                ConstruirChecks(dr.Field<string>("Jueves"),4);
                ConstruirChecks(dr.Field<string>("Viernes"),5);
                ConstruirChecks(dr.Field<string>("Sabado"),6);
                ConstruirChecks(dr.Field<string>("Domingo"),7);
            }
        }


        private void ConstruirTabla()
        {
            /*
            for (int i = 0; i < 24; i++)
            {
                HtmlTableCell cell = new HtmlTableCell();
                cell.InnerHtml = "<a  runat='server' id='link"+i+"' AutoPostBack = 'true' Text ='" + string.Format("{0:00}", i) + "' OnClick ='validar(this.id);' style=' cursor: pointer;' />" + string.Format("{0:00}", i);
                tableHorarios.Rows[0].Cells.Add(cell);
            }
            */
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        private void ConstruirChecks(string value,int posicion)
        {
            
            HtmlTableCell Td;
            string check = "";
            int i = 0;
            
            //foreach (HtmlTableRow row in tableHorarios.Rows)
            //{
            //    if (i != 0)
            //    {
            //        int col = 1;
                    foreach (char a in value)
                    {
                        check = "";
                        Td = new HtmlTableCell();
                        if (a.ToString() == "1") check = "checked";
                        Td.InnerHtml = "<input type='checkbox' id ='myCheck' class='fila" + posicion + " col" + string.Format("{0:00}", i) + " all'" + check + " />";
                tableHorarios.Rows[posicion].Cells.Add(Td);
                //row.Cells.Add(Td);
                //col++;
                i++;
            }
                //}
                //i++;
            //}
            
            
        }
        [System.Web.Services.WebMethod]              
        public static string leer(string ID)    // Metodo que lee tabla horarioHorario
        {
            RPSuiteServer.TVehiculo vehiculo = new TVehiculo();
            var definicion = new
            { Dia = "", Valor = "" };
            var listaDefinicion = new[] { definicion };
            var horarios = ID;
            var listHorarios = JsonConvert.DeserializeAnonymousType(horarios, listaDefinicion);

            

            foreach (var hor in listHorarios)
            {
                switch (hor.Dia)
                {
                    case "Lunes":
                        vehiculo.Lunes = hor.Valor;
                        break;
                    case "Martes":
                        vehiculo.Martes = hor.Valor;
                        break;
                    case "Miércoles":
                        vehiculo.Miercoles = hor.Valor;
                        break;
                    case "Jueves":
                        vehiculo.Jueves = hor.Valor;
                        break;
                    case "Viernes":
                        vehiculo.Viernes = hor.Valor;
                        break;
                    case "Sábado":
                        vehiculo.Sabado = hor.Valor;
                        break;
                    case "Domingo":
                        vehiculo.Domingo = hor.Valor;
                        break;


                }
            }
            return "";
        }

        public void guardarTablaHorario(string ID)
        {

        }


    }
}