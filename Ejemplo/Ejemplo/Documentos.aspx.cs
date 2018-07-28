using Ejemplo.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class Documentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["path"] != null)
            {
                if(Session["formato"].ToString() == "PDF")
                    cargarPDF(Session["path"].ToString());
                else cargarXLS(Session["path"].ToString());

            }
        }

        private void cargarPDF(string path)
        {
            ASPxSpreadsheet1.Visible = false;
            pdf.Src = path;
            hiddenURL.Value = path;
            ticketName.Value = "ListaConsumosPDF";
            tipoDocumento.Value = ".pdf";
        }
        private void cargarXLS(string path)
        {
            ASPxSpreadsheet1.WorkDirectory = "~/App_Data/WorkDirectory/ClienteID" + DataModule.Seguridad.UserID;
            pdf.Visible = false;
            ASPxSpreadsheet1.Open(Server.MapPath("" + path));
            hiddenURL.Value = path;
            ticketName.Value = "ListaConsumosXLS";
            tipoDocumento.Value = ".xls";
        }
    }
}