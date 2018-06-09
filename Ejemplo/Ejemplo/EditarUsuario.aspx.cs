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
   
    public partial class EditarUsuario : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "Datos", Session["UsuarioWebID"]);
            spUsuarioWeb ds = new spUsuarioWeb();
             DataModule.FillDataSet(ds, "spCatUsuarioWeb", Params.ToArray());
            DataTable dt = new DataTable();
             dt = ds.Tables["spCatUsuarioWeb"];
            IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;

            foreach (DataRow dr in query)
            {
                txtNombre.Text = dr.Field<string>("Nombre");
                txtUsuario.Text = dr.Field<string>("Usuario");
                txtClave.Text = dr.Field<string>("Clave");

            }


        }
    }
}