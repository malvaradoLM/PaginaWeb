using DevExpress.Web;
using Ejemplo.Clases;
using Ejemplo.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class DetailsFacturaPendienteByPago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                txtFechaCorte.Date = DateTime.Today;
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
            detallesReporte.Visible = true;
            Rutinas getReporte = new Rutinas();
            string _ClienteID = DataModule.Seguridad.UserID;
            string _GasolineroID = @Session["GasolineroID"].ToString();

            var viewModel = new Ejemplo.Models.ComodinModel.modelReportes();
            string fecCorte = txtFechaCorte.Date.ToString("yyyyMMdd");
            string fechaCorte = txtFechaCorte.Date.ToString("yyyyMMdd");

            fechaCorte = fechaCorte + "230000";

            string c2 = @"""";

            string ClienteINI = @"@ClienteINI = """;
            string ClienteFIN = @""", @ClienteFIN = """;
            string FechaCorte = @""", @FechaCorte = """;

            string ParametrosReporte = ClienteINI + _ClienteID + ClienteFIN + _ClienteID + FechaCorte + fechaCorte + c2;

            string ReporteNombre = "ANTIGÜEDAD DE SALDOS";
            string TipoArchivo;

            if (chkBoxList.Value.ToString() == "1")
            {
                detallesReporte.Visible = true;
                TipoArchivo = "PDF";
                //TempData["TipoArchivo"] = "PDF";
            }
            else
            {
                TipoArchivo = "XLS";
                // TempData["TipoArchivo"] = "XLS";
            }

            //GENERA REPORTE
            Ejemplo.Models.ComodinModel.FormatReport resultado2 = getReporte.GetInfoReportes(ReporteNombre, _GasolineroID, ParametrosReporte, TipoArchivo);
            if (resultado2.pathFile != null)
                reporteDoc.Src = resultado2.pathFile;
            else
            {
                detallesReporte.Visible = false;
                if (resultado2.errorFile == "")
                {
                    msjAlerta.Visible = true;
                    labelAlerta.Value = "No existen registros que mostrar";
                }
            }
        }

        protected void txtFechaCorte_Validation(object sender, DevExpress.Web.ValidationEventArgs e)
        {
            ASPxDateEdit txtFecha = (ASPxDateEdit)sender;
            if (txtFecha.Value != null)
                e.ErrorText = Validaciones.validarFecha(txtFecha.Value.ToString());
            else
                e.ErrorText = "Error: La fecha está vacía.";
            if(e.ErrorText != "") e.IsValid = false;
        }
    }
}