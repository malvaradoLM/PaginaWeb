<%@ Page Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="DetailsConsumoByDpto.aspx.cs" Inherits="Ejemplo.DetailsConsumoByDpto" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v17.2, Version=17.2.3.0,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %>


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
 .descargarButton{
        float:right;
        margin-bottom:5px;
         margin-left: 2px;
 }
    .marginSpread{
        margin-top:40px;
    }
                .dxflGroupCell_Office365 {
    padding: 0 5px;
    }
 </style>
    <script>
        function descargarDocumento(s, e) {
            var url = document.getElementById("<%=hiddenURL.ClientID%>");
        var descarga = url.value;
        var nombreDoc = document.getElementById("<%=ticketName.ClientID%>");
        var checkbox = document.getElementById("ContentPlaceHolder1_panelParametros_ASPxFormLayout1_chkBoxList_RB0_I");
        var tipo = "";
        if (document.getElementById("<%=hiddenURL.ClientID%>").value.includes("pdf")) tipo = ".pdf";
        else tipo = ".xls";
        download_file(url.value, nombreDoc.value + tipo);

        }
        function imprimir(s, e) {
            if (document.getElementById("<%=hiddenURL.ClientID%>").value.includes("pdf"))
                document.getElementById("<%=reporteDoc.ClientID%>").contentWindow.print();
            else {
                //Get the HTML of div
                document.getElementById("<%=reporteDoc.ClientID%>").contentWindow.print();
            }
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
        <li class="active"><a href="DetailsConsumoByDpto.aspx">Consumo por Departamento</a></li>
        <li><a href="Reportes.aspx">Reportes</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Inicio</a></li>
    </ul>
</div>   
<div class="fade-in animacion">  
<dx:ASPxRoundPanel ID="panelParametros" ClientInstanceName="roundPanel" HeaderText="PARAMETROS" runat="server" Width="90%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes" HeaderStyle-ForeColor="Gray" >
        <PanelCollection>
            <dx:PanelContent>
                 <dx:ASPxFormLayout runat="server" ID="ASPxFormLayout1" RequiredMarkDisplayMode="All"  EncodeHtml="false" UseDefaultPaddings="false" Theme="Office365" SettingsItems-HorizontalAlign="Center" CssClass="parametroAlign"  >
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500"  />
            <Items>
            <dx:LayoutGroup Caption="PARAMETROS" SettingsItemHelpTexts-Position="Bottom"  GroupBoxStyle-Border-BorderStyle="Solid" GroupBoxStyle-Caption-Font-Bold="true" GroupBoxStyle-Caption-Font-Size="Large" CssClass="TextForm" ColCount="4" ShowCaption="False" >
                <GroupBoxStyle Border-BorderStyle="Solid" CssClass="shadowBox">
                    <Caption Font-Bold="True">
                    </Caption>
                </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem Caption="Fecha Inicial" HelpText="Porfavor, ingrese la fecha inicial" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxDateEdit ID="txtFechaInicial" runat="server" OnValidation="txtFechaInicial_Validation" Theme="Office365" >
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
                    <dx:LayoutItem Caption="Fecha Final" HelpText="Porfavor, ingrese la fecha final" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxDateEdit ID="txtFechaFinal" runat="server" OnValidation="txtFechaFinal_Validation" Theme="Office365">
                                    <DropDownButton>
                                        <Image IconID="conditionalformatting_adateoccurring_16x16">
                                        </Image>
                                    </DropDownButton>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" RequiredField-IsRequired="true" ErrorText="Valor inválido">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem> 
                    <dx:LayoutItem Caption="Formato:" HorizontalAlign="Left" RequiredMarkDisplayMode="Hidden" CssClass="radioMargin" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxRadioButtonList ID="chkBoxList" runat="server" Border-BorderWidth="0" Theme="Office365">
                                    <Items>
                                        <dx:ListEditItem Text="PDF" value="1" />
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
                                        <dx:ASPxButton ID="btnCancelar4" runat="server" OnClick="btnCancelar_Click" Text="Cancelar"  Theme="Office365" Width="80" UseSubmitBehavior="False"  CausesValidation="false" CssClass="shadowBoxMin"    ImagePosition="Right">
                                            <Image Url="~/Icons/png/16px/large/button-cancel.png">
                                              </Image>
                                            </dx:ASPxButton>
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="   " />
                                        <dx:ASPxButton ID="btnProcesar4" UseSubmitBehavior="False" runat="server" OnClick="btnProcesar_Click" Text="Aceptar" Theme="Office365" Width="80" CssClass="shadowBoxMin" ImagePosition="Right">
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
            </dx:PanelContent>
        </PanelCollection>
        </dx:ASPxRoundPanel>
         <dx:ASPxRoundPanel ID="panelDetalles" ClientInstanceName="roundPanel" HeaderText="DETALLES" runat="server" Width="90%" Theme="Metropolis" BackColor="White" Border-BorderStyle="None" Border-BorderWidth="0px" ShowCollapseButton="true"   Border-BorderColor ="Gray" CssClass="bordes" HeaderStyle-ForeColor="Gray" >
        <PanelCollection>
            <dx:PanelContent>
                                                <dx:ASPxButton runat="server" ClientSideEvents-Click="descargarDocumento" Theme="Office365" Text="DESCARGAR" AutoPostBack="false" CssClass="descargarButton shadowBoxMin" ImagePosition="Right">
                                                    <Image Url="~/Icons/png/16px/large/button-download.png">
                                              </Image>
                                            </dx:ASPxButton>
                <dx:ASPxButton runat="server" ClientSideEvents-Click="imprimir" ID="imprimir" Theme="Office365" Text="IMPRIMIR" AutoPostBack="false" CssClass="descargarButton shadowBoxMin" ImagePosition="Right" >
                <Image Url="~/Icons/png/16px/large/printer.png">
                                              </Image>
                                            </dx:ASPxButton>
                <div id="Div1" runat="server">	
                 <iframe id="reporteDoc" style="position:relative; width: 100% ; height:500px;" runat="server" class="shadowBox fade-in animacion" ></iframe>
                    <dx:ASPxSpreadsheet ID="ASPxSpreadsheet1" runat="server" WorkDirectory="~/App_Data/WorkDirectory" CssClass="fade-in animacion marginSpread" Width="100%" RibbonMode="None" ReadOnly="true" >
                    <SettingsDialogs InsertLinkDialog-ShowEmailAddressSection="true" />
                    </dx:ASPxSpreadsheet>

        </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>

    <asp:HiddenField ID="hiddenURL" runat="server" />
    <asp:HiddenField ID="ticketName" runat="server" />
        </div>
</asp:Content>



