<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/principal.Master" CodeBehind="EnvioInformacion.aspx.cs" Inherits="Ejemplo.EnvioInformacion" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
.labelCuadro
{
    color: #ffffff;
    font-family: 'Roboto Condensed', sans-serif;
}

 </style>
<div id="nav" class="container" style="margin-left:0px; margin-right:0px"><h1>ESTADO DE CUENTA</h1></div>
    <div class="row">
            <ol class="breadcrumb Cards-Contenido col-lg-10" style="background:initial;">
                <li class="breadcrumb-item"><a href="DatosCliente.aspx">Datos</a></li>
                <li class="breadcrumb-item active ">Estado de Cuenta</li>
            </ol>
        </div>
    <div id="exTab1" class="container" style="margin-left:0px; margin-right:0px">	
        <ul id="myTabs" class="nav nav-pills" style="padding:0px">
		</ul>
        <div class="tab-content clearfix">
            <div class="tab-pane active" id="1a" >
         <table style="width:100%; height:500px">
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblClienteID" Text="CLIENTE ID" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxLabel ID="lblClienteIDvalue" Text="CLIENTE ID" runat="server" Font-Bold="true"/>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblConsumo" Text="CONSUMO" runat="server" Font-Bold="true"/></td>
                            <td>
                            <dx:ASPxTextBox ID="txtConsumo" runat="server" NullText="EMAIL DE CONSUMO" >  
                            
                            </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                             <td><dx:ASPxLabel ID="lblFacturaEmitida" Text="FACTURA EMITIDA" runat="server" Font-Bold="true"/></td>
                            <td>
                            <dx:ASPxTextBox ID="txtFacturaEmitida" runat="server" NullText="EMAIL DE LA FACTURA" NullTextStyle-BackColor="WhiteSmoke" >  
                            
                            </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td><dx:ASPxLabel ID="lblPagoRealizado" Text="PAGO REALIZADO" runat="server" Font-Bold="true"/></td>
                            <td>
                            <dx:ASPxTextBox ID="txtPagoRealizado" runat="server" NullText="EMAIL DEL PAGO" NullTextStyle-BackColor="WhiteSmoke" >  
                            
                            </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        <asp:LinkButton  id="btnProcesar" class="btn-sample btn-lg labelCuadro"  type="button" style="float:right;margin-top: 1px; background-color:mediumseagreen" runat="server" Text="PROCESAR " >
    
</asp:LinkButton>
<asp:LinkButton id="btnCancelar" class="btn-sample btn-lg labelCuadro"  type="button" style="float:right;background-color:red; margin-right:1px; margin-top: 1px;" runat="server" Text="CANCELAR " >
  
 </asp:LinkButton>

    </div>	

</asp:Content>
