﻿<%@ Page Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="DetailsFacturaPendienteByPago.aspx.cs" Inherits="Ejemplo.DetailsFacturaPendienteByPago" %>

<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v17.2, Version=17.2.3.0,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %>


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
.bordes{
    border:none;
}
.buttonMargin {
        margin-left: 100%;
        margin-top: 20px;
    }
.radioMargin{
       margin-top: -12px;
}
 </style>
    <script>
        function validarFecha(s, e) {
            if (s.Value == null) {
                e.isValid == false;
            }
        }
        function descargarDocumento(s, e) {
            var url = document.getElementById("<%=hiddenURL.ClientID%>");
            var descarga = url.value;
            var nombreDoc = document.getElementById("<%=ticketName.ClientID%>");
            var checkbox = document.getElementById("<%=chkBoxList.ClientID%>");
            var tipo = "";
            if (checkbox.value == "1") tipo = ".pdf";
            else tipo = ".xls";

            download_file(url.value, nombreDoc.value + tipo);

        }
        function download_file(fileURL, fileName) {
            // for non-IE
            if (!window.ActiveXObject) {
                var save = document.createElement('a');
                save.href = fileURL;
                save.target = '_blank';
                var filename = fileURL.substring(fileURL.lastIndexOf('/') + 1);
                save.download = fileName || filename;
                if (navigator.userAgent.toLowerCase().match(/(ipad|iphone|safari)/) && navigator.userAgent.search("Chrome") < 0) {
                    document.location = save.href;
                    // window event not working here
                } else {
                    var evt = new MouseEvent('click', {
                        'view': window,
                        'bubbles': true,
                        'cancelable': false
                    });
                    save.dispatchEvent(evt);
                    (window.URL || window.webkitURL).revokeObjectURL(save.href);
                }
            }

            // for IE < 11
            else if (!!window.ActiveXObject && document.execCommand) {
                var _window = window.open(fileURL, '_blank');
                _window.document.close();
                _window.document.execCommand('SaveAs', true, fileName || fileURL)
                _window.close();
            }
        }
</script>
    <div class="alert alert-warning" id="msjAlerta" runat="server">
        <strong>Advertencia! </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>

     <link href="css/breadCrumb.css" rel="stylesheet">
 
    <div id="cssmenu" style="margin-top:60px;" class="row">  
    <ul>
        <li class="active"><a href="DetailsFacturaPendienteByPago.aspx">Facturas Pendientes De Pago</a></li>
        <li><a href="Reportes.aspx">Reportes</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Home</a></li>
    </ul>
</div>         
    
    <dx:ASPxRoundPanel ID="panelParametros" ClientInstanceName="roundPanel" HeaderText="PARAMETROS" runat="server" Width="100%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes" HeaderStyle-ForeColor="Gray" >   
        <PanelCollection>
            <dx:PanelContent>
            <dx:ASPxFormLayout runat="server" ID="ASPxFormLayout1" RequiredMarkDisplayMode="All"  EncodeHtml="false" UseDefaultPaddings="false" Theme="Office365"  Width="100%"  >
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500"  />
            <Items>
            <dx:LayoutGroup Caption="PARAMETROS" SettingsItemHelpTexts-Position="Bottom"  GroupBoxStyle-Border-BorderStyle="Solid" GroupBoxStyle-Caption-Font-Bold="true" GroupBoxStyle-Caption-Font-Size="XX-Large" CssClass="TextForm"  ShowCaption="False" ColCount="3">
                <GroupBoxStyle Border-BorderStyle="Solid" CssClass="shadowBox">
                    <Caption Font-Bold="True">
                    </Caption>
                </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem Caption="Fecha Corte" HelpText="Porfavor, ingrese la fecha de corte" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxDateEdit ID="txtFechaCorte" runat="server" OnValidation="txtFechaInicial_Validation" Theme="Office365" Width="100%" DateRangeSettings-MaxDayCount="10">
                                    <DropDownButton Image-IconID="">
                                        <Image IconID="conditionalformatting_adateoccurring_16x16">
                                        </Image>
                                    </DropDownButton>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" RequiredField-IsRequired="true" ErrorText="Valor inválido" >
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem Caption="Formato"  RequiredMarkDisplayMode="Hidden" CssClass="radioMargin" CaptionStyle-Font-Bold="true" VerticalAlign="Top">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxRadioButtonList ID="chkBoxList" runat="server" Border-BorderWidth="0" Theme="Office365" >
                                    <Items>
                                        <dx:ListEditItem Text="PDF" value="1"/>
                                        <dx:ListEditItem Text="XLS" value="2" />
                                    </Items>
                                    <Border BorderWidth="0px" />
                                </dx:ASPxRadioButtonList>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutGroup Border-BorderStyle="None"  Caption=" " CssClass="buttonMargin" GroupBoxDecoration="None" HorizontalAlign="Right" SettingsItemCaptions-HorizontalAlign="Right" Width="100" RowSpan="2" VerticalAlign="Bottom">
                        <Border BorderStyle="None" />
                        <Items>
                            <dx:LayoutItem  Border-BorderWidth="0px" CssClass="buttonMargin" HorizontalAlign="Right" RequiredMarkDisplayMode="Hidden" ShowCaption="False" Width="100">
                                <LayoutItemNestedControlCollection >
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" BorderStyle="None"  runat="server" ValidateRequestMode="Disabled" >
                                        <dx:ASPxButton ID="btnCancelar4" runat="server" OnClick="btnCancelar_Click" Text="Cancelar"  Theme="Office365" Width="80" UseSubmitBehavior="False"  CausesValidation="false" CssClass="shadowBoxMin"    />
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="   " />
                                        <dx:ASPxButton ID="btnProcesar4" UseSubmitBehavior="False" runat="server" OnClick="btnProcesar_Click" Text="Aceptar" Theme="Office365" Width="80" CssClass="shadowBoxMin"    />
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



    <dx:ASPxRoundPanel ID="panelDetalles" ClientInstanceName="roundPanel" HeaderText="DETALLES" runat="server" Width="100%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes" HeaderStyle-ForeColor="Gray" >
        <PanelCollection>
            <dx:PanelContent>
                <div id="Div1" runat="server">	
       <dx:ASPxRibbon ID="Ribbon" ClientInstanceName="Ribbon" runat="server" ShowGroupLabels="False" ShowFileTab="False" Width="100%" Theme="Office365" Minimized="True" Visible="true"   >
            <Styles TabContent-BackColor="White" GroupSeparator-BackColor="Transparent" GroupSeparator-Border-BorderStyle="None"  >
                <Item Width="100px"></Item>
                <GroupExpandButton Width="100px" BackColor="White"></GroupExpandButton>
                <TabContent Height="30px"/>
            </Styles>
            <Tabs>
                <dx:RibbonTab Text="Descargar">
                    <Groups>
                        <dx:RibbonGroup Text="Home">
                            <Items>
                                <dx:RibbonButtonItem  NavigateUrl="javascript:descargarDocumento()"  Name="DESCARGAR" ToolTip="DESCARGAR DOCUMENTO" >
                                    <LargeImage IconID="actions_download_32x32"></LargeImage>
                                    <SmallImage IconID="actions_download_16x16">
                                    </SmallImage>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </dx:RibbonButtonItem>
                            </Items>
                        </dx:RibbonGroup>
                    </Groups>
                </dx:RibbonTab>
            </Tabs>
        </dx:ASPxRibbon>
                 <iframe id="reporteDoc" style="position:relative; width: 100% ; height:450px;" runat="server" class="shadowBox fade-in animacion" ></iframe>
                    <dx:ASPxSpreadsheet ID="ASPxSpreadsheet1" runat="server" WorkDirectory="~/App_Data/WorkDirectory" CssClass="fade-in animacion" Width="100%" >
                    <SettingsDialogs InsertLinkDialog-ShowEmailAddressSection="true" />
                    </dx:ASPxSpreadsheet>

        </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <asp:HiddenField ID="hiddenURL" runat="server" />
    <asp:HiddenField ID="ticketName" runat="server" />
</asp:Content>

