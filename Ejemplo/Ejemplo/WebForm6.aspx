<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="Ejemplo.WebForm6" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid ">
           <dx:BootstrapGridView ID="bgvVehiculo" runat="server" EnableViewState="false" AutoGenerateColumns="false" KeyFieldName="VehiculoID" OnSelectionChanged="bgvVehiculo_SelectionChanged">
                <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
                <%--<SettingsDataSecurity AllowEdit="True" />--%>
                <Columns>
                     <dx:BootstrapGridViewDataColumn Caption="" Width="50px" Settings-AllowDragDrop="False" VisibleIndex="0">
            <DataItemTemplate>
                     <dx:ASPxButton ID="btnEditar" runat="server" Text="Editar" AutoPostBack="false" OnClick="btnEditar_Click"></dx:ASPxButton>
            </DataItemTemplate>
        </dx:BootstrapGridViewDataColumn>

                    <dx:BootstrapGridViewTextColumn FieldName="Vehiculo" ReadOnly="True" VisibleIndex="1">
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
                </Columns>

           </dx:BootstrapGridView>

        <dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" KeyFieldName="VehiculoID"
            Width="100%" AutoGenerateColumns="False" Theme="BlackGlass" EnableViewState="False" > <%--OnCustomColumnDisplayText="grid_CustomColumnDisplayText"
            OnSummaryDisplayText="grid_SummaryDisplayText">--%>
               <Settings VerticalScrollBarStyle="VirtualSmooth" ShowFilterRow="True" />
               <SettingsBehavior AllowSelectSingleRowOnly="true" AllowSelectByRowClick="true" />
            <SettingsPager PageSize="30" Visible="false"><PageSizeItemSettings Items="30, 50, 100" Visible="True"></PageSizeItemSettings></SettingsPager>
            <Settings ShowFilterRow="FALSE" ShowFilterRowMenu="FALSE" ShowGroupPanel="FALSE" ShowFooter="true" VerticalScrollableHeight="600" />
              <SettingsBehavior AllowFocusedRow="True" />
            <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
            <SettingsSearchPanel Visible="True" />                
              <Columns>
                  <dx:GridViewDataTextColumn  VisibleIndex="0" Width="3%">
                                <DataItemTemplate>
                                    <dx:ASPxButton ID="btn" runat="server" Text="..." Width="100%" Paddings-Padding="0px" AutoPostBack="False" OnClick="btn_Click" Theme="SoftOrange"></dx:ASPxButton>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="VehiculoID" ReadOnly="True" VisibleIndex="1">
                        <DataItemTemplate>
                        <%#Eval("VehiculoID")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Nombre" ReadOnly="True" VisibleIndex="2">
                        <DataItemTemplate>
                        <%#Eval("Nombre")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Identificación" ReadOnly="True" VisibleIndex="3">
                        <DataItemTemplate>
                        <%#Eval("Identificacion")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Estatus" ReadOnly="True" VisibleIndex="4">
                        <DataItemTemplate>
                        <%#Eval("Estatus")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                  </Columns>
        </dx:ASPxGridView>
 </div>
</asp:Content>
