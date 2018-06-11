using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using RemObjects.DataAbstract.Server;
using RPSuiteServer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ejemplo
{
   
    public partial class EditarUsuario : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        private string UsuarioWebID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Params.Clear();
                if (Session["UsuarioWebID"] != null) modificarUsuario();
            }
        }
        private void nuevoUsuario()
        {

        }
        private void modificarUsuario()
        {
            lblEncabezado.InnerText = "Modificar Usuario";
            UsuarioWebID = Session["UsuarioWebID"].ToString();
            HiddenUsuarioWebID.Value = UsuarioWebID;
            Data.DataModule.ParamByName(Params, "Datos", Session["UsuarioWebID"]);
            spUsuarioWeb ds = new spUsuarioWeb();
            DataModule.FillDataSet(ds, "spCatUsuarioWeb", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spCatUsuarioWeb"];
            IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;

            foreach (DataRow dr in query)
            {
                txtNombre.Text = dr.Field<string>("Nombre");
                txtUsuario.Text = dr.Field<string>("Usuario");
                txtClave.Text = dr.Field<string>("Clave");
                chkAdministrador.Value = dr.Field<bool>("Administrador");
            }
        }
        private void Guardar(object sender, EventArgs e)
        {
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            if (lblEncabezado.InnerText.Contains("Modificar")) guardarModificar();
        }
        private void guardarModificar()
        {
            TUsuarioWeb Datos = new TUsuarioWeb();
            Datos.Nombre = txtNombre.Text;
            Datos.Usuario = txtUsuario.Text;
            Datos.UsuarioWebID = Convert.ToInt32(HiddenUsuarioWebID.Value);
            Datos.Administrador = (bool)chkAdministrador.Value;
            Datos.Clave = txtClave.Text;



            string resultado = "";
            try
            {
                if (!DataModule.DataService.UpdateUsuarioWeb(Datos)) resultado = "NO SE PUDIERON GUARDAR LOS CAMBIOS";
                else resultado = "LOS CAMBIOS HAN SIDO GUARDADOS CORRECTAMENTE";
            }
            catch (Exception ex)
            {
                resultado = ex.Message;
            }

        }
    }
}