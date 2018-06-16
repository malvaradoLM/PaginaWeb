using Ejemplo.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ClienteID = int.Parse(DataModule.Seguridad.UserID);

            RPSuiteServer.TCliente DatosCliente = new RPSuiteServer.TCliente();
            DatosCliente = DataModule.DataService.getCliente(ClienteID);
            double limiteCredito = DatosCliente.LimiteCredito;
            double saldoDisponible = DatosCliente.Saldo;
            double saldoDeudor = limiteCredito - saldoDisponible;
            lblLimiteCredito.Text = DatosCliente.LimiteCredito.ToString("C");
            lblSaldoDisponible.Text = DatosCliente.LimiteCredito.ToString("C");
            lblSaldoDeudor.Text = saldoDeudor.ToString("C");
        } 
    }
}