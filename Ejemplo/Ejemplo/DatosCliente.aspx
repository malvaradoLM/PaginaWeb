<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="DatosCliente.aspx.cs" Inherits="Ejemplo.WebForm1" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="row">
			<div class="col-lg-12">
				</div><!-- /.panel-->
			</div><!-- /.col-->--%>
  
    	<div class="col-md-12">
           <div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Datos</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Cliente</h1>
			</div>
		</div><!--/.row-->
	</div><!--/.row 12-->
	        <div class="col-md-6">
                	

				<div class="panel panel-default">
					<div class="panel-heading">
						Datos del Cliente
				     </div>
				     <div class="panel-body">
						<%--<div id="calendar"></div>--%>
                        <form role="form">
								<div class="form-group">
									<label></label>
                                    
								    <dx:ASPxLabel ID="lblCliente" runat="server" Text="Cliente" Font-Size="Medium">
                                    </dx:ASPxLabel>
                                    
								</div>
                                <div class="form-group">
									<label>DIRECCION:</label>
                                    <p class="help-block">
                                        <dx:ASPxLabel ID="lblDomicilio" runat="server" Text="Domicilio" Font-Size="Medium">
                                        </dx:ASPxLabel>
                                     </p>
								</div>
                                <div class="form-group">
									<label>CIUDAD:</label>
                                    <p class="help-block">
                                         <dx:ASPxLabel ID="lblCiudad" runat="server" Text="Ciudad" Font-Size="Medium"></dx:ASPxLabel>
                                         .</p>
								</div>
                                <div class="form-group">
									<label>ESTADO:</label>
                                    <p class="help-block">
                                             <dx:ASPxLabel ID="lblEstado" runat="server" Text="Estado" Font-Size="Medium"></dx:ASPxLabel>
                                     .</p>
								</div>
                                <div class="form-group">
									<label>TELEFONO:</label>
                                    <p class="help-block">
                                         <dx:ASPxLabel ID="lblTelefono" runat="server" Text="Telefono" Font-Size="Medium"></dx:ASPxLabel>
                                     </p>
								</div>
                                <div class="form-group">
									<label>CODIGO POSTAL:</label>
                                    <p class="help-block">
                                         <dx:ASPxLabel ID="lblCP" runat="server" Text="CP" Font-Size="Medium"></dx:ASPxLabel>
                                    </p>
								</div>
                                <div class="form-group">
									<label>ESTATUS:</label>
                                    <p class="help-block">
                                        <dx:ASPxLabel ID="lblStatus" runat="server" Text="Status" Font-Size="Medium"></dx:ASPxLabel>
                                     </p>
								</div>
                        </form>
					</div>
				</div>
         </div>

    <%--oTRO pANEL--%>
    	        <div class="col-md-3">
				<div class="panel panel-default">
					<%--<div class="panel-heading">
						Datos del Cliente
				     </div>--%>
				     <div class="panel-body">
						
                        <form role="form">
								
                                <div class="form-group">
                                     <button type="button" class="btn btn-lg btn-success">Estado de Cuenta</button>
								</div>
                                <div class="form-group">
                                     <button type="button" class="btn btn-lg btn-warning">Listado de Facturas</button>
								</div>
                               <div class="form-group">
                                    <button type="button" class="btn btn-lg btn-primary">Envio de Informacion</button>
								</div>
                        </form>
					</div>
				</div>
         </div>
</asp:Content>
