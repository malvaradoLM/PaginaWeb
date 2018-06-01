using Ejemplo.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class principal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           //string Gasolinero;
           // Gasolinero = System.Configuration.ConfigurationManager.AppSettings["Gasolinero"];

            NombreGrupo.Text = System.Configuration.ConfigurationManager.AppSettings["Gasolinero"];
        }
    }
}