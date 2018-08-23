<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="VehiculoPage.aspx.cs" Inherits="Ejemplo.VehiculoPage" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <%--  <asp:ScriptManager ID="ScriptMgr" runat="server" EnablePageMethods="true"></asp:ScriptManager>--%>
    <style>

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

    .FloatRight{

            float: right;
            width:70%;
    }
@media screen and (max-width: 480px) {
  .FloatRight{

            float: right;
            width:100%;
    }
    .linkclass
{
    width:0px;
}
  }
    </style>
    <link href="css/StylePageMenuPrincipal.css" rel="stylesheet">
    



    <div class="row fade-in animacion">
        <div class="col-lg-8 col-md-8">
            <div class="Cards-Titulo HexColor-3"><h2 id="lblTitulo" runat="server" style="display:none">VEHICULOS ACTIVOS</h2></div>
             <link href="css/breadCrumb.css" rel="stylesheet">
 
    <div id="cssmenu" style="margin-top:60px;margin-left: 50px; " class="row">  
    <ul>
        <li class="active"><a href="VehiculoPage.aspx">Vehiculos</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Inicio</a></li>
    </ul>
</div>  
                <div class="alert alert-warning" id="msjAlerta" runat="server" visible="false">
        <strong><dx:ASPxLabel ID="lblTitleMensaje" runat="server" Font-Bold="true" /> </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>
    <dx:BootstrapGridView ID="bgvVehiculo" runat="server" ClientIDMode="Static" EnableViewState="false" AutoGenerateColumns="false" KeyFieldName="VehiculoID" CssClassesPager-Control="true"  CssClasses-Control="FloatRight fade-in animacion"   >
                <SettingsBehavior AllowFocusedRow="True" />
<CssClasses Control="FloatRight fade-in animacion"></CssClasses>

<CssClassesPager Control="true"></CssClassesPager>

                <Settings ShowGroupPanel="true" />
                <SettingsAdaptivity  AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
                <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
                <SettingsCommandButton>
                    <SearchPanelApplyButton IconCssClass="glyphicon glyphicon-search" Text=" " />
                </SettingsCommandButton>
                <SettingsText SearchPanelEditorNullText="Ingrese texto para buscar..." GroupPanel=" " />
                <SettingsDataSecurity AllowEdit="True" />
                <Columns>
                    <dx:BootstrapGridViewTextColumn FieldName="VehiculoID" ReadOnly="True" VisibleIndex="1" Caption="ID">
                                        <DataItemTemplate>
                            <asp:LinkButton runat="server" Text='<%#Eval("VehiculoID")%>' OnClick="btnEditar_Click" ID='button1'  />
                         </DataItemTemplate>   
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Nombre" ReadOnly="True" VisibleIndex="2" >
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
<Settings AllowDragDrop="False"></Settings>
            <DataItemTemplate>
                     <asp:LinkButton ID="btnEditar" runat="server" Text="Editar"  OnClick="btnEditar_Click">
                        <i class="fa fa-edit" style="font-size:40px"></i>
                     </asp:LinkButton>
                
            </DataItemTemplate>
        </dx:BootstrapGridViewDataColumn>
                </Columns>

                <SettingsSearchPanel Visible="true" ShowApplyButton="true"  />

           </dx:BootstrapGridView>
            </div>
        <div class="col-lg-3 col-md-3 fade-in animacion">
                 <asp:LinkButton  class="Largo blue Cards-Titulo HexColor-3 linkclass shadowBox" id="btnAll" onclick="btnAll_Click" runat="server" style="background: #f87c1d;" >
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
