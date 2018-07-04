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
                else crearUsuario();
            }
            Session.Remove("UsuarioWebID");
            Session.Remove("CLienteID");
        }
        private void modificarUsuario()
        {
            lblEncabezado1.InnerText = "Modificar Usuario";
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
        protected void btnguardar_Click(object sender, EventArgs e)
        {
            string validacion = "";
            validacion = validar();
            if (validacion == "")
            {
                if (lblEncabezado1.InnerText.Contains("Modificar")) guardarModificar();
                else guardarNuevo();
            }else Response.Write("<script>window.alert('" + validacion+ "');</script>");
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Usuarios.aspx", false);
            }
            catch (Exception ex)
            {
               
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
            Datos.ClienteID = Convert.ToInt32(DataModule.Seguridad.UserID);
            Datos.GasolineroID = Convert.ToInt32(Session["GasolineroID"]);
            string resultado = "";
            try
            {
                if (!DataModule.DataService.cmdActualizaUsuarioWeb(Datos)) resultado = "NO SE PUDIERON GUARDAR LOS CAMBIOS";
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
            lblEncabezado1.InnerText = "Crear Usuario";
            HiddenClienteID.Value = Session["ClienteID"].ToString();
        }
        private string validar()
        {
            if (txtNombre.Text.Trim() == "") return "ES NECESARIO INGRESAR UN NOMBRE PARA GUARDAR";
            if (txtUsuario.Text.Trim() == "") return "ES NECESARIO INGRESAR UN USUARIO PARA GUARDAR";
            if (txtClave.Text.Trim() == "") return "ES NECESARIO INGRESAR UNA CLAVE PARA GUARDAR";
            return "";
        }
        private void guardarNuevo()
        {
            TUsuarioWeb Datos = new TUsuarioWeb();
            Datos.Nombre = txtNombre.Text;
            Datos.Usuario = txtUsuario.Text;
            if (chkAdministrador.Value != null)
                Datos.Administrador = (bool)chkAdministrador.Value;
            else Datos.Administrador = false;
            Datos.ClienteID = Convert.ToInt32(HiddenClienteID.Value);
            Datos.Clave = txtClave.Text;
            Datos.GasolineroID = Convert.ToInt32(Session["GasolineroID"]);
            string resultado = "";
            try
            {
                if (!DataModule.DataService.cmdInsertUsuarioWeb(Datos)) resultado = "NO SE PUDIERON GUARDAR LOS CAMBIOS";
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