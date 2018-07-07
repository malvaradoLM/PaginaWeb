<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/site1.Master" CodeBehind="DetailsDescargaFactura.aspx.cs" Inherits="Ejemplo.DetailsDescargaFactura" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
 </style>
    <script type="text/javascript">
        function ocultarDetalles(s, e) {
            if (document.getElementById('<%= detallesConsumo.ClientID %>') != null) {
            document.getElementById('<%= detallesConsumo.ClientID %>').remove("visible");
            }
        }
</script>
    <script type="text/javascript" src="https://www.bing.com/api/maps/mapcontrol?callback=LoadMap" async defer></script>
    <div>
         <dx:ASPxPageControl ID="pageConsumos" Width="100%" runat="server"  EnableHierarchyRecreation="true" ActiveTabIndex="0"  Border-BorderStyle="None" CssClass="page-header" >
        <TabPages>
            <dx:TabPage Text="CONSUMOS">
                <ContentCollection>
                        <dx:ContentControl ID="ContentControl2" runat="server">
                             <dx:BootstrapGridView ID="bgvConsumo" runat="server"  KeyFieldName="ID" ClientSideEvents-BeginCallback="ocultarDetalles"  >
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
                            <div id="detallesConsumo" runat="server" class="detalles"  >
    <dx:ASPxPageControl ID="pageDetalles" Width="100%" runat="server"  EnableHierarchyRecreation="true" ActiveTabIndex="0"  Border-BorderStyle="None" CssClass="page-header" >
        <TabPages>
            <dx:TabPage Text="TICKET">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">
                 <iframe id="ticket" style="position:relative; width: 100% ; height:600px;" runat="server" ></iframe>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="FOTOGRAFÍA">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl3" runat="server">
                        <dx:ASPxImageSlider ID="imageSlider" runat="server" ClientInstanceName="imageSlider" CssClass="imageSlider carousel"  Width="100%">
                            <SettingsSlideShow AutoPlay="true" StopPlayingWhenPaging="true" PausePlayingWhenMouseOver="true" />
                         </dx:ASPxImageSlider>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="GEOLOCALIZACIÓN">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl4" runat="server">
                  <div id="myMap" style="position:relative; width: 100% ; height:600px;" ></div>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>	
    </div>	
                        </dx:ContentControl>
                    </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="PDF">
                <ContentCollection>
                    
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="XML">
                <ContentCollection>
                   
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>	
    </div>
     

</asp:Content>