using DevExpress.Web;
using Ejemplo.Clases;
using Ejemplo.Data;
using Ejemplo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class DetailsBitacoraCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFechaInicial.Date = DateTime.Now;
                txtFechaFinal.Date = DateTime.Now;
                chkBoxList.SelectedIndex = 0;
                msjAlerta.Visible = false;
                panelDetalles.Visible = false;
                ASPxSpreadsheet1.WorkDirectory = "~/App_Data/WorkDirectory/ClienteID" + DataModule.Seguridad.UserID;


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
            Rutinas getReporte = new Rutinas();
            string _ClienteID = DataModule.Seguridad.UserID;
            string _GasolineroID = @Session["GasolineroID"].ToString();
            string dateFecIni, dateFecFin;

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
            string ReporteNombre = "BITACORA";
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
            if (resultado2.pathFile != null)
            {
                panelDetalles.Visible = true;
                panelParametros.Collapsed = true;
                if (TipoArchivo == "PDF")
                {
                    reporteDoc.Visible = true;
                    reporteDoc.Src = resultado2.pathFile;
                    ticketName.Value = "documento";
                    ASPxSpreadsheet1.Visible = false;
                }
                else
                {
                    ASPxSpreadsheet1.Visible = true;
                    ASPxSpreadsheet1.Open(Server.MapPath("" + resultado2.pathFile));

                    reporteDoc.Visible = false;
                }
                hiddenURL.Value = resultado2.pathFile;
                ticketName.Value = "documento";

            }
            else
            {
                panelDetalles.Visible = false;
                if (resultado2 != null && resultado2.errorFile == "")
                {
                    msjAlerta.Visible = true;
                    if (resultado2.errorFile == null || resultado2.errorFile == "")
                        labelAlerta.Value = "No existen registros que mostrar";
                    else labelAlerta.Value = "Error: " + resultado2.errorFile;
                }
                else
                {
                    labelAlerta.Value = "Error: " + resultado2.errorFile;
                    msjAlerta.Visible = true;
                }
            }
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
        private void mensajeAlerta(string value)
        {
            msjAlerta.Visible = true;
            labelAlerta.Value = value;
        }
    }
}