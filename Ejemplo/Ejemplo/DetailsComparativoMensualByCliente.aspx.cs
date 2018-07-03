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
    public partial class DetailsComparativoMensualByCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                chkBoxList.SelectedIndex = 0;
                txtanio1.Value = DateTime.Now.Year;
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
            Rutinas getReporte = new Rutinas();
            string _ClienteID = DataModule.Seguridad.UserID;
            string _GasolineroID = @Session["GasolineroID"].ToString();
            string ano = txtanio1.Value.ToString();
            string dateFecIni = txtanio1.Value.ToString();
            string dateFecFin = txtanio1.Value.ToString();

            dateFecIni = dateFecIni + "0101000000";
            dateFecFin = dateFecFin + "1231235959";

            string c2 = @"""";

            string ClienteINI = @"@ClienteINI = """;
            string ClienteFIN = @""", @ClienteFIN = """;
            string FechaINI = @""", @FechaINI = """;
            string FechaFIN = @""", @FechaFIN = """;

            string ParametrosReporte = ClienteINI + _ClienteID + ClienteFIN + _ClienteID + FechaINI + dateFecIni + FechaFIN + dateFecFin + c2;
            string ReporteNombre = "COMPARATIVO MENSUAL POR CLIENTE O GRUPO";
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
            if(resultado2.pathFile != "")
            {
                reporteDoc.Src = resultado2.pathFile;
                detallesReporte.Visible = true;
            }
            else
            {
                if(resultado2.errorFile == "")
                {
                    msjAlerta.Visible = true;
                    labelAlerta.Value = "No hay registros que mostrar.";
                }
            }
        }
    }
}