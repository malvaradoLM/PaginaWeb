<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="EditarVehiculo.aspx.cs" Inherits="Ejemplo.WebForm5" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 313px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <%-- Inicio de Cabecera  --%>
    	<div class="col-md-12">
           <div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Vehiculos/Editar Vehiculo</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Editar Vehiculo</h1>
			</div>
		</div><!--/.row-->
     
   	</div><!--/.row 12-->
     <%-- Fin de Cabecera --%>

     <%-- Inicio para Mostrar Vehiculos Activos --%>
      <div class="col-md-12">
		<div class="panel panel-default">
		    <div class="panel-body">
			   <%-- <form id="form1" runat="server">--%>
               <div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body tabs">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1" data-toggle="tab">Datos</a></li>
							<li><a href="#tab2" data-toggle="tab">Seguridad</a></li>
							<li><a href="#tab3" data-toggle="tab">Fechas</a></li>
                            <li><a href="#tab4" data-toggle="tab">Limite de Consumo</a></li>
                            <li><a href="#tab5" data-toggle="tab">Historial de Consumo</a></li>
                            <li><a href="#tab6" data-toggle="tab">Control de Horario</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade in active" id="tab1"> 
								<h4></h4>
                               
                                    <table style="width:100%;">
                                        <tr>
                                            <td class="auto-style1">Vehiculo ID</td>
                                            <td>
                                           <%--     <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="170px">
                                                </dx:ASPxTextBox>--%>
                                            </td>
                                            
                                            
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Identificacion
                                            </td>
                                            <td>
                                               <%-- <dx:BootstrapTextBox ID="BootstrapTextBox1" runat="server" Text="prueba" Width="629px">  </dx:BootstrapTextBox>--%>
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <td>Departamento</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Centro de Costo</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Placas</td>
                                            <td>
                                              
                                            </td>
                                        </tr>                                        
                                    </table>
                              
                                <p></p>
								<p>
                                    &nbsp;</p>
                                
							</div>
							<div class="tab-pane fade" id="tab2">
								<h4>Tab 2</h4>
                                <table>
                                        <tr>
                                            <td>Nip</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Estatus Actual</td>
                                            <td></td>
                                        </tr>
                                         <tr>
                                            <td>
                                                <%--<dx:BootstrapCheckBox ID="BootstrapCheckBox1" runat="server"></dx:BootstrapCheckBox>
                                                <dx:BootstrapCheckBox ID="BootstrapCheckBox2" runat="server"></dx:BootstrapCheckBox>
                                                <dx:BootstrapCheckBox ID="BootstrapCheckBox3" runat="server"></dx:BootstrapCheckBox>--%>
                                            </td>
                                            <td></td>
                                        </tr>
                                </table>
								 
							</div>
							<div class="tab-pane fade" id="tab3">
								<h4>Tab 3</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget rutrum purus. Donec hendrerit ante ac metus sagittis elementum. Mauris feugiat nisl sit amet neque luctus, a tincidunt odio auctor.</p>
							</div>
                            <div class="tab-pane fade" id="tab4">
								<h4>Tab 4</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget rutrum purus. Donec hendrerit ante ac metus sagittis elementum. Mauris feugiat nisl sit amet neque luctus, a tincidunt odio auctor.</p>
							</div>
                            <div class="tab-pane fade" id="tab5">
								<h4>Tab 5</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget rutrum purus. Donec hendrerit ante ac metus sagittis elementum. Mauris feugiat nisl sit amet neque luctus, a tincidunt odio auctor.</p>
							</div>
                            <div class="tab-pane fade" id="tab6">
								<h4>Tab 6</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget rutrum purus. Donec hendrerit ante ac metus sagittis elementum. Mauris feugiat nisl sit amet neque luctus, a tincidunt odio auctor.</p>
							</div>
						</div>
					</div>
				</div><!--/.panel-->
			</div><!--/.col-->
                <%--</form>--%>
	       </div>
	    </div>
   </div>  
    <%-- Fin de Vehiculos Activos --%>
</asp:Content>
