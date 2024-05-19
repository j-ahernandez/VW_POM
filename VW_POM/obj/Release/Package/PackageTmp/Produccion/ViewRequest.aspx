<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRequest.aspx.cs" Inherits="VW_POM.Produccion.ViewRequest" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html>
<style type="text/css">
    .auto-style1 {
        height: 26px;
    }

    .auto-style2 {
        height: 26px;
        width: 166px;
    }

    .auto-style3 {
        width: 166px;
    }

    .auto-style4 {
        width: 71%;
    }

    .auto-style7 {
        height: 26px;
        width: 117px;
    }

    .auto-style8 {
        width: 117px;
    }

    .auto-style10 {
        height: 26px;
        width: 177px;
    }
    .auto-style11 {
        width: 177px;
    }
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Request for Materials"></asp:Label>
        <div></div>
        <table class="auto-style4">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Scann Employee ID"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label5" runat="server" Text="Machine Code"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="maquina" DataValueField="maquina" Width="164px" TabIndex="1">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HEDSConnectionString %>" SelectCommand="Select maquina
from prod.uph
order by SUBSTRING(maquina,CHARINDEX('-',maquina,0)+1,2)"></asp:SqlDataSource>
                </td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label3" runat="server" Text="Part Number"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Parte" DataValueField="Parte" Width="177px" TabIndex="2">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HEDSConnectionString %>" SelectCommand="Select Parte='Seleccione'
union all
Select distinct Parte=kicpnoBOm from [192.168.155.13].himes_heds.[dbo].[TMES_MATERIALMASTER]"></asp:SqlDataSource>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="Label4" runat="server" Text="Qty Product"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="TextBox2" runat="server" TabIndex="3" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                </td>
                <td>
                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Submit" Theme="iOS" TabIndex="4">
                    </dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="N_Pedido" Theme="Glass" Width="1230px">
                        <Settings ShowGroupPanel="True" />
                        <SettingsBehavior AutoExpandAllGroups="True" />
                        <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
                        <SettingsPopup>
                            <HeaderFilter MinHeight="140px"></HeaderFilter>
                        </SettingsPopup>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="N_Pedido" GroupIndex="0" ReadOnly="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="0" Caption="Order Number">
                                <Settings AllowGroup="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Maquina" VisibleIndex="1" Caption="Machine">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Parte" VisibleIndex="2" Caption="Part Number">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="3" Caption="Quantity">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="Fecha_solicita" VisibleIndex="4" Caption="Resquest Date">
                            </dx:GridViewDataDateColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HEDSConnectionString %>" SelectCommand="Select PH.N_Pedido,PH.Maquina,PD.Parte,PD.Cantidad,PD.Fecha_solicita
from prod.Pedidos_H PH
	join Prod.Pedidos_D PD
		on PH.N_Pedido=PD.NPedido_H
where PH.Operador=@Operador
	and Pd.Status=0">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox1" Name="Operador" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
