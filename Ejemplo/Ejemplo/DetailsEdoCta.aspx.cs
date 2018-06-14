using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class DetailsEdoCta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {

        }
        private void llenarComboEjercicio()
        {
             for(int i = 1; i < 14; i++)
            {
                cmbEjercicio.Items.Add(i.ToString());
            }
        }
    }
}