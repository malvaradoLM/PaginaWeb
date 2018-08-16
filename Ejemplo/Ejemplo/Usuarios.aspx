<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Ejemplo.WebForm4" %>
<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <%--  <asp:ScriptManager ID="ScriptMgr" runat="server" EnablePageMethods="true"></asp:ScriptManager>--%>
 <style>
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
/*gridview*/

.labelCuadro
{
    color: #ffffff;
    font-family: 'Roboto Condensed', sans-serif;
}
.MarginTable{
    margin-left:20%;
}
    .FloatRight{

            width:70%;
    }
@media screen and (max-width: 480px) {
  .FloatRight{

            width:100%;
            float: right;
    }
    .linkclass
{
    width:0px;
}
/*end gridview */
 </style>
    <link href="css/breadCrumb.css" rel="stylesheet">
    <div id="cssmenu" style="margin-top:60px;" class="row fade-in">  
    <ul>
        <li class="active"><a href="Usuarios.aspx">Usuarios</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Inicio</a></li>
    </ul>
</div>  
    <div class="row alert alert-warning" id="msjAlerta" runat="server" visible="false">
        <strong><dx:ASPxLabel ID="lblTitleMensaje" runat="server" Font-Bold="true" /> </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>

    <div class="row  col-lg-12 col-md-12 fade-in" >
      <dx:BootstrapGridView ID="bgvUsuario" runat="server" ClientIDMode="Static" EnableViewState="false" AutoGenerateColumns="false" KeyFieldName="UsuarioWebID" CssClassesPager-Control="true"  CssClasses-Control="MarginTable animacion FloatRight" Width="60%" >
                <SettingsSearchPanel Visible="true" ShowApplyButton="true" />
                <Settings ShowGroupPanel="false"  />
                <SettingsText SearchPanelEditorNullText="Buscar" GroupPanel=" "/>
                <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
                <SettingsDataSecurity AllowEdit="True" />
                <SettingsBehavior AllowFocusedRow="True" />
                <SettingsCommandButton>
                    <SearchPanelApplyButton IconCssClass="glyphicon glyphicon-search" Text=" " />
                </SettingsCommandButton>
                <SettingsAdaptivity  AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
                <Columns>
                    <dx:BootstrapGridViewTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0"  HorizontalAlign="Center">
                                        <DataItemTemplate>
                            <asp:LinkButton runat="server" Text='<%#Eval("UsuarioWebID")%>' OnClick="btnEditar_Click" ID='button1'  />
                         </DataItemTemplate> 
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Nombre" ReadOnly="True" VisibleIndex="1">
                                        <DataItemTemplate>
                                            <%#Eval("Nombre")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Usuario" ReadOnly="True" VisibleIndex="2">
                                        <DataItemTemplate>
                                            <%#Eval("Usuario")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewDataColumn Caption="" Width="50px" Settings-AllowDragDrop="False" VisibleIndex="3">
                      <DataItemTemplate>
                          <asp:LinkButton ID="btnEdicion" runat="server" Text="Editar" AutoPostBack="false" OnClick="btnEditar_Click">
                              <i class="fa fa-edit" style="font-size:40px"></i>
                              </asp:LinkButton>
                       </DataItemTemplate>
        </dx:BootstrapGridViewDataColumn>
                </Columns>

           </dx:BootstrapGridView>
        <div style="float:right;">
      <asp:LinkButton ID="btnNuevo1"  class="btn-lg btn-sample labelCuadro" HorizontalAlign="Right"  runat="server" OnClick="btnNuevo_Click">
          <asp:Image ID="Image1" runat="server" ImageUrl="\Icons\png\16px\large\user-add.png" CssClass="linkclass" />
          CREAR NUEVO
      </asp:LinkButton>
    </div>
        </div>

</asp:Content>
