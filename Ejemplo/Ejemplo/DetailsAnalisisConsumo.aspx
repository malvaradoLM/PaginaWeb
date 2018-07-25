<%@ Page Language="C#" MasterPageFile="~/Home.Master" EnableEventValidation="true" AutoEventWireup="true" CodeBehind="DetailsAnalisisConsumo.aspx.cs" Inherits="Ejemplo.DetailsAnalisisConsumo" %>

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
.buttonMargin {
        margin-left: 100%;
        margin-top: 40px;
    }
.radioMargin{
    margin-top: -12px;
}
.bordes{
    border:none;
}
.tamanoDetalles{
    height:500px;
        margin-left: 50px;
}
.marginTab{
        margin-left: 6%;
}
.alinearConsumos{
        margin-left: 50px;
        margin-top:0px;
}
.coloresGrid a{
    color: gray;
}
.coloresGrid {
    color: gray;
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
    function ocultarDetalles(s,e) {       
        if (document.getElementById('<%= detallesConsumo.ClientID %>') != null) {
            document.getElementById('<%= detallesConsumo.ClientID %>').remove("visible");
            document.getElementById('<%= panelDetallesConsumo.ClientID %>').remove("visible");
        }
    }
    function descargarDocumento(s, e) {
        var url = document.getElementById("<%=hiddenURL.ClientID%>");
        var descarga = url.value;
        var nombreDoc = document.getElementById("<%=ticketName.ClientID%>");
        download_file(url.value, nombreDoc.value+".pdf"); 

    }
    function download_file(fileURL, fileName) {
        // for non-IE
        if (!window.ActiveXObject) {
            var save = document.createElement('a');
            save.href = fileURL;
            save.target = '_blank';
            var filename = fileURL.substring(fileURL.lastIndexOf('/') + 1);
            save.download = fileName || filename;
            if (navigator.userAgent.toLowerCase().match(/(ipad|iphone|safari)/) && navigator.userAgent.search("Chrome") < 0) {
                document.location = save.href;
                // window event not working here
            } else {
                var evt = new MouseEvent('click', {
                    'view': window,
                    'bubbles': true,
                    'cancelable': false
                });
                save.dispatchEvent(evt);
                (window.URL || window.webkitURL).revokeObjectURL(save.href);
            }
        }

        // for IE < 11
        else if (!!window.ActiveXObject && document.execCommand) {
            var _window = window.open(fileURL, '_blank');
            _window.document.close();
            _window.document.execCommand('SaveAs', true, fileName || fileURL)
            _window.close();
        }
    }
</script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDN_xSn-jF76JH6J_qmU50SpqF_6kNIePU">
</script>

   <link href="css/breadCrumb.css" rel="stylesheet">
   
    <script type="text/javascript" src="https://www.bing.com/api/maps/mapcontrol?callback=LoadMap" async defer></script>
<div class="alert alert-warning" id="msjAlerta" runat="server">
        <strong>Advertencia! </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>
    <div id="cssmenu" style="margin-top:60px;" class="row">  
    <ul>
        <li class="active"><a><asp:Label runat="server" id="etiqueta" Text="Análisis de Consumo"/></a></li>
        <li><a href="Reportes.aspx">Reportes</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Home</a></li>
    </ul>
</div>  
    <div class="fade-in animacion">  
        <dx:ASPxRoundPanel ID="panelParametros" ClientInstanceName="roundPanel" HeaderText="PARAMETROS" runat="server" Width="90%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes" HeaderStyle-ForeColor="Gray" >
        <PanelCollection>
            <dx:PanelContent>
                <dx:ASPxFormLayout runat="server" ID="ASPxFormLayout1" RequiredMarkDisplayMode="All"  EncodeHtml="false" UseDefaultPaddings="false" Theme="Office365" SettingsItems-HorizontalAlign="Center"   >
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500"  />
            <Items>
            <dx:LayoutGroup Caption="PARAMETROS" SettingsItemHelpTexts-Position="Bottom"  GroupBoxStyle-Border-BorderStyle="Solid" GroupBoxStyle-Caption-Font-Bold="true" GroupBoxStyle-Caption-Font-Size="Large" CssClass="TextForm" ColCount="4" ShowCaption="False" >
                <GroupBoxStyle Border-BorderStyle="Solid" CssClass="shadowBox">
                    <Caption Font-Bold="True">
                    </Caption>
                </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem Caption="Fecha Inicial" HelpText="Porfavor, ingrese la fecha inicial" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxDateEdit ID="txtFechaInicial" runat="server" OnValidation="txtFechaInicial_Validation" Theme="Office365" EditFormatString="MM/dd/yyyy" >
                                    <DropDownButton Image-IconID="">
                                        <Image IconID="conditionalformatting_adateoccurring_16x16">
                                        </Image>
                                    </DropDownButton>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" RequiredField-IsRequired="true" ErrorText="Valor inválido" >
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Fecha Final" HelpText="Porfavor, ingrese la fecha final" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxDateEdit ID="txtFechaFinal" runat="server" OnValidation="txtFechaFinal_Validation" Theme="Office365" EditFormatString="MM/dd/yyyy">
                                    <DropDownButton>
                                        <Image IconID="conditionalformatting_adateoccurring_16x16">
                                        </Image>
                                    </DropDownButton>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" RequiredField-IsRequired="true" ErrorText="Valor inválido">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem> 
                    <dx:LayoutItem Caption="Mostrar Por:" HorizontalAlign="Left" RequiredMarkDisplayMode="Hidden" CssClass="radioMargin" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxRadioButtonList ID="chkBoxList" runat="server" Border-BorderWidth="0" Theme="Office365">
                                    <Items>
                                        <dx:ListEditItem Text="Cliente" value="1" />
                                        <dx:ListEditItem Text="Grupo" value="2" />
                                    </Items>
                                    <Border BorderWidth="0px" />
                                </dx:ASPxRadioButtonList>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutGroup Border-BorderStyle="None"  Caption=" " CssClass="buttonMargin" GroupBoxDecoration="None" HorizontalAlign="Right" SettingsItemCaptions-HorizontalAlign="Right" Width="100" RowSpan="2" VerticalAlign="Bottom">
                        <Border BorderStyle="None" />
                        <Items>
                            <dx:LayoutItem  Border-BorderWidth="0px" CssClass="buttonMargin" HorizontalAlign="Right" RequiredMarkDisplayMode="Hidden" ShowCaption="False" Width="100">
                                <LayoutItemNestedControlCollection >
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" BorderStyle="None"  runat="server" ValidateRequestMode="Disabled" >
                                        <dx:ASPxButton ID="btnCancelar4" runat="server" OnClick="btnCancelar_Click" Text="Cancelar"  Theme="Office365" Width="80" UseSubmitBehavior="False"  CausesValidation="false" CssClass="shadowBoxMin"    />
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="   " />
                                        <dx:ASPxButton ID="btnProcesar4" UseSubmitBehavior="False" runat="server" OnClick="btnProcesar_Click" Text="Aceptar" Theme="Office365" Width="80" CssClass="shadowBoxMin"    />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <Border BorderWidth="0px" />
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Right" />
                    </dx:LayoutGroup>
                </Items>
                <SettingsItemHelpTexts Position="Bottom" />
            </dx:LayoutGroup>
        </Items>
            <SettingsItems HorizontalAlign="Center" />
        </dx:ASPxFormLayout>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>


    <%-- Tabla Consumos--%>
                <dx:ASPxRoundPanel ID="panelConsumos" ClientInstanceName="panelConsumos" HeaderText="CONSUMOS" runat="server" Width="90%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes fade-in animacion" HeaderStyle-ForeColor="Gray">
                    <PanelCollection>
            <dx:PanelContent>
                <dx:BootstrapGridView ID="bgvConsumo2" runat="server"  KeyFieldName="ID"  ClientSideEvents-BeginCallback="ocultarDetalles" Width="90%" CssClasses-Control="shadowBox alinearConsumos" CssClasses-HeaderRow="coloresGrid" >
    <Settings ShowGroupPanel="true"/>
    <Settings ShowFooter="True" />
    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
    <SettingsBehavior AllowFocusedRow="True" />
    <SettingsText SearchPanelEditorNullText="Buscar" GroupPanel=" "/>
    <SettingsAdaptivity  AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
    <Columns>
        <dx:BootstrapGridViewTextColumn FieldName="ID"   HorizontalAlign="Center" CssClasses-HeaderCell="coloresGrid"  >    
                         <DataItemTemplate>
                            <asp:LinkButton runat="server" Text='<%#Eval("ID")%>' OnClick="Unnamed_Click" ID='button1' CssClass="coloresGrid"  />
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
                </dx:PanelContent>
                </PanelCollection>   
                </dx:ASPxRoundPanel>
     <%-- Formulario Nuevo --%>
</div>
      <dx:ASPxRoundPanel ID="panelDetallesConsumo" ClientInstanceName="panelDetallesConsumo" HeaderText="DETALLES DEL CONSUMO" runat="server" Width="90%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes fade-in animacion" HeaderStyle-ForeColor="Gray">
                    <PanelCollection>
            <dx:PanelContent>







                <div id="detallesConsumo" runat="server" class="detalles"  >
    <dx:ASPxPageControl ID="carTabPage" Width="90%" runat="server"  EnableHierarchyRecreation="true" ActiveTabIndex="0"  Border-BorderStyle="None" CssClass="page-header alinearConsumos" Theme="Office365" EnableTabScrolling="true">
        <TabPages>
            <dx:TabPage Text="TICKET">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">
                <dx:ASPxRibbon ID="Ribbon" ClientInstanceName="Ribbon" runat="server" ShowGroupLabels="False" ShowFileTab="False" Width="100%" Theme="Office365" Minimized="True" Visible="true"   >
            <Styles TabContent-BackColor="White" GroupSeparator-BackColor="Transparent" GroupSeparator-Border-BorderStyle="None"  >
                <Item Width="100px"></Item>
                <GroupExpandButton Width="100px" BackColor="White"></GroupExpandButton>
                <TabContent Height="30px"/>
            </Styles>
            <Tabs>
                <dx:RibbonTab Text="Descargar" >
                    <Groups>
                        <dx:RibbonGroup Text="Home">
                            <Items>
                                <dx:RibbonButtonItem  NavigateUrl="javascript:descargarDocumento()"  Name="DESCARGAR" ToolTip="DESCARGAR DOCUMENTO" >
                                    <LargeImage IconID="actions_download_32x32"></LargeImage>
                                    <SmallImage IconID="actions_download_16x16">
                                    </SmallImage>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </dx:RibbonButtonItem>
                            </Items>
                        </dx:RibbonGroup>
                    </Groups>
                </dx:RibbonTab>
            </Tabs>
        </dx:ASPxRibbon>
                 <iframe id="ticket" style="position:relative; width: 100% ; height:400px;" runat="server" class="shadowBox" ></iframe>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="FOTOGRAFÍA">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl2" runat="server">
                        <dx:ASPxImageSlider ID="imageSlider" runat="server" ClientInstanceName="imageSlider" CssClass="imageSlider carousel"  Width="90%">
                            <SettingsSlideShow AutoPlay="true" StopPlayingWhenPaging="true" PausePlayingWhenMouseOver="true" />
                         </dx:ASPxImageSlider>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="GEOLOCALIZACIÓN">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl3" runat="server">
                  <div id="myMap" style="position:relative; width: 90% ; height:500px;" ></div>
                        <iframe runat="server" id="mapagoogle"  style="width:100%;height:500px;"></iframe>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>	
    </div>	
                </dx:PanelContent>
                        </PanelCollection>
    </dx:ASPxRoundPanel>
        
    <asp:HiddenField ID="hiddenURL" runat="server" />
    <asp:HiddenField ID="ticketName" runat="server" />
    <div ID="bottom" runat="server" />
</asp:Content>
