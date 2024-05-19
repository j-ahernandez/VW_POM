<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanProduccion.aspx.cs" Inherits="VW_POM.PlanProduccion" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.Bootstrap.v22.2, Version=22.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v22.2, Version=22.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v22.2, Version=22.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style9 {
            height: 68px;
        }

        .auto-style22 {
            width: 56%;
        }

        .auto-style23 {
            font-size:large;
            color:honeydew;
        }

        .ASPxCallbackPanel2{
            width:100%;
        }
        #ASPxCallbackPanel2_ASPxGridView3_DXHeaderTable{
            width:100px;
        }
    </style>
    <%--<link rel="stylesheet" type="text/css" href="Content/Site.css" />--%>
<link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />    
<link rel="stylesheet" type="text/css" href="~/css/sweetalert.css" />
<link rel="stylesheet" type="text/css" href="~/fontawesome/all.min.css" />
<script src="../Scripts/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../Scripts/sweetalert.min.js"></script> 
<script src="../Scripts/script.js"></script> 
<script src="../fontawesome/all.min.js"></script>
</head>
<body style="background-color:steelblue;">
   <form id="form1" runat="server"> <%--autocomplete="off" --%>
    <header style="background-color:darkslateblue">    
        <div style="align-content:center">
            <asp:Image ID="Image1" ImageAlign="Left" runat="server" Width="87px" ImageUrl="~/logo_heds_Puz_icon.ico" BackColor="White"/>
        <div style="color:aliceblue; align-content:center;">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="32pt" Text="Solicitud de Material - Corte :: Maquina:"></asp:Label>
            <br />
            <span style="color:cornflowerblue; font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size:medium " >V.092023.02</span>                             
            </div>
        </div>
        </header>     
       
    <div style="margin-right:50px; text-align: right;" float: right; height: 100%;">        
           <nav>
               <ul>                          
                <dx:ASPxButton ID="ASPxButton5" runat="server" HorizontalAlign="Right" OnClick="ASPxButton5_Click" Text="Close" Theme="BlackGlass">
                </dx:ASPxButton>                    
               </ul>
           </nav>   
    </div>                 
            <nav style="background-color:steelblue;">                
                <ul>
                    <dx:ASPxButton ID="ASPxButton4" runat="server" OnClick="ASPxButton4_Click" Text="Request Material" Theme="BlackGlass"></dx:ASPxButton>
                    <dx:ASPxButton ID="ASPxButton6" runat="server" OnClick="ASPxButton6_Click" Text="Refresh Plant" Theme="BlackGlass"></dx:ASPxButton>
                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Log Trokels" Theme="BlackGlass" OnClick="ASPxButton1_Click1"></dx:ASPxButton>
                    <dx:ASPxButton ID="ASPxButton7" runat="server" OnClick="ASPxButton7_Click" Text="Plan Produccion" Theme="BlackGlass">
                    </dx:ASPxButton>
                    <dx:ASPxGridViewExporter runat="server" ID="Exporter" GridViewID="ASPxGridView1"></dx:ASPxGridViewExporter>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    <asp:HiddenField ID="HiddenField2" runat="server" />
                    <asp:HiddenField ID="HiddenField3" runat="server" />
                </ul>                
            </nav>
      
<%--        <div style="margin: 1 auto; text-align: left; float: left">
            
        </div>--%>
       
        <div style="margin:20px; text-align: left;">
            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnEnviar">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <div style="border-color:black; border-style: solid; min-width:270px; max-width:270px; padding:10px;">
                            <h1 class="auto-style23" style="background-color:darkslategrey; align-content:center;"><strong>SOLICITUD DE MATERIAL</strong></h1>
                                <br />
                                <span class="auto-style23"><strong>Gafete: </strong></span>
                                <br />
                            <asp:TextBox ID="TextBox3" runat="server" placeholder="required..." required="required" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
                            <br />
                            <br />                            
                            <span class="auto-style23"><strong>Ticket: </strong></span>
                                <br />
                            <asp:TextBox ID="TextBox4" runat="server" OnTextChanged="TextBox4_TextChanged" placeholder="Tikect..." AutoPostBack="True"></asp:TextBox>
                             <br />
                                <asp:ImageButton 
            ID="btnEnviar" 
            runat="server" 
            ImageUrl="~/Img/btn/okay.png"  
            Width="16px" 
            CommandName="Select" 
            ToolTip="Seleccionar" 
            style="display:none;">
        </asp:ImageButton>
                                <br />
                            <br />        
                                <span>-------------------------------------</span>
                            <span class="auto-style23"><strong>Circuito:<dx:ASPxComboBox ID="ASPxComboBox1" runat="server" Height="28px" OnSelectedIndexChanged="ASPxComboBox1_SelectedIndexChanged" TextField="SetCode" Theme="BlackGlass" ValueField="SetCode" Width="167px">
                                </dx:ASPxComboBox>
                                </strong>
                                <asp:DropDownList ID="ddCircuito" runat="server" OnSelectedIndexChanged="ddCircuito_SelectedIndexChanged" Visible="False" Width="161px">
                                </asp:DropDownList>
                                </span>                            
                            &nbsp;<asp:SqlDataSource ID="SqlDataSourceCutCode" runat="server" ConnectionString="<%$ ConnectionStrings:HEDSConnectionString2 %>" SelectCommand="Select SetCode=' ' union all 
Select distinct CutCode
from Prod.PlanProduccion P 
	join Prod.UPH U on ltrim(rtrim(P.Machine))=ltrim(rtrim(U.Maquina)) 
where P.DOH&lt;=5 and P.Area='Plan de Corte'
and P.CutCode not in (
Select Product from Prod.Material_Requirement_Komax where ProductSend is null)"></asp:SqlDataSource>
                                 <%--<asp:Label ID="Label6" runat="server" Text="Scanned Tikect Number"></asp:Label>--%>
                                 </div>
                        </td>
                        <td class="auto-style9">
                            <%--<asp:Label ID="TmlControl0" runat="server" style="color: #FFFFFF; font-weight: 700; background-color: #FFCC66"></asp:Label>--%>
                            <%--<asp:Label ID="Label9" runat="server" Text="Material Controlado:"></asp:Label>--%>
                            <h2 style="color:antiquewhite"><strong>ENVIAR ORDEN A ALMACEN</strong></h2>
                            <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceRequest" EnableTheming="True" Theme="SoftOrange" Width="699px">
                                <SettingsPopup>
                                    <HeaderFilter MinHeight="140px">
                                    </HeaderFilter>
                                </SettingsPopup>
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Send" FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="btnSendData" runat="server" CommandArgument='<%# Eval("Tml1") %>' Height="26px" ImageUrl="~/Save.png" OnClick="btnSendData_Click" Width="21px" />
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Tem/Seal/Wire" FieldName="Tml1" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <%-- <DataItemTemplate>
                                                        <asp:ImageButton ID="btnSendData" runat="server" CommandArgument='<%# Eval("Tml1") %>' Height="26px" ImageUrl="~/Save.png" OnClick="btnSendData_Click" Width="21px" />
                                                    </DataItemTemplate>--%>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="SQ" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Color" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Quantity" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <DataItemTemplate>
                                            <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="80px">
                                            </dx:ASPxTextBox>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <span class="auto-style23"><strong>Material Controlado: </strong></span>
                            <br />
                            <asp:Label ID="TmlControl" runat="server" style="color: #FFFFFF; font-weight: 700; background-color: #FF0000"></asp:Label>
                            <asp:SqlDataSource ID="SqlDataSourceRequest" runat="server" ConnectionString="<%$ ConnectionStrings:HEDSConnectionString2 %>" SelectCommand="Select D.ID,D.Tml1,D.SQ,D.Color from (
Select P.ID,Tml1,SQ='',Color=''
from Prod.PlanProduccion P 
	join Prod.UPH U on ltrim(rtrim(P.Machine))=ltrim(rtrim(U.Maquina)) 
where  P.DOH&lt;=5 and P.Area='Plan de Corte' and CutCode=@CutCode
union all
Select P.ID,Tml2,SQ='',Color=''
from Prod.PlanProduccion P 
	join Prod.UPH U on ltrim(rtrim(P.Machine))=ltrim(rtrim(U.Maquina)) 
where  P.DOH&lt;=5 and P.Area='Plan de Corte' and CutCode=@CutCode
union all
Select P.ID,Seal1=ISNULL(Seal1,''),SQ='',Color=''
from Prod.PlanProduccion P 
	join Prod.UPH U on ltrim(rtrim(P.Machine))=ltrim(rtrim(U.Maquina)) 
where  P.DOH&lt;=5 and P.Area='Plan de Corte' and CutCode=@CutCode
union all
Select P.ID,Seal2=ISNULL(Seal2,''),SQ='',Color=''
from Prod.PlanProduccion P 
	join Prod.UPH U on ltrim(rtrim(P.Machine))=ltrim(rtrim(U.Maquina)) 
where  P.DOH&lt;=5 and P.Area='Plan de Corte' and CutCode=@CutCode
union all
Select P.ID,Wire=d.Wire_Name,SQ=CAST(d.SQ as varchar),p.Color
from Prod.PlanProduccion P 
	join Prod.UPH U on ltrim(rtrim(P.Machine))=ltrim(rtrim(U.Maquina)) 
	join [HEDS].[Prod].[Details2] d ON P.CutCode = d.CutCode
where  P.DOH&lt;=5 and P.Area='Plan de Corte' and p.CutCode=@CutCode ) D where D.Tml1&gt;''">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="HiddenField2" Name="CutCode" PropertyName="Value" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="auto-style9">&nbsp;
                            <div style="border-color:sandybrown; border-style: solid; min-width:350px; max-width:350px; padding:40px;">                                                                                 
                                <span class="auto-style23"><strong>Escanear Terminal Recibida:  </strong></span>
                                <asp:TextBox ID="TextBox7" runat="server" OnTextChanged="TextBox7_TextChanged" placeholder="Codigo de Barra..." Width="239px" AutoPostBack="True"></asp:TextBox>                                 
                            </div>

                             <div style="padding:5px; align-content:center;">
                            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel3" runat="server" ClientInstanceName="CallbackPanel" Width="100%">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxCallbackPanel>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:HEDSConnectionString2 %>" SelectCommand="Select Id,Machine,CutCode,Required=Product,Qty,RequestDate,
Case Estado When 0 Then 'SOLICITUD ENVIADA' When 1 Then 'EN PROCESO' When 2 Then 'EN ESTANTE PARA RECOGER' When 3 Then 'RECIBIDA' END as Estado,
RequestProcessDate as 'Proceso', SendDate as 'Ventanilla', CompleteDate as 'Completo'
from Prod.Material_Requirement_Komax
where CAST(RequestDate as date)=CAST(GETDATE() as date) and Machine=@Machine
order by RequestDate desc">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="HiddenField3" Name="Machine" PropertyName="Value" />
                                </SelectParameters>
                                 </asp:SqlDataSource>
                                 <dx:ASPxGridView ID="ASPxGridView7" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" Theme="SoftOrange" Width="597px" OnHtmlDataCellPrepared="ASPxGridView7_HtmlDataCellPrepared" OnHtmlRowPrepared="ASPxGridView7_HtmlRowPrepared">
                                     <SettingsPager NumericButtonCount="15" PageSize="5" Position="TopAndBottom">
                                     </SettingsPager>
                                     <SettingsPopup>
                                         <FilterControl AutoUpdatePosition="False">
                                         </FilterControl>
                                     </SettingsPopup>
                                     <SettingsSearchPanel Visible="True" />
                                     <Columns>
                                         <dx:GridViewDataTextColumn FieldName="Machine" VisibleIndex="0">
                                         </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn FieldName="CutCode" VisibleIndex="1">
                                         </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn FieldName="Required" VisibleIndex="2">
                                         </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn FieldName="Qty" VisibleIndex="3">
                                         </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataDateColumn FieldName="RequestDate" VisibleIndex="4">
                                             <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy hh:mm:ss"></PropertiesDateEdit>
                                         </dx:GridViewDataDateColumn>                                        
                                         <dx:GridViewDataDateColumn FieldName="Proceso" VisibleIndex="6">
                                             <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy hh:mm:ss"></PropertiesDateEdit>
                                         </dx:GridViewDataDateColumn>
                                         <dx:GridViewDataDateColumn FieldName="Ventanilla" VisibleIndex="7">
                                             <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy hh:mm:ss"></PropertiesDateEdit>
                                         </dx:GridViewDataDateColumn>
                                         <dx:GridViewDataDateColumn FieldName="Completo" VisibleIndex="8">
                                             <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy hh:mm:ss"></PropertiesDateEdit>
                                         </dx:GridViewDataDateColumn>
                                          <dx:GridViewDataTextColumn FieldName="Estado" ReadOnly="True" VisibleIndex="5">
                                         </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn Visible="false" FieldName="Id" VisibleIndex="6">
                                         </dx:GridViewDataTextColumn>
                                     </Columns>
                                 </dx:ASPxGridView>
                                </div>




                        </td>
                    </tr>
                    <tr>                    
                        <td colspan="3">
                            <div style="padding:40px; align-content:center;">
                            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel2" runat="server" ClientInstanceName="CallbackPanel" Width="100%">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceMaterial_Required" KeyFieldName="RequestUser" Width="100%" Theme="SoftOrange" Visible="False">
                                            <SettingsPager PageSize="50" Position="TopAndBottom" Mode="EndlessPaging" NumericButtonCount="20">
                                                <PageSizeItemSettings Items="50, 100, 150" />
                                            </SettingsPager>
                                            <SettingsPopup>
                                                <FilterControl AutoUpdatePosition="False">
                                                </FilterControl>
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="True" />
                                            <Columns>
                                                <dx:GridViewCommandColumn Visible="False" VisibleIndex="0">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="10" Width="11.11%" Visible="false">
                                                    <Settings FilterMode="DisplayText" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Machine" VisibleIndex="1" Width="11.11%">
                                                    <Settings FilterMode="DisplayText" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="CutCode" VisibleIndex="2" Width="11.11%">
                                                    <Settings FilterMode="DisplayText" AllowAutoFilter="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Required" VisibleIndex="3" Width="11.11%">
                                                    <Settings FilterMode="DisplayText" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Qty" VisibleIndex="4" Width="11.11%">
                                                    <Settings FilterMode="DisplayText" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="RequestDate" VisibleIndex="5" Width="11.11%">
                                                    <PropertiesDateEdit DisplayFormatString="M/d/yyyy HH:mm:ss" EditFormat="DateTime">
                                                    </PropertiesDateEdit>
                                                    <Settings FilterMode="DisplayText" />
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="RequestUser" VisibleIndex="6" Width="11.11%">
                                                    <Settings FilterMode="DisplayText" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="SendDate" VisibleIndex="7" Width="11.11%">
                                                    <PropertiesDateEdit DisplayFormatString="M/d/yyyy HH:mm:ss" EditFormat="DateTime">
                                                    </PropertiesDateEdit>
                                                    <Settings FilterMode="DisplayText" />
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="SendUser" VisibleIndex="8" Width="11.11%">
                                                    <Settings FilterMode="DisplayText" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Comment WhareHouse" FieldName="ComentarioBodega" ShowInCustomizationForm="True" VisibleIndex="9" Width="11.11%">
                                                    <Settings FilterMode="DisplayText" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxCallbackPanel>
                            <asp:SqlDataSource ID="SqlDataSourceMaterial_Required" runat="server" ConnectionString="<%$ ConnectionStrings:HEDSConnectionString2 %>" SelectCommand="Select Id,Machine,CutCode,Required=Product,Qty,RequestDate,RequestUser,SendDate,SendUser,ProductSend,ComentarioBodega=Coment_wharehouse
from Prod.Material_Requirement_Komax
where CAST(RequestDate as date)=CAST(GETDATE() as date)
order by RequestDate desc"></asp:SqlDataSource>
                                </div>
                        </td>
                    </tr>
                </table>
                <br />
                <br />

                <%-- Esta es otra tabla--%>
                <table class="auto-style22">
                    <tr>
                        <td>
                            <span class="auto-style23"><strong>Trokel: </strong></span>
                            <asp:TextBox ID="txtTrokel" runat="server" AutoPostBack="True" OnTextChanged="txtTrokel_TextChanged" placeholder="Trokel..."></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Trokel's in Machine"></asp:Label>
                            <dx:ASPxGridView ID="ASPxGridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" KeyFieldName="id" Width="415px" Theme="SoftOrange">
                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                <SettingsPopup>
                                    <FilterControl AutoUpdatePosition="False">
                                    </FilterControl>
                                </SettingsPopup>
                                <SettingsSearchPanel Visible="True" />
                                <Columns>
                                    <dx:GridViewCommandColumn VisibleIndex="0">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="id" LoadReadOnlyValueFromDataModel="True" ReadOnly="True" Visible="False" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="# Employee" FieldName="CodEmployee" LoadReadOnlyValueFromDataModel="True" ReadOnly="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Machine" FieldName="Machine" LoadReadOnlyValueFromDataModel="True" ReadOnly="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Shift" LoadReadOnlyValueFromDataModel="True" Visible="False" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Trokel" FieldName="Trokel" LoadReadOnlyValueFromDataModel="True" ReadOnly="True" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HEDSConnectionString2 %>" SelectCommand="Select * 
from Prod.Tokel_in_Machine 
where Machine=@Machinne 
	and Shift =case when CONVERT(VARCHAR(5),getdate(),108)&gt;='06:00:00.000' and CONVERT(VARCHAR(5),getdate(),108)&lt;='14:47:59.000' then 1
					when CONVERT(VARCHAR(5),getdate(),108)&gt;='14:48:00.000' and CONVERT(VARCHAR(5),getdate(),108)&lt;='23:14:59.000' then 2 else 3 end
and Status=1 and CAST(RegisterDate as date)&gt;=case when Shift=3 then CAST(GETDATE()-1 as date) else CAST(GETDATE() as date) end ">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="HiddenField3" Name="Machinne" PropertyName="Value" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            <%--<asp:Label ID="Label9" runat="server" Text="Trokel's in Machine"></asp:Label>--%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div style="padding:40px; align-content:center;">
                            <h2>Log Trokel</h2>
                            <dx:ASPxGridView ID="ASPxGridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Theme="SoftOrange" Width="415px">
                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                <SettingsPopup>
                                    <FilterControl AutoUpdatePosition="False">
                                    </FilterControl>
                                </SettingsPopup>
                                <SettingsSearchPanel Visible="True" />
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Machine" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CodEmployee" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Shift" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Trokeles" ReadOnly="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HEDSConnectionString2 %>" SelectCommand="
Select * 
From (
Select	distinct TM.Machine,TM.CodEmployee,TM.Shift,
				 Trokeles=STUFF((Select  ',' + CAST(Trokel  AS varchar(10))
								 from Prod.Tokel_in_Machine T
								 where T.Shift =case when CONVERT(VARCHAR(5),getdate(),108)&gt;='06:00:00.000' and CONVERT(VARCHAR(5),getdate(),108)&lt;='14:47:59.000' then 1
				 						             when CONVERT(VARCHAR(5),getdate(),108)&gt;='14:48:00.000' and CONVERT(VARCHAR(5),getdate(),108)&lt;='23:14:59.000' then 2 else 3 end
								 and CAST(RegisterDate as date)&gt;=case when Shift=3 then CAST(GETDATE()-1 as date) else CAST(GETDATE() as date) end
								 and T.Status=1 and T.Machine=TM.Machine
				 FOR XML PATH(''), TYPE).value('.[1]', 'nvarchar(4000)'), 1, 1, '')
from Prod.Tokel_in_Machine TM
where TM.Shift =case when CONVERT(VARCHAR(5),getdate(),108)&gt;='06:00:00.000' and CONVERT(VARCHAR(5),getdate(),108)&lt;='14:47:59.000' then 1
					 when CONVERT(VARCHAR(5),getdate(),108)&gt;='14:48:00.000' and CONVERT(VARCHAR(5),getdate(),108)&lt;='23:14:59.000' then 2 else 3 end
and CAST(RegisterDate as date)&gt;=case when Shift=3 then CAST(GETDATE()-1 as date) else CAST(GETDATE() as date) end
and TM.Status=1
group by TM.Machine,TM.CodEmployee,TM.Shift) dt
order by SUBSTRING(dt.Machine,6,2)"></asp:SqlDataSource>
                        </div>
                                </td>                      
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">
                <table style="width:100%;">
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="ASPxGridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" Width="509px" Theme="SoftOrange">
                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                <SettingsPopup>
                                    <FilterControl AutoUpdatePosition="False">
                                    </FilterControl>
                                </SettingsPopup>
                                <SettingsSearchPanel Visible="True" />
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Machine" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CodEmployee" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Shift" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Trokeles" ReadOnly="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:HEDSConnectionString2 %>" SelectCommand="SELECT * 
FROM (
    SELECT DISTINCT 
        TM.Machine,
        TM.CodEmployee,
        TM.Shift,
        Trokeles = STUFF((SELECT ',' + CAST(Trokel AS varchar(10))
                         FROM Prod.Tokel_in_Machine T
                         WHERE T.Shift = 
                                CASE 
                                    WHEN CONVERT(VARCHAR(5), GETDATE(), 108) >= '06:00:00.000' AND CONVERT(VARCHAR(5), GETDATE(), 108) <= '14:47:59.000' THEN 1
                                    WHEN CONVERT(VARCHAR(5), GETDATE(), 108) >= '14:48:00.000' AND CONVERT(VARCHAR(5), GETDATE(), 108) <= '23:14:59.000' THEN 2
                                    ELSE 3
                                END
                         AND CAST(RegisterDate AS date) >= 
                                CASE 
                                    WHEN Shift = 3 THEN CAST(GETDATE() - 1 AS date) 
                                    ELSE CAST(GETDATE() AS date) 
                                END
                         AND T.Status = 1 AND T.Machine = TM.Machine
                         FOR XML PATH(''), TYPE).value('.[1]', 'nvarchar(4000)'), 1, 1, '') 
    FROM 
        Prod.Tokel_in_Machine TM
    WHERE 
        TM.Shift = 
            CASE 
                WHEN CONVERT(VARCHAR(5), GETDATE(), 108) >= '06:00:00.000' AND CONVERT(VARCHAR(5), GETDATE(), 108) <= '14:47:59.000' THEN 1
                WHEN CONVERT(VARCHAR(5), GETDATE(), 108) >= '14:48:00.000' AND CONVERT(VARCHAR(5), GETDATE(), 108) <= '23:14:59.000' THEN 2
                ELSE 3
            END
        AND CAST(RegisterDate AS date) >= 
            CASE 
                WHEN Shift = 3 THEN CAST(GETDATE() - 1 AS date) 
                ELSE CAST(GETDATE() AS date) 
            END
        AND TM.Status = 1
    GROUP BY 
        TM.Machine, TM.CodEmployee, TM.Shift
) dt
ORDER BY 
    SUBSTRING(dt.Machine, 6, 2);"></asp:SqlDataSource>
            </asp:Panel>
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="200px" ClientInstanceName="CallbackPanel">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"  EnableTheming="True" Theme="SoftOrange" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnHtmlRowPrepared="ASPxGridView1_HtmlRowPrepared">
                            <Settings ShowFilterRow="True" ShowFooter="True" />
                            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" AllowEdit="False" />
                            <SettingsPopup>
                                <HeaderFilter MinHeight="140px"></HeaderFilter>
<FilterControl AutoUpdatePosition="False"></FilterControl>
                            </SettingsPopup>
                            <SettingsSearchPanel Visible="True" />
                            <SettingsPager Position="TopAndBottom" PageSize="50">
                                <PageSizeItemSettings Items="50, 100, 150" />
                            </SettingsPager>
                            <Columns>
                                <dx:GridViewDataTextColumn ReadOnly="true" FieldName="ID" VisibleIndex="0" ShowInCustomizationForm="True">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Bahia" VisibleIndex="1" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="CutCode" VisibleIndex="2" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="SetCode" VisibleIndex="3" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Relation" VisibleIndex="4" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Locacion" VisibleIndex="5" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Maquina" VisibleIndex="6" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Tml1" ReadOnly="true" VisibleIndex="7" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Seal1" ReadOnly="true" VisibleIndex="8" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Tml2" ReadOnly="true" VisibleIndex="9" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Seal2" ReadOnly="true" VisibleIndex="10" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Cable" ReadOnly="true" VisibleIndex="11" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Calibre" VisibleIndex="12" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Color" VisibleIndex="13" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Length" VisibleIndex="14" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="15" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="DOH" VisibleIndex="16" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Cortar" VisibleIndex="17" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Cut?" VisibleIndex="18" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Result" VisibleIndex="19" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Release" VisibleIndex="20" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Diferencia" VisibleIndex="21" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="InvTotal" ShowInCustomizationForm="True" VisibleIndex="22">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="StatusMaterial" ShowInCustomizationForm="True" VisibleIndex="23">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="OrderMaquina" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="24">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <TotalSummary>
                                <dx:ASPxSummaryItem FieldName="DOH" SummaryType="Count" />
                                <dx:ASPxSummaryItem FieldName="Cortar" SummaryType="Sum" />
                            </TotalSummary>
                            <FormatConditions>
                                <dx:GridViewFormatConditionHighlight FieldName="DOH" Expression="[DOH] = 0" Format="Custom">
                                    <CellStyle BackColor="Red">
                                    </CellStyle>
                                </dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="Iif([StatusMaterial] &lt;&gt; '' And [Tml1] = [StatusMaterial], [Tml1] = [StatusMaterial], 0)" FieldName="Tml1" Format="Custom">
                                    <CellStyle BackColor="LightBlue">
                                    </CellStyle>
                                </dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="Iif([StatusMaterial] &lt;&gt; '' And [Tml2] = [StatusMaterial], [Tml2] = [StatusMaterial], [StatusMaterial])" FieldName="Tml2" Format="Custom">
                                    <CellStyle BackColor="LightBlue">
                                    </CellStyle>
                                </dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[Seal1] = [StatusMaterial]" FieldName="Seal1" Format="Custom">
                                    <CellStyle BackColor="LightGreen">
                                    </CellStyle>
                                </dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[Seal2] = [StatusMaterial]" FieldName="Seal2" Format="Custom">
                                    <CellStyle BackColor="LightGreen">
                                    </CellStyle>
                                </dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[Cable] = [StatusMaterial]" FieldName="Cable" Format="Custom">
                                    <CellStyle BackColor="#FFFF66">
                                    </CellStyle>
                                </dx:GridViewFormatConditionHighlight>
                            </FormatConditions>
                        </dx:ASPxGridView>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HEDS_VM_POM(VW_POM) %>"
                SelectCommand="SELECT ID, Bahia, CutCode, SetCode, Relation, Locacion, Maquina, Tml1, Seal1, Tml2, Seal2, Cable, Calibre, Color, Length, Status, DOH, Cortar, [Cut?], 
Result, Release, Diferencia, InvTotal, StatusMaterial, OrderMaquina 
FROM (
    SELECT DISTINCT 
        P.ID, 
        U.Bahia, 
        P.CutCode, 
        P.SetCode, 
        P.Relation, 
        P.Location AS Locacion, 
        P.Machine AS Maquina, 
        ISNULL(P.Tml1, '') AS Tml1, 
        ISNULL(P.Seal1, '') AS Seal1, 
        ISNULL(P.Tml2, '') AS Tml2, 
        ISNULL(P.Seal2, '') AS Seal2, 
        ISNULL(P.Wire, '') AS Cable, 
        P.SQ AS Calibre, 
        P.Color, 
        P.LengthCode AS Length, 
        P.Status1 AS Status, 
        P.DOH, 
        P.Cortar, 
        P.Cut_Plan AS [Cut?], 
        P.Result, 
        P.Release, 
        P.Diferencia, 
        P.InvTotal, 
        MRK.ProductSend AS StatusMaterial, 
        SUBSTRING(P.Machine, 6, 2) AS OrderMaquina 
    FROM 
        Prod.PlanProduccion AS P 
    INNER JOIN 
        Prod.UPH AS U ON LTRIM(RTRIM(P.Machine)) = LTRIM(RTRIM(U.Maquina)) 
    LEFT OUTER JOIN 
        Prod.Material_Requirement_Komax AS MRK ON MRK.CutCode = P.CutCode 
    WHERE 
        (LTRIM(RTRIM(U.IPMachine)) = @IP) 
        AND (P.DOH <= 5) 
        AND (P.Area = 'Plan de Corte')
) AS x 
ORDER BY 
    OrderMaquina;" ProviderName="<%$ ConnectionStrings:HEDS_VM_POM(VW_POM).ProviderName %>">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HiddenField1" Name="IP" PropertyName="Value" DefaultValue="" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
<script type="text/javascript">
    var postponedCallbackRequired = false;
    function UpDateGridChanged(s, e) {
        if (CallbackPanel.InCallback())
            postponedCallbackRequired = true;
        else
            CallbackPanel.PerformCallback();
    }
    function OnEndCallback(s, e) {
        if (postponedCallbackRequired) {
            CallbackPanel.PerformCallback();
            postponedCallbackRequired = false;
        }
    }
    function OnCellClick(cell, value) {
        cell.style.backgroundColor = "red";
        console.log(value);
    }
    function ShowEditPopup(element, FieldName, ticketId, isMultipleSelected) {
        popup1.ShowAtElement(eval(element));
    }
    function OnClick(s, e) {

        popup1.Show();
    }
    var postponedCallbackRequired = false;
    function UpDateGridChanged(s, e) {
        if (CallbackPanel.InCallback())
            postponedCallbackRequired = true;
        else
            CallbackPanel.PerformCallback();
    }
    function OnEndCallback(s, e) {
        if (postponedCallbackRequired) {
            CallbackPanel.PerformCallback();
            postponedCallbackRequired = false;
        }
    }
</script>
</html>
