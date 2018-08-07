using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Ejemplo.Models
{
    public class ComodinModel
    {

        public class Login
        {
            [Required(ErrorMessage = "El campo usuario es requerido.")]
            [Display(Name = "Nombre del Usuario")]
            public string Usuario { get; set; }

            [Required(ErrorMessage = "El campo contraseňa es requerido.")]
            [DataType(DataType.Password)]
            [Display(Name = "Password")]
            public string Clave { get; set; }
            public string ImgLogotipo { get; set; }
            public string ActivarUsuario { get; set; }
        }
        /*
        public class SaldoCliente : TSaldoCliente
        {
            [Required(ErrorMessage = "El ejercicio es requerido")]
            [DataType(DataType.Text)]
            [Display(Name = "Ejercicio")]
            public string Ejercicio { get; set; }

            [Required(ErrorMessage = "El periodo es requerido")]
            [Display(Name = "Periodo")]
            public string MyPeriodoID { get; set; }
        }
        */
        public class SendInformation
        {
            public int ClienteID { get; set; }

            [DataType(DataType.EmailAddress)]
            [Display(Name = "Email de factura emitida")]
            [RegularExpression(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$", ErrorMessage = "El campo email no es valido, Por favor de entrada a un email valido!")]
            //[Required(ErrorMessage = "El campo Email de consumo es requerido.")]
            public string emailConsumo { get; set; }

            [DataType(DataType.EmailAddress)]
            [Display(Name = "Email del factura emitida")]
            [RegularExpression(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$", ErrorMessage = "El campo email no es valido, Por favor de entrada a un email valido!")]
            //[Required(ErrorMessage = "El campo Email de factura emitida es requerido.")]
            public string emailFacturaEmitida { get; set; }

            [DataType(DataType.EmailAddress)]
            [Display(Name = "Email de pago realizado")]
            [RegularExpression(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$", ErrorMessage = "El campo email no es valido, Por favor de entrada a un email valido!")]
            //[Required(ErrorMessage = "El campo Email de pago realizado es requerido.")]
            public string emailPagoRealizado { get; set; }
            public bool banderaConsumo { get; set; }
            public bool banderaFactura { get; set; }
            public bool banderaPago { get; set; }
        }
        public class UsuarioWeb
        {
            public int ClienteID { get; set; }
            public string UsuarioWebID { get; set; }

            [DataType(DataType.Text)]
            [Required(ErrorMessage = "El campo nombre es requerido.")]
            [Display(Name = "Nombre completo del Usuario")]
            public string Nombre { get; set; }

            [DataType(DataType.Text)]
            [Required(ErrorMessage = "El campo usuario es requerido.")]
            [Display(Name = "Nombre del campo usuario")]
            public string Usuario { get; set; }

            [DataType(DataType.Password)]
            [Required(ErrorMessage = "El campo clave es requerido.")]
            [Display(Name = "Clave")]
            public string Clave { get; set; }

            [Display(Name = "Permiso de Administrador")]
            public bool Administrador { get; set; }
        }
        public class activarVehiculos
        {
            [Display(Name = "Campo Activar/Desactivar Vehiculos")]
            public bool Activar { get; set; }
        }

        /*
        public class Vehiculo : TInfoCliente
        {
            public int VehiculoID { get; set; }
            public int DigitoSeguridad { get; set; }
            public string Nombre_ { get; set; }
            public string Identificacion { get; set; }
            public string Departamento { get; set; }
            public string CuentaContable { get; set; }
            public string CentroCostos { get; set; }
            public string NumeroEconomico { get; set; }

            [Required(ErrorMessage = "El NIP es requerido.")]
            [DataType(DataType.Text)]
            [Display(Name = "Nip")]
            public string NIP { get; set; }

            [Required(ErrorMessage = "El campo estatus es requerido.")]
            [Display(Name = "Estatus")]
            public string EstatusID { get; set; }

            [Required(ErrorMessage = "El campo cargas maximas es requerido.")]
            //[Range(0, int.MaxValue, ErrorMessage = "Por favor de entrada a un numero entero valido.")]
            [RegularExpression("([0-9]+)", ErrorMessage = "Por favor de entrada un numero valido.")]
            [Display(Name = "Cargas Maximas")]
            public int CargasMaximas { get; set; }
            public bool Odometro { get; set; }
            public bool Firma { get; set; }
            public bool Placas { get; set; }

            [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
            public DateTime FechaAlta { get; set; }

            [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
            public DateTime FechaExpira { get; set; }

            [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
            public DateTime FechaBaja { get; set; }

            [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
            public DateTime FechaCancelacion { get; set; }

            [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
            public DateTime FechaBloqueada { get; set; }

            [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
            public DateTime FechaInactiva { get; set; }

            public string Mensaje { get; set; }

            [Required(ErrorMessage = "El campo Volumen Acumulado Asignado es requerido.")]
            [Range(0, float.MaxValue, ErrorMessage = "Por favor de entrada a un numero decimal valido.")]
            [Display(Name = "LimiteLTTurno")]
            public float LimiteLTTurno { get; set; }

            [Required(ErrorMessage = "El campo Volumen Diario Asignado es requerido.")]
            [Range(0, float.MaxValue, ErrorMessage = "Por favor de entrada a un numero decimal valido.")]
            [Display(Name = "LimiteLTDia")]
            public float LimiteLTDia { get; set; }

            [Required(ErrorMessage = "El campo Volumen Semanal Asignado es requerido.")]
            [Range(0, float.MaxValue, ErrorMessage = "Por favor de entrada a un numero decimal valido.")]
            [Display(Name = "LimiteLTSemana")]
            public float LimiteLTSemana { get; set; }

            [Required(ErrorMessage = "El campo Volumen Mensual Asignado es requerido.")]
            [Range(0, float.MaxValue, ErrorMessage = "Por favor de entrada a un numero decimal valido.")]
            [Display(Name = "LimiteLTMes")]
            public float LimiteLTMes { get; set; }

            [Required(ErrorMessage = "El campo Importe Acumulado Asignado es requerido.")]
            [Range(0, float.MaxValue, ErrorMessage = "Por favor de entrada a un numero decimal valido.")]
            [Display(Name = "LimiteMNTurno")]
            public float LimiteMNTurno { get; set; }

            [Required(ErrorMessage = "El campo Importe Diario  Asignado es requerido.")]
            [Range(0, float.MaxValue, ErrorMessage = "Por favor de entrada a un numero decimal valido.")]
            [Display(Name = "LimiteMNDia")]
            public float LimiteMNDia { get; set; }

            [Required(ErrorMessage = "El campo Importe Semanal Asignado es requerido.")]
            [Range(0, float.MaxValue, ErrorMessage = "Por favor de entrada a un numero decimal valido.")]
            [Display(Name = "LimiteMNSemana")]
            public float LimiteMNSemana { get; set; }
            [Required(ErrorMessage = "El campo Importe Mensual Asignado es requerido.")]
            [Range(0, float.MaxValue, ErrorMessage = "Por favor de entrada a un numero decimal valido.")]
            [Display(Name = "LimiteMNMes")]
            public float LimiteMNMes { get; set; }

            [Display(Name = "ActualLTTurno")]
            public decimal ActualLTTurno { get; set; }

            [Display(Name = "ActualLTDia")]
            public decimal ActualLTDia { get; set; }

            [Display(Name = "ActualLTSemana")]
            public decimal ActualLTSemana { get; set; }

            [Display(Name = "ActualLTMes")]
            public decimal ActualLTMes { get; set; }

            [Display(Name = "ActualMNTurno")]
            public decimal ActualMNTurno { get; set; }

            [Display(Name = "ActualMNDia")]
            public decimal ActualMNDia { get; set; }

            [Display(Name = "ActualMNSemana")]
            public decimal ActualMNSemana { get; set; }

            [Display(Name = "ActualMNMes")]
            public decimal ActualMNMes { get; set; }

            public int ActualCargas { get; set; }
            public string Clasificacion { get; set; }
            public bool Generada { get; set; }
            public string Lunes { get; set; }
            public string Martes { get; set; }
            public string Miercoles { get; set; }
            public string Jueves { get; set; }
            public string Viernes { get; set; }
            public string Sabado { get; set; }
            public string Domingo { get; set; }
            public int ClienteID_ { get; set; }
            public int GasolineroID { get; set; }
            public string ProductoAutorizado { get; set; }
            public bool IngresarDirecto { get; set; }

            //[Required(ErrorMessage = "El campo estacion es requerido.")]
            [Display(Name = "Estacion")]
            public string EstacionID { get; set; }

            [Display(Name = "AnteriorLTDia")]
            public decimal AnteriorLTDia { get; set; }

            [Display(Name = "AnteriorLTSemana")]
            public decimal AnteriorLTSemana { get; set; }

            [Display(Name = "AnteriorLTMes")]
            public decimal AnteriorLTMes { get; set; }

            [Display(Name = "AnteriorMNDia")]
            public decimal AnteriorMNDia { get; set; }

            [Display(Name = "AnteriorMNSemana")]
            public decimal AnteriorMNSemana { get; set; }

            [Display(Name = "AnteriorMNMes")]
            public decimal AnteriorMNMes { get; set; }

            public string PlacasNumero { get; set; }
            public string Fotos { get; set; }
        }
        */
        public class modelDates
        {
            [Display(Name = "Fecha Inicial")]
            [Required(ErrorMessage = "El campo fecha inicial es requerido!")]
            [DataType(DataType.Date)]
            [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd-MM-yyyy}")]
            public DateTime fecIni { get; set; }

            [Display(Name = "Fecha Final")]
            [Required(ErrorMessage = "El campo fecha final es requerido!")]
            [DataType(DataType.Date)]
            [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd-MM-yyyy}")]
            public DateTime fecFin { get; set; }

            [Required(ErrorMessage = "El campo formato es requerido!")]
            [Display(Name = "Formato del reporte")]
            public string ID { get; set; }
            public string Type { get; set; }
        }
        public class FormatReport
        {
            [Required(ErrorMessage = "El campo formato de reporte es requerido.")]
            [Display(Name = "Formato del reporte")]
            public string ID { get; set; }

            public string Type { get; set; }
            public string pathFile { get; set; }
            public string errorFile { get; set; }

            [Display(Name = "Fecha Corte")]
            [Required(ErrorMessage = "El campo fecha de corte es requerido.")]
            [DataType(DataType.Date)]
            [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd-MM-yyyy}")]
            public DateTime fecCorte { get; set; }
            public string typeDevices { get; set; }
        }
        public class ConsumoByFecha : modelDates
        {
            //[Required(ErrorMessage = "El campo formato es requerido.")]
            //[Display(Name = "Formato del reporte")]
            //public string ID { get; set; }
            //public string Type { get; set; }
            public string pathFile { get; set; }
            public string errorFile { get; set; }
            public string typeDevices { get; set; }
        }
        public class ConsumoByVehiculo : ConsumoByFecha
        {
            [Required(ErrorMessage = "El campo vehiculo inicial es requerido.")]
            [Display(Name = "Vehiculo Inicial")]
            public string IDVehiculoInicial { get; set; }
            public string VehiculoInicial { get; set; }

            [Required(ErrorMessage = "El campo vehiculo final es requerido.")]
            [Display(Name = "Vehiculo Final")]
            public string IDVehiculoFinal { get; set; }
            public string VehiculoFinal { get; set; }
        }
        public class ComparativoMensualByCte
        {
            [Range(0, int.MaxValue, ErrorMessage = "Por favor de entrada a un numero de tipo entero.")]
            [Required(ErrorMessage = "El campo Año es requerido.")]
            [Display(Name = "Año")]
            public string Ano { get; set; }
            [Required(ErrorMessage = "El campo formato es requerido.")]
            [Display(Name = "Formato del reporte")]
            public string ID { get; set; }
            public string Type { get; set; }
            public string pathFile { get; set; }
            public string errorFile { get; set; }
            public string typeDevices { get; set; }
        }
        public class ConsumoFiltroByDpto : ConsumoByFecha
        {
            //[Required(ErrorMessage = "El campo departamento es requerido.")]
            [Display(Name = "Departamento")]
            [StringLength(20)]
            public string Departamento { get; set; }
        }
        public class resultChartConsumosMes
        {
            public string Mes { get; set; }
            public string Producto { get; set; }
            public Decimal Importe { get; set; }
        }
        public class resultChartConsumos
        {
            public string Producto { get; set; }
            public int TotConsumo { get; set; }
        }
        public class TableroPrincipal
        {
            public decimal? limiteCredito { get; set; }
            public decimal? saldoDisponible { get; set; }
            public decimal? Saldo { get; set; }
            public string facturaVencer { get; set; }
        }
        public class ImagesCarrucel
        {
            public int ID { get; set; }
            public string Ruta { get; set; }
            public string Url { get; set; }
            public string Button { get; set; }
            public string Message1 { get; set; }
            public string Message2 { get; set; }
        }
        /*
        public class findEstacion
        {
            public int ID { get; set; }
            public string IDEstado { get; set; }
            public IEnumerable<SelectListItem> Estado { get; set; }
            public string CveMunicipio { get; set; }
            public IEnumerable<SelectListItem> Municipio { get; set; }
        }
        */
        public class InfoEstacion
        {
            public int ID { get; set; }
            public string IDEstacion { get; set; }
            public string IDEstado { get; set; }
            public string DescEstado { get; set; }
            public string CveMunicipio { get; set; }
            public string DescMunicipio { get; set; }
            public string RazonSocial { get; set; }
            public string DescEstacion { get; set; }
            public string Latitud { get; set; }
            public string Longitud { get; set; }
            public string Direccion { get; set; }
            public string Numero { get; set; }
            public string Colonia { get; set; }
            public string CP { get; set; }
            public string Telefono { get; set; }
            public string Contacto { get; set; }
            public string Horario { get; set; }
            public string ProductoGasolinaMagna { get; set; }
            public string ProductoGasolinaPremium { get; set; }
            public string ProductoDiesel { get; set; }
            public string ServicioEstacionamiento { get; set; }
            public string ServicioSanitarios { get; set; }
            public string ServicioTarjetaBancaria { get; set; }
            public string ServicioTienda { get; set; }
            public string ServicioSeguridad { get; set; }
            public string Servicio24Hrs { get; set; }
        }
        public class Estado
        {
            public int? Id { get; set; }
            public string Descripcion { get; set; }
        }
        public class Municipio
        {
            public int? Id { get; set; }
            public int? IdEstado { get; set; }
            public string Clave { get; set; }
            public string Descripcion { get; set; }
        }
        public class CantidadEstaciones
        {
            public string IdEstado { get; set; }
            public int? Cantidad { get; set; }
            public string Descripcion { get; set; }
        }
        public class modelReportes
        {
            public FormatReport FormatoReporte { get; set; }
            public IEnumerable<FormatReport> tipoFormato { get; set; }
            public ConsumoByFecha InfoConsumoByFecha { get; set; }
            public IEnumerable<ConsumoByFecha> tipoFormatoConsumoByFecha { get; set; }

            public ConsumoByFecha InfoConsumoByGrupo { get; set; }
            public IEnumerable<ConsumoByFecha> tipoFormatoConsumoByGrupo { get; set; }

            public ConsumoByVehiculo InfoConsumoByVehiculo { get; set; }
            public IEnumerable<ConsumoByVehiculo> tipoFormatoConsumoByVehiculo { get; set; }
            public ConsumoByFecha InfoConsumoByEstacion { get; set; }
            public IEnumerable<ConsumoByFecha> tipoFormatoConsumoByEstacion { get; set; }
            public ComparativoMensualByCte InfoComparativoMensualByCte { get; set; }
            public IEnumerable<ComparativoMensualByCte> tipoFormatoComparativoMensualByCte { get; set; }
            public ComparativoMensualByCte InfoComparativoMensualByVehiculo { get; set; }
            public IEnumerable<ComparativoMensualByCte> tipoFormatoComparativoMensualByVehiculo { get; set; }
            public ConsumoByFecha InfoConcilicionConsumoByCte { get; set; }
            public IEnumerable<ConsumoByFecha> tipoFormatoConciliacionConsumoByCte { get; set; }
            public ConsumoByFecha InfoConsumoByProducto { get; set; }
            public IEnumerable<ConsumoByFecha> tipoFormatoConsumoByProducto { get; set; }
            public ConsumoByFecha InfoConsumoByDpto { get; set; }
            public IEnumerable<ConsumoByFecha> tipoFormatoConsumoByDpto { get; set; }
            public ConsumoByFecha InfoConsumoEspecial { get; set; }
            public IEnumerable<ConsumoByFecha> tipoFormatoConsumoEspecial { get; set; }
            public ConsumoFiltroByDpto InfoFiltroDpto { get; set; }
            public IEnumerable<ConsumoFiltroByDpto> tipoFormatoFiltroDpto { get; set; }
            public ConsumoByFecha InfoBitacoraCliente { get; set; }
            public IEnumerable<ConsumoByFecha> tipoFormatoBitacoraCliente { get; set; }
        }
        public class BigViewModel
        {
         //   public SaldoCliente Cliente { get; set; }
         //   public IEnumerable<TSaldoCliente> SaldoCliente { get; set; }
         //   public IEnumerable<TFacturaCliente> FacturaCliente { get; set; }

        //    public TFacturaCliente ClienteFactura { get; set; }

         //   public TConsumo DetailsConsumo { get; set; }
         //   public IEnumerable<TAlbum> DetailsConsumoFotografias { get; set; }
           // public IEnumerable<TConsumo> ConsumoFactura { get; set; }
            public modelDates rptAnalisisConsumo { get; set; }
            public IEnumerable<modelDates> tipoFormatoAnalisisConsumo { get; set; }

          //  public TSaldoCliente TSaldoCliente { get; set; }
            public SendInformation sendInformacion { get; set; }
            public UsuarioWeb UsuarioWeb { get; set; }
            //public Vehiculo Vehiculo { get; set; }

            // Informacion de la vista Inicio
            public IEnumerable<ImagesCarrucel> imgCarrucel { get; set; }
            public TableroPrincipal infoTablePrincipal { get; set; }
            public List<resultChartConsumosMes> consumoByMes { get; set; }
            public List<resultChartConsumos> consumoByProducto { get; set; }

            // Informacion de busqueda por Estacion
           // public findEstacion infoEstacion { get; set; }
            public IEnumerable<InfoEstacion> Estacion { get; set; }
            public List<CantidadEstaciones> InfoCantidadEstaciones { get; set; }
            //public List<object> InfoCantidadEstados2 { get; set; }
            //public IEnumerable<CantidadEstaciones> InfoCantidadEstados { get; set; }

            // Informacion Grids de Vehiculos
            public activarVehiculos ActivarVehiculos { get; set; }
            public IEnumerable<RPSuiteServer.TVehiculo> InfoVehiculos { get; set; }
            public class pathFile
            {
                public string pathPDF { get; set; }
                public string pathXML { get; set; }

                public string errorFile { get; set; }
            }
            public class pathConsumoFactura
            {
                public string pathImpresion { get; set; }
                public string ImpresionError { get; set; }
            }
            public class resultChartConsumosMes
            {
                public string Mes { get; set; }
                public string Producto { get; set; }
                public Decimal Importe { get; set; }
            }
        }
    }
}