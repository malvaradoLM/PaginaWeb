using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Ejemplo.Clases
{
    public static class Validaciones
    {

        public static string validarFecha(string value)
        {
            string resultado = "";
            if(value != null && value.Trim() != "")
            {
                try
                {
                    DateTime dt = Convert.ToDateTime(value);
                }
                catch (Exception ex)
                {
                    resultado = "Error: Fecha no válida";
                }
            }
            else { resultado = "Error: La fecha esta vacia"; }
            return resultado;
        }
        public static bool validarEmail(string seMailAComprobar)
        {
            String sFormato;
            sFormato = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
            if (Regex.IsMatch(seMailAComprobar, sFormato))
            {
                if (Regex.Replace(seMailAComprobar, sFormato, String.Empty).Length == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }
}