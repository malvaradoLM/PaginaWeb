<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home.Master" CodeBehind="DetailsListaFactura.aspx.cs" Inherits="Ejemplo.DetailsListaFactura" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>

 </style>

     <link href="css/breadCrumb.css" rel="stylesheet">
     <div id="cssmenu" style="margin-top:60px;" class="row">  
    <ul>
        <li class="active"><a href="DetailsListaFactura.aspx">Listado de Facturas</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Inicio</a></li>
    </ul>
</div>    
       <div class="alert alert-warning" id="msjAlerta" runat="server" visible="false">
        <strong><dx:ASPxLabel ID="lblTitleMensaje" runat="server" Font-Bold="true" /> </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>

    <div class="fade-in animacion">
<dx:BootstrapGridView ID="bgvListaFactura" runat="server"  KeyFieldName="Serie" Width="90%"   >
    <SettingsSearchPanel Visible="true" ShowApplyButton="true" />
    <Settings ShowTitlePanel="true" />
    <Settings ShowGroupPanel="true"/>
    <Settings ShowFooter="True" />
    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
    <SettingsBehavior AllowFocusedRow="True" />
    <SettingsText SearchPanelEditorNullText="Buscar" GroupPanel=" "/>
    <SettingsAdaptivity  AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
    <Columns>
                    <dx:BootstrapGridViewTextColumn FieldName="Serie" HorizontalAlign="Center" CssClasses-HeaderCell="alignHeader">
                    </dx:BootstrapGridViewTextColumn>
        <dx:BootstrapGridViewTextColumn FieldName="Folio"   HorizontalAlign="Center" CssClasses-HeaderCell="alignHeader" >    
                         <DataItemTemplate>
                            <asp:LinkButton runat="server" Text='<%#Eval("Folio")%>' OnClick="button1_Click" ID='button1'  />
                         </DataItemTemplate>   
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Fecha"  UnboundType="DateTime" HorizontalAlign="Center" CssClasses-HeaderCell="alignHeader">
                               <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />        
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Subtotal" UnboundType="Decimal" HorizontalAlign="Center" CssClasses-HeaderCell="alignHeader" />               
                    <dx:BootstrapGridViewTextColumn FieldName="IVA"   UnboundType="Decimal" HorizontalAlign="Center"  CssClasses-HeaderCell="alignHeader"/>           
                    <dx:BootstrapGridViewTextColumn FieldName="Total" UnboundType="Decimal" HorizontalAlign="Center" CssClasses-HeaderCell="alignHeader" />  
    </Columns>
</dx:BootstrapGridView>
    </div>

     

</asp:Content>
