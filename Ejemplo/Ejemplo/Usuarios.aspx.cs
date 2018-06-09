using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using RemObjects.DataAbstract.Server;
using System.Data;

namespace Ejemplo
{
    public partial class WebForm4 : System.Web.UI.Page
    {

        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "ClienteID", DataModule.Seguridad.UserID);
            spVehiculoDS ds = new spVehiculoDS();
            DataModule.FillDataSet(ds, "spUsuarioWeb", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spUsuarioWeb"];
            bgvUsuario.DataSource = dt;
            bgvUsuario.DataBind();
           
        }
        private void FindControlPage()
        {
            try
            {
                Session["UsuarioWebID"] = bgvUsuario.GetRowValues(int.Parse(bgvUsuario.FocusedRowIndex.ToString()), "UsuarioWebID").ToString();
                Response.Redirect("EditarUsuario.aspx", false);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {

        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            FindControlPage();
        }
    }
}