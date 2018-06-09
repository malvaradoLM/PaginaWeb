<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="EditarUsuario.aspx.cs" Inherits="Ejemplo.EditarUsuario" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%--  --%>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <style>
     .tablaMain
{
    /* 40px top, 5px right, px down, 5px izquierda */
    margin: 20px 5px 5px 5px; 
}
 </style>
    <table style="width:100%; height:500px">
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblNombre" Text="NOMBRE" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtNombre" runat="server"  Width="60%"  Font-Size="15px" Font-Bold="true"  HorizontalAlign="Left"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblUsuario" Text="USUARIO" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtUsuario" runat="server"  Width="60%" Font-Size="15px" Font-Bold="true"  HorizontalAlign="Left"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblClave" Text="CLAVE" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtClave" runat="server"  Width="60%" Font-Size="15px" Font-Bold="true"   HorizontalAlign="Left"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblNivelAdministrador" Text="NIVEL ADMINISTRADOR" runat="server" Font-Bold="true"/></td>
                            <td> 
                                <dx:ASPxCheckBox ID="chkAdministrador" runat="server"></dx:ASPxCheckBox>
                                <%--<dx:ASPxTextBox ID="txtPlacas" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true"   Enabled="false"></dx:ASPxTextBox>--%>
                            </td>
                        <tr>
                            <td></td> 
                            <td> 
                             <dx:ASPxButton runat="server" ID="btnGuardar" Text="GUARDAR" CssClass="btn-lg" HorizontalAlign="Right"></dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
</asp:Content>
