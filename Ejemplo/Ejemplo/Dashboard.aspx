<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Ejemplo.WebForm2" %>

<%@ Register Assembly="DevExpress.XtraCharts.v17.2.Web, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web.Designer" TagPrefix="dxchartdesigner" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v17.2.Web, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
.Grafica
{
    width:500px;
}
@media screen and (max-width: 480px) {
.Grafica
{
    width:200px;
}

}
        </style>


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
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Inicio</a></li>
    </ul>
</div> 
<div class="alert alert-warning" id="msjAlerta" runat="server" visible="false">
        <strong><dx:ASPxLabel ID="lblTitleMensaje" runat="server" Font-Bold="true" /> </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>
    
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
						<div class="row no-padding"><em class="fa fa-xl fa-shopping-cart color-blue" style="font-size: 30px;"></em>
							<div class="large"><asp:Label ID="lblLimiteCredito" runat="server"/></div>
							<div class="text-uppercase">Limite de Credito</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-blue panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-comments color-orange" style="font-size: 30px;"></em>
							<div class="large"><asp:Label ID="lblSaldoDisponible" runat="server"/></div>
							<div class="text-uppercase">Saldo Disponible</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-orange panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-users color-teal" style="font-size: 30px;"></em>
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
       <div class="tab-content fade-in animacion" style="margin-top:10%;">
              <div class="row">
                  <div class="col-lg-4 col-xs-12" style="float:left;">
                            <dx:WebChartControl ID="webChartControl" runat="server"  Height="250" Width="500" CssClass="Grafica" Theme="Office365" AutoLayout="true">
                                <Titles>
                                    <dx:ChartTitle Text="Consumos Por Mes" />
                                    </Titles>
                                <SeriesTemplate ArgumentDataMember="Producto" ValueDataMembersSerializable="Importe" LabelsVisibility="False">
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
                      </div>
                  <div class="col-lg-2">
                            
                      </div>
                   <div class="col-lg-4 col-xs-12" style="float:left;">
                  <dx:WebChartControl ID="webChartControlPie" runat="server"  Height="250" Width="500" Theme="Office365" AutoLayout="true" >
                                <Titles>
                                    <dx:ChartTitle Text="Consumos Por Producto" />
                                    </Titles>
                                <SeriesTemplate>
            <ViewSerializable>
                <dx:RadarPointSeriesView></dx:RadarPointSeriesView>
            </ViewSerializable>
        </SeriesTemplate> 
                                <DiagramSerializable>
            <dx:XYDiagram3D> 
                <AxisY>
                    <label TextPattern="${V}M"/>
                </AxisY>
            </dx:XYDiagram3D>
        </DiagramSerializable>
                            </dx:WebChartControl>
                        </div>
            </div>
    <div class="row" style="margin-top:10px">
    <div class="col-lg-4 col-xs-12" style="float:left;">
                          <dx:WebChartControl ID="webChartControl3" runat="server"  Height="250" Width="500" Theme="Office365" AutoLayout="true">
                                <Titles>
                                    <dx:ChartTitle Text="Consumos Por Mes" />
                                    </Titles>
                                <SeriesTemplate ArgumentDataMember="Producto" ValueDataMembersSerializable="TotConsumo" LabelsVisibility="False">
            <ViewSerializable>
                <dx:RadarPointSeriesView></dx:RadarPointSeriesView>
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
                      </div>
                  <div class="col-lg-2">
                            
                      </div>
                   <div class="col-lg-4 col-xs-12" style="float:left;">
                  <dx:WebChartControl ID="webChartControl4" runat="server"  Height="250" Width="500" Theme="Office365" AutoLayout="true" >
                                <Titles>
                                    <dx:ChartTitle Text="Consumos Por Producto" />
                                    </Titles>
                                <SeriesTemplate ArgumentDataMember="Producto" ValueDataMembersSerializable="TotConsumo" LabelsVisibility="False">
            <ViewSerializable>
                <dx:RadarPointSeriesView></dx:RadarPointSeriesView>
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
                        </div>
        </div>
          </div>
<%-- Fin de Grafica de Consumos  --%>
</asp:Content>

