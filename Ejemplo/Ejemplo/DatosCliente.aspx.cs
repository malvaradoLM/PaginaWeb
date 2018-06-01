using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ejemplo.Data;

namespace Ejemplo
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // RPSuiteServer.RPDataService RP = new RPSuiteServer.RPDataService();
            int ClienteID = int.Parse(DataModule.Seguridad.UserID);
           
            RPSuiteServer.TCliente DatosCliente = new RPSuiteServer.TCliente();
            DatosCliente = DataModule.DataService.getCliente( ClienteID);

            
            lblCliente.Text = DatosCliente.RazonSocial;
            lblDomicilio.Text = DatosCliente.Domicilio;
            lblCiudad.Text = DatosCliente.Ciudad;
           // lblCiudad.Text = DatosCliente.Ciudad;
            lblEstado.Text = DatosCliente.Estado;
            lblCP.Text = DatosCliente.CodigoPostal;
            lblStatus.Text = DatosCliente.Estatus;

        }
    }
}