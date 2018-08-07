using Ejemplo.Clases;
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
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

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
            ///Deshabilita boton guardar si no es admin
            if (DataModule.Seguridad.Privileges == null) btnProcesar.Visible = false;
        }
        private void modificarUsuario()
        {
            etiqueta.Text = "Modificar Usuario";
            UsuarioWebID = Session["UsuarioWebID"].ToString();
            HiddenUsuarioWebID.Value = UsuarioWebID;
            Data.DataModule.ParamByName(Params, "Datos", Session["UsuarioWebID"]);
            spUsuarioWeb ds = new spUsuarioWeb();
            DataModule.FillDataSet(ds, "spCatUsuarioWeb", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spCatUsuarioWeb"];
            if(dt.Rows.Count != 0)
            {
                IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
                foreach (DataRow dr in query)
                {
                    txtNombre.Text = dr.Field<string>("Nombre");
                    txtUsuario.Text = dr.Field<string>("Usuario");
                    txtClave.Text = dr.Field<string>("Clave");
                    chkAdministrador.Value = dr.Field<bool>("Administrador");
                }
            }
            else
            {
                mensaje("No se pudo cargar la información del usuario, intente nuevamente", labelCssClases.Peligro, "Error");
            }
            
        }
        protected void btnguardar_Click(object sender, EventArgs e)
        {
            string validacion = "";
            validacion = validar();
            if (validacion == "")
            {
                if (etiqueta.Text.Contains("Modificar")) guardarModificar();
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
            string alerta = "";
            try
            {
                if (!DataModule.DataService.cmdActualizaUsuarioWeb(Datos)) {
                    resultado = "NO SE PUDIERON GUARDAR LOS CAMBIOS";
                    alerta = labelCssClases.Peligro;
                } 
                else{
                    resultado = "LOS CAMBIOS HAN SIDO GUARDADOS CORRECTAMENTE";
                    alerta = labelCssClases.Exito;
                }
            }
            catch (Exception ex)
            {
                resultado = ex.Message;
            }

            mensaje(resultado, alerta, "Modificar");

        }
        private void crearUsuario()
        {
            etiqueta.Text = "Crear Usuario";
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
            string alerta = "";
            try
            {
                if (!DataModule.DataService.cmdInsertUsuarioWeb(Datos))
                {
                    resultado = "No se pudieron guardar los cambios, verifique su red o su limite de usuarios";
                    alerta = labelCssClases.Peligro;
                }
                else {
                    resultado = "Los cambios han sido guardados correctamente";
                    alerta = labelCssClases.Exito;
                }
            }
            catch (Exception ex)
            {
                resultado = ex.Message;
            }

            MessageBox.Show(resultado);
            if(resultado.Contains("NO")) Response.Redirect("Usuarios.aspx", false);
            else Response.Redirect("Usuarios.aspx", false);
          

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