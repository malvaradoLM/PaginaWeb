<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="Datos.aspx.cs" Inherits="Ejemplo.Formulario_web2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	<form id="form1" runat="server" >
    	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Datos del Cliente</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"></h1>
			</div>
		</div><!--/.row-->
            </div>
            <div class="row">
			<div class="col-lg-12">
            <div class="panel panel-default">
					<div class="panel-heading">Datos del Cliente</div>
					  <div class="panel-body">
						<div class="col-md-12">
						<div class="panel panel-default">
					
					    <div class="panel-body">
						<div class="col-md-6">
							
								<div class="form-group">
									<label>Cliente: SERVICIOS DEL VALLE DEL FUERTE SA DE CV</label>
									<%--<input class="form-control" placeholder="Placeholder">--%>
								</div>
								<div class="form-group">
									<label>Direccion: </label>
                                    <p class="help-block">Direccion del Cliente.</p>
                                 <%--   <input type="password" class="form-control">--%>
								</div>
                                <div class="form-group">
									<label>Ciudad: </label>
                                    <p class="help-block">Los Mochis.</p>
                                 <%--   <input type="password" class="form-control">--%>
								</div>
                                <div class="form-group">
									<label>Estado: </label>
                                    <p class="help-block">Sinaloa.</p>
                                 <%--   <input type="password" class="form-control">--%>
								</div>
								
                                 <div class="form-group">
									<label>Telefono: </label>
                                    <p class="help-block">8162400.</p>
                                 <%--   <input type="password" class="form-control">--%>
								</div>
								
                                    <div class="form-group">
									<label>Codigo Postal: </label>
                                    <p class="help-block">81223.</p>
                                 <%--   <input type="password" class="form-control">--%>
								</div>
								
                                    <div class="form-group">
									<label>RFC: </label>
                                    <p class="help-block">SVF700817JG9.</p>
                                 <%--   <input type="password" class="form-control">--%>
								</div>
								
                                    <div class="form-group">
									<label>Estatus: </label>
                                    <p class="help-block">Activo.</p>
                                 <%--   <input type="password" class="form-control">--%>
								</div>
								<%--<div class="form-group checkbox">
									<label>
										<input type="checkbox">Remember me
									</label>
								</div>
								<div class="form-group">
									<label>File input</label>
									<input type="file">
									<p class="help-block">Example block-level help text here.</p>
								</div>
								<div class="form-group">
									<label>Text area</label>
									<textarea class="form-control" rows="3"></textarea>
								</div>
								<label>Validation</label>
								<div class="form-group has-success">
									<input class="form-control" placeholder="Success">
								</div>
								<div class="form-group has-warning">
									<input class="form-control" placeholder="Warning">
								</div>
								<div class="form-group has-error">
									<input class="form-control" placeholder="Error">
								</div>--%>
								</div>
								<div class="col-md-6">
						
									<button type="submit" class="btn btn-primary">Submit Button</button>
									<button type="reset" class="btn btn-default">Reset Button</button>
                                    <br />
							<br />
							<button type="button" class="btn btn-lg btn-success">ACEPTAR</button>
							<button type="button" class="btn btn-lg btn-danger">Cancelar</button>
								</div>
							
						</div>
					</div>
				</div><!-- /.panel-->

							<%--<br />
							<br />
							<button type="button" class="btn btn-lg btn-success">ACEPTAR</button>
							<button type="button" class="btn btn-lg btn-danger">Cancelar</button>
							<br />
							<br />--%>
						</div>
					</div>
				</div><!-- /.panel-->
					</div>
				</div><!-- /.panel-->

        </form>
</asp:Content>
