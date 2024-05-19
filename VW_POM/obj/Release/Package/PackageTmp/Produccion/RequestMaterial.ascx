<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RequestMaterial.ascx.cs" Inherits="VW_POM.Produccion.RequestMaterial" %>
<%@ Register assembly="DevExpress.Web.v22.2, Version=22.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<style type="text/css">
    .auto-style1 {
        height: 26px;
    }
    .auto-style2 {
        height: 26px;
        width: 236px;
    }
    .auto-style3 {
        width: 236px;
    }
    .auto-style4 {
        width: 71%;
    }
    .auto-style5 {
        height: 26px;
        width: 281px;
    }
    .auto-style7 {
        height: 26px;
        width: 117px;
    }
    .auto-style8 {
        width: 117px;
    }
    .auto-style9 {
        width: 281px;
    }
</style>
<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Request for Materials"></asp:Label>
<div></div>
<table class="auto-style4">
    <tr>
        <td class="auto-style2">
            <asp:Label ID="Label2" runat="server" Text="Scann Employee ID"></asp:Label>
        </td>
        <td class="auto-style5">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td class="auto-style7">
            <asp:Label ID="Label5" runat="server" Text="Machine Code"></asp:Label>
        </td>
        <td class="auto-style1">
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="maquina" DataValueField="maquina" Width="164px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HEDSConnectionString %>" SelectCommand="Select maquina
from prod.uph
order by SUBSTRING(maquina,CHARINDEX('-',maquina,0)+1,2)"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">
            <asp:Label ID="Label3" runat="server" Text="Part Number"></asp:Label>
        </td>
        <td class="auto-style9">
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Parte" DataValueField="Parte" Width="177px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HEDSConnectionString %>" SelectCommand="Select Parte='Seleccione'
union all
Select distinct Parte=kicpnoBOm from [192.168.155.13].himes_heds.[dbo].[TMES_MATERIALMASTER]"></asp:SqlDataSource>
        </td>
        <td class="auto-style8">
            <asp:Label ID="Label4" runat="server" Text="Qty Product"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="N_Pedido">
                <Settings ShowGroupPanel="True" />
                <SettingsBehavior AutoExpandAllGroups="True" />
                <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
<SettingsPopup>
<HeaderFilter MinHeight="140px"></HeaderFilter>
</SettingsPopup>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="N_Pedido" GroupIndex="0" ReadOnly="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="0">
                        <Settings AllowGroup="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Maquina" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Parte" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="Fecha_solicita" VisibleIndex="3">
                    </dx:GridViewDataDateColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HEDSConnectionString %>" SelectCommand="Select PH.N_Pedido,PH.Maquina,PD.Parte,PD.Fecha_solicita
from prod.Pedidos_H PH
	join Prod.Pedidos_D PD
		on PH.N_Pedido=PD.NPedido_H
where PH.Operador=@Operador
	and PH.Status=0">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Operador" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>

