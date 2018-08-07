using DevExpress.Web;
using Ejemplo.Clases;
using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using RemObjects.DataAbstract.Server;
using RPSuiteServer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class EnvioInformacion : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                msjAlerta.Visible = false;
                cargarDatos();
            }
            privilegios();
            
        }
        /// <summary>
        /// Deshabilita el boton de guardar si no se tiene permiso de administrador.
        /// </summary>
        private void privilegios()
        {
            if(DataModule.Seguridad.Privileges == null)
            {
                btnProcesar.Visible = false;
            }
        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {

        }
        private void cargarDatos() ///Cargar la informacion de inicio del Usuario en los controles, si no existe registro solo carga el ID del Cliente 
        {
        
            Data.DataModule.ParamByName(Params, "ClienteID", DataModule.Seguridad.UserID);
            spMailCliente ds = new spMailCliente();
            DataModule.FillDataSet(ds, "spCatMailCliente", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spCatMailCliente"];
            IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
            foreach (DataRow dr in query)
            {
                txtConsumo.Text = dr.Field<string>("MailConsumo");
                txtFacturaEmitida.Text = dr.Field<string>("MailFactura");
                txtPagoRealizado.Text = dr.Field<string>("MailRecibo");
            }
            
            txtClienteID.Text = DataModule.Seguridad.UserID.ToString();
        }
        protected void btnProcesar4_Click(object sender, EventArgs e) ///Guarda o modifica un registro dependiendo si ya existe
        {
            if (validar())
            {
                msjAlerta.Visible = false;
                TMailCliente Datos = new TMailCliente();
                Datos.ClienteID = int.Parse(txtClienteID.Value.ToString());
                Datos.MailConsumo = txtConsumo.Value.ToString();
                Datos.MailFactura = txtFacturaEmitida.Value.ToString();
                Datos.MailRecibido = txtPagoRealizado.Value.ToString();

                string resultado = "";
                try
                {
                    resultado = DataModule.DataService.spSendInformation(Datos.ClienteID, Datos.MailConsumo, Datos.MailFactura, Datos.MailRecibido, "");
                    if (resultado != "") throw new Exception(resultado);
                    else
                    {
                        mensaje("Los cambios se han guardado correctamente", "alert alert-success", "Éxito");
                    }


                }
                catch (Exception ex)
                {
                    mensaje(ex.ToString(), "alert alert-danger", "Error");
                }
            }
            else
            {
                mensaje("Algunos campos son inválidos", "alert alert-warning", "Advertencia");
            }
        }
        private void mensaje(string contenido,string tipo,string titulo)
        {
            msjAlerta.Attributes["class"] = tipo;
            labelAlerta.Text = contenido;
            lblTitleMensaje.Text = titulo;
            msjAlerta.Visible = true;
        }

        private bool validar()
        {
            bool result = true;
            if (!txtConsumo.IsValid || !txtFacturaEmitida.IsValid || !txtPagoRealizado.IsValid)
                result = false;
            return result;
        }

    }
}