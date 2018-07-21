<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Ejemplo.WebForm2" %>

<%@ Register Assembly="DevExpress.XtraCharts.v17.2.Web, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web.Designer" TagPrefix="dxchartdesigner" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v17.2.Web, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <script>
	//	window.onload = function () {
      //      var chart1 = document.getElementById('<%=webChartControl.ClientID%>').getContext("2d");
	//window.myLine = new Chart(chart1).Line(lineChartData, {
//	responsive: true,
	//scaleLineColor: "rgba(0,0,0,.2)",
	//scaleGridLineColor: "rgba(0,0,0,.05)",
	//scaleFontColor: "#c5c7cc"
	//});
//};
	</script>
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="assets/slicknav/jquery.slicknav.min.js"></script>
    <link rel="stylesheet" href="assets/demo.css">
    <link rel="stylesheet" href="assets/navigation-icons.css">
    <link rel="stylesheet" href="assets/slicknav/slicknav.min.css">
    <script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

    <%-- Inicio de Cabecera  --%>
    	<link href="css/breadCrumb.css" rel="stylesheet">
 
    <div id="cssmenu" style="margin-top:60px;" class="row fade-in">  
    <ul>
        <li class="active"><a href="Dashboard.aspx">Dashboard</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Home</a></li>
    </ul>
</div>         
    <p>
		<%--
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Dashboard</h1>
			</div>
		</div><!--/.row-->
     
   	</div><!--/.row 12-->--%>
     <%-- Fin de Cabecera --%>

    <%-- Inicio para Saldos del Cliente --%>
      <div class="col-md-12 fade-in animacion">
		<div class="panel panel-default">
			<div class="panel-body">
			
		<div class="panel panel-container">
			<div class="row">
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-teal panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-shopping-cart color-blue"></em>
							<div class="large"><asp:Label ID="lblLimiteCredito" runat="server"/></div>
							<div class="text-uppercase">Limite de Credito</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-blue panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-comments color-orange"></em>
							<div class="large"><asp:Label ID="lblSaldoDisponible" runat="server"/></div>
							<div class="text-uppercase">Saldo Disponible</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-orange panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-users color-teal"></em>
							<div class="large"><asp:Label ID="lblSaldoDeudor" runat="server"/></div>
							<div class="text-uppercase">Saldo Deudor</div>
						</div>
					</div>
				</div>

			</div><!--/.row-->
		</div>
   
	</div>
	</div>
   </div>
    <%-- Fin de Panel donde Estan los saldos del cliente --%>

       
                           <%-- <canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>--%>
                            <dx:WebChartControl ID="webChartControl" runat="server"  Height="600" Width="1200" Theme="Office365" >
                                <SeriesTemplate ArgumentDataMember="Descripcion" ValueDataMembersSerializable="Importe" LabelsVisibility="False">
            <ViewSerializable>
                <dx:SideBySideBar3DSeriesView></dx:SideBySideBar3DSeriesView>
            </ViewSerializable>
            <LabelSerializable>
                <dx:Bar3DSeriesLabel>
                </dx:Bar3DSeriesLabel>
            </LabelSerializable>
        </SeriesTemplate> 
                                <DiagramSerializable>
            <dx:XYDiagram3D> 
                <AxisY>
                    <label TextPattern="${V}M"/>
                </AxisY>
            </dx:XYDiagram3D>
        </DiagramSerializable>
                            </dx:WebChartControl>
						    <br />
                            <br />
<%-- Fin de Grafica de Consumos  --%>
</asp:Content>

