<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home.Master" CodeBehind="EditarUsuario.aspx.cs" Inherits="Ejemplo.EditarUsuario" %>

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
.MarginButtons{
        margin-top: 30px;
}
.shadowBox{
    padding: 5px;
    box-shadow: 3px 8px 6px #888888;
}
.shadowBoxMin{
    padding: 2px;
    box-shadow: 1px 6px 4px #888888;
}
.TextForm{
    font-family:Arial, Helvetica, sans-serif;
}
.breadCrumbMovil{
    margin-top:60px;
}
.buttonMargin {
    margin-top:8%;
    }
 </style>
    <link href="css/breadCrumb.css" rel="stylesheet">
    <link href="css/animacion.css" rel="stylesheet">
    <div id="cssmenu" style="margin-top:60px;" class="row">  
    <ul>
        <li class="active"><a><asp:Label runat="server" id="etiqueta" Text="Editar Usuario"/></a></li>
        <li><a href="Usuarios.aspx">Usuarios</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Inicio</a></li>
    </ul>
</div>  

    <div class="alert alert-warning" id="msjAlerta" runat="server" visible="false">
        <strong><dx:ASPxLabel ID="lblTitleMensaje" runat="server" Font-Bold="true" /> </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>
    
    <div class="tab-content">
    <dx:ASPxFormLayout runat="server" ID="exampleFormLayout" RequiredMarkDisplayMode="All"  EncodeHtml="false" UseDefaultPaddings="false" Theme="Office365" SettingsItems-HorizontalAlign="Center" CssClass="animacion" >
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500"  />
        <SettingsItemCaptions HorizontalAlign="Center" /> 
        <SettingsItems HorizontalAlign="Center" /> 
            <Items>
            <dx:LayoutGroup  Caption="USUARIO" SettingsItemHelpTexts-Position="Bottom"  GroupBoxStyle-Border-BorderStyle="Solid" GroupBoxStyle-Caption-Font-Bold="true" GroupBoxStyle-Caption-Font-Size="Large" CssClass="TextForm" ColCount="3" >
                <GroupBoxStyle Border-BorderStyle="Solid" CssClass="shadowBox">
                    <Caption Font-Bold="True">
                    </Caption>
                </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem Caption="Nombre" HelpText="Porfavor, ingrese un nombre" RequiredMarkDisplayMode="Required" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                            <dx:ASPxTextBox ID="txtNombre" runat="server"  Theme="Office365"></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Usuario" HelpText="Porfavor, ingrese un nombre de usuario" RequiredMarkDisplayMode="Required" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                             <dx:ASPxTextBox ID="txtUsuario" runat="server" Theme="Office365"></dx:ASPxTextBox>   
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Clave" HelpText="Porfavor, ingrese una clave" RequiredMarkDisplayMode="Required" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                               <dx:ASPxTextBox ID="txtClave" runat="server"  Theme="Office365"></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Administrador" HelpText="Conceder privilegios de Administrador" RequiredMarkDisplayMode="Hidden" ShowCaption="True" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxCheckBox ID="chkAdministrador" runat="server" Theme="Office365"></dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="ESPACIO BLANCO" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    
                    <dx:LayoutGroup Border-BorderStyle="None"  Caption=" " CssClass="buttonMargin" GroupBoxDecoration="None" HorizontalAlign="Right" SettingsItemCaptions-HorizontalAlign="Right" Width="100" ColSpan="2" VerticalAlign="Bottom" >
                        <SettingsItems VerticalAlign="Bottom"  />
                        <Border BorderStyle="None" />
                        <Items>
                            <dx:LayoutItem  Border-BorderWidth="0px" CssClass="buttonMargin" HorizontalAlign="Right" RequiredMarkDisplayMode="Hidden" ShowCaption="False" Width="100">
                                <LayoutItemNestedControlCollection >
                                    <dx:LayoutItemNestedControlContainer ID="buttons" BorderStyle="None"  runat="server" ValidateRequestMode="Disabled" >
                                        <dx:ASPxButton ID="btnCancelar" runat="server"  Text="Cancelar" OnClick="btnCancelar_Click" Theme="Office365" Width="80" UseSubmitBehavior="False"  CausesValidation="false" CssClass="shadowBoxMin" ImagePosition="Right">
                                            <Image Url="~/Icons/png/16px/large/button-cancel.png">
                                              </Image>
                                            </dx:ASPxButton>
                                        <dx:ASPxLabel ID="separator" runat="server" Text="   " />
                                        <dx:ASPxButton ID="btnProcesar" UseSubmitBehavior="False" OnClick="btnguardar_Click" runat="server"  Text="Guardar" Theme="Office365" Width="80" CssClass="shadowBoxMin" ImagePosition="Right">
                                            <Image Url="~/Icons/png/16px/large/button-ok.png">
                                              </Image>
                                            </dx:ASPxButton>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <Border BorderWidth="0px" />
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Right" />
                    </dx:LayoutGroup>
                </Items>
                <SettingsItemHelpTexts Position="Bottom" />
            </dx:LayoutGroup>
        </Items>
            <SettingsItems HorizontalAlign="Center" />
        </dx:ASPxFormLayout>
        </div>
    <input  id="HiddenUsuarioWebID" data-toggle="tab" class="active" runat="server" type="hidden">
           <input  id="HiddenClienteID" data-toggle="tab" class="active" runat="server" type="hidden">

</asp:Content>
