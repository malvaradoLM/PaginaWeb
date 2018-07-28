<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home.Master" CodeBehind="Documentos.aspx.cs" Inherits="Ejemplo.Documentos" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v17.2, Version=17.2.3.0,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script>

    function descargarDocumento(s, e) {
        var url = document.getElementById("<%=hiddenURL.ClientID%>");
        var descarga = url.value;
        var nombreDoc = document.getElementById("<%=ticketName.ClientID%>");
        var checkbox = document.getElementById("<%=tipoDocumento.ClientID%>");

        download_file(url.value, nombreDoc.value + checkbox.value);

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
    <div class="alert alert-warning" id="msjAlerta" runat="server" visible="false">
        <strong>Advertencia! </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>
     <link href="css/breadCrumb.css" rel="stylesheet">
     <div id="cssmenu" style="margin-top:60px;" class="row">  
    <ul>
        <li class="active"><a>Documento</a></li>
        <li><a href="DetailsDescargaFactura.aspx">Descarga de Factura</a></li>
        <li><a href="DetailsListaFactura.aspx">Listado de Facturas</a></li>
        <li><a href="DatosCliente.aspx">Datos Cliente</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Home</a></li>
    </ul>
</div>    
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
    <iframe id="pdf" runat="server" height="800" style="width:100%;" >
         </iframe>
    <dx:ASPxSpreadsheet ID="ASPxSpreadsheet1" runat="server" WorkDirectory="~/App_Data/WorkDirectory" CssClass="fade-in animacion" Width="100%" Height="800" >
                    <SettingsDialogs InsertLinkDialog-ShowEmailAddressSection="true" />
                    </dx:ASPxSpreadsheet>
    <asp:HiddenField ID="hiddenURL" runat="server" />
    <asp:HiddenField ID="ticketName" runat="server" />
    <asp:HiddenField ID="tipoDocumento" runat="server" />
</asp:Content>
