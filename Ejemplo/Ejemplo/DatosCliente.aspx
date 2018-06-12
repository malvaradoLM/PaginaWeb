﻿<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="DatosCliente.aspx.cs" Inherits="Ejemplo.WebForm1" %>
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
}
</style>

    <link href="css/PaletaColores.css" rel="stylesheet">
    <link href="css/StylePage.css" rel="stylesheet">
    <link href="css/ResponsiveBootstrapTabs.css" rel="stylesheet">
    <div class="row">
                <div class="col-lg-12">
                    <div class="tablaMain">
<form action="/Cliente/Details/NQ==" method="post"><input name="__RequestVerificationToken" type="hidden" value="LGysLb9D9kcvbU4U-vMl66yzC-gtq8Du0lmbezUctFywnteL1ldUlkQNWIY-XHbUisdhUKj9gvUy60xUpL5u706JMjrPhr74KrqGBP3who01">    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8">
                <div class="Cards-Titulo "><h2>DATOS DEL CLIENTE</h2></div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-lg-6">
                <div class="table-responsive ">
                    <table class="table format-table" style="float:left">
                        <thead>
                            <tr id="FormatRow2">
                                <th colspan="2">                        
                                    <div class="details-cards">
                                        <div class="Descriptivos Transparencia HexColor-3"><h5>NOMBRE</h5></div>
                                        <div class="SubTitulos HexColor-3"><h3><dx:ASPxLabel ID="lblCliente" runat="server" Text="Cliente" Font-Size="Medium">
                                    </dx:ASPxLabel></h3></div>
                                        <div id="formatDiv">
                                            <div class="Cards-ContadorPequeno HexColor-3"><h5><dx:ASPxLabel ID="lblID" runat="server" Text="ID" Font-Size="Medium">
                                    </dx:ASPxLabel></h5></div>
                                        </div>
                                    </div>
                                    
                                </th>
                            </tr>      
                        </thead>    
                        <tbody>
                            <tr id="FormatRow1">
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h5>RAZON SOCIAL</h5></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h5><dx:ASPxLabel ID="lblRazonSocial" runat="server" Text="Razon Social" Font-Size="Medium">
                                        </dx:ASPxLabel></h5</div>
                                </td>
                            </tr>
                            <tr id="FormatRow2">
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h5>DOMICILIO</h5></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h5><dx:ASPxLabel ID="lblDomicilio" runat="server" Text="Domicilio" Font-Size="Medium">
                                        </dx:ASPxLabel></h5></div>
                                </td>
                            </tr>
                            <tr id="FormatRow1">
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h5>COLONIA</h5></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h5><dx:ASPxLabel ID="lblColonia" runat="server" Text="Colonia" Font-Size="Medium">
                                        </dx:ASPxLabel></h5</div>
                                </td>
                            </tr>
                            <tr id="FormatRow2">
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h5>CIUDAD</h5></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h5><dx:ASPxLabel ID="lblCiudad" runat="server" Text="Ciudad" Font-Size="Medium"></dx:ASPxLabel></h5></div>
                                </td>
                            </tr>
                            <tr id="FormatRow1">
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h5>ESTADO</h5></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h5><dx:ASPxLabel ID="lblEstado" runat="server" Text="Ciudad" Font-Size="Medium"></dx:ASPxLabel></h5></div>
                                </td>
                            </tr>
                            <tr id="FormatRow2">
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h5>TELEFONO</h5></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h5><dx:ASPxLabel ID="lblTelefono" runat="server" Text="Telefono" Font-Size="Medium"></dx:ASPxLabel></h5></div>
                                </td>
                            </tr>
                            <tr id="FormatRow1">
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h5>CODIGO POSTAL</h5></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h5><dx:ASPxLabel ID="lblCP" runat="server" Text="CP" Font-Size="Medium"></dx:ASPxLabel></h5></div>
                                </td>
                            </tr>
                            <tr id="FormatRow2">
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h5>R.F.C.</h5></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h5><dx:ASPxLabel ID="lblRFC" runat="server" Text="RFC" Font-Size="Medium">
                                        </dx:ASPxLabel></h5</div>
                                </td>
                            </tr>
                            <tr id="FormatRow1">
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h5>LIMITE DE CREDITO</h5></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h5><dx:ASPxLabel ID="lblLimiteCredito" runat="server" Text="Límite de Credito" Font-Size="Medium">
                                        </dx:ASPxLabel></h5</div>
                                </td>
                            </tr>
                            <tr id="FormatRow2">
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h5>ESTATUS</h5></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                            <div class="Cards-ContadorPequeno HexColor-3"><h5><dx:ASPxLabel ID="lblStatus" runat="server" Text="Status" Font-Size="Medium"></dx:ASPxLabel></h5></div>
                                </td>
                            </tr>
                        </tbody>    
                    </table>
                </div>
            </div>
            <div class="col-lg-2">
                <a href="javascript://" class="Largo verde_claro" onclick="location.href='/Cliente/DetailsEdoCta' ">
                    <div>
                    <i class="glyphicon glyphicon-usd" style="vertical-align:central"></i>
                    <h2-largo style="align-self:baseline">ESTADO DE CUENTA</h2-largo>
                    </div>
                </a>
                <a href="javascript://" class="Largo amarillo" onclick="location.href='/Cliente/DetailsListaFactura/NQ%3d%3d'">
                    <i class="glyphicon glyphicon-list-alt"></i>
                    <h2-largo>LISTADO DE FACTURAS</h2-largo>
                    
                </a>
                <a href="javascript://" class="Largo azul" onclick="location.href='/Cliente/SendInformacion'">
                    <i class="glyphicon glyphicon-send"></i>
                    <h2-largo>ENVIO DE INFORMACION</h2-largo>
                </a>
            </div>
        </div>
    </div>
</form>



                    </div>
                </div>
            </div>
</asp:Content>
