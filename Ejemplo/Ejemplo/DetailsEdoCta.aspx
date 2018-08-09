<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home.Master" CodeBehind="DetailsEdoCta.aspx.cs" Inherits="Ejemplo.DetailsEdoCta" %>
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
 </style>
    <link href="css/breadCrumb.css" rel="stylesheet">
 
    <div id="cssmenu" style="margin-top:60px;" class="row">  
    <ul>
        <li class="active"><a href="DetailsEdoCta.aspx">Estado de Cuenta</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Inicio</a></li>
    </ul>
</div>
    <div class="alert alert-warning" id="msjAlerta" runat="server" visible="false">
        <strong><dx:ASPxLabel ID="lblTitleMensaje" runat="server" Font-Bold="true" /> </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>
    <p/>

    <div class="fade-in animacion">  
        <dx:ASPxRoundPanel ID="panelParametros" ClientInstanceName="roundPanel" HeaderText="PARAMETROS" runat="server" Width="90%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes" HeaderStyle-ForeColor="Gray" >
        <PanelCollection>
            <dx:PanelContent>
                <dx:ASPxFormLayout runat="server" ID="ASPxFormLayout1" RequiredMarkDisplayMode="All"  EncodeHtml="false" UseDefaultPaddings="false" Theme="Office365" SettingsItems-HorizontalAlign="Center" CssClass="parametroAlign"  >
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500"  />
            <Items>
            <dx:LayoutGroup Caption="PARAMETROS" SettingsItemHelpTexts-Position="Bottom"  GroupBoxStyle-Border-BorderStyle="Solid" GroupBoxStyle-Caption-Font-Bold="true" GroupBoxStyle-Caption-Font-Size="Large" CssClass="TextForm" ColCount="3" ShowCaption="False" >
                <GroupBoxStyle Border-BorderStyle="Solid" CssClass="shadowBox">
                    <Caption Font-Bold="True">
                    </Caption>
                </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem Caption="Ejercicio" HelpText="Seleccione año del Ejercicio" CaptionStyle-Font-Bold="true"  RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxComboBox ID="cmbEjercicio" runat="server"   Font-Size="15px" Font-Bold="true"  HorizontalAlign="Left" autocomplete="off" Theme="Office365">
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Periodo" HelpText="Seleccione periodo del año" CaptionStyle-Font-Bold="true" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxComboBox ID="cmbPeriodo" runat="server"  Font-Size="15px" Font-Bold="true"  HorizontalAlign="Left" autocomplete="off" Theme="Office365">
                                    <Items>
                                     <dx:ListEditItem Text="Enero" Value="1"></dx:ListEditItem>
                                     <dx:ListEditItem Text="Febrero" Value="2"></dx:ListEditItem>
                                     <dx:ListEditItem Text="Marzo" Value="3"></dx:ListEditItem>
                                     <dx:ListEditItem Text="Abril" Value="4"></dx:ListEditItem>
                                     <dx:ListEditItem Text="Mayo" Value="5"></dx:ListEditItem>
                                     <dx:ListEditItem Text="Junio" Value="6"></dx:ListEditItem>
                                     <dx:ListEditItem Text="Julio" Value="7"></dx:ListEditItem>
                                     <dx:ListEditItem Text="Agosto" Value="8"></dx:ListEditItem>
                                     <dx:ListEditItem Text="Septiembre" Value="9"></dx:ListEditItem>
                                     <dx:ListEditItem Text="Octubre" Value="10"></dx:ListEditItem>
                                     <dx:ListEditItem Text="Noviembre" Value="11"></dx:ListEditItem>
                                     <dx:ListEditItem Text="Diciembre" Value="12"></dx:ListEditItem>
                                 </Items>
                                    </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem> 
                    <dx:LayoutGroup Border-BorderStyle="None"  Caption=" " CssClass="buttonMargin" GroupBoxDecoration="None" HorizontalAlign="Right" SettingsItemCaptions-HorizontalAlign="Right" Width="100" RowSpan="2" VerticalAlign="Bottom">
                        <Border BorderStyle="None" />
                        <Items>
                            <dx:LayoutItem  Border-BorderWidth="0px" CssClass="buttonMargin" HorizontalAlign="Right" RequiredMarkDisplayMode="Hidden" ShowCaption="False" Width="100">
                                <LayoutItemNestedControlCollection >
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" BorderStyle="None"  runat="server" ValidateRequestMode="Disabled" >
                                        <dx:ASPxButton ID="btnCancelar4" runat="server" OnClick="btnCancelar4_Click" Text="Cancelar"  Theme="Office365" Width="80" UseSubmitBehavior="False"  CausesValidation="false" CssClass="shadowBoxMin"    />
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="   " />
                                        <dx:ASPxButton ID="btnProcesar4" UseSubmitBehavior="False" runat="server" OnClick="btnProcesar4_Click" Text="Aceptar" Theme="Office365" Width="80" CssClass="shadowBoxMin"    />
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
        <dx:ASPxRoundPanel ID="panelDetalles" ClientInstanceName="roundPanel" HeaderText="RESULTADOS" runat="server" Width="90%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes" HeaderStyle-ForeColor="Gray" >
        <PanelCollection>
            <dx:PanelContent>
                <dx:BootstrapGridView ID="bgvEstadoCuenta" runat="server"   AutoGenerateColumns="false" KeyFieldName="UsuarioWebID" CssClassesPager-Control="true" CssClasses-Table="table table-striped table-bordered table-hover" >
                <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
                <SettingsDataSecurity AllowEdit="True" />
                <SettingsBehavior AllowFocusedRow="True" />
                    <SettingsAdaptivity AdaptivityMode="HideDataCells" />
                <Columns>
                    <dx:BootstrapGridViewTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0"  HorizontalAlign="Center">
                                        <DataItemTemplate>
                                            <%#Eval("MovimientoID")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="FechaMovimiento" ReadOnly="True" VisibleIndex="1" UnboundType="DateTime" HorizontalAlign="Center">
                      <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />      
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Referencia" ReadOnly="True" VisibleIndex="2">
                                        <DataItemTemplate>
                                            <%#Eval("Referencia")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Cargo" ReadOnly="True" VisibleIndex="3"  UnboundType="Decimal" HorizontalAlign="Right"  >
                                         <PropertiesTextEdit DisplayFormatString="c" />  
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Abono" ReadOnly="True" VisibleIndex="4"  UnboundType="Decimal" HorizontalAlign="Right">
                                         <PropertiesTextEdit DisplayFormatString="c" />  
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Saldo" ReadOnly="True" VisibleIndex="5"  UnboundType="Decimal" HorizontalAlign="Right" >
                                        <PropertiesTextEdit DisplayFormatString="c" />  
                    </dx:BootstrapGridViewTextColumn>
                    
                </Columns>

           </dx:BootstrapGridView>
            </dx:PanelContent>
             </PanelCollection>
        </dx:ASPxRoundPanel>

        </div>
</asp:Content>
