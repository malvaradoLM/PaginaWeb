using Ejemplo.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // NombreGrupo.Text = System.Configuration.ConfigurationManager.AppSettings["Gasolinero"];
           if(DataModule.Seguridad == null)
            {
                Response.Redirect("loginpage.aspx", true);
            }
        }
    }
}