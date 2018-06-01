<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Ejemplo.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <%-- Inicio de Cabecera  --%>
    	<div class="col-md-12">
           <div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Usuarios</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Usuarios</h1>
			</div>
		</div><!--/.row-->
     
   	</div><!--/.row 12-->
     <%-- Fin de Cabecera --%>

     <%-- Inicio para Mostrar Vehiculos Activos --%>
      <div class="col-md-12">
		<div class="panel panel-default">
		    <div class="panel-body">
			<form role="form">
                <div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						Usuarios Activos
					</div>
					<div class="panel-body">
						<div class="canvas-wrapper">
							<%--<canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>--%>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
            </form>
	       </div>
	    </div>
   </div>  
    <%-- Fin de Vehiculos Activos --%>

</asp:Content>
