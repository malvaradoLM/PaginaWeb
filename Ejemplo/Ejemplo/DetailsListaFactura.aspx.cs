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
    public partial class DetailsListaFactura : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                msjAlerta.Visible = false;
            }
            cargarListaFactura(Convert.ToInt32(DataModule.Seguridad.UserID));

        }
        private void cargarListaFactura(int ClienteID)
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "ClienteID", ClienteID);
            spFacturaCliente ds = new spFacturaCliente();
            DataModule.FillDataSet(ds, "spFacturaCliente", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spFacturaCliente"];
            IEnumerable<DataRow> queryenum = from dts in dt.AsEnumerable() select dts;
            foreach (DataRow dr in queryenum)
            {
                double Subtotal =  dr.Field<double>("Subtotal");
            }
            if (dt != null){
                bgvListaFactura.DataSource = dt;
                bgvListaFactura.DataBind();
                 }

        }

        protected void button1_Click(object sender, EventArgs e)
        {
            string serie, folio;
            serie = bgvListaFactura.GetRowValues(int.Parse(bgvListaFactura.FocusedRowIndex.ToString()), "Serie").ToString();
            folio = bgvListaFactura.GetRowValues(int.Parse(bgvListaFactura.FocusedRowIndex.ToString()), "Folio").ToString();
            Session["Serie"] = serie;
            Session["Folio"] = folio;
            Response.Redirect("DetailsDescargaFactura.aspx", false);
        }
    }
}