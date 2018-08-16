<%@ Page Language="C#" MasterPageFile="~/Home.Master" EnableEventValidation="true" AutoEventWireup="true" CodeBehind="DetailsAnalisisConsumo.aspx.cs" Inherits="Ejemplo.DetailsAnalisisConsumo" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%--  --%>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
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
        margin-top:0px;
}
.coloresGrid a{
    color: gray;
}
.coloresGrid {
    color: gray;
}
    .FloatRight{

            width:90%;
    }
    .descargarButton{
        float:right;
        margin-bottom:5px;
    }
@media screen and (max-width: 480px) {
  .FloatRight{

            width:100%;
            float: right;
    }
    .linkclass
{
    width:0px;
}
    }
carouselSize{
    height:500px;
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
   
    
<div class="alert alert-warning" id="msjAlerta" runat="server">
        <strong>Advertencia! </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>
    <div id="cssmenu" style="margin-top:60px;" class="row">  
    <ul>
        <li class="active"><a><asp:Label runat="server" id="etiqueta" Text="Análisis de Consumo"/></a></li>
        <li><a href="Reportes.aspx">Reportes</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Inicio</a></li>
    </ul>
</div>  
    <div class="fade-in animacion">  
        <dx:ASPxRoundPanel ID="panelParametros" Width="100%" ClientInstanceName="roundPanel" HeaderText="PARAMETROS" runat="server"  Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes" HeaderStyle-ForeColor="Gray" >
<HeaderStyle ForeColor="Gray"></HeaderStyle>
        <PanelCollection>
            <dx:PanelContent>
                <dx:ASPxFormLayout runat="server" ID="ASPxFormLayout1" RequiredMarkDisplayMode="All"  EncodeHtml="false" UseDefaultPaddings="false" Theme="Office365" SettingsItems-HorizontalAlign="Center"    >
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

<CaptionStyle Font-Bold="True"></CaptionStyle>
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

<CaptionStyle Font-Bold="True"></CaptionStyle>
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

<CaptionStyle Font-Bold="True"></CaptionStyle>
                    </dx:LayoutItem>
                    <dx:LayoutGroup Border-BorderStyle="None"  Caption=" " CssClass="buttonMargin" GroupBoxDecoration="None" HorizontalAlign="Right" SettingsItemCaptions-HorizontalAlign="Right" Width="100" RowSpan="2" VerticalAlign="Bottom">
                        <Border BorderStyle="None" />
                        <Items>
                            <dx:LayoutItem  Border-BorderWidth="0px" CssClass="buttonMargin" HorizontalAlign="Right" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                <LayoutItemNestedControlCollection >
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" BorderStyle="None"  runat="server" ValidateRequestMode="Disabled" >
                                        <dx:ASPxButton ID="btnCancelar4" runat="server" OnClick="btnCancelar_Click" Text="Cancelar"  Theme="Office365"  UseSubmitBehavior="False"  CausesValidation="false" CssClass="shadowBoxMin" Width="80"  ImagePosition="Right">
                                            <Image Url="~/Icons/png/16px/large/button-cancel.png">
                                              </Image>
                                             </dx:ASPxButton>
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="   " />
                                        <dx:ASPxButton ID="btnProcesar4" UseSubmitBehavior="False" runat="server" OnClick="btnProcesar_Click" Text="Aceptar" Theme="Office365"  CssClass="shadowBoxMin" Width="80"    ImagePosition="Right">
                                         <Image Url="~/Icons/png/16px/large/button-ok.png">
                                              </Image>
                                             </dx:ASPxButton>
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

<Border BorderColor="Gray" BorderStyle="None" BorderWidth="0px"></Border>
    </dx:ASPxRoundPanel>


    <%-- Tabla Consumos--%>
                <dx:ASPxRoundPanel ID="panelConsumos" ClientInstanceName="panelConsumos" HeaderText="CONSUMOS" runat="server" Width="100%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes fade-in animacion"  HeaderStyle-ForeColor="Gray" AutoPostback="false">
<HeaderStyle ForeColor="Gray"></HeaderStyle>
                    <PanelCollection>
            <dx:PanelContent>
  <dx:BootstrapGridView ID="bgvConsumo2" runat="server"  KeyFieldName="ID"  ClientSideEvents-BeginCallback="ocultarDetalles" Width="100%" CssClasses-Control="alinearConsumos FloatRight" CssClasses-HeaderRow="coloresGrid" SettingsDetail-AllowOnlyOneMasterRowExpanded="true" OnBeforeColumnSortingGrouping="bgvConsumo2_BeforeColumnSortingGrouping"   >
    <Settings ShowFooter="True" GroupSummaryTextSeparator=" Litros - Importe: " ShowGroupedColumns="true"  ShowHeaderFilterButton="true" ShowGroupButtons="true" ShowGroupPanel="true"/>

    <SettingsBehavior AllowFocusedRow="True"  /><SettingsDetail ShowDetailRow="true" ShowDetailButtons="true"  />
<CssClasses HeaderRow="coloresGrid" Control="alinearConsumos FloatRight"></CssClasses>

    <Settings ShowGroupPanel="true" ShowColumnHeaders="true"/>
    <SettingsAdaptivity  AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"  />
    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
    <SettingsText SearchPanelEditorNullText="Buscar" GroupPanel="Arrastre una cabecera aquí para Agrupar"/>
    <Columns>
        <dx:BootstrapGridViewTextColumn FieldName="ID"   HorizontalAlign="Center" CssClasses-HeaderCell="coloresGrid" VisibleIndex="1" >    
                         <CssClasses />
                         <DataItemTemplate>
                            <asp:LinkButton runat="server" Text='<%#Eval("ID")%>' OnClick="Unnamed_Click" ID='button1'  />
                         </DataItemTemplate>
                    <Settings AllowHeaderFilter="False" />
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="EstacionID" HorizontalAlign="Center" VisibleIndex="2"  >
                        <SettingsHeaderFilter Mode="CheckedList" />
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="VehiculoID" HorizontalAlign="Center" VisibleIndex="3"  >
                        <SettingsHeaderFilter Mode="CheckedList" />
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Identificacion" HorizontalAlign="Center" VisibleIndex="4" >
                        <SettingsHeaderFilter Mode="CheckedList" />
                    </dx:BootstrapGridViewTextColumn>
                      <dx:BootstrapGridViewTextColumn FieldName="Nombre" HorizontalAlign="Center" VisibleIndex="5" >
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="FechaCarga"  UnboundType="DateTime" HorizontalAlign="Center" VisibleIndex="6">
                               <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />       
                        <SettingsHeaderFilter Mode="DateRangeCalendar" />
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewCheckColumn FieldName="Facturado"    UnboundType="Boolean" HorizontalAlign="Center" VisibleIndex="7" Visible="false">
                                    
                    </dx:BootstrapGridViewCheckColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Producto"   UnboundType="String" HorizontalAlign="Center" VisibleIndex="8">
                                    <SettingsHeaderFilter Mode="CheckedList" />
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Serie" UnboundType="String" HorizontalAlign="Center" VisibleIndex="9" Visible="false" >
                                    
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Folio"  UnboundType="String"  HorizontalAlign="Center" VisibleIndex="10" Visible="false">
                                   
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewDataColumn FieldName="Cantidad"   UnboundType="Decimal" VisibleIndex="11">
                                   <Settings AllowHeaderFilter="False" />
                    </dx:BootstrapGridViewDataColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Precio"   UnboundType="Decimal" VisibleIndex="12" >
                             <PropertiesTextEdit DisplayFormatString="c" /> 
                        <Settings AllowHeaderFilter="False" />
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Importe"   UnboundType="Decimal" VisibleIndex="13" >
                                 <PropertiesTextEdit DisplayFormatString="c" />    
                        <Settings AllowHeaderFilter="False" />
                    </dx:BootstrapGridViewTextColumn>
    </Columns>
      <Templates>
        <DetailRow>
            <dx:ASPxPageControl ID="carTabPage" Width="100%" runat="server"  EnableHierarchyRecreation="true" ActiveTabIndex="0"  Border-BorderStyle="None"  Theme="Moderno" EnableTabScrolling="true" OnInit="Unnamed_Click" Border-BorderWidth="0"  >
        <TabPages>
            <dx:TabPage Text="TICKET">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">
                 <dx:ASPxButton runat="server" ClientSideEvents-Click="descargarDocumento" Theme="Office365" Text="DESCARGAR" AutoPostBack="false" CssClass="descargarButton shadowBoxMin" ImagePosition="Right">
                     <Image Url="~/Icons/png/16px/large/button-download.png">
                                              </Image>
                 </dx:ASPxButton>
                 <iframe id="ticket" style="position:relative; width: 100% ; height:500px;" runat="server" class="shadowBox fade-in animacion" onload="ticketDetail_Load" ></iframe>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="FOTOGRAFÍA">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl2" runat="server">
                        <dx:ASPxImageSlider ID="imageSlider" runat="server" ClientInstanceName="imageSlider" CssClass="imageSlider carousel fade-in animacion carouselSize" Width="100%"  OnLoad="imageSlider_Load">
                            <SettingsSlideShow AutoPlay="true" StopPlayingWhenPaging="true" PausePlayingWhenMouseOver="true" />
                         </dx:ASPxImageSlider>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="GEOLOCALIZACIÓN">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl3" runat="server">
                      <%--  <div id="myMap" style="position:relative; width: 90% ; height:500px;"></div> --%> 
                        <iframe runat="server" id="mapagoogle"  style="width:100%;height:500px;" class="fade-in animacion shadowBox" onload="mapagoogle_Load"></iframe>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>	
        </DetailRow>
    </Templates>
<ClientSideEvents BeginCallback="ocultarDetalles"></ClientSideEvents>
    <TotalSummary>
        <dx:ASPxSummaryItem FieldName="Cantidad"  SummaryType="Sum"  />
        <dx:ASPxSummaryItem FieldName="Importe" SummaryType="Sum" DisplayFormat="c"  />
    </TotalSummary>
    <GroupSummary>
        <dx:ASPxSummaryItem  FieldName="Cantidad" SummaryType="Sum"/>
        <dx:ASPxSummaryItem  FieldName="Importe" SummaryType="Sum" DisplayFormat="c"/>
    </GroupSummary>
</dx:BootstrapGridView>
                </dx:PanelContent>
                </PanelCollection>   

<Border BorderColor="Gray" BorderStyle="None" BorderWidth="0px"></Border>
                </dx:ASPxRoundPanel>
     <%-- Formulario Nuevo --%>
        <dx:ASPxRoundPanel ID="panelDetallesConsumo" ClientInstanceName="panelDetallesConsumo" HeaderText="DETALLES DEL CONSUMO" runat="server" Width="90%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes fade-in animacion" HeaderStyle-ForeColor="Gray">
                    <PanelCollection>
            <dx:PanelContent>
                <div id="detallesConsumo" runat="server" class="detalles" style="visibility:hidden;"  >
    <dx:ASPxPageControl ID="carTabPage" Width="90%" runat="server"  EnableHierarchyRecreation="true" ActiveTabIndex="0"  Border-BorderStyle="None" CssClass="page-header alinearConsumos" Theme="Office365" EnableTabScrolling="true">
        <TabPages>
            <dx:TabPage Text="TICKET">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">
                 <dx:ASPxButton runat="server" ClientSideEvents-Click="descargarDocumento" Theme="Office365" Text="DESCARGAR" AutoPostBack="false" CssClass="descargarButton shadowBoxMin" />
                 <iframe id="ticket" style="position:relative; width: 100% ; height:500px;" runat="server" class="shadowBox fade-in animacion" ></iframe>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="FOTOGRAFÍA">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl2" runat="server">
                        <dx:ASPxImageSlider ID="imageSlider" runat="server" ClientInstanceName="imageSlider" CssClass="imageSlider carousel fade-in animacion"  Width="100%">
                            <SettingsSlideShow AutoPlay="true" StopPlayingWhenPaging="true" PausePlayingWhenMouseOver="true" />
                         </dx:ASPxImageSlider>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="GEOLOCALIZACIÓN">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl3" runat="server">
                      <%--  <div id="myMap" style="position:relative; width: 90% ; height:500px;"></div> --%> 
                        <iframe runat="server" id="mapagoogle"  style="width:100%;height:500px;" class="fade-in animacion shadowBox"></iframe>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>	
    </div>	
                </dx:PanelContent>
                        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
      
        
    <asp:HiddenField ID="hiddenURL" runat="server" />
    <asp:HiddenField ID="ticketName" runat="server" />
    <asp:HiddenField ID="HiddenFocusIndex" runat="server" />
    <div ID="bottom" runat="server" />
</asp:Content>
