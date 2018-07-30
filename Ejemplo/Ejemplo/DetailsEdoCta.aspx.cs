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
    public partial class DetailsEdoCta : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                llenarComboEjercicio();
                cmbPeriodo.SelectedIndex = DateTime.Now.Month - 1;
                panelDetalles.Visible = false;
                msjAlerta.Visible = false;
            }
            else cargar();
        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {

        }
        private void llenarComboEjercicio()
        {
             for(int i = 0; i < 5; i++)
            {
                bool selected = false;
                if (i == 0) selected = true;
                cmbEjercicio.Items.Add(new DevExpress.Web.ListEditItem { Value=DateTime.Now.Year - i, Text = (DateTime.Now.Year - i).ToString(),Selected=selected });
            }
        }

        protected void btnCancelar4_Click(object sender, EventArgs e)
        {
            Response.Redirect("DatosCliente.aspx", false);
        }

        protected void btnProcesar4_Click(object sender, EventArgs e)
        {
            cargar();
        }
        
        private void cargar()
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "ClienteID", DataModule.Seguridad.UserID);
            Data.DataModule.ParamByName(Params, "Periodo", cmbPeriodo.Value);
            Data.DataModule.ParamByName(Params, "Ejercicio", cmbEjercicio.Value);
            spEstadoCuenta ds = new spEstadoCuenta();
            DataModule.FillDataSet(ds, "spSaldoCliente", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spSaldoCliente"];
            if (dt.Rows.Count > 0)
            {
                msjAlerta.Visible = false;
                panelDetalles.Visible = true;
                bgvEstadoCuenta.DataSource = calcularSaldos(dt);
                bgvEstadoCuenta.DataBind();
                panelParametros.Collapsed = true;
            }
            else
            {
                msjAlerta.InnerText = "No se encontraron registros";
                msjAlerta.Visible = true;
            }
        }
        private DataTable calcularSaldos(DataTable dt)
        {
            double saldo = 0;
            foreach (DataRow row in dt.Rows)
            {
                saldo += Double.Parse(row["Cargo"].ToString());
                saldo -= Double.Parse(row["Abono"].ToString());
                row["Saldo"] = saldo.ToString();
            }

            return dt;
        }
    }
}