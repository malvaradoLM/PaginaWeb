
using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using RemObjects.DataAbstract.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Windows.Forms;

namespace Ejemplo
{
    public partial class VehiculoPage : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Params.Clear();
                Data.DataModule.ParamByName(Params, "ClienteID", DataModule.Seguridad.UserID);
                spVehiculoDS ds = new spVehiculoDS();
                DataModule.FillDataSet(ds, "spVehiculo", Params.ToArray());
                DataTable dt = new DataTable();
                dt = ds.Tables["spVehiculo"];
                if (Session["TODOS"] == null)
                {
                    IEnumerable<DataRow> queryenum = from dts in dt.AsEnumerable() select dts;
                    foreach (DataRow dr in queryenum)
                    {
                        if (dr.Field<string>("Estatus") != "A") dr.Delete();
                    }
                    lblVehiculosActivos.InnerText = "TODOS LOS VEHICULOS";
                    lblTitulo.InnerText = "VEHICULOS ACTIVOS";
     
                }
                else
                {
                    lblTitulo.InnerText = "TODOS LOS VEHICULOS";
                    lblVehiculosActivos.InnerText = "VEHICULOS ACTIVOS";
                }
                bgvVehiculo.DataSource = dt;
                bgvVehiculo.DataBind();
                Session.Remove("TODOS");
            }

        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {

        }
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            FindControlPage();
        }
        private void FindControlPage()
        {
            try
            {  
               Session["VehiculoID"] = bgvVehiculo.GetRowValues(int.Parse(bgvVehiculo.FocusedRowIndex.ToString()), "VehiculoID").ToString();
                Response.Redirect("Vehiculos.aspx",false);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        protected void btnAll_Click(object sender, EventArgs e)
        {
            try
            {
                if (!lblVehiculosActivos.InnerText.Contains("ACTIVOS"))
                {
                    Session["TODOS"] = "1";
                }
                Response.Redirect("VehiculoPage.aspx", false);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}