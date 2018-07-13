<%@ Page Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="Ejemplo.Reportes" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style type="text/css">
.rojo{background:#F44336;}
.azul{background:#2196F3;}
.amarillo{background:#FFC107;}
.verde_claro{background:#4CAF50;}
.anaranjado{background:#FF5722;}
.morado{background:#673AB7;}
.cyan{background:#00BCD4;}
.verdeDash{background:#009688;}
.grisClaro{background:#D3D3D3;}
.verde{background:#4CAF50;}
.verdeFourence{background:#05D640;}
.blueLight{background:#00BCD4;}
.ico::after{
    content: '';
    display: block;
    height:100px;
    width:100px;
    text-align:center;
      /*background */
      font-size-adjust:0.50;
    background: url(ico.png) no-repeat 0px 0px;
}
.linkclass
{
    margin-left: 33%;
    margin-top: 7%;
    fill:white;
}
</style>
    <link href="css/StylePage1.css" rel="stylesheet">
    <div class="container-fluid">
    <div class="row">
        <div class="col-lg-8 col-md-8">
            <div class="Cards-Titulo HexColor-3"><h2>REPORTES</h2></div>
        </div>
    </div>  

    <hr>

    <div class="row">
        <div class="col-lg-2">
            <a href="DetailsAnalisisConsumo.aspx" id="btnAnalisisConsumo1" class="Largo rojo">
                <asp:Image ID="Image1" runat="server" ImageUrl="\Icons\png\80px\large\report-money-coins.png" CssClass="linkclass" />
                <h2-largo>ANALISIS DE CONSUMO</h2-largo>
            </a>
        </div>
        <div class="col-lg-2">
            <a href="DetailsFacturaPendienteByPago.aspx" id="btnFactPendientePago1" class="Largo anaranjado">
              <asp:Image ID="Image2" runat="server" ImageUrl="\Icons\png\80px\large\bill-pin.png" CssClass="linkclass" />
                <h2-largo>FACTURAS PENDIENTES DE PAGO</h2-largo>
            </a>
        </div>
        <div class="col-lg-2">
            <a href="DetailsConsumoByFecha.aspx" id="btnConsumoPorFecha1" class="Largo grisClaro">
                 <asp:Image ID="Image3" runat="server" ImageUrl="\Icons\png\80px\large\calendar-list.png" CssClass="linkclass" />
                <h2-largo>CONSUMO POR FECHA</h2-largo>
            </a>
        </div>
        <div class="col-lg-2">
            <a href="DetailsConsumoByVehiculo.aspx" id="btnConsumoPorVehiculo1" class="Largo verdeAzuloso">
            <asp:Image ID="Image4" runat="server" ImageUrl="\Icons\png\80px\large\delivery-list.png" CssClass="linkclass" />
                <h2-largo>CONSUMO POR VEHICULO</h2-largo>
            </a>
        </div>
        <div class="col-lg-2">
            <a href="DetailsConsumoByEstacion.aspx" id="btnConsumoPorEstacion1" class="Largo verde">
             <asp:Image ID="Image5" runat="server" ImageUrl="\Icons\png\80px\local-gas-station-payment.png" CssClass="linkclass" />
                <h2-largo>CONSUMO POR ESTACION</h2-largo>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-2">
            <a href="DetailsComparativoMensualByCliente.aspx" id="btnComparativoMensulaCte" class="Largo morado">
                <asp:Image ID="Image6" runat="server" ImageUrl="\Icons\png\80px\calendar-customer.png" CssClass="linkclass" />
                <h2-largo>COMPARATIVO MENSUAL POR CLIENTE</h2-largo>
            </a>
        </div>
        <div class="col-lg-2">
            <a href="DetailsComparativoMensualByVehiculo.aspx" id="btnComparativoMensulaVehiculo" class="Largo verdeFourence">
                <asp:Image ID="Image7" runat="server" ImageUrl="\Icons\png\80px\large\vehicle-van-side-time.png" CssClass="linkclass" />
                <h2-largo>COMPARATIVO MENSUAL POR VEHICULO</h2-largo>
            </a>
        </div>
        <div class="col-lg-2">
            <a href="DetailsConciliacionConsumoByCte.aspx" id="btnConsiliacionConsumoCte" class="Largo amarillo">
                <asp:Image ID="Image8" runat="server" ImageUrl="\Icons\png\80px\large\bill-credit-card-down.png" CssClass="linkclass" />
                <h2-largo>CONCILIACION DE CONSUMOS POR CLIENTE</h2-largo>
            </a>
        </div>
        <div class="col-lg-2">
            <a href="DetailsConsumoByProducto.aspx" id="btnConsumoPorProducto" class="Largo naranjaFuerte">
                <asp:Image ID="Image9" runat="server" ImageUrl="\Icons\png\80px\large\bill-credit-card-product.png" CssClass="linkclass" />
                <h2-largo>CONSUMO POR PRODUCTO</h2-largo>
            </a>
        </div>
        <div class="col-lg-2">
            <a href="DetailsConsumoByDpto.aspx" id="btnConsumoPorDpto" class="Largo blue">
                <asp:Image ID="Image10" runat="server" ImageUrl="\Icons\png\80px\large\company-building-list.png" CssClass="linkclass" />
                <h2-largo>CONSUMO POR DEPARTAMENTO</h2-largo>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-2">
            <a href="DetailsConsumoEspecial.aspx" id="btnReporteEspecialConsumos" class="Largo blueLight">
                <asp:Image ID="Image11" runat="server" ImageUrl="\Icons\png\80px\large\report-print-banknotes.png" CssClass="linkclass" />
                <h2-largo>REPORTE ESPECIAL DE CONSUMOS</h2-largo>
            </a>
        </div>
        <div class="col-lg-2">
            <a href="DetailsConsumoFiltroByDpto.aspx" id="btnFiltroDpto" class="Largo rojo">
                <asp:Image ID="Image12" runat="server" ImageUrl="\Icons\png\80px\large\company-building-filter.png" CssClass="linkclass" />
                <h2-largo>FILTRO POR DEPARTAMENTO</h2-largo>
            </a>

        </div>
        <div class="col-lg-2">
            <a href="DetailsBitacoraCliente.aspx" id="btnBitacora" class="Largo anaranjado">
                <asp:Image ID="Image13" runat="server" ImageUrl="\Icons\png\80px\large\account-book.png" CssClass="linkclass" />
                <h2-largo>BITACORA</h2-largo>
            </a>
        </div>
        <div class="col-lg-2" style="display:none;>
            <a href=" reportes="" detailsconsumobygrupo"="" id="btnConsumoPorGrupo">
                <i class="icon-consumo-fecha"></i>
                <h2-largo>CONSUMO POR GRUPO</h2-largo>
            
        </div>
    </div>
    
        <!--
    <div class="row hidden-lg hidden-xs">
        <div class="col-md-4 col-sm-4">
            <a href="/Reportes/DetailsAnalisisConsumo" id="btnAnalisisConsumo" class="Largo rojo">
                <i class="icon-analisis-consumo"></i>
                <h2-largo>ANALISIS DE CONSUMO</h2-largo>
            </a>
        </div>
        <div class="col-md-4 col-sm-4">
            <a href="/Reportes/DetailsFacturaPendienteByPago" id="btnFactPendientePago" class="Largo anaranjado">
                <i class="icon-factura-pendiente"></i>
                <h2-largo>FACTURAS PENDIENTES DE PAGO</h2-largo>
            </a>
        </div>
        <div class="col-md-4 col-sm-4">
            <a href="/Reportes/DetailsConsumoByFecha" id="btnConsumoPorFecha" class="Largo grisClaro">
                <i class="icon-consumo-fecha"></i>
                <h2-largo>CONSUMO POR FECHA</h2-largo>
            </a>
        </div>
    </div>
    <div class="row hidden-lg hidden-xs">
        <div class="col-md-4 col-sm-4">
            <a href="/Reportes/DetailsConsumoByVehiculo" id="btnConsumoPorVehiculo" class="Largo verdeAzuloso">
                <i class="icon-consumo-vehiculo"></i>
                <h2-largo>CONSUMO POR VEHICULO</h2-largo>
            </a>
        </div>
        <div class="col-md-4 col-sm-4">
            <a href="/Reportes/DetailsConsumoByEstacion" id="btnConsumoPorEstacion" class="Largo verde">
                <i class="icon-consumo-estacion"></i>
                <h2-largo>CONSUMO POR ESTACION</h2-largo>
            </a>
        </div>
        <div class="col-md-4 col-sm-4">
            <a href="/Reportes/DetailsComparativoMensualByCliente" id="btnComparativoMensulaCte" class="Largo morado">
                <i class="icon-comparativo-mensual-us"></i>
                <h2-largo>COMPARATIVO MENSUAL POR CLIENTE</h2-largo>
            </a>
        </div>
    </div>
    <div class="row hidden-lg hidden-xs">
        <div class="col-md-4 col-sm-4">
            <a href="/Reportes/DetailsComparativoMensualByVehiculo" id="btnComparativoMensulaVehiculo" class="Largo verdeFourence">
                <i class="icon-comparativo-mensual-veh"></i>
                <h2-largo>COMPARATIVO MENSUAL POR VEHICULO</h2-largo>
            </a>
        </div>
        <div class="col-md-4 col-sm-4">
            <a href="/Reportes/DetailsConciliacionConsumoByCte" id="btnConsiliacionConsumoCte" class="Largo amarillo">
                <i class="icon-descarga-consumo"></i>
                <h2-largo>CONCILIACION DE CONSUMOS POR CLIENTE</h2-largo>
            </a>
        </div>
        <div class="col-md-4 col-sm-4">
            <a href="/Reportes/DetailsConsumoByProducto" id="btnConsumoPorProducto" class="Largo naranjaFuerte">
                <i class="icon-consumo-producto"></i>
                <h2-largo>CONSUMO POR PRODUCTO</h2-largo>
            </a>
        </div>
    </div>
    <div class="row hidden-lg hidden-xs">
        <div class="col-md-4 col-sm-4">
            <a href="/Reportes/DetailsConsumoByDpto" id="btnConsumoPorDpto" class="Largo blue">
                <i class="icon-consumo-dpto"></i>
                <h2-largo>CONSUMO POR DEPARTAMENTO</h2-largo>
            </a>
        </div>
        <div class="col-md-4 col-sm-4">
            <a href="/Reportes/DetailsConsumoEspecial" id="btnReporteEspecialConsumos" class="Largo blueLight">
                <i class="icon-reporte-consumo"></i>
                <h2-largo>REPORTE ESPECIAL DE CONSUMOS</h2-largo>
            </a>
        </div>
        <div class="col-md-4 col-sm-4">
            <a href="/Reportes/DetailsConsumoFiltroByDpto" id="btnFiltroDpto" class="Largo rojo">
                <i class="icon-filtro-departamento"></i>
                <h2-largo>FILTRO POR DEPARTAMENTO</h2-largo>
            </a>
        </div>
    </div>
    <div class="row hidden-lg hidden-xs">
        <div class="col-md-4 col-sm-4">
            <a href="/Reportes/DetailsBitacoraCliente" id="btnBitacora" class="Largo anaranjado">
                <i class="icon-bitacora"></i>
                <h2-largo>BITACORA</h2-largo>
            </a>
        </div>
        <div class="col-md-4 col-sm-4">
            <a href="/Reportes/DetailsConsumoByGrupo" id="btnConsumoPorGrupo" class="Largo grisClaro">
                <i class="icon-consumo-fecha"></i>
                <h2-largo>CONSUMO POR GRUPO</h2-largo>
            </a>
        </div>
    </div>
    
    <div class="row hidden-lg hidden-md hidden-sm">
        <div class="col-xs-6">
            <a href="/Reportes/DetailsAnalisisConsumo" id="btnAnalisisConsumo" class="Largo rojo">
                <i class="icon-analisis-consumo"></i>
                <h2-largo>ANALISIS DE CONSUMO</h2-largo>
            </a>
        </div>
        <div class="col-xs-6">
            <a href="/Reportes/DetailsFacturaPendienteByPago" id="btnFactPendientePago" class="Largo anaranjado">
                <i class="icon-factura-pendiente"></i>
                <h2-largo>FACTURAS PENDIENTES DE PAGO</h2-largo>
            </a>
        </div>
    </div>
    <div class="row hidden-lg hidden-md hidden-sm">
        <div class="col-xs-6">
            <a href="/Reportes/DetailsConsumoByFecha" id="btnConsumoPorFecha" class="Largo grisClaro">
                <i class="icon-consumo-fecha"></i>
                <h2-largo>CONSUMO POR FECHA</h2-largo>
            </a>
        </div>
        <div class="col-xs-6">
            <a href="/Reportes/DetailsConsumoByVehiculo" id="btnConsumoPorVehiculo" class="Largo verdeAzuloso">
                <i class="icon-consumo-vehiculo"></i>
                <h2-largo>CONSUMO POR VEHICULO</h2-largo>
            </a>
        </div>
    </div>
    <div class="row hidden-lg hidden-md hidden-sm">
        <div class="col-xs-6">
            <a href="/Reportes/DetailsConsumoByEstacion" id="btnConsumoPorEstacion" class="Largo verde">
                <i class="icon-consumo-estacion"></i>
                <h2-largo>CONSUMO POR ESTACION</h2-largo>
            </a>
        </div>
        <div class="col-xs-6">
            <a href="/Reportes/DetailsComparativoMensualByCliente" id="btnComparativoMensulaCte" class="Largo morado">
                <i class="icon-comparativo-mensual-us"></i>
                <h2-largo>COMPARATIVO MENSUAL POR CLIENTE</h2-largo>
            </a>
        </div>
    </div>
    <div class="row hidden-lg hidden-md hidden-sm">
        <div class="col-xs-6">
            <a href="/Reportes/DetailsComparativoMensualByVehiculo" id="btnComparativoMensulaVehiculo" class="Largo verdeFourence">
                <i class="icon-comparativo-mensual-veh"></i>
                <h2-largo>COMPARATIVO MENSUAL POR VEHICULO</h2-largo>
            </a>
        </div>
        <div class="col-xs-6">
            <a href="/Reportes/DetailsConciliacionConsumoByCte" id="btnConsiliacionConsumoCte" class="Largo amarillo">
                <i class="icon-descarga-consumo"></i>
                <h2-largo>CONCILIACION DE CONSUMOS POR CLIENTE</h2-largo>
            </a>
        </div>
    </div>
    <div class="row hidden-lg hidden-md hidden-sm">
        <div class="col-xs-6">
            <a href="/Reportes/DetailsConsumoByProducto" id="btnConsumoPorProducto" class="Largo naranjaFuerte">
                <i class="icon-consumo-producto"></i>
                <h2-largo>CONSUMO POR PRODUCTO</h2-largo>
            </a>
        </div>
        <div class="col-xs-6">
            <a href="/Reportes/DetailsConsumoByDpto" id="btnConsumoPorDpto" class="Largo blue">
                <i class="icon-consumo-dpto"></i>
                <h2-largo>CONSUMO POR DEPARTAMENTO</h2-largo>
            </a>
        </div>
    </div>
    <div class="row hidden-lg hidden-md hidden-sm">
        <div class="col-xs-6">
            <a href="/Reportes/DetailsConsumoEspecial" id="btnReporteEspecialConsumos" class="Largo blueLight">
                <i class="icon-reporte-consumo"></i>
                <h2-largo>REPORTE ESPECIAL DE CONSUMOS</h2-largo>
            </a>
        </div>
        <div class="col-xs-6">
            <a href="/Reportes/DetailsConsumoFiltroByDpto" id="btnFiltroDpto" class="Largo rojo">
                <i class="icon-filtro-departamento"></i>
                <h2-largo>FILTRO POR DEPARTAMENTO</h2-largo>
            </a>
        </div>
    </div>
    <div class="row hidden-lg hidden-md hidden-sm">
            <div class="col-xs-12">
                <a href="/Reportes/DetailsBitacoraCliente" id="btnBitacora" class="Largo anaranjado">
                    <i class="icon-bitacora"></i>
                    <h2-largo>BITACORA</h2-largo>
                </a>
            </div>
            <div class="col-xs-12" style="display:none;">
                <a href="/Reportes/DetailsConsumoByGrupo" id="btnConsumoPorGrupo" class="Largo grisClaro">
                    <i class="icon-consumo-fecha"></i>
                    <h2-largo>CONSUMO POR GRUPO</h2-largo>
                </a>
            </div>
            -->
   </div>
</div>
  
</asp:Content>

