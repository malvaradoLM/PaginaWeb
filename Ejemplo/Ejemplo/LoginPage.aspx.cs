using Ejemplo.Clases;
using Ejemplo.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Ejemplo
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Caducada"] != null)
            {
                mensaje("La sesión ha caducado, inicie nuevamente", labelCssClases.Advertencia, "Advertencia");
                Session["Caducada"] = null;
            }
            else
            {
                msjAlerta.Visible = true;
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
              //  DataClass proxy = new DataClass();
                RemObjects.DataAbstract.Server.UserInfo userinfo = new RemObjects.DataAbstract.Server.UserInfo();
                //proxy.LoginAccess(inputUsuario.Value, inputPassword.Value, out userinfo);
                if (DataModule.LoginService.Login(inputUser.Value, inputPass.Value, out userinfo))
                {
                    DataModule.Seguridad = userinfo;

                     Response.Redirect("Dashboard.aspx", false);
                   // Response.Redirect("MenuPrincipal.aspx", false);
                }
                else
                {
                    //ShowMessage("Nombre de Usuario o Contrasena incorrecta verifique datos");
                    //MessageBox.Show("Nombre de Usuario o Contrasena incorrecta verifique datos","Advertecia", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    throw new Exception("Usuario o Clave Invalido");
                }
            }
            catch (Exception ex)
            {
                //ShowMessage(ex.Message.ToString());
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
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