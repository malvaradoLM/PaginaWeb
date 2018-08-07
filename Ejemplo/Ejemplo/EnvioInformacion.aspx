<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home.Master" CodeBehind="EnvioInformacion.aspx.cs" Inherits="Ejemplo.EnvioInformacion" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
    .radioMargin{
    margin-top: -12px;
}
.buttonMargin {
        margin-left: 100%;
        margin-top: 20px;
    }
.bordes{
    border:none;
}
.parametroAlign{
    float:unset;
}
.formMargin{
    margin-left: 7%;
}
 </style>
    
    <link href="css/breadCrumb.css" rel="stylesheet">
    <div id="cssmenu" style="margin-top:60px;" class="row">  
    <ul>
        <li class="active"><a href="EnvioInformacion.aspx">Envío de Información</a></li>
        <li><a href="DatosCliente.aspx">Datos del Cliente</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Home</a></li>
    </ul>
</div>
    <div class="alert alert-warning" id="msjAlerta" runat="server" visible="false">
        <strong><dx:ASPxLabel ID="lblTitleMensaje" runat="server" Font-Bold="true" /> </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>
    <p/>   
    

    <dx:ASPxRoundPanel ID="panelParametros" ClientInstanceName="roundPanel" HeaderText="PARAMETROS" runat="server" Width="90%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"  Border-BorderColor ="Gray" CssClass="bordes" HeaderStyle-ForeColor="Gray" >
        <PanelCollection>
            <dx:PanelContent>
    <dx:ASPxFormLayout runat="server" ID="ASPxFormLayout1" RequiredMarkDisplayMode="All"  EncodeHtml="false" UseDefaultPaddings="false" Theme="Office365" SettingsItems-HorizontalAlign="Center" CssClass="fade-in animacion formMargin" Width="90%"  >
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500"  />
        <SettingsItemCaptions Location="Top" HorizontalAlign="Center" />
            <Items>
            <dx:LayoutGroup Caption="PARAMETROS" SettingsItemHelpTexts-Position="Bottom"  GroupBoxStyle-Border-BorderStyle="Solid" GroupBoxStyle-Caption-Font-Bold="true" GroupBoxStyle-Caption-Font-Size="Large" CssClass="TextForm"   ColCount="3" ShowCaption="False" >
                <GroupBoxStyle Border-BorderStyle="Solid" CssClass="shadowBox">
                    <Caption Font-Bold="True">
                    </Caption>
                </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem Caption="Cliente"  CaptionStyle-Font-Bold="true" RequiredMarkDisplayMode="Hidden">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                        <dx:ASPxTextBox ID="txtClienteID" Text="CLIENTE ID" runat="server"  Theme="Office365" ReadOnly="true"/>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Consumo"  CaptionStyle-Font-Bold="true" RequiredMarkDisplayMode="Hidden">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxTextBox ID="txtConsumo" runat="server" NullText="EMAIL DE CONSUMO" Theme="Office365" >
                                    <ValidationSettings SetFocusOnError="True" ValidationGroup="EditForm" Display="Dynamic" ErrorTextPosition="Bottom">
                                                        <RequiredField IsRequired="false" />
                                                        <RegularExpression ErrorText="Formato Inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                    </ValidationSettings>
                                </dx:ASPxTextBox>

                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem> 
                    <dx:LayoutItem Caption="Factura Emitida"  CaptionStyle-Font-Bold="true" RequiredMarkDisplayMode="Hidden">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>  
                                <dx:ASPxTextBox ID="txtFacturaEmitida" runat="server" NullText="EMAIL DE LA FACTURA" Theme="Office365"> 
                                    <ValidationSettings SetFocusOnError="True" ValidationGroup="EditForm" Display="Dynamic" ErrorTextPosition="Bottom">
                                                        <RequiredField IsRequired="false" />
                                                        <RegularExpression ErrorText="Formato Inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                    </ValidationSettings>
                                 </dx:ASPxTextBox>  
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem> 
                    <dx:LayoutItem Caption="Pago Realizado"  CaptionStyle-Font-Bold="true" RequiredMarkDisplayMode="Hidden">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>  
                           <dx:ASPxTextBox ID="txtPagoRealizado" runat="server" NullText="EMAIL DEL PAGO"  Theme="Office365">  
                               <ValidationSettings SetFocusOnError="True" ValidationGroup="EditForm" Display="Dynamic" ErrorTextPosition="Bottom">
                                                        <RequiredField IsRequired="false" />
                                                        <RegularExpression ErrorText="Formato Inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                    </ValidationSettings>
                               </dx:ASPxTextBox> 
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem> 
                    <dx:LayoutItem Caption="Pago Realizado"  CaptionStyle-Font-Bold="true" ShowCaption="False" RequiredMarkDisplayMode="Hidden">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>  
                           <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" NullText="EMAIL DEL PAGO" NullTextStyle-BackColor="WhiteSmoke" Theme="Office365" Visible="false"/>  
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem> 
                    <dx:LayoutGroup Border-BorderStyle="None"  Caption=" " CssClass="buttonMargin" GroupBoxDecoration="None"  Width="100" RowSpan="2" VerticalAlign="Bottom" >
                        <Border BorderStyle="None" />
                        <Items>
                            <dx:LayoutItem  Border-BorderWidth="0px" CssClass="buttonMargin"  RequiredMarkDisplayMode="Hidden" ShowCaption="False" Width="100">
                                <LayoutItemNestedControlCollection >
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" BorderStyle="None"  runat="server" ValidateRequestMode="Disabled" >
                                        <dx:ASPxButton ID="btnCancelar" runat="server"  Text="Cancelar"  Theme="Office365" Width="80" UseSubmitBehavior="False"  CausesValidation="false" CssClass="shadowBoxMin"    />
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="   " />
                                        <dx:ASPxButton ID="btnProcesar" OnClick="btnProcesar4_Click" UseSubmitBehavior="False" runat="server"  Text="Aceptar" Theme="Office365" Width="80" CssClass="shadowBoxMin"    />
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
                </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>

</asp:Content>
