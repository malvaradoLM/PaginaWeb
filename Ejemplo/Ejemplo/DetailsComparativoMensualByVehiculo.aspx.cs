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
    public partial class DetailsComparativoMensualByVehiculo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                chkBoxList.SelectedIndex = 0;
                detallesReporte.Visible = false;
                txtanio1.Value = DateTime.Now.Year;
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

            //dateFecIni = dateFecIni + "0101000000";
            // dateFecFin = dateFecFin + "1231235959";
            dateFecIni = "2018";
            dateFecFin = "2018";
            string c2 = @"""";

            string ClienteINI = @"@ClienteINI = """;
            string ClienteFIN = @""", @ClienteFIN = """;
            //string FechaINI = @""", @FechaINI = """;
            string FechaINI = @",@EJERCICIO = 2018";
            string Importe = @""", @IMPORTELITROS = ";
            string FechaFIN = @""", @FechaFIN = """;

            string ParametrosReporte = ClienteINI + _ClienteID + ClienteFIN + _ClienteID + Importe + "0" + "" + FechaINI;
            string ReporteNombre = "COMPARATIVO MENSUAL POR CLIENTE Y VEHICULO";
            //string ReporteNombre = "COMPARATIVO MENSUAL POR VEHICULO";
            string TipoArchivo;

            if (chkBoxList.Value.ToString()== "1")
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
                msjAlerta.Visible = false;
                detallesReporte.Visible = true;
                reporteDoc.Src = resultado2.pathFile;
            }
            else
            {
                if(resultado2.errorFile == "")
                {
                    msjAlerta.Visible = true;
                    labelAlerta.Value = "No existen registros que mostrar.";
                }
            }
        }
    }
}