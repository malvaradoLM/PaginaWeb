using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ejemplo.Clases;
using Ejemplo.Data;

namespace Ejemplo
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) msjAlerta.Visible = false;
            if(DataModule.Seguridad == null)
            {
                Response.Write("<script>alert('LA SESION HA CADUCADO, INICIE SESION NUEVAMENTE');</script>");
                Response.Redirect("loginpage.aspx", false);
            }
            int ClienteID = int.Parse(DataModule.Seguridad.UserID);       
            RPSuiteServer.TCliente DatosCliente = new RPSuiteServer.TCliente();
            DatosCliente = DataModule.DataService.getCliente( ClienteID);
            if(DatosCliente == null || DatosCliente.RazonSocial.Equals(""))
            {
                mensaje("El contenido no se ha cargado, intente nuevamente", labelCssClases.Advertencia, "Advertencia");
            }
            else
            {
                cargarCliente(DatosCliente);
            }      
        }
        private void cargarCliente(RPSuiteServer.TCliente DatosCliente)
        {
            lblID.Text = "ID = " + DatosCliente.ClienteID;
            lblRazonSocial.Text = DatosCliente.RazonSocial;
            lblCliente.Text = DatosCliente.Nombre;
            lblDomicilio.Text = DatosCliente.Domicilio;
            lblCiudad.Text = DatosCliente.Ciudad;
            lblCP.Text = DatosCliente.CodigoPostal;
            lblStatus.Text = DatosCliente.Estatus;
            lblColonia.Text = DatosCliente.Colonia;
            lblRFC.Text = DatosCliente.RFC;
            lblEstado.Text = DatosCliente.Estado;
            lblLimiteCredito.Text = DatosCliente.LimiteCredito.ToString("C");
            lblTelefono.Text = DatosCliente.Telefono;
        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {

        }
        protected void Click (object sender, EventArgs e)
        {

                Response.Redirect("DetailsEdoCta.aspx", false);
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