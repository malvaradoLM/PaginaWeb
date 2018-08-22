using DevExpress.Web;
using Ejemplo.Clases;
using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using RemObjects.DataAbstract.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class DetailsConsumoByVehiculo : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFechaInicial.Date = DateTime.Now;
                txtFechaFinal.Date = DateTime.Now;
                chkBoxList.SelectedIndex = 0;
                llenarComboBox();
                msjAlerta.Visible = false;
                panelDetalles.Visible = false;
                ASPxSpreadsheet1.WorkDirectory = "~/App_Data/WorkDirectory/ClienteID" + DataModule.Seguridad.UserID;
            }
            llenarComboBox();
            msjAlerta.Visible = false;
        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {

        }
        private void llenarComboBox()
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "ClienteID", DataModule.Seguridad.UserID);
            spVehiculoDS ds = new spVehiculoDS();
            DataModule.FillDataSet(ds, "spVehiculosActivos", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spVehiculosActivos"];
            cmbVehiculoInicial.DataSource = dt;
            cmbVehiculoInicial.DataBind();
            cmbVehiculoFinal.DataSource = dt;
            cmbVehiculoFinal.DataBind();

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reportes.aspx",false);
        }

        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            Rutinas getReporte = new Rutinas();
            msjAlerta.Visible = false;
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
            string TarjetaIni = @""", @TarjetaIni = """;
            string TarjetaFin = @""", @TarjetaFin = """;

            string ParametrosReporte = ClienteINI + _ClienteID + ClienteFIN + _ClienteID + FechaINI + dateFecIni + FechaFIN + dateFecFin + TarjetaIni + Convert.ToInt32(cmbVehiculoInicial.Value.ToString()) + TarjetaFin + Convert.ToInt32(cmbVehiculoFinal.Value.ToString()) + c2;
            string ReporteNombre = "CONSUMOS X TARJETA";
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
            Models.ComodinModel.FormatReport resultado2 = getReporte.GetInfoReportes(ReporteNombre, _GasolineroID, ParametrosReporte, TipoArchivo);
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
                    imprimir.Visible = true;
                }
                else
                {
                    ASPxSpreadsheet1.Visible = true;
                    ASPxSpreadsheet1.Open(Server.MapPath("" + resultado2.pathFile));
                    imprimir.Visible = false;
                    reporteDoc.Visible = false;
                }
                hiddenURL.Value = resultado2.pathFile;
                ticketName.Value = "documento";

            }
            else
            {
                if (resultado2.errorFile == "")
                {
                    panelDetalles.Visible = false;
                    if (Validaciones.AccesoInternet())
                        mensaje("No se encontraron registros", labelCssClases.Advertencia, "Aviso!");
                    else mensaje("Error de conexion, verifique su conexión a internet e intente nuevamente", labelCssClases.Peligro, "Error de Conexión!");

                }
                else
                {
                    mensaje("Ha ocurrido un error interno, el servicio se encuentra detenido; contacte con el administrador", labelCssClases.Peligro, "Error de servicio!");
                    panelDetalles.Visible = false;
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
        private void mensaje(string contenido, string tipo, string titulo)
        {
            msjAlerta.Attributes["class"] = tipo;
            labelAlerta.Text = contenido;
            lblTitleMensaje.Text = titulo;
            msjAlerta.Visible = true;
        }
    }
}