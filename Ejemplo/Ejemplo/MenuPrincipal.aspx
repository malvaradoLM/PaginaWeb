<%@ Page Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="MenuPrincipal.aspx.cs" Inherits="Ejemplo.MenuPrincipal" %>
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
    .Absolute-Center {
      width: 100%;
      height: 100%;
      margin: auto;
      position: absolute;
      top: 0; left: 0; bottom: 0; right: 0;
      height: -webkit-fill-available;

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
        </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="assets/slicknav/jquery.slicknav.min.js"></script>
    <link rel="stylesheet" href="assets/demo.css">
    <link rel="stylesheet" href="assets/navigation-icons.css">
    <link rel="stylesheet" href="assets/slicknav/slicknav.min.css">
    <script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
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
    
    <link href="css/StylePage1.css" rel="stylesheet">
    <div class="container-fluid" style="margin-top:10%">

    <div class="row">
        <div class="col-lg-3">
            <a href="Dashboard.aspx" id="btnResumen" class="Largo rojo shadowBox">
                <asp:Image ID="Image1" runat="server" ImageUrl="\Icons\png\80px\large\document_chart.png" CssClass="linkclass" />
                <h2-largo>RESUMEN</h2-largo>
            </a>
        </div>
        <div class="col-lg-3">
            <a href="DatosCliente.aspx" id="btnDatosCliente" class="Largo anaranjado shadowBox">
              <asp:Image ID="Image2" runat="server" ImageUrl="\Icons\png\80px\large\business-card.png" CssClass="linkclass" />
                <h2-largo>DATOS DEL CLIENTE</h2-largo>
            </a>
        </div>
        <div class="col-lg-3">
            <a href="VehiculoPage.aspx" id="btnVehiculos" class="Largo blue shadowBox">
                 <asp:Image ID="Image3" runat="server" ImageUrl="\Icons\png\80px\large\vehicle-car-convertible.png" CssClass="linkclass" />
                <h2-largo>VEHICULOS</h2-largo>
            </a>
        </div>
        <div class="col-lg-3">
            <a href="Usuarios.aspx" id="btnUsuarios" class="Largo verdeAzuloso shadowBox">
            <asp:Image ID="Image4" runat="server" ImageUrl="\Icons\png\80px\large\window-user.png" CssClass="linkclass" />
                <h2-largo>USUARIOS</h2-largo>
            </a>
        </div>
        <div class="col-lg-3">
            <a href="Reportes.aspx" id="btnReportes" class="Largo amarillo shadowBox">
             <asp:Image ID="Image5" runat="server" ImageUrl="\Icons\png\80px\large\report.png" CssClass="linkclass" />
                <h2-largo>REPORTES</h2-largo>
            </a>
        </div>
    </div>




	<script>

	</script>
</asp:Content>
