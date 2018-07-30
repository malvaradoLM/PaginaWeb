using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ejemplo
{
    public partial class MenuPrincipal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            setGasolineroID();
        }
        private void setGasolineroID()
        {
            string line;
            string RutaCistemIni = ConfigurationManager.AppSettings["RutaCistemIni"].ToString();
            string path = @RutaCistemIni;
            if (File.Exists(path))
            {
                // Read the file and display it line by line.
                System.IO.StreamReader file =
                   new System.IO.StreamReader(path);

                while ((line = file.ReadLine()) != null)
                {
                    //Console.WriteLine(line);
                    string strLinea = line;

                    if (strLinea.Contains("GasolineroID="))
                    {
                        string[] linea = strLinea.Split('=');
                        Session["GasolineroID"] = linea[1];
                    }
                }
                file.Close();
            }
        }
    }
}