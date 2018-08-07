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
using Ejemplo.Clases;

namespace Ejemplo
{
    public partial class WebForm4 : System.Web.UI.Page
    {

        private List<DataParameter> Params = new List<DataParameter>();
        private string ClienteID;
        protected void Page_Load(object sender, EventArgs e)
        {
            Params.Clear();
            if (!IsPostBack) msjAlerta.Visible = false;
            ClienteID = DataModule.Seguridad.UserID;
            Data.DataModule.ParamByName(Params, "ClienteID", DataModule.Seguridad.UserID);
            spVehiculoDS ds = new spVehiculoDS();
            DataModule.FillDataSet(ds, "spUsuarioWeb", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spUsuarioWeb"];
            if(dt.Rows.Count != 0)
            {
                bgvUsuario.DataSource = dt;
                bgvUsuario.DataBind();
            }
            else
            {
                mensaje("No se han encontrado registros, intente nuevamente", labelCssClases.Advertencia, "Advertencia");
            }
            
            ///Deshabilita boton Crear Nuevo si no tiene permisos
            if (DataModule.Seguridad.Privileges == null) btnNuevo1.Visible = false;
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
        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                Session["ClienteID"] = ClienteID;
                Response.Redirect("EditarUsuario.aspx", false);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
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