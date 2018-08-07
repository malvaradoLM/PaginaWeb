<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Oops.aspx.cs" MasterPageFile="~/Home.Master" Inherits="Ejemplo.ErrorPages.Oops" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
     .floatIcon{
          margin-left:21%;
     }
     .marginForm{
         margin-top:25%;
         margin-left:25%;
     }
     .labelClass{
         text-align: right;
     }
</style>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
       <dx:ASPxFormLayout runat="server" ID="formLayout" CssClass="marginForm fade-in animacion" Theme="Office365" Width="100%">
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
            <Items>
                <dx:LayoutGroup Caption="Oops" ColCount="1" GroupBoxDecoration="None" UseDefaultPaddings="false" Paddings-PaddingTop="10">
                    <GroupBoxStyle>
                        <Caption Font-Bold="true" />
                    </GroupBoxStyle>
                    <Items>
                        <dx:LayoutItem Caption="Ha ocurrido un error inesperado, contacte al administrador" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Icons/png/80px/large/warning.png" CssClass="floatIcon" Width="80px" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Ha ocurrido un error inesperado, contacte al administrador" ShowCaption="False" CaptionStyle-Font-Size="X-Large" CaptionSettings-Location="Left" CaptionCellStyle-CssClass="labelClass">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
            <asp:Label ID="Image2" runat="server" Text="Error inesperado, contacte con el Administrador" Font-Size="X-Large" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
            </Items>
        </dx:ASPxFormLayout>
        
        


    
</asp:Content>
