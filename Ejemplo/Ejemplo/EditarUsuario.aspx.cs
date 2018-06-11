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
                string x = Session["UsuarioWebID"].ToString();
                string y= Session["ClienteID"].ToString();
                if (Session["UsuarioWebID"] != null) modificarUsuario();
                if (Session["ClienteID"] != null) crearUsuario();
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
            if (validar() == "")
            {
                if (lblEncabezado.InnerText.Contains("Modificar")) guardarModificar();
                else guardarNuevo();
            }
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

            Response.Write("<script>window.alert('"+resultado+"');</script>");

        }
        private void crearUsuario()
        {
            lblEncabezado.InnerText = "Crear Usuario";
            HiddenClienteID.Value = Session["ClienteID"].ToString();
        }
        private string validar()
        {
            if (txtNombre.Text.Trim() == "") return "INGRESE UNA CLAVE PARA CONTINUAR";
            if (txtUsuario.Text.Trim() == "") return "INGRESE UNA CLAVE PARA CONTINUAR";
            if (txtClave.Text.Trim() == "") return "INGRESE UNA CLAVE PARA CONTINUAR";
            return "";
        }
        private void guardarNuevo()
        {
            TUsuarioWeb Datos = new TUsuarioWeb();
            Datos.Nombre = txtNombre.Text;
            Datos.Usuario = txtUsuario.Text;
            Datos.Administrador = (bool)chkAdministrador.Value;
            Datos.ClienteID = Convert.ToInt32(HiddenClienteID.Value);
            Datos.Clave = txtClave.Text;
            string resultado = "";
            try
            {
                if (!DataModule.DataService.setUsuarioWeb(Datos)) resultado = "NO SE PUDIERON GUARDAR LOS CAMBIOS";
                else resultado = "LOS CAMBIOS HAN SIDO GUARDADOS CORRECTAMENTE";
            }
            catch (Exception ex)
            {
                resultado = ex.Message;
            }

            Response.Write("<script>window.alert('" + resultado + "');</script>");
            if(!resultado.Contains("NO")) Response.Redirect("Usuarios.aspx", false);

        }
    }
}