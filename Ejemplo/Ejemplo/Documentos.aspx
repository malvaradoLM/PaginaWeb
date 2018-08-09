<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home.Master" CodeBehind="Documentos.aspx.cs" Inherits="Ejemplo.Documentos" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v17.2, Version=17.2.3.0,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .descargarButton{
        float:right;
            margin-top: 9%;
 }
    .marginSpread{
        margin-top:40px;
    }
        </style>
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
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Inicio</a></li>
    </ul>
</div>    
     <dx:ASPxButton runat="server" ClientSideEvents-Click="descargarDocumento" Theme="Office365" Text="DESCARGAR" AutoPostBack="false" CssClass="descargarButton shadowBoxMin" />
    <iframe id="pdf" runat="server" height="700" style="width:100%;" class="shadowBox fade-in animacion" >
         </iframe>
    <dx:ASPxSpreadsheet ID="ASPxSpreadsheet1" runat="server" WorkDirectory="~/App_Data/WorkDirectory" CssClass="shadowBox fade-in animacion marginSpread" Width="100%" Height="700" ReadOnly="true" RibbonMode="None" >
                    </dx:ASPxSpreadsheet>
    <asp:HiddenField ID="hiddenURL" runat="server" />
    <asp:HiddenField ID="ticketName" runat="server" />
    <asp:HiddenField ID="tipoDocumento" runat="server" />
</asp:Content>
