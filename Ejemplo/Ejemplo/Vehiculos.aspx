<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Vehiculos.aspx.cs" enableEventValidation ="false" Inherits="Ejemplo.WebForm3" %>

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
    </style>

    <div class="container" style="margin-left:0px; margin-right:0px"><h1>EDITAR VEHICULO</h1></div>
<div id="exTab1" class="container" style="margin-left:0px; margin-right:0px">	
<ul  class="nav nav-pills" style="padding:0px">
			<li class="active">
        <a  href="#1a" data-toggle="tab">DATOS</a>
			</li>
			<li><a href="#2a" data-toggle="tab">SEGURIDAD</a>
			</li>
			<li><a href="#3a" data-toggle="tab">FECHAS</a>
			</li>
  		<li><a href="#4a" data-toggle="tab">LIMITES DE CONSUMO</a>
			</li>
    <li><a href="#5a" data-toggle="tab">HISTORIAL DE CONSUMOS</a>
			</li>
    <li><a href="#6a" data-toggle="tab">CONTROL DE HORARIOS</a>
			</li>
		</ul>

			<div class="tab-content clearfix">
			  <div class="tab-pane active" id="1a">
                    <table style="width:100%; height:500px">
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblVehiculoID" Text="VEHICULO ID" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtVehiculoID" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblIdentificacion" Text="IDENTIFICACIÓN" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtIdentificacion" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true"   Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblDepartamento" Text="DEPARTAMENTO" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtDepartamento" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true"   Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblNombreUsuario" Text="NOMBRE/USUARIO" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtNombreUsuario" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true"   Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblCentrodeCosto" Text="CENTRO DE COSTO" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtCentrodeCosto" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true"  Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblPlacas" Text="PLACAS" runat="server" Font-Bold="true"/></td>
                            <td> 
                                <dx:ASPxCheckBox ID="chkPlacas" runat="server" Theme="Youthful" Enabled="false"></dx:ASPxCheckBox>
                                <%--<dx:ASPxTextBox ID="txtPlacas" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true"   Enabled="false"></dx:ASPxTextBox>--%>
                            </td>
                        </tr>
                    </table>
				</div>
				<div class="tab-pane" id="2a">
         <table style="width:100%; height:500px">
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblNIP" Text="NIP" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtNIP" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" ></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblEstatusActual" Text="ESTATUS ACTUAL" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxComboBox ID="cmbEstatusActual" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true"></dx:ASPxComboBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblProductoAutorizado" Text="PRODUCTO(S) AUTORIZADOS" runat="server" Font-Bold="true"/></td>
                            <td>
                                <asp:CheckBoxList ID="chProductos" runat="server"> </asp:CheckBoxList>
                               
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblCargasMaximas" Text="CARGAS MAXIMAS EN EL DIA" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtCargasMaximas" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblLimitarEstacion" Text="LIMITAR A ESTACIÓN" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxComboBox ID="cmbLimitarEstacion" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true" ></dx:ASPxComboBox>
                            </td>
                        </tr>
                    </table>
				</div>
        <div class="tab-pane" id="3a">
         <table style="width:100%; height:500px">
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblFechaAlta" Text="FECHA DE ALTA" runat="server" Font-Bold="true" /></td>
                            <td>
                                <dx:ASPxTextBox ID="txtFechaAlta" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false" ></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblFechaExpiracion" Text="FECHA DE EXPIRACIÓN" runat="server" Font-Bold="true"/></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtFechaExpiracion" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false" ></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblFechaCancelacion" Text="FECHA DE CANCELACIÓN" runat="server" Font-Bold="true" /></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtFechaCancelacion" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                               
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblFechaBaja" Text="FECHA DE BAJA" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtFechaBaja" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblFechaBloqueo" Text="FECHA DE BLOQUEO" runat="server" Font-Bold="true"/></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtFechaBloqueo" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
             <tr>
                            <td><dx:ASPxLabel ID="lblFechaInactivacion" Text="FECHA DE INACTIVACIÓN" runat="server" Font-Bold="true"/></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtFechaInactivacion" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
          </div>
          <div class="tab-pane " id="4a">
              <table style="width:100%">
                  <tr>
                      <td>
                          <h2 style="color: white;font-weight: bold;">LIMITES ASIGNADOS</h2>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <table style="width:100%; height:300px; border:1px solid white; border-radius:15px">
                              <tr>
                                  <td></td>
                                  <td><h4 style="color: white;font-weight: bold;">VOLUMEN</h4></td>
                                  <td><h4 style="color: white;font-weight: bold;">IMPORTE</h4></td>
                              </tr>
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblLAAcumulado" Text="ACUMULADO" runat="server" Font-Bold="true" /></td>
                            <td>
                                <dx:ASPxTextBox ID="txtLAVAcumulado" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true"></dx:ASPxTextBox>
                            </td>
                               <td>
                                <dx:ASPxTextBox ID="txtLAIAcumulado" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblLADiario" Text="DIARIO" runat="server" Font-Bold="true"/></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtLAVDiario" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true"></dx:ASPxTextBox>
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtLAIDiario" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblLASemanal" Text="SEMANAL" runat="server" Font-Bold="true" /></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtLAVSemanal" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true"></dx:ASPxTextBox>                               
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtLAISemanal" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblLAMensual" Text="MENSUAL" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtLAVMensual" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true"></dx:ASPxTextBox>
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtLAIMensual" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true"></dx:ASPxTextBox>
                            </td>
                        </tr>
                    
                    </table>
                      </td>
                  </tr>
                   <tr>
                      <td>
                          <h2 style="color: white;font-weight: bold;">LIMITES DISPONIBLES</h2>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <table style="width:100%; height:300px; border:1px solid white; border-radius:15px">
                              <tr>
                                  <td></td>
                                  <td><h4 style="color: white;font-weight: bold;">VOLUMEN</h4></td>
                                  <td><h4 style="color: white;font-weight: bold;">IMPORTE</h4></td>
                              </tr>
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblLDAcumulado" Text="ACUMULADO" runat="server" Font-Bold="true" /></td>
                            <td>
                                <dx:ASPxTextBox ID="txtLDVAcumulado" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false" ></dx:ASPxTextBox>
                            </td>
                               <td>
                                <dx:ASPxTextBox ID="txtLDIAcumulado" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false" ></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblLDDiario" Text="DIARIO" runat="server" Font-Bold="true"/></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtLDVDiario" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false" ></dx:ASPxTextBox>
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtLDIDiario" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false" ></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblLDSemanal" Text="SEMANAL" runat="server" Font-Bold="true" /></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtLDVSemanal" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtLDISemanal" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false" ></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblLDMensual" Text="MENSUAL" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtLDVMensual" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtLDIMensual" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false" ></dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                      </td>
                  </tr>
              </table> 
		  </div>
                  <div class="tab-pane" id="5a">
         <table style="width:100%">
                  <tr>
                      <td>
                          <h2 style="color: white;font-weight: bold;">VOLUMEN</h2>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <table style="width:100%; height:300px; border:1px solid white; border-radius:15px">
                              <tr>
                                  <td></td>
                                  <td><h4 style="color: white;font-weight: bold;">ANTERIOR</h4></td>
                                  <td><h4 style="color: white;font-weight: bold;">ACTUAL</h4></td>
                              </tr>
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblVADiario" Text="DIARIO" runat="server" Font-Bold="true" /></td>
                            <td>
                                <dx:ASPxTextBox ID="txtVANDiario" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                               <td>
                                <dx:ASPxTextBox ID="txtVACDiario" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblVASemanal" Text="SEMANAL" runat="server" Font-Bold="true"/></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtVANSemanal" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtVACSemanal" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblVAMensual" Text="MENSUAL" runat="server" Font-Bold="true" /></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtVANMensual" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>                               
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtVACMensual" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblVAAcumulado" Text="ACUMULADO" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtVANAcumulado" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                             <td></td>
                                
                        </tr>
                    
                    </table>
                      </td>
                  </tr>
                   <tr>
                      <td>
                          <h2 style="color: white;font-weight: bold;">IMPORTE</h2>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <table style="width:100%; height:300px; border:1px solid white; border-radius:15px">
                              <tr>
                                  <td></td>
                                  <td><h4 style="color: white;font-weight: bold;">ANTERIOR</h4></td>
                                  <td><h4 style="color: white;font-weight: bold;">ACTUAL</h4></td>
                              </tr>
                        <tr>
                            <td style="width:20%"><dx:ASPxLabel ID="lblIANDiario" Text="DIARIO" runat="server" Font-Bold="true" /></td>
                            <td>
                                <dx:ASPxTextBox ID="txtIANDiario" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                               <td>
                                <dx:ASPxTextBox ID="txtIACDiario" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblIANSemanal" Text="SEMANAL" runat="server" Font-Bold="true"/></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtIANSemanal" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtIACSemanal" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblIANMensual" Text="MENSUAL" runat="server" Font-Bold="true" /></td>
                            <td>
                                   <dx:ASPxTextBox ID="txtIANMensual" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>                               
                            </td>
                                <td>
                                <dx:ASPxTextBox ID="txtIACMensual" runat="server" Theme="Youthful"  Width="60%"  Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                        </tr>
                         <tr>
                            <td><dx:ASPxLabel ID="lblIANAcumulado" Text="ACUMULADO" runat="server" Font-Bold="true"/></td>
                            <td>
                                <dx:ASPxTextBox ID="txtIANAcumulado" runat="server" Theme="Youthful" Width="60%" Font-Size="15px" Font-Bold="true" Enabled="false"></dx:ASPxTextBox>
                            </td>
                                <td></td>
                        </tr>
                    
                    </table>
                      </td>
                  </tr>
              </table>
				</div>
                  <div class="tab-pane" id="6a">
                      <div id="horariosdiv" runat="server">
                          <table border="1" id="tableHorarios" style="width:100%; height:300px" runat="server" >
  <caption>Horarios</caption>
  <tr>
    <td>Días / Horas</td>
  </tr>
        <tr id="lunes"> <th scope="row" id="fila1"  onclick ='checks(this);' style=' cursor: pointer;'>Lunes</th>
        </tr>
        <tr id="martes"> 
            <th scope="row" id="fila2" onclick ='checks(this);' style=' cursor: pointer;'>Martes</th>
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
</div>
<button id="1" onclick="checks(this);" type="button">
     Activar todo</button>
        <button id="0" onclick="checks(this);" type="button">
     Desactivar todo</button>
        <button id="2" onclick="leerTabla();" type="button">
     Leer Tabla</button>
	</div>
			</div>
  </div>

    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script>
        function validar(control)
        {
            var x = document.getElementById(control);
            var controles = document.getElementsByClassName(x.id);
            for (var i = 0; i < controles.length; i++) {
                var item = document.getElementById(controles[i].id);
                item.checked=false;
                //console.log(controles[i].id); //second console output
            }
        }
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
        $(document).ready(function () {
            var encabezados = "";
            for (var i = 0; i < 24; i++) {
                $("#ContentPlaceHolder1_tableHorarios").find('td').eq(i).after("<td><a id='col" + numeroFormato(i) + "' onclick= 'checks(this);' style= ' cursor: pointer;' >" + numeroFormato(i) + "</a ></td > ");
            }
            agregarchecks("lunes", "fila1");
            agregarchecks("martes", "fila2");
            agregarchecks("miercoles", "fila3");
            agregarchecks("jueves", "fila4");
            agregarchecks("viernes", "fila5");
            agregarchecks("sabado", "fila6");
            agregarchecks("domingo", "fila7");


        })
        function numeroFormato(num) {
            var numero = num.toString();
            if (numero.length < 2) numero = "0" + numero;
            return numero;
        }
        function agregarchecks(dia, fila) {
           // for (var i = 0; i < 24; i++) {
             //   $('#ContentPlaceHolder1_' + dia + "").append("<td><input type='checkbox' id='" + fila + " col" + numeroFormato(i) + "' class='" + fila + " col" + numeroFormato(i) + " all' /></td>");
           // }

        }
        function checarcheck(valor) {
            if (valor == undefined || valor == false)
                return "0";
            else return "1";

        }
        function leerTabla() {
            var TableData = new Array();
            $('#ContentPlaceHolder1_tableHorarios tr').each(function (row, tr) {
                TableData[row] = {
                    "Dia": "" + $(tr).find('th:eq(0)').text() + ""
                    , "Valor": checarcheck($(tr).find(':checkbox:eq(0)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(1)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(2)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(3)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(4)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(5)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(6)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(7)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(8)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(9)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(10)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(11)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(12)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(13)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(14)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(15)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(16)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(17)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(18)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(19)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(20)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(21)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(22)').is(':checked'))
                    + checarcheck($(tr).find(':checkbox:eq(23)').is(':checked'))
                }
            });
            TableData.shift();
            var a = document.getElementById('<%=txtNIP.ClientID%>').value;
            var TableData1 = JSON.stringify(TableData);
            $.ajax({
                type: "POST",
                url: "Vehiculos.aspx/leer",
                data: JSON.stringify({ ID: TableData1 }),
                contentType: "application/json",
                dataType: "json",
                success: function () {
                    alert("logrado");
                },
                error: function (xhr, textStatus, error) {
                    console.log(xhr.statusText);
                    console.log(textStatus);
                    console.log(error);
                }
            });
        }
    </script>
</asp:Content>
