﻿using DevExpress.Utils.MVVM.Services;
using DevExpress.Web;
using DevExpress.Web.Bootstrap;
using Ejemplo.Data;
using Ejemplo.Data.Dataset;
using RemObjects.DataAbstract.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Ejemplo
{
    public partial class VehiculoPage : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "ClienteID", DataModule.Seguridad.UserID);
            spVehiculoDS ds = new spVehiculoDS();
            DataModule.FillDataSet(ds, "spVehiculo", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spVehiculo"];
            bgvVehiculo.DataSource = dt;
            bgvVehiculo.DataBind();

        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {

        }
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            FindControlPage();
        }
        private void FindControlPage()
        {
            try
            {  
               Session["VehiculoID"] = bgvVehiculo.GetRowValues(int.Parse(bgvVehiculo.FocusedRowIndex.ToString()), "VehiculoID").ToString();
                Response.Redirect("Vehiculos.aspx",false);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }
    }
}