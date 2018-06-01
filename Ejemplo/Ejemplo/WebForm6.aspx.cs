using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using RemObjects.DataAbstract.Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "ClienteID", DataModule.Seguridad.UserID);
            spVehiculoDS ds = new spVehiculoDS();
            DataModule.FillDataSet(ds, "spVehiculo", Params.ToArray());

            // gvVehiculo.DataSource = ds;
            // gvVehiculo.DataBind();

            bgvVehiculo.DataSource = ds;
            bgvVehiculo.DataBind();
            grid.DataSource = ds;
            grid.DataBind();
            
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        [WebMethod]
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            int i = 0;
        }

        protected void bgvVehiculo_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {

        }
    }
}