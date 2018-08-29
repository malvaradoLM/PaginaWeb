using Facturacion.DataSets;
using LibraryAdministracion;
using RemObjects.DataAbstract.Server;
using RPSuiteServer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ejemplo.Data;
using System.Data;
using DevExpress.Web;

namespace Facturacion
{
    public partial class _Default : Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarCfdi(13);
        }

        protected void btnProcesar4_Click(object sender, EventArgs e)
        {
            if (codigoTicket.IsValid)
            {
                TValidaTicketEnLinea ticket = new TValidaTicketEnLinea();
                ticket = RPSuiteServer.RPServer.RPAdmin.ValidaTicketWEB(codigoTicket.Text);
            }
        }
        private void cargarCfdi(int longitudRfc)
        {

            cmbCFDI.Items.Add(new ListEditItem { Value = "G01", Text = "Adquisición de mercancias" });
            cmbCFDI.Items.Add(new ListEditItem { Value = "G02", Text = "Devoluciones, descuentos o bonificaciones" });
            cmbCFDI.Items.Add(new ListEditItem { Value = "G03", Text = "Gastos en general" });
            cmbCFDI.Items.Add(new ListEditItem { Value = "I01", Text = "Construcciones" });
            cmbCFDI.Items.Add(new ListEditItem { Value = "I02", Text = "Mobiliario y equipo de oficina para inversiones" });
            cmbCFDI.Items.Add(new ListEditItem { Value = "I03", Text = "Equipo de transporte" });
            cmbCFDI.Items.Add(new ListEditItem { Value = "I04", Text = "Equipo de computo y accesorios" });
            cmbCFDI.Items.Add(new ListEditItem { Value = "I05", Text = "Dados, troqueles, moldes, matrices y herramientas" });
            cmbCFDI.Items.Add(new ListEditItem { Value = "I06", Text = "Comunicaciones telefónicas" });
            cmbCFDI.Items.Add(new ListEditItem { Value = "I07", Text = "Comunicaciones satelitales" });
            cmbCFDI.Items.Add(new ListEditItem { Value = "I08", Text = "Otra maquinaria y equipo" });
            if(longitudRfc == 13)
            {
                cmbCFDI.Items.Add(new ListEditItem { Value = "D01", Text = "Honorarios médicos, dentales y gastos hospitalarios" });
                cmbCFDI.Items.Add(new ListEditItem { Value = "D02", Text = "Gastos médicos por incapacidad o discapacidad" });
                cmbCFDI.Items.Add(new ListEditItem { Value = "D03", Text = "Gastos funerales" });
                cmbCFDI.Items.Add(new ListEditItem { Value = "D04", Text = "Donativos" });
                cmbCFDI.Items.Add(new ListEditItem { Value = "D05", Text = "Intereses reales efectivamente pagados por créditos hipotecarios (casa habitación)" });
                cmbCFDI.Items.Add(new ListEditItem { Value = "D06", Text = "Aportaciones voluntarias al SAR" });
                cmbCFDI.Items.Add(new ListEditItem { Value = "D07", Text = "Primas por seguros de gastos médicos" });
                cmbCFDI.Items.Add(new ListEditItem { Value = "D08", Text = "Gastos de transportación escolar obligatoria" });
                cmbCFDI.Items.Add(new ListEditItem { Value = "D09", Text = "Depósitos en cuentas para el ahorro, primas que tengan como base planes de pensiones" });
                cmbCFDI.Items.Add(new ListEditItem { Value = "D10", Text = "Pagos por servicios educativos (colegiaturas)" });
            }
            cmbCFDI.Items.Add(new ListEditItem { Value = "P01", Text = "Por definir" });
            cmbCFDI.DataBind();
           
        }
    }
}