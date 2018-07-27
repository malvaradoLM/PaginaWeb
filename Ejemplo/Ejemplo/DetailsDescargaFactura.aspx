<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home.Master" CodeBehind="DetailsDescargaFactura.aspx.cs" Inherits="Ejemplo.DetailsDescargaFactura" %>

<%@ Register Assembly="DevExpress.Web.ASPxRichEdit.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRichEdit" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
        margin-left: 50px;
        margin-top:0px;
}
.coloresGrid a{
    color: gray;
}
.coloresGrid {
    color: gray;
}
.wordWrap {
    word-wrap: break-word;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    width: 1200px;
    height: 800px;
}
 </style>
    <script type="text/javascript">
        function ocultarDetalles(s, e) {
            if (document.getElementById('<%= detallesConsumo.ClientID %>') != null) {
            document.getElementById('<%= detallesConsumo.ClientID %>').remove("visible");
            }
        }
</script>

    <div class="alert alert-warning" id="msjAlerta" runat="server" visible="false">
        <strong>Advertencia! </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>
     <link href="css/breadCrumb.css" rel="stylesheet">
     <div id="cssmenu" style="margin-top:60px;" class="row">  
    <ul>
        <li class="active"><a href="DetailsDescargaFactura.aspx">Descarga de Facturas</a></li>
        <li><a href="DetailsListaFactura.aspx">Listado de Facturas</a></li>
        <li><a href="DatosCliente.aspx">Datos Cliente</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Home</a></li>
    </ul>
</div>    





    <script type="text/javascript" src="https://www.bing.com/api/maps/mapcontrol?callback=LoadMap" async defer></script>
    <div class="fade-in animacion">
         <dx:ASPxPageControl ID="pageConsumos" Width="100%" runat="server"  EnableHierarchyRecreation="true" ActiveTabIndex="0"  Border-BorderStyle="None" CssClass="page-header" Theme="Office365" >
        <TabPages>
            <dx:TabPage Text="CONSUMOS">
                <ContentCollection>
                        <dx:ContentControl ID="ContentControl2" runat="server">

                            <dx:ASPxRoundPanel ID="panelConsumos" ClientInstanceName="panelDetallesConsumo" HeaderText="LISTA DE CONSUMOS" runat="server" Width="90%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes fade-in animacion" HeaderStyle-ForeColor="Gray">
<HeaderStyle ForeColor="Gray"></HeaderStyle>
                    <PanelCollection>
            <dx:PanelContent>
                                
                                <dx:BootstrapGridView ID="bgvConsumo" runat="server"  KeyFieldName="ID" ClientSideEvents-BeginCallback="ocultarDetalles"  >
                                    <ClientSideEvents BeginCallback="ocultarDetalles" />
    <SettingsSearchPanel Visible="true" ShowApplyButton="true" />
    <Settings ShowTitlePanel="true" />
    <Settings ShowGroupPanel="true"/>
    <Settings ShowFooter="True" />
    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
    <SettingsBehavior AllowFocusedRow="True" />
    <SettingsText SearchPanelEditorNullText="Buscar" GroupPanel=" "/>
    <Columns>
        <dx:BootstrapGridViewTextColumn FieldName="ID"   HorizontalAlign="Center"   >    
                         <DataItemTemplate>
                            <asp:LinkButton runat="server" Text='<%#Eval("ID")%>' OnClick="button1_Click" ID='button1'  />
                         </DataItemTemplate>   
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="EstacionID" HorizontalAlign="Center" />
                    <dx:BootstrapGridViewTextColumn FieldName="Ticket"    UnboundType="String" HorizontalAlign="Center" />
                    <dx:BootstrapGridViewTextColumn FieldName="FechaCarga"  UnboundType="DateTime" HorizontalAlign="Center">
                               <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />        
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Producto"   UnboundType="String" HorizontalAlign="Center" />
        <dx:BootstrapGridViewTextColumn FieldName="Serie"   UnboundType="String" HorizontalAlign="Center" />        
        <dx:BootstrapGridViewTextColumn FieldName="Folio"   UnboundType="String" HorizontalAlign="Center" />        
                    <dx:BootstrapGridViewDataColumn FieldName="Cantidad"   UnboundType="Decimal" />
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

<Border BorderColor="Gray" BorderStyle="None" BorderWidth="0px"></Border>
                </dx:ASPxRoundPanel>

<dx:ASPxRoundPanel ID="panelDetallesConsumo" ClientInstanceName="panelDetallesConsumo" HeaderText="DETALLES DEL CONSUMO" runat="server" Width="90%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes fade-in animacion" HeaderStyle-ForeColor="Gray">
<HeaderStyle ForeColor="Gray"></HeaderStyle>
                    <PanelCollection>
            <dx:PanelContent>







                <div id="detallesConsumo" runat="server" class="detalles"  >
    <dx:ASPxPageControl ID="carTabPage" Width="100%" runat="server"  EnableHierarchyRecreation="true" ActiveTabIndex="0"  Border-BorderStyle="None"  Theme="Metropolis" EnableTabScrolling="true">
        <TabPages>
            <dx:TabPage Text="TICKET">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">
                <dx:ASPxRibbon ID="Ribbon" ClientInstanceName="Ribbon" runat="server" ShowGroupLabels="False" ShowFileTab="False" Width="100%" Theme="Office365" Minimized="True" Visible="true"   >
            <Styles TabContent-BackColor="White" GroupSeparator-BackColor="Transparent" GroupSeparator-Border-BorderStyle="None"  >
                <Item Width="100px"></Item>
                <GroupExpandButton Width="100px" BackColor="White"></GroupExpandButton>

<GroupSeparator Border-BorderStyle="None" BackColor="Transparent"></GroupSeparator>

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
                    <dx:ContentControl ID="ContentControl3" runat="server">
                        <dx:ASPxImageSlider ID="imageSlider" runat="server" ClientInstanceName="imageSlider" CssClass="imageSlider carousel"  Width="90%">
                            <SettingsSlideShow AutoPlay="true" StopPlayingWhenPaging="true" PausePlayingWhenMouseOver="true" />
                         </dx:ASPxImageSlider>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="GEOLOCALIZACIÓN">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl4" runat="server">
                  <div id="myMap" style="position:relative; width: 90% ; height:500px;" ></div>
                        <iframe runat="server" id="mapagoogle"  style="width:100%;height:500px;"></iframe>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>

<Border BorderStyle="None"></Border>
    </dx:ASPxPageControl>	
    </div>	
                </dx:PanelContent>
                        </PanelCollection>

<Border BorderColor="Gray" BorderStyle="None" BorderWidth="0px"></Border>
    </dx:ASPxRoundPanel>
        
    <asp:HiddenField ID="hiddenURL" runat="server" />
    <asp:HiddenField ID="ticketName" runat="server" />
                        </dx:ContentControl>
                    </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="PDF">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl5" runat="server">
                  <iframe id="iframePDF" style="position:relative; width: 100% ; height:600px;" class="shadowBox" runat="server" ></iframe>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="XML">
                <ContentCollection>
                   <dx:ContentControl>
                      


                       <div class="wordWrap">
                        <pre class="brush: xml" id="xmlClass" style="height:600px;" runat="server">
                        </pre>
                           <asp:Xml ID="Xml1" runat="server"></asp:Xml>
                    </div>
                   </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>

<Border BorderStyle="None"></Border>
    </dx:ASPxPageControl>	
    </div>
     

</asp:Content>