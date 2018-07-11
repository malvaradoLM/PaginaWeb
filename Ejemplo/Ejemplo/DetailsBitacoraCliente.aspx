<%@ Page Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="DetailsBitacoraCliente.aspx.cs" Inherits="Ejemplo.DetailsBitacoraCliente" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>


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
 </style>
    <div class="alert alert-warning" id="msjAlerta" runat="server">
        <strong>Advertencia! </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>
<div id="nav" class="container" style="margin-left:0px; margin-right:0px">
    <%-- 
    <h1>Bitácora Cliente</h1></div>
    <div class="row">
            <ol class="breadcrumb Cards-Contenido col-lg-10" style="background:initial;">
                <li class="breadcrumb-item"><a href="Reportes.aspx">Reportes</a></li>
                <li class="breadcrumb-item active ">Bitácora Cliente</li>
            </ol>
        </div>
    <div id="exTab1" class="container" style="margin-left:0px; margin-right:0px">	
        <ul id="myTabs" class="nav nav-pills" style="padding:0px">
		</ul>
        <div class="tab-content clearfix">
            <div class="tab-pane active" id="1a" >
         <table style="width:100%; height:500px">
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblFechaInicial" Text="FECHA INICIAL" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxDateEdit ID="txtFechaInicial" runat="server" Font-Bold="true" OnValidation="txtFechaInicial_Validation"/>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblFechaFinal" Text="FECHA FINAL" runat="server" Font-Bold="true"/></td>
                            <td>
                            <dx:ASPxDateEdit ID="txtFechaFinal" runat="server" Font-Bold="true" OnValidation="txtFechaFinal_Validation"/>
                            </td>
                        </tr>
                        <tr>
                             <td><dx:ASPxLabel ID="lblCheckBoxes" Text="SELECCIONE UNA OPCION" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxRadioButtonList ID="chkBoxList" runat="server" Border-BorderWidth="0">
                                    <Items>
                                    <dx:ListEditItem Text="FORMATO PDF" value="1"   />
                                    <dx:ListEditItem Text="FORMATO EXCEL" value="2" />
                                    </Items>
                                 </dx:ASPxRadioButtonList>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        <asp:LinkButton  id="btnProcesar" OnClick="btnProcesar_Click" class="btn-sample btn-lg labelCuadro"  type="button" style="float:right;margin-top: 1px; background-color:mediumseagreen" runat="server" Text="VER REPORTE " >
    
</asp:LinkButton>
<asp:LinkButton id="btnCancelar" OnClick="btnCancelar_Click" class="btn-sample btn-lg labelCuadro"  type="button" style="float:right;background-color:red; margin-right:1px; margin-top: 1px;" runat="server" Text="CANCELAR " >
  
 </asp:LinkButton>
<div id="detallesReporte" runat="server">	
       <iframe id="reporteDoc" style="position:relative; width: 100% ; height:600px; border:0px;" runat="server" ></iframe>
        </div>
        --%>

    <link href="css/breadCrumb.css" rel="stylesheet">
 
    <div id="cssmenu" style="margin-top:20px" class="row">  
    <ul>
        <li class="active"><a href="DetailsBitacoraCliente.aspx">Bitácora Cliente</a></li>
        <li><a href="Reportes.aspx">Reportes</a></li>
        <li><a href="Dashboard.aspx"><i class="fa fa-home"></i> Home</a></li>
    </ul>
</div>         
    <p>





        <dx:ASPxFormLayout runat="server" ID="exampleFormLayout" RequiredMarkDisplayMode="All"  EncodeHtml="false" UseDefaultPaddings="false" Theme="Office365" SettingsItems-HorizontalAlign="Center"   >
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500"  />
            <Items>
            <dx:LayoutGroup Caption="PARAMETROS" SettingsItemHelpTexts-Position="Bottom" GroupBoxStyle-Border-BorderStyle="Solid" GroupBoxStyle-Caption-Font-Bold="true" GroupBoxStyle-Caption-Font-Size="Large" CssClass="TextForm" >
                <GroupBoxStyle Border-BorderStyle="Solid" CssClass="shadowBox">
                    <Caption Font-Bold="True">
                    </Caption>
                </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem Caption="Fecha Inicial" HelpText="Porfavor, ingrese la fecha inicial">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxDateEdit ID="txtFechaInicial" runat="server" ButtonEditEllipsisImage-IconID="" Theme="Office365" Width="100%" CssClass="shadowBox"  >
                                    <DropDownButton Image-IconID="">
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
                    <dx:LayoutItem Caption="Fecha Final" HelpText="Porfavor, ingrese la fecha final">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxDateEdit ID="txtFechaFinal" runat="server" Theme="Office365" Width="100%" CssClass="shadowBox" >
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
                    <dx:LayoutItem Caption="Formato" HorizontalAlign="Right" RequiredMarkDisplayMode="Hidden" Width="100">
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
                    <dx:LayoutGroup Border-BorderStyle="None"  Caption=" " CssClass="noBorder" GroupBoxDecoration="None" HorizontalAlign="Right" SettingsItemCaptions-HorizontalAlign="Right" Width="100">
                        <Border BorderStyle="None" />
                        <Items>
                            <dx:LayoutItem  Border-BorderWidth="0px" CssClass="noBorder" HorizontalAlign="Right" RequiredMarkDisplayMode="Hidden" ShowCaption="False" Width="100">
                                <LayoutItemNestedControlCollection >
                                    <dx:LayoutItemNestedControlContainer ID="buttons" BorderStyle="None" CssClass="noBorder" runat="server" ValidateRequestMode="Disabled" >
                                        <dx:ASPxButton ID="btnCancelar4" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" Theme="Office365" Width="80" UseSubmitBehavior="False"  CausesValidation="false" CssClass="shadowBoxMin"    />
                                        <dx:ASPxLabel ID="separator" runat="server" Text="   " />
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
        <p>
        <p>
        <div id="detallesReporte" runat="server" class="shadowBox"  >	
       <iframe id="reporteDoc" style="position:relative; width: 100% ; height:600px; border:0px;" runat="server" ></iframe>
        </div>
    </div>	

</asp:Content>
