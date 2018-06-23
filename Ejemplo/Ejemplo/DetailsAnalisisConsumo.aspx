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

 </style>
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
        <asp:LinkButton  id="btnProcesar"  class="btn-sample btn-lg labelCuadro"  type="button" style="float:right;margin-top: 1px; background-color:mediumseagreen" runat="server" Text="PROCESAR " >
    
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
        <div id="detallesConsumo">
    <dx:ASPxPageControl ID="carTabPage" Width="100%" runat="server" CssClass="dxtcFixed" ActiveTabIndex="0" EnableHierarchyRecreation="True" >
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
                        <dx:ASPxImage runat="server" ID="Image2" ImageUrl="~/TabControl/Images/(New-York)-Brooklyn-Bridge.jpg" CssClass="dxtmImage" />
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="GEOLOCALIZACIÓN">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl3" runat="server">
                        <dx:ASPxImage runat="server" ID="Image3" ImageUrl="~/TabControl/Images/(Tokyo)-Tokyo-Tower.jpg" CssClass="dxtmImage" />
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>	
    </div>	
</div>	
</asp:Content>
