<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Ejemplo.LoginPage" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>RedPacifico</title>
    <%--
	<link href="css/bootstrap.min.css" rel="stylesheet" />
	<link href="css/datepicker3.css" rel="stylesheet" />
	<link href="css/styles.css" rel="stylesheet" />
         --%>
    <link href="css/login.css" rel="stylesheet" />
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
   <%--
	<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">Log in</div>
				<div class="panel-body">
					<form id="login" runat="server">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="Usuario" name="inputUsuario" type="text" autofocus="" id="inputUser" runat="server"/>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Password" name="inputPassword" type="password" value="" id="inputPass" runat="server"/>
							</div>
							<div class="checkbox">
								<label>
									<%--<input name="remember" type="checkbox" value="Remember Me">Remember Me
								</label>
							</div>
							<%--<a href="Dashboard.aspx" class="btn btn-primary">Login</a>
                            <dx:BootstrapButton ID="btnAceptar" runat="server" AutoPostBack="false" OnClick="btnAceptar_Click" Text="Login" class="btn btn-primary">
                            </dx:BootstrapButton>
                            
                        </fieldset>
					</form>
				</div>
			</div>
		</div><!-- /.col-->
	</div><!-- /.row -->	
    --%>
    <form class="login" runat="server">
    <h1 class="login-title">FLOTILLAS</h1>
    <input type="text" class="login-input" placeholder="Usuario" autofocus="autofocus" runat="server" id="inputUser" />
    <input type="password" class="login-input" placeholder="Password" runat="server" id="inputPass" />
    <asp:Button runat="server" OnClick="btnAceptar_Click" Text="INICIAR SESION" CssClass="login-button" />
  </form>

<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
