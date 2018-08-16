<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Vehiculos.aspx.cs" enableEventValidation ="false" Inherits="Ejemplo.WebForm3" %>

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
.animacion{
        animation: fadeInScale 0.7s ease-in-out;
}
.labelLimpia{
    background: #ffffff;
    font-weight:500;
}
.checkbox {
  position: relative;
  top: -0.375rem;
  margin: 0 1rem 0 0;
  cursor: pointer;
}

.checkbox:before {
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  content: "";
  position: absolute;
  left: 0;
  z-index: 1;
  width: 1rem;
  height: 1rem;
  border: 2px solid #f2f2f2;
}

.checkbox:checked:before {
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  -ms-transform: rotate(-45deg);
  -o-transform: rotate(-45deg);
  transform: rotate(-45deg);
 height: .5rem;
  border-color: #009688;
  border-top-style: none;
  border-right-style: none;
}

.checkbox:after {
  content: "";
  position: absolute;
  top: -0.125rem;
  left: 0;
  width: 1.1rem;
  height: 1.1rem;
  background: #fff;
  cursor: pointer;
}
.shadowBox{
    padding: 5px;
    box-shadow: 3px 8px 6px #888888;
}
.caption
{
    width: 150px;
    float:right;
}
.galleryStyle .dxp-pageSizeItem
    {
        visibility: hidden;
    }
    </style>
    <script>
        function checks(control) {
            if (control.id == "1" || control.id == "0") {
                if (control.id == "1") {
                    $(".all").attr("checked", true);
                    $(".all").prop("checked", true);
                } else {
                    $(".all").attr("checked", false);
                    $(".all").prop("checked", false);
                }
            } else {
                var id = control.id.replace('ContentPlaceHolder1_', '');
                var checks = $("." + control.id.replace('ContentPlaceHolder1_', ''));
                var attr = "";
                attr = $(checks[0]).attr('checked');
                if (typeof attr !== typeof undefined && attr !== false) {
                    $("." + id).attr("checked", false);
                    $("." + id).prop("checked", false);
                } else {
                    $("." + id).attr("checked", true);
                    $("." + id).prop("checked", true);
                }
            }
        }
        function clickFoto(s, e) {
            var foto = s;
            var fotoUpload = document.getElementById('ContentPlaceHolder1_BinaryImage_DXPreview');
            var image = "" + foto.items[e.index].tu + "";
            fotoUpload.src = image;
            document.getElementById("ContentPlaceHolder1_BinaryImage_DXValueKeyInput").value = image;
        }
        function checksasp(s, e) {
            if (s.globalName == "1" || s.globalName == "0") {
                if (s.globalName == "1") {
                    $(".all").attr("checked", true);
                    $(".all").prop("checked", true);
                } else {
                    $(".all").attr("checked", false);
                    $(".all").prop("checked", false);
                }
            } else {
                var id = control.id.replace('ContentPlaceHolder1_', '');
                var checks = $("." + control.id.replace('ContentPlaceHolder1_', ''));
                var attr = "";
                attr = $(checks[0]).attr('checked');
                if (typeof attr !== typeof undefined && attr !== false) {
                    $("." + id).attr("checked", false);
                    $("." + id).prop("checked", false);
                } else {
                    $("." + id).attr("checked", true);
                    $("." + id).prop("checked", true);
                }
            }
        }
        $(document).ready(function () {
            for (var i = 0; i < 24; i++) {
                $('#<%=tableHorarios.ClientID%>').find('td').eq(i).after("<td><span id='col" + numeroFormato(i) + "' onclick= 'checks(this);' style= ' cursor: pointer; font-weight:bold;' class='dxeBase'  >" + numeroFormato(i) + "</span ></td > ");
            }
            if (location.hash) {
                $(location.hash).attr("checked", true);
                $(location.hash).prop("checked", true);

            } else {
                $("#tab1").attr("checked", true);
                $("#tab1").prop("checked", true);
            }
        })
        function numeroFormato(num) {
            var numero = num.toString();
            if (numero.length < 2) numero = "0" + numero;
            return numero;
        }
        function checarcheck(valor) {
            if (valor == undefined || valor == false)
                return "0";
            else return "1";
        }
        function leerTabla(s,e) {
            var TableData = new Array();
            TableData = recibirParametros();
            var TableData1 = JSON.stringify(TableData);
            $.ajax({
                type: "POST",
                url: "Vehiculos.aspx/leer",
                data: JSON.stringify({ ID: TableData1 }),
                contentType: "application/json",
                async: true,
                dataType: "json",
                success: function (result) {
                    alert(result.d);
                    var tab = tabActual();
                    window.location.hash = tab;
                    window.location.reload();

                },
                error: function (xhr, textStatus, error) {
                    console.log(xhr.statusText);
                    console.log(textStatus);
                    console.log(error);
                }
            });
        }
        function tabActual() {
            var result = "";
            for (var i = 1; i < 7; i++) {
                if ($("#tab" + i).is(":checked")) result = "#tab" + i;
            }
            return result;
        }
        function recibirParametros() {
            var TableData = new Array();
            var TableData2 = new Array();
            $('#<%=tableHorarios.ClientID%> tr').each(function (row, tr) {
                TableData[row] = {
                    "Dia": "" + $(tr).find('th:eq(0)').text() + ""
                    , "Valor": leerChecks(tr)
                }
            });
            TableData.shift();
            var TableData2 = new Array();
            TableData2[0] = {
                "Nip": document.getElementById('<%=txtNIP.ClientID%>_I').value
                , "Status": getStatus(document.getElementById('<%=cmbEstatusActual.ClientID%>_I').value.charAt(0))
                , "CargasMaximas": document.getElementById('<%=txtCargasMaximas.ClientID%>_I').value
                , "LimiteLTDia": document.getElementById('<%=txtLAVDiario.ClientID%>_I').value
                , "LimiteLTSemana": document.getElementById('<%=txtLAVSemanal.ClientID%>_I').value
                , "LimiteLTMes": document.getElementById('<%=txtLAVMensual.ClientID%>_I').value
                , "LimiteMNDia": document.getElementById('<%=txtLAIDiario.ClientID%>_I').value
                , "LimiteMNSemana": document.getElementById('<%=txtLAISemanal.ClientID%>_I').value
                , "LimiteMNMes": document.getElementById('<%=txtLAIMensual.ClientID%>_I').value
                , "ProductoAutorizado": getProductoAutorizado()
                , "VehiculoID": document.getElementById('<%=txtVehiculoID.ClientID%>_I').value
                , "Departamento": document.getElementById('<%=txtDepartamento.ClientID%>_I').value
                , "NombreUsuario": document.getElementById('<%=txtNombreUsuario.ClientID%>_I').value
                , "CentroCosto": document.getElementById('<%=txtCentrodeCosto.ClientID%>_I').value
                , "Tanque": getTanque()
                , "Lunes": TableData[0]["Valor"]
                , "Martes": TableData[1]["Valor"]
                , "Miercoles": TableData[2]["Valor"]
                , "Jueves": TableData[3]["Valor"]
                , "Viernes": TableData[4]["Valor"]
                , "Sabado": TableData[5]["Valor"]
                , "Domingo": TableData[6]["Valor"]
                , "Estacion": obtenerIdEstacion(document.getElementById('<%=cmbLimitarEstacion.ClientID%>_I').value)
                , "Foto": getFoto()
            }

            return TableData2;
        }
        function getFoto() {
            if (document.getElementById("ContentPlaceHolder1_BinaryImage_DXValueKeyInput").value != null && document.getElementById("ContentPlaceHolder1_BinaryImage_DXValueKeyInput").value != "")
                return document.getElementById('ContentPlaceHolder1_BinaryImage_DXPreview').src;
            else return null;
        }
        function getStatus(letra) {
            if (letra == "I") return "C";
            else return letra;
        }
        function getTanque() {
            var tanque = document.getElementById('<%=txtTanque.ClientID%>_I').value;
            if (tanque == null || tanque == "")
                return 0;
            else return tanque;
        }
        function leerChecks(tr) {
            result = "";
            for (var i = 0; i < 24; i++) {
                result = result + checarcheck($(tr).find(':checkbox:eq(' + i + ')').is(':checked'));
            }
            return result;
        }
        function obtenerIdEstacion(estacion) {
            if (estacion != "") {
                var array = estacion.split("-");
                if (array[0] != "") return array[0];
                else return array[1];
            } else return "";
        }
        function getProductoAutorizado() {
            var ProductoAutorizado = "";
            for (var i = 0; i < 4; i++) {
                if (document.getElementById("ContentPlaceHolder1_ASPxFormLayout1_checkboxdx_RB"+i+"_I").value == "C") ProductoAutorizado += "" + (i + 1);
            }
            return ProductoAutorizado;
        }
        function cancelarHorario(s, e) {
           
            window.location.reload();
        }
    </script>
    <%-- TABS CSS --%>
    <link href="css/tabs.css" rel="stylesheet" >
    <link href="css/breadCrumb.css" rel="stylesheet">
 
    <div class="alert alert-warning" id="msjAlerta" runat="server" visible="false">
        <strong><dx:ASPxLabel ID="lblTitleMensaje" runat="server" Font-Bold="true" /> </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>
            
    <div id="cssmenu" style="margin-top:60px;" class="row">  
    <ul>
        <li class="active"><a>Editar Vehiculo</a></li>
        <li><a href="VehiculoPage.aspx">Vehiculos</a></li>
        <li><a href="MenuPrincipal.aspx"><i class="fa fa-home"></i> Inicio

            </a></li>
    </ul>
</div> 
		<div class="tab_container" style="margin-top:-30px">
			<input id="tab1"  type="radio" name="tabs" >
			<label for="tab1" ><i class="fa fa-car"></i><span>Datos</span></label>

			<input id="tab2" type="radio" name="tabs">
			<label for="tab2" ><i class="fa fa-lock"></i><span>Seguridad</span></label>

			<input id="tab3" type="radio" name="tabs">
			<label for="tab3" ><i class="fa fa-calendar-check-o"></i><span>Fechas</span></label>

			<input id="tab4" type="radio" name="tabs">
			<label for="tab4" ><i class="fa fa-tachometer"></i><span>Consumo</span></label>

			<input id="tab5" type="radio" name="tabs">
			<label for="tab5" ><i class="fa fa-history"></i><span>Historial</span></label>

            <input id="tab6" type="radio" name="tabs">
			<label for="tab6" ><i class="fa fa-clock-o"></i><span>Horarios</span></label>
            <input id="tab7" type="radio" name="tabs">
			<label for="tab7" ><i class="fa fa-clock-o"></i><span>Album</span></label>
            

			<section id="content1" >
		      	<dx:ASPxFormLayout runat="server" ID="exampleFormLayout" RequiredMarkDisplayMode="None" EncodeHtml="true"  Theme="Office365"  CssClass="animacion" AlignItemCaptionsInAllGroups="true" >
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500"  />
                      <SettingsItemCaptions Location="Top" />
                      <SettingsItems HorizontalAlign="Center"  />
            <Items>
            <dx:LayoutGroup Caption="DATOS"  CssClass="labelLimpia" ColCount="3"  ShowCaption="True" AlignItemCaptions="true" SettingsItems-HorizontalAlign="Right" SettingsItems-VerticalAlign="Middle" >
                <GroupBoxStyle Border-BorderStyle="Solid" CssClass="shadowBox">
                    <Caption Paddings-PaddingTop="1px">
                    </Caption>
                </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem Caption="Vehiculo ID" VerticalAlign="Middle" CaptionStyle-Font-Bold="true" CssClass="caption" CaptionStyle-Font-Size="Medium">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer >
                     <dx:ASPxTextBox ID="txtVehiculoID" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Identificación" VerticalAlign="Middle" CaptionStyle-Font-Bold="true" CssClass="caption" CaptionStyle-Font-Size="Medium">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                           <dx:ASPxTextBox ID="txtIdentificacion" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Departamento" VerticalAlign="Middle" CaptionStyle-Font-Bold="true" CssClass="caption" CaptionStyle-Font-Size="Medium">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                           <dx:ASPxTextBox ID="txtDepartamento" runat="server" Theme="Office365" ></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Nombre/Usuario" VerticalAlign="Middle" CaptionStyle-Font-Bold="true" CssClass="caption" CaptionStyle-Font-Size="Medium">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                           <dx:ASPxTextBox ID="txtNombreUsuario" runat="server" Theme="Office365" AutoPostBack="false"></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Centro Costo"  CaptionStyle-Font-Bold="true" CssClass="caption" CaptionStyle-Font-Size="Medium">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                           <dx:ASPxTextBox ID="txtCentrodeCosto" runat="server" Theme="Office365" ></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tanque"  ShowCaption="True" CssClass="caption" CaptionStyle-Font-Size="Medium" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                           <dx:ASPxSpinEdit runat="server" ID="txtTanque" MinValue="0" Theme="Office365" NumberType="Float" />
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
        </dx:ASPxFormLayout>
			</section>

			<section id="content2" class="tab-content">
				<dx:ASPxFormLayout runat="server" ID="ASPxFormLayout1" RequiredMarkDisplayMode="None" EncodeHtml="false" UseDefaultPaddings="true" Theme="Office365"  CssClass="animacion"  >
                    <SettingsItemCaptions Location="Top" />
                      <SettingsItems HorizontalAlign="Center"  />
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500"  />
            <Items>
            <dx:LayoutGroup Caption="SEGURIDAD"  CssClass="labelLimpia" ColCount="3" ShowCaption="True"  >
                <GroupBoxStyle Border-BorderStyle="Solid" CssClass="shadowBox">
                    <Caption Paddings-PaddingTop="1px">
                    </Caption>
                </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem Caption="NIP"  VerticalAlign="Middle" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer >
                    <dx:ASPxTextBox ID="txtNIP" runat="server" Theme="Office365" ></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Estatus Actual" VerticalAlign="Middle" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
     <dx:ASPxComboBox ID="cmbEstatusActual" runat="server" Theme="Office365"></dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Productos Autorizados" VerticalAlign="Middle" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxCheckBoxList ID="checkboxdx" runat="server" Theme="Office365" Border-BorderStyle="None" RepeatColumns="1" ClientInstanceName="checkProducto">
                                    <Items>
                                        <dx:ListEditItem Text="PREMIUM" Value="1"/>
                                        <dx:ListEditItem Text="MAGNA"  Value="2"/>
                                        <dx:ListEditItem Text="DIESEL" Value="3"/>
                                        <dx:ListEditItem Text="OTROS" Value="4"/>
                                    </Items>
                                 </dx:ASPxCheckBoxList>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Cargas Max. diarias" VerticalAlign="Middle" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                    <dx:ASPxTextBox ID="txtCargasMaximas" runat="server" Theme="Office365"></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Limitar a Estacion" VerticalAlign="Middle" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                          <dx:ASPxComboBox ID="cmbLimitarEstacion" runat="server" Theme="Office365" ></dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
        </dx:ASPxFormLayout>
			</section>
			<section id="content3" class="tab-content">
				<dx:ASPxFormLayout runat="server" ID="ASPxFormLayout2" RequiredMarkDisplayMode="None" EncodeHtml="false" UseDefaultPaddings="true" Theme="Office365"  CssClass="animacion"  >
                    <SettingsItemCaptions Location="Top" />
                      <SettingsItems HorizontalAlign="Center"  />
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500"  />
            <Items>
            <dx:LayoutGroup Caption="FECHAS"  CssClass="labelLimpia" ColCount="3" ShowCaption="True">
                <GroupBoxStyle Border-BorderStyle="Solid" CssClass="shadowBox">
                    <Caption Paddings-PaddingTop="1px">
                    </Caption>
                </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem Caption="Fecha de Alta"  VerticalAlign="Middle" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer >
                    <dx:ASPxDateEdit ID="txtFechaAlta" runat="server" Theme="Office365" ReadOnly="true" >
                                    <DropDownButton Image-IconID="">
                                        <Image IconID="conditionalformatting_adateoccurring_16x16">
                                        </Image>
                                    </DropDownButton>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" RequiredField-IsRequired="true" ErrorText="Valor inválido" >
                                        <RequiredField IsRequired="false" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Fecha de Expiracion"  VerticalAlign="Middle" CaptionStyle-Font-Bold="true" >
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer >
                  <dx:ASPxDateEdit ID="txtFechaExpiracion" runat="server"  Theme="Office365" ReadOnly="true"  >
                                    <DropDownButton Image-IconID="">
                                        <Image IconID="conditionalformatting_adateoccurring_16x16">
                                        </Image>
                                    </DropDownButton>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" RequiredField-IsRequired="true" ErrorText="Valor inválido" >
                                        <RequiredField IsRequired="false" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem Caption="Fecha de Cancelacion"  VerticalAlign="Middle" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer >
                  <dx:ASPxDateEdit ID="txtFechaCancelacion" runat="server" Theme="Office365" ReadOnly="true" >
                                    <DropDownButton Image-IconID="">
                                        <Image IconID="conditionalformatting_adateoccurring_16x16">
                                        </Image>
                                    </DropDownButton>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" RequiredField-IsRequired="true" ErrorText="Valor inválido" >
                                        <RequiredField IsRequired="false" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Fecha de Baja"  VerticalAlign="Middle" CaptionStyle-Font-Bold="true">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer >
                    <dx:ASPxDateEdit ID="txtFechaBaja" runat="server" Theme="Office365" ReadOnly="true" >
                                    <DropDownButton Image-IconID="">
                                        <Image IconID="conditionalformatting_adateoccurring_16x16">
                                        </Image>
                                    </DropDownButton>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" RequiredField-IsRequired="true" ErrorText="Valor inválido" >
                                        <RequiredField IsRequired="false" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Fecha de Bloqueo"  VerticalAlign="Middle" CaptionStyle-Font-Bold="true" >
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer >
                    <dx:ASPxDateEdit ID="txtFechaBloqueo" runat="server" Theme="Office365" ReadOnly="true" >
                                    <DropDownButton Image-IconID="">
                                        <Image IconID="conditionalformatting_adateoccurring_16x16">
                                        </Image>
                                    </DropDownButton>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" RequiredField-IsRequired="true" ErrorText="Valor inválido" >
                                        <RequiredField IsRequired="false" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Fecha de inactivación:"  VerticalAlign="Middle" CaptionStyle-Font-Bold="true" >
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer >
                    <dx:ASPxDateEdit ID="txtFechaInactivacion" runat="server" Theme="Office365" ReadOnly="true" >
                                    <DropDownButton Image-IconID="">
                                        <Image IconID="conditionalformatting_adateoccurring_16x16">
                                        </Image>
                                    </DropDownButton>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" RequiredField-IsRequired="true" ErrorText="Valor inválido" >
                                        <RequiredField IsRequired="false" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                </Items>
            </dx:LayoutGroup>
        </Items>
        </dx:ASPxFormLayout>
			</section>
			<section id="content4" class="tab-content">


                 



				<table style="width:90%; height:500px;margin-left: 15%;" class="animacion">
                  <tr>
                      <td>
                          <h4 style="font-weight: bold;">LIMITES ASIGNADOS</h4>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <table style="width:100%; height:200px; border:1px solid white; border-radius:15px">
                              <tr>
                                  <td></td>
                                  <td><h5 style="font-weight: bold;">VOLUMEN</h5></td>
                                  <td><h5 style="font-weight: bold;">IMPORTE</h5></td>
                              </tr>
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblLAAcumulado" Text="ACUMULADO" runat="server" Theme="Office365" /></td>
                            <td>
                                <dx:ASPxTextBox ID="txtLAVAcumulado" runat="server" Theme="Office365"></dx:ASPxTextBox>
                            </td>
                               <td>
                                <dx:ASPxTextBox ID="txtLAIAcumulado" runat="server" Theme="Office365"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblLADiario" Text="DIARIO" runat="server" Theme="Office365" /></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtLAVDiario" runat="server" Theme="Office365"></dx:ASPxTextBox>
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtLAIDiario" runat="server" Theme="Office365"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblLASemanal" Text="SEMANAL" runat="server" Theme="Office365" /></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtLAVSemanal" runat="server" Theme="Office365" ></dx:ASPxTextBox>                               
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtLAISemanal" runat="server" Theme="Office365"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblLAMensual" Text="MENSUAL" runat="server" Theme="Office365"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtLAVMensual" runat="server" Theme="Office365"></dx:ASPxTextBox>
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtLAIMensual" runat="server" Theme="Office365"></dx:ASPxTextBox>
                            </td>
                        </tr>
                    
                    </table>
                          </td>
                  </tr>
                   <tr>
                      <td>
                          <h4 style="font-weight: bold;">LIMITES DISPONIBLES</h4>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <table style="width:100%; height:200px; border:1px solid white; border-radius:15px" class="animacion">
                              <tr>
                                  <td></td>
                                  <td><h5 style="font-weight: bold;">VOLUMEN</h5></td>
                                  <td><h5 style="font-weight: bold;">IMPORTE</h5></td>
                              </tr>
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblLDAcumulado" Text="ACUMULADO" runat="server" Theme="Office365" /></td>
                            <td>
                                <dx:ASPxTextBox ID="txtLDVAcumulado" runat="server" Theme="Office365" Enabled="false" ></dx:ASPxTextBox>
                            </td>
                               <td>
                                <dx:ASPxTextBox ID="txtLDIAcumulado" runat="server" Theme="Office365" Enabled="false" />
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblLDDiario" Text="DIARIO" runat="server" Theme="Office365"/></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtLDVDiario" runat="server" Theme="Office365" Enabled="false" ></dx:ASPxTextBox>
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtLDIDiario" runat="server" Theme="Office365" Enabled="false" ></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblLDSemanal" Text="SEMANAL" runat="server" Theme="Office365" /></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtLDVSemanal" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtLDISemanal" runat="server" Theme="Office365" Enabled="false" ></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblLDMensual" Text="MENSUAL" runat="server" Theme="Office365"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtLDVMensual" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtLDIMensual" runat="server" Theme="Office365" Enabled="false" ></dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                      </td>
                  </tr>
              </table> 
			</section>

			<section id="content5" class="tab-content">
				<table style="width:90%; height:500px;margin-left: 15%;" class="animacion">
                  <tr>
                      <td>
                          <h4 style="font-weight: bold;">VOLUMEN</h4>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <table style="width:90%; height:200px;">
                              <tr>
                                  <td></td>
                                  <td><h5 style="font-weight: bold;">ANTERIOR</h5></td>
                                  <td><h5 style="font-weight: bold;">ACTUAL</h5></td>
                              </tr>
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblVADiario" Text="DIARIO" runat="server" Theme="Office365" /></td>
                            <td>
                                <dx:ASPxTextBox ID="txtVANDiario" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </td>
                               <td>
                                <dx:ASPxTextBox ID="txtVACDiario" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblVASemanal" Text="SEMANAL" runat="server" Theme="Office365"/></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtVANSemanal" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtVACSemanal" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblVAMensual" Text="MENSUAL" runat="server" Theme="Office365" /></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtVANMensual" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>                               
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtVACMensual" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblVAAcumulado" Text="ACUMULADO" runat="server" Theme="Office365"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtVANAcumulado" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </td>
                             <td></td>
                                
                        </tr>
                    
                    </table>
                      </td>
                  </tr>
                   <tr>
                      <td>
                          <h4 style="font-weight: bold;">IMPORTE</h4>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <table style="width:90%; height:200px;" class="animacion">
                              <tr>
                                  <td></td>
                                  <td><h5 style="font-weight: bold;">ANTERIOR</h5></td>
                                  <td><h5 style="font-weight: bold;">ACTUAL</h5></td>
                              </tr>
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblIANDiario" Text="DIARIO" runat="server" Theme="Office365" /></td>
                            <td>
                                <dx:ASPxTextBox ID="txtIANDiario" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </td>
                               <td>
                                <dx:ASPxTextBox ID="txtIACDiario" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblIANSemanal" Text="SEMANAL" runat="server" Theme="Office365"/></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtIANSemanal" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtIACSemanal" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblIANMensual" Text="MENSUAL" runat="server" Theme="Office365" /></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtIANMensual" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>                               
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtIACMensual" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblIANAcumulado" Text="ACUMULADO" runat="server" Theme="Office365"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtIANAcumulado" runat="server" Theme="Office365" Enabled="false"></dx:ASPxTextBox>
                            </td>
                                <td></td>
                        </tr>
                    
                    </table>
                      </td>
                  </tr>
              </table>
                </section>
            <section id="content6" class="tab-content">
				<table id="tableHorarios" style="width:100%; height:300px;  border-radius:15px;" runat="server" class="table-condensed animacion">
  <caption>Horarios</caption>
  <tr>
      <td><h4 style="color: white;font-weight: bold;">Días / Horas</h4></td>
  </tr>
        <tr id="lunes"> <th scope="row" id="fila1"  onclick ='checks(this);' style=' cursor: pointer;'>Lunes</th>
        </tr>
        <tr id="martes"> 
            <th scope="row" id="fila2" onclick ='checks(this);' style=' cursor: pointer; '  >Martes</th>
        </tr>
        <tr id="miercoles"> 
            <th scope="row" id="fila3" onclick ='checks(this);' style=' cursor: pointer;'>Miércoles</th>
        </tr>
        <tr id="jueves">
             <th scope="row" id="fila4" onclick ='checks(this);' style=' cursor: pointer;'>Jueves</th></tr>
        <tr id="viernes"> 
            <th scope="row" id="fila5" onclick ='checks(this);' style=' cursor: pointer;'>Viernes</th></tr>
        <tr id="sabado">
             <th scope="row" id="fila6" onclick ='checks(this);' style=' cursor: pointer;'>Sábado</th></tr>
        <tr id="domingo"> <th scope="row" id="fila7" onclick ='checks(this);' style=' cursor: pointer;'>Domingo</th>
        </tr>
</table>
                <%-- 
                                      <a id="1" style=' cursor: pointer; color:white; background-color: #428bca;' class="btn-block" onclick="checks(this);" >
     Activar todo</a>
        <a id="0" style=' cursor: pointer; color:white; background-color: #428bca;' class="btn-block" onclick="checks(this);" >
     Desactivar todo</a>
                    --%>
               <div class="btn-group" style="margin-left: 76%;">
                   <dx:ASPxButton runat="server" ID="btn1" ClientSideEvents-Click="checksasp" Text="Activar Todo" Theme="Glass" ClientInstanceName="1" AutoPostBack="false" CssClass="shadowBox">
                    <ClientSideEvents Click="checksasp" />
                </dx:ASPxButton>
                <dx:ASPxButton runat="server" ID="btn2" ClientSideEvents-Click="checksasp" Text="Desactivar Todo" Theme="Glass" ClientInstanceName="0" AutoPostBack="false" CssClass="shadowBox">
                    <ClientSideEvents Click="checksasp" />
                </dx:ASPxButton>
                </div>
                
			</section>
            <section id="content7" >  
                <div style="text-align:center;">
                    <dx:ASPxLabel runat="server" Text="Foto Actual" AllowEllipsisInText="true" Theme="Office365"  Width="100%" Font-Size="X-Large"  />
                    </div>
                <div style="margin-left: 60px;" class="row">
                <dx:ASPxBinaryImage ID="BinaryImage" ClientInstanceName="ClientBinaryImage" Width="100%" Height="400" ShowLoadingImage="true" LoadingImageUrl="~/Content/Loading.gif" runat="server"  OnValueChanged="BinaryImage_ValueChanged" CssClass="fade-in animacion shadowBox">
            <EditingSettings Enabled="true">
                <UploadSettings>
                    <UploadValidationSettings MaxFileSize="4194304"></UploadValidationSettings>
                </UploadSettings>
            </EditingSettings>
        </dx:ASPxBinaryImage>
                    </div>
                <br/>
                <div style="text-align:center;">
                    <dx:ASPxLabel runat="server" Text="Asignar otra foto" AllowEllipsisInText="true" Theme="Office365"  Width="100%" Font-Size="X-Large"  />
                    </div>
                <div class="row">
                                <dx:ASPxImageGallery ID="imageGallery" runat="server" ClientInstanceName="imageGallery" CssClass="galleryStyle fade-in animacion" PagerSettings-EnableAdaptivity="true" ThumbnailUrlField="MediumImageUrl" EnableViewState="False" AlwaysShowPager="false" PagerSettings-Visible="false" AutoPostback="False" Theme="Office365">
                                    <SettingsFullscreenViewer Visible="false"  />
                                    <SettingsTableLayout ColumnCount="5" />
                                    <ClientSideEvents FullscreenViewerShowing="clickFoto"/>
                                </dx:ASPxImageGallery>
                    </div>
            </section>
		</div>
    <%-- TABS CSS --%>

     <div class="btn-group" style="margin-left:75%; margin-top:2px;">
         <dx:ASPxButton runat="server" ID="ASPxButton2"  Text="CANCELAR" Theme="Office365"  AutoPostBack="false"  CssClass="shadowBox animacion" ImagePosition="Right">
             <ClientSideEvents Click="cancelarHorario" />
                <Image Url="~/Icons/png/16px/large/button-cancel.png">
             </Image>
                </dx:ASPxButton>
         <dx:ASPxButton runat="server" ID="btnProcesar"  Text="GUARDAR" Theme="Office365" ClientInstanceName="2" AutoPostBack="false" CssClass="shadowBox animacion" ImagePosition="Right">
                    <ClientSideEvents Click="leerTabla" />
                    <Image Url="~/Icons/png/16px/large/button-ok.png">
                    </Image>
                </dx:ASPxButton>
     </div> 
       
    <div id="nav" class="container" style="margin-left:0px; margin-right:0px; display:none"><h1>EDITAR VEHICULO</h1></div>
<div id="exTab1" class="container" style="margin-left:0px; margin-right:0px; display:none">	
<ul id="myTabs" class="nav nav-pills" style="padding:0px; display:none;">
			<li id="1ali">
          <a  href="#1a" data-toggle="tab">DATOS</a>
			</li>
			<li id="2ali"><a href="#2a" data-toggle="tab">SEGURIDAD</a>
			</li>
			<li id="3ali"><a href="#3a" data-toggle="tab">FECHAS</a>
			</li>
  		<li id="4ali"><a href="#4a" data-toggle="tab">LIMITES DE CONSUMO</a>
			</li>
    <li id="5ali"><a href="#5a" data-toggle="tab">HISTORIAL DE CONSUMOS</a>
			</li>
    <li id="6ali"><a href="#6a" data-toggle="tab">CONTROL DE HORARIOS</a>
			</li>

		</ul>


			<div class="tab-content clearfix">
                
			  <div class="tab-pane" id="1a">
                  <%-- 
                    <table style="width:100%; height:500px">
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblVehiculoID" Text="VEHICULO ID" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtVehiculoID1" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblIdentificacion" Text="IDENTIFICACIÓN" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtIdentificacion1" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true"   Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblDepartamento" Text="DEPARTAMENTO" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtDepartamento1" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true"   Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblNombreUsuario" Text="NOMBRE/USUARIO" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtNombreUsuario1" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true"   Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblCentrodeCosto" Text="CENTRO DE COSTO" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtCentrodeCosto1" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true"  Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblPlacas" Text="PLACAS" runat="server" Font-Bold="true" Visible="false"/></td>
                            <td> 
                                <dx:ASPxCheckBox ID="chkPlacas1" runat="server" Theme="Youthful" Enabled="false" Visible="false"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                    </table>
                    --%>
				</div>
				<div class="tab-pane" id="2a">
                 <%--       
         <table style="width:100%; height:500px">
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblNIP" Text="NIP" runat="server" Font-Bold="true"/></td>
                            <td>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblEstatusActual" Text="ESTATUS ACTUAL" runat="server" Font-Bold="true"/></td>
                            <td>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblProductoAutorizado" Text="PRODUCTO(S) AUTORIZADOS" runat="server" Font-Bold="true"/></td>
                            <td>
                                                           <asp:CheckBoxList ID="chProductos" runat="server" RepeatColumns="4" CssClass="checkbox"  > </asp:CheckBoxList>

                               
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblCargasMaximas" Text="CARGAS MAXIMAS EN EL DIA" runat="server" Font-Bold="true"/></td>
                            <td>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblLimitarEstacion" Text="LIMITAR A ESTACIÓN" runat="server" Font-Bold="true"/></td>
                            <td>
                                
                            </td>
                        </tr>
                    </table>
                    --%> 
				</div>
        <div class="tab-pane" id="3a">
            <%-- 
         <table style="width:100%; height:500px">
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblFechaAlta" Text="FECHA DE ALTA" runat="server" Font-Bold="true" /></td>
                            <td>
                                
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblFechaExpiracion" Text="FECHA DE EXPIRACIÓN" runat="server" Font-Bold="true"/></td>
                            <td>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblFechaCancelacion" Text="FECHA DE CANCELACIÓN" runat="server" Font-Bold="true" /></td>
                            <td>
                                   
                               
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblFechaBaja" Text="FECHA DE BAJA" runat="server" Font-Bold="true"/></td>
                            <td>
                                
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblFechaBloqueo" Text="FECHA DE BLOQUEO" runat="server" Font-Bold="true"/></td>
                            <td>
                                   
                            </td>
                        </tr>
             <tr>
                            <td><dx:ASPxLabel ID="lblFechaInactivacion" Text="FECHA DE INACTIVACIÓN" runat="server" Font-Bold="true"/></td>
                            <td>
                                   
                            </td>
                        </tr>
                    </table>
                    --%>
          </div>
          <div class="tab-pane" id="4a">
              
                      
		  </div>
                  <div class="tab-pane" id="5a">
         
				</div>
                  <div class="tab-pane" id="6a">
                      <div id="horariosdiv" runat="server">
                          
</div>

			</div>
	</div>

       
  </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
</asp:Content>
