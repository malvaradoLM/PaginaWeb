using DevExpress.Web;
using Ejemplo.Clases;
using Ejemplo.Data;
using Ejemplo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class DetailsConsumoByProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFechaInicial.Date = DateTime.Now;
                txtFechaFinal.Date = DateTime.Now;
                chkBoxList.SelectedIndex = 0;
                detallesReporte.Visible = false;
                msjAlerta.Visible = false;

            }
        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reportes.aspx", false);
        }

        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            msjAlerta.Visible = false;
            Rutinas getReporte = new Rutinas();
            string _ClienteID = DataModule.Seguridad.UserID;
            string _GasolineroID = @Session["GasolineroID"].ToString();

            string dateFecIni, dateFecFin;

            string dateFechaIni = txtFechaInicial.Date.ToString("yyyyMMdd");
            string dateFechaFin = txtFechaFinal.Date.ToString("yyyyMMdd");

            dateFecIni = txtFechaInicial.Date.ToString("yyyyMMdd");
            dateFecFin = txtFechaFinal.Date.ToString("yyyyMMdd");

            dateFecIni = dateFecIni + "000000";
            dateFecFin = dateFecFin + "230000";

            string c2 = @"""";

            string ClienteINI = @"@ClienteINI = """;
            string ClienteFIN = @""", @ClienteFIN = """;
            string FechaINI = @""", @FechaINI = """;
            string FechaFIN = @""", @FechaFIN = """;

            string ParametrosReporte = ClienteINI + _ClienteID + ClienteFIN + _ClienteID + FechaINI + dateFecIni + FechaFIN + dateFecFin + c2;

            string ReporteNombre = "CONSUMOS X PRODUCTO";
            string TipoArchivo;

            if (chkBoxList.Value.ToString() == "1")
            {
                TipoArchivo = "PDF";
            }
            else
            {
                TipoArchivo = "XLS";
            }

            //GENERA REPORTE
            ComodinModel.FormatReport resultado2 = getReporte.GetInfoReportes(ReporteNombre, _GasolineroID, ParametrosReporte, TipoArchivo);
            if(resultado2.pathFile != null && resultado2.pathFile != "")
            {
                 detallesReporte.Visible = true;
                reporteDoc.Src = resultado2.pathFile;
            }
            else
            {
                if(resultado2.errorFile == "")
                {
                    msjAlerta.Visible = true;
                    labelAlerta.Value = "No existen registros que mostrar";
                }
            }
        }

        protected void txtFechaInicial_Validation(object sender, DevExpress.Web.ValidationEventArgs e)
        {
            ASPxDateEdit txtFecha = (ASPxDateEdit)sender;
            if (txtFecha.Value != null)
                e.ErrorText = Validaciones.validarFecha(txtFecha.Value.ToString());
            else
                e.ErrorText = "Error: La fecha está vacía.";
            if (txtFechaInicial.Date > txtFechaFinal.Date) e.ErrorText = "Error: La Fecha Inicial no puede ser mayor a la Fecha Final";
            if (e.ErrorText != "") e.IsValid = false;
        }

        protected void txtFechaFinal_Validation(object sender, DevExpress.Web.ValidationEventArgs e)
        {
            ASPxDateEdit txtFecha = (ASPxDateEdit)sender;
            if (txtFecha.Value != null)
                e.ErrorText = Validaciones.validarFecha(txtFecha.Value.ToString());
            else
                e.ErrorText = "Error: La fecha está vacía.";
            if (txtFechaInicial.Date > txtFechaFinal.Date) e.ErrorText = "Error: La Fecha Inicial no puede ser mayor a la Fecha Final";
            if (e.ErrorText != "") e.IsValid = false;
        }
    }
}