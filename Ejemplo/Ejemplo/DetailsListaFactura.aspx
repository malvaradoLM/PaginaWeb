<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/site1.Master" CodeBehind="DetailsListaFactura.aspx.cs" Inherits="Ejemplo.DetailsListaFactura" %>
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
    <div class="alert alert-warning" id="msjAlerta" runat="server">
        <strong>Advertencia! </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>
    <div id="nav" class="container" style="margin-left:0px; margin-right:0px">
         <div class="row">
            <ol class="breadcrumb Cards-Contenido col-lg-10" style="background:initial;">
                <li class="breadcrumb-item"><a href="DatosCliente.aspx">Datos Cliente</a></li>
                <li class="breadcrumb-item active ">Listado de Facturas</li>
            </ol>
        </div>
<dx:BootstrapGridView ID="bgvListaFactura" runat="server"  KeyFieldName="Serie"   >
    <SettingsSearchPanel Visible="true" ShowApplyButton="true" />
    <Settings ShowTitlePanel="true" />
    <Settings ShowGroupPanel="true"/>
    <Settings ShowFooter="True" />
    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
    <SettingsBehavior AllowFocusedRow="True" />
    <SettingsText SearchPanelEditorNullText="Buscar" GroupPanel=" "/>
    <Columns>
                    <dx:BootstrapGridViewTextColumn FieldName="Serie" HorizontalAlign="Center" >
                    </dx:BootstrapGridViewTextColumn>
        <dx:BootstrapGridViewTextColumn FieldName="Folio"   HorizontalAlign="Center"  >    
                         <DataItemTemplate>
                            <asp:LinkButton runat="server" Text='<%#Eval("Folio")%>' OnClick="button1_Click" ID='button1'  />
                         </DataItemTemplate>   
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Fecha"  UnboundType="DateTime" HorizontalAlign="Center">
                               <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />        
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Subtotal" UnboundType="Decimal" HorizontalAlign="Center" />               
                    <dx:BootstrapGridViewTextColumn FieldName="IVA"   UnboundType="Decimal" HorizontalAlign="Center" />           
                    <dx:BootstrapGridViewTextColumn FieldName="Total" UnboundType="Decimal" HorizontalAlign="Center" />  
    </Columns>
</dx:BootstrapGridView>
    </div>

     

</asp:Content>
