<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ICT713_Lab3_LoganFidler.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddlTechnicians" runat="server" AutoPostBack="True" DataSourceID="TechnicianDataSource" DataTextField="Name" DataValueField="TechID"></asp:DropDownList>
            <asp:ObjectDataSource ID="TechnicianDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetTechnicians" TypeName="ICT713_Lab3_LoganFidler.App_Code.TechnicianDB"></asp:ObjectDataSource>
        </div>
        <asp:GridView ID="gvIncidents" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="IncidentDataSource" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:ObjectDataSource ID="IncidentDataSource" runat="server" 
            ConflictDetection="CompareAllValues" 
            OldValuesParameterFormatString="original_{0}" 
            TypeName="ICT713_Lab3_LoganFidler.App_Code.IncidentDB"
            SelectMethod="GetTechIncidents" 
            UpdateMethod="UpdateIncident">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlTechnicians" Name="TechID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="original_Incident" Type="Object" />
                <asp:Parameter Name="incident" Type="Object" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
