using DevExpress.XtraPivotGrid;
using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using HtmlAgilityPack;
using Newtonsoft.Json;
using Newtonsoft.JsonResult;
using RemObjects.DataAbstract.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        private static RPSuiteServer.TVehiculo vehiculo;
        string productoAutorizado = "";
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
            lista.Add(new ValuesCombo() { id = "", nombre = ""});///Para elegir no limitar a una estacion
            foreach (DataRow dr in query)
            {
                lista.Add(new ValuesCombo() { id = dr.Field<int>("EstacionID").ToString(), nombre = dr.Field<int>("EstacionID").ToString() +"-"+ dr.Field<string>("Nombre") });
                
            }
            cmbLimitarEstacion.DataSource = lista;
            cmbLimitarEstacion.ValueField = "id";
            cmbLimitarEstacion.TextField = "nombre";
            cmbLimitarEstacion.DataBind();

            chProductos.Items.Add("PREMIUM");
            if(productoAutorizado.Contains("1"))chProductos.Items[0].Selected = true;
            chProductos.Items.Add("MAGNA");
            if (productoAutorizado.Contains("2")) chProductos.Items[1].Selected = true;
            chProductos.Items.Add("DIESEL");
            if (productoAutorizado.Contains("3")) chProductos.Items[2].Selected = true;
            chProductos.Items.Add("OTRO");
            if (productoAutorizado.Contains("4")) chProductos.Items[3].Selected = true;


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
                productoAutorizado = dr.Field<string>("ProductoAutorizado");
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

        public override void VerifyRenderingInServerForm(Control control)
        {
           
        }
        private void ConstruirChecks(string value,int posicion)
        {          
            HtmlTableCell Td;
            string check = "";
            int i = 0;
                    foreach (char a in value)
                    {
                        check = "";
                        Td = new HtmlTableCell();
                        if (a.ToString() == "1") check = "checked";
                        Td.InnerHtml = "<input type='checkbox' id ='myCheck' class='fila" + posicion + " col" + string.Format("{0:00}", i) + " all'" + check + " />";
                tableHorarios.Rows[posicion].Cells.Add(Td);
                i++;
            }            
        }
        [System.Web.Services.WebMethod]              
        public static string leer(string ID)    // Metodo que lee tabla horarioHorario
        {
            string resultado = "";
            vehiculo = llenarVehiculo(ID);
            try
            {
                if (!DataModule.DataService.UpdateVehiculo(vehiculo)) resultado = "NO SE PUDIERON GUARDAR LOS CAMBIOS";
                else resultado= "LOS CAMBIOS HAN SIDO GUARDADOS CORRECTAMENTE";          
            } 
            catch (Exception ex)
            {
                resultado = ex.Message;
            }
            return resultado;
        }
        public static RPSuiteServer.TVehiculo llenarVehiculo(string ID)
        {

            RPSuiteServer.TVehiculo vehiculo = new RPSuiteServer.TVehiculo();
            var definicion = new
            { Nip = "", VehiculoId = new int(), Status = "", CargasMaximas = new int(), LimiteLTDia = new double(), LimiteLTSemana = new double(), LimiteLTMes = new double(), LimiteMNDia = new double(),
                LimiteMNSemana = new double(), LimiteMNMes = new double(), Lunes = "", Martes = "", Miercoles="", Jueves= "", Viernes= "", Sabado= "", Domingo= "", ProductoAutorizado="", Estacion="" };
            var listaDefinicion = new[] { definicion };
            var horarios = ID;
            var listHorarios = JsonConvert.DeserializeAnonymousType(horarios, listaDefinicion);
            vehiculo.CargasMaximas =listHorarios[0].CargasMaximas;
            vehiculo.Domingo = listHorarios[0].Domingo;
            vehiculo.Jueves = listHorarios[0].Jueves;
            vehiculo.LimiteLTDia = listHorarios[0].LimiteLTDia;
            vehiculo.LimiteLTMes = listHorarios[0].LimiteLTMes;
            vehiculo.LimiteMNDia = listHorarios[0].LimiteMNDia;
            vehiculo.LimiteMNSemana = listHorarios[0].LimiteMNSemana;
            vehiculo.LimiteMNMes = listHorarios[0].LimiteMNMes;
            vehiculo.LimiteLTSemana = listHorarios[0].LimiteLTSemana;
            vehiculo.Lunes = listHorarios[0].Lunes;
            vehiculo.Martes = listHorarios[0].Martes;
            vehiculo.Miercoles = listHorarios[0].Miercoles;
            vehiculo.Nip = listHorarios[0].Nip;
            vehiculo.ProductoAutorizado = listHorarios[0].ProductoAutorizado;
            vehiculo.Sabado = listHorarios[0].Sabado;
            vehiculo.Status = listHorarios[0].Status;
            vehiculo.VehiculoID = listHorarios[0].VehiculoId;
            vehiculo.Viernes = listHorarios[0].Viernes;
            vehiculo.Estacion = listHorarios[0].Estacion;
            return vehiculo;

        }


    }
}