<%@ Page Title="Facturación" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Facturacion._Default" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .checkClass{
            margin-left:40%;
        }
        .btnAtrasCss{
            float:left;
        }
        .btnSiguienteCss{
            float:right;
        }
        .RFC{
            text-transform: uppercase;
        }
@media screen and (max-width: 480px) {
  .checkClass{
            margin-left:0%;
            float:left;
        }
 }
</style>
    <script>
        function primerTab(s,e) {
            $('.progress-bar')
                .css('width', '100' + '%')
                .attr('aria-valuenow', '100');
        }
        function validarTicket(s, e){
            if (s.inputElement.value.length == 0) {
                e.errorText = "El código debe tener 18 caracteres"
                e.isValid = false;
            } else {
                e.isValid = true;
            }
        }

        function atras(s, e) {
            var tabActual = parseInt(tabPage.GetActiveTab().index);
            if (tabActual != 0) {
                tabPage.SetActiveTabIndex(tabActual - 1);
            }     
        }
        function adelante(s, e) {
            var tabActual = parseInt(tabPage.GetActiveTab().index);
            if (tabActual != 2) {
                tabPage.SetActiveTabIndex(tabActual + 1);
            }
        }
        function cambiandoTab(s, e) {
            var tabActual = parseInt(tabPage.GetActiveTab().index);
            if (tabActual == 0) {
                btnAtras.SetClientVisible(false);
                btnSiguiente.SetClientVisible(true);
            } else if (tabActual == 1) {
                btnAtras.SetClientVisible(true);
                btnSiguiente.SetClientVisible(true);
            } else {
                btnAtras.SetClientVisible(true);
                btnSiguiente.SetClientVisible(false);
            }
            barraEstado();
        }
        function barraEstado() {
            var porciento = 0;
            var color = "#30a5ff";
            if (bgvtickets.GetVisibleRowsOnPage() == 0) {
                porciento = 33;
            } 
            if (validarSegundoTab()) {
                porciento = porciento + 33;
            }

            $('.progress-bar')
                .css('width', porciento + '%')
                .attr('aria-valuenow', porciento);
            $('.progress-bar')
                .css('background-color', color)
                .attr('background-color', color);

            if (tabPage.GetActiveTab().index == 2 && porciento == 66){
                $('.progress-bar')
                    .css('width', 100 + '%')
                    .attr('aria-valuenow', 100);
                $('.progress-bar')
                    .css('background-color', "#009688")
            }

        }
        function validarSegundoTab() {
            if (txtRFC.isValid && txtRazonSocial.isValid && cmbCFDI.isValid && txtCorreo.isValid && txtRFC.GetValue() != null && txtRazonSocial.GetValue() != null && cmbCFDI.GetValue() != null && txtCorreo.GetValue() != null) {
                return true;
            } else return false;
        }
        function llenarCFDI(s, e) {
           
            if (txtRFC.GetValue() != null) {
                if (txtRFC.GetValue().length == 13 || txtRFC.GetValue().length == 12) {
                    var valor = cmbCFDI.GetValue();
                    cmbCFDI.ClearItems();
                    cmbCFDI.AddItem("Adquisición de mercancias", "G01");
                    cmbCFDI.AddItem("Devoluciones, descuentos o bonificaciones", "G02");
                    cmbCFDI.AddItem("Gastos en general", "G03");
                    cmbCFDI.AddItem("Construcciones", "I01");
                    cmbCFDI.AddItem("Mobiliario y equipo de oficina para inversiones", "I02");
                    cmbCFDI.AddItem("Equipo de transporte", "I03");
                    cmbCFDI.AddItem("Equipo de computo y accesorios", "I04");
                    cmbCFDI.AddItem("Dados, troqueles, moldes, matrices y herramientas", "I05");
                    cmbCFDI.AddItem("Comunicaciones telefónicas", "I06");
                    cmbCFDI.AddItem("Comunicaciones satelitales", "I07");
                    cmbCFDI.AddItem("Otra maquinaria y equipo", "I08");
                    if (txtRFC.GetValue().length == 13) {
                        cmbCFDI.AddItem("Honorarios médicos, dentales y gastos hospitalarios", "D01");
                        cmbCFDI.AddItem("Gastos médicos por incapacidad o discapacidad", "D02");
                        cmbCFDI.AddItem("Gastos funerales", "D03");
                        cmbCFDI.AddItem("Donativos", "D04");
                        cmbCFDI.AddItem("Intereses reales efectivamente pagados por créditos hipotecarios (casa habitación)", "D05");
                        cmbCFDI.AddItem("Aportaciones voluntarias al SAR", "D06");
                        cmbCFDI.AddItem("Primas por seguros de gastos médicos", "D07");
                        cmbCFDI.AddItem("Gastos de transportación escolar obligatoria", "D08");
                        cmbCFDI.AddItem("Depósitos en cuentas para el ahorro, primas que tengan como base planes de pensiones", "D09");
                        cmbCFDI.AddItem("Pagos por servicios educativos (colegiaturas)", "D10");
                    }
                    cmbCFDI.AddItem("Por definir", "P01");
                    if (valor != null) {
                        if (valor.includes("D") && txtRFC.GetValue().length == "12") cmbCFDI.SetValue("P01");
                        else cmbCFDI.SetValue(valor);
                    }
                }
            } 
        }
        function validarRFC(s, e) {
            if (e.value != null) {
                e.value = e.value.toUpperCase();
                if (e.value.length < 12 || e.value.length > 13) {
                    e.errorText = "Formato incorrecto, la longitud debe ser de 12 o 13 caracteres";
                    e.isValid = false;
                }
                else {
                    if (verificaRFC(e.value)) {
                        e.isValid = true;
                        txtRfcReceptor.SetValue(e.value.toString());
                    } else {
                        e.errorText = "Formato incorrecto, verifique el formato del RFC";
                        e.isValid = false;
                    }
                }
            } else {
                e.isValid = false;
                e.errorText = "Debe llenar el campo RFC";
            }
        }
        function validarRazonSocial(s, e) {
            if (e.value == null) {
                e.errorText = "Debe llenar el campo Razon Social";
                e.isValid = false;
            } else {
                e.isValid = true;
                txtRazonSocial3.SetValue(e.value.toString());
            }
        }
        function validarCFDI(s, e) {
            if (cmbCFDI.GetSelectedIndex() == -1) {
                e.errorText = "Seleccione un CFDI"
                e.isValid = false;
            } else e.isValid = true;
        }
        function validarEmail(s, e) {
            if (e.value == null) {
                e.errorText = "Ingrese una direccion de correo electrónica"
                e.isValid = false;
            } else {
                var caract = new RegExp(/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/);
                if (caract.test(e.value)) {
                    e.isValid = true;
                    txtCorreo3.SetValue(e.value.toString());
                } else {
                    e.errorText = "Formato de correo inválido";
                    e.isValid = false;
                }
            }
        }
        function verificaRFC(rfc) {
            const re = /^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$/;
            var validado = rfc.match(re);
            return validado;
        }
    </script>
    <div class="alert alert-warning" id="msjAlerta" runat="server" visible="false" >
        <strong><dx:ASPxLabel ID="lblTitleMensaje" runat="server" Font-Bold="true" /> </strong>
        <dx:ASPxLabel ID="labelAlerta" runat="server" />
        </div>
    <div class="progress row">
    <div  class="progress-bar" role="progressbar" 
           aria-valuenow="0"
            aria-valuemin="0"
            aria-valuemax="100">
        <span class="sr-only" id="workDone""></span>
    </div>
</div>



    <div class="panel-container">
    <dx:ASPxPageControl ID="carTabPage" Width="100%" runat="server"  EnableHierarchyRecreation="true" ActiveTabIndex="0"  Border-BorderStyle="None"  Theme="Material"  CssClass="fade-in animacion" EnableTabScrolling="true"  Border-BorderWidth="0" ClientInstanceName="tabPage" ClientSideEvents-ActiveTabChanged="cambiandoTab"  >
        <TabPages>
            <dx:TabPage Text="TICKETS" ActiveTabStyle-Font-Bold="true">
<ActiveTabStyle Font-Bold="True"></ActiveTabStyle>
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">


<%------------------ Primer Tab --------------------%>
                        <div class="fade-in animacion">
        <dx:ASPxFormLayout runat="server" ID="ASPxFormLayout1"  EncodeHtml="false" UseDefaultPaddings="false" Theme="Office365" SettingsItems-HorizontalAlign="Center" CssClass="parametroAlign" Border-BorderWidth="0"  >
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500"  />
            <Items>
            <dx:LayoutGroup Caption="PARAMETROS" SettingsItemHelpTexts-Position="Bottom" Border-BorderWidth="0px"  GroupBoxStyle-Border-BorderStyle="Solid" GroupBoxStyle-Caption-Font-Bold="true" GroupBoxStyle-Caption-Font-Size="Large" CssClass="TextForm" ColCount="4" ShowCaption="False" Width="100%" >
<Border BorderWidth="0px"></Border>

                <GroupBoxStyle Border-BorderStyle="Solid">
                    <Caption Font-Bold="True">
                    </Caption>
                </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem Caption="Capture el código del ticket"  CaptionStyle-Font-Bold="true" HelpTextSettings-HorizontalAlign="Center">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxTextBox ID="codigoTicket" runat="server"  Theme="Material" Width="200" >
                                      <ValidationSettings>
                                        </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>

<HelpTextSettings HorizontalAlign="Center"></HelpTextSettings>

<CaptionStyle Font-Bold="True"></CaptionStyle>
                    </dx:LayoutItem>
                    <dx:LayoutGroup Border-BorderStyle="None"  Caption=" " CssClass="buttonMargin" GroupBoxDecoration="None" HorizontalAlign="Right" SettingsItemCaptions-HorizontalAlign="Right" Width="100" RowSpan="2" VerticalAlign="Bottom">
<Border BorderStyle="None"></Border>
<SettingsItemCaptions HorizontalAlign="Right"></SettingsItemCaptions>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Border-BorderStyle="None"  Caption=" " CssClass="buttonMargin" GroupBoxDecoration="None" HorizontalAlign="Right" SettingsItemCaptions-HorizontalAlign="Right" Width="100" RowSpan="2" VerticalAlign="Bottom">
                        <Border BorderStyle="None" />
                        <Items>
                            <dx:LayoutItem  Border-BorderWidth="0px" CssClass="buttonMargin" HorizontalAlign="Right" RequiredMarkDisplayMode="Hidden" ShowCaption="False" Width="100">
                                <LayoutItemNestedControlCollection >
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" BorderStyle="None"  runat="server" ValidateRequestMode="Disabled" >
                                        <dx:ASPxButton ID="btnCancelar4" runat="server"  Text="Limpiar"  Theme="Material" Width="80" UseSubmitBehavior="False"  CausesValidation="false" CssClass="shadowBoxMin" ImagePosition="Right" >
                                            <Image Url="~/Icons/png/16px/large/button-cancel.png">
                                              </Image>
                                            </dx:ASPxButton>
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="   " />
                                        <dx:ASPxButton ID="btnProcesar4" UseSubmitBehavior="False" runat="server"  Text="Validar" Theme="Material" Width="80" CssClass="shadowBoxMin" ImagePosition="Right" OnClick="btnProcesar4_Click">
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

<Border BorderWidth="0px"></Border>
        </dx:ASPxFormLayout>

                         <div class="row" style="margin-top:10px;" >
      <dx:BootstrapGridView ID="bgvTickets" runat="server" ClientIDMode="Static" EnableViewState="false" AutoGenerateColumns="false" KeyFieldName="Codigo" CssClassesPager-Control="true" ClientInstanceName="bgvtickets" >
                <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
                <SettingsAdaptivity  AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
                <SettingsDataSecurity AllowEdit="True" AllowDelete="true" />
                <SettingsBehavior AllowFocusedRow="True" />
<CssClassesPager Control="true"></CssClassesPager>
                <Columns>
                    <dx:BootstrapGridViewTextColumn Caption="Codigo" ReadOnly="True" VisibleIndex="0"  HorizontalAlign="Center"  >
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn Caption="Plaza de Cobro" ReadOnly="True" VisibleIndex="1">
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn Caption="Fecha" ReadOnly="True" VisibleIndex="2">
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn Caption="Total" ReadOnly="True" VisibleIndex="3">
                    </dx:BootstrapGridViewTextColumn>
                </Columns>

           </dx:BootstrapGridView>
</div>
</div>
<%--------------------------------------%>

                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="DATOS DEL RECEPTOR" ActiveTabStyle-Font-Bold="true">
<ActiveTabStyle Font-Bold="True"></ActiveTabStyle>
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl2" runat="server">
<%------------------ Segundo Tab --------------------%>
                        <div class="container-fluid fade-in animacion">
                        <dx:ASPxFormLayout runat="server" ID="ASPxFormLayout2"  EncodeHtml="false" UseDefaultPaddings="false" Theme="Office365" SettingsItems-HorizontalAlign="Center"  Border-BorderWidth="0" >
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500"  />

            <Items>
            <dx:LayoutGroup Caption="PARAMETROS" SettingsItemHelpTexts-Position="Bottom" Border-BorderWidth="0px"  GroupBoxStyle-Border-BorderStyle="Solid" GroupBoxStyle-Caption-Font-Bold="true" GroupBoxStyle-Caption-Font-Size="Large" CssClass="TextForm" ColCount="1" ShowCaption="False" Width="100%" >
<Border BorderWidth="0px"></Border>

                <GroupBoxStyle Border-BorderStyle="Solid">
                    <Caption Font-Bold="True">
                    </Caption>
                </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem Caption="Capture el R.F.C " CaptionStyle-Font-Bold="true" HorizontalAlign="Left" Width="800">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxTextBox ID="txtRFC" runat="server"  Theme="Material" Width="150" CaptionSettings-RequiredMarkDisplayMode="Required" ClientInstanceName="txtRFC" CssClass="RFC">
<CaptionSettings RequiredMarkDisplayMode="Hidden"></CaptionSettings>
                                    <ClientSideEvents KeyUp="llenarCFDI" Validation="validarRFC"/>
                                      <ValidationSettings>
                                        </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
<HelpTextSettings></HelpTextSettings>
<CaptionStyle Font-Bold="True"></CaptionStyle>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Nombre o Razon Social " CaptionStyle-Font-Bold="true" HelpTextSettings-HorizontalAlign="left" Width="800">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxTextBox ID="txtRazonSocial" runat="server"  Theme="Material" Width="300" CaptionSettings-RequiredMarkDisplayMode="Required" ClientInstanceName="txtRazonSocial">

<CaptionSettings RequiredMarkDisplayMode="Hidden"></CaptionSettings>
                                    <ClientSideEvents Validation="validarRazonSocial"/>
                                      <ValidationSettings>
                                        </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
<HelpTextSettings HorizontalAlign="Center"></HelpTextSettings>
<CaptionStyle Font-Bold="True"></CaptionStyle>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Uso del CFDI" CaptionStyle-Font-Bold="true" HelpTextSettings-HorizontalAlign="Center" Width="800">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxComboBox ID="cmbCFDI" runat="server"  Theme="Material"  CaptionSettings-RequiredMarkDisplayMode="Required" ClientInstanceName="cmbCFDI">
<CaptionSettings RequiredMarkDisplayMode="Hidden"></CaptionSettings>
                                    <ClientSideEvents Validation="validarCFDI"/>
                                      <ValidationSettings>
                                        </ValidationSettings>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
<HelpTextSettings HorizontalAlign="Center"></HelpTextSettings>
<CaptionStyle Font-Bold="True"></CaptionStyle>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Correo Electrónico" CaptionStyle-Font-Bold="true" HelpTextSettings-HorizontalAlign="Left" Width="800" >
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxTextBox ID="txtCorreoElectronico" runat="server"  Theme="Material" CaptionSettings-RequiredMarkDisplayMode="Hidden" Width="300" ClientInstanceName="txtCorreo">

<CaptionSettings RequiredMarkDisplayMode="Hidden"></CaptionSettings>
                                    <ClientSideEvents Validation="validarEmail"/>
                                      <ValidationSettings>
                                        </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>

                <SettingsItemHelpTexts Position="Bottom" />
            </dx:LayoutGroup>
        </Items>
            <SettingsItems HorizontalAlign="Center" />

<Border BorderWidth="0px"></Border>
        </dx:ASPxFormLayout>

  </div>
 <%--------------------------------------%>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="CONFIRMACIÓN" ActiveTabStyle-Font-Bold="true" >
<ActiveTabStyle Font-Bold="True"></ActiveTabStyle>
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl3" runat="server">
<%------------------ Tercer Tab --------------------%>
                         <div class="container-fluid fade-in animacion">
                        <dx:ASPxFormLayout runat="server" ID="ASPxFormLayout3"  EncodeHtml="false" UseDefaultPaddings="false" Theme="Office365" SettingsItems-HorizontalAlign="Center"  Border-BorderWidth="0" >
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500"  />
        <SettingsItemCaptions HorizontalAlign="Left" />
        <SettingsItems HorizontalAlign="Left" />
            <Items>
            <dx:LayoutGroup Caption="PARAMETROS" SettingsItemHelpTexts-Position="Bottom" Border-BorderWidth="0px"  GroupBoxStyle-Border-BorderStyle="Solid" GroupBoxStyle-Caption-Font-Bold="true" GroupBoxStyle-Caption-Font-Size="Large" CssClass="TextForm" ColCount="1" ShowCaption="False" Width="100%" >
<Border BorderWidth="0px"></Border>

                <GroupBoxStyle Border-BorderStyle="Solid">
                    <Caption Font-Bold="True">
                    </Caption>
                </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem Caption="Correo Electrónico" CaptionStyle-Font-Bold="true" HorizontalAlign="Left" Width="600">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server"  Theme="Material" CaptionSettings-RequiredMarkDisplayMode="Hidden" ReadOnly="true" ClientInstanceName="txtCorreo3" BackColor="#009688" ForeColor="White" Font-Bold="true">

<CaptionSettings RequiredMarkDisplayMode="Hidden"></CaptionSettings>
                                    <ClientSideEvents/>
                                      <ValidationSettings>
                                        </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
<HelpTextSettings></HelpTextSettings>
<CaptionStyle Font-Bold="True"></CaptionStyle>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="R.F.C Receptor " CaptionStyle-Font-Bold="true" HelpTextSettings-HorizontalAlign="left" Width="600">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxTextBox ID="txtRfcReceptor" runat="server"  Theme="Material" Width="150" CaptionSettings-RequiredMarkDisplayMode="Hidden" ClientInstanceName="txtRfcReceptor" ReadOnly="true" BackColor="#009688" ForeColor="White" Font-Bold="true">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
<HelpTextSettings HorizontalAlign="Center"></HelpTextSettings>
<CaptionStyle Font-Bold="True"></CaptionStyle>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Nombre Receptor" CaptionStyle-Font-Bold="true" HelpTextSettings-HorizontalAlign="Center" Width="600">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxTextBox ID="ASPxComboBox1" runat="server"  Theme="Material"  CaptionSettings-RequiredMarkDisplayMode="Hidden" ClientInstanceName="txtRazonSocial3" ReadOnly="true" BackColor="#009688" ForeColor="White" Font-Bold="true">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
<HelpTextSettings HorizontalAlign="Center"></HelpTextSettings>
<CaptionStyle Font-Bold="True"></CaptionStyle>
                    </dx:LayoutItem>

                </Items>

                <SettingsItemHelpTexts Position="Bottom" />
            </dx:LayoutGroup>
        </Items>
            <SettingsItems HorizontalAlign="Center" />

<Border BorderWidth="0px"></Border>
        </dx:ASPxFormLayout>
  </div>
                        <hr />
                        <div class="row fade-in animacion">
      <dx:ASPxLabel Text="Deseo mis códigos en varios CFDI" runat="server" ID="labelaspx" Theme="Material" CssClass="checkClass btn-block" Font-Bold="true"  />
</div>
  <div class="row fade-in animacion">
      <dx:ASPxCheckBox Text="Quiero un CFDI por código capturado" runat="server" ID="chkPorCodigoCapturado" Theme="Material" CssClass="checkClass"  />
</div>
                        <hr />
                             <div class="row fade-in animacion" style="margin-top:10px;" >
      <dx:BootstrapGridView ID="BootstrapGridView1" runat="server" ClientIDMode="Static" EnableViewState="false" AutoGenerateColumns="false" KeyFieldName="Codigo" CssClassesPager-Control="true" >
                <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
                <SettingsDataSecurity AllowEdit="True" AllowDelete="true" />
                <SettingsBehavior AllowFocusedRow="True" />
          <SettingsAdaptivity  AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
<CssClassesPager Control="true"></CssClassesPager>

                <SettingsAdaptivity  AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
                <Columns>
                    <dx:BootstrapGridViewTextColumn Caption="Codigo" ReadOnly="True" VisibleIndex="0"  HorizontalAlign="Center"  >
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn Caption="Plaza de Cobro" ReadOnly="True" VisibleIndex="1">
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn Caption="Fecha" ReadOnly="True" VisibleIndex="2">
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn Caption="Total" ReadOnly="True" VisibleIndex="3">
                    </dx:BootstrapGridViewTextColumn>
                </Columns>

           </dx:BootstrapGridView>
</div>
                        <div class="row fade-in animacion" style="margin-left:40%;">
                            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="GENERAR FACTURA" Theme="Material" CssClass="btnAtrasCss shadowBox" AutoPostBack="false" ClientInstanceName="btnAtras">
             </dx:ASPxButton> 
                            </div>
<%--------------------------------------%>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>

<Border BorderStyle="None" BorderWidth="0px"></Border>
    </dx:ASPxPageControl>	
        <div class="row fade-in animacion">
            <dx:ASPxButton ID="btnAtras" runat="server" Text="Atras" Theme="Material" CssClass="btnAtrasCss shadowBox" AutoPostBack="false" ClientInstanceName="btnAtras" ImagePosition="Left">
                <ClientSideEvents Click="atras" />
                <Image Url="~/Icons/png/16px/large/arrow_left.png">
                                              </Image>
             </dx:ASPxButton> 
            <dx:ASPxButton ID="btnSiguiente" runat="server" Text="Siguiente" Theme="Material" CssClass="btnSiguienteCss shadowBox" AutoPostBack="false" ClientInstanceName="btnSiguiente" ImagePosition="Right">
                <ClientSideEvents Click="adelante" />
                <Image Url="~/Icons/png/16px/large/arrow_right.png">
                                              </Image>
             </dx:ASPxButton>
        </div>
        </div>
    <script>
        btnAtras.SetClientVisible(false);
    </script>
    </asp:Content>