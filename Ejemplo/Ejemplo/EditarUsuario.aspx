<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="EditarUsuario.aspx.cs" Inherits="Ejemplo.EditarUsuario" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%--  --%>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <style>
#exTab1 .tab-content {
  color : white;
  background-color: #428bca;
  padding : 5px 15px;
}

#exTab2 h3 {
  color : white;
  background-color: #428bca;
  padding : 5px 15px;
}

/* remove border radius for the tab */

#exTab1 .nav-pills > li > a {
  border-radius: 0;
  font-size:15px;
}

/* change border radius for the tab , apply corners on top*/

#exTab3 .nav-pills > li > a {
  border-radius: 4px 4px 0 0 ;
}

#exTab3 .tab-content {
    color: white;
    background-color: #428bca;
    padding: 5px 15px;
}
.btn-sample { 
  color: #ffffff; 
  background-color: #428BCA; 
  border-color: #E8E8E8; 
} 
 
.btn-sample:hover, 
.btn-sample:focus, 
.btn-sample:active, 
.btn-sample.active, 
.open .dropdown-toggle.btn-sample { 
  color: #ffffff; 
  background-color: #428bca; 
  border-color: #E8E8E8; 
} 
 
.btn-sample:active, 
.btn-sample.active, 
.open .dropdown-toggle.btn-sample { 
  background-image: none; 
} 
 
.btn-sample.disabled, 
.btn-sample[disabled], 
fieldset[disabled] .btn-sample, 
.btn-sample.disabled:hover, 
.btn-sample[disabled]:hover, 
fieldset[disabled] .btn-sample:hover, 
.btn-sample.disabled:focus, 
.btn-sample[disabled]:focus, 
fieldset[disabled] .btn-sample:focus, 
.btn-sample.disabled:active, 
.btn-sample[disabled]:active, 
fieldset[disabled] .btn-sample:active, 
.btn-sample.disabled.active, 
.btn-sample[disabled].active, 
fieldset[disabled] .btn-sample.active { 
  background-color: #428BCA; 
  border-color: #E8E8E8; 
} 
 
.btn-sample .badge { 
  color: #428BCA; 
  background-color: #ffffff; 
}

 </style>


    <div id="nav" class="container" style="margin-left:0px; margin-right:0px"><h1>USUARIOS</h1></div>
    <div id="exTab1" class="container" style="margin-left:0px; margin-right:0px">	
        <ul id="myTabs" class="nav nav-pills" style="padding:0px">
			<li id="1ali">
          <a  id="lblEncabezado" data-toggle="tab" class="active" runat="server"></a>
          <input  id="HiddenUsuarioWebID" data-toggle="tab" class="active" runat="server" type="hidden">
			</li>
		</ul>
        <div class="tab-content clearfix">
            <div class="tab-pane active" id="1a" >
         <table style="width:100%; height:500px">
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblNombre" Text="NOMBRE" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtNombre" runat="server"  Width="60%"  Font-Size="15px" Font-Bold="true"  HorizontalAlign="Left"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblUsuario" Text="USUARIO" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtUsuario" runat="server"  Width="60%" Font-Size="15px" Font-Bold="true"  HorizontalAlign="Left"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblClave" Text="CLAVE" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtClave" runat="server"  Width="60%" Font-Size="15px" Font-Bold="true"   HorizontalAlign="Left"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblNivelAdministrador" Text="NIVEL ADMINISTRADOR" runat="server" Font-Bold="true"/></td>
                            <td> 
                                <dx:ASPxCheckBox ID="chkAdministrador" runat="server"></dx:ASPxCheckBox>
                                <%--<dx:ASPxTextBox ID="txtPlacas" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true"   Enabled="false"></dx:ASPxTextBox>--%>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
<dx:ASPxButton  id="btnguardar1" class="btn-sample btn-lg" OnClick="btnguardar_Click" type="button" style="float:right" runat="server" Text="GUARDAR" >
 </dx:ASPxButton>    </div>	
</asp:Content>
