
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
            Params.Clear();
            Data.DataModule.ParamByName(Params, "ClienteID", DataModule.Seguridad.UserID);
            spVehiculoDS ds = new spVehiculoDS();
            string query = "";
            if (Session["TODOS"] != null) {
                query = "spVehiculo";
                Session.Remove("TODOS");
            } 
            else query = "spVehiculosActivos";
            DataModule.FillDataSet(ds, query, Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spVehiculo"];
            bgvVehiculo.DataSource = dt;
            bgvVehiculo.DataBind();

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
                Session["TODOS"] = "1";
                Response.Redirect("VehiculosPage.aspx", false);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}