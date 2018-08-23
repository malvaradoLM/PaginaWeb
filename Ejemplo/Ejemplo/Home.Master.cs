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
           // string sesion = Session["GasolineroID"].ToString();
           if(Session["GasolineroID"]== null || DataModule.Seguridad == null || Session["GasolineroID"] == null || DataModule.Seguridad==null)
            {
                Session["Caducada"] = "Sesion Caducada";
                Response.Redirect("loginpage.aspx", true);
            }
        }
    }
}