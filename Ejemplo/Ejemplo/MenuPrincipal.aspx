﻿<%@ Page Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="MenuPrincipal.aspx.cs" Inherits="Ejemplo.MenuPrincipal" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .shadowBox{
    padding: 5px;
    box-shadow: 3px 8px 6px #888888;
}
.shadowBoxMin{
    padding: 2px;
    box-shadow: 1px 6px 4px #888888;
}

    .linkclass
{
    margin-left: 33%;
    margin-top: 7%;
    fill:white;
}
    .shadowBox{
    padding: 5px;
    box-shadow: 3px 8px 6px #888888;
}
    .PosicionIconos{
            margin-left: 30%;
             margin-top: 8%;
    }
.alignHeader{
    text-align:center;
}
  .MarginBreadCumb{
          margin-top: 60px;
  }
@media screen and (max-width: 480px) {
  .linkclass
{
    width:0px;
}
  .MarginBreadCumb{
          margin-top: 0px;
          visibility:hidden;
  }
 }
@media screen and (min-device-width: 481px) and (max-device-width: 740px){
.linkclass
{
    width:0px;
}

  }
        </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="assets/slicknav/jquery.slicknav.min.js"></script>
    <link rel="stylesheet" href="assets/demo.css">
    <link rel="stylesheet" href="assets/navigation-icons.css">
    <link rel="stylesheet" href="assets/slicknav/slicknav.min.css">
    <script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

    <%-- 
    <div class="container" style="height: webkit-fill-available; margin-top:40%;">
    <nav class="menu-navigation-icons">
    <a href="#" class="menu-magenta shadowBoxMin"><i class="glyphicon glyphicon-stats"></i><span>Resumen</span></a>
    <a href="#" class="menu-blue shadowBoxMin"><i class="fa fa-id-card"></i><span>Cliente</span></a>
    <a href="#" class="menu-green shadowBoxMin"><i class="fa fa-car"></i><span>Vehiculos</span></a>
    <a href="#" class="menu-yellow shadowBoxMin"><i class="glyphicon glyphicon-user"></i><span>Usuarios</span></a>
    <a href="#" class="menu-red shadowBoxMin"><i class="glyphicon glyphicon-list-alt"></i><span>Reportes</span></a>
    </nav>
    </div>
        --%>
    
    <link href="css/StylePageMenuPrincipal.css" rel="stylesheet">
   <link href="css/breadCrumb.css" rel="stylesheet">
 
    <div id="cssmenu" class="row MarginBreadCumb">  
    <ul>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i>  Inicio</a></li>
    </ul>
</div>      
    <div class="tab-content fade-in animacion" style="margin-top:10%;">
    <div class="row fade-in align-items-center"">
        <div class="col-sm-3 fade-in">
            <a href="Dashboard.aspx" id="btnResumen" class="Largo rojo shadowBox AlturaMobil">
                <asp:Image ID="Image1" runat="server" ImageUrl="\Icons\png\80px\large\document_chart.png" CssClass="linkclass" />
                <h2-largo>DASHBOARD</h2-largo>
            </a>
        </div>
        <div class="col-sm-3 fade-in">
            <a href="DatosCliente.aspx" id="btnDatosCliente" class="Largo anaranjado shadowBox">
              <asp:Image ID="Image2" runat="server" ImageUrl="\Icons\png\80px\large\business-card.png" CssClass="linkclass" />
                <h2-largo>DATOS DEL CLIENTE</h2-largo>
            </a>
        </div>
        <div class="col-sm-3 fade-in">
            <a href="VehiculoPage.aspx" id="btnVehiculos" class="Largo blue shadowBox">
                 <asp:Image ID="Image3" runat="server" ImageUrl="\Icons\png\80px\large\vehicle-car-convertible.png" CssClass="linkclass" />
                <h2-largo>VEHICULOS</h2-largo>
            </a>
        </div>
        <div class="col-sm-3 fade-in">
            <a href="Usuarios.aspx" id="btnUsuarios" class="Largo verdeAzuloso shadowBox">
            <asp:Image ID="Image4" runat="server" ImageUrl="\Icons\png\80px\large\window-user.png" CssClass="linkclass" />
                <h2-largo>USUARIOS</h2-largo>
            </a>
        </div>
        <div class="col-sm-3 fade-in">
            <a href="Reportes.aspx" id="btnReportes" class="Largo amarillo shadowBox">
             <asp:Image ID="Image5" runat="server" ImageUrl="\Icons\png\80px\large\report.png" CssClass="linkclass" />
                <h2-largo>REPORTES</h2-largo>
            </a>
        </div>
        <div class="col-sm-3 fade-in">
            <a href="DetailsEdoCta.aspx" id="btnEstadoCuenta" class="Largo morado shadowBox">
             <asp:Image ID="Image6" runat="server" ImageUrl="\Icons\png\80px\large\bank-banknotes.png" CssClass="linkclass" />
                <h2-largo>ESTADO DE CUENTA</h2-largo>
            </a>
        </div>
        <div class="col-sm-3 fade-in">
            <a href="DetailsListaFactura.aspx" id="btnListaFacturas" class="Largo magenta shadowBox">
             <asp:Image ID="Image7" runat="server" ImageUrl="\Icons\png\80px\large\list-attach.png" CssClass="linkclass" />
                <h2-largo>LISTADO DE FACTURAS</h2-largo>
            </a>
        </div>
        <div class="col-sm-3 fade-in">
            <a href="EnvioInformacion.aspx" id="btnEnvioInformacion" class="Largo cyan shadowBox">
             <asp:Image ID="Image8" runat="server" ImageUrl="\Icons\png\80px\large\address-book-email.png" CssClass="linkclass" />
                <h2-largo>ENVIO DE INFORMACIÓN</h2-largo>
            </a>
        </div>
    </div>
    </div>




	<script>

	</script>
</asp:Content>
