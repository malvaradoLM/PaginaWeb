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
.floatButton{
    float:right;
        margin-left: 1px;
}
.alignHeader{
    text-align:center;
}
    .descargarButton{
        float:right;
        margin-bottom:5px;
    }
 </style>
<script>
    function ocultarDetalles(s, e) {
        if (document.getElementById('<%= detallesConsumo.ClientID %>') != null) {
            document.getElementById('<%= detallesConsumo.ClientID %>').remove("visible");
            document.getElementById('<%= panelDetallesConsumo.ClientID %>').remove("visible");
        }
    }
    function descargarDocumento(s, e) {
        var url = document.getElementById("<%=hiddenURL.ClientID%>");
        var descarga = url.value;
        var nombreDoc = document.getElementById("<%=ticketName.ClientID%>");
        download_file(url.value, nombreDoc.value +".pdf");
    }
    function descargarDocumentoPDF(s, e) {
        var url = document.getElementById("<%=HiddenUrlPDF.ClientID%>");
        var descarga = url.value;
        var nombreDoc = document.getElementById("<%=ticketName.ClientID%>");
        download_file(url.value, nombreDoc.value + ".pdf");
    }
    function descargarDocumentoXML(s, e) {
        var url = document.getElementById("<%=HiddenUrlXML.ClientID%>");
        var descarga = url.value;
        var nombreDoc = document.getElementById("<%=ticketName.ClientID%>");
        download_file(url.value, nombreDoc.value + ".xml");
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

    <div class="alert alert-warning" id="msjAlerta" runat="server" visible="false">
        <strong>Advertencia! </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>
     <link href="css/breadCrumb.css" rel="stylesheet">
     <div id="cssmenu" style="margin-top:60px;" class="row">  
    <ul>
        <li class="active"><a href="DetailsDescargaFactura.aspx">Descarga de Factura</a></li>
        <li><a href="DetailsListaFactura.aspx">Listado de Facturas</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Inicio</a></li>
    </ul>
</div>    





    <script type="text/javascript" src="https://www.bing.com/api/maps/mapcontrol?callback=LoadMap" async defer></script>
    <div class="fade-in animacion">
         <dx:ASPxPageControl ID="pageConsumos" Width="100%" runat="server"  EnableHierarchyRecreation="true" ActiveTabIndex="0"  Border-BorderStyle="None" CssClass="page-header" Theme="Office365" >
        <TabPages>
            <dx:TabPage Text="CONSUMOS">
                <ContentCollection>
                        <dx:ContentControl ID="ContentControl2" runat="server">

                            <dx:ASPxRoundPanel ID="panelConsumos" ClientInstanceName="panelDetallesConsumo" HeaderText="LISTA DE CONSUMOS" runat="server" Width="100%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes fade-in animacion" HeaderStyle-ForeColor="Gray">
<HeaderStyle ForeColor="Gray"></HeaderStyle>
                    <PanelCollection>
            <dx:PanelContent>                       
               <dx:ASPxButton ID="btnTicketsPDF" Text="TICKETS PDF" runat="server" Theme="Office365" CssClass="floatButton shadowBoxMin" />               
                  <dx:ASPxButton ID="btnConsumosExcel" Text="CONSUMOS XLS" OnClick="btnConsumosExcel_Click" runat="server" Theme="Office365" CssClass="floatButton shadowBoxMin" />
                <dx:ASPxButton ID="btnConsumosPDF" OnClick="btnConsumosPDF_Click" Text="CONSUMOS PDF" runat="server" Theme="Office365" CssClass="floatButton shadowBoxMin" />
                                <dx:BootstrapGridView ID="bgvConsumo" runat="server"  KeyFieldName="ID" ClientSideEvents-BeginCallback="ocultarDetalles" Width="100%">
                                    <ClientSideEvents BeginCallback="ocultarDetalles" />
    <SettingsSearchPanel Visible="true" ShowApplyButton="true" />
    <Settings ShowTitlePanel="true" />
    <Settings ShowGroupPanel="true"/>
    <Settings ShowFooter="True" />
    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
    <SettingsBehavior AllowFocusedRow="True" />
    <SettingsText SearchPanelEditorNullText="Buscar" GroupPanel=" "/>
    <SettingsAdaptivity  AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
    <Columns>
        <dx:BootstrapGridViewTextColumn FieldName="ID"   HorizontalAlign="Center" CssClasses-HeaderCell="alignHeader" >    
                         <DataItemTemplate>
                            <asp:LinkButton runat="server" Text='<%#Eval("ID")%>' OnClick="button1_Click" ID='button1'  />
                         </DataItemTemplate>   
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="EstacionID" HorizontalAlign="Center" CssClasses-HeaderCell="alignHeader" />
                    <dx:BootstrapGridViewTextColumn FieldName="Ticket"    UnboundType="String" HorizontalAlign="Center" CssClasses-HeaderCell="alignHeader" />
                    <dx:BootstrapGridViewTextColumn FieldName="FechaCarga"  UnboundType="DateTime" HorizontalAlign="Center" CssClasses-HeaderCell="alignHeader">
                               <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />        
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Producto"   UnboundType="String" HorizontalAlign="Center" CssClasses-HeaderCell="alignHeader" />
        <dx:BootstrapGridViewTextColumn FieldName="Serie"   UnboundType="String" HorizontalAlign="Center" CssClasses-HeaderCell="alignHeader" />        
        <dx:BootstrapGridViewTextColumn FieldName="Folio"   UnboundType="String" HorizontalAlign="Center" CssClasses-HeaderCell="alignHeader" />        
                    <dx:BootstrapGridViewDataColumn FieldName="Cantidad"   UnboundType="Decimal" CssClasses-HeaderCell="alignHeader" />
                    <dx:BootstrapGridViewTextColumn FieldName="Precio"   UnboundType="Decimal"  CssClasses-HeaderCell="alignHeader">
                             <PropertiesTextEdit DisplayFormatString="c" /> 
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Importe"   UnboundType="Decimal" CssClasses-HeaderCell="alignHeader" >
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

<dx:ASPxRoundPanel ID="panelDetallesConsumo" ClientInstanceName="panelDetallesConsumo" HeaderText="DETALLES DEL CONSUMO" runat="server" Width="100%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes fade-in animacion" HeaderStyle-ForeColor="Gray">
<HeaderStyle ForeColor="Gray"></HeaderStyle>
                    <PanelCollection>
            <dx:PanelContent>

                <div id="detallesConsumo" runat="server" class="detalles"  >
    <dx:ASPxPageControl ID="carTabPage" Width="100%" runat="server"  EnableHierarchyRecreation="true" ActiveTabIndex="0"  Border-BorderStyle="None"  Theme="Metropolis" EnableTabScrolling="true">
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
                    <dx:ContentControl ID="ContentControl3" runat="server">
                        <dx:ASPxImageSlider ID="imageSlider" runat="server" ClientInstanceName="imageSlider" CssClass="imageSlider carousel fade-in animacion"  Width="100%" Height="500">
                            <SettingsSlideShow AutoPlay="true" StopPlayingWhenPaging="true" PausePlayingWhenMouseOver="true" />
                         </dx:ASPxImageSlider>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="GEOLOCALIZACIÓN">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl4" runat="server">
                  <div id="myMap" style="position:relative; width: 100% ; height:500px;" ></div>
                        <iframe runat="server" id="mapagoogle"  style="width:100%;height:500px;" class="shadowBox fade-in animacion"></iframe>
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
              <dx:ASPxButton runat="server" ClientSideEvents-Click="descargarDocumentoPDF" Theme="Office365" Text="DESCARGAR" AutoPostBack="false" CssClass="descargarButton shadowBoxMin" />
                  <iframe id="iframePDF" style="position:relative; width: 100% ; height:600px;" class="shadowBox fade-in animacion" runat="server" ></iframe>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="XML">
                <ContentCollection>
                   <dx:ContentControl>
                   <dx:ASPxButton runat="server" ClientSideEvents-Click="descargarDocumentoXML" Theme="Office365" Text="DESCARGAR" AutoPostBack="false" CssClass="descargarButton shadowBoxMin" />
                       <div class="wordWrap fade-in animacion">
                        <pre class="brush: xml" id="xmlClass" style="height:600px;width:100%;"  runat="server">
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
     
    <asp:HiddenField ID="HiddenUrlPDF" runat="server" />
    <asp:HiddenField ID="HiddenUrlXML" runat="server" />
</asp:Content>