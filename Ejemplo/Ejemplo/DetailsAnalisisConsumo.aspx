<%@ Page Language="C#" MasterPageFile="~/site1.Master" EnableEventValidation="true" AutoEventWireup="true" CodeBehind="DetailsAnalisisConsumo.aspx.cs" Inherits="Ejemplo.DetailsAnalisisConsumo" %>

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
.labelCuadro
{
    color: #ffffff;
    font-family: 'Roboto Condensed', sans-serif;
}
/* easy tabs css */
.easytabs {
width: 850px;
height: auto;
float: left;
text-transform: capitalize;
margin-bottom: 20px;
}
.easytabs ul.tabs {
margin: 0;
padding: 0;
float: left;
list-style: none;
height: auto;
border-bottom: 1px solid #06F;
width: 850px;
-moz-border-radius-topleft: 5px;
-webkit-border-top-left-radius: 5px;
border-top-left-radius: 5px;
}
.easytabs ul.tabs li {
float: left;
margin: 0;
padding: 0;
height: auto;
width: auto;
margin-right: 3px;
margin-top: 1px;
margin-bottom: -1px;
overflow: hidden;
position: relative;
background: #fff url(../images/tab_inactive_bg.png) bottom left repeat-x;
-moz-border-radius-topleft: 5px;
-moz-border-radius-topright: 5px;
-webkit-border-top-left-radius: 5px;
-webkit-border-top-right-radius: 5px;
border-top-left-radius: 5px;
border-top-right-radius: 5px;
text-align: center;
border-top: 1px solid #c2c2c2;
border-left: 1px solid #c2c2c2;
border-right: 1px solid #c2c2c2;
border-bottom: 1px solid #06F;
}
.easytabs ul.tabs li a {
text-decoration: none;
color: #222;
display: block;
padding: 8px 16px;
outline: none;
text-align: center;
font-size: 14px;
line-height: 18px;
text-transform: uppercase;
}
.easytabs ul.tabs li.active {
background: #06F;
border: 1px solid #06F;
}
.easytabs ul.tabs li.active a {
font-weight: bold;
color: #fff;
}
.easytabs .tab_container {
overflow: hidden;
clear: both;
float: left;
width: 808px;
background: #fff;
overflow: auto;
height: auto;
line-height: 16px;
padding: 20px;
border-bottom: 1px solid #06F;
border-left: 1px solid #06F;
border-right: 1px solid #06F;
}
.easytabs .tab_content {
width: 100%;
height: auto;
float: left;
}
 </style>
<script type="text/javascript">
    /*
    var map = null;

    function LoadMap() {
        map = new Microsoft.Maps.Map('#myMap', {
            credentials: "Amj5vm4UWJ5FGig8NYp7xQLVV5RJEXMz0KGIl5BFnCVT2B1GHKsjnQ1MYZFy5_pw"
        });
        
        $('#btnProcesar').click(function () {
            var url = "/Home/GetLocations";
            $.getJSON(url, null, function (data) {
                var pins = [];

                $.each(data, function (index, LocationData) {
                    var pushpin = new Microsoft.Maps.Pushpin(new Microsoft.Maps.Location(LocationData.latitude,LocationData.longitude));

                    pins.push(pushpin);
                });

                map.entities.push(pins);

                map.setView({
                    zoom: 4, center: new Microsoft.Maps.Location(23.505353, 78.485292)
                });
            });
        });
        
    };
    */
</script>
<script type="text/javascript" src="https://www.bing.com/api/maps/mapcontrol?callback=LoadMap" async defer></script>

<div id="nav" class="container" style="margin-left:0px; margin-right:0px"><h1>Análisis de Consumo</h1></div>
    <div class="row">
            <ol class="breadcrumb Cards-Contenido col-lg-10" style="background:initial;">
                <li class="breadcrumb-item"><a href="Reportes.aspx">Reportes</a></li>
                <li class="breadcrumb-item active ">Análisis de Consumo</li>
            </ol>
        </div>
    <div id="exTab1" class="container" style="margin-left:0px; margin-right:0px">	
        <ul id="myTabs" class="nav nav-pills" style="padding:0px">
		</ul>
        <div class="tab-content clearfix">
            <div class="tab-pane active" id="1a" >
         <table style="width:100%; height:500px">
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblFechaInicial" Text="FECHA INICIAL" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxDateEdit ID="txtFechaInicial" runat="server" Font-Bold="true"/>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblFechaFinal" Text="FECHA FINAL" runat="server" Font-Bold="true"/></td>
                            <td>
                            <dx:ASPxDateEdit ID="txtFechaFinal" runat="server" Font-Bold="true"/>
                            </td>
                        </tr>
                        <tr>
                             <td><dx:ASPxLabel ID="lblCheckBoxes" Text="SELECCIONE UNA OPCION" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxRadioButtonList ID="chkBoxList" runat="server" Border-BorderWidth="0">
                                    <Items>
                                    <dx:ListEditItem Text="MOSTRAR CONSUMOS DEL CLIENTE" value="1"   />
                                    <dx:ListEditItem Text="MOSTRAR CONSUMOS DEL GRUPO" value="2" />
                                    </Items>
                                 </dx:ASPxRadioButtonList>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        <asp:LinkButton  id="btnProcesar" OnClick="btnProcesar_Click"  class="btn-sample btn-lg labelCuadro"  type="button" style="float:right;margin-top: 1px; background-color:mediumseagreen" runat="server" Text="PROCESAR " >
    
</asp:LinkButton>
<asp:LinkButton id="btnCancelar" OnClick="btnCancelar_Click" class="btn-sample btn-lg labelCuadro"  type="button" style="float:right;background-color:red; margin-right:1px; margin-top: 1px;" runat="server" Text="CANCELAR " >
  
 </asp:LinkButton>
    <dx:BootstrapGridView ID="bgvConsumo2" runat="server"  KeyFieldName="ID" >
    <SettingsSearchPanel Visible="true" ShowApplyButton="true" />
    <Settings ShowTitlePanel="true" />
    <Settings ShowGroupPanel="true"/>
    <Settings ShowFooter="True" />
    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
    <SettingsBehavior AllowFocusedRow="True" />
    <SettingsText SearchPanelEditorNullText="Buscar" GroupPanel=" "/>
    <Columns>
        <dx:BootstrapGridViewTextColumn FieldName="ID"   HorizontalAlign="Center"  >    
                         <DataItemTemplate>
                            <asp:LinkButton runat="server" Text='<%#Eval("ID")%>' OnClick="Unnamed_Click" ID='button1'  />
                         </DataItemTemplate>   
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="EstacionID" HorizontalAlign="Center" >
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="FechaCarga"  UnboundType="DateTime" HorizontalAlign="Center">
                               <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />        
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewCheckColumn FieldName="Facturado"    UnboundType="Boolean" HorizontalAlign="Center">
                                    
                    </dx:BootstrapGridViewCheckColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Producto"   UnboundType="String" HorizontalAlign="Center">
                                    
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Serie" UnboundType="String" HorizontalAlign="Center" >
                                    
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Folio"  UnboundType="String"  HorizontalAlign="Center">
                                   
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewDataColumn FieldName="Cantidad"   UnboundType="Decimal">
                                   
                    </dx:BootstrapGridViewDataColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Precio"   UnboundType="Decimal" >
                             <PropertiesTextEdit DisplayFormatString="c" /> 
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Importe"   UnboundType="Decimal" >
                                 <PropertiesTextEdit DisplayFormatString="c" />    
                    </dx:BootstrapGridViewTextColumn>
    </Columns>
    <TotalSummary>
        <dx:ASPxSummaryItem FieldName="Cantidad"  SummaryType="Sum" DisplayFormat="c"  />
        <dx:ASPxSummaryItem FieldName="Importe" SummaryType="Sum" DisplayFormat="c"  />
    </TotalSummary>
</dx:BootstrapGridView>  
        <div id="detallesConsumo" runat="server"  >
    <dx:ASPxPageControl ID="carTabPage" Width="100%" runat="server" ActiveTabIndex="2" EnableHierarchyRecreation="True"  >
        <TabPages>
            <dx:TabPage Text="TICKET">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">
                        <dx:ASPxImage runat="server" ID="Image1" ImageUrl="~/TabControl/Images/(London)-Tower-Bridge.jpg" CssClass="dxtmImage" />
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="FOTOGRAFÍA">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl2" runat="server">
                        <dx:ASPxImageSlider ID="imageSlider" runat="server" ClientInstanceName="imageSlider" CssClass="imageSlider"  EnableTheming="false" Width="100%">
                            <ClientSideEvents Init="function(s, e) { s.Focus(); }" />
                         </dx:ASPxImageSlider>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="GEOLOCALIZACIÓN">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl3" runat="server">
                  <div id="myMap" style="position:relative; width: 100% ; height:600px;"></div>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>	
    </div>	
</div>	
</asp:Content>
