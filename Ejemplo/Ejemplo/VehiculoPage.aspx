﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="VehiculoPage.aspx.cs" Inherits="Ejemplo.VehiculoPage" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <%--  <asp:ScriptManager ID="ScriptMgr" runat="server" EnablePageMethods="true"></asp:ScriptManager>--%>
    <style>
/*gridview*/
.table table  tbody  tr  td a ,
.table table  tbody  tr  td  span {
position: relative;
float: left;
padding: 6px 12px;
margin-left: -1px;
line-height: 1.42857143;
color: #337ab7;
text-decoration: none;
background-color: #fff;
border: 1px solid #ddd;
}

.table table > tbody > tr > td > span {
z-index: 3;
color: #fff;
cursor: default;
background-color: #337ab7;
border-color: #337ab7;
}

.table table > tbody > tr > td:first-child > a,
.table table > tbody > tr > td:first-child > span {
margin-left: 0;
border-top-left-radius: 4px;
border-bottom-left-radius: 4px;
}

.table table > tbody > tr > td:last-child > a,
.table table > tbody > tr > td:last-child > span {
border-top-right-radius: 4px;
border-bottom-right-radius: 4px;
}

.table table > tbody > tr > td > a:hover,
.table   table > tbody > tr > td > span:hover,
.table table > tbody > tr > td > a:focus,
.table table > tbody > tr > td > span:focus {
z-index: 2;
color: #23527c;
background-color: #eee;
border-color: #ddd;

}

.linkclass
{
    margin-left: 33%;
    margin-top: 7%;
}
.labelCuadro
{
    display: block;
    /* font-size: 14px; */
    text-align: center;
    margin-top: 5px;
    color: #ffffff;
    font-family: 'Roboto Condensed', sans-serif;
    /* font-style: normal; */
    font-weight: 700;
    letter-spacing: 0.05em;
    font-size: 16px;
    text-transform: uppercase;
}
/*end gridview */
    </style>
    <link href="css/StylePage1.css" rel="stylesheet">

    <div class="row">
        <div class="col-lg-9 col-md-9">
            <div class="Cards-Titulo HexColor-3"><h2 id="lblTitulo" runat="server">VEHICULOS ACTIVOS</h2></div>
    <dx:BootstrapGridView ID="bgvVehiculo" runat="server" ClientIDMode="Static" EnableViewState="false" AutoGenerateColumns="false" KeyFieldName="VehiculoID" CssClassesPager-Control="true" CssClasses-Table="table table-striped table-bordered table-hover">
                <SettingsSearchPanel Visible="true" ShowApplyButton="true" />
                <Settings ShowGroupPanel="true"/>
                <SettingsText SearchPanelEditorNullText="Buscar" GroupPanel=" "/>
                <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
                <SettingsDataSecurity AllowEdit="True" />
                <SettingsBehavior AllowFocusedRow="True" />
                <Columns>
                    <dx:BootstrapGridViewTextColumn FieldName="VehiculoID" ReadOnly="True" VisibleIndex="1">
                                        <DataItemTemplate>
                                            <%#Eval("VehiculoID")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Nombre" ReadOnly="True" VisibleIndex="2">
                                        <DataItemTemplate>
                                            <%#Eval("Nombre")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Identificación" ReadOnly="True" VisibleIndex="3">
                                        <DataItemTemplate>
                                            <%#Eval("Identificacion")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Estatus" ReadOnly="True" VisibleIndex="4">
                                        <DataItemTemplate>
                                            <%#Eval("Estatus")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewDataColumn Caption="" Width="50px" Settings-AllowDragDrop="False" VisibleIndex="5">
            <DataItemTemplate>
                     <asp:LinkButton ID="btnEditar" runat="server" Text="Editar" AutoPostBack="false" OnClick="btnEditar_Click">
                        <i class="fa fa-edit" style="font-size:40px"></i>
                     </asp:LinkButton>
                
            </DataItemTemplate>
        </dx:BootstrapGridViewDataColumn>
                </Columns>

           </dx:BootstrapGridView>
            </div>
        <div class="col-lg-2 col-md-2">
                 <asp:LinkButton  class="Largo amarillo Cards-Titulo HexColor-3 linkclass" id="btnAll" onclick="btnAll_Click" runat="server" >
                      <asp:Image ID="Image1" runat="server" ImageUrl="\Icons\png\80px\large\vehicle-car.png" CssClass="linkclass" />
                    <div style="text-align:center" id="lblVehiculos" runat="server">
                     <div id="lblVehiculosActivos" runat="server" class="labelCuadro">VEHICULOS ACTIVOS</div>
                    </div>
                </asp:LinkButton>
        </div>
        </div>
    <%--<script>
        function GetValues()
        {
            //alert("pinche boton");
            PageMethods.GetValue(); 
        }
        
    </script>--%>
</asp:Content>
