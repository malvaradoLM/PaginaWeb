<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="VehiculoPage.aspx.cs" Inherits="Ejemplo.VehiculoPage" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <%--  <asp:ScriptManager ID="ScriptMgr" runat="server" EnablePageMethods="true"></asp:ScriptManager>--%>
    <link href="css/PaletaColores.css" rel="stylesheet">
    <link href="css/StylePage.css" rel="stylesheet">
    <link href="css/ResponsiveBootstrapTabs.css" rel="stylesheet">
    <div class="row">
        <div class="col-lg-8 col-md-8">
            <div class="Cards-Titulo HexColor-3"><h2 id="lblTitulo" runat="server">VEHICULOS ACTIVOS</h2></div>
    <dx:BootstrapGridView ID="bgvVehiculo" runat="server" ClientIDMode="Static" EnableViewState="false" AutoGenerateColumns="false" KeyFieldName="VehiculoID" >
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
                     <asp:Button ID="btnEditar" runat="server" Text="Editar" AutoPostBack="false" OnClick="btnEditar_Click">
                        <%-- <ClientSideEvents Click="function(s, e) { e.processOnServer = GetValues(); }"  />--%>
                     </asp:Button>
                
            </DataItemTemplate>
        </dx:BootstrapGridViewDataColumn>
                </Columns>

           </dx:BootstrapGridView>
            </div>
        <div class="col-lg-2 col-md-2">
                 <asp:LinkButton  class="Largo amarillo Cards-Titulo HexColor-3" id="btnAll" onclick="btnAll_Click" runat="server" >
                    <a class="Cards-Titulo HexColor-3"">TODOS LOS VEHICULOS</a>
                </asp:LinkButton>
        </div>
    <%--<script>
        function GetValues()
        {
            //alert("pinche boton");
            PageMethods.GetValue(); 
        }
        
    </script>--%>
</asp:Content>
