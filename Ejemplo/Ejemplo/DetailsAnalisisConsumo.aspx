<%@ Page Language="C#" MasterPageFile="~/site1.Master" EnableEventValidation="true" AutoEventWireup="true" CodeBehind="DetailsAnalisisConsumo.aspx.cs" Inherits="Ejemplo.DetailsAnalisisConsumo" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%--  --%>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
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
        <asp:LinkButton  id="btnProcesar" OnClick="btnProcesar_Click" class="btn-sample btn-lg labelCuadro"  type="button" style="float:right;margin-top: 1px; background-color:mediumseagreen" runat="server" Text="PROCESAR " >
    
</asp:LinkButton>
<asp:LinkButton id="btnCancelar" class="btn-sample btn-lg labelCuadro"  type="button" style="float:right;background-color:red; margin-right:1px; margin-top: 1px;" runat="server" Text="CANCELAR " >
  
 </asp:LinkButton>
       
    </div>	
    <div>
         <dx:BootstrapGridView ID="bgvConsumo" runat="server"   KeyFieldName="ID"    >
                <Settings ShowFooter="True" />
                <Columns>
                    <dx:BootstrapGridViewTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0"  HorizontalAlign="Center" >
                                        <DataItemTemplate>
                                            <%#Eval("ID")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="EstacionID" ReadOnly="True" VisibleIndex="1">
                                        <DataItemTemplate>
                                            <%#Eval("EstacionID")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="FECHA DE CARGA" ReadOnly="True" VisibleIndex="2">
                                        <DataItemTemplate>
                                            <%#Eval("FechaCarga")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewCheckColumn FieldName="FACTURADO" ReadOnly="True" VisibleIndex="3">
                                        <DataItemTemplate>
                                            <dx:ASPxCheckBox ID="chkRow" runat="server" ReadOnly="true" Checked='<%#Eval("Facturado")%>' >                                               
                                            </dx:ASPxCheckBox> 
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewCheckColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="PRODUCTO" ReadOnly="True" VisibleIndex="4">
                                        <DataItemTemplate>
                                            <%#Eval("Producto")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="SERIE" ReadOnly="True" VisibleIndex="5">
                                        <DataItemTemplate>
                                            <%#Eval("Serie")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="FOLIO" ReadOnly="True" VisibleIndex="6">
                                        <DataItemTemplate>
                                            <%#Eval("Folio")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="CANTIDAD" ReadOnly="True" VisibleIndex="7" UnboundType="Decimal">
                                        <DataItemTemplate>
                                            <%#Eval("Cantidad")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="PRECIO" ReadOnly="true" VisibleIndex="8" UnboundType="Decimal" >
                                        <DataItemTemplate>
                                            <%#Eval("Precio")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="IMPORTE" ReadOnly="True" VisibleIndex="9" UnboundType="Decimal">
                                        <DataItemTemplate>
                                            <%#Eval("Importe")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                </Columns>
                <GroupSummary>
                     <dx:ASPxSummaryItem FieldName="ImporteSum" SummaryType="Sum" ShowInColumn="Importe" />
                     <dx:ASPxSummaryItem FieldName="CantidadCont" SummaryType="Count" ShowInColumn="Cantidad" />
               </GroupSummary>
           </dx:BootstrapGridView>
    </div>
</asp:Content>
